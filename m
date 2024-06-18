Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B381E90C20A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 05:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC7210E205;
	Tue, 18 Jun 2024 03:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bXJeBIca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5CC10E13D;
 Tue, 18 Jun 2024 03:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ArM+639iudtviX5z1Tlj1/XIkLX2KQBeY8XxqJXMBcQ=; b=bXJeBIcaIhMdj818RLv9AY0d9W
 nYzL4JUAlUcu4IF8fq8+54iIoD+284k0ffEAsYRMiT/ySb3XsUDm6TVGJfiu0LzekGQEVLoLkW2r+
 jIxjQQxIONQJkQLbYb99sNkx8YLcIjgZnKPb0Y+ox0C1IqJGUuCniisOrpThhQXBjgf6gNP/+uyzn
 3fwQIH/5z0VNWzsuI3BfOPnzkqYHHzfKosChM/fcLUY0iDzcRSewqFDXbNzM9V4n9SOUcBU70CxMA
 g7ItUzhSvd3inPkGNfFRCIauLdF5UBU69yvGao9qJ95lVUiRq8ZuyBQ9tn+r0+aHChfGe68UCY50t
 mc3mo2LQ==;
Received: from [191.8.29.108] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sJP5G-004YXc-E1; Tue, 18 Jun 2024 05:00:34 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v7 0/9] drm: Support per-plane async flip configuration
Date: Tue, 18 Jun 2024 00:00:15 -0300
Message-ID: <20240618030024.500532-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.45.2
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

AMD hardware can do async flips with overlay planes, but currently there's no
easy way to enable that in DRM. To solve that, this patchset creates a new
drm_plane field, bool async_flip, that allows drivers to choose which plane can
or cannot do async flips. This is latter used on drm_atomic_set_property when
users want to do async flips.

Patch 1 allows async commits with IN_FENCE_ID in any driver.

Patches 2 to 7 have no functional change. As per current code, every driver that
allows async page flips using the atomic API, allows doing it only in the
primary plane. Those patches then enable it for every driver.

Every driver that I found out capable of doing async flips were changed here.
The drivers that weren't touch don't have any mention to
mode_config::async_page_flip, so they are not currently advertising to userspace
that they can do async flips.

Patch 8 changes the current DRM uAPI check from allowing only primary planes to
allowing any plane that the driver allows flipping asynchronously.

Patch 9 finally enables async flip on overlay planes for amdgpu.

Changes from v6:
- Added async_flip check for i915/skl planes (Rodrigo)
- Commit the plane->async_flip check just after all driver had set their
async_flip capabilities (Dmitry)
https://lore.kernel.org/dri-devel/20240614153535.351689-1-andrealmeid@igalia.com/

Changes from v5:
- Instead of enabling plane->async_flip in the common code, move it to driver
code.
- Enable primary plane async flip on every driver
https://lore.kernel.org/dri-devel/20240612193713.167448-1-andrealmeid@igalia.com/

André Almeida (9):
  drm/atomic: Allow userspace to use explicit sync with atomic async
    flips
  drm: Support per-plane async flip configuration
  drm/amdgpu: Enable async flips on the primary plane
  drm: atmel-hlcdc: Enable async flips on the primary plane
  drm/i915: Enable async flips on the primary plane
  drm/nouveau: Enable async flips on the primary plane
  drm/vc4: Enable async flips on the primary plane
  drm: Enable per-plane async flip check
  drm/amdgpu: Make it possible to async flip overlay planes

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 2 ++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c         | 3 +++
 drivers/gpu/drm/drm_atomic_uapi.c                       | 8 +++++---
 drivers/gpu/drm/i915/display/i9xx_plane.c               | 3 +++
 drivers/gpu/drm/i915/display/skl_universal_plane.c      | 1 +
 drivers/gpu/drm/nouveau/dispnv04/crtc.c                 | 4 ++++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c                 | 4 ++++
 drivers/gpu/drm/vc4/vc4_plane.c                         | 4 +++-
 include/drm/drm_plane.h                                 | 5 +++++
 9 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.45.2

