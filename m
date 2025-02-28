Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCACEA498E2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC7510E034;
	Fri, 28 Feb 2025 12:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PyqvFv/7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E46489CF6;
 Fri, 28 Feb 2025 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J65RRpxzb2SHooTTNoAw0STRLJLE33DZng+YcfjggC0=; b=PyqvFv/7LJyyQCRfrOsTrOvuTw
 0zqciE9e4QXUpSMMj0/0um9CPDkP/q8Kd8lwRL5nkEFyD2ej1eRM7ZJ4RFHKJVSBoC0WSekqGy1fi
 82Hb8cl0l/5PkEddxCUjqFzH9NFgJJpsNzuBhVlmcWb4iHyRv+ZV0qn8PvL4HOoabd+A0rLXp08vv
 yvsP4vQSNe+tfUb4SGOon1kQjYDgTLNWLpovaOcP9MqEVk1qcjVttxnFpp2Cc/rc7IPt48lvkFL3X
 7J8DQetkl+diifwr4IUIQF7KszskN7DiAj0INiZUFY9GaBVQa6n3qkqeZRlGAczXjK9ku3TKzzKLs
 UtWq1opg==;
Received: from [191.204.194.148] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnzFb-0021Hz-LL; Fri, 28 Feb 2025 13:14:01 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 Raag Jadav <raag.jadav@intel.com>, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 0/2] drm: Create an app info option for wedge events
Date: Fri, 28 Feb 2025 09:13:51 -0300
Message-ID: <20250228121353.1442591-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.48.1
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

This patchset implements a request made by Xaver Hugl about wedge events:

"I'd really like to have the PID of the client that triggered the GPU
reset, so that we can kill it if multiple resets are triggered in a
row (or switch to software rendering if it's KWin itself) and show a
user-friendly notification about why their app(s) crashed, but that
can be added later."

From https://lore.kernel.org/dri-devel/CAFZQkGwJ4qgHV8WTp2=svJ_VXhb-+Y8_VNtKB=jLsk6DqMYp9w@mail.gmail.com/

This patchset depends on https://lore.kernel.org/dri-devel/20250225010221.537059-1-andrealmeid@igalia.com/

For testing, I've used amdgpu's debug_mask options debug_disable_soft_recovery
and debug_disable_gpu_ring_reset to test both wedge event paths in the driver.
To trigger a ring timeout, I used this app:
https://gitlab.freedesktop.org/andrealmeid/gpu-timeout

Thanks!

André Almeida (2):
  drm: Create an app info option for wedge events
  drm/amdgpu: Make use of drm_wedge_app_info

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 ++++
 drivers/gpu/drm/drm_drv.c                  | 16 +++++++++++++---
 drivers/gpu/drm/i915/gt/intel_reset.c      |  3 ++-
 drivers/gpu/drm/xe/xe_device.c             |  3 ++-
 include/drm/drm_device.h                   |  8 ++++++++
 include/drm/drm_drv.h                      |  3 ++-
 7 files changed, 48 insertions(+), 8 deletions(-)

-- 
2.48.1

