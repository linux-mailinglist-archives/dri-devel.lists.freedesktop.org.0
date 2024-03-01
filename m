Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4CE86EC06
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 23:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE3C10ED6D;
	Fri,  1 Mar 2024 22:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DD2N1MSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0714E10ED6D;
 Fri,  1 Mar 2024 22:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709333352; x=1740869352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HF1fRn8HVQh5QcOaP7JVd3cKe68zYlZE5tObUad1ErY=;
 b=DD2N1MSa+szIVZhdxuk2fER15tZuFLn3zaw4t+kIPriGmIUFqQyKocCi
 0vPmHl1McH1LiypjxdEZmn4oMEPpZne1cOaYhyRKmwJTFR5ICBrHm510U
 x3Z5vNWC6AIYM9zQphwTAJvUvr8i6XAsawm8IfKejkjXip7tYevtse8Sg
 D68WOzGuk5uz4eG7PVfxhUP2VlcQw5gjEFy59Ad7Vngeluro403ltjA5p
 zXxUaI1i0LlfxvIE9wq3qZcWSEjyWJdGpbk5PaOgrOV+cvibmFTArIc3F
 0b3TzCW42ZBdDT/bwbVUop4gvySbkxcXKfuQ25eTR9NQNHFxz5dgQ8dEX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3752201"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="3752201"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 14:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; d="scan'208";a="45870690"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 14:49:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 0/4] xe_sync and ufence rework
Date: Fri,  1 Mar 2024 14:49:15 -0800
Message-Id: <20240301224919.271153-1-matthew.brost@intel.com>
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

Remove unused code, better input validation, and gup ufence
implementation. gup ufence implementation based some internal i915
patches. Tested with [1].

Matt

[1] https://patchwork.freedesktop.org/series/130417/

Matthew Brost (4):
  drm/xe: Remove used xe_sync_entry_wait
  drm/xe: Validate user fence during creation
  drm/xe: Get page on user fence creation
  drm/xe: Use get_user / put_user with memory barriers for ufence

 drivers/gpu/drm/xe/xe_sync.c            | 74 ++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_sync.h            |  1 -
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  4 +-
 3 files changed, 58 insertions(+), 21 deletions(-)

-- 
2.34.1

