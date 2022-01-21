Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7A04958EF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 05:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0850F10E476;
	Fri, 21 Jan 2022 04:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A24B10E476;
 Fri, 21 Jan 2022 04:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642739828; x=1674275828;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sz6SzmBXAt2m5mxFQ5dQsMziRyMDYdVVHXe/b7y+lds=;
 b=ek3npj5nIQSd39ZUqJZuVcmfuldjStzRXweLyI+9Fv+FbEe0ssA4b1Rl
 t0euIEXcLLGNOqBk3vI29uYYdFMuLEVFj9fALPFeCZMlR8q39RXxecjEk
 38e5I3Sq4BO0lb9QSbtLrR4KZTDampTIm7kMYF+4CwzqcUTU8vwGMqwC2
 qNJuZjtjSubR3+6Ho+sS8A9eOZkbTNUwg5ktqZKFtZ3GoWWwiLV1qGY0e
 chNcWkNIK/Z4tHkCaqHew1sR1hNAzenoYA7Io/VI1e8yxGwpzB6019Oyd
 sCmn9gRGhwH6v17KKDBHt1oJE8Yrg65nYOVfrwAxMRKy5AfUZrXtAgnmJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="244384009"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="244384009"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 20:37:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="626596547"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 20:37:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] Flush G2H handler during a GT reset
Date: Thu, 20 Jan 2022 20:31:15 -0800
Message-Id: <20220121043118.24886-1-matthew.brost@intel.com>
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

After a small fix to error capture code, we now can flush G2H during a
GT reset which simplifies code and seals some extreme corner case races. 

v2:
 (CI)
  - Don't trigger GT reset from G2H handler
v3:
  - Address John Harrison's comments
v4:
  - Address John Harrison's comments

Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Matthew Brost (3):
  drm/i915: Allocate intel_engine_coredump_alloc with ALLOW_FAIL
  drm/i915/guc: Add work queue to trigger a GT reset
  drm/i915/guc: Flush G2H handler during a GT reset

 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  9 +++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 55 ++++++++++++-------
 drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
 3 files changed, 44 insertions(+), 22 deletions(-)

-- 
2.34.1

