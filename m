Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4CF584C97
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 09:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE15A11BBF4;
	Fri, 29 Jul 2022 07:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFAE10E3D4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 03:07:25 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 v16-20020a17090abb9000b001f25244c65dso7124001pjr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 20:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=/bj/HFjlvdzWAwaKGeJWan4W18fyurkPYnx0vp3mPEc=;
 b=nWMmGmdPylDPR6IwAxUJE5pDmDKXWhOIw9zoHac472oCO7QIDV6RjVfcz27GK+rofK
 SgNpPGrbkCa5BFz1jrP1JJRJUShhzePJH3DyJu61IOrA28GDpSQZQRHcDu4wQ60JOKko
 5zxhIQlDUv02hTvArGuYB9cdDfcIobG46VY0FZiizcjf7f2ggxPa6Az4LO17OxzvGRK7
 8HPYmLTtwbzu7P7A5ultruEB+okutnyW60rsc76xDJye6L4bq6svQaBQiBSUj0UInJha
 aRSRSoKk30uLIeIqAXRr0LIqbgQjyX5VXNpbxE3/OPTqMoc/7Y9rqi1J0lQcHA+OcCU9
 FGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=/bj/HFjlvdzWAwaKGeJWan4W18fyurkPYnx0vp3mPEc=;
 b=1XYb2x/OOZU+bjyW1uRuja+8pN+pjKc6hQjSzVpEbEckUx/+VaU3Lvv3K+23jWeJNw
 pMpn1gE61YcKg+or9KSabMVZnJN0RA8sAmmhCYKZB6JsOGYr7NtbyWnjrBCEKGjBopp7
 snDmQ4P6mxZsCbxnkE2BOrQdogi3MKfRVczgwHpzJAoTzuhyin9QKHrE2cxSolxti0ig
 3GRUB2ufK1ewd10b/DilMGFHUhAMPC91t9vvPwdMlcgaLCoScpPR+mRx5Sc+2eDUFAGM
 oOpraYzjmH9qvV7lRdghfM/lHhzOSsPrhnvzAHO+OOSUToH5aWuhr63FwvVuGt6xEEyO
 GY8A==
X-Gm-Message-State: ACgBeo3dLNqic62I0eMeWQFKQ0/1VlsBYM44ArJD0S3i7Z4yGkCs45YQ
 uS5R78NSsWSyH3C4tVenneI=
X-Google-Smtp-Source: AA6agR4ARLUAdHCZKXVTOmkIcL9bCDml33KQaHTIyebmEXYgvCJCxVJrMQOd1kpJMPZ190YyyNQ/Dw==
X-Received: by 2002:a17:902:e78f:b0:16c:8741:fea1 with SMTP id
 cp15-20020a170902e78f00b0016c8741fea1mr1776411plb.89.1659064045282; 
 Thu, 28 Jul 2022 20:07:25 -0700 (PDT)
Received: from localhost.localdomain ([43.132.141.3])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090ab94b00b001f0097c2fb2sm825062pjw.28.2022.07.28.20.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 20:07:24 -0700 (PDT)
From: Zeng Jingxiang <zengjx95@gmail.com>
To: anitha.chrisanthus@intel.com, edmund.j.dea@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, tzimmermann@suse.de, laurent.pinchart@ideasonboard.com,
 maxime@cerno.tech, ville.syrjala@linux.intel.com
Subject: [PATCH] drm/kmb: fix dereference before NULL check in
 kmb_plane_atomic_update()
Date: Fri, 29 Jul 2022 11:07:11 +0800
Message-Id: <20220729030711.2117849-1-zengjx95@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Jul 2022 07:30:13 +0000
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
Cc: Zeng Jingxiang <linuszeng@tencent.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zeng Jingxiang <linuszeng@tencent.com>

The "plane" pointer was access before checking if it was NULL.

The drm_atomic_get_old_plane_state() function will dereference
the pointer "plane".
345	struct drm_plane_state *old_plane_state =
		drm_atomic_get_old_plane_state(state, plane);
346	struct drm_plane_state *new_plane_state =
		drm_atomic_get_new_plane_state(state, plane);

A NULL check for "plane" indicates that it may be NULL
363	if (!plane || !new_plane_state || !old_plane_state)

Fixes: 977697e20b3d ("drm/atomic: Pass the full state to planes atomic disable and update")
Fixes: 37418bf14c13 ("drm: Use state helper instead of the plane state pointer")
Signed-off-by: Zeng Jingxiang <linuszeng@tencent.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 2735b8eb3537..d2bc998b65ce 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -342,10 +342,7 @@ static void kmb_plane_set_alpha(struct kmb_drm_private *kmb,
 static void kmb_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_atomic_state *state)
 {
-	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
-										 plane);
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
-										 plane);
+	struct drm_plane_state *old_plane_state, *new_plane_state;
 	struct drm_framebuffer *fb;
 	struct kmb_drm_private *kmb;
 	unsigned int width;
@@ -360,7 +357,13 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	static dma_addr_t addr[MAX_SUB_PLANES];
 	struct disp_cfg *init_disp_cfg;
 
-	if (!plane || !new_plane_state || !old_plane_state)
+	if (!plane)
+		return;
+
+	old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+
+	if (!new_plane_state || !old_plane_state)
 		return;
 
 	fb = new_plane_state->fb;
-- 
2.27.0

