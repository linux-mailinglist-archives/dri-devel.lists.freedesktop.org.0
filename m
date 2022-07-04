Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE3A565BF6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE35F10F990;
	Mon,  4 Jul 2022 16:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211A010E14A;
 Mon,  4 Jul 2022 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656942800; x=1688478800;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DZxY6zVl4Yu5rlmCpzKQErgJ7yFuXf8s2eN4HPg8oCE=;
 b=XCxPPcNEToujKVrVJpTxITOT+cUc6hy80FYnG1tykwyup7SMFblAzf2c
 FUTLv1u++Ip/eYFUQjn3vL3UXnAxy2X3owxytnzGuAjCTmabyEX0pY76T
 d8DUe4H8nK5CFVRT9ShqdZ6TQnVZUyoNtxH5NuVKNhUEK9J0L+TTRIju7
 nVoxklI/sIQIVAZbbYB9/VFA0iR/A/T4Vu8MOr80SGOjNb7gLZplfCkRq
 6eA7+5+HV0+7U4bzCS0nKmbJLZcJEvxTEIXT9ldWHE6Ylmi0CrJZIQT71
 s7DISMQbXzpruD5SZqh/06gip6mbYpmtOlmqw04itMu9i82B0xOx/GChh g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="271905996"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="271905996"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 06:53:19 -0700
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="542595751"
Received: from acagidia-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.34])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 06:53:18 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Protect vma destruction with the object lock
Date: Mon,  4 Jul 2022 15:52:47 +0200
Message-Id: <20220704135249.8241-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.36.1
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

Protecting vma destruction with the object lock is already
implemented everywhere as part of the "Remove short-term pinning" work,
except in the vm destructor where the reasoning was that most code that
needs to keep vmas alive also holds a vm reference.

However this complicates lifetime rules for vmas, so take the
object lock around vma destruction also in the vm destructor, trying
first with trylock to avoid having to unnecessarily release and
re-take the vm mutex that protects the vma lists.

As a follow up remove the now unnecessary taking of the vm reference in
i915_gem_object_unbind(), and the "BARRIER" retry when taking that
reference fails.

Thomas Hellström (2):
  drm/i915: Take the object lock when destroying vmas from vm
    destruction
  drm/i915/gem: Rework i915_gem_object_unbind to rely on the object lock

 drivers/gpu/drm/i915/gem/i915_gem_domain.c |  4 +---
 drivers/gpu/drm/i915/gt/intel_gtt.c        | 17 +++++++++++++++++
 drivers/gpu/drm/i915/i915_drv.h            |  7 +++----
 drivers/gpu/drm/i915/i915_gem.c            | 18 ------------------
 4 files changed, 21 insertions(+), 25 deletions(-)

-- 
2.36.1

