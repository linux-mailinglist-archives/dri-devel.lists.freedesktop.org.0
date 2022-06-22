Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D25555399
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 20:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800A010E7A6;
	Wed, 22 Jun 2022 18:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BEA10E28D;
 Wed, 22 Jun 2022 18:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655923868; x=1687459868;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6knH9ww1X0wYx/mJv7c1V/griBQ7Mqls7RA9rvc5R/g=;
 b=TLepWqwHPLBX3uWUrpLrLpeCYPP9TC3RIENAEvZkoUoAsXGVyjtlOhpn
 R1sSTpdMVLYZn5pllaaog7StLtbJGa+4A3uMV+knq9cGWEo10FsSo+ilb
 K/FgVusb26F6f259YRxpO8/6RxQrCw2IzXCDt23ZWGWYxp/86a+l6wdtX
 +zihBOplqrQ8UtG+hfW4jAnVPBBqABk5GT9irEtH05ddp1OhSqIwx+Qha
 k2vRS8irDpWNUz+0tnhq2/iKaibesQfZ1KQiantqLUOzpV4q/1ujtZW7V
 cRcfwSk5EmkvsGDbmaSzvAB+Ak91DVTE+TnxL77Q1PHON9vDi2KjL01AW g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="269236650"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="269236650"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 11:51:08 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="644344781"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 22 Jun 2022 11:51:07 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm/doc/rfc: i915 VM_BIND feature design + uapi
Date: Wed, 22 Jun 2022 11:50:44 -0700
Message-Id: <20220622185047.3763-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com,
 chris.p.wilson@intel.com, thomas.hellstrom@intel.com, oak.zeng@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the i915 driver VM_BIND feature design RFC patch series along
with the required uapi definition and description of intended use cases.

v2: Reduce the scope to simple Mesa use case.
    Remove all compute related uapi, vm_bind/unbind queue support and
    only support a timeline out fence instead of an in/out timeline
    fence array.
v3: Expand documentation on dma-resv usage, TLB flushing, execbuf3 and
    VM_UNBIND. Add FENCE_VALID and TLB_FLUSH flags.
v4: Remove I915_GEM_VM_BIND_TLB_FLUSH flag and add additional
    uapi documentation for vm_bind/unbind.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/doc/rfc: VM_BIND feature design document
  drm/i915: Update i915 uapi documentation
  drm/doc/rfc: VM_BIND uapi definition

 Documentation/gpu/rfc/i915_vm_bind.h   | 252 +++++++++++++++++++++++++
 Documentation/gpu/rfc/i915_vm_bind.rst | 245 ++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst        |   4 +
 include/uapi/drm/i915_drm.h            | 205 +++++++++++++++-----
 4 files changed, 661 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst

-- 
2.21.0.rc0.32.g243a4c7e27

