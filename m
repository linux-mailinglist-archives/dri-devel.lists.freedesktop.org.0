Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEFE545CCE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 09:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEED11B8AF;
	Fri, 10 Jun 2022 07:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0716A11B8AF;
 Fri, 10 Jun 2022 07:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654844855; x=1686380855;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DWTr/O9FDCVDs1guRMRKRawZvaslYLatGS1DLb7mrFM=;
 b=PqGGWO3rQionuy+U5Nf6wFWUnW7unnDqVDVFNCYFInAUQxm9LeGxxB0n
 T8+g2ND6W+NnXiQR/xDtyVosxmLwGdCbElRaAreEt+ylvVAYcLE/IAtVG
 LYkPy3PoZmrxsETbmV7UbXDREkSFt0jK91438qjS4yCyvuOO/0cEyo1fv
 N/2GmgfDxg+/+2LrOkV41/UOXFetHSrgC+Gfvxx1Q3Xuy6PTCbPWKUED9
 Df2bWB9oDlVfjvkC1PwtAWgPrrDwQqyvm6abhE9dHuqxE8D0HHUHmlfPU
 cuhIj1REg2oOjEag4QePg/BPIczldqlf851yL4xRv67+AAGUslm3EQ/hu Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="302914942"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="302914942"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 00:07:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="586064027"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 10 Jun 2022 00:07:34 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com
Subject: [PATCH 0/3] drm/doc/rfc: i915 VM_BIND feature design + uapi
Date: Fri, 10 Jun 2022 00:07:08 -0700
Message-Id: <20220610070711.32407-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 chris.p.wilson@intel.com, thomas.hellstrom@intel.com, oak.zeng@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, lionel.g.landwerlin@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the i915 driver VM_BIND feature design RFC patch series along
with the required uapi definition and description of intended use cases.

This series is an updated version of the below RFC series. It address
the review feedback by adding execbuf3 ioctl for vm_bind, adding
multiple queues support for vm_bind/unbind ioctls and some formatting
and documentation updates.
https://www.spinics.net/lists/dri-devel/msg347731.html

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/doc/rfc: VM_BIND feature design document
  drm/i915: Update i915 uapi documentation
  drm/doc/rfc: VM_BIND uapi definition

 Documentation/driver-api/dma-buf.rst   |   2 +
 Documentation/gpu/rfc/i915_vm_bind.h   | 490 +++++++++++++++++++++++++
 Documentation/gpu/rfc/i915_vm_bind.rst | 309 ++++++++++++++++
 Documentation/gpu/rfc/index.rst        |   4 +
 include/uapi/drm/i915_drm.h            | 203 +++++++---
 5 files changed, 963 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst

-- 
2.21.0.rc0.32.g243a4c7e27

