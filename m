Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5C79EB1A6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 14:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AC310E5CB;
	Tue, 10 Dec 2024 13:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NcLb2SSx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBE510E5CB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 13:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733836183; x=1765372183;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YiZlKkAz5NE/rpL7sMV7xW3SlWs4T3kNfdLn2E6xa60=;
 b=NcLb2SSxQZ5MaJ3rRtTXvLP8x7NOQwtb4HqdpIAE+H4YGHMV6CKkMiCH
 6KUGtnCPT3redtQzb2qKtviSBXfcJhLSqU7cbluh2/aSGCEbtH+bCtRVs
 VG9TfcvXQUQP1AvXjniEm74lpHn9WPXkbchxj7utK2C8a0DkuXl/KmgEb
 L30ls0kb3EpGgrgAZpLx+PwUx/yyhXOXNp3n2ZvQmxf/nuDgMo3gtuyOU
 u4mcqOzG3nghYTZ1dItgQ+zkGpsKJ4h7pozPMZOzOlYjLfZr9FR2C6tb7
 XOr6x36ZvmxOBT5ErhVNj+63BDbLwoBON0WcRRktAgZ8Oma2ea/VAmT6L Q==;
X-CSE-ConnectionGUID: oKEPtFQPQNunKdC6DtJknA==
X-CSE-MsgGUID: ZzE+SNwVTs6jiJc+pMzmng==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34080108"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34080108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:09:43 -0800
X-CSE-ConnectionGUID: IUMM4TlQT1Kw14LkXeLN+Q==
X-CSE-MsgGUID: MywH1CtJSQy3SiLy75esKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95242007"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:09:41 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 0/3] accel/ivpu: Fixes for 6.13
Date: Tue, 10 Dec 2024 14:09:36 +0100
Message-ID: <20241210130939.1575610-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

This patchset addresses several issues in the accel/ivpu module,
including fixing a general protection fault in ivpu_bo_list().

Jacek Lawrynowicz (3):
  accel/ivpu: Fix general protection fault in ivpu_bo_list()
  accel/ivpu: Fix memory leak in ivpu_mmu_reserved_context_init()
  accel/ivpu: Fix WARN in ivpu_ipc_send_receive_internal()

 drivers/accel/ivpu/ivpu_gem.c         |  2 +-
 drivers/accel/ivpu/ivpu_mmu_context.c | 10 +++++++---
 drivers/accel/ivpu/ivpu_pm.c          |  2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)

--
2.45.1
