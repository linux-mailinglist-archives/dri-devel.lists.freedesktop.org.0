Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8683C8A1E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 19:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB42C6E457;
	Wed, 14 Jul 2021 17:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAD56E456;
 Wed, 14 Jul 2021 17:51:47 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id b6so2430940iln.12;
 Wed, 14 Jul 2021 10:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6easdx0Ab/n6kI4HD5metQAor9SuXg8otRFVzJJxle0=;
 b=BzNMSon0mZrh8FKzu/6WP+Uh4v5AZXNVz1pRhPxi5w0rxnuLhX0hBULPjGr3zIak6l
 ATN3STubFI7O2zaPqJyww99Fxu+UNlMRer1XqB6Yz03cQIupVB3zL67os77YIp/SkxhA
 Ce3ztRb5cSG8VUtEguS4gq0hSjxlDqcoCiZm9Nua5EVuoN+KOJHdIIZC4upy5zMnQSM1
 5ofEhogN/WuBBagvKpT0M2iweWKeayjSzF/KaDKi6wC3j/TBAEfB99wL5iesoV3NiCqz
 sb4Awee5TH7sPPbZKX0/Uch9pu2qgoQ3DkYFXHktcqgQfmd7oHRUcJDYqJBSJCdI5PBg
 jrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6easdx0Ab/n6kI4HD5metQAor9SuXg8otRFVzJJxle0=;
 b=OWJXjNcsT2tTQCWh5KFaQKzmypWv3SAf1gghCpJK5CtlgwQmVVM6615P8riVD4wGEP
 /VcMdfQkL0BAH2S/xyv0ZPBvqu4iVVRBXicYIvuIVbHKnuuMEknrfZ8TSDn1Hdwlj+CN
 3GI1vQxNzSofyGZX/fzpsQ13jxXGl7mLJ4Iel3MqhEGLxfpzYVvYQmRoy8CfXNz/X/Xf
 o8JCqJo23/U93UX63LFD9XNbMoD6Q856LoykNWUWk1kOyEH6KGNp2CnNgZif1nJJR0pU
 S1cd8mM4Re7WL2M6cXSguLYnJdWdRMRPpGf4kqIyoJmTiFOWZE7iyl9Eza8Fx49yIUoJ
 cDIw==
X-Gm-Message-State: AOAM532ui6YhYO/mDr0VHEGs8+3TyESluRdxHBMyjEX+W6TRBUl8A3K5
 EEYr56DDDaTjGFGRbJ2x5Vw=
X-Google-Smtp-Source: ABdhPJw/9JKeTpShohE+rQpOQYVy3HmTkj9zYna2y2zmzHKctVytOjzd8p4LIP+TePxldUKJQUXOrQ==
X-Received: by 2002:a92:1944:: with SMTP id e4mr7341674ilm.186.1626285107111; 
 Wed, 14 Jul 2021 10:51:47 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id b16sm706518ioh.5.2021.07.14.10.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:51:46 -0700 (PDT)
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
Subject: [PATCH v3 0/5] drm: use dyndbg in drm_print
Date: Wed, 14 Jul 2021 11:51:33 -0600
Message-Id: <20210714175138.319514-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi dri-devel,

Im pretty new in this particular playground.
Im using this to send, is it too spammy ? too --to ?
   git send-email --dry-run \
   --to-cmd='scripts/get_maintainer.pl --no-rolestats v3-000*.patch' \
   --to=jbaron@akamai.com v3-000*.patch

drm_debug_enabled() is called a lot (by drm_dev_dbg) to do unlikely
bit-tests to selectively enable debug printing; this is a good job for
dynamic-debug, IFF it is built with JUMP_LABEL.
 
This patchset enables the use of dynamic-debug to avoid those
drm_debug_enabled() overheads, if CONFIG_DRM_USE_DYNAMIC_DEBUG=y.

v3: fixes missed SOB, && on BOL, commit-log tweaks
    reordered patches, 1 is comment, 2 is whitespace.
    dropped RFC, to see what happens.
v2: https://lore.kernel.org/lkml/20210711055003.528167-1-jim.cromie@gmail.com/
v1: https://lore.kernel.org/lkml/20201204035318.332419-1-jim.cromie@gmail.com/

Doing so creates many new pr_debug callsites,
otherwise i915 has ~120 prdbgs, and drm has just 1;

  bash-5.1# modprobe i915
  dyndbg:   8 debug prints in module video
  dyndbg: 305 debug prints in module drm
  dyndbg: 207 debug prints in module drm_kms_helper
  dyndbg:   2 debug prints in module ttm
  dyndbg: 1720 debug prints in module i915

On amdgpu, enabling it adds ~3200 prdbgs, currently at 56 bytes each.
So CONFIG_DRM_USE_DYNAMIC_DEBUG=y affects resource requirements.

Im running this patchset bare-metal on an i915 laptop & an amdgpu
desktop (both as loadable modules).  I booted the amdgpu box with:

BOOT_IMAGE=(hd2,gpt2)/vmlinuz-5.13.0-dd7-13692-g8def25788f56 \
     root=UUID=mumble ro \
     rootflags=subvol=root00 rhgb \
     dynamic_debug.verbose=3 main.dyndbg=+p \
     amdgpu.debug=1 amdgpu.test=1 \
     "amdgpu.dyndbg=format ^[ +p"

That last line enables ~1700 prdbg callsites with a format like '[DML'
etc at boot, and amdgpu.test=1 triggers 3 minutes of tests, causing
~76k prdbgs in 409 seconds, before I turned them off with:

  echo module amdgpu -p > /proc/dynamic_debug/control

This is on top of master @ v5.14-rc1
Should I rebase onto something else ?

Jim Cromie (5):
  drm/print: fixup spelling in a comment
  drm_print.h: rewrap __DRM_DEFINE_DBG_RATELIMITED macro
  drm/print: RFC add choice to use dynamic debug in drm-debug
  drm/print: move conditional deref into macro defn
  i915: map gvt pr_debug categories to bits in parameters/debug_gvt

Note: 3/5, 5/5 have bits that are here for POC, but belong in
dynamic_debug.c.


 drivers/gpu/drm/Kconfig            |  13 ++++
 drivers/gpu/drm/drm_print.c        |  75 +++++++++++++++++-
 drivers/gpu/drm/i915/gvt/Makefile  |   4 +
 drivers/gpu/drm/i915/i915_params.c |  76 +++++++++++++++++++
 include/drm/drm_print.h            | 117 ++++++++++++++++++++---------
 5 files changed, 247 insertions(+), 38 deletions(-)

-- 
2.31.1

