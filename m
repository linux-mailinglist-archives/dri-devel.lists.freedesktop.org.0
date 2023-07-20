Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B4275A450
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 04:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D72110E392;
	Thu, 20 Jul 2023 02:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D520310E392;
 Thu, 20 Jul 2023 02:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 49A9D40611;
 Thu, 20 Jul 2023 04:22:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WlCQlUoxq5bm; Thu, 20 Jul 2023 04:22:23 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1689819743; bh=Hju4rB2+gzToFMDKnORZjkmAt13WQqVlWgaxsEzHX14=;
 h=From:To:Cc:Subject:Date;
 b=W0GfdKN7CCU8meFHAkNsqscGRfgt0Qaz+Gqa9gJkjbRprZChYalIID17dzfLje6/1
 gsrBB/ebkFCA47SyBwz+5a8s3BxXgAmSCGJshdWNS3Eg94Pb5ZG1W5I96vDU31GRkK
 DTzwiQsM1Zj9SGiWroaWP3f0wa6rzFdiUixuc+0nNzEPF74gw8i6dA5OyzBOtvoJzz
 ZaTfuDf1MXyBcHlZYjZnuku4kmKkX/CEz/niBsPJruUU7ob+jKQBKYN7v91CkdBakX
 3Wb850flfKWMHUXxn5pxJjcO3GkjUoJB0zD1W/7U5IGpIvmdxPAjleCyhcnEaztLAo
 cOdFw/JgRkL+w==
To: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Maira Canal <mairacanal@riseup.net>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Tales Aparecida <tales.aparecida@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Clint Taylor <clinton.a.taylor@intel.com>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v2 0/2] drm: Refactor plane size calculation by core helper
 functions
Date: Wed, 19 Jul 2023 23:19:35 -0300
Message-ID: <20230720021937.27124-1-gcarlos@disroot.org>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's duplicated functions on drm that do the same job of calculating
the size of planes from a drm_format_info and the size of its first
plane. So this patchset throw away the more specific version intended
to be used from a given framebuffer and make the generic version way
more portable against the drivers.

Thanks,
Carlos

---
v1 -> v2: https://lore.kernel.org/dri-devel/20230627182239.15676-1-gcarlos@disroot.org/
  - New patch "[PATCH v2 1/2] drm: Remove plane hsub/vsub alignment requirement
    for core helpers".

---
Carlos Eduardo Gallo Filho (2):
  drm: Remove plane hsub/vsub alignment requirement for core helpers
  drm: Replace drm_framebuffer plane size functions with its equivalents

 drivers/gpu/drm/drm_framebuffer.c       | 64 ++-----------------------
 drivers/gpu/drm/i915/display/intel_fb.c |  2 +-
 include/drm/drm_fourcc.h                |  5 +-
 include/drm/drm_framebuffer.h           |  5 --
 4 files changed, 8 insertions(+), 68 deletions(-)

-- 
2.41.0

