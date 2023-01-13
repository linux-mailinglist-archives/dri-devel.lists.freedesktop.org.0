Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D5669581
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 12:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B64010E9EC;
	Fri, 13 Jan 2023 11:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5685610E9E2;
 Fri, 13 Jan 2023 11:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6XeSl7wi55EK/GcJ80AIBwpDhIHeyNAljXv8nYVrQ34=; b=Vn1gPqhAssT+krCMnZ0kO/Mj27
 2g2kUOC4kln2GsAf9MBfeBd6jaq4qvtjdRZaHkd/Lf3J++1pCSsQlEB/R84mSbGP36PwjrnU7EwMF
 CfvYEy2WtDmPP4zE5Tjrakb2PCoFqLFIpwqatTzl/MQXVJqCbuhJSkN+c45BDv+sozXhIJA8eYady
 mb8NfWTtItDWPqv6ItHUuRIlxtypz7O4gArWUH3jPp4TQFNVEP7V85ZfFWqSrxbULKDR2hBLHo8io
 0cCha12fL6M8C+XYzUhGArAOhpryvRWSwIrMgTKTiz5PNESljK4K2tKcsll9Wt5Tu062AtbLrWOVo
 x1RrDNvA==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pGIFe-0075dF-8p; Fri, 13 Jan 2023 12:29:38 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Simon Ser <contact@emersion.fr>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Subject: [PATCH v2 2/3] drm/amdgpu: Remove redundant framebuffer format check
Date: Fri, 13 Jan 2023 08:27:43 -0300
Message-Id: <20230113112743.188486-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113112743.188486-1-mcanal@igalia.com>
References: <20230113112743.188486-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 amd-gfx@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that framebuffer_check() verifies that the format is properly
supported, there is no need to check it again on amdgpu's inside
helpers.

Therefore, remove the redundant framebuffer format check from the
amdgpu_display_gem_fb_verify_and_init() function, letting
framebuffer_check() perform the framebuffer validation.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index b22471b3bd63..611b7a4b086c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1120,16 +1120,6 @@ static int amdgpu_display_gem_fb_verify_and_init(struct drm_device *dev,
 
 	rfb->base.obj[0] = obj;
 	drm_helper_mode_fill_fb_struct(dev, &rfb->base, mode_cmd);
-	/* Verify that the modifier is supported. */
-	if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
-				      mode_cmd->modifier[0])) {
-		drm_dbg_kms(dev,
-			    "unsupported pixel format %p4cc / modifier 0x%llx\n",
-			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
-
-		ret = -EINVAL;
-		goto err;
-	}
 
 	ret = amdgpu_display_framebuffer_init(dev, rfb, mode_cmd, obj);
 	if (ret)
-- 
2.39.0

