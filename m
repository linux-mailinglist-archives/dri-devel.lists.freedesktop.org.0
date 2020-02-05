Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 154B915340A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 16:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CD289BF6;
	Wed,  5 Feb 2020 15:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc33.google.com (mail-yw1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD17789B61;
 Wed,  5 Feb 2020 15:40:09 +0000 (UTC)
Received: by mail-yw1-xc33.google.com with SMTP id z141so2657576ywd.13;
 Wed, 05 Feb 2020 07:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bohzs8AwVgU2iFXq9B+9l3fxUImITlOT2NR+ughqP3k=;
 b=IcoCQJ4MeoflC721q6eA6SRzmBuAGPJD8dhg3Hz1uO9ozSY8AzlpNZ3TzUODDZ5AHr
 tik7H5ugp6VsDpFQb8SnQLGB8ESnyqUrK1FHIBJ/00IKP++2locgsINIwEfnchRO9y+l
 OWO5xKZgC1g+S35Ob0KmvqpEXicMR7cDgyArBvKgk8aI193sLE6nL87ej2IT21Rnd9YH
 56jsvFI7JMNSsAjd43Y/sCv86uI1ksn3wD3b3CvPZ+fpk36sYikeyRK5N7eel6UjAxBT
 fWDjm45wI7rzdi9esMlbTczlNuavkmrnofg/Q/EbNrBWzHhwCTNxt8CsWvH+AwDEbQHw
 63Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bohzs8AwVgU2iFXq9B+9l3fxUImITlOT2NR+ughqP3k=;
 b=K56IEYB/QUkIK8WTb+kFtb6uvaUHa0ZwJQywIKas1seOnplztDmVaz212p94zzK+4H
 a3ejazBZsZ87hoeiGU64nCnx79n9jQs2T0/liWd5yCTO/TK+BsgHzhexcI4z9mjl59dV
 4PT3Ive+CxgI7cn2+zGCS2LzVcQdaA+kNjb09MbE6PMV9502Z+l5g16fa+1fvUyAP3Qj
 JVQM3TAo6qB2uZuP2EDukRWANody24GbSumUmFmh5wyEFuT80UMdIsIAdCG6e1CbZqKG
 vjeZlJMJLESlqDskbuKQNiZOeDuZB+U0JpV3A5PZKoD+K9ksF1VEZ+HxeeG3jlX/P2mJ
 4+dA==
X-Gm-Message-State: APjAAAXWHc7GE9CqtBv7XgQIsF93H+bbSFE56/kbQ9cwoUTfgU3O1RTD
 m+LyMPX0p/7MSgKy3Tmvg7q1S3fp
X-Google-Smtp-Source: APXvYqyjteGbAvFxSbDJ5em3/tkhD/fGCA/rY5wPLQYEm0pg25BxqZ2ohwwgPzFErFNxHa1SEn0MXg==
X-Received: by 2002:a25:c6c5:: with SMTP id
 k188mr31164121ybf.204.1580917208710; 
 Wed, 05 Feb 2020 07:40:08 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id q185sm61256ywh.61.2020.02.05.07.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 07:40:08 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/15] amdgpu: remove load and unload callbacks (v2)
Date: Wed,  5 Feb 2020 10:39:45 -0500
Message-Id: <20200205154000.536145-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are deprecated and the drm will soon start warning when drivers still
use them.  It was a long and twisty road, but seems to work.

v2: Add additional patch (13/15) which should fix the crash reported by
Thomas Zimmermann.

Alex Deucher (15):
  drm/amdgpu: rename amdgpu_debugfs_preempt_cleanup
  drm/amdgpu/ttm: move debugfs init into core amdgpu debugfs
  drm/amdgpu/pm: move debugfs init into core amdgpu debugfs
  drm/amdgpu/sa: move debugfs init into core amdgpu debugfs
  drm/amdgpu/fence: move debugfs init into core amdgpu debugfs
  drm/amdgpu/gem: move debugfs init into core amdgpu debugfs
  drm/amdgpu/regs: move debugfs init into core amdgpu debugfs
  drm/amdgpu/firmware: move debugfs init into core amdgpu debugfs
  drm/amdgpu: don't call drm_connector_register for non-MST ports
  drm/amdgpu/display: move debugfs init into core amdgpu debugfs
  drm/amd/display: move dpcd debugfs members setup
  drm/amdgpu/display: add a late register connector callback
  drm/amdgpu/display: split dp connector registration
  drm/amdgpu/ring: move debugfs init into core amdgpu debugfs
  drm/amdgpu: drop legacy drm load and unload callbacks

 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 11 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 67 ++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 17 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |  7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c        |  9 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h        |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      | 15 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 14 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  3 +
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c      |  8 +--
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  1 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 +++----
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  3 +
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 13 ++--
 19 files changed, 131 insertions(+), 88 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
