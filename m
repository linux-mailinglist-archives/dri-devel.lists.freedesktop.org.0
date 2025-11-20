Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ECDC739C3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 12:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AAC10E044;
	Thu, 20 Nov 2025 11:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h43GKWX3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDA010E044;
 Thu, 20 Nov 2025 11:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763636675; x=1795172675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qY4iz8vRxeI2vbkflJyrv/cHwEXqr2dgwNE/Eha7pEw=;
 b=h43GKWX3NCO8LDRXJnqiar/atVWn3Wke46uv1Mryp6JsOxM05rhxffGS
 SaWfv9FiJjGqNGAghSbAirZ4Y0xC5kuOFeD+e6m9KH8vM6ewa/H5qxXc+
 KMpRlJlVnjPqMxwsk+PGIasWwRG9greMewenAYLIy8urI3yavnNcazC3r
 E1XBKU+M2ZOfIPB7YtZrsp6pi2rnHcNryzFsbqojiE9+3crLMIiaT5NEv
 EqrxR7KuyHVPxPRFCdRerojfQGIQkbqq8wJa1CZLPOUc6HS8Mscq36iZk
 ADpehAMPI3rF089h8QctDUmzPEDc2TE/7cvWbUeiYvmABo0KbC4VbU/vq Q==;
X-CSE-ConnectionGUID: SD3uqzYcS8i6kJgHLgp5jg==
X-CSE-MsgGUID: qnhNXqajTfSezsqQSYZx8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68307983"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="68307983"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 03:04:34 -0800
X-CSE-ConnectionGUID: slshScBUT3qTys+qrixn+Q==
X-CSE-MsgGUID: i4D01uSBTaei2uUY9iTRTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="228643691"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.244.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 03:04:30 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Waiman Long <longman@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 0/2] locking/ww_mutex,
 dma-buf/dma-resv: Improve detection of unheld locks
Date: Thu, 20 Nov 2025 12:03:39 +0100
Message-ID: <20251120110341.2425-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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

WW mutexes and dma-resv objects, which embed them, typically have a
number of locks belocking to the same lock class. However
code using them typically want to verify the locking on
object granularity, not lock-class granularity.

This series add ww_mutex functions to facilitate that,
(patch 1) and utilizes these functions in the dma-resv lock
checks.

Thomas Hellström (2):
  kernel/locking/ww_mutex: Add per-lock lock-check helpers
  dma-buf/dma-resv: Improve the dma-resv lockdep checks

 include/linux/dma-resv.h |  7 +++++--
 include/linux/ww_mutex.h | 18 ++++++++++++++++++
 kernel/locking/mutex.c   | 10 ++++++++++
 3 files changed, 33 insertions(+), 2 deletions(-)

-- 
2.51.1

