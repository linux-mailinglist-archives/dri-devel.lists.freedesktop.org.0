Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA01A999A7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 22:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B84510E260;
	Wed, 23 Apr 2025 20:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wh4Yup5s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83D610E248;
 Wed, 23 Apr 2025 20:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745441329; x=1776977329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AsGN3VEDYbj2Aorp7SF0NfqwOwrR1YHCcEoDGL6s53M=;
 b=Wh4Yup5shIvcbIvszfcUKslCiITy2T4f6KxKdX64VdjPuLXuaR1djwcc
 kymi4vyVVUCRgfiJN6lfOh0Z3joO8Ht5uoS7dJGyfOjbaOAWS1YamSA9w
 PudrICTjNKV6yR+/4Z3b1ZNn/hbd2Fjc/m+kFaVMdS0PlJMxuijqtSXJf
 KWYf65CQtPXGMg1kw0okjrUvNkHv4jyqWc2JhrvRBGgegi9QxCsjHUgCl
 KYjToAzZgM6UmLIOJz0kWI08MqKQtCaGypvcQPowkx9jbrp7hLrq0AUR0
 DinPMHz/8PU6vH3ReylUVQv1SnQiKoIuvevDHUTi6LeH+EXgfSBnuZB0K g==;
X-CSE-ConnectionGUID: eARtEWCyRUm5dXZIxeV6KQ==
X-CSE-MsgGUID: n1ialdHwSEiPwXmUm9KTZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58425290"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="58425290"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 13:48:48 -0700
X-CSE-ConnectionGUID: OL1jdGPCQo2lxNyEbi5Gww==
X-CSE-MsgGUID: +NckjW4rSKWZpthWwtsITw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132165282"
Received: from dut4046ptlh.fm.intel.com ([10.105.8.103])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 13:48:48 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, stuart.summers@intel.com,
 ivan.briano@intel.com
Subject: [PATCH v4 0/4] tests/intel/xe_vm: Add drm_xe_vm_get_property tests
Date: Wed, 23 Apr 2025 20:48:43 +0000
Message-ID: <20250423204847.154424-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add tests that exercise the new drm_xe_vm_get_property uapi,
specifically for ioctl input validation and for determining that
pagefaults are correctly tracked and returned by the reporter.

v2:
- Remove engine class and instance (Ivan)

v3:
- Add declares for fault type, access type, and fault level (Matt Brost,
  Ivan)

v4:
- Make vm creation consistent between patches (jcavitt)
- s/pageproperty/pagefaults

Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Zhang Jianxun <jianxun.zhang@intel.com>
Suggested-by: Stuart Summers <stuart.summers@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>

Jonathan Cavitt (4):
  drm-uapi/xe: Declare xe_vm_get_property_ioctl
  lib/xe/xe_ioctl: Add xe_vm_get_property helper function
  tests/intel/xe_vm: Add DRM_IOCTL_XE_VM_GET_PROPERTY validation tests
  tests/intel/xe_vm: Test DRM_IOCTL_XE_VM_GET_PROPERTY fault reporting

 include/drm-uapi/xe_drm.h |  85 ++++++++++++++
 lib/xe/xe_ioctl.c         |   5 +
 lib/xe/xe_ioctl.h         |   1 +
 tests/intel/xe_vm.c       | 237 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 328 insertions(+)

-- 
2.43.0

