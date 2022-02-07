Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED84AB3BB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 06:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C816710F851;
	Mon,  7 Feb 2022 05:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1698610F851
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 05:48:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtniYe6SJlSf7x1YX6oYMsJNFPm+a3XW0AEIY0mKignDC+Y+ejZwotvjk8HW2pY/GN1Zpo65PiLmb132Q4C8HWgpJ9cKVVFkQHm0Xzmbfs8qzLFFr9zlppojMnK9iADOyOOguvGmZajY0xk8f2Ci5b8HPGWGbTaRHCdCb8J5SApPiQWCpDzVvAyMezrkTk0sLVsBUbdJc+Wv+PKsDjjC+zriob009Ir/37hTyGAIr7ygFNwIXjfBdmFwfIlgiKCqbsc8FntCJox+nxNifjZJ1ch0Q5G087Cegl5GB+RvCEhpcSSO2EeNbHa1a/ZxwKGdVw2hnFb90LvG7a/uP7T+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hB5atL2VuGp3Qf6sMCeO5bZAGkMi3ZnjjV7jIvHF4Jg=;
 b=E5PECWJHo03gUP6yjXb6B1nCrgh9M0eRVfK9Q4krrFmNHCKaYMPduilZZQmLNv6A40pk3XIzNAK3ay0ALncpcuusNwc3gSMh7LL1keysGVRfBFIJonafIjWVn03kWUEBI1UUZWvJQyQtn6JmL/+l7zKhDkp9SELJu/yezxSnXiRJsOXa8pC8LItXswGKBAcH406ql1ZMD1z8VZcq43MtQvczIYr66ZzLFfr4glRpmV6g87nIhjDwlcvCquQZFv83cL91bPxenZHF9nvjaBy317lfZdaAJsVzqxS23ZgxF4pYiz9YnVQmggpTrjTldgW+NxWcF8CUVypA9YGNN84yAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hB5atL2VuGp3Qf6sMCeO5bZAGkMi3ZnjjV7jIvHF4Jg=;
 b=Mp77vT5DFh6Ton9HA51okX1CMBAt7Qb8j5qKz22QcaX/K3LmLbz0ldP68r+g3yY3D9Pbmz+PvtpM8bAYgqLSmjJc1L29IxZUcAx+GZwePsrxTyV8PKmWFWd+vhSW+6x59twxIASyr9NeBVE520GKATkzu8vPUoyh7teQtyWvU60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR0402MB3677.eurprd04.prod.outlook.com (2603:10a6:803:26::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 05:48:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1%4]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 05:48:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drm/self_refresh: Don't trigger the entry timer for
 self refresh work if CRTC state is inactive
