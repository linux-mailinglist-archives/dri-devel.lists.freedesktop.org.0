Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B395AE0F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA1610E77E;
	Thu, 22 Aug 2024 06:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="es6V1ZDP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2052.outbound.protection.outlook.com [40.107.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABC710E77E;
 Thu, 22 Aug 2024 06:52:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKKyzL7RDTueAejjZQlPR3FoAjgR6km8EoppEJWmplXAxMQlm37glPV+EpCafJ1T+16s4+5aHkgsBJ7Pe2DHa01ZiXF0K3xL1QPpy1ElnkqAIKFvUqw8PaZUAsPSJPaQ1Ho/PjMhYJRQgkjwnAdT/xCG0gRCCwYHdA3xfy0BrzvfCOurPrDzPwraLG2J7no8soJvtIhhgLJ4s89mAiD/YyzmaZ70PNksj0SALAoOo/5Y84lSDsBI4Bsy4sKXsie3TJYtogjB+LFeYEG90MJtlqIZL7HborHsg8UzNckPknLqfpnoFu9jitk7yfxaq/Jvb6j2Zl7e8anTMH11MpPIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Nf4qHOg4Wy94B4bQcsuL4rSf5VRXrwo3ygBKI6+/bM=;
 b=pUl5ZPXmbKh6jrNnkFbfnaL+llfXtBByHClBqvwnqoDjttt1CYykqTXlhdv53Ny2Vy1LDzmv7wnEO4iUYQ6GP0dICUNGxjLmjXObp3QngykvkVDAQ+xhZCl2C7M9kFK1uaX4XMOmD5OmXILP7h6ioXxBGXQtgRzUBXl9Sb1dCCcbn9i5DpZMFIEj9VN60J5j/sgf9QhUM/HzC03jReBlBsb/OYQ5GewZDAS9pFxfOLxKmNJyemlXQ5B1PtGqwhbPxuQffcLNgqoRKd6Sl61sP2ICyhHiUvzo/SDQgTYk0xZY5y07O4z41Q8DDgSCFZFIlryw6754bTDUkeV7gm7AFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Nf4qHOg4Wy94B4bQcsuL4rSf5VRXrwo3ygBKI6+/bM=;
 b=es6V1ZDPDCUJJWOz0I2vmz524kDJLor97nwU5oEnZ0dp7SKG9lDqAogKy7tjDofjkj2WO8208chY0IfDf+QpxkGB0XF4igtdk69W5DSgSNOZ8DziSnqhm4vsz6gOFKm97xtqC5d4MfSgaYcCkcBPkxMs5+8kVtG57ASwC6Wf2ZadUAtSxwbY7mKdgNdFqUY0LVXWJeILFvluSX569ddlnNCJTWDNf0tPhBaywp/UlImbEZoMkt5pz6Ro17jY8kEpvYaBsHSm1qBJfhkP18J2py1JVjL2RU4q3zlnWcH/fUVGCySfarJN1i7JEw0WwxsNiPkvrOMZoViJiZe4rDx1vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TYZPR06MB5417.apcprd06.prod.outlook.com (2603:1096:400:203::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:52:41 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:52:41 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 6/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:51:37 +0800
Message-Id: <20240822065137.1331172-7-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822065137.1331172-1-yujiaoliang@vivo.com>
References: <20240822065137.1331172-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0168.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::24) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TYZPR06MB5417:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f292e0c-5ffa-4bb3-3f63-08dcc2770466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hd8KvWc1U5CzMCzHDKPgOu0jBKYnIANxEfHH5MOu4Y8/0flLcIuBTcZLpfow?=
 =?us-ascii?Q?8B5B9aPgwNPgzOp8tuYteJE1UgAZPGdZBveESJo2S7K1uIY+iTfLSljxa4gO?=
 =?us-ascii?Q?Hhga5OyCOBIAq6xT3UdJZlJ1PfDS2Daxkms3lqFjzBOkvAM/JBzqSEdENE1H?=
 =?us-ascii?Q?3/2RNkb6mTG8A76jxjrx3r5HS5DCMlOwr/OtAqxaS7KHpdg/cGZlnUYRb7Uz?=
 =?us-ascii?Q?+/QTNWa3yeSVb4yCU0ZXzbHwSj0ORWdZO/CyK/4AwJg8stgMA2AsSo4O/2qE?=
 =?us-ascii?Q?ER5avZhJQ8HgV4Qr3SLp8TTIQ+T6qUKe4n1B9DDbTxoKibFlyy1t8XS1uVBB?=
 =?us-ascii?Q?EKOEVuwKlT+Yhx5sQ72rRjYSUMBzk0YksVCd+tEvxeQAK8gU2V6J5y3+UjyR?=
 =?us-ascii?Q?mPZ8gA/u28sdNRFkSrFtPKO8qT5VTedkeV43NdkNidqfpFv03F0FjWlWHwDi?=
 =?us-ascii?Q?e0VPcwDeBgFpK15ytsJmZQA7/OKLejbz+T4ehM0yVoX1k8/nvq2vFmKsHJEN?=
 =?us-ascii?Q?bvq7vh2CubCSqFysPNY/FEBEEBDlHwx6ek33qHjgtbEXt8m7kmNb1Icj63Js?=
 =?us-ascii?Q?kIt/vLt2aIGYvHUxvMfvWwZftP+kpMaXhYLRGRqO6x6VRVMQ3zzJ8/fy/NZL?=
 =?us-ascii?Q?3EbfGBFKAORKRri/Qq/MoIJjCNhQkWDAe+DUjDe0yS+OrXHD7t6MrdVoypeu?=
 =?us-ascii?Q?Wg6/cWh+8oUC5BJEuoGVHlQcydBoG/Mh+4RqI8ecWBuQCSHYO8qC1+1qmxsR?=
 =?us-ascii?Q?KiRjZB/E6xwFrErAef0h52m0jrA3WrHKhcEb/rbvp6vQHGhx1Pm2UGyjS6lf?=
 =?us-ascii?Q?2eO8T5BorM8IAl8Y6miBF8m5LGMEBkPGHfmLwOxSXNLNJjKeemirlUONgROX?=
 =?us-ascii?Q?+IdcLOdSSzwWexZu//wDFIXBNW8vUu3zX3MMyV9KpI8dXCmgnGaSvSQsVPe+?=
 =?us-ascii?Q?BM95G+X+0JllvX05qUXD6uZuAv/CLQuFEv/2bTRs0KbALGxRgy3MFSfijQyV?=
 =?us-ascii?Q?jsxKkhFqso11BPqndEzDFL6H163yXNuM63WVFWcSwJy3Oa9GdAsAJbTuZYHM?=
 =?us-ascii?Q?OHux+rFYfJdgyItd8urY1QKf1oPZGSwjXGvH61tGAL6SlGiGPfGPpLTO6Qr4?=
 =?us-ascii?Q?UjJQt5k71yl2rnKC6w/LOE61OH3jv+ZAt142fmVQbNCYhOwiYL6aRA1UTAfV?=
 =?us-ascii?Q?FnmS0C61cHunzIs+9PVizj2Fwp848rXT1BTy7mi+1Qw36l89kukDVcLII1qb?=
 =?us-ascii?Q?kMAi8N3LWjMveS4OEqTlCfAWPp3gECEOVbjVRjX9u31pw11H2Yu+xBzcxLly?=
 =?us-ascii?Q?wUYkF6SCwvst7NjMZ8s/sDcIjUkxAgHnkAQje+OyzTAHVgN1FgJLMvyFsnsX?=
 =?us-ascii?Q?Hl0Hq+LyKwn9nxpGfdMOZ0ZEElORJXDlG1JsmGwFg5bE9Ki125paomtRjwh4?=
 =?us-ascii?Q?Zsy7XNoZL7I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZXXtcaRQqhugTF2fKHQvZ4wtRLrx7YuZ2UXqf52ExfFn3R42x2i2IQI7D6JT?=
 =?us-ascii?Q?Y0V8LrmLDisgqzk6Y0bin3diKy4B6gGcR7eziewfCq/P7Lskn3bxR2g2dgf9?=
 =?us-ascii?Q?V47Vs0azmboW1Udj3uTqsKvHUXNuK+oK8Y26lk7gcPVYAE0N34xvxOO5OFRp?=
 =?us-ascii?Q?jkCBGz7mjX6c/APklhzii+XVRg5c3j2Kml0ponOFo8Kdf47FO7VOE3kqf+pS?=
 =?us-ascii?Q?/6gq3oyhrcdL/9OdbYji64wTeDSxH0TvSqapZ931OGKCJ56lPf06PxEVm+Kt?=
 =?us-ascii?Q?gxId6Vf3cuJ1hwFUXBwHwqIE0md0XPxw90bTs1PKXj3sPZUNeeEu2nza8Vrl?=
 =?us-ascii?Q?zxgDh2w7gpkY5E5XI+C9hPomAuqHXj0MFD/lhkBoS2fhg3nD3tSerVbYbJK5?=
 =?us-ascii?Q?cCDx3Tu8R7DGtr9rtfwotcrb0bsimr1iizRnJLstpp3BAARb5jyVwP1PoS+8?=
 =?us-ascii?Q?LcJljNoGBEkC2UKfYb+jU7QbK/cus3UYTOx69OITBuxffOJoePl2poSgO66y?=
 =?us-ascii?Q?dw8prWt+O/YMqELjk95q6cR9SuUjbMYXIzELcvRA83rwhU6tLtS0N9BNozAm?=
 =?us-ascii?Q?FJmsehlq3z4p4lB2PiQYHJp5/dFbrRUp+Voe50mIWqpSdji9zup8w5SUuhGS?=
 =?us-ascii?Q?xKVAvrXuCj96rzq7g4U1vTLUbqhw1H3MD4wn/sDj5+EIzMawtd5DmO7W/HhC?=
 =?us-ascii?Q?5OH6gZWwcaqvnPVVPHVCs3ha35jSnq2zm2Eg/3AjHlgnmLvwbGIFAJyP7pKs?=
 =?us-ascii?Q?5cl6L2tBIrRAFaOFngXx2lDR0HaKTpd6VtX22g8E7gGyLTFGBJ95o7p/KQk9?=
 =?us-ascii?Q?olq3xnAmwQCizoR2nYvtHdM6H/hlws1brzhlCe7PzhJpMg2NVkxAg4s55suG?=
 =?us-ascii?Q?hBEEmR2arUmKbWJ4Krlv3hiaBIRF9zOtu5rMP7X1tjkgYJ75uvp5dHkqTDiN?=
 =?us-ascii?Q?PzxXJWmRK1cEW8D5R77JGJaDxSSIygs0/n3BwUUXnN2h1WSeZA/jZnbr1wkT?=
 =?us-ascii?Q?9arFzHwXhc4nvmtZh046StKxuAXEKAvM+KCjjwSxHoyOQDjVmq0W071QeRlG?=
 =?us-ascii?Q?11i1wyG1vrWlYsv1C2aLvXEj8NyTLPiV9z5KbnrXccMl+SDl9aFPNMTJHg2d?=
 =?us-ascii?Q?QVMWZhvji7qM35OaxxXFT68eUMWdqd8T1prJe9HTtK8nijWDRebRvKyFuiG6?=
 =?us-ascii?Q?WoUfM58+F4KSOus03tcrUTQtCaiO6arsO1cd8dJrSC3j7rT5ndFYFF4fw0M7?=
 =?us-ascii?Q?iGMETwyKtv1vfgwBXvMZfZE0zBT+PAlPTZ/TQUPWMxSTnjIZ9eOWeiII/YPd?=
 =?us-ascii?Q?n4Obc3Zj4Mm4DgGq2X/YDVFhguMpgNHGu23JVHYX7IAJEUTHq/gFnMntiqZf?=
 =?us-ascii?Q?rr9R9hu9rKRqQ+N1puoAp8/Bs53ZjFZTSCwXv+MyfnlIW35CidouJlvP+g4R?=
 =?us-ascii?Q?f+lou2vrOhdqltZIcB80FflsP9ZkKu0ml30LFvsCGKnxJlUHRpVxgGufUkzr?=
 =?us-ascii?Q?EMpXi+tggdLTMzqQ46UP/zmVw/Ledh+Ga3dfNJX+55z9blwMhiWmJ0AvWJXk?=
 =?us-ascii?Q?JnU/8A7l36WjbrtjLfqw5eHU5KWaenhxBbmjWHRY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f292e0c-5ffa-4bb3-3f63-08dcc2770466
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:52:41.2343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MnTetCaozyzD8AfEY/zY/mWPjElG9bIPUygZ5sVFIncohAOTkNLc/MDnPSoxslpfEhCOShIeBMuVJi2XiYjnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5417
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

Use the macro instead of ternary operator.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index a40e6590215a..33b9b87d8d3a 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -1005,8 +1005,8 @@ void mod_freesync_build_vrr_params(struct mod_freesync *mod_freesync,
 			(stream->timing.h_total * (long long)stream->ctx->dc->caps.max_v_total));
 	}
 	/* Limit minimum refresh rate to what can be supported by hardware */
-	min_refresh_in_uhz = min_hardware_refresh_in_uhz > in_config->min_refresh_in_uhz ?
-		min_hardware_refresh_in_uhz : in_config->min_refresh_in_uhz;
+	min_refresh_in_uhz =
+		max(min_hardware_refresh_in_uhz, in_config->min_refresh_in_uhz);
 	max_refresh_in_uhz = in_config->max_refresh_in_uhz;
 
 	/* Full range may be larger than current video timing, so cap at nominal */
-- 
2.34.1

