Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1442559FC2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 19:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB10710E8DF;
	Fri, 24 Jun 2022 17:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE7110E0C9;
 Fri, 24 Jun 2022 17:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656092997; x=1687628997;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MzE+2ksyKRjGwe+QVuFeIVLP7uV7C16ndqRtpGhMGKU=;
 b=C29Q2zT7N2rdGP9jKFWWqDzuWK7Wl4Rh2jYZihO+eWViXgOHmmvURzje
 SehOYsXgLDNIoNGLEdiZ51zP0mEHcUkmXaxdHZf3w1k19fFdWE/g5Xdpb
 H5plcFGMGQKvW8MDEfLCd7Rh0mDiRmFf7XZzcjYgtxRgeH4RZC6hCo+GN
 3i5o09r0B4zFcYPgJ15P+2MF+I9ajayVdaTYg/g1nkdGeJEsZaZWAEyzT
 8YnpY+U0cnz592oAlO2jBEVotNv+TdWV1BGo4PdbonpGVdp2NlrLrfPxh
 M6TXfT4EoUVA2Ww1J5Faugo5yVwCo2MA40k8/cjmf7ut91ebpXgcxqRNU Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="281100591"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="281100591"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 10:49:56 -0700
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="593318807"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 24 Jun 2022 10:49:56 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/3] drm/doc/rfc: i915 VM_BIND feature design + uapi
Date: Fri, 24 Jun 2022 10:49:33 -0700
Message-Id: <20220624174936.1065-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/doc/rfc: VM_BIND feature design document
  drm/i915: Update i915 uapi documentation
  drm/doc/rfc: VM_BIND uapi definition

 Documentation/gpu/rfc/i915_vm_bind.h   | 286 +++++++++++++++++++++++++
 Documentation/gpu/rfc/i915_vm_bind.rst | 246 +++++++++++++++++++++
 Documentation/gpu/rfc/index.rst        |   4 +
 include/uapi/drm/i915_drm.h            | 205 ++++++++++++++----
 4 files changed, 696 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst

-- 
2.21.0.rc0.32.g243a4c7e27

