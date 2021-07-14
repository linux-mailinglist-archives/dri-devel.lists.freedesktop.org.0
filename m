Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 101FB3C8BBD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 21:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A77E6E4CD;
	Wed, 14 Jul 2021 19:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F24F6E4F1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 19:34:26 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id y17so3530354pgf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 12:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0ZK0OGhoLWCKWHDAgtWF8mAHwi8jasbOkIu7JoKYlg=;
 b=OtbsVq9HN6rXvLFb2ftyeKXvuuEjhIt+4NxiVj1Aaud/Zgc6Ug42lEC9lzOtUAnPA3
 ibCACUxTprZ5SqYCdw+QARhW6/Eb6zNnDGhp7Zr3PiF1mVe0sd7uLpbbe8pV8wPcn/J2
 HSZYE/6cFamb1v7KUgtxRk6Ca/S+ep77gGHGya4ge9xdFODse5qjiJav2u1nYQ11U5Wb
 ztayEZdTnYFK8Nm5YmFKumVDbef8vPkCQVRbjLMItHk1N6vspeMBIfgS93GxUg1cpWZY
 jrR8DushwkPQjZdjEJEBT4+AQqffNwHYjP1p1WRZlTWkMYm5ASFIDCuY8uiwETsRm+Op
 fCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0ZK0OGhoLWCKWHDAgtWF8mAHwi8jasbOkIu7JoKYlg=;
 b=gT3z0uD6Pzt7ze/1BYVI2FlAKkTENI2ZKaxrbN3CSSPAr2QC+pRC5vNT6cgDZtlPij
 u/TVtb+m5YnoswS9uTx4QdzHsz5qb81QtbwPU3W/kWcIuDFUSkceP0uMKuKYXOEESOKa
 pLZgsMTBOS+6weCpCSpgtMDjuXAkNPCKmp/dF6jZTfQnaPc18FsIAt4hcpmeAzKZj3m5
 GqeEoiSyD43qBthZaehjhZkdvrqjxb6cTUbA2Z6J7SiMQ8YohsnMvcXxBM90T66giNaB
 HCV/DQEaEMzFFnOIbxWcAcSsDH++nC3ZGDQLo/L3lcU91gIdfXWSfrvtmFCJnifuBlsN
 Jk8g==
X-Gm-Message-State: AOAM531LkW6ayi6+d5JRRRlkqMYQFUiI81d04hkpYx87MLYWpcpSRUe6
 sgHQxE+pB15xDvp0kKuoF9QEMg==
X-Google-Smtp-Source: ABdhPJxn1Y8p0RMjjuyqjeC0VL1pc2dg2Za3wV/zmCcRnoqWzI15stddggOp9WM0HfjIGGRCyNhF/g==
X-Received: by 2002:a65:5603:: with SMTP id l3mr11226318pgs.190.1626291265744; 
 Wed, 14 Jul 2021 12:34:25 -0700 (PDT)
Received: from omlet.com ([134.134.139.71])
 by smtp.gmail.com with ESMTPSA id i1sm3679740pfo.37.2021.07.14.12.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 12:34:25 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/i915: Get rid of fence error propagation (v4)
Date: Wed, 14 Jul 2021 14:34:14 -0500
Message-Id: <20210714193419.1459723-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
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

v3 (Jason Ekstrand):
 - Rebase on drm-tip

v4 (Jason Ekstrand):
 - Rebase on drm-tip

Test-with: 20210714173141.1381686-1-jason@jlekstrand.net

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

