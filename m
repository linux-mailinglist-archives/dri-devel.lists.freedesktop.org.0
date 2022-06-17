Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C0E54F077
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 07:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4CB11AB5B;
	Fri, 17 Jun 2022 05:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A4411AB1A;
 Fri, 17 Jun 2022 05:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655442906; x=1686978906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yzzgCpzUKc+vhQ746rwG5grVv3R/h6I3qPANhwuVD0A=;
 b=KeiH2yMbvlmjquZrfG1JbQmmyPqlN8aA9EYd/7ZlFIV7aqSeRl7I0vSg
 veivQPkuilfPUXH1+C41ACF5MROsBaorzcm/PgwtMD1LNhOnWhoayXk2r
 SyVawLAVZJbV2xfRmUZkfdLYpb3doLMXEwF7Xx8qtlkfo1N4QUyHJzwbT
 VI+XJwDm9UZnH/aGUo9K+2Ox1Wq4dGnT0ceJPW9cK7q4o9AVJ2Ky1NBNr
 OChx7FZqg2WLC8ACiSRBYiU1BJqbyBj7+mlcExkzlOKLvEBtIJofLM7el
 BEVPCatfCidztQ3ae87JTPDJHskSLmU0AkIfTyaYg5Bb7GstpdIsFwmAq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="262440244"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="262440244"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 22:15:06 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="613427118"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 16 Jun 2022 22:15:06 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com
Subject: [PATCH v2 0/3] drm/doc/rfc: i915 VM_BIND feature design + uapi
Date: Thu, 16 Jun 2022 22:14:42 -0700
Message-Id: <20220617051445.8901-1-niranjana.vishwanathapura@intel.com>
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

v2: Reduce the scope to simple Mesa use case.
    Remove all compute related uapi, vm_bind/unbind queue support and
    only support a timeline out fence instead of an in/out timeline
    fence array.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/doc/rfc: VM_BIND feature design document
  drm/i915: Update i915 uapi documentation
  drm/doc/rfc: VM_BIND uapi definition

 Documentation/gpu/rfc/i915_vm_bind.h   | 226 +++++++++++++++++++++++
 Documentation/gpu/rfc/i915_vm_bind.rst | 238 +++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst        |   4 +
 include/uapi/drm/i915_drm.h            | 205 ++++++++++++++++-----
 4 files changed, 628 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst

-- 
2.21.0.rc0.32.g243a4c7e27

