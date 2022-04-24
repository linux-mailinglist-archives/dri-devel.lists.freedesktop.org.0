Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A37D50D0B3
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 11:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2629010F122;
	Sun, 24 Apr 2022 09:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2128.outbound.protection.outlook.com [40.107.215.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554B110F122;
 Sun, 24 Apr 2022 09:07:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHt1YLmoTTmmbd+vuwiw9LBlKEAZdy4smoyH9ILv6TKBDGmQJ00NiNxvCkGT12zJNbs60juUVdMbR93cmA2YfqzFvR9iU949W5PlK8ucfCKZDWiCACAngbJO2RUpZZ50wiaFKRwrqeyvOPv8uupV7u1Rmt2rMNBpvKwRCdNq3E0b+MkOwxifUQFCPurrca7dHEnJGp5tZQ9ZaBcqXysPHpXl5qPvA3p+D7eNSy+DbBW4sZFz63XQgWa2yInMJPVWruVkXsV7+MUHVN66+fpJjGR6AsiWeow+yblq6NcbUTLaVF8zXeogBuAesvb0gbaGIs3qvGwpeTGTSIWhAMgrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNHJ1e2JIegEggNVKEt33Z/nktC6f90YwxNlF/t5cfQ=;
 b=l6sxQxseyrzmjUpWQAkOcqs8b7TgVAnb7RNyu/Iku5d7ay25XjDxeX5ks+BnbzLRNzPrLZWxX/+6/py5ViApNP2TExN/j683nXiahTmlsTblqbGh3HmYkm7iAwiR4qPVbykIl0OB4olZdvl3Imp/680gVDjwZMyoVNgaato7QlcIqbjEAMLiBrNQAVmg3uqhLWAJfYw+4JWjM2rceH1lEHwIj/hByhHgb6mcw8jjbNnz2+tTfwvX91u224+jxiHaUFzdWK4mPOdd9/fI29PAa3/LsmMrpkMtdOJhwQLlHxZB2UeFcyhRUKM8UORmRbN7hZk4QZcBA4nZPIa6JUV3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNHJ1e2JIegEggNVKEt33Z/nktC6f90YwxNlF/t5cfQ=;
 b=C6NvKVEJBzV5+8egvXIcKg760pNa6r6JlSdpjQOLseJ80GMWTGOanqN7NUuBjIUyd7SF2L4rgDE9Ejao0XiUkGQrUv/uet8sqcRwcpZ+wy5gDdWiglu81rjciPzdbCXpE+bD/jm146Kq2uNUMb5H2Tcg29THjmazPQrFRwGoN8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by SI2PR06MB5067.apcprd06.prod.outlook.com (2603:1096:4:1a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Sun, 24 Apr
 2022 09:07:02 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08%7]) with mapi id 15.20.5186.020; Sun, 24 Apr 2022
 09:07:02 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Charlene Liu <charlene.liu@amd.com>,
 Jun Lei <jun.lei@amd.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 Zhan Liu <zhan.liu@amd.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/amd/display: fix if == else warning
