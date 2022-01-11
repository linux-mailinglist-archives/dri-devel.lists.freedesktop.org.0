Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F1548BB56
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 00:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6772310E650;
	Tue, 11 Jan 2022 23:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627AC10E5FB;
 Tue, 11 Jan 2022 23:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641943023; x=1673479023;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qefJ5uKZtm7kXAoJLBDSSCZNvBYAUG+MM3HI49ylsOI=;
 b=Ok6Fixa5RIF6HpQpD66uxyv+/7AK0JvyDKtdZevaUmzuN7Rt5u1jSlxz
 s7xZUgovXLyHXg6UVd2Io65eavlrQpdwgeEZiwEsjoxeQLThpkD/RTNJs
 yOpgcAJA2+qI2XWhz8OvLsoPbzUSJlBK1pNGI+2dJNLukLpxtfstZxSsX
 5gk+Gn5EWleWV87UPNvZ/QRxEu37siN5jzYy5Jm/wQel05957Ot7MxSh+
 keEUhWS9pfXy2ZWLMGN0QHcKJEzscYueCylLEs43iOjtxGcnhPKhT0lp1
 QCH0NNtsZjJo8gpzjv4AfII5o6mPE9KRMdTCSU4yjVsE1hWeq76NSUdqL Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="230950977"
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600"; d="scan'208";a="230950977"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 15:17:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600"; d="scan'208";a="613375816"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 15:17:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] Remove some hacks required for GuC 62.0.0
Date: Tue, 11 Jan 2022 15:11:07 -0800
Message-Id: <20220111231109.23244-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove a hack required because schedule disable done G2H was received
before context reset G2H in GuC firmware 62.0.0. Since we have upgraded
69.0.3, this is no longer required.

Also revive selftest which proves this works before / after change.

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

