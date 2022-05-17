Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB9C52AAF0
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 20:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEEA10E203;
	Tue, 17 May 2022 18:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD9C10ECED;
 Tue, 17 May 2022 18:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652812358; x=1684348358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kUVTCldVCbM52DlbUHCrnTY/9mOx58Rd9QKElP5m6do=;
 b=ZOgVXM6zCDy/Nhm+5ZDga+KPTeHsYj4/UH/HDbLmUSfNZB5OULr9YHwu
 JGOdTh4xix4ztW6m3vG+KRuldUBN9nrvGe333IZhghODY6vyeo79Dw98p
 E4nxmy1AG8PG2KX90WB9UQO3+XgvssRkam6kg1SRl8IGGokPfmqkHZ76V
 4LCJ9e0HSMuq8UCwFX6WOTr7quUxRDqgYUHEzdM8t9Zb4IX6Au2aETjuK
 8Ex4X317oGmngH49sxghJJvkMtngR1Z9k8V1jDigdTN8ZQr+X2G/NGzMl
 4Vn9qc5Bc/cODdVmkjWJTKvT7OG8CB/oxfFKK8PMWtjlutZSt5D1Cy1/V w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="251179146"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="251179146"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 11:32:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="597287372"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 17 May 2022 11:32:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com
Subject: [RFC v3 0/3] drm/doc/rfc: i915 VM_BIND feature design + uapi
Date: Tue, 17 May 2022 11:32:09 -0700
Message-Id: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@intel.com, jason@jlekstrand.net,
 chris.p.wilson@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the i915 driver VM_BIND feature design RFC patch series along
with the required uapi definition and description of intended use cases.

v2: Updated design and uapi, more documentation.
v3: Add more documentation and proper kernel-doc formatting with cross
    references (including missing i915_drm uapi kernel-docs which are
    required) as per review comments from Daniel.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/doc/rfc: VM_BIND feature design document
  drm/i915: Update i915 uapi documentation
  drm/doc/rfc: VM_BIND uapi definition

 Documentation/driver-api/dma-buf.rst   |   2 +
 Documentation/gpu/rfc/i915_vm_bind.h   | 399 +++++++++++++++++++++++++
 Documentation/gpu/rfc/i915_vm_bind.rst | 304 +++++++++++++++++++
 Documentation/gpu/rfc/index.rst        |   4 +
 include/uapi/drm/i915_drm.h            | 153 +++++++---
 5 files changed, 825 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst

-- 
2.21.0.rc0.32.g243a4c7e27

