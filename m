Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2C284EA14
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 22:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED0C10ED9B;
	Thu,  8 Feb 2024 21:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="J61Jenx/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C054E10ED9B;
 Thu,  8 Feb 2024 21:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yRF44PAwuObJjETXmhstoHPr/yI6S4jcqxgx+14ydL0=; b=J61Jenx/HaJYWYqd/VGI/U5XXh
 5tMpKP4qZHsUksJhROrMMPNBUbz3Usk08vFTccJIUnbR60OuXjjwR2kZBYw/Ef3Fub8zGvV26dl12
 gVu5GM+vv1Kavx3MYD3ieYb/3MOhMvfIU4rJS8gL9Jm0Mvj3XWR0VjFfUWhMybgL/smWHnRyQenk5
 anlb+6wQNeGtEyNk91yEdt6MpbG6NdQ8gAqtaNgcfTb/EdH7jc2SC2nrxxjfUrGTk/29VDON+zNYO
 ahkoCaDLKBlsYbqr4MWIqAz2HmYlu8LHtKGRiV9MQ5iqsdxiz1/NYKWis5vrDY8IJk52BZg5/vA0F
 op0SNmgg==;
Received: from [177.45.63.184] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rYBax-00FMBk-3H; Thu, 08 Feb 2024 22:06:07 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v4 3/3] drm/amdgpu: Make it possible to async flip overlay
 planes
Date: Thu,  8 Feb 2024 18:05:42 -0300
Message-ID: <20240208210542.550626-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208210542.550626-1-andrealmeid@igalia.com>
References: <20240208210542.550626-1-andrealmeid@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu can handle async flips on overlay planes, so mark it as true
during the plane initialization.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v4: new patch

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 8a4c40b4c27e..dc5392c08a87 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1708,6 +1708,7 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	} else if (plane->type == DRM_PLANE_TYPE_OVERLAY) {
 		unsigned int zpos = 1 + drm_plane_index(plane);
 		drm_plane_create_zpos_property(plane, zpos, 1, 254);
+		plane->async_flip = true;
 	} else if (plane->type == DRM_PLANE_TYPE_CURSOR) {
 		drm_plane_create_zpos_immutable_property(plane, 255);
 	}
-- 
2.43.0

