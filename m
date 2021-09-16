Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F177D40EAE9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 21:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3918E89E0E;
	Thu, 16 Sep 2021 19:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-oln040093003006.outbound.protection.outlook.com [40.93.3.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FBA89E0E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 19:37:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkpWkIuqyQKMj2p89O684hLbzftY6xXDpAV5308Shb3jUaVzQoJmNv+7jn7gvBthrtFb7m6rpWag0+5dBbIsvkZTeAkierSf2081rZbtgymgL31SpItuN26ia2Vn22/+60mtMzPS7nWHoH9OSzM5/6aDZmfYhfKVBv32VMJKRrYkrjQSYZMIPhLLDLwUxfWmskWY1a8RjOOnGDbTrNEGuFmV0y3XLTyt+yyHDEfEC9eIV4013P3+O0XGZVzaN12DDPShqzP74AmWqjB70V4TOSGQIqmUvaidqVDecjcSRYG+sW84E3gtoBpyugrkzV8aaD6fQjIzz3oCBfNi8HfvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=7AtpEKd6Wt6LO0XHPGBYnRut3zHKZHOuJonBbax0oEY=;
 b=Myigs3Mey+0hMjtHZo4zLfEqwvW6f/uw8CjqzR9XXiKDTMXUr//QqGhI3PZ3bfYF56uhcKSpLAEmlWODj2OKd3UvtoP0HyOorCoXu2r7q1mNyxZoR1L/onZ7nbgy9emV8BMllJCPsdeyrGau72QbOiwWERGX8QiAEnjTkW20D2weXXwsO9AgSzCVPMOP2edIaK5si0AsodopntH26Al2iBMi7PEGjncYU1t3PDt/e4QlwLrwHWnDnswLtHXqX7hcs0Xe5YuKS6JFYHRerUHpN20suZLVCOopORWPiSA3xHD/7r/IH5VIwdsMWuZPiF037etAkGonRfvrqj8JxfkudQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AtpEKd6Wt6LO0XHPGBYnRut3zHKZHOuJonBbax0oEY=;
 b=F8tYuhKajRmQa/kHo9+F8mqOepVjpHuIUaeNZ5EdWPdGwIcq7qtoam8SR5OfRDXYPqUm9Tl6L/pT60JMzTmeAFfGUmG9I45xY1YFUeHrf+BAHzUMA52y6W8EQqztC5Lh9EOKYetmOkbBQk9/UOZJxfNm+Bq/7eTu3O25w4urmQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
Received: from BL0PR2101MB1092.namprd21.prod.outlook.com
 (2603:10b6:207:37::26) by BL0PR2101MB0883.namprd21.prod.outlook.com
 (2603:10b6:207:36::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.7; Thu, 16 Sep
 2021 19:37:16 +0000
Received: from BL0PR2101MB1092.namprd21.prod.outlook.com
 ([fe80::35fa:e8c:d9:39c3]) by BL0PR2101MB1092.namprd21.prod.outlook.com
 ([fe80::35fa:e8c:d9:39c3%7]) with mapi id 15.20.4544.004; Thu, 16 Sep 2021
 19:37:15 +0000
From: Dexuan Cui <decui@microsoft.com>
To: drawat.floss@gmail.com, haiyangz@microsoft.com, airlied@linux.ie,
 daniel@ffwll.ch, tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>
Subject: [PATCH v2] drm/hyperv: Fix double mouse pointers
Date: Thu, 16 Sep 2021 12:36:44 -0700
Message-Id: <20210916193644.45650-1-decui@microsoft.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: CO2PR07CA0071.namprd07.prod.outlook.com (2603:10b6:100::39)
 To BL0PR2101MB1092.namprd21.prod.outlook.com
 (2603:10b6:207:37::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from decui-u1804.corp.microsoft.com
 (2001:4898:80e8:a:822c:5dff:feb8:fa01) by
 CO2PR07CA0071.namprd07.prod.outlook.com (2603:10b6:100::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 19:37:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13798837-c475-4fea-9757-08d9794962f4
X-MS-TrafficTypeDiagnostic: BL0PR2101MB0883:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR2101MB088356953D431A128CE04E60BFDC9@BL0PR2101MB0883.namprd21.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sAV7nKpQRJGBetKCMOx/5pTDxS1IplCLqK3tjkErejBHuRSQILuH+m48SX9hNi1rAPhUa9rgGyE2EajvuMWreSTTQaLARUOEf4nd4SXWTLBj8teu1bSzdZjOcm4uMg/SEGYmLCaDqCXtgQ2Lzz0On4SN0L9LNr9R6fkc6ycjyk19M2vWqzT8TDW1LM9k3HWHWEg1yQqHKdGkB61wT7UEvndTHKgTlYylRy/3SHQIV576z7BBN+yGDls2qnsDM5ZLPz1nUwBpMhvhquZxqVUeTZYupAGWQ6xAUQhPe7Scw8cbpovzke/jH9ZnRRKIWPKvxkjBbaY+FhPfACr0LDNDSV6jx+gCat+McJLMJemb4C77YZ9RryflgyASFJ03v5FklRbg8mjwvdrFhD3nl4qbk/V3ViLfYFMUWK43aL9SUtuFuim/GhkR+SVBOMzkVT3ER22VQWEX90RsNcE+BDV5kcoNPdi58/S32WFazJP2CglCtu57JNq9xggFah6eSaqRu/F0uYlrdyP6WNbK4ZCvLe83f7hLO3NHcUEexe7F1MCx896/52SdMVBAqmaaNR17UJViMFEskRpHVhrlmeH1xo/hRGisWjoVHd1W0ylq/BGwLvX0RmcdRLcCRBDXHEXO7GMqq+77zHBDWnl/+uexkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR2101MB1092.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(10290500003)(8676002)(66476007)(8936002)(66946007)(508600001)(316002)(5660300002)(186003)(2906002)(6666004)(7696005)(52116002)(36756003)(86362001)(1076003)(83380400001)(66556008)(82960400001)(2616005)(107886003)(82950400001)(4326008)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+8X1pvVxOn7RYbuua96ijJY3UA8AFcu5R2K70QG4CJLwiwuoYk5LOYfwwdRH?=
 =?us-ascii?Q?YXpAE6QLl1IEzS83CWbWYZP3Tnzeg0NAU91qK16v6f/qCVoWlPpdEwzazC/f?=
 =?us-ascii?Q?/fiFqAGg0FoI6/s0CjprmyTnEg4BGY21/22ELWEjinnjJr3Qvb5abO1jkKmN?=
 =?us-ascii?Q?taLBkKewuPBezwjEz5zSMgt2oyHE5kKQiBIdpInMMZPmo0WCwHtNYT1ogvkQ?=
 =?us-ascii?Q?kdRjtPrmW4iRBUplxOm8MTX3RvxuLZpnKzU4sOrCJT4/eldhFWpR3yhwm3C9?=
 =?us-ascii?Q?5TdSuo71waK+QKyWoRMDRkDb88hFPWPCnFYSE0KRPhoc348F0sdAw8KhmUaq?=
 =?us-ascii?Q?KVpIRVXzt+RNjmcIsVAupaFx8lS858IENxPPqb/YkRCYj6UvsuDv5jZslQDY?=
 =?us-ascii?Q?BxXAzkh2Vaz13Q2dc/iEYDd5U37TJLRyAd7+BBHL9cOTY4wZrbOPnlEwyR4r?=
 =?us-ascii?Q?vvAgJO3G1Jnyax99+MzR6vV2STprPzIUCFGnIyZKZN3OgdVVisIRQFAZDMcL?=
 =?us-ascii?Q?O3VjF1qgXvvvwT9gdpzBhXuNegVbTVZyaqZl/aBh8AIj2aZFPk99XW0dI/+Q?=
 =?us-ascii?Q?IQqb7ZULKPxgRMTl6lK3anYtXBLpIRCYxdQdi9yxPFYJQl9VW2d4cK5cP5W3?=
 =?us-ascii?Q?g3Y5JJ8bcwMKqmwF6wRxgmWwt6GehIES2+mqJtL2wsRdEIPgn60B5SP1mBSP?=
 =?us-ascii?Q?sPF1Fk1fsJSWEeJjLbFcc4Fzs+wDirFPeMzURwOQgEYVcXmiYcg92W2b8qsc?=
 =?us-ascii?Q?la5ztJ9bGoHwcWLsu5GEicMvPpBRDS5Bmctfwkn84OrbGe914FaLXNe5RvKF?=
 =?us-ascii?Q?TC2j67WRyiTBjS5GUfJlvADVr5MTND5d5muelKIxRYnSSSg8f+ZbPg8qAUgK?=
 =?us-ascii?Q?1OKDlZzC2OsFNEzWXS7b18zWB8W1ryP0BkbF8HHraLA4EklXJQQzhGRhc+7Y?=
 =?us-ascii?Q?4K58NviAz6D57WJQOAfq8ygSBb9DAgjn0AEvs5a+liX9CP3DftZgd++uqTbk?=
 =?us-ascii?Q?V1JO2fmZRBnmJDvROZg5mRxiwlhRjySAnMabp2YMOQJM7I8znpZHBjFW3Z4x?=
 =?us-ascii?Q?0kJA5wvz/St7+psNy/wRn9wiiI8UZEHOLqXDbUdVjR7JoHe1uEYEzp5fNKNh?=
 =?us-ascii?Q?/0BfXKrBf2DiTmPRYeN28nU1G4Q+pbiIhuWEJC2lAP3ng8CedkY5hky0uJ/r?=
 =?us-ascii?Q?69OgqmoUcMNBvC8dNEdm5PBWT4SjIq8OttLbVaAItaw3RzH68hVEBcHSdwaq?=
 =?us-ascii?Q?RBwwtZJDJvlW1uK1olrR82EVQkrtO9QkodSnSeRg8xvPSTqABwKhza3BJB40?=
 =?us-ascii?Q?+1nVniyb8bV9JRK/+QPec/42GVOz977/FGL+pRJWTajoWDU+NQ3Su5iFyjsn?=
 =?us-ascii?Q?5LkxEC2JZupTobUqe3KC4FPbJMxS?=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13798837-c475-4fea-9757-08d9794962f4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR2101MB1092.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 19:37:15.8510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8WShlWogxliSfGQxAElW8bLC3Rm05EEcfjv/G5ge7GgIRtDjmF1etBiLwakfNKsvx8ERnvvcSQNgc2TxO7w/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR2101MB0883
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

Hyper-V supports a hardware cursor feature. It is not used by Linux VM,
but the Hyper-V host still draws a point as an extra mouse pointer,
which is unwanted, especially when Xorg is running.

The hyperv_fb driver uses synthvid_send_ptr() to hide the unwanted pointer.
When the hyperv_drm driver was developed, the function synthvid_send_ptr()
was not copied from the hyperv_fb driver. Fix the issue by adding the
function into hyperv_drm.

Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic video device")
Signed-off-by: Dexuan Cui <decui@microsoft.com>
Reviewed-by: Haiyang Zhang <haiyangz@microsoft.com>
Reviewed-by: Deepak Rawat <drawat.floss@gmail.com>
---

Changes in v2:
	Renamed hyperv_send_ptr() to hyperv_hide_hw_ptr().
	Improved the comments and the git commit message.
	Added Reviewed-by's from Haiyang and Deepak.

 drivers/gpu/drm/hyperv/hyperv_drm.h         |  1 +
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  1 +
 drivers/gpu/drm/hyperv/hyperv_drm_proto.c   | 54 ++++++++++++++++++++-
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm.h b/drivers/gpu/drm/hyperv/hyperv_drm.h
index 886add4f9cd0..d2d8582b36df 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm.h
+++ b/drivers/gpu/drm/hyperv/hyperv_drm.h
@@ -46,6 +46,7 @@ int hyperv_mode_config_init(struct hyperv_drm_device *hv);
 int hyperv_update_vram_location(struct hv_device *hdev, phys_addr_t vram_pp);
 int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp,
 			    u32 w, u32 h, u32 pitch);
+int hyperv_hide_hw_ptr(struct hv_device *hdev);
 int hyperv_update_dirt(struct hv_device *hdev, struct drm_rect *rect);
 int hyperv_connect_vsp(struct hv_device *hdev);
 
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 3aaee4730ec6..5f01ca817517 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -101,6 +101,7 @@ static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 
+	hyperv_hide_hw_ptr(hv->hdev);
 	hyperv_update_situation(hv->hdev, 1,  hv->screen_depth,
 				crtc_state->mode.hdisplay,
 				crtc_state->mode.vdisplay,
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
index 6d4bdccfbd1a..c0155c6271bf 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
@@ -299,6 +299,55 @@ int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp,
 	return 0;
 }
 
+/*
+ * Hyper-V supports a hardware cursor feature. It's not used by Linux VM,
+ * but the Hyper-V host still draws a point as an extra mouse pointer,
+ * which is unwanted, especially when Xorg is running.
+ *
+ * The hyperv_fb driver uses synthvid_send_ptr() to hide the unwanted
+ * pointer, by setting msg.ptr_pos.is_visible = 1 and setting the
+ * msg.ptr_shape.data. Note: setting msg.ptr_pos.is_visible to 0 doesn't
+ * work in tests.
+ *
+ * Copy synthvid_send_ptr() to hyperv_drm and rename it to
+ * hyperv_hide_hw_ptr(). Note: hyperv_hide_hw_ptr() is also called in the
+ * handler of the SYNTHVID_FEATURE_CHANGE event, otherwise the host still
+ * draws an extra unwanted mouse pointer after the VM Connection window is
+ * closed and reopened.
+ */
+int hyperv_hide_hw_ptr(struct hv_device *hdev)
+{
+	struct synthvid_msg msg;
+
+	memset(&msg, 0, sizeof(struct synthvid_msg));
+	msg.vid_hdr.type = SYNTHVID_POINTER_POSITION;
+	msg.vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
+		sizeof(struct synthvid_pointer_position);
+	msg.ptr_pos.is_visible = 1;
+	msg.ptr_pos.video_output = 0;
+	msg.ptr_pos.image_x = 0;
+	msg.ptr_pos.image_y = 0;
+	hyperv_sendpacket(hdev, &msg);
+
+	memset(&msg, 0, sizeof(struct synthvid_msg));
+	msg.vid_hdr.type = SYNTHVID_POINTER_SHAPE;
+	msg.vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
+		sizeof(struct synthvid_pointer_shape);
+	msg.ptr_shape.part_idx = SYNTHVID_CURSOR_COMPLETE;
+	msg.ptr_shape.is_argb = 1;
+	msg.ptr_shape.width = 1;
+	msg.ptr_shape.height = 1;
+	msg.ptr_shape.hot_x = 0;
+	msg.ptr_shape.hot_y = 0;
+	msg.ptr_shape.data[0] = 0;
+	msg.ptr_shape.data[1] = 1;
+	msg.ptr_shape.data[2] = 1;
+	msg.ptr_shape.data[3] = 1;
+	hyperv_sendpacket(hdev, &msg);
+
+	return 0;
+}
+
 int hyperv_update_dirt(struct hv_device *hdev, struct drm_rect *rect)
 {
 	struct hyperv_drm_device *hv = hv_get_drvdata(hdev);
@@ -392,8 +441,11 @@ static void hyperv_receive_sub(struct hv_device *hdev)
 		return;
 	}
 
-	if (msg->vid_hdr.type == SYNTHVID_FEATURE_CHANGE)
+	if (msg->vid_hdr.type == SYNTHVID_FEATURE_CHANGE) {
 		hv->dirt_needed = msg->feature_chg.is_dirt_needed;
+		if (hv->dirt_needed)
+			hyperv_hide_hw_ptr(hv->hdev);
+	}
 }
 
 static void hyperv_receive(void *ctx)
-- 
2.25.1

