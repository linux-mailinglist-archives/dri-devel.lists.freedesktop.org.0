Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1C03BC924
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 12:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A83896B0;
	Tue,  6 Jul 2021 10:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9F78969E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 10:12:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso1874685wmj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GJFjpnfi1CrXf9Xlto1Y0oqA4kGU3rsK5ujAK/B2UD0=;
 b=RLSr0BMa2WuqooB9WTidkm9M10gQONkPGEe2TtNROAgiPX8sJYVD+SO8G65+hw5uvH
 wkS1+bLSKgnX1/3P7A81eDCwdpGH9URQJn/HxAvqKI3fP88t/xCIT7cvqEx1kvHtpLFL
 TjWvDsncXw0DDxGnoPlvjHfdZr0OK8sGDEx2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GJFjpnfi1CrXf9Xlto1Y0oqA4kGU3rsK5ujAK/B2UD0=;
 b=r9ERbtsDdsE8Gp3avYm35dYqnbX/6bbNoU3/vk5E8L5anrqNy2pKkhiIYX8FHQdhXv
 vis1UVpciUQ59i42Cux1/mCPIiWQ5TPlbtsAN1X0vftNpIrJOMJOslYXAlEG9XIc/LyY
 yihvttmXmePpfjYTNIF4S2XQJ+lLNAdc8Kgq0HGVdZ0R5PvZX2ozr/+dd99Je4K48FQ4
 RLp5jrPYoQoINeylv1bjN8kMf3tj8aLwDxuYttdx4xLqG2ambUaQwf14VpKyZaZ+QE0N
 ZxMrkokpriB9HQPuH7FtNdsjdNfVy5Zk3gKyiwDZH2gQ/3Vk1u0YnNZmCfpeX4tNmRND
 avoQ==
X-Gm-Message-State: AOAM533nV/EYiW7IYHZ/y+qNz+TzwtWIciqaF2L9tiOR+1NxJZi9jUcN
 w2NCrfVEUjL1SimJX0DOCdf3A2xowjYR7w==
X-Google-Smtp-Source: ABdhPJxDM9mfVZ/s7nd08cWobUUsT4n1KrJ55qceNrVz76A6WO7wHcLc/WGZ/OlJwJjbN9bjf0bqFg==
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr3886074wmh.120.1625566335334; 
 Tue, 06 Jul 2021 03:12:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm9862739wmc.42.2021.07.06.03.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:12:14 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/7] dma-resv fence DAG fixes
Date: Tue,  6 Jul 2021 12:12:02 +0200
Message-Id: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Finally I think I got them all in trying to audit all drivers for how they
deal with dma-resv dependencies in their command submission ioctl.

This series is incomplete, it also needs a few things from Christian
- nouveau fix for waiting for all fences
- various patches for fixing up dma-buf/resv functions to always wait for
  all fences (dma-buf poll, is_signalled, ...)
- I do include the one msm patch from Christian here since there was
  another issue in msm that needed fixing, and to make sure we have the
  complete set for msm

Two main things:
- fix drivers that currently can break the DAG. I opted for the dumbest
  possible way and not for rolling out dma_fence_chain - this can be fixed
  later on if needed.

- allow shared fences to be decoupled from the exclusive slot, which
  mostly means we can't skip waiting for the exclusive fence if there's
  shared fences present, we have to wait for all fences. This is a
  semantic change compared to what we've had thus far, but really makes a
  ton of sense given where things are heading towards.

Note that this means the import/export patches from Jason need to be
adjusted too to fit.

Plus some docs for dma-resv, they've been rather lacking.

Testing and review highly welcome.

Christian König (1):
  drm/msm: always wait for the exclusive fence

Daniel Vetter (6):
  drm/msm: Don't break exclusive fence ordering
  drm/etnaviv: Don't break exclusive fence ordering
  drm/i915: delete exclude argument from i915_sw_fence_await_reservation
  drm/i915: Always wait for the exclusive fence
  drm/i915: Don't break exclusive fence ordering
  dma-resv: Give the docs a do-over

 drivers/dma-buf/dma-resv.c                    |  22 +++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   8 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   8 +-
 drivers/gpu/drm/i915/i915_sw_fence.c          |  10 +-
 drivers/gpu/drm/i915/i915_sw_fence.h          |   1 -
 drivers/gpu/drm/msm/msm_gem.c                 |  16 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c          |   3 +-
 include/linux/dma-resv.h                      | 104 +++++++++++++++++-
 10 files changed, 142 insertions(+), 36 deletions(-)

-- 
2.32.0

