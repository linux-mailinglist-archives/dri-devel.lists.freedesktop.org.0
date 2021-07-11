Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B83C3A01
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 05:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96186EB7C;
	Sun, 11 Jul 2021 03:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C45E6EB7B
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 03:53:42 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 o3-20020a4a84c30000b0290251d599f19bso3469560oog.8
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 20:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gMXuknKqCkFHmSM8lQPdYo22CMe6XmJt5Tlrogd1VDo=;
 b=gHrqYrM2RxDBweMGg7CXokuUUhDEb2KyPGWB5AT7t5KLXCs7JJmLq0GjkUQglAzReU
 X2eqPt8Yul3NRdJ8OZ643VN3fbxnxJdmdHZdI/WEe3pzMSGpOTS0kZmKZB4bkknR/kFA
 eoD/l0Bkj8FLdhyVX2FG3fHvQVlZDeQSn2sBZcKVR0hKfJFvy/MsyAIvQ7Z3xXuXSqEO
 y9rrZUDHtGok5WasbJwXqVqFQCwkcmGEoYjVHB8bEEQXScJUW3uvMvvIdBkL84SgvaeK
 l2IiSDsyinevQV9sj1gY5c501DodW0sdDMdWOYdU/Gq7V4TZwJXT9R5kcHRFJXio2qCH
 DENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gMXuknKqCkFHmSM8lQPdYo22CMe6XmJt5Tlrogd1VDo=;
 b=jmuVo4j2jyAa15vXWE2CufV9M/NmAlNurUAl3AHBskSmhbbOMrBbRHZBmIjvNe9LCL
 fDlNiU3rh21Z0YatHTZRsq4582iONoWFa9NNsUkQ9++bnyvd4PjtK/l2oW6fB+WoNFRU
 q6gII+C8U6RUlyHIvMP3Rv6jzXl/dQWPRHM/qgbE96g8pylShVvfEWZsZGqqKVmGuvge
 KA040GkGNBRinls6J5krOKozSWbVMHIiQpngFruVLAk8YMFR3yXdDo3UUwZA+T9raYo3
 Zb4ucWCI9SgWVcCozTyAYHKgDCincTFqbU9UDo9yqQz8E2CmbVi2GkF4+6Ey0uHgA7z2
 oHpw==
X-Gm-Message-State: AOAM5316OYDtCSjNs6pfNdKsDxTv70FOST2bxPD//ychVGd5QlfkE2LE
 VS48mNJbSfUje3k+mMfbLKjFXA==
X-Google-Smtp-Source: ABdhPJyhoVeAG/ZIbIW98IBfwy7OgUXdT4B/oOIdWcIYzpovtBlWvbu98ozmesSL6vOl9+Xriu/yaw==
X-Received: by 2002:a4a:8687:: with SMTP id x7mr33030312ooh.46.1625975621670; 
 Sat, 10 Jul 2021 20:53:41 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id a11sm2310188otr.48.2021.07.10.20.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 20:53:41 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/i915: Get rid of fence error propagation (v2)
Date: Sat, 10 Jul 2021 22:53:31 -0500
Message-Id: <20210711035336.803025-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fence error propagation is sketchy at best.  Instead of explicitly handling
fences which might have errors set in the code which is aware of errors, we
just kick them down the line and hope that userspace knows what to do when
a wait eventually fails.  This is sketchy at best because most userspace
isn't prepared to handle errors in those places.  To make things worse, it
allows errors to propagate across processes in unpredictable ways.  This is
causing hangs in one client to kill X11.

Unfortunately, there's no quick path from here to there thanks to the fact
that we're now running the command parser asynchronously and relying on
fence errors for when it fails.  This series first gets rid of asynchronous
command parsing and then cleans up from there.  There was never any real
use-case for asynchronous parsing and the platforms that rely heavily on
the command parser are old enough (Gen7) that, when we changed the way the
command parser works, it wasn't really a change anyone was asking for
anyway.

I think we probably want this whole mess back-ported.  I'm happy to take
suggestions on the strategy there because the history there is a bit
annoying and I'm not 100% sure where the Linux release cuts land.  In any
case, I'm happy to make a version of this series per-release if needed for
Greg to back-port.

v2 (Daniel Vetter):
 - Re-order to put the reverts first
 - Add ACKs from Daniel
 - Add better CC and Fixes tags

v3 (Daniel Vetter):
 - Rebase on drm-tip

Test-with: 20210711035204.802908-1-jason@jlekstrand.net
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>

Jason Ekstrand (5):
  drm/i915: Revert "drm/i915/gem: Asynchronous cmdparser"
  Revert "drm/i915: Propagate errors on awaiting already signaled
    fences"
  drm/i915: Remove allow_alloc from i915_gem_object_get_sg*
  drm/i915: Drop error handling from dma_fence_work
  Revert "drm/i915: Skip over MI_NOOP when parsing"

 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   4 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 227 +-----------------
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  20 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   2 +-
 .../i915/gem/selftests/i915_gem_execbuffer.c  |   4 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   2 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c        | 199 ++++++++-------
 drivers/gpu/drm/i915/i915_drv.h               |   7 +-
 drivers/gpu/drm/i915/i915_request.c           |   8 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.c     |   5 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.h     |   2 +-
 drivers/gpu/drm/i915/i915_vma.c               |   3 +-
 13 files changed, 142 insertions(+), 351 deletions(-)

-- 
2.31.1