Date: Mon,  7 Feb 2022 13:46:17 +0800
Message-Id: <20220207054617.987811-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d4529e6-b338-4393-81a3-08d9e9fd6d39
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3677:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3677BC9EBE7B43C1E5D50D45982C9@VI1PR0402MB3677.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vZv2VFCoIQnX+CU08Kg+StfguTGvKll38WHNBsteeU7VVqBwTZBUdqk00TT1oHuGP96K+Rub6MSH9wtOz7K9cf8HndLynehNggvaht62z9bBiLPVnuzyv4npGM37L9O5KvUN/uAksCxjlB3MkAlc8D1aQ0gJu+gdLA/SKv+AfZNFsaq3OgavHxjkclGA8+5VY/haJGmyf/FgGbJLKvJV2g5uOQ3hCaEcxQbkCLhaVJL0XouX86wb26iz8vSWDnA2fRbBm2g2lObaqUfD1UeZZ27UvPp/1USRrAI3X6HU+ZnmNDwJBpQdz0tyiWtzKtFDEYDlByw4PL4D71V+BXzqehiAYevOWUE4+WCUrkBsL2HMnUMXrMIOcq8xe+eoHT1YEocODemOaa6iKAEoHmjv7bXTvP7h6FmM51g6ZVKwOmn7iziboFJedg78xP3MHkrsPnQAIFvr6esJ63c+dIzK2oBms0boMs5kqJglNGQTdNcNVk4ehkIsG8BW4gDIFd8irRahob05tkKl4jAPXSUP/GgVZpWs3pxDO4W96tK7nv8GmZwoj/CGIUSvUW0ImeJqyNBN6huF6rUC24vQLyPKDviVEVmtK/s3l7Ws0GyuhPFKK0JnJz44qFTueGi52ARj4bWl93L3OMhK31rZuTLjrIFKydF7FNKmdVg31Js9sLrTiB1Zuw5Fy5PidCJcu8oQZg0QowlUVjd05pRJCC4SLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(6486002)(2906002)(1076003)(186003)(6512007)(316002)(54906003)(52116002)(508600001)(36756003)(6506007)(2616005)(86362001)(8936002)(66476007)(66556008)(66946007)(83380400001)(8676002)(5660300002)(7416002)(38350700002)(38100700002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?07Mma4LV3rTFyXi3t6dGsYlP0i9yEPAfy4q2dZqwBpTCmOgLT/nw6PzZnu+G?=
 =?us-ascii?Q?hNFhkVL6wLx/uMbt8uZ0YLKC/EzLQMFqvR9khf9N7kctc6ZZI/ISKOS8F5Px?=
 =?us-ascii?Q?IOYzr1ygmdRgg9FVISCSKcU5ijUb/Wt8sHI48cl3quL8+y0zys6W1YZpE3RW?=
 =?us-ascii?Q?mPmD4WQKme2aXfac9F5mZ1WyojPYrHhUT5omtkUrTmwgS2CfWddM7H7LonhH?=
 =?us-ascii?Q?LKKUf0+l6UismnSZ6jGUQCQnhLNdP3pAVJ90psRtx9VT+e/EijxEDdJ6BoCC?=
 =?us-ascii?Q?Luy4wvXIP71WcmdBv0jU7yoAHeJlM/+Iz6wW1TF8ut7Y1hQyooJlnRpxVT19?=
 =?us-ascii?Q?RS4pyHCM/0dqSuFcDotwqi2aUW5b6xjTW68BhFLpxGirWck1gMGDxoZ2PHVm?=
 =?us-ascii?Q?87QXGwCxHzc8KUiltQlUn6MD+VU1o5kkylaPM3OiXXCxn72FeuY/DDWvV/Xd?=
 =?us-ascii?Q?em41Bm0WpjTz5/FrzeKF5RiuJTXJXnjpGp9MP9G6UeiFEsZ2g4qSH38w6xja?=
 =?us-ascii?Q?BSpsYRKmx6RUDhhPkSBiuXe+C/BRTjGei0dqgrLUN3tNuuQZxqHztY9bdWGD?=
 =?us-ascii?Q?WC1S8mS/y5PyhL1mQrKYvG+kr250054x0O8tmjLCn3+BhQOSZbp+DGJtOv4B?=
 =?us-ascii?Q?+3y40EGX1WWRGHvIn+MBb+6UzplB9tNCiUDcTuuvGX9H1hmk+O7z4G9Hv5XH?=
 =?us-ascii?Q?OUXYUyo2O9Wcb/ixxbMA96Vq3CQodKtb296M5lBA5QmOBCntG0UOKXcOrNnZ?=
 =?us-ascii?Q?+vE6Ymb53Uwyidnzy72IBy3UrRoj2AZTGznZ8ScXbW36DlaSPRq1g8ypxLRm?=
 =?us-ascii?Q?tJdMIRCvbujfLbknA33lJnhUsXAXwL/8Ux3J+IGfchJJN6lBqglp8Qi9ZnDy?=
 =?us-ascii?Q?XDpXGxvPW7v9W0o2H6VqoiXbOjliBhe7Y6SQ50KIzjCWzfc9yZP8mwypEb+8?=
 =?us-ascii?Q?gII/xiZUo/MOh7Om9EHfTtvEqFwLlhAkpKmQtJow1ZYLNCGWudGwWmsJ5x5l?=
 =?us-ascii?Q?QVmkhyEAb7WqTfN7x4tU47SobrQteETjhS5k90z2iDSMvPFw1o5Rzh0dSmPY?=
 =?us-ascii?Q?E9mulynRS+KonQ0Y1B+eewXqUQK3lEcGW01UIj2+sYmDbRfJnAqNtBFwAZV9?=
 =?us-ascii?Q?ctsraN0hI4qEzLKZ99pMET8sUNO32xEZ0EvFiHCC8O4fhtLI0nY9AvgcGMiW?=
 =?us-ascii?Q?KVhm4OYw6GkDMYZXyhHUTCVOM+4yefWyn7SfhN1SP37NYfrVG0CJ78MbIROV?=
 =?us-ascii?Q?FuwRvJYqZuDl8Pf0SxsrhhIKi9el+y5hmMQ23v/WinEoqthVIkRkj5FtVhYI?=
 =?us-ascii?Q?Q3WG8Ivi6UFMYsYXzwTVGbVYGvM+UvpaunVmXmBUXgeW3x7wp2y7uOIiQqPs?=
 =?us-ascii?Q?TS0/QpU9c+zpJkowe82B0mfFT2EUKukUcRZZ0dljq6W35vfMVTxivDc2or0W?=
 =?us-ascii?Q?em8X8CChPJqBLfmZ6r5jswlZxgcZHyYcy0yoSt1q7Mo09e6lzt3/UxLiQgZ2?=
 =?us-ascii?Q?aqzZVcjtChY2bkKe8DMbgeoBEZrx2sM5sEWbzfq/mRijLAC29IgfcuYpbnA0?=
 =?us-ascii?Q?jUeVez4rJCGU4lWjYRVCH34MRMdBJNgZ6HccYXYHquVQmXdJzqGSJIdV7DsY?=
 =?us-ascii?Q?4kkj+vlqYTtFcgG5PhlzIjw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4529e6-b338-4393-81a3-08d9e9fd6d39
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 05:48:12.0774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MtbMF5brazWkRvV0ips1iDyk/KucxgWuTB6Nm0gPcKM3p6iltu17GFCOCFIKYnRualcxud7tNodaM5PceM3uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3677
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
Cc: Rob Clark <robdclark@chromium.org>, Zain Wang <wzz@rock-chips.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 linux-imx@nxp.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the CRTC state is already inactive, it doesn't make sense to trigger
the entry timer for self refresh work to make the display enter self
refresh mode, because the disabled CRTC hints that either the entire
display pipeline is disabled or the previous atomic commit is triggered
by the self refresh work(the CRTC is disabled, while the relevant encoder
and bridges could be disabled or not depending on the drivers).

Cc: Rob Clark <robdclark@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Zain Wang <wzz@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/drm_self_refresh_helper.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
index dd33fec5aabd..e76eb3cd22c7 100644
--- a/drivers/gpu/drm/drm_self_refresh_helper.c
+++ b/drivers/gpu/drm/drm_self_refresh_helper.c
@@ -204,8 +204,12 @@ void drm_self_refresh_helper_alter_state(struct drm_atomic_state *state)
 		struct drm_self_refresh_data *sr_data;
 		unsigned int delay;
 
-		/* Don't trigger the entry timer when we're already in SR */
-		if (crtc_state->self_refresh_active)
+		/*
+		 * Don't trigger the entry timer when we're already inactive.
+		 * Note that the inactive state hints that either we're already
+		 * in SR or the entire display pipeline is already disabled.
+		 */
+		if (!crtc_state->active)
 			continue;
 
 		sr_data = crtc->self_refresh_data;
-- 
2.25.1

