Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 889277F4C30
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 17:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA3010E681;
	Wed, 22 Nov 2023 16:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C84E10E316;
 Wed, 22 Nov 2023 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2zYtF9bti8Sl79w5DySf/rz3AAOQ+yakZIXsa6ORKGA=; b=Eho7w5atcmZtocj3rcK1fW6ysd
 9Mhl3hUuHiIkoJB58jmK/B8sGI63MAUAiiXBZ23FBenMeAXzgBWQ1lRiaEquopcD9wxL+WFaHbsS9
 xJT4sAJzuZteHorH1KbaJq/m57c85KyAZat31a8P7HrKbnCrdshetgv+TaC6BT0fp4jDU9vFom6E8
 rQB8STP0YXzIvFBtBA2+lQXRVtgNF9Uniy1A9fKvhRaE+tsNjPWOtOYDPCt28B8l46k3KrTEQh0BC
 GdE9IGYZSLjn/I0xl5fex0662KhGqZm4mmU+Ea7qw3GOmigWsVA9tarb3fnuQgmBmcaEsW7RpZMOR
 owiyDZEA==;
Received: from 189-69-166-209.dial-up.telesp.net.br ([189.69.166.209]
 helo=steammachine.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r5pxi-0061lT-Bl; Wed, 22 Nov 2023 17:20:26 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/4] drm: Add support for atomic async page-flip
Date: Wed, 22 Nov 2023 13:19:37 -0300
Message-ID: <20231122161941.320564-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.1
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 intel-gfx@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This work from me and Simon adds support for DRM_MODE_PAGE_FLIP_ASYNC through
the atomic API. This feature is already available via the legacy API. The use
case is to be able to present a new frame immediately (or as soon as
possible), even if after missing a vblank. This might result in tearing, but
it's useful when a high framerate is desired, such as for gaming.

Differently from earlier versions, this one refuses to flip if any prop changes
for async flips. The idea is that the fast path of immediate page flips doesn't
play well with modeset changes, so only the fb_id can be changed.

Tested with:
 - Intel TigerLake-LP GT2
 - AMD VanGogh

Thanks,
	André

- User-space patch: https://github.com/Plagman/gamescope/pull/595
- IGT tests: https://lore.kernel.org/all/20231110163811.24158-1-andrealmeid@igalia.com/

Changes from v8:
- Dropped atomic_async_page_flip_not_supported, giving that current design works
with any driver that support atomic and async at the same time.
- Dropped the patch that disabled atomic_async_page_flip_not_supported for AMD.
- Reordered commits
v8: https://lore.kernel.org/all/20231025005318.293690-1-andrealmeid@igalia.com/

Changes from v7:
- Only accept flips to primary planes. If a driver support flips in different
planes, support will be added  later.
v7: https://lore.kernel.org/dri-devel/20231017092837.32428-1-andrealmeid@igalia.com/

Changes from v6:
- Dropped the exception to allow MODE_ID changes (Simon)
- Clarify what happens when flipping with the same FB_ID (Pekka)

v6: https://lore.kernel.org/dri-devel/20230815185710.159779-1-andrealmeid@igalia.com/

Changes from v5:
- Add note in the docs that not every redundant attribute will result in no-op,
  some might cause oversynchronization issues.

v5: https://lore.kernel.org/dri-devel/20230707224059.305474-1-andrealmeid@igalia.com/

Changes from v4:
 - Documentation rewrote by Pekka Paalanen

v4: https://lore.kernel.org/dri-devel/20230701020917.143394-1-andrealmeid@igalia.com/

Changes from v3:
 - Add new patch to reject prop changes
 - Add a documentation clarifying the KMS atomic state set

v3: https://lore.kernel.org/dri-devel/20220929184307.258331-1-contact@emersion.fr/

André Almeida (1):
  drm: Refuse to async flip with atomic prop changes

Pekka Paalanen (1):
  drm/doc: Define KMS atomic state set

Simon Ser (2):
  drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
  drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP

 Documentation/gpu/drm-uapi.rst      | 47 ++++++++++++++++++
 drivers/gpu/drm/drm_atomic_uapi.c   | 77 ++++++++++++++++++++++++++---
 drivers/gpu/drm/drm_crtc_internal.h |  2 +-
 drivers/gpu/drm/drm_ioctl.c         |  4 ++
 drivers/gpu/drm/drm_mode_object.c   |  2 +-
 include/uapi/drm/drm.h              | 10 +++-
 include/uapi/drm/drm_mode.h         |  9 ++++
 7 files changed, 142 insertions(+), 9 deletions(-)

-- 
2.42.1

