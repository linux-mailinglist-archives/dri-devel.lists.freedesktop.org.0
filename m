Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD8563D6CE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 14:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A369389BEC;
	Wed, 30 Nov 2022 13:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A1C10E0FC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 13:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669815288; x=1701351288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QWwrpJXQvsBG2eQrYwTWSR2gPSavf72lsIFBrm7ixf4=;
 b=aJUYz4Hi4EwIqz/FQvscHTGDJgh6F1/9svOkYooxUQDVqmME9tTyM+xG
 MvqL5Sh981iTWAozldJaG+LNftYA1JQmZgQZ58g/jNvEQHtzSHwQj2p51
 +0NLE2K9nAiQ3yGbbaXSG4S3W4g3M3vbEitpz5W2XCBNzwr3Dt7z0hzMZ
 r+YTRnZ7qYQfgmoTpCLEXaxhevYfaytTZphm8EYXLfi17gGrELIYjnY2i
 fXVtQqgozI2IVmwWW6mCuptuEXEVI5209QBIuwfEuRTM3Wo6axYmiJ4OC
 38oiFfiW6UMVP7YClEhKnE9YOX2k9Dky6pkM1pFgE5jU/7pmpi9E5DCOt w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="295091357"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="295091357"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 05:34:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="973105186"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="973105186"
Received: from hpvpnmu01.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.197.198])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 05:34:27 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 0/3] File owner follows use
Date: Wed, 30 Nov 2022 13:34:04 +0000
Message-Id: <20221130133407.2689864-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Not so long ago when I sent out my DRM cgroup controller RFC I had some pieces
in it which were tracking the real client using a specific drm_file. Christian
then suggested that should probably be extracted and improved in the DRM core
from the start, which was on his wishlist for a long period. So this mini-series
is an attempt at that.

First patch is just a logging cleanup, 2nd probably makes sense on it's own
since it replaces tracking thread names with progresses which are more
meaningful. Third one is where action is.

The benefit on it's own is rather small, especially relative to the complication
to track it, where it essentially changes the debugfs clients output from:

             command   pid dev master a   uid      magic
                Xorg  1744   0   y    y     0          0
                Xorg  1744   0   n    y     0          1
                Xorg  1744   0   n    y     0          2
                Xorg  1744   0   n    y     0          3

To something like:

             command  tgid dev master a   uid      magic
                Xorg   830   0   y    y     0          0
       xfce4-session   880   0   n    y     0          1
               xfwm4   943   0   n    y     0          2
           neverball  1095   0   n    y     0          3

One ugly part is one synchronise_rcu() on the first (hopefully) only fd
handover. The latency of that could be improved by further wrapping and
kfree_rcu() if desired.

Another part I am unsure of is whether master nodes are ever handed over via
sockets. I assumed no and exluded them from ownership updates. If they need to
be then drm_master_check_perm() would break, I think. So looking for some
feedback in this area please.

Tvrtko Ursulin (3):
  drm: Replace DRM_DEBUG with drm_dbg_core in file and ioctl handling
  drm: Track clients by tgid and not tid
  drm: Update file owner during use

 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |  6 ++-
 drivers/gpu/drm/drm_auth.c              |  3 +-
 drivers/gpu/drm/drm_debugfs.c           | 12 +++---
 drivers/gpu/drm/drm_file.c              | 53 ++++++++++++++++++++-----
 drivers/gpu/drm/drm_ioc32.c             | 13 +++---
 drivers/gpu/drm/drm_ioctl.c             | 28 +++++++------
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  5 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     |  6 ++-
 include/drm/drm_file.h                  | 13 +++++-
 9 files changed, 97 insertions(+), 42 deletions(-)

-- 
2.34.1

