Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08775744600
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 04:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7266610E516;
	Sat,  1 Jul 2023 02:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B96D10E516;
 Sat,  1 Jul 2023 02:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DTlH1QZL9ONljiaNmWd/MfYuknpYQs+KwTmRxFWAUtk=; b=E/uEgJcGxY/pqHuXM6OYTeki3A
 aH2BZhcYQC+waPuCwq8HsR2t6fr9QaPiveu/LOYGgnSZZgasCvu/FOTDzCCGn6o07yklZ89L9Fxwv
 2tKFg3eC2UJlbfkuJ00GiLIKpLGWYqgm2XkkWXlX6Q+XHODzgvh3XLl3cukWq0igXytdDrxktj/pi
 ALHch9yKcpUiG1Qc2JnWDdG2q5b/6BmQhqDMS9nIaenLIWbfV/ZBz4rV7HzRnRuIN5AXPxI1O+gRG
 2vlMIIPtJ2AjjXE6LhNLg38ykSZKzTbKQQXknUTQGG+1ABmqWkOQxxE7jy0pJf3TT1kMKiMKq7PwZ
 sTjf6ZkQ==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qFQ3B-006abr-Ka; Sat, 01 Jul 2023 04:09:26 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org
Subject: [PATCH v4 0/6] drm: Add support for atomic async page-flip
Date: Fri, 30 Jun 2023 23:09:11 -0300
Message-ID: <20230701020917.143394-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
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
 Italo Nicola <italonicola@collabora.com>, Randy Dunlap <rdunlap@infradead.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, hwentlan@amd.com, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, joshua@froggi.es
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
play well with modeset changes, so only the fb_id can be changed. The exception
is for mode_id changes, that might be referring to an identical mode (which
would skip a modeset). This is done to make the async API more similar to the
normal API.

Thanks,
	André

Changes from v3:
 - Add new patch to reject prop changes
 - Add a documentation clarifying the KMS atomic state set

v3: https://lore.kernel.org/dri-devel/20220929184307.258331-1-contact@emersion.fr/

- User-space patch: https://github.com/Plagman/gamescope/pull/595
- IGT tests: https://gitlab.freedesktop.org/andrealmeid/igt-gpu-tools/-/tree/atomic_async_page_flip

André Almeida (2):
  drm: Refuse to async flip with atomic prop changes
  drm/doc: Define KMS atomic state set

Simon Ser (4):
  drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
  drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
  drm: introduce drm_mode_config.atomic_async_page_flip_not_supported
  amd/display: indicate support for atomic async page-flips on DC

 Documentation/gpu/drm-uapi.rst               | 19 +++++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c |  1 +
 drivers/gpu/drm/drm_atomic_helper.c          |  5 ++
 drivers/gpu/drm/drm_atomic_uapi.c            | 80 ++++++++++++++++++--
 drivers/gpu/drm/drm_crtc_internal.h          |  2 +-
 drivers/gpu/drm/drm_ioctl.c                  |  5 ++
 drivers/gpu/drm/drm_mode_object.c            |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c |  1 +
 drivers/gpu/drm/nouveau/nouveau_display.c    |  1 +
 include/drm/drm_mode_config.h                | 11 +++
 include/uapi/drm/drm.h                       | 10 ++-
 include/uapi/drm/drm_mode.h                  |  9 +++
 12 files changed, 137 insertions(+), 9 deletions(-)

-- 
2.41.0

