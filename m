Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24666239F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8337010E3DC;
	Mon,  9 Jan 2023 11:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F87D10E3D9;
 Mon,  9 Jan 2023 11:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vf959UezHF2Cel3AL88HjjvfaoBXBtvA5RmAJ1bMWl4=; b=BKx99E2Ufl5aAxjfNkjN4lC5ir
 seuES+8BGKih1XrmJTveKMZ97TlJRLJ6dE4IHEomfeFovOdiSvUGclXV/qKYOHq7I3TiX8rs14chE
 +OdfJt6tUUUSTlg26fapAD/9ZHDYj9HZyCoslAonetE3OBVq4F4E23Wyb7VtXfdFEuuewA/NlXsfM
 X2cRDCtKy9biCtgTClP0hQV3FBca8StE3ZDgg7ph0LNBrvfHAdSwh08rNpn4FY25Hw/bvvBtuQgJF
 9cTlbwzTr/fqPlfinB7c7MUdN4SftUjkyWLvMrL+fxLp/l5zbfhLgcKTSR8Dtkuh0BWos+K61pAl9
 tKRHMz6w==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEptR-003J8T-3v; Mon, 09 Jan 2023 12:00:41 +0100
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
Subject: [PATCH 3/5] drm/i915: Remove redundant framebuffer format check
Date: Mon,  9 Jan 2023 07:58:06 -0300
Message-Id: <20230109105807.18172-4-mcanal@igalia.com>
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
supported, there is no need to check it again on i915's inside
helpers.

Therefore, remove the redundant framebuffer format check from the
intel_framebuffer_init() function, letting framebuffer_check()
perform the framebuffer validation.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 63137ae5ab21..230b729e42d6 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1914,15 +1914,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		}
 	}
 
-	if (!drm_any_plane_has_format(&dev_priv->drm,
-				      mode_cmd->pixel_format,
-				      mode_cmd->modifier[0])) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "unsupported pixel format %p4cc / modifier 0x%llx\n",
-			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
-		goto err;
-	}
-
 	/*
 	 * gen2/3 display engine uses the fence if present,
 	 * so the tiling mode must match the fb modifier exactly.
-- 
2.39.0

