Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 590CE409C30
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 20:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441476E219;
	Mon, 13 Sep 2021 18:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-oln040093003012.outbound.protection.outlook.com [40.93.3.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B10D6E219
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 18:27:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmK+JWPO0dnZVTC5qcNiGi4Ayu6RyU+8ki7aQNCOnsfJzMBK6E7VOyGizQgffwyRsbHArg2AqJHeCccsUBpvAJN3XgxU6NWQyMFrLToRKW2cWrVNl5/bEvdR33+JOn4idvBJ8mI+iYOBwkYKZ50mb4DAKVOwWIPKzqRK4KITbQjrOExMWjXssQAgO4Lba/KUh054ZLnHrS5Mm10LYSOb+0Jskt0iHg7nBWrCaYTGH3WoXcgLEtnaxw7X0jnd8mXH1jGH0tu2xMK3a1wfr+e5mWnTKtz6L8w45HeImFsrCGQtLx7AIr1xS+av3z8MBmOR7vOYdaO16kBOeErVwDqvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=TM5leLNmnmw/Hp8H9EfabCaP0N4tM62Zh7h84dlHb6g=;
 b=Av9hhaet32SGq6REpGbygwAbKCa3x6C2GNGftkhy2yPgrySgcQex4lmv9onEsxEmYRF4yrWdoHVix9jxyQewM4GKVB0HRNJPWpkOkCBs8mcss1WQ5Q5ZSHIa7Sb4wkp3SnFxeBnt0Mev4FrbZFZpuzjCYoq61eXnVqUoO7WyWBXJViuAaOeoib7i7rND4LrdnU1h0nffpNTzSpzgJZyLPOf27NoIZOKWsJtkzfQKq3YJ24GqVQsrsU7nAHqcZ64pQzgk5wad4KX/Oc+OyI1ETjDQeNmhphIfDT63/EF5ziakNmG8mcch2NpHvEord9uLRbnL3VvSVBGVheF+gmITYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM5leLNmnmw/Hp8H9EfabCaP0N4tM62Zh7h84dlHb6g=;
 b=eGP7tIU0Bi7r+jdD015dNZopdZ4z8qcM2CizQYLyFnYeZJvJk/LVxiGOtLK+Z3oriuUeaGAm7deSV2/g6QEeioi6FvOVZZEPyOoyiPI0dE2BBS6YcD/PXflQdi12V/AhzXzTD5DtTjHL9pIvsd74LrkDkAgBkcMDHFMKPcqQDcY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
Received: from BL0PR2101MB1092.namprd21.prod.outlook.com
 (2603:10b6:207:37::26) by MN2PR21MB1501.namprd21.prod.outlook.com
 (2603:10b6:208:1f6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.2; Mon, 13 Sep
 2021 18:27:27 +0000
Received: from BL0PR2101MB1092.namprd21.prod.outlook.com
 ([fe80::35fa:e8c:d9:39c3]) by BL0PR2101MB1092.namprd21.prod.outlook.com
 ([fe80::35fa:e8c:d9:39c3%7]) with mapi id 15.20.4544.004; Mon, 13 Sep 2021
 18:27:27 +0000
From: Dexuan Cui <decui@microsoft.com>
To: drawat.floss@gmail.com, haiyangz@microsoft.com, airlied@linux.ie,
 daniel@ffwll.ch, tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>
Subject: [PATCH] drm/hyperv: Fix double mouse pointers
Date: Mon, 13 Sep 2021 11:26:45 -0700
Message-Id: <20210913182645.17075-1-decui@microsoft.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MWHPR1401CA0010.namprd14.prod.outlook.com
 (2603:10b6:301:4b::20) To BL0PR2101MB1092.namprd21.prod.outlook.com
 (2603:10b6:207:37::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from decui-u1804.corp.microsoft.com
 (2001:4898:80e8:9:822d:5dff:feb8:fa01) by
 MWHPR1401CA0010.namprd14.prod.outlook.com (2603:10b6:301:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 18:27:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 920b8603-62b2-4992-c149-08d976e4237d
X-MS-TrafficTypeDiagnostic: MN2PR21MB1501:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR21MB1501BA82CE26A6FF30ADDBE3BFD99@MN2PR21MB1501.namprd21.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 80hNAOIZPL94KAkU6OwyoyWXUmtAkkyExonloV9DnyZVNFD4s0Ho/VMO8Wa1e8F12PoX/NZHxdBAhvFQPd5O27+Yb7WR3KmKe7Iambeqofez5M1nBxs17xcE2IjNWmqXGpvzDOX+J80MrZlhtzue6loYJ3OiBJBAxuOBgJG72jDIYH2xhwxXUskxb6z6wqUIEoGfJsLFqgXIDeETtq/0GL/MVmvhrgWO+QnHEbKazPAN0dfwMafwXQHuwGHRuzZVnS8hOYtz9XozBPaaDW4aBIyB7S4z/vaGl0HsmtnYTwR7UW4JCxzL/twjFJucJMPIHTKbQFwK1HgE0XvPcQdA/t/yhYInXf3ihH5F9wnIEnhsTBWqz8cQyHabGe+pRjEp48PtBY5QnNnuO3MTHCV7EIsH+XmKmRj6Vo3AYHwxt5hCI4v2ql6ebhj4fm4EXS8urOYgpCKTkyhPjpFTb2DBdJEQh89TDmv2C3LI0OF49rHxT/odKARHX1/GVFP875ldVljZhKWFY028smlDKbhSLU013+amLx/hhb6Coiwh/it8ULtbpr9z7M3L5Pc2H293EHpuRyFfRPOvfcVVXW5NI067CFnTwkUY5BJxPDuP+rMwOa/GS2VRb39gJomqcoHaXtzqAMQu9Z6Hb6rbZuCpgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR2101MB1092.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(8676002)(6486002)(2616005)(107886003)(66556008)(5660300002)(186003)(508600001)(66946007)(6666004)(316002)(10290500003)(82960400001)(38100700002)(36756003)(52116002)(86362001)(2906002)(7696005)(66476007)(8936002)(82950400001)(1076003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?84tk34Xp1xxlO76GAgd9e8cA2Wp3n/F+US1RuwX4YBHmT3CeTaVYMO/jlcLG?=
 =?us-ascii?Q?by3ncTmklVviUMPBfKO4FCVkrDz8DU4iMGYdvJ435PztVKGqQallhJuPyJL+?=
 =?us-ascii?Q?I82FTdfAhaRugrKY/INQvVAjjIysLvM6DkiA3KV1Ct5y7pG5jaRQ2GFwfd0i?=
 =?us-ascii?Q?Le6lZpS0csl9K1G7RU3xWcIHmpb8S7pDMStvguY32Mpv0UxMfoGqomBSBkc5?=
 =?us-ascii?Q?mjoBtVK3bpMmdEkW81vCul6cViYRkxVOdahhoMnm4HLDgMlnoHm3kaRiz1cF?=
 =?us-ascii?Q?xUao3PunCgIJPMZiWIE+giGAUYfgmO00jXGN3MwSomElKA158aZArlQ+qmTs?=
 =?us-ascii?Q?K7mYImVxlrlN82Hia3qdDfptDfxY0cESvcbzQa0qE1BV7Zz8Y0ztPwWm2b2C?=
 =?us-ascii?Q?6PkE/8Dq+E0+Oeltjn2u+eZuxrxbScmzMB6qRuIg5iIO7dA7eAOV69t8m5jL?=
 =?us-ascii?Q?i53XimzSZxUDMDnVlMrpU6Fv+Ck9jBTPWEiB4BdjlTUq1BIWGjA3lRnfoSc+?=
 =?us-ascii?Q?SQvMi8AjhQTOSdXTF7SJuHNaFI0ArHNq7Wi9eZKOJ358aRp+LL8GEmh7ZeFk?=
 =?us-ascii?Q?0XFk2FUr2kOjdmMgtuZcGcBnJDoMUtzeA7Bi9XaUVB/mB7ZRZ25PHj/8+/rs?=
 =?us-ascii?Q?IRPbc0LBC6jqBRyBcG80mLMarjiuu3fyW5Ws2Ps+uSh813X7UFE19HFrxfBn?=
 =?us-ascii?Q?5qPTPy7e9RBhYjWbWO76FYOsAYdXHwSKe8V0ZmVpXo4jCirOVslXkjfRz8xL?=
 =?us-ascii?Q?G3muk5MEjuvEd07AK4hoZ+UY3U9fhGSleLes0ERAL0HfdOR85w2e1fTL0jM2?=
 =?us-ascii?Q?TsmFG6LplY1eZ60qlr89TIhURD3tEXQHY5y0emClbbAYrWlFlXGCZy3s84Na?=
 =?us-ascii?Q?4r4H5SK8f9S0leXmzoNCts1SbDWZ5QcaNzlETont3HsJgJee5HIcASpc6g8Q?=
 =?us-ascii?Q?sjBxj8qKYs4jtltUoUMQqBgKEa53QGzSF06yTubQZrok4e90YvPbUrD2WGgY?=
 =?us-ascii?Q?TZuMMrP6YdXdiO4mJoMWAczj9m67870n7tHjq0oF1a28jhpSqqB5CP3gtGon?=
 =?us-ascii?Q?tZcrUv9dA6gy2Te713R3TxD4fQ+qFv9UhBoqDBf4x65FTKfdgJWDlC7f15G/?=
 =?us-ascii?Q?+TWZKgHERoru8sj0BBtqNVzV7sVRtOyrIa/78nrXZvA3LNhMXhrq2s0Kq8Ih?=
 =?us-ascii?Q?hPMce27mP5+Jny+Tnof7BG5d2C8WGbKZ4ZllpbitEUFQn+DvqE72Blu167Qy?=
 =?us-ascii?Q?oeCmmdzds2CWi0dCAymZ/kDctR/tnfjj2qWg2ahjM1imiMR9mNO6z+dbdkrU?=
 =?us-ascii?Q?0h2gJjyOtpt5sGtUd+N9NMs7n9NGGC/kwWSR4zCa3J+5ttdjmkRsuru/Vool?=
 =?us-ascii?Q?OBSVzVuNtrEDV/z7L6lmpkK0FX4q?=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 920b8603-62b2-4992-c149-08d976e4237d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR2101MB1092.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 18:27:27.4957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCuXEs4duunh695PcMCaDVAFhHBgHK+8SyxL2O825Xx5VFvSKAnef648VBj+a1tmJSZKWZVX8957Gu+Bb5FoWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR21MB1501
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

It looks like Hyper-V supports a hardware cursor feature. It is not used
by Linux VM, but the Hyper-V host still draws a point as an extra mouse
pointer, which is unwanted, especially when Xorg is running.

The hyperv_fb driver uses synthvid_send_ptr() to hide the unwanted pointer.
When the hyperv_drm driver was developed, the function synthvid_send_ptr()
was not copied from the hyperv_fb driver. Fix the issue by adding the
function into hyperv_drm.

Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic video device")
Signed-off-by: Dexuan Cui <decui@microsoft.com>
Cc: Deepak Rawat <drawat.floss@gmail.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm.h         |  1 +
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  1 +
 drivers/gpu/drm/hyperv/hyperv_drm_proto.c   | 39 ++++++++++++++++++++-
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm.h b/drivers/gpu/drm/hyperv/hyperv_drm.h
index 886add4f9cd0..27bfd27c05be 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm.h
+++ b/drivers/gpu/drm/hyperv/hyperv_drm.h
@@ -46,6 +46,7 @@ int hyperv_mode_config_init(struct hyperv_drm_device *hv);
 int hyperv_update_vram_location(struct hv_device *hdev, phys_addr_t vram_pp);
 int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp,
 			    u32 w, u32 h, u32 pitch);
+int hyperv_send_ptr(struct hv_device *hdev);
 int hyperv_update_dirt(struct hv_device *hdev, struct drm_rect *rect);
 int hyperv_connect_vsp(struct hv_device *hdev);
 
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 3aaee4730ec6..e21c82cf3326 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -101,6 +101,7 @@ static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 
+	hyperv_send_ptr(hv->hdev);
 	hyperv_update_situation(hv->hdev, 1,  hv->screen_depth,
 				crtc_state->mode.hdisplay,
 				crtc_state->mode.vdisplay,
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
index 6d4bdccfbd1a..1ea7a0432320 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
@@ -299,6 +299,40 @@ int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp,
 	return 0;
 }
 
+/* Send mouse pointer info to host */
+int hyperv_send_ptr(struct hv_device *hdev)
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
@@ -392,8 +426,11 @@ static void hyperv_receive_sub(struct hv_device *hdev)
 		return;
 	}
 
-	if (msg->vid_hdr.type == SYNTHVID_FEATURE_CHANGE)
+	if (msg->vid_hdr.type == SYNTHVID_FEATURE_CHANGE) {
 		hv->dirt_needed = msg->feature_chg.is_dirt_needed;
+		if (hv->dirt_needed)
+			hyperv_send_ptr(hv->hdev);
+	}
 }
 
 static void hyperv_receive(void *ctx)
-- 
2.25.1

