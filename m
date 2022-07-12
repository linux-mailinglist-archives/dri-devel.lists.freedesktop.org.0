Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1326F571134
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 06:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2D611B3FF;
	Tue, 12 Jul 2022 04:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D0D10E074
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 04:23:10 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 h5-20020a62b405000000b00528c76085e4so1740416pfn.15
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 21:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=l0wfKFp1ChJwLpur4LprhadUuGsHQU0cjcxPkM3pYu4=;
 b=eydKoO5rr2LXznt/oww6+I4+oHMBcV+Dwp7kSgxo9xRjUefqx0WxWfSdeO3AxvGYYj
 hsbSG89K48k1wHNBwKqVXwB4ofsdmPYEfk7Tk86cLkHc+Ms3I405DLnGYDvAKbkNi4ex
 U3I3Einb3hgUR0L5bGLbAMK4OpK9znX82Cr5WUWNPlHXK4iGpg+y13GfASX6npa6IDRg
 v1YUro0KQNVjiENneup57QrtMLdxPCJZgx1WkoMYa61nJIGISoxF/UKZs4uBzEyuMdVV
 26/EMVsIfmf4m7JWn+Sc1AXe79CcmcNQPyvFhD4NgRUzPgcH4DmNRUZCmfcZ3zCGOQa8
 +mIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=l0wfKFp1ChJwLpur4LprhadUuGsHQU0cjcxPkM3pYu4=;
 b=jVAx0kdmSDjkTWxdC9eTOAX1h6yHFDAOk1azIYKsx2FD0bt2CDye8AFIabRnDjhuxc
 m1wqRI+d5gP8bACcoLyAJuE4gFlvileVnLZoUd1jb84NdrSCnE3lS1vjStzBMvwEnNO2
 JjK0g6xanTeTVIMWLxE+4XoKlYKQ2TGfgN29y2Wb7SCZum2fQq781UA6dfxysOanJxTL
 WlUuqzLNHuTwYQUDW4meS6yEnnC5J7BI6aF0ckKqlregI45MV35Wu5nVcAOMb2xDIGoN
 qMqtY4uqOX+bJ5fKYqZqNmZRoGL5/hr7y09CigPlyGPOOEVo0lDdk48302L78P7uVzUF
 7XGQ==
X-Gm-Message-State: AJIora9ESQp9kL32JC2pRfMdSeEtZ5UnI8Jv3C80GoietzPThHemumtx
 PW2yc1cKMqau7sDPhtaiYoo5j0y/kSo=
X-Google-Smtp-Source: AGRyM1uSdSVTczuhdh9+VldYWcIPNC0HCxNLlu3dXeAxplL3jRHHA4OEjhvR03xbY4z9GwTDsOqdoWRnLtF/
X-Received: from jstultz-noogler2.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:600])
 (user=jstultz job=sendgmr) by 2002:a17:90a:de12:b0:1ef:ae83:d225 with SMTP id
 m18-20020a17090ade1200b001efae83d225mr2026908pjv.207.1657599790067; Mon, 11
 Jul 2022 21:23:10 -0700 (PDT)
Date: Tue, 12 Jul 2022 04:22:57 +0000
In-Reply-To: <20220712042258.293010-1-jstultz@google.com>
Message-Id: <20220712042258.293010-2-jstultz@google.com>
Mime-Version: 1.0
References: <20220712042258.293010-1-jstultz@google.com>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [RFC][PATCH 2/3] drm: vgem: Enable SYNCOBJ and SYNCOBJ_TIMELINE on
 vgem driver
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Chunming Zhou <david1.zhou@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allows for basic SYNCOBJ api testing, in environments
like VMs where there may not be a supported drm driver.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Chunming Zhou <david1.zhou@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <jstultz@google.com>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_dr=
v.c
index c5e3e5457737..e5427d7399da 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -109,7 +109,8 @@ static struct drm_gem_object *vgem_gem_create_object(st=
ruct drm_device *dev, siz
 }
=20
 static const struct drm_driver vgem_driver =3D {
-	.driver_features		=3D DRIVER_GEM | DRIVER_RENDER,
+	.driver_features		=3D DRIVER_GEM | DRIVER_RENDER |
+					  DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE,
 	.open				=3D vgem_open,
 	.postclose			=3D vgem_postclose,
 	.ioctls				=3D vgem_ioctls,
--=20
2.37.0.144.g8ac04bfd2-goog

