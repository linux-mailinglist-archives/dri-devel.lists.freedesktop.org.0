Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 399D348DD91
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 19:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782A410E556;
	Thu, 13 Jan 2022 18:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B2B10E536;
 Thu, 13 Jan 2022 18:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642098082; x=1673634082;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tWbsgazn/tjQR0KTwVBh6b1CzVRbkjOVZiiYhiwqNOY=;
 b=elGEyMLrH5a6n4/hxGjcFZE6QH8OcZQ7HBuJDn3wsGkZRzy9OcSR4i5i
 OUxLGu1VdrYe5DjmffolbZU4IlfzfyyG4Q2V7m1Hcovd/v/x+ZkJ27uWp
 8a/mWZpXmMzQavUYrmCh3+bOymC1DdquyeLFuuah4L/Bj4Ok5slJMo8sV
 +sbpZQnAO2pgmf1qhpzqvEawIuWB+SnHFBBZXunz3bJfiEUKL6KKmrxut
 LChY9Lrz2E6d5582JRjBCBqDd2qx0xEpzwQfZsOOWAWow8lKZEdEK/4es
 9eundifxUEyhzlkomFFF5xHD8Z0FTXl4k0slS3dBchIAIXKFDHmUXngKi A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="268440150"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="268440150"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:19:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="765634138"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:19:43 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] Remove some hacks required for GuC 62.0.0
Date: Thu, 13 Jan 2022 10:13:49 -0800
Message-Id: <20220113181351.21296-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove a hack required because schedule disable done G2H was received
before context reset G2H in GuC firmware 62.0.0. Since we have upgraded
69.0.3, this is no longer required.

Also revive selftest which proves this works before / after change.

v2:
  - Address John Harrion's comments

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (2):
  drm/i915/selftests: Add a cancel request selftest that triggers a
    reset
  drm/i915/guc: Remove hacks for reset and schedule disable G2H being
    received out of order

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  30 +----
 drivers/gpu/drm/i915/selftests/i915_request.c | 117 ++++++++++++++++++
 2 files changed, 119 insertions(+), 28 deletions(-)

-- 
2.34.1

