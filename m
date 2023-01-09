Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3906623A3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553F410E3DE;
	Mon,  9 Jan 2023 11:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2179C10E3DE;
 Mon,  9 Jan 2023 11:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eGjSqlvIIXPbc0RBsmGw1UndYXOvIzaz2I1V/JEHNg0=; b=pb9AVQWlLjGRLoVwv4yZcI1Y+J
 V7pMzuOiV+C/ENKnQGIoVGwx5HyzzYD6LR0DaQAaF2Aop1q0hKXtsbREo3i8hBwNkR31mvYoYsxHT
 TTOVhN1cqrvmAE7sLF4nvrkjDdt749bn3aFG8SxLmTR4PGHmOlJtzKV3gwlrGpm4zeMQfeMSpwTLk
 CCbhlTgd/WtidYc1SFiQG4wV1rvzANFlUPI+W83xMS5KGvEPRrXOSoHTaQg/OQWaiGFBEBQ2q4uwN
 XLacQ0w9q+zzkbExnQ2Eri5GRUyw01wbvKojAxoXzQ1MfCEpefrefmGFGGS/C5ahQO+XwdI77c0Dh
 6yuZ+pmQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEpte-003J8T-Hf; Mon, 09 Jan 2023 12:00:55 +0100
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
Subject: [PATCH 5/5] drm/plane: Unexport drm_any_plane_has_format()
Date: Mon,  9 Jan 2023 07:58:08 -0300
Message-Id: <20230109105807.18172-6-mcanal@igalia.com>
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

As the format validation is being dealt with exclusively
inside framebuffer_check(), there is no need to export the
drm_any_plane_has_format() symbol.

Therefore, unexport the drm_any_plane_has_format() symbol, reinforcing
that format validation is being dealt with by the DRM API.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_plane.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 24e7998d1731..67c0ab60c7b6 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -837,7 +837,6 @@ bool drm_any_plane_has_format(struct drm_device *dev,
 
 	return false;
 }
-EXPORT_SYMBOL(drm_any_plane_has_format);
 
 /*
  * __setplane_internal - setplane handler for internal callers
-- 
2.39.0

