Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E013E0312
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 16:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5A66EA92;
	Wed,  4 Aug 2021 14:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC0E6EA83
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 14:25:30 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b13so2497120wrs.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 07:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQuykCSU14ER7aPsdknDej3VA3if5Vgjwk83wDTNP4U=;
 b=c+1Com2d9MSmj+7DRCIbNDCR0CNSe2ror5XQ1lFkF6zn/tr5+S1X7nlsKUExjuOfU1
 mCQ8x9rwazZPwiV5jDd7Ms+wD2Ztp/bKlh0bhyttBxfHUhxiC325N61A5XM3FzK7qFF3
 lXgMFwgk5auZkuHPHa8isJsZ7OLi35r6+fm7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQuykCSU14ER7aPsdknDej3VA3if5Vgjwk83wDTNP4U=;
 b=SMD2+1z6QlRb9Q5YUn3Jbowxg6Er5DQoNp+cIdKtIPwhTOQaKHa8FcR08RgH3xlikb
 zfdUOPM9+LauRJWV+kNqsfZkGOpCmBxh4BniAIXVpe5A2sw9qxalZc4rlZ1T9WWURWTl
 po8YPAG5ZxqbO/6iV49IVDOLfwtWQU2h/gnuG+cAHuHbznLxu82+Q+6kyjYNk77mC7Rb
 FX2MjhWwf8RfO804kXHENOPcQ4hRRbBQFIL+V39edF6xqyWBxm/CXMMj4zZSmjg2wRNm
 RA37WvWBSx+7h37+61n0HTk9zQOSZpchnGsZjMaY+1c16U4rUF0lVegR0aiTfuZJg5tg
 dQow==
X-Gm-Message-State: AOAM5321UOKDkLrD3GSB3LpnSuTO98VL0JXhBZRHthnBBH0Qg5l3Rv/I
 z4jIalN67GreINmDTSv8s0KAzg==
X-Google-Smtp-Source: ABdhPJy8fcbEbDT8RNWR//usYi0ul/CStS9yFX4fX4X1i0akAs306zpAA9prmx83fdgLH0bDFbkdlg==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr29065841wrj.143.1628087129232; 
 Wed, 04 Aug 2021 07:25:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b6sm3222682wrn.9.2021.08.04.07.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:25:27 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 0/9] remove rcu support from i915_address_space
Date: Wed,  4 Aug 2021 16:25:13 +0200
Message-Id: <20210804142522.4113021-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
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

Hi all,

Next round with some fixes:
- missed a conversion, 0day spotted it running sparse
- missed virtual engines in the last patch, intel-gfx-ci spotted that too
  (except it was mostly filtered out by a bogus cibuglog entry, so took a
  while to realize what's going on).

Old version:

https://lore.kernel.org/dri-devel/20210802154806.3710472-1-daniel.vetter@ffwll.ch/

Cheers, Daniel

Daniel Vetter (9):
  drm/i915: Drop code to handle set-vm races from execbuf
  drm/i915: Rename i915_gem_context_get_vm_rcu to
    i915_gem_context_get_eb_vm
  drm/i915: Use i915_gem_context_get_eb_vm in ctx_getparam
  drm/i915: Add i915_gem_context_is_full_ppgtt
  drm/i915: Use i915_gem_context_get_eb_vm in intel_context_set_gem
  drm/i915: Drop __rcu from gem_context->vm
  drm/i915: use xa_lock/unlock for fpriv->vm_xa lookups
  drm/i915: Stop rcu support for i915_address_space
  drm/i915: Split out intel_context_create_user

 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 86 ++++---------------
 drivers/gpu/drm/i915/gem/i915_gem_context.h   | 13 ++-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 12 ++-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  8 +-
 .../drm/i915/gem/selftests/i915_gem_context.c | 34 +++-----
 .../gpu/drm/i915/gem/selftests/mock_context.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_context.c       | 22 ++++-
 drivers/gpu/drm/i915/gt/intel_context.h       |  2 +
 drivers/gpu/drm/i915/gt/intel_engine.h        |  4 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 21 ++++-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  1 -
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  6 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  4 +-
 drivers/gpu/drm/i915/i915_trace.h             |  2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |  4 +-
 20 files changed, 105 insertions(+), 128 deletions(-)

-- 
2.32.0

