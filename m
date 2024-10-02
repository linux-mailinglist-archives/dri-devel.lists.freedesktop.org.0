Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5943398E4B0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 23:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B95A10E0D6;
	Wed,  2 Oct 2024 21:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jq7+Swt6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B163710E009;
 Wed,  2 Oct 2024 21:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zw3CnjmaMmXgMlS66QKNCXXAJ2JyjAKjSarlVGPessY=; b=jq7+Swt6pPi+1CZq+aa73tlXFE
 UEg1rrTLgRk8uyVFpDOQwMlGNyi0GTHfmIXxXyvzRoaKi1mlmJLdXe4ehsTyWft4hmuxhtgty3Wgo
 7sUCXC5X5Te1e6uqmxgLztqoh1OTHK3RScBRpCP+FqmZVf10f56Uzw5e/GZCnsg2iH87np5DMmy/Z
 KS1Us5TtKWsMrX99XzwAl2y38CIZEMN6ER+4T5V4bXkOyLIszjaSH/63jS+E6CoqzN+ltoMbwOurz
 huCA4/nX3WL81aeRYnNZ6jrZ453hNSBU9l+mIPOsHbsajLJPT7WJsefJ7R49N4BMKw4FEGAqT1h6y
 JojBnn3w==;
Received: from [187.57.199.212] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sw6i9-0042sU-RU; Wed, 02 Oct 2024 23:16:42 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v9 0/2] drm/atomic: Ease async flip restrictions
Date: Wed, 02 Oct 2024 18:16:04 -0300
Message-Id: <20241002-tonyk-async_flip-v9-0-453b1b8977bd@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABW4/WYC/x3MQQqAIBBA0avIrBPMWmhXiQiZxhoKE40oorsnL
 d/i/wcyJaYMnXgg0cmZ91BgKwG4uDCT5KkYtNJtrZSWxx7uVbp8Bxz9xlEabdCTRd+gg5LFRJ6
 vf9kP7/sBlsIyB2IAAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, dmitry.baryshkov@linaro.org, 
 Simon Ser <contact@emersion.fr>, joshua@froggi.es, 
 Xaver Hugl <xaver.hugl@gmail.com>, Daniel Stone <daniel@fooishbar.org>, 
 ville.syrjala@linux.intel.com
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.14.1
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

Hi,

As per my previous patchsets, the goal of this work is to find a nice way to
allow amdgpu to perform async page flips in the overlay plane as well, not
only on the primary one. Currently, when using the atomic uAPI, this is the only
type of plane allowed to do async flips, and every driver accepts it.

In my last version, I had created a static field `bool async_flip` for
drm_planes. When creating new planes, drivers could tell if such plane was
allowed or not to do async flips. This would be latter checked on the atomic
uAPI whenever the DRM_MODE_PAGE_FLIP_ASYNC was present.

However, Dmitry Baryshkov raised a valid point about getting confused with the 
existing atomic_async_check() code, giving that is a function to do basically
what I want: to let drivers tell DRM whether a giving plane can do async flips
or not. It turns out atomic_async_check() is implemented by drivers to deal with
the legacy cursor update, so it's not wired with the atomic uAPI because is
something that precedes such API.

So my new proposal is to just reuse this same function in the atomic uAPI path.
The plane restrictions defined at atomic_async_check() should work in this
codepath as well. And I will be able to allow overlays planes by modifying
amdgpu_dm_plane_atomic_async_check(), and anyone else have a proper place to
play with async plane restrictions as well.

One note is that currently we always allow async flips for primary planes,
regardless of the drivers, but not every atomic_async_check() implementation
allows primary planes (because they were writing targeting cursor planes
anyway...). To avoid regressions, my patch only calls atomic_async_check() for
non primary planes, and always allows primary ones.

Thoughts?

Changelog
 v8: https://lore.kernel.org/lkml/20240806135300.114469-1-andrealmeid@igalia.com/
 - Rebased on top of 6.12-rc1 (drm/drm-next)

Changelog
 v7: https://lore.kernel.org/dri-devel/20240618030024.500532-1-andrealmeid@igalia.com/
 - Complete rewrite

---
André Almeida (2):
      drm/atomic: Let drivers decide which planes to async flip
      drm/amdgpu: Enable async flip on overlay planes

 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  3 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  | 39 ++++++++++++++++------
 2 files changed, 30 insertions(+), 12 deletions(-)
---
base-commit: e32cde8d2bd7d251a8f9b434143977ddf13dcec6
change-id: 20241002-tonyk-async_flip-828cfe9cf3ca

Best regards,
-- 
André Almeida <andrealmeid@igalia.com>

