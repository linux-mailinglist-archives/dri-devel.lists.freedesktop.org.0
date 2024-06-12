Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2A4905E62
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 00:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA1410E929;
	Wed, 12 Jun 2024 22:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YEdXR2k/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B9D10E92C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 22:24:44 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1f6fada63a6so3228225ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 15:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718231083; x=1718835883;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hvJdqdXbOsMsvfolWLIhz5jKfl0lZRFyGewDbo4ybFE=;
 b=YEdXR2k/r39kcrdtnR0P6FGWAq4svalvmuvg4acywWG16xmHTt5WhnJ19hsFbxQSi+
 MVMMLjoOsXE7O3iFoSeRrNV8an/tsRRPkEaHICa4qX7rkRcvyax+/W2z+pbvex7Y1kWm
 uyX0KI3MIKTKdD4yj4xTreHqOPYWNuru1yw/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718231083; x=1718835883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hvJdqdXbOsMsvfolWLIhz5jKfl0lZRFyGewDbo4ybFE=;
 b=RTnGUaYu48hI6B2yX/Ogsk97EaRUWrcpFLrwUSrYPHfwFdnHEmj4/+i5hkspGemVMb
 pB4DMnnQGI9E570sJvSmI0yXk7kgjZqCK6SNwS40SgIy7zSYQUHSkyH7DkVdceY5mhTf
 8oxEfePYfJS5ady1xgOYo2zjxSEUhdqSbsueacMMdhGmoJE/2jmqUHdChj4fukxm2DeL
 eHna4ZRIxmdHlxeqZ46dixirUfFXe0izuC2McwriNJ0u3zcuCHJhO7lDS1e7Qspd/Csl
 7D1j/R4uLG/xlXDLFFPhYawS8P0BBtIE7MEfzjJWTYfkY+XGNf9cVR44iWFfr9POQICw
 cdqQ==
X-Gm-Message-State: AOJu0YxKfGi4JgVnOcvp1++sdTv0mqOX2iOeUtuoHLP1Uc1mjrv2JO8A
 W7YNJZA1Mb3QGWOzjupdXCgAYOR1eXOCPq1TUyArXjnbm3SDNboXa1MpbKJLO1olS4G9QpIDbQY
 =
X-Google-Smtp-Source: AGHT+IFAyr/OLXB4J5n0QdHaEa3zXIRNItrD8acC+tRkbc51QXKJOk4EcFMZStf7hJ6gv4GGb6OcUA==
X-Received: by 2002:a17:902:e851:b0:1f6:65d3:296 with SMTP id
 d9443c01a7336-1f83b637bdcmr34717685ad.29.1718231083000; 
 Wed, 12 Jun 2024 15:24:43 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:2816:6a42:9074:18cc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6f30acda9sm87914105ad.198.2024.06.12.15.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 15:24:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Candice Li <candice.li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Le Ma <le.ma@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Lyude Paul <lyude@redhat.com>, Ma Jun <Jun.Ma2@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Orson Zhai <orsonzhai@gmail.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Steven Price <steven.price@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Victor Lu <victorchengchi.lu@amd.com>, amd-gfx@lists.freedesktop.org,
 chenxuebing <chenxb_99091@126.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: [PATCH v2 0/8] drm: make leftover drivers call
 drm_atomic_helper_shutdown() at the right times
Date: Wed, 12 Jun 2024 15:23:40 -0700
Message-ID: <20240612222435.3188234-1-dianders@chromium.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
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


This patch series is the leftovers of a patch series sent in September
2023 [1] in an attempt to get some of the patches landed finally.

This patch series originally came about after a _long_ discussion
between me and Maxime Ripard in response to a different patch I sent
out [2]. As part of that discussion, we realized that it would be good
if DRM drivers consistently called drm_atomic_helper_shutdown()
properly at shutdown and driver remove time as it's documented that
they should do. The eventual goal of this would be to enable removing
some hacky code from panel drivers where they had to hook into
shutdown themselves because the DRM driver wasn't calling them.

