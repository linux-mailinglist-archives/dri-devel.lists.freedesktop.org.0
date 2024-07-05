Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66064928B5F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 17:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A6010E152;
	Fri,  5 Jul 2024 15:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="RK7RVLF9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C188F10E152
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 15:14:42 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ee86c09963so2784921fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720192481; x=1720797281; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sY3Bk5gxpl8CBAzjGC4Q5ufFUhr18OlzUViMV+Tpk6Q=;
 b=RK7RVLF94+lERDtu/IDCoyx3rK01OIFuUBdl5mMvrZopt7qvEi2jZiUDn/WGelPMYu
 v93GehKgkg0ftrUh+LU5oWKbgwcjSXKDgglUwSLsdkuS90S0pwyy9zu3BjNUfCHgQTgJ
 wEoungA2T2wWetMLTmA0Xt8jUoBGVZyppZ5Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720192481; x=1720797281;
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sY3Bk5gxpl8CBAzjGC4Q5ufFUhr18OlzUViMV+Tpk6Q=;
 b=opQ7fFK1OflNmytUntWV/UZn3bdP7kPBRw4aA9dWmMK+KAh1Qouo093+HSms3YJ+2+
 qHI4/NuYt/0FF+3DvdzJKONf6wYYBuFI4Q8KwvriF+C0pRqyjGS90yvYXxN5UosW3ogD
 ZP9KEkMNCm8eRwQFs1YSuHDD0Nn4k4cHyEBX06PjZ0KOWP12AmavGAtl2NHnki77ri+W
 vo19rLuYlQj+KNXpatLkZoZS5OaI4b50Zf+DlUxsVBBA+EvNH4AR+gr0AtKltK1VL2r8
 tmQMN7i4oQc/fAjxZZsw07vopwdmwX0nN0Jb9Gq1StRbDZcqDQo/5OOrNNFXQrCpEnIH
 KOvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNYbcjiwYDPoHudMvVZXEpHaTFxBdK4qlgr6DS8L9B8Rd202eES+7T+RkukAADmWYmSD/gRcesvAp/0Dufn998M5eVkQ5jdwsVBXZd3Y4X
X-Gm-Message-State: AOJu0YxwABeq7tksbnllj43kB0o4Jdl3OD2/1pgeHmx1WQup09GqB9ua
 Up3q5uKwQQa5am4rLdzWgl2w16Xw8HiupGR4HP0FI0D+IpOXGM49jlvSH3RLRBY=
X-Google-Smtp-Source: AGHT+IGs8Ho/KWgUMyRlrMRcWi0P3DmQIACNh3RTD/PyyzOhyfwljzyw2Z8tMfSfoepNS97p/7uHqg==
X-Received: by 2002:a2e:9089:0:b0:2ee:87d8:c937 with SMTP id
 38308e7fff4ca-2ee8ec4e32cmr33330071fa.0.1720192480745; 
 Fri, 05 Jul 2024 08:14:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d5116sm67180705e9.10.2024.07.05.08.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 08:14:40 -0700 (PDT)
Date: Fri, 5 Jul 2024 17:14:38 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PULL] drm-fixes for v6.10
Message-ID: <ZogN3gNPBVb29Vgl@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Operating-System: Linux phenom 6.9.7-amd64 
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

Hi Linus,

Dave is on vacations, should be back next week. Just small fixes all over
here, all quiet as it should.

Cheers, Sima

drm-fixes-2024-07-05:
drm-fixes for v6.10-rc7

drivers:
- amd: mostly amdgpu display fixes + radeon vm NULL deref fix
- xe: migration error handling + typoed register name in gt setup
- i915: usb-c fix to shut up warnings on MTL+
- panthor: fix sync-only jobs + ioctl validation fix to not EINVAL
  wrongly
- panel quirks
- nouveau: NULL deref in get_modes

drm core:
- fbdev big endian fix for the dma memory backed variant

drivers/firmware:
- fix sysfb refcounting

Cheers, Daniel

The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:

  Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-07-05

for you to fetch changes up to 3c6f5afd91cfacba9f43fd388f2d88c85195ae32:

  Merge tag 'amd-drm-fixes-6.10-2024-07-03' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2024-07-05 12:54:14 +0200)

----------------------------------------------------------------
drm-fixes for v6.10-rc7

drivers:
- amd: mostly amdgpu display fixes + radeon vm NULL deref fix
- xe: migration error handling + typoed register name in gt setup
- i915: usb-c fix to shut up warnings on MTL+
- panthor: fix sync-only jobs + ioctl validation fix to not EINVAL
  wrongly
- panel quirks
- nouveau: NULL deref in get_modes

drm core:
- fbdev big endian fix for the dma memory backed variant

drivers/firmware:
- fix sysfb refcounting

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/atomfirmware: silence UBSAN warning

Alvin Lee (1):
      drm/amd/display: Account for cursor prefetch BW in DML1 mode support

Boris Brezillon (2):
      drm/panthor: Don't check the array stride on empty uobj arrays
      drm/panthor: Fix sync-only jobs

Daniel Vetter (4):
      Merge tag 'drm-intel-fixes-2024-07-02' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-07-04' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-07-04' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.10-2024-07-03' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Fangzhi Zuo (1):
      drm/amd/display: Update efficiency bandwidth for dcn351

Imre Deak (1):
      drm/i915/display: For MTL+ platforms skip mg dp programming

John Schoenick (1):
      drm: panel-orientation-quirks: Add quirk for Valve Galileo

Ma Ke (1):
      drm/nouveau: fix null pointer dereference in nouveau_connector_get_modes

Matt Roper (1):
      drm/xe/mcr: Avoid clobbering DSS steering

Matthew Auld (1):
      drm/xe: fix error handling in xe_migrate_update_pgtables

Matthew Schwartz (1):
      drm: panel-orientation-quirks: Add labels for both Valve Steam Deck revisions

Pierre-Eric Pelloux-Prayer (1):
      drm/radeon: check bo_va->bo is non-NULL before using it

Roman Li (1):
      drm/amd/display: Fix array-index-out-of-bounds in dml2/FCLKChangeSupport

Thomas Hellström (1):
      drm/ttm: Always take the bo delayed cleanup path for imported bos

Thomas Huth (1):
      drm/fbdev-generic: Fix framebuffer on big endian devices

Thomas Zimmermann (1):
      firmware: sysfb: Fix reference count of sysfb parent device

Tom Chung (3):
      drm/amd/display: Reset freesync config before update new state
      drm/amd/display: Add refresh rate range check
      drm/amd/display: Fix refresh rate range for some panel

 drivers/firmware/sysfb.c                           | 12 +++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 53 +++++++++++++++++++++-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  3 ++
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  1 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |  2 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |  2 +-
 drivers/gpu/drm/drm_fbdev_generic.c                |  3 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |  9 +++-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  3 ++
 drivers/gpu/drm/nouveau/nouveau_connector.c        |  3 ++
 drivers/gpu/drm/panthor/panthor_drv.c              |  6 +--
 drivers/gpu/drm/panthor/panthor_sched.c            | 44 +++++++++++++-----
 drivers/gpu/drm/radeon/radeon_gem.c                |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  1 +
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |  6 +--
 drivers/gpu/drm/xe/xe_migrate.c                    |  8 ++--
 include/uapi/drm/panthor_drm.h                     |  5 ++
 17 files changed, 132 insertions(+), 31 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
