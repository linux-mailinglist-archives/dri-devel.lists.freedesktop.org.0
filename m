Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4A552455E
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 08:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A91510FD26;
	Thu, 12 May 2022 06:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AABE10FC66;
 Thu, 12 May 2022 06:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652335724; x=1683871724;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=eO5gt69IB0XOu0yUrz5YVwc4EvsUrbwh0/qECAkuJfM=;
 b=H2MkY4Sx7v8K4WW8NEqfZXOh508VOOz4FLgp0Rw6sZOlZnjK6e8wume1
 4ISLmKzB/maJ7JRu4/entWwW2j0jKBD/PVm04w52uASoksSZau/x5TCIh
 yl66BykzQtn4CtdyD0qHhHtAMixjzeRDVpGXH1+z3ehDd3J0Gfr/E65HW
 EQFNNE7pMCQ8IQLkwzB0WvnmqcKcRyO46GtXFsnpuxB+bH0UAXlaCoUAv
 ItJFpdOEi8/ZFO1ShKPyENS/aH99//cooZmc6lLdokfn1Y0p3ThGRZ1eN
 0lb/dcEYMNkvcxpamaUeDhXhhOjxnrmbApBpe2PpVpqfmcDjWfKOYwclM A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269842390"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="269842390"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 23:08:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="594509744"
Received: from molech-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.50.223])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 23:08:30 -0700
Date: Thu, 12 May 2022 09:08:27 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YnykW6L4e7vD3yl3@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

One fix for memory corruption under heavy load (#5732, Cc: stable).

Regards, Joonas

***

drm-intel-fixes-2022-05-12:

Fix for #5732: (Cc stable) kernel memory corruption when running a lot of OpenCL tests in parallel

The following changes since commit c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a:

  Linux 5.18-rc6 (2022-05-08 13:54:17 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-05-12

for you to fetch changes up to 3220c3b2115102bb35f8f07d90d2989a3f5eb452:

  drm/i915: Fix race in __i915_vma_remove_closed (2022-05-09 10:36:49 +0300)

----------------------------------------------------------------
Fix for #5732: (Cc stable) kernel memory corruption when running a lot of OpenCL tests in parallel

----------------------------------------------------------------
Karol Herbst (1):
      drm/i915: Fix race in __i915_vma_remove_closed

 drivers/gpu/drm/i915/i915_vma.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
