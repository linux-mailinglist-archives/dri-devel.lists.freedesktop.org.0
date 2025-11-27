Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040C9C8ECF0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 15:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A5510E81A;
	Thu, 27 Nov 2025 14:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF9310E804
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 14:44:00 +0000 (UTC)
Received: from [192.168.2.104] (213.87.138.55) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 27 Nov
 2025 17:43:56 +0300
Message-ID: <8753beda-f74c-41b5-b9ad-823fdf227215@omp.ru>
Date: Thu, 27 Nov 2025 17:43:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] drm/rockchip: vop: avoid division by 0 in scl_cal_scale*()
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-rockchip@lists.infradead.org>
CC: Mark Yao <markyao0591@gmail.com>, <linux-arm-kernel@lists.infradead.org>, 
 Karina Yankevich <k.yankevich@omp.ru>, <lvc-project@linuxtesting.org>
Content-Language: en-US
Organization: Open Mobile Platform
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.138.55]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 11/27/2025 14:27:21
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 198483 [Nov 27 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.20
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 81 0.3.81
 2adfceff315e7344370a427642ad41a4cfd99e1f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: omp.ru:7.1.1; 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; lore.kernel.org:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.138.55
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/27/2025 14:30:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/27/2025 9:47:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
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

In scl_cal_scale*(), if the dst parameter equals 1, then division by 0
will happen. We'll have to add a check for the destination rectangle's
width/height being < 2 in vop_plane_atomic_check(), just like the VOP2
driver has to check for the width/height being < 4...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: 4c156c21c794 ("drm/rockchip: vop: support plane scale")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: stable@vger.kernel.org

---
The patch is against the drm-misc-fixes branch of the DRM kernel.git repo
on gitlab.freedesktop.org.  It replaces [1] for which I've got no neither
feedback nor testing...

[1] https://lore.kernel.org/all/40da59f8-10e9-49b0-9f25-1474067625f6@omp.ru/

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

Index: kernel/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
===================================================================
--- kernel.orig/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ kernel/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -817,6 +817,7 @@ static int vop_plane_atomic_check(struct
 	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct vop_win *vop_win = to_vop_win(plane);
 	const struct vop_win_data *win = vop_win->data;
+	struct drm_rect *dest = &new_plane_state->dst;
 	int ret;
 	int min_scale = win->phy->scl ? FRAC_16_16(1, 8) :
 					DRM_PLANE_NO_SCALING;
@@ -844,6 +845,16 @@ static int vop_plane_atomic_check(struct
 	if (ret < 0)
 		return ret;
 
+	if (win->phy->scl) {
+		/* Disallow width/height < 2 to avoid division by 0. */
+		if (drm_rect_width(dest) < 2 || drm_rect_height(dest) < 2) {
+			DRM_DEBUG_KMS("Invalid dest size: %dx%d, min size is 2x2\n",
+				      drm_rect_width(dest), drm_rect_height(dest));
+			new_plane_state->visible = false;
+			return 0;
+		}
+	}
+
 	/*
 	 * Src.x1 can be odd when do clip, but yuv plane start point
 	 * need align with 2 pixel.
