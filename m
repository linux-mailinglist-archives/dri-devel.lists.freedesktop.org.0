Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3FB9778B9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 08:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEAB10E160;
	Fri, 13 Sep 2024 06:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="FA9LXSdu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2089.outbound.protection.outlook.com [40.107.117.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433FA10E160;
 Fri, 13 Sep 2024 06:18:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvJjc0SIs21q2BtFVXsmgmvFyhEFEpIjA+736pNSGcb0/dGFCynQP2oPP7oNv9zuxElur6x4lHSajW6QJpfjEh3QCVlxsRzrA55jvtTHUgaNvJv8D06MPkDep5A59NzJdfo47m/hP3B7/oAR5Wq8aoMFJnNcY9aK7SAXJ7V+7HvvB/PkYQxvJqJ862b43vpupEKHHD4Tk5gZNeagENwnGaxonoJKTK99x747f4BLuzs6THZMTdO0MZurpcPamU7K4uWD+c54C0OXieIlPuzbvNn4Bwvtt8kLST973rNfkQ35PJ8EEjphEVQ69OCAyYzIr7FeAAThz5z5x+kN3GMbfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypVzHkvFophgiSElF/EtoSjIsjCHQaBBnbESzOF2Vzc=;
 b=QrqrHGSVa1S1a4H5GJac5dU58xy0MR8+AH01cbLhmNAtxSeX0ElLU8FtXIh6290Zly7IpyY9IE7qmCJLFORaZmPpsCE5YNTu2cnXbnNj+SH7Qd4ZDIY5UC92mwAfxf99kGbaH6xzExOb76biRLR7gVDPxRNehRJssYdwWCpQa+8PA7CF6JRIeFWWW637rRQAoj5vwOrG+W55CgJXIL3S6hlgZuQ0C7HmULrGQCIrYzmWkUSptXFvXY5NQg4Q+/r1I9c8fG5YG0eZcBsCcns0QTpTh2QSC6eBq98fyHOGPKYYsXN9qweCg/EIjM65nilXw3YafKLbeyLwz4Qg2YvVuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypVzHkvFophgiSElF/EtoSjIsjCHQaBBnbESzOF2Vzc=;
 b=FA9LXSduZEhUvVLiF5Lw+CGfrM8GUVYkDqMqIEXCHpNJPaow2uOJUvRBOvMFLCn0wvnEVjZJWx57fRx95Kb+69lKA9MBVPMKU7PN3vD+G4RsU4bvNIHYLUW+F8/xh29726sHs6V/QvhG2iML5BJxS8gaiGS8D+23O5SVXNnBqErAHLtUSUosL3ZkAHH6XnJLkFcC6OZ0PMR0kDi18c/21oDCSPBCys8Sg5IyJk7K/OWCLCZMV2OSL9XFDrD9/E/GFj0vLXei8Y64Eb+VvHbMi8cLnFWyv0DaLXA/jCDt90JyY2zA+ZwWx6TTlME6eId6CApnHG3I8EPAfKZBA4NxUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4128.apcprd06.prod.outlook.com (2603:1096:400:22::9)
 by TYZPR06MB6116.apcprd06.prod.outlook.com (2603:1096:400:332::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Fri, 13 Sep
 2024 06:18:45 +0000
Received: from TYZPR06MB4128.apcprd06.prod.outlook.com
 ([fe80::2bb1:c586:b61b:b920]) by TYZPR06MB4128.apcprd06.prod.outlook.com
 ([fe80::2bb1:c586:b61b:b920%7]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 06:18:45 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com,
 dri-devel@lists.freedesktop.org, Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v1] drm/i915/display: fix typo in the comment
Date: Fri, 13 Sep 2024 14:17:27 +0800
Message-Id: <20240913061727.170198-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:405:3::24) To TYZPR06MB4128.apcprd06.prod.outlook.com
 (2603:1096:400:22::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4128:EE_|TYZPR06MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: b9013525-1ba9-427c-68cb-08dcd3bbeb91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D3BR+rjXOlBKENUNLSaEhFE4czibXplgN0vAMN8uksSEGVs4p//hnMK2uclF?=
 =?us-ascii?Q?JeOagnEz18KDNNGWIUbAIv7bFjAfNLwu1egtOULw1ci6mUQnV1gsnoWpTtcu?=
 =?us-ascii?Q?MKT3jm/o0/Baxo3pz9yLybY53hePGLb4aIKooGCKoGWIApHQK+r9YkMxc7QS?=
 =?us-ascii?Q?L4JIqP0GoYVVyWU3dJrvdqqPFIMOVHM2fmlyXe2b+y5fSNj2PAbDlubOpDH3?=
 =?us-ascii?Q?S853Dc4MNQVFhPlQxb9XIay+okHrp3FnEFxDcyQTAkJ4IJQglCg/nU6ApA2g?=
 =?us-ascii?Q?SLIY+7U8XO3Vobc1QaARayttyGrhRSwdpphEotrBXuIRa/cqGr0+w7NfkSLx?=
 =?us-ascii?Q?Rh5fAM3OTNwfLT4ZRWiyLbCKU873pz+ww+xD2MSFJWE9lti2p13piOYEMXbX?=
 =?us-ascii?Q?46ZVb88CZSVRUbyFJsgy5vyIsPAkzfS6OcIk70Uk9uxjeank1cydLd7vZDJw?=
 =?us-ascii?Q?WSUEaoszfWi/lzf7ohS4iXh9d0+h1GVZg8eyxUIUkCsZSEG6qH/bIAUf+Z4p?=
 =?us-ascii?Q?w7sEH1ppQiZ3+wdDPSpDESOu5byXciq81z025lumOsv3bo4e7fV+I2RAaAEq?=
 =?us-ascii?Q?DZnVS+mTSpXN7ZGOTNNO3t8tYLHNvVb/ZDsioPNrDZrCBd16jwmicFa3AwD0?=
 =?us-ascii?Q?/scW6rGpjO8Ph9SoN36yVsVcFarvm2I44rmIV+MAdKo8boK5Ex26soi08fOq?=
 =?us-ascii?Q?arWKAoAiB/CL5iaXAGL4rEe6a/jsxVI48kufeTGOLSK7iF6hayspYW8nCtv9?=
 =?us-ascii?Q?+d1PFCnLbvOjhVOros2LuaGFnVb2NXe3D9WUr9IsLckwNkoEco9joHl4awim?=
 =?us-ascii?Q?82ABOnfrUuMeV8xBCq8YDE2i26JI1M39YkZo+VqPLjYb6FqHUo4C7ylZP2pz?=
 =?us-ascii?Q?u7VSbc/rK2Z+xN7qtu1cUAnlAsI1d//egPc3mTgP4TOt2UQ+hPu66HJds9Ns?=
 =?us-ascii?Q?oAYeK6iwyD7IIOUu+h87HDIx1KNYo1s27FG0b0At97OCuKtZMMUZEGgZj7rf?=
 =?us-ascii?Q?m963P/lstU7/q8v4SqqLGUQjHyHwM6Cldvn1qIM/ZmDhI42HZNHfhmV3Jn01?=
 =?us-ascii?Q?amPnKJ2U0rF7cMWtkJAutP1Ehs4M+fyUQEsNZeUpnGqhcMCuoGHGeZmuWPT7?=
 =?us-ascii?Q?mYt48q1APofeC78qbwka5LWjmRMVrOc3GZpfquIcU6ts249CfgB2+L2dWVZw?=
 =?us-ascii?Q?8Kv0UI5SBrWRlUG/TxDKin/IXO/qLf5irZVaSS9H7HbIbrlw258iveGBc5SU?=
 =?us-ascii?Q?GB03F5wUriMcQr97tqG0BpR8QhLe+IepPbQv7HpofG0QO7mCn+5NrQmO6NVW?=
 =?us-ascii?Q?DZhj+IimH4Bh8BGIlzhF1G7lg2xTIDFZMuy9LyuRkCmSKCL3QDVbQk0vfg/8?=
 =?us-ascii?Q?rwHfbxjFSLLHmR2yoE92fMrGko7XVh7GZiF91EXbxkpJbvcnRg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4128.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pkZbXPgyn7wdlYXaiCQ6a5YKS3oi3QD9T9KI1KyYenIz/ghZj46yZgQhp7i8?=
 =?us-ascii?Q?23Md9Cuv0y+2iBYWCNwM0uCk38BTiBJUeVlDhmLXNhi1cbBsTrAwgo9X4ZyY?=
 =?us-ascii?Q?Yku4p/bgRteJ65mdTBDvm6ImG38GbLL0DDVCgJKx4k68HSH6v4fRgUVi8g/x?=
 =?us-ascii?Q?u1Tv8w+pJ8NI650LITKsnr+cIvW0YxetjqawViFV8OOp6AvIaULklb0Ik9za?=
 =?us-ascii?Q?xjfD2tJ/kSvbC88Wa01jOhFZmUgsynSgIy6yEKEiWyJPBhU0ukwcwud0sUTz?=
 =?us-ascii?Q?kzMrtn91WEg+x1nEVjtKDedylnm2PJBpo9LW/O+7K0l7Dn2eeCpsPJOhAX0B?=
 =?us-ascii?Q?NmkioZ6euqa8+QQIQUss4txYz36S+ZtugyZnDI7PgiZpThSuhqpnyhgsDP7Y?=
 =?us-ascii?Q?7x8yT9mBV3KTF3hlQDR8aPXmbEM4UEYtqW6VrP9xid/a5ppt7o9WAXqQz0lF?=
 =?us-ascii?Q?EFBgkWiXPdoIGKd1miSN8UKwoWZ7SoWZDzvrrwhndiJo0lBc+Fgy5SDfQAI/?=
 =?us-ascii?Q?sfX+Tg3a9x/yHnc08Fp2GvFjtUCFI5HRxUGStl0iH/JSt53vvGERRW4SoBVB?=
 =?us-ascii?Q?xF+Om8urEBr2c5vTyXG+xxOpUq+kQ5bSu0YyTmTR+lhbdMMXoUcfs84fcXNd?=
 =?us-ascii?Q?hk7J1gIepz9Sn6g28cw5oH12x4sPIFTHXluBJMa3ETht7lb67ChDqAb02odc?=
 =?us-ascii?Q?Ycz+iS8i0j8Ozz38H9E1XG+g/1CeNQni0avuNkNg0UWtOBedHJiZWlWgTslD?=
 =?us-ascii?Q?hSyxrQIsi+KVABWXaZZgoXtyjYVUz5yYR5983vVEcuyCRdRSEM85WnoyOobJ?=
 =?us-ascii?Q?rXiSpGtKTRDAdydU2nOWQkOQikd+2XCNElCXLjQH/30Oh+7iI6gNOK6IBe07?=
 =?us-ascii?Q?IXwlKjsr4h3iBwzHMyPPE526BmMOWCYp2Ii7SxpFt4DdZ8zXe4zs5ivn3Ppv?=
 =?us-ascii?Q?EuC0hUdYCv3Mfb5pe7ujtHo47XxIO0SbEw7jODV2TfP18+A2UyoPlH9xG/PT?=
 =?us-ascii?Q?DzmIh+FpfVCJ7vZ9SKeP+mAiGHLcn0L0fpltX4kF/IqJEiloXWuMmeBgxT8H?=
 =?us-ascii?Q?aSQkX/5xKx4AaXY6dY+2Z3rK4en53N+V6DNMOSmP/tWD2x/y7nsxm5I5gKy1?=
 =?us-ascii?Q?RG/kl4sXPuCgrpupzb8Ebz1sQYFHmtsALQ3D4vZJOgCa3GM87lsQhgCDJJ4g?=
 =?us-ascii?Q?zEKb+0Vi0jY5lQcPLU3tP33mJUZ7HXCBiNXmzhX9wD/VDZ0Rkx69ZXV4rJj0?=
 =?us-ascii?Q?xJEzQ4nDUIDwT+ugzN+tyPZUzoWQpQn6bOKhnA15MnVL/kBIYFbbygfhfIGL?=
 =?us-ascii?Q?fzLJOGIelilDpeFI8yI9Ovp9SS39LTJtp0iNsBgeTH/6/zJFg+0r8K67Bskt?=
 =?us-ascii?Q?0OrmPkzvwtE/QJoN2JpVX7hpdEd+51sQASvVopbPcxZYtws5c5+Bu2xeZ4Xn?=
 =?us-ascii?Q?S98CGUKAoc+Mb59tgumN85GeSVWQ/rVMiGz1/OW5AHJ084WjeREkpBZo3UP5?=
 =?us-ascii?Q?Gwzuab1IJYsLaX+o7pme+LUDRbnHvujF6OQBOn6FCf4dv9X3Osi0lA0oFeJJ?=
 =?us-ascii?Q?0k0yIukdtfF8O/7LZeUX6sdDUMnJ/51tm4NsXB+s?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9013525-1ba9-427c-68cb-08dcd3bbeb91
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4128.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 06:18:45.3199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0uim4oybFz7YO/6GE1KJLd8eNycz1hs/R9RCpWj4XtKphd1hk+ijiN4eb9iQmOCo2Db3OAK3/BjeeWtwW44dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6116
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

Correctly spelled comments make it easier for the reader to understand
the code.

Replace 'platformas' with 'platforms' in the comment &
replace 'prefere' with 'prefer' in the comment &
replace 'corresponsding' with 'corresponding' in the comment &
replace 'harizontal' with 'horizontal' in the comment.

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
 drivers/gpu/drm/i915/display/intel_dpll.c            | 2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c            | 2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 830b9eb60976..d8fba1d00011 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -426,7 +426,7 @@ static void intel_scaler_info(struct seq_file *m, struct intel_crtc *crtc)
 	int num_scalers = crtc->num_scalers;
 	int i;
 
-	/* Not all platformas have a scaler */
+	/* Not all platforms have a scaler */
 	if (num_scalers) {
 		seq_printf(m, "\tnum_scalers=%d, scaler_users=%x scaler_id=%d scaling_filter=%d",
 			   num_scalers,
diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index bc72d1c0cb41..38e34b72bc4e 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -780,7 +780,7 @@ g4x_find_best_dpll(const struct intel_limit *limit,
 	max_n = limit->n.max;
 	/* based on hardware requirement, prefer smaller n to precision */
 	for (clock.n = limit->n.min; clock.n <= max_n; clock.n++) {
-		/* based on hardware requirement, prefere larger m1,m2 */
+		/* based on hardware requirement, prefer larger m1,m2 */
 		for (clock.m1 = limit->m1.max;
 		     clock.m1 >= limit->m1.min; clock.m1--) {
 			for (clock.m2 = limit->m2.max;
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 1734b12ddf5e..5f753ee743c6 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -264,7 +264,7 @@ static void intel_pre_enable_lvds(struct intel_atomic_state *state,
 		temp |= LVDS_PIPE_SEL(pipe);
 	}
 
-	/* set the corresponsding LVDS_BORDER bit */
+	/* set the corresponding LVDS_BORDER bit */
 	temp &= ~LVDS_BORDER_ENABLE;
 	temp |= crtc_state->gmch_pfit.lvds_border_bits;
 
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index f19660064525..32d15bd9a358 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1072,7 +1072,7 @@ static void bxt_dsi_get_pipe_config(struct intel_encoder *encoder,
 	hsync = intel_de_read(display, MIPI_HSYNC_PADDING_COUNT(display, port));
 	hbp = intel_de_read(display, MIPI_HBP_COUNT(display, port));
 
-	/* harizontal values are in terms of high speed byte clock */
+	/* horizontal values are in terms of high speed byte clock */
 	hfp = pixels_from_txbyteclkhs(hfp, bpp, lane_count,
 						intel_dsi->burst_mode_ratio);
 	hsync = pixels_from_txbyteclkhs(hsync, bpp, lane_count,
-- 
2.34.1

