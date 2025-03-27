Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2371DA731F7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 13:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7086C10E8AE;
	Thu, 27 Mar 2025 12:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="fSEq7g/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2138.outbound.protection.outlook.com [40.107.237.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C03D10E8AE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 12:07:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijFFXH7Y5NuJU7Y33c4+27g3exSmwS9DwioYb6yWy1if2W1bQ2hA+dqGHEvOVSSOA0rXX1BknRadMtBw0/h5hNi1qoEpyqReSLRO15h3MsMaWtjJtsdAtLuU5eQFPraQ0OgY/ecrRNIiwfC/hgQilTmOqrhtnn4SN55TS0Eos7DhFaZDByJMV+pHP7L5HNckRuH/IY8nwaUXyIcKUrT4pq/3I/tfsRgGRmmOCjO9eshL+gAqh6WwxwB4LtXoJYcKELFi4hC1bSanWJCoFKm2zTKN+fqYm1bsTuQHMKnC1y6yd2h7ue3K9vvh+A1O2pjwLufVWHWqUS0xIpGKjOV0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ybiXzZqGDeUZzxCExM0aZk01aNc2oqpz0pAR+6Of2s=;
 b=yS895UzwCbscDuEcoJDpV7vtbZGMgoowj5rvF1AgjHpxR5zPhKj5j0pu+6T2TYESuteKsanotdOgMtHLOzM33babLt4AfMx04pAcg3CJFlewrxB5K6tCRm1RmePtVahNcL9O32BmRrVbbcCyIU/j20mD889MQnw846uKU8/VtC7PwutUCnGyY0+MHwGmDnhGXfjIUcyU/k+iEYHANby7VJPstFcv99pfzRrGEKsuRUm0NvM7jsd1Ez8M8c5y3+2nkn/v7YoMZlAzXxMMT+M4Gii/Iy8QAO6Cnz9TwVWNac7jXDRM4RQEyR78ZpQBzG5+I67FESDJbUHJKVfB8AGK3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ybiXzZqGDeUZzxCExM0aZk01aNc2oqpz0pAR+6Of2s=;
 b=fSEq7g/sfGK+RBvLyoa8/62VyLiaAYsgTWMykzjkqKIiJTzhXQiigT2WEped2DVdoNwb5Z68000/89hNjVmZCP/1YAwJHet8dnttC5b55UITb8Z6p/xHjWwCUyXmXe/+wqDgfnQNuJhBLbxdX9rnSsfvyGdSbJQ/lhOZrdExDo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SA0PR04MB7467.namprd04.prod.outlook.com (2603:10b6:806:e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 12:07:37 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 12:07:37 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, treapking@chromium.org,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: anx7625: Fix not display after S4/S5 resume back
Date: Thu, 27 Mar 2025 20:05:58 +0800
Message-Id: <20250327120558.1272081-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|SA0PR04MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f41e420-91d4-4911-904c-08dd6d27f6cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3FnDMi+s9aH3OSS94FROlgVBSIRxylzEKYJO4ypr8r2w3D2nhGM4QS8EW3I1?=
 =?us-ascii?Q?AmqAK7YVW8XmfPSHAv4V8/mqGXn23a9W5KfE9wshDUOKUJVxmrx+lYHm8O12?=
 =?us-ascii?Q?h4Xji8DULlwS2ds7PRUEE+Gy8nvyzpbOYqPyw8GdodmKP9d2BBtNnhrUgrXF?=
 =?us-ascii?Q?LNydMiYCz0E3NDWYmoFHgybhq71LV9j+7kyOUYgbsJ35AxyKjeTew1/HQPdN?=
 =?us-ascii?Q?2DRJO1/jzJVbBiWeAxV9pk7/o0dP4cJDIIHVrZvKPhcPnhbArWafJwmMwOZS?=
 =?us-ascii?Q?rhZWw2yX+nZS0cbk/9d87m5q4PnfuCZ3FQtdH9a8ZsggaM0aImUNRTabOwCJ?=
 =?us-ascii?Q?LWV/oQ5tMquxYZjSThoQLbgbQmLEx5/38N9uX2dlPf136vwJcRRcPxcyPY7u?=
 =?us-ascii?Q?435a9ZqM2/nztoRkrFkip45njflW94pmBbb6wDlOw4Wm2BB0HKnnf/3+eazA?=
 =?us-ascii?Q?4THQI8QDfhluxQjSzVn5fsSdTMxr8YIis4e2UL/wpn+p/XdfYv1loLP2E426?=
 =?us-ascii?Q?54wpfetzklYAvPzzfWfCBeqlqNEsHMN0rsilimp8+0VGerUIzD6iDDw1lf0G?=
 =?us-ascii?Q?8u6fyEXivT+JB76awr+KJuKzTmu1/71HN8X6Ujdxg6JjlQglcIRxTbgGF/cO?=
 =?us-ascii?Q?Dwcgg01HHx65znIhP4jPfngF06H1OLPTw2TAsLHekDi5Z71BwzF3FQterHxP?=
 =?us-ascii?Q?PPQHUXGDQj08KfoeXugRskaZBQ0aKpzOlNgc+kfLztR8fo4cz4uDnQt0gjTJ?=
 =?us-ascii?Q?YTBCt4eg0/Y5rhBS/m/yIhtRa8IhVWt2URImTohokH2hZn54oZmSQzkdCBRA?=
 =?us-ascii?Q?oKyJz+PlhHh6o13JVHHFV5qIVRw1xekAKadLvpUSTUIKYPuOZkTMa2Pnoksx?=
 =?us-ascii?Q?FSCxdbiMyFhU/Fsqs2maq+BBd5EuQkIBQNuDdFGD9l7h3JOha8i4MHdkNYkj?=
 =?us-ascii?Q?GIi+JWAUuEOCDPQN+BvBJG7H6tdxUmGIPa5GMc37YHeDUPjKlICKUZQar39j?=
 =?us-ascii?Q?MpUR9Z0NrhUPJOFu/9AFlxGfl9Or5UE7WLM24kPuvIuoAE9XhKUD9hPhfmRG?=
 =?us-ascii?Q?zr/CRTFW+rSViuyeE5vDuTb/bSPN5PiX6izMb+ckHqxy6uzgqqy2mpEXSK7z?=
 =?us-ascii?Q?GVSx5JaDxzb2CNq3PlPM9J4WHloyxYSCEryVnPLNwEuDuX0whEc/6gzDn1g0?=
 =?us-ascii?Q?oXUXDxHLCar2nNGpCZnFVR94RJoe3v2/XTFfDQNRNxCMV5UWh9Lt3yN2FUo2?=
 =?us-ascii?Q?97K9frPwiFEL78iSrU6gIU4cFJsl0lBmmNVWl5SRXcgGQs5YHcgtrXbkJ1R0?=
 =?us-ascii?Q?rGa6XVYrIP9+imfe8WLu5x1HhKFHqSh49Z+uUOokl4VYXwljOe2+G8KQ/hxD?=
 =?us-ascii?Q?IcJ0fIBeMpc4VOG8xAz4cVpBSW9YaDtUjkZDZuvm+5hWHp6Wvzx2uKFI5yOE?=
 =?us-ascii?Q?EgNzRih1rpsW5Jtz5sz9OwoJNprdaQ1FQFm07mx6cdghzRWE3pQ7KQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r7DlrAJARCYm1edcKB45eqhdCPEH81JqETEnbV0PX+4CPTo+eQgZPNDccJLD?=
 =?us-ascii?Q?zcG53+61PdYyzvfdXz/9Qa0KS6QsFFS1hS2pyd9yxkKgoLx+LKsVKRmEW0ap?=
 =?us-ascii?Q?T49iMq28SQVUOyrd90yVlszVhxLrSxcr/OsGkq06wnjMQcgIiodsAItjP4mg?=
 =?us-ascii?Q?PB7GO6FiTOdr9yU3dZJaijsvx0BkvQdvNApiJB4HVbjTBhI77yifB3HcWRFL?=
 =?us-ascii?Q?d4ScsMsXkgok1SdrwQJpXkW8J/NXr60W4QtrmoYKQXCkrJEXJriaRNslSluT?=
 =?us-ascii?Q?e2mCyT063qQZjqOfzHZjwp1VeOuiKDIiBoSzJBi8O+vbj6o+yJWYu4dSp7EF?=
 =?us-ascii?Q?Zl/5LG2zj6WyA+lZe8eHpc8rhx0W5dG3gnOAsXQ8WhOQ30chJEPUv06E3jym?=
 =?us-ascii?Q?cA9nlEtDy+jqXLYoczuDPrwfZw8LdgImSPGzH93aNI5lG74uXKnALczI3i4w?=
 =?us-ascii?Q?ZmDz6N4GcM1lUdEywmTo4RR3SjgnksNGR1ogbdbCPALq2MnZuByyasTPkCLF?=
 =?us-ascii?Q?hYJJFqtN9lR1LBMdvyP3XLCdvMrWzvl+gRMozWlIjMSEetbIE2LMyFhoK6F9?=
 =?us-ascii?Q?3iFHraE3qc3z1Kld5VoUxBqKSTpHxrkUtgIyrYVItHCcJVuTRRDibB0kxJzI?=
 =?us-ascii?Q?70Ix5wAyoGNBk8iljL/FUDCKebHr3AXa2qBUqmJDX262EKM4Br6HV5mRW65D?=
 =?us-ascii?Q?sMUWvWkV+wilqzH7Cfxuq+YKBs2GO2gkqjvuYMANQBQNeWbEtvRwwvFRIM3Z?=
 =?us-ascii?Q?58LAi0dFQDemEWVmp9Y6mk2ibTPJ1Sp1+hNhckm17IdvNEqLEy8NDrSP2/AA?=
 =?us-ascii?Q?9NJsh3v2xM5sMEr27Vrv22F+AcQFEOeem454cX4PR+FnOko6R1FqmjG8DLkd?=
 =?us-ascii?Q?bAhhEz5VE7A1nrmQxtkn0obdCLcvnsk4ZfuTh8gm+lFv3vBzrqyhYVTQJVAT?=
 =?us-ascii?Q?rQwa37uNb7BM3sRNRfWdKKbZcgYc6lAkcQ9oR9LEP9QpYBI+PhhtGzb5KFa8?=
 =?us-ascii?Q?4wo/quDfu+Q5oDWwqwPAHvU+xHw7shik6aVtTFY0QNncbilqcrvuKVO0/q8Z?=
 =?us-ascii?Q?hxk14ai2C7zFKcMTKjfB8j4gcruockxXuDtjOxCnokK80DQa5TY8I1ZSSKjL?=
 =?us-ascii?Q?J80nCk1OQ6k8W8GnPsToOe32QqY187tJV/QIROGIUUyb/ycbdyqHGbHLO+FW?=
 =?us-ascii?Q?8kwCC8FSfZsOW4dU8xnAKfbm9cV5XTTUu0MDU9v0je1mR3I70MhV2sk+xowR?=
 =?us-ascii?Q?hUZMZJ+4CB3FXXzqcb7MhvD+OcO9PZSyTcaGzlOOUQWsLkHDwNibV11aAhpH?=
 =?us-ascii?Q?7qPUPtIJN2wXaJeoTHVv9uN2kmPXW22H7/mtx9OO+LVEMjkO1SW/+63iDSf5?=
 =?us-ascii?Q?r77wtev+4Rd8LSiCMqQ0QOdEPYi/zfeRz4rew0X15ouXhVGXz4aZx/fJpmn8?=
 =?us-ascii?Q?OLeJKCeNOd3jTW7zKdJ9L919bKof54Fu58ITiSBEMqe9Z6WWIU0Nk31q6lQN?=
 =?us-ascii?Q?NZwBbMCYJOxF9+qla9UaDk5aP5fS5Rz405P9SkkDzvbncqMHfQ3D8cHOo9Pa?=
 =?us-ascii?Q?fl/b4gpuNlKcSM/J210/+pWuozfyEYo0iHEYLBUu?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f41e420-91d4-4911-904c-08dd6d27f6cf
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 12:07:37.0995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPNEsDuQkzk7GaPd2cyY7/GDJCi3Nbh9pgmHULGCNQT3I2EwZMQTaYyv5qSeS1rbntIfKADM5aaXpfnEJR7F3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR04MB7467
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If anx7625 interrupt cannot be processed intime, it will cause
race condition. This is the root cause of not display after S4/S5
resume back. The interrupt change status cleared by previously
interrupt action.

Eg: the first interrupt reported at time A, but interrupt postponed
to time B process, at this moment, received 2nd interrupt. It will
cause 1st interrupt clear operation clear 2nd interrupt status.

Remove clear interrupt change status to avoid interrupt change status
missed issue.

Note:
The interrupt change registers of anx7625 doesn't support write clear,
so we can't clear it after read. Otherwise there could be race
conditions between read and clear.

The implementation of the OCM (aka on-chip microprocessor) ensures that
only the first interrupt after power on can be triggered without HPD
change, so we can safely remove the register clear step but keeping
the HPD_STATUS_CHANGE check.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 0b61e77c0398..1afa65756bd2 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1585,14 +1585,6 @@ static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
 		return intr_vector;
 	}
 	DRM_DEV_DEBUG_DRIVER(dev, "0x7e:0x44=%x\n", intr_vector);
-	status = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
-				   INTERFACE_CHANGE_INT,
-				   intr_vector & (~intr_vector));
-	if (status < 0) {
-		DRM_DEV_ERROR(dev, "cannot clear interrupt change reg.\n");
-		return status;
-	}
-
 	if (!(intr_vector & HPD_STATUS_CHANGE))
 		return -ENOENT;
 
-- 
2.25.1