Date: Sun, 24 Apr 2022 17:06:23 +0800
Message-Id: <20220424090640.1865-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::33) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f5bb0ea-d468-4a77-eb07-08da25d1cbbe
X-MS-TrafficTypeDiagnostic: SI2PR06MB5067:EE_
X-Microsoft-Antispam-PRVS: <SI2PR06MB50676DC2EC9F59848E979956C7F99@SI2PR06MB5067.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EjSrVGt3O4XLpU6+Fd3UiY5pULuABGb7lKA6E3oxxDhkpXMIyE4N9mk4NCozyUGjhPMg6wfXu2OmURBJjlpIKDWbqp2X0adaZYVgjuAi8ykU7pijYf0dkhNNx5bFBvKfcuu68/GxYbFOZE2spsasp9WTkavDAnNcrWzmUzMrxyUsEk75BNX3s4eN05u1hjK4pnNb0nXIuqoxMgd2eP4a3snR2EQmug/MRVBwR4+hf6G/uo5ALq5gXE3eNlHZY31u2TC7icgUIDZtU+JmOEDPQ7owXR7XVjfEjZOt9iJZKx2L8kW+lNzpVa96vv/SZoXDGCW6tfsbbAYxI7rfkRZ3UXHhsrSjaR21MwP1FmyYRY3U23xYC6g++0mD3FRVvrdF2dCAco8Jz7CX8DrQLNMw7mLCDbTCpVwQZiHlr0z76aNox4+VDjnxRKLCw9xn75cS5OKdqTXw8JGqV8R+Vm1EkoOk5TeXAQsXRCWV6ik/KUbQibwYRs1z5+98iSzM8QQeyc4CTJxtnPkeG+v0D1WoBAWuEqQokn1IjJJWuvwF/xOURUIj84UWeQ/2xjsLOTzAgxGCmiJ/i2sFVLpskClIUOoUnL1RxtBNbxSmz+Y0gF82C36PM/P1JIq/meRB323jzZD1/fSxhasu2QS8H7rbpfM+9e66CjafejDM8Q/rognVfhgBfhFXMZmbPX8NRR4fnuuM1tJF5e9f20r0C7damgP6t9olYg+CTbUWYJxmAQA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(7416002)(5660300002)(26005)(110136005)(6506007)(6512007)(8936002)(38350700002)(66476007)(8676002)(66946007)(66556008)(4326008)(4744005)(2906002)(6486002)(6666004)(38100700002)(316002)(52116002)(921005)(186003)(2616005)(1076003)(508600001)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MzNsjbyozgcjbPn3vIv6rvVUEpJpeRosNyc3NfRRc5S3Jkz7FwxaIXWmS+Cr?=
 =?us-ascii?Q?4yGnN+TEKRsupdJ6WPgrBkqzeQS8QeJ0LEnoYqSC1nyeFI5kCtht4Ves5eEf?=
 =?us-ascii?Q?HKPxpgSld4l66JSR90nXVh21wmUtduB36RpLDFsVsOPsxE7X0VbyTyPk3XRY?=
 =?us-ascii?Q?+CUcN7s+wJp0V3/5VIgz8OHYLbGti4WQkKSaS12I97tWQKbs7STFAvgC7yex?=
 =?us-ascii?Q?koYl3cYyO51AoI566wfjjC8T2G4bqCSx19tT30O/8ozfG4ZcozFp2/FuHYsb?=
 =?us-ascii?Q?eZ24FopSVe0vAplWjzgi4PiucHDjQ5A1rNrOu0zq/WYRbY9tPJvgI6YU3ov9?=
 =?us-ascii?Q?O2D4+ZtuAbSYehgGJOIQkstoGfA+ZIAEhkJfJC5KiNfMsL3ZJb/hUDBCYwU9?=
 =?us-ascii?Q?Wc9V2cot+C3Bp8dTHW946npSmymsuq/IbNOJvitqjchz13PJnKw9TiUJ0q8t?=
 =?us-ascii?Q?LZHcsHJY2J64pFprOJC3Os6D1MUXIlib4n3AO9aHVaUZ3ptgfk6Mxm2CCZsp?=
 =?us-ascii?Q?iyTMnSc2ab2h2cQuP8tUYnAkWBLfp4pc/aA4fIenSXDQ48Ugf/eYSV47i2En?=
 =?us-ascii?Q?7m/VbBpHsO6+5pwjmNom9138VSfUzezuraWm74uIIRREe8IfyK33v1cp8/PA?=
 =?us-ascii?Q?vUrL6JzHCxqeglgwKZn7/1g4jWQbUsKbSMztaR046dktKQKnznz10bzbL25s?=
 =?us-ascii?Q?5H11mEuJwTFWV+ly5qMtF2iHrmcXrMrfCEdAkHfgDRy0ZxQ3Zz7pBo/ZB8+w?=
 =?us-ascii?Q?GM2reHbf+WdLW30HbsHiNiBeqgh3G9PBhqJeBaIdB52SMLTIBWfQcWy3Q66E?=
 =?us-ascii?Q?JCyzBq9d7OKTkimmEznz1L+aI1+Vk9WQ9G8MIbT8TIPPd3zwPv7OIW5BoKR5?=
 =?us-ascii?Q?sIOI5B63z2xE6XHVJhCoWXxCpGSZiC7ev3vvIdHivuJl2qdgP+4kUSg6Iw2u?=
 =?us-ascii?Q?n0m/4vWS4DBMP397x/IUysdR7katYeSSUdZH1Cw58DiVtGuVCMX1gVOO8WIX?=
 =?us-ascii?Q?ArsHGX3bfq+gAo4SqJ6psRNMdMalMgIeGMOglFvE0HkrBdvtix2HDKZGtSyq?=
 =?us-ascii?Q?XdNYE3aJME+fETCDF1ejz4ouiMObdxhUzzDQNmzgOOXqsshcw5qUX1YvvJG7?=
 =?us-ascii?Q?GR1oJAIzti/tZNWc/S+KKnLW1YLLOkPetxs9eTxF4SZNdA0sFkXPZASvMStW?=
 =?us-ascii?Q?nD4js5UbjjIhJM2JpBwUOC43k/KcLQuz/XpPRLLS2/VNLNpmEHzTX6P/qadI?=
 =?us-ascii?Q?TEtdrjuCopsZ+n5IChfTmSSal1DnY6fZdb2A24P07tvKMXq6wGThHAxe86b2?=
 =?us-ascii?Q?hIuXlssTFKWsbw89i7HroqX/itg5X8KbM7T7yeGpMFSN7Jg5HYKvvzGqzsrs?=
 =?us-ascii?Q?YH2PkLFBjdgwe7hYhrYJbEZUcaufk9M2YqIvu1FNxjnlGktlJoFiArlv3lNr?=
 =?us-ascii?Q?GPsMhBAzy8J7rElLgqA8wesd8IBUO/Cr5Jaj3fbQJscHVTk+NoWPAppNN138?=
 =?us-ascii?Q?xC82jD6APtnvPQ6LQiYkMl/EgfiBLo+iGOfW3svd055nwIJbvDaoFObi1/k2?=
 =?us-ascii?Q?yDvzt+fGGOEykr5eFlJXqiKgsB2umaJm7Y4Sa2tSnJue5hIwTvLFnNG+EE7i?=
 =?us-ascii?Q?NT4ELCmTPKwB+LyxJzEeb67GxTou+EX4/4S/7cO2dmSLdGk/tmLjXJMMVdOu?=
 =?us-ascii?Q?yAgIbc8Mn4g0JKmd102cqafpZdobzEqTS1MxmaLQ5b9w4LKVjcLhs5jExpje?=
 =?us-ascii?Q?+aJ93mWbwA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5bb0ea-d468-4a77-eb07-08da25d1cbbe
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2022 09:07:02.4900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vu6CbGLE4bPEEvP7KXm3kmkKApJbOsUjGYwUWJK5JPxhYhzw9G4ojCkQOLB/8uLwsZtDVodENc82Nlb5enfDjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5067
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
Cc: zhengkui_guo@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:

drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c:98:8-10:
WARNING: possible condition with no effect (if == else)

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
index fe22530242d2..05b3fba9ccce 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
@@ -95,8 +95,6 @@ static void gpu_addr_to_uma(struct dce_hwseq *hwseq,
 	} else if (hwseq->fb_offset.quad_part <= addr->quad_part &&
 			addr->quad_part <= hwseq->uma_top.quad_part) {
 		is_in_uma = true;
-	} else if (addr->quad_part == 0) {
-		is_in_uma = false;
 	} else {
 		is_in_uma = false;
 	}
-- 
2.20.1

