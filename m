Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5886344FD4C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 03:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE052899E8;
	Mon, 15 Nov 2021 02:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2129.outbound.protection.outlook.com [40.107.215.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3463F899A5;
 Mon, 15 Nov 2021 02:59:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8DEfvBiTcp9mLUr6hL4j5REiSPxOWN/+WLseiQeuUkisdh/iHSUHA0tWBDJzAwpbqyAnZpfB2oxJQn/IxWmGT5jU3ws70VT3wayRF96hPlGpVlbHZzWalo/zMZQealP9O4DLs/M6vcL6q+fa1L7ygJQGsZt757qOFX1ZECOq4d6m0F0j8J9bzeIUuR/VNeIdhqMvL5INQcSpJRyAdrp3NI23VC4aZG+ilqasyS+YksUpbgjf47+Fmzc9M1t5eGEnlI4yZ1Le4Ig3pe0eR2HlEahDx+SyuApZ2tpCQzLLPDDB1IZ9K6bstcVjJWSnsD09U4HxS9HRlxa3dGgViZC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dkRKmHTyuGUijfe5dOG8G27tgwkg7/s+k9Y9wzs+Gs=;
 b=QnlfJ4OrfX+IY0ZVNIgSTg5vSWdXFahl5/JZ/Syv8vZecR5OeCBlX4BuCCmfcCnn0UsL+LqWt9UYOxEvHwF5Rv+XvDl+RJVVlCpeL6RKW2zhIhDapaEArvGi8WnNVNipRfL2f98SIRxNk/sna5UueEcHg/qNA6AF7JChkW53xOuMoUf010FisRexAUxyFg5YCo1pltD03N4i3V14XKdrO9y378ee4fScghcWIErVAlpac5SnGg0fhpdAYLqHNO/KxWlzK8raHZYF3msELz3k/lsyCuIGDvGF2FSBY3eWow2qWqwUfJXIUOapr8AuAnZK7rZFKVVuDKSIa+2bAX5v0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dkRKmHTyuGUijfe5dOG8G27tgwkg7/s+k9Y9wzs+Gs=;
 b=Ls+mt7XH/Yjcx/tbodci45P+1OMZQGioz8nJwae8GGHrCNT3XkzPfOL4sQFjHXoIRCljLfQ8c32iD1I+ZSAjYsvxVFhjLgGb0ivikJdR4bbcx47BKxJS3fTw8TxrS3ngFKPniMRY8l86MPWqSRJM2qBPoUKTTgWxkxjSfoKY/IM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PS2PR06MB2903.apcprd06.prod.outlook.com (2603:1096:300:53::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.18; Mon, 15 Nov
 2021 02:59:18 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 02:59:18 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 John Clements <john.clements@amd.com>, Jonathan Kim <jonathan.kim@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, Evan Quan <evan.quan@amd.com>,
 shaoyunl <shaoyun.liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/amdgpu: fix potential memleak
Date: Sun, 14 Nov 2021 18:58:50 -0800
Message-Id: <20211115025901.2598-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.190) by
 SG2PR02CA0073.apcprd02.prod.outlook.com (2603:1096:4:90::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26 via Frontend Transport; Mon, 15 Nov 2021 02:59:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abc96290-75d6-4456-ede3-08d9a7e3ea3e
X-MS-TrafficTypeDiagnostic: PS2PR06MB2903:
X-Microsoft-Antispam-PRVS: <PS2PR06MB2903810E60E18A811D651330DF989@PS2PR06MB2903.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qcRsVUei7IMG2gcGfqvKjL+enIfJozMfFYP9NLFMdUSTqqwB6QBwYUP/g0qZpFppeBUS0nDEDlhxciV+WsOsGIAhe5TnRY+svc+QSm9bhpEo8/VbX3fJ8t/iwEglmtRw/9PAEsgpKeU3CrxJAbHbtxL8joNkYnB4bViaGj8ghq92CCteuIDy0HePgtLSgb0HVVLlG6nRhqvZJsehF75uCzPFbM6o33HXrsvrA+X4lHc3OSYgpyKLIf0zqNKkCg+IVCpzfX8FeYh0UXkq/zUJl/yAG50J9MJKqqJJqzLvEuj0rUcsq+WI5hGQqMhnglavRoLbmdhBPU83ej0/wVIizbc42RFBILGXO9nBxzYbKiXvJOVFt5iZ9FqveAXd9dEgtm8qqXTSrh5HNYvPJv3adpUWyC0mutdtgClgfY2xGyF6vepxQHY9L0wraqREJw3EGbLQlGPZhyh3xuqKk0uuUSEb0ByrFqEz3yZ6QlHU7cMPAvL8qDf2brdzy32TN7wGuRa9Cz3HFlixtCmx2gQy8G6wzMUh3U2YzPFa8T2/w6yJ8RSVeedKUEoPk4sN3So4t1W/vR7ukC2yBaCQRngDzVQNSEdFV/v1IBN+UDnE4M+Isa8jX4p/wXWf2vq34a21tHPT9fndZeX/Tm7zJPofW84Gs9G2N24xf0Ijx8V2JKu3PYU30W3aIiysc31Kd8sv98pYeg0N5UIqucpQr3VjH50mzh0rQ1+3UZgFeCqz/uE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(4744005)(956004)(66476007)(66556008)(6666004)(2616005)(1076003)(38350700002)(38100700002)(6486002)(6506007)(66946007)(8676002)(2906002)(921005)(36756003)(5660300002)(86362001)(26005)(508600001)(4326008)(107886003)(7416002)(316002)(6512007)(52116002)(186003)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4AsGnTKUBZZPStOYN1ckNEnNHeIW/F00308f7qgDKPC3395WBOxLRwomnyFl?=
 =?us-ascii?Q?F40z3rQBZd/ggmFe0qGajbWVGq3W7N8cjuBYPUCiTdg5Cqgyx67shMtzbr1B?=
 =?us-ascii?Q?97faOycMt7q6TFoE2P5INsMX5Yz/4z3x549gp9m0zLNOKFYH6gB4Os0Dv+7H?=
 =?us-ascii?Q?eknQWSO+QaSnd1uEeF37grDI0s6f8tTlA2FU8Z+Wrd9YpBQiu1G91DgK2mlH?=
 =?us-ascii?Q?HC1F5rkWtlyq8zTpMBRv9XCAaYVhrQndNgzMRDUOg/paeDGArIudB97c/5ON?=
 =?us-ascii?Q?zIRro75kWQZ3TpxmfMG5qd+tQNFWkMMyT9EwAu74L3HL1dkntt8IUlmYUC6b?=
 =?us-ascii?Q?x40ASwIFZk2uQ9nWtFmy+csTnlFgkxrBBkz7gIDNwHjyS6b1Bbj2ckr7VyNp?=
 =?us-ascii?Q?2v55NnaPM+SzqOzNjvCaz4TqzO0zUo4X1qfBKHNM+11UuouhHbVG0jMjudhS?=
 =?us-ascii?Q?u2JqSsK9yJMFhPFUmwZLqqlzkH1Iwvv5FwVWa3ZKTEBKnK3vRrWEM18jpWv2?=
 =?us-ascii?Q?rTvVAkGDoQo9oO91/o/JtzD/rH91EDBwcmu477bbk+FX/mQ5uftNHzc9fg0K?=
 =?us-ascii?Q?y0DSnqExCZSKunCxkZ5VhxboR+5h/EqUbgvZeBIY8Z1YKFPtlfkxtOzRGFZM?=
 =?us-ascii?Q?19nB2SzzlSgVeg+MNwFdcxjQ+uzdt9H4hUlrYZq9ebqLBg2M+eVJpQvCyj3e?=
 =?us-ascii?Q?/JaMJiZ6rtBDEJ5lPRJ7eDICx8U9AiQ0mGV+gk4bNQ2HzYoWF5upLYkCK7pp?=
 =?us-ascii?Q?RV8tF6FDaGboATjuNjWC9Z1QN6iPc8uy3R/NFN1ICswu6zmp38+E8sgw2SIy?=
 =?us-ascii?Q?peqx6vjgPMQQzb5TTLZPKVTTx53AC6VRCsj/FSmxXR5t1u5fmjmQa6/4LPAm?=
 =?us-ascii?Q?AVN9vVkiCtxIuBee5zwQWvVkNXYBnmmHwALOsMNLUpCSYTWbrEL1wsB0mUqv?=
 =?us-ascii?Q?KCf3uLMpHvrLVjAIoibKjTyQURugYgYsgkbpRb7NsznuoQAYDCqusgaQ9M4Q?=
 =?us-ascii?Q?3anFCX99V89X++ztP06VWfHGGMDkQL1yrnKjaB0Om2J2HSvqr75gO5M+bzw6?=
 =?us-ascii?Q?YrB/bIzC2JtKJnyxOddrYeqeQOAldHBOIRpuyL8uGzBzK4Ws4fRGHqRLxl1N?=
 =?us-ascii?Q?/ZRh6416j9u9xQOoPclAFCc3zmWGB9vND8oWGxVyXc0i9Cc+nHUCvU/5G0IY?=
 =?us-ascii?Q?hYsWRjCFk8B7Ixjfq8C0ZVzdWkVNyaRgyKqAINOUCrdo2Hy82aqgLyIwH5wD?=
 =?us-ascii?Q?YHICfDSdHMyOXlZs1BsrNsj0zONEg51hKIKJG5yx9pVMoAxetVjmYpetmvg9?=
 =?us-ascii?Q?xr+mpt6t9bYQVf3l8lYL2EHry6wadkGtvW2AtjNbf6mxp9miWLmc2UK7FG//?=
 =?us-ascii?Q?+S7jy5/2LWpQe2m/OVB2DqR8Oau6L4Sa27XeU9MBa1LhrGmGt1xJcNHnLmZ3?=
 =?us-ascii?Q?qEREX91o/CNG0ShigbTzaJWGPbsbVeNs2gYahbXOs95OCtx/zB2uEH1lmlXu?=
 =?us-ascii?Q?bV7c3QiTk6rZ0yoHmEOpHxlNH+6Rrz8oz5uzWcZ9qPm2LB2R/01bwy/UZtge?=
 =?us-ascii?Q?WjOXgTuDAMfo//AEfp4LYRtL+BeVTPpSwASjCF++jwU3u/jbmSZb8YKIowXo?=
 =?us-ascii?Q?t5EOdY/13vciQraEqSBwe/Y=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc96290-75d6-4456-ede3-08d9a7e3ea3e
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 02:59:18.2089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paYU84gXcavc6ZHpx/Afv0m3FtAOKbtcsHtE2j/ysnXtT5NRA6Gop1D6GQynJ8jBo9bOJJ/cr7JGRkFFxByY0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB2903
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
Cc: Bernard Zhao <bernard@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function amdgpu_get_xgmi_hive, when kobject_init_and_add failed
There is a potential memleak if not call kobject_put.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 0fad2bf854ae..567df2db23ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -386,6 +386,7 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 			"%s", "xgmi_hive_info");
 	if (ret) {
 		dev_err(adev->dev, "XGMI: failed initializing kobject for xgmi hive\n");
+		kobject_put(&hive->kobj);
 		kfree(hive);
 		hive = NULL;
 		goto pro_end;
-- 
2.33.1

