Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C40EBF8F45
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 23:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99D210E34F;
	Tue, 21 Oct 2025 21:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqB7DzJd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487B510E34D;
 Tue, 21 Oct 2025 21:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761082796; x=1792618796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dm7fBJrmeRqUOd7SUAITD1ocwsj7sewHlX2fP6+4l4U=;
 b=hqB7DzJdzQQmDl0Z0+swSpDImmGMbjCtkoKCWcf6ZIm935httSwUW1WZ
 OxhRvIAe0zUaHhsiNQY58dw/TbOgUhAEt0X52B0rTDYiDpi0KxyxxK7Ze
 /BWotpvYfNPfmURBJDlWlJUCu8/FLdOezN3ibk4YUOu2RC4qhpzzfpRtK
 Bixf34dcfS70g90JoS5mBjL2jZccRYMdZmIrLJItH0ffw1phNOvJgsC4G
 XfUxXaaFye2HKcbPKy28fJ5EM0yJkSexRXETGJQWD9R1OihJW8YjfgNGv
 ScXAvb9acwG2wNBlqe/POFEhoITv9q93tZ+55bFKOcd5ClIk3fAQYT+aJ A==;
X-CSE-ConnectionGUID: 8Uyc9H3aRXmqsUvxNBq04A==
X-CSE-MsgGUID: IQCcmbSLSX66CxZJF6w5/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63131555"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63131555"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:39:56 -0700
X-CSE-ConnectionGUID: L5qe20RJQYe7LvDpnTGhug==
X-CSE-MsgGUID: uUtmQBFUSd6ASgZ6DIQjkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="184099253"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:39:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: jiangshanlai@gmail.com, tj@kernel.org, simona.vetter@ffwll.ch,
 christian.koenig@amd.com, pstanner@redhat.com, dakr@kernel.org
Subject: [RFC PATCH 0/3] Enforce DRM scheduler reclaim rules
Date: Tue, 21 Oct 2025 14:39:49 -0700
Message-Id: <20251021213952.746900-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Over the past year, I've randomly reviewed new drivers using the DRM
scheduler and repeatedly spotted misuses related to reclaim. This update
to the DRM scheduler aims to catch some of these misuses.

It's quite possible that this change will expose bugs in upstream
drivers, which is why it's being submitted as an RFC."

Matt

Matthew Brost (3):
  workqueue: Add an interface to taint workqueue lockdep with reclaim
  drm/sched: Taint workqueues with reclaim
  drm/sched: Prevent adding dependencies to an armed job

 drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++++-
 include/linux/workqueue.h              | 19 +++++++++++++++++++
 kernel/workqueue.c                     |  9 +++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.34.1

