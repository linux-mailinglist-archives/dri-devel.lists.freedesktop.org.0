Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5440AB3A18E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B409410E9D3;
	Thu, 28 Aug 2025 14:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRw8YNfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB9310E9D3;
 Thu, 28 Aug 2025 14:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756391157; x=1787927157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wjNcu37XnLhHHkxKZxE+AP5mKUaQjO3tqLXLWrTOECg=;
 b=VRw8YNfw9C9yG8nnnBpftR+HSd4ybA5Mu0qdAMdWI/WL2Rpqo58rzqFD
 mgVZeVPXr+KlJC2axbeHbcErZ+DfPoqc5o80uJnrxEVEqpyAvoGxrsl8T
 oYLBALGTEtCINsWNdrw05sY/bEQcOjXBavWtft+/Zxzeci4t62q5cR9mq
 g9q+J5w4BJPPPX/3YeD/i23/br+htr/9YvCsxoaZ9sP1nrqBjNZhqL77N
 85aEHCKsBxdTPpegx+iPrKgYcHMekavYInCHxdr3hg2tYtCHLm0AU8DLv
 zz5rh8krnw451beLoEpfhB3pQAN9K44HH8imQq8mQd9FZYGfzxu5UYViw Q==;
X-CSE-ConnectionGUID: ntpFBscNRvOidBgwf4ppmQ==
X-CSE-MsgGUID: VuOEX5+ERVK+Zi9HH6wlBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58763189"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58763189"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:25:56 -0700
X-CSE-ConnectionGUID: Mbb9w+a2TROfIiHrWIYrWg==
X-CSE-MsgGUID: rLS4IxWjREO5GliNl5AGVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170025825"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.84])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:25:56 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/8] Replace xe_hmm with gpusvm
Date: Thu, 28 Aug 2025 15:24:31 +0100
Message-ID: <20250828142430.615826-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
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

As a first step to moving userptr handling over to drm, replace the hmm
usage in xe over to gpusvm, which already offers similar functionality. As
some prep steps we also align on some of the missing pieces that were
already handled in xe_hmm.

v2:
  - Rework the gpusvm API based on feedback.
  - Unify SVM and userptr vm struct so we use the same notifier lock.
  - Drop the mark pages as dirty patch.
  - Various other improvements.
v3:
  - Further unify common handling of userptr and svm in xe.
v4:
  - Allow building xe without userptr, like when building on UML.
v5:
  - Rebase on lastest drm-tip. Lots of conflicts.
v6:
  - Various small fixes around kernel-doc etc.
  - Also convert over the newly added xe_vm_advise userptr usage.
-- 
2.51.0

