Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F913C3B1D
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 09:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A7C6EB90;
	Sun, 11 Jul 2021 07:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16626EB84;
 Sun, 11 Jul 2021 05:50:12 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id l5so18015997iok.7;
 Sat, 10 Jul 2021 22:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RCPL29qIKnKZKArq5zsuG+4bnxkVvxWb2dNm1WT6mf8=;
 b=FtgJf8+lm9Jw2zuHcFq8yHyYE9Za+t1wpfVGe4pNR2hLepEyFXfbcy4nJTz2O55NOa
 dmuoiB2rqb8nyl8EtjTo64ENTdtFYzzJAky2JuOy2aYMOSk0FedqxZYDtR2/GmPEUZhc
 UPXarxCUa6yVyaJ6gyeiOEy6vbFz+4LbbuMB1YxPqQCTYW14S9NrlC1RiegTThPRtJ8Y
 NSCaaUN0UawFs/fx4em62LxMiGzjjNZG8x82jWqJLOgcYBQiG+cMq/6xrE8FavIEmQZ0
 52yNoSHuYvjfMtL3yAmpyrs4GCbze6oRWYpU+gkIvz9536/7/V/OBRfRMXcJ0ujoiD8U
 arUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RCPL29qIKnKZKArq5zsuG+4bnxkVvxWb2dNm1WT6mf8=;
 b=NBDjYBVtJxkNcbD5hnqiU44gEQ3NJ39+k395IdC+ds34qP9B/THo1bReognHDI+VQy
 F0LjMcJkkfOl+dOldaD59oBUyb+jHzMUhgdl/jdLOmu87oIRTgdGwICZarq2WPT8F1pI
 Fy5nsTLb98bg6QbPQ8oUD35b4/henqAgYvY19s4V4Ml6bueeDInsB/GIByWb+EpuLcGE
 AipQGJd2Olx/xctxdZdRPvYJNywHvrSPnV1iXKFhccnuj1K3gDgVe2W4Sm4RWsOsbFO8
 HQcklIN5SpiUmfb/pR7wKsTm3d9DPUYkwzn15dGxv0YXWLIAZxc4pZKGGzeCIF2p4DHz
 Yx1A==
X-Gm-Message-State: AOAM530K61X92J4T8aVbjJU1+Ngoa8paSjlavKBL6DjC1o+90z7c+kS9
 Xj2yei/j6+QJ49WGa4n/U3c=
X-Google-Smtp-Source: ABdhPJy3x300qWkzveHT72BAIzXyFWEizGbKobKv9ZDxvJSQDWE4xAAJUsN56EWTboU9rLEPlKhH4A==
X-Received: by 2002:a02:b006:: with SMTP id p6mr33668942jah.64.1625982612026; 
 Sat, 10 Jul 2021 22:50:12 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x8sm5852400ilq.63.2021.07.10.22.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 22:50:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH v2 0/4] Allow using dyndbg to replace drm_debug_enabled
Date: Sat, 10 Jul 2021 23:49:58 -0600
Message-Id: <20210711055003.528167-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 11 Jul 2021 07:52:04 +0000
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
Cc: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_debug_enabled() is called a lot to do unlikely bit-tests to
control debug printing; this is a good job for dynamic-debug, IFF it
is built with JUMP_LABEL.
 
Enable the use of dynamic-debug to avoid drm_debug_enabled()
overheads, opt in with CONFIG_DRM_USE_DYNAMIC_DEBUG=y.

I have this patchset running bare-metal on an i915 laptop & an amdgpu
desktop (both as loadable modules).

I booted the amdgpu box with:

BOOT_IMAGE=(hd2,gpt2)/vmlinuz-5.13.0-dd7-13692-g8def25788f56 \
     root=UUID=mumble ro \
     rootflags=subvol=root00 rhgb \
     dynamic_debug.verbose=3 main.dyndbg=+p \
     amdgpu.debug=1 amdgpu.test=1 \
     "amdgpu.dyndbg=format ^[ +p"

That last line activates ~1700 callsites with a format like '[DML' etc
at boot, causing ~76k prdbgs in 409 seconds, before I turned them off
with:

  echo module amdgpu -p > /proc/dynamic_debug/control

[root@gandalf jimc]# journalctl -b-0 | grep -P '\[(DML|VBLANK|SURFACE|BIOS|BANDWIDTH)' | wc
  68708  578503 5054437
[root@gandalf jimc]# journalctl -b-0 | grep -P '\[(DML|VBLANK|SURFACE|BIOS|BANDWIDTH|\w+)' | wc
  76298  661176 6028087

IOW, things appear to hold up under some stress.

this is on top of master @ v5.13-13688-gde5540965853

v1 is here:
https://lore.kernel.org/lkml/20201204035318.332419-1-jim.cromie@gmail.com/

Jim Cromie (4):
  drm_print.h: rewrap __DRM_DEFINE_DBG_RATELIMITED macro
  drm: fixup comment spelling
  drm: RFC add choice to use dynamic debug in drm-debug
  i915: map gvt pr_debug categories to bits in parameters/debug_gvt

 drivers/gpu/drm/Kconfig            |  13 ++++
 drivers/gpu/drm/drm_print.c        |  75 +++++++++++++++++-
 drivers/gpu/drm/i915/gvt/Makefile  |   4 +
 drivers/gpu/drm/i915/i915_params.c |  76 ++++++++++++++++++
 include/drm/drm_print.h            | 119 ++++++++++++++++++++---------
 5 files changed, 249 insertions(+), 38 deletions(-)

-- 
2.31.1

