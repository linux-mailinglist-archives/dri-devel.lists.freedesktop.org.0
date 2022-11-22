Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F89D634843
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9490E10E177;
	Tue, 22 Nov 2022 20:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A6F10E0D1;
 Tue, 22 Nov 2022 20:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669149408; x=1700685408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P3Ip1iCluiSh5vITDpaOU8OeHJtOGihH6vO0VwH/n5M=;
 b=bEMlMGMFlfRKVGUpRcOJUUSqNM46qgbiL+MjGZn1K+EhxQunqSQMTQdA
 rwyD6it1PRZEK9I0+Qjf7i9iKWtfBHmLLXyoQj0YAf+049q7/dUOvqUZv
 U7iA5wHL7Yn41dgPsjwfVviVzTitJDuULTdUGuB9gXkbar8vllLrybnDc
 //M7f8rVhcVzUMs4WR1hszp1l80YJ9j1tpgqCvXCdPvwHjt9X2mqxeeLB
 Xdob1tuBdo9N6hhLG1JlZzwGLdRWhn+k4tQrQTaM8BDhhap1M+lxCda2L
 jGUifp4kS0L6Wt+TUxn+YOIhHqytfS2KLMtB+lqldkzg2vksFKPxepOwd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="294298883"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="294298883"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:34:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="730535756"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="730535756"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:34:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] i915: dedicated MCR locking and hardware semaphore
Date: Tue, 22 Nov 2022 12:33:57 -0800
Message-Id: <20221122203401.3172897-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've been overloading uncore->lock to protect access to the MCR
steering register.  That's not really what uncore->lock is intended for,
and it would be better if we didn't need to hold such a high-traffic
spinlock for the whole sequence of (apply steering, access MCR register,
restore steering).  Switch to a dedicated MCR lock to protect the
steering control register over this critical section and stop relying on
the high-traffic uncore->lock.  On pre-MTL platforms the dedicated MCR
lock is just another software lock, but on MTL and beyond we also
utilize the hardware-provided STEER_SEMAPHORE that allows us to
synchronize with external hardware and firmware agents.

Matt Roper (4):
  drm/i915/gt: Correct kerneldoc for intel_gt_mcr_wait_for_reg()
  drm/i915/gt: Pass gt rather than uncore to lowest-level reads/writes
  drm/i915/gt: Add dedicated MCR lock
  drm/i915/mtl: Add hardware-level lock for steering

 drivers/gpu/drm/i915/gt/intel_gt.c          |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 107 ++++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h      |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |   8 ++
 drivers/gpu/drm/i915/gt/intel_mocs.c        |   2 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c |   4 +
 7 files changed, 115 insertions(+), 11 deletions(-)

-- 
2.38.1

