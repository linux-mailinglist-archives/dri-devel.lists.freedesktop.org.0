Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC9466239D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01A710E3DB;
	Mon,  9 Jan 2023 11:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8252210E3D1;
 Mon,  9 Jan 2023 11:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hNATKjY7XIVBDuQWtFGcMf6VN0Mc5hffvyNLA+S25AI=; b=lkQA09gx55BwZIa6HfGjDaNnje
 i+gJgAFm5bGYjH2siDAMMZJ7h1qvdvgxnYMazDhouX5PJftkxCCT38lkvaVnV9cOP1nAd6xQ3uy1B
 KGCRMqz80CI43ICzPA3kXZVZz+FtmivNVs0a7Kn1aEpgaCai0IyLoBcGRbGwiHaSKNqKqhe+ozqtA
 BUVSDQJ+eI6qQEJYKzb7le80oNcUcMjTaBuRLxHSdDfKN5ZsUsJb0b1uW3Ovo+ELOdnsubvchLtEZ
 jJ67I306F+Jm0f2TSxKfQeds42To2iFFHp4dqT59hMEB2L/PflTLVuoYoY+Szn+P7YIDRvXm/XbAQ
 HweRZuow==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEptJ-003J8T-Up; Mon, 09 Jan 2023 12:00:34 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Simon Ser <contact@emersion.fr>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Subject: [PATCH 2/5] drm/amdgpu: Remove redundant framebuffer format check
Date: Mon,  9 Jan 2023 07:58:05 -0300
Message-Id: <20230109105807.18172-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109105807.18172-1-mcanal@igalia.com>
References: <20230109105807.18172-1-mcanal@igalia.com>
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
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that framebuffer_check() verifies that the format is properly
supported, there is no need to check it again on amdgpu's inside
helpers.

Therefore, remove the redundant framebuffer format check from the
amdgpu_display_gem_fb_verify_and_init() function, letting
framebuffer_check() perform the framebuffer validation.

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

