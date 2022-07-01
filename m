Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F015627BF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 02:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9936910E5B0;
	Fri,  1 Jul 2022 00:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120CD10E16A;
 Fri,  1 Jul 2022 00:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656635492; x=1688171492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SOBKMpOcVw3R7Q+bt1ATG8gFB7z21gowkNOvqCpRD5g=;
 b=XN/RWjWhvMlIlPeySjU797R78xDyMseKajE2K+l75OXPetN+2XM1aZ6g
 +GcjJ14xG86wT7H61WgiOw/1XQ9fww/MIqQ3ZdeHlczfEAkMLkzqdTJk3
 sf1a2PNwNL/7oa7KLIdpSGhKqZtIyOGiSQwjiqvIIztaI2ro3yFyqJkjV
 SK3dmosxARtj5C2unPaQOwdgEi49BsPXDZR832WRfkd2vQwTZMK8gZWTO
 5urH5ygoYEwbeMX+pkDeGYlrJD1duWFxs0tdmTSFLMLmfQNAPc4XQvUuP
 5CArC7tklrJi0VQX1iFSWYdtRb5q0lt17d09F/PaEOQVAFDtFCHTv7bCg A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="262307443"
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="262307443"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 17:31:31 -0700
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="718432914"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 30 Jun 2022 17:31:31 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 0/3] drm/doc/rfc: i915 VM_BIND feature design + uapi
Date: Thu, 30 Jun 2022 17:31:07 -0700
Message-Id: <20220701003110.24843-1-niranjana.vishwanathapura@intel.com>
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
v5: Update TLB flushing documentation.
    Add version support to stage implementation.
v6: Define and use drm_i915_gem_timeline_fence structure for
    execbuf3 and vm_bind/unbind timeline fences.
v7: Rename I915_PARAM_HAS_VM_BIND to I915_PARAM_VM_BIND_VERSION.
    Update documentation on async vm_bind/unbind and versioning.
    Remove redundant vm_bind/unbind FENCE_VALID flag, execbuf3
    batch_count field and I915_EXEC3_SECURE flag.
v8: Remove I915_GEM_VM_BIND_READONLY and minor documentation
    updates.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Paulo Zanoni <paulo.r.zanoni@intel.com>

Niranjana Vishwanathapura (3):
  drm/doc/rfc: VM_BIND feature design document
  drm/i915: Update i915 uapi documentation
  drm/doc/rfc: VM_BIND uapi definition

 Documentation/gpu/rfc/i915_vm_bind.h   | 291 +++++++++++++++++++++++++
 Documentation/gpu/rfc/i915_vm_bind.rst | 245 +++++++++++++++++++++
 Documentation/gpu/rfc/index.rst        |   4 +
 include/uapi/drm/i915_drm.h            | 205 +++++++++++++----
 4 files changed, 700 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst

-- 
2.21.0.rc0.32.g243a4c7e27

