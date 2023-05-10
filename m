Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 711066FDFE1
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 16:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2EE10E4AC;
	Wed, 10 May 2023 14:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CFC10E4AB;
 Wed, 10 May 2023 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683728395; x=1715264395;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JGLhW6k3sEbAFy04V5w4Rs0JDvBItzVc7r5nXUnVhok=;
 b=UVGA7y6vAcaoywFGkN5/N7Spu0nE7B+MYbx9AgYsrnDwrMhwCnXeZ5hW
 BhnNXXkHVgf92KBU3kBy/YytULpiDWV0o8tBcrkXqs/EjW2aQA9ca8KJg
 EdVT9UVnRtPt4rgo1rD/ghkCkV8T1M0bclR8Ww+evF5UPCKtVfiYrow9p
 jCOat55WLuHsyEFp+lVLmtQsdkW63naRduwHPQ5888AZLR5RBo3MEw9SU
 KXaIf3WWctiSTULomb4ELDWB1oMr7eAFHXtLfLVHHt5RIxf7v/HcuzrPf
 62h0xZRxwp98vUUMFYOrDgZ+bK4M73AvC2eSRgfTde+U4bjJSIHGX34z/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339469116"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="339469116"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 07:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="768931662"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="768931662"
Received: from aboreiko-mobl3.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.114])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 07:19:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe: Fix unprotected rebind_list accesses
Date: Wed, 10 May 2023 16:19:30 +0200
Message-Id: <20230510141932.413348-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each VM has two rebind lists, one protected by the VM resv, the other
one protected essentially by the VM notifier.list_lock. This series
intends to fix two points of illegal access.

Patch 1 fixes an access of VM rebind_lists' link without the VM resv held.
Patch 2 fixes an issue where the VMA may not be removed from the
VM notifier.rebind_list on VMA destruction.

Thomas Hellström (2):
  drm/xe: Fix unlocked access of the vma::rebind_link
  drm/xe: Properly remove the vma from the vm::notifer::rebind_list when
    destroyed

 drivers/gpu/drm/xe/xe_vm.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

-- 
2.39.2

