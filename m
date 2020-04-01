Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0619BC77
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ED76E9E2;
	Thu,  2 Apr 2020 07:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBCE6E983
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 18:39:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t7so1235530wrw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 11:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s+0qMWPURgX42zh09pciYp0J7m6V5Uv4zkVcAjn0XxI=;
 b=AzKQlF5Ve0QULkkmJo8+FCSuEI7sDa2v5oBHMNHPbbadnzqiwULQ/rPk84Xc4ie4Wl
 B5g9pOC8q1JjOGSNL8SzcHcxt2ZIZI7eXSJJE0IYk42DUbkNRzXoi053cTpflIVQpMZA
 9wPdB2/aPlcsBXhpYzPM4oZJzN9zeNlvpE7fsJAqE6pzq3encHRDw/MBI+zLsxGxIgp6
 RpE2JoiV5IFTB3jKgs7JHe2remydWcfa2ghWdw6UUXukMZi/glSH4s46vWEHTz83Fqw/
 U3IMO+n74hypDNi6d+AT4PiDkfVc1kuysLpijAMUJ2VfK6IWDgyAQcJEHCUIBu+pSnsy
 QGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s+0qMWPURgX42zh09pciYp0J7m6V5Uv4zkVcAjn0XxI=;
 b=guPjMa/nn7+BVANq2eaZZc6/LctpLY28MJG7zBWLhext3RyI7qDjUNiMolEk4BJLdz
 hFABhOLi5I+cJIaFVhDVyuF/gAfI9oRLZN+3n4zWsfYWHf//mo9FSYAICc49ffGSdgCL
 iaHFLdHnKL7SBk+/vqm4l4yVhtYcx28WNxrfoQK7q/nrYbrti5fXrYfXNjPA1CjWlTWF
 apOi5I81Xd3JekTNHiEhVtTFt7wmeqNlrDlyLWznA5A4QP4oFQLJuKEC5jmMdtPJYD4K
 xzNfYGGGEpxO5sSOTykmereXTMyl4jb5Z33cF7xCqjNXaIo13RO++/LaqVEM91/aMxlr
 gCsQ==
X-Gm-Message-State: ANhLgQ0r5ww/BJ8subLMZNWLwY2C9Xxf2XCyLdkQZ1UyRyOC/qWs8oo9
 bXV6AiLvCqH+yLsiGFrJGlPeDs8RVNQ=
X-Google-Smtp-Source: ADFU+vt75jpR2PeZOSbSYbh7PxM85aPN5rNp+vUqqPDoirm89pzRN5iOv3WJ/hcCi6lYatHSQK7Hqg==
X-Received: by 2002:adf:dd10:: with SMTP id a16mr26756323wrm.26.1585766341333; 
 Wed, 01 Apr 2020 11:39:01 -0700 (PDT)
Received: from brihaspati.fritz.box (p5DE52E4E.dip0.t-ipconnect.de.
 [93.229.46.78])
 by smtp.gmail.com with ESMTPSA id b11sm3976973wrq.26.2020.04.01.11.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 11:39:00 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/bochs: use drm_gem_vram_offset to get bo offset v2
Date: Wed,  1 Apr 2020 20:42:46 +0200
Message-Id: <20200401184247.16643-8-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401184247.16643-1-nirmoy.das@amd.com>
References: <20200401184247.16643-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Apr 2020 07:17:56 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, alexander.deucher@amd.com,
 sean@poorly.run, christian.koenig@amd.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch over to GEM VRAM's implementation to retrieve bo->offset.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/bochs/bochs_kms.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 7f4bcfad87e9..25a23e983b7c 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -29,16 +29,21 @@ static void bochs_plane_update(struct bochs_device *bochs,
 			       struct drm_plane_state *state)
 {
 	struct drm_gem_vram_object *gbo;
+	s64 gpu_addr;
 
 	if (!state->fb || !bochs->stride)
 		return;
 
 	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
+	gpu_addr = drm_gem_vram_offset(gbo);
+	if (WARN_ON_ONCE(gpu_addr < 0))
+		return; /* Bug: we didn't pin the BO to VRAM in prepare_fb. */
+
 	bochs_hw_setbase(bochs,
 			 state->crtc_x,
 			 state->crtc_y,
 			 state->fb->pitches[0],
-			 state->fb->offsets[0] + gbo->bo.offset);
+			 state->fb->offsets[0] + gpu_addr);
 	bochs_hw_setformat(bochs, state->fb->format);
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
