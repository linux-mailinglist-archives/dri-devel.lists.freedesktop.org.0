Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA623DC4F7
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 10:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CDC6E4A5;
	Sat, 31 Jul 2021 08:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8857A6E4A5
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 08:25:26 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so17729655pji.5
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mHdpvkbP+f+dtX797YzbOAyZjqosEwv+iX1MkyFepyo=;
 b=FgD1XECONq1EEacsOnbHTBSX9RTttVxZCK7tvs4bHdTD0PFR+DLQFGoGIB7yau7x3A
 aIjFV07RmNaD6CUmzpWt6gL0WCwibOpNLZs5IIRJEyAMGI/xeNOX6IXVyMQyWmgikBmr
 dtaxcd+sRmDLQk3l8YeRD9Zo7IoykCTeTLsfgeiAHBIcTbrSZf5a4B1Db/H06hWFzcQF
 B7Yexkb75+Yh8vk+ZKLhh2afiLafMC26x57vMDPdJOpdNxnSVayOemPL6NfTWIkfS5zv
 4JyUiwUYvvl3UE6C+W+Vm5m4Nfntb6R7jj2add3fXmLSrdvnLXCPvF4nyaIJiBndtd42
 /TJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mHdpvkbP+f+dtX797YzbOAyZjqosEwv+iX1MkyFepyo=;
 b=WA8nMy5iil0WW9Iie3S3hirs0dfxSitev2FX7GDG5bfi0PqkmjSIiLAVf3Cu6B5K/O
 qZF4DmTuBWwxtpT1pBdQKQqa34DQJh8jufr4Aqs3GtcJmCN/j/PLbsHQj27bgwZuKsQz
 gfwYiwRcmrDYt/cnsRuFn3Dg1GO/dT9401ctP2US/m9E/Wyvdmb1FFbxWagM+eKNVPoN
 v/ErJBVg+/82wt4WU4tRL3U15t4v9a25SCixmEhWyvbmmxWG9Y0ajRDYddiltlNVG0XH
 43JsT8L30Bvty77GZV9G7r0FuPBblMUC6usz7X+KPuAbztASDbB0tSzDkq5r5qwVssN8
 OFlQ==
X-Gm-Message-State: AOAM530DehrEwnDr5WFID7GuxNTc2bgqnxUL4LHdXuL0XmIBu4bkpoxN
 A0v/K1h0FtcazPRLtAy0qMY=
X-Google-Smtp-Source: ABdhPJzV88a/NgZkzpC2Uk3z53JeCgHQMRG5Zr9JcgffkGLRyOiiycYGDbfxycax3nceUGRo8HTqOQ==
X-Received: by 2002:a17:90b:f92:: with SMTP id
 ft18mr7360311pjb.31.1627719926122; 
 Sat, 31 Jul 2021 01:25:26 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id mq7sm3182124pjb.50.2021.07.31.01.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 01:25:25 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, boqun.feng@gmail.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 0/2] locking/lockdep,
 drm: apply new lockdep assert in drm_auth.c
Date: Sat, 31 Jul 2021 16:24:56 +0800
Message-Id: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Following a discussion on the patch ("drm: use the lookup lock in
drm_is_current_master") [1], Peter Zijlstra proposed new lockdep_assert
helpers to make it convenient to compose lockdep checks together.

This series includes the patch that introduces the new lockdep helpers,
then utilizes these helpers in drm_is_current_master_locked in the
following patch.

v1 -> v2:
Patch 2:
- Updated the kerneldoc on the lock design of drm_file.master to explain
the use of lockdep_assert(). As suggested by Boqun Feng.

Link: https://lore.kernel.org/lkml/20210722092929.244629-2-desmondcheongzx@gmail.com/ [1]

Best wishes,
Desmond

Desmond Cheong Zhi Xi (1):
  drm: add lockdep assert to drm_is_current_master_locked

Peter Zijlstra (1):
  locking/lockdep: Provide lockdep_assert{,_once}() helpers

 drivers/gpu/drm/drm_auth.c |  6 +++---
 include/drm/drm_file.h     |  4 ++++
 include/linux/lockdep.h    | 41 +++++++++++++++++++-------------------
 3 files changed, 28 insertions(+), 23 deletions(-)

-- 
2.25.1

