Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4223B3707
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 21:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C066ECC7;
	Thu, 24 Jun 2021 19:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF766E084;
 Thu, 24 Jun 2021 19:31:07 +0000 (UTC)
IronPort-SDR: Xxtebtluka9fv3XGaelHGvaKM8d/zvXkzo7rT/RvBagjOTTzzLspiRlA6fDBTRsC8S0lVsJcI9
 4vCzbHEBxmEA==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="293179994"
X-IronPort-AV: E=Sophos;i="5.83,297,1616482800"; d="scan'208";a="293179994"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 12:31:07 -0700
IronPort-SDR: RVyp65AthLR1dGqWyLp1qVrpfRCl4+CP714Kh9BkMvyCWSt3/ESX7pbPBYl8IahV40e7Q8IBHZ
 MWZATn31g7QA==
X-IronPort-AV: E=Sophos;i="5.83,297,1616482800"; d="scan'208";a="487889506"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.243])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 12:31:04 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/i915, drm/ttm: Update the ttm_move_memcpy() interface
Date: Thu, 24 Jun 2021 21:30:43 +0200
Message-Id: <20210624193045.5087-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ttm_move_memcpy() function was intended to be able to be used async
under a fence.
We are going to utilize that as a fallback if the gpu clearing blit fails
before we set up CPU- or GPU ptes to the memory region.
But to accomplish that the bo argument to ttm_move_memcpy() needs to be
replaced.

Patch 1 reorganizes the i915 ttm move code a bit to make the change
in patch 2 smaller.
Patch 2 updates the ttm_move_memcpy() interface.

Thomas Hellström (2):
  drm/i915/ttm: Reorganize the ttm move code somewhat
  drm/ttm, drm/i915: Update ttm_move_memcpy for async use

 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 70 ++++++++++++++-----------
 drivers/gpu/drm/ttm/ttm_bo_util.c       | 20 +++----
 include/drm/ttm/ttm_bo_driver.h         |  2 +-
 3 files changed, 51 insertions(+), 41 deletions(-)

-- 
2.31.1

