Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B38BE55AE0D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 03:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B799010E249;
	Sun, 26 Jun 2022 01:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2223510E0FA;
 Sun, 26 Jun 2022 01:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656208177; x=1687744177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fvf8of7JzoZCoFl5L8uWNodYX6W1y+TGy6q4ziEwXJg=;
 b=Lhiipf1ZtybaOuPerF7zNivXaKVhTgvFhhN+1+tMOZ38OGyFzDDz3t4D
 RQc95ZXVCNl+mTJKZwC4YEQyTBd+dVTKnnjKofAIw1r1nqZhQThLM6YMz
 KaOFfHYVjSk6bZbQnP/oPtkYgYmaxF4xkGCC1LZGT0eJeZ5bka2hgpNdg
 RPHEMXkTxjOUm4sy4nW+R6S6H9FPj71q2IMirIX7dOxPrp9Bhnh9QEggJ
 +z1XUtuqw8ZcwHMkUtDELdrIcyBv0asjEYI6Oe4Ko3nNvDNhg34MS/7oO
 wbxSyB+Q/L8FZS3rhdlFjmUQU0wXTD2kcw6XTfYNafJzUAA6bXeNl9PjF Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10389"; a="269976231"
X-IronPort-AV: E=Sophos;i="5.92,223,1650956400"; d="scan'208";a="269976231"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2022 18:49:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,223,1650956400"; d="scan'208";a="645844849"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 25 Jun 2022 18:49:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/3] drm/doc/rfc: i915 VM_BIND feature design + uapi
Date: Sat, 25 Jun 2022 18:49:13 -0700
Message-Id: <20220626014916.5130-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/doc/rfc: VM_BIND feature design document
  drm/i915: Update i915 uapi documentation
  drm/doc/rfc: VM_BIND uapi definition

 Documentation/gpu/rfc/i915_vm_bind.h   | 280 +++++++++++++++++++++++++
 Documentation/gpu/rfc/i915_vm_bind.rst | 246 ++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst        |   4 +
 include/uapi/drm/i915_drm.h            | 205 ++++++++++++++----
 4 files changed, 690 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst

-- 
2.21.0.rc0.32.g243a4c7e27

