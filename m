Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DACBD39A4D1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 17:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05FF6E202;
	Thu,  3 Jun 2021 15:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB296E202
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 15:40:33 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id e1so3063702pld.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8oNdWPdrGPrEdCFAO37r71Yq8cXirl6qwMayugbLSAs=;
 b=b5Y42mycAZwcukfH/fUqBdhR10uUfCt2ZjXXE/EHXeOps7+emqSBllpcgp+d4Ozzjp
 P7Vsdf6gnAgNiKkUmvYDkEqpdLcIKTEdGXovRiMVG117j93mCH7FVVSO76Rc0C08/8d+
 lyTO6f19oakQJf/TXwg9vt3pFLo0NIaoPNGKTHyoSVJzzq8t7o9C8Aat3QRbJmTpJwLy
 n3djX++E+OkyiAAUzRUi/ICp+QueoAJxYhmMfPRt2Ubodr0m1O7o+X0xkYxvEZhyN2Wj
 wI1xeUyZGe2WBupefMNkn1nAtzCQ99RBwRs8HPaLnB2jf/pRG4LzAHvjJDfg/+HfR6J9
 9BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8oNdWPdrGPrEdCFAO37r71Yq8cXirl6qwMayugbLSAs=;
 b=Wihj+Qp0rEE5t63QPNDLdIYW8e/9a2YEFYcUGx9+MC03ItgKukNmLf8WhhZ2NowADJ
 J+hQEuQH2OfnrccmTt6j+LHUTbHLaTokKf+q4qtmfRD293VNcvPG9L9gybYWv5Iqxvhs
 fy7kUeyW71FtRWSZh1CBtqypvV+x77zklyXLqP9t2acOQ/i3dSOjtwL0D8qxZhPdt2DP
 V/t+BF+rDHqUmumwLzxLvcvGrcXb/jFCCXTCyO9A6VCOdPkcJDhCF6CTqHBlZ2UbwTbW
 K2bTcHpMJTLwWzHMMzf5zlBMv7mC3OV3gybwOOPnncMeMNnkXCR2B2zQsmZ3M2y/7HEc
 95aQ==
X-Gm-Message-State: AOAM531CpUnWe/ISr5Y6+CsKqHxK4ffUi0whi3RefiGSiiz8seroZkoz
 Jqu8+7ZNtYhXvhD6BFpb3a/GSQ==
X-Google-Smtp-Source: ABdhPJyDe/GXQ1S6S32L8jtIILsLFri/dyQa0FwGNTI+XPAHVUFWeMaDmzz1lSu/Z2tKBHvOceFDtw==
X-Received: by 2002:a17:90a:a106:: with SMTP id
 s6mr586571pjp.170.1622734832794; 
 Thu, 03 Jun 2021 08:40:32 -0700 (PDT)
Received: from omlet.lan ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id mp21sm2681789pjb.50.2021.06.03.08.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:40:32 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/i915: Get rid of fence error propagation (v2)
Date: Thu,  3 Jun 2021 10:40:22 -0500
Message-Id: <20210603154027.594906-1-jason@jlekstrand.net>
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
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  21 +-
 .../i915/gem/selftests/i915_gem_execbuffer.c  |   4 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   2 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c        | 199 ++++++++-------
 drivers/gpu/drm/i915/i915_drv.h               |   7 +-
 drivers/gpu/drm/i915/i915_request.c           |   8 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.c     |   5 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.h     |   2 +-
 drivers/gpu/drm/i915/i915_vma.c               |   3 +-
 12 files changed, 141 insertions(+), 351 deletions(-)

-- 
2.31.1

