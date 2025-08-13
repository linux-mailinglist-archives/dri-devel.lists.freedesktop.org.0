Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC5BB2510F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 19:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE75410E7AD;
	Wed, 13 Aug 2025 17:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="G/xN18Rs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C10210E7AA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 17:06:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755104774; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=W6gXsJ42QoIE8TSqjltglVIeoIZorf35KL6H9G9FwBbsk/XtypV5aBLZ6piQb/tb1rg8KzeJz5FXY5A/ZCfqkWnFHCKdgvsHtHKnxj9u94i156x7MOGAcDawlHiUUgJctZ2bTYG48k9wQzlt6WJpWNylMwYbgyikWeBtunwt83Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755104774;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=mh2q/FJHlzqPaos2J3IY29/oqyBKhhI3ZCkslUiMMZ0=; 
 b=c200/e62Iya1fXirnBESJh9zqfsYb9Dbyhfgap9i9E8T4PQw4o/ivUDYeGRezotZnjx60jz6nffpBkoTqSELOD/N5EMKGWGsXz87Z11/1Wxotf1W6RGOcWug4b3GLn5KuNIQR0pXOPL37XbDirYwZsuSdGmppSR+zGjO1UoMvuY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755104774; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=mh2q/FJHlzqPaos2J3IY29/oqyBKhhI3ZCkslUiMMZ0=;
 b=G/xN18RsNj8QtljzKqmSsbKaBHPxHDf+19UjdO8K88UCrFCtBtnRRcFqgFIDi4/4
 Nwp48rU/CeJJ1WLKmdec9XvT35uWQtlC0on38D6pUSra+z5eCzwxdOzHCeqw8TIiLR8
 PVJCzrVl/Z0CWgOaBtzB3S7Q94IyVuIXl7ypL7qk=
Received: by mx.zohomail.com with SMTPS id 1755104771378887.6784993151383;
 Wed, 13 Aug 2025 10:06:11 -0700 (PDT)
From: Robert Mader <robert.mader@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Daniel Stone <daniels@collabora.com>, Melissa Wen <melissa.srw@gmail.com>,
 Maira Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Robert Mader <robert.mader@collabora.com>
Subject: [PATCH v1 0/5] drm/vkms: Add YUV support to writeback connector
Date: Wed, 13 Aug 2025 19:05:37 +0200
Message-ID: <20250813170542.331206-1-robert.mader@collabora.com>
X-Mailer: git-send-email 2.50.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series implements support for various YUV/YCbCr formats in the vkms
writeback connector. The goal is to facilitate driver development of hardware
writeback connectors that (only) support these formats. In order to do so the
series adds two new optional connector properties, WRITEBACK_COLOR_ENCODING and
WRITEBACK_COLOR_RANGE, modeled after the existing plane properties
COLOR_ENCODING and COLOR_RANGE. These are needed by user space clients to know -
and optionally control - the matrix coefficients and quantization range for YUV
to RGB conversions.

While I'm aware of plans to deprecate the COLOR_ENCODING and COLOR_RANGE plane
properties in the context of ongoing color work, it is unclear if and when the
successor will get implemented in vkms. Thus, and in light of the optional and
non-invasive nature of the new properties, I hope there is no strong resistance
against the later.

The implementation tries to reuse and mirror the existing YUV support for planes
as much as possible in order to minimize maintenance burden.

On the user space side a Weston compositor and client implementation can be
found here:
https://gitlab.freedesktop.org/rmader/weston/-/commits/vkms-writeback-yuv-v1

It can be tested with the following steps:
1. Run `weston --debug --drm-device=card0` from a TTY to run Weston with vkms
   and the screenshot protocol enabled.
2. Run e.g. `WAYLAND_DISPLAY=wayland-1 weston-screenshooter -s 1 -b 2 -c 2 -r 1 -f P010`
   in order to capture a screenshot with DRM_FORMAT_P010, ITU-R BT.2020 YCbCr
   color encoding and YCbCr full range.
3. The resulting .yuv files for now lack metadata, but can be opened by various
   clients such as ffmpeg or YUView (see link below) when adding the information
   about the used format, size and encoding/range.
   See https://flathub.org/apps/de.rwth_aachen.ient.YUView

Given that Mesas gbm implementation does not support allocation YUV buffers yet,
the client implementation (weston-screenshooter) uses udmabuf instead. This
approach should work with any writeback connector that has an IOMMU and supports
buffer import from virtual system memory.

The series is build on top of "drm/vkms: Add support for multiple plane formats"
v7, which adds plane/input support for formats like DRM_FORMAT_P010 that are
also covered, see
https://lore.kernel.org/dri-devel/20250703-b4-new-color-formats-v7-0-15fd8fd2e15c@bootlin.com/

Thus I'm taking the freedom to CC everyone involved there, hope that's ok :)

Additional notes:
 - Weston requires a successful gbm_bo_import() of the buffer. Thus when
   testing with llvmpipe, a recent Mesa version (>=25.2) is required. For the
   formats DRM_FORMAT_NV61, DRM_FORMAT_NV24 and DRM_FORMAT_NV42 support is not
   upstream yet, but the following branch can be used for testing:
   https://gitlab.freedesktop.org/rmader/mesa/-/commits/yuv-formats-nv61-nv24-nv42

It is co-developed with a Weston implementation

Robert Mader (5):
  drm: Add WRITEBACK_COLOR_ENCODING and WRITEBACK_COLOR_RANGE properties
  drm/vkms: Add RGB to YUV conversion matrices
  drm/vkms: Add WRITEBACK_COLOR_ENCODING and WRITEBACK_COLOR_RANGE
    properties
  drm/vkms: Add support for writing semiplanar YUV/YCbCr formats
  drm/vkms: Add YUV formats to writeback connector

 drivers/gpu/drm/drm_atomic_uapi.c             |   8 +
 drivers/gpu/drm/drm_color_mgmt.c              |  90 +++++
 drivers/gpu/drm/vkms/tests/vkms_format_test.c |  51 ++-
 drivers/gpu/drm/vkms/vkms_drv.h               |  51 ++-
 drivers/gpu/drm/vkms/vkms_formats.c           | 325 +++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_formats.h           |   7 +
 drivers/gpu/drm/vkms/vkms_writeback.c         |  68 +++-
 include/drm/drm_color_mgmt.h                  |   7 +
 include/drm/drm_connector.h                   |  17 +
 include/drm/drm_mode_config.h                 |  14 +
 10 files changed, 591 insertions(+), 47 deletions(-)

-- 
2.50.1