It turns out that quite a lot of drivers seemed to be missing
drm_atomic_helper_shutdown() in one or both places that it was
supposed to be. This patch series attempts to fix all the drivers that
I was able to identify.

NOTE: fixing this wasn't exactly cookie cutter. Each driver has its
own unique way of setting itself up and tearing itself down. Some
drivers also use the component model, which adds extra fun. I've made
my best guess at solving this and I've run a bunch of compile tests
(specifically, allmodconfig for amd64, arm64, and powerpc). That being
said, these code changes are not totally trivial and I've done zero
real testing on them. Making these patches was also a little mind
numbing and I'm certain my eyes glazed over at several points when
writing them. What I'm trying to say is to please double-check that I
didn't do anything too silly, like cast your driver's drvdata to the
wrong type. Even better, test these patches!

Apparently most of these drivers now land through drm-misc [3], so
hopefully they can land. The two that don't (amdgpu and radeon) are
the ones I'm most ucertain about anyway so I've stuck them at the end.
If I've totally buggered those up feel free to take my patch as a bug
report and submit your own proper fix. ...or if there's some reason
that we don't need to do anything for those drivers then let me know
and we can drop them.

I'd like to call out a few drivers that I _didn't_ fix in this series
and why. If any of these drivers should be fixed then please yell.
- DRM drivers backed by usb_driver (like gud, gm12u320, udl): I didn't
  add the call to drm_atomic_helper_shutdown() at shutdown time
  because there's no ".shutdown" callback for them USB drivers. Given
  that USB is hotpluggable, I'm assuming that they are robust against
  this and the special shutdown callback isn't needed.
- ofdrm and simpledrm: These didn't have drm_atomic_helper_shutdown()
  in either shutdown or remove, but I didn't add it. I think that's OK
  since they're sorta special and not really directly controlling
  hardware power sequencing.
- virtio, vkms, vmwgfx, xen: I believe these are all virtual (thus
  they wouldn't directly drive a panel) and adding the shutdown
  didn't look straightforward, so I skipped them.

I've let each patch in the series get CCed straight from
get_maintainer. That means not everyone will have received every patch
but everyone should be on the cover letter. I know some people dislike
this but when touching this many drivers there's not much
choice. dri-devel and lkml have been CCed and lore/lei exist, so
hopefully that's enough for folks. I'm happy to add people to the
whole series for future posts.

[1] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid
[3] https://lore.kernel.org/r/Zmm6_27GikpmT3HQ@phenom.ffwll.local

Changes in v2:
- Gathered whatever hadn't landed, rebased, and reposted.

Douglas Anderson (8):
  drm/kmb: Call drm_atomic_helper_shutdown() at shutdown time
  drm/nouveau: Call drm_atomic_helper_shutdown() or equiv at shutdown
    time
  drm/tegra: Call drm_atomic_helper_shutdown() at shutdown time
  drm/arcpgu: Call drm_atomic_helper_shutdown() at shutdown time
  drm/sprd: Call drm_atomic_helper_shutdown() at remove time
  drm/gma500: Call drm_helper_force_disable_all() at shutdown/remove
    time
  drm/radeon: Call drm_helper_force_disable_all() at shutdown/remove
    time
  drm/amdgpu: Call drm_atomic_helper_shutdown() at shutdown time

 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  2 ++
 drivers/gpu/drm/gma500/psb_drv.c           |  8 ++++++++
 drivers/gpu/drm/kmb/kmb_drv.c              |  6 ++++++
 drivers/gpu/drm/nouveau/nouveau_display.c  |  9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_display.h  |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c      | 13 +++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h      |  1 +
 drivers/gpu/drm/nouveau/nouveau_platform.c |  6 ++++++
 drivers/gpu/drm/radeon/radeon_drv.c        |  7 ++++++-
 drivers/gpu/drm/sprd/sprd_drm.c            |  4 +++-
 drivers/gpu/drm/tegra/drm.c                |  6 ++++++
 drivers/gpu/drm/tiny/arcpgu.c              |  6 ++++++
 14 files changed, 78 insertions(+), 2 deletions(-)

-- 
2.45.2.505.gda0bf45e8d-goog

