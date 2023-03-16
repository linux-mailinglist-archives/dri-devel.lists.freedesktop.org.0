Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1536BD0B8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 14:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586B610E13E;
	Thu, 16 Mar 2023 13:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FD310E13E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 13:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678972991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lOSbCq91ofT9YXvZbpEo/wG2mXE51QVka7uRfgSRss4=;
 b=VVNXWFClvGMR0M+ijUEySciHtnJSvcWpCQa24qYzJxw5jX8+WV+voJ3U0RLmTn/kFy85c2
 rR6Q9JtURnGFLczs7iHuDxAArL0dcJS+6sEhtD5X0q5Id0JVpgewSzKW6+JvgcQdcslZJR
 CuA+s4IXH8mGjfmMJk1MeRGhHVzrDOg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-vjsWlwAAOniQPiXWrDcxyg-1; Thu, 16 Mar 2023 09:23:08 -0400
X-MC-Unique: vjsWlwAAOniQPiXWrDcxyg-1
Received: by mail-qv1-f70.google.com with SMTP id
 g14-20020ad457ae000000b005aab630eb8eso1043798qvx.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 06:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678972988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lOSbCq91ofT9YXvZbpEo/wG2mXE51QVka7uRfgSRss4=;
 b=PMfAEe/dZ3xPeDeU/qmHDjU0xW5rwx82FyFrz9YU3df/Ob64z593IKLKwBolR4b2sj
 cul2u8tQsa7aFV0j/56ACA1vfRw7bbyb4wAZMp2R8xLu34o5Qq6Yg5aUHTT8BqZ1Plxc
 F+i8ZHUe2nwaJSaCytNTSOP8paAzdffqQY8w5paPTTNaH1DBqm+/r54A29iTrZO3bsqX
 zFMft9Fs7BWhNzmh8pTiNKb3I1sgccsIEBhNzKiPMQq5rxuLHWgjIFG+12b9CGBLNE1S
 SMs5uyke4ZbLvZLOIf6mm1lOr5tvMgDt69PnMNIP6DxUm4Z1sbFvhxKz5odgI5VWih0c
 cf7Q==
X-Gm-Message-State: AO0yUKVClsbGhSQmVPkxw81Hso3hObAHsLYtzxIaFQdc5cShen9E/b61
 WyhBdIMRVR/SPhxCmvm4jVfV7txgQSFYdG0BA6Mbu+FY67B5qIMPMuC8YH0m/EiRvhs1vQT59HM
 CiTGN82t3g3PzwbkGk3G5YDKlDRMM
X-Received: by 2002:ad4:5aee:0:b0:56e:ab08:670d with SMTP id
 c14-20020ad45aee000000b0056eab08670dmr32716486qvh.42.1678972988192; 
 Thu, 16 Mar 2023 06:23:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set9dA/70KxjQEA+7BPyUihfyAvubVJ/nAiMbXTzj0PTIRAeQbYujxRy3jSIUcu6bo4xiaMqL1g==
X-Received: by 2002:ad4:5aee:0:b0:56e:ab08:670d with SMTP id
 c14-20020ad45aee000000b0056eab08670dmr32716450qvh.42.1678972987917; 
 Thu, 16 Mar 2023 06:23:07 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 g187-20020a37b6c4000000b00743592b4745sm5803599qkf.109.2023.03.16.06.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 06:23:07 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: hjc@rock-chips.com, heiko@sntech.de, airlied@gmail.com, daniel@ffwll.ch,
 nathan@kernel.org, ndesaulniers@google.com, michael.riesch@wolfvision.net,
 s.hauer@pengutronix.de
Subject: [PATCH] drm/rockchip: vop2: fix uninitialized variable possible_crtcs
Date: Thu, 16 Mar 2023 09:23:02 -0400
Message-Id: <20230316132302.531724-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang reportes this error
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error:
  variable 'possible_crtcs' is used uninitialized whenever 'if'
  condition is false [-Werror,-Wsometimes-uninitialized]
                        if (vp) {
                            ^~
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2336:36: note:
  uninitialized use occurs here
                ret = vop2_plane_init(vop2, win, possible_crtcs);
                                                 ^~~~~~~~~~~~~~
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:4:
  note: remove the 'if' if its condition is always true
                        if (vp) {
                        ^~~~~~~~

The else-statement changes the win->type to OVERLAY without setting the
possible_crtcs variable.  Rework the block, initialize possible_crtcs to
0 to remove the else-statement.  Split the else-if-statement out to its
own if-statement so the OVERLAY check will catch when the win-type has
been changed.

Fixes: 368419a2d429 ("drm/rockchip: vop2: initialize possible_crtcs properly")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 03ca32cd2050..fce992c3506f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2301,7 +2301,7 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 	nvp = 0;
 	for (i = 0; i < vop2->registered_num_wins; i++) {
 		struct vop2_win *win = &vop2->win[i];
-		u32 possible_crtcs;
+		u32 possible_crtcs = 0;
 
 		if (vop2->data->soc_id == 3566) {
 			/*
@@ -2327,12 +2327,11 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 				/* change the unused primary window to overlay window */
 				win->type = DRM_PLANE_TYPE_OVERLAY;
 			}
-		} else if (win->type == DRM_PLANE_TYPE_OVERLAY) {
-			possible_crtcs = (1 << nvps) - 1;
-		} else {
-			possible_crtcs = 0;
 		}
 
+		if (win->type == DRM_PLANE_TYPE_OVERLAY)
+			possible_crtcs = (1 << nvps) - 1;
+
 		ret = vop2_plane_init(vop2, win, possible_crtcs);
 		if (ret) {
 			drm_err(vop2->drm, "failed to init plane %s: %d\n",
-- 
2.27.0

