Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA91385DEE9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 15:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39B910E75A;
	Wed, 21 Feb 2024 14:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQNawDK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D382110E75A;
 Wed, 21 Feb 2024 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708525374; x=1740061374;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IuJB/67DCZbJSnTLTuazK9ddJwpeD3N/jQNxK0U4tRE=;
 b=NQNawDK26tZCe+nKSMx0b7YDHF2W+xQwMGsK1nEK/Lge3sRspwsT3fSi
 MjJPWdjMLo0I6xTw/IEXEq3Iq6CuvT8ovDF9ducWypaWfNDAZdFgsCzqq
 5QKi8Ma1J2axpeZOOec0it+Mg1GrOcP5Vz1ljbVBMjK32WBiPxZapv6RO
 pfiYbfFBWyAfLwlTaIHk7XjQ6BqloIlOAw9auVJeXxta9psrWC9Xe55TI
 p5oHrTodET9mvV4FRSRNrJR4gxtX+nT8dwHMq/jzWiuvd6d8+koFpT8vX
 sEWHrmg0Z9zEuEYiKZgkuHLopXumx/HKYhond7CUU+H0MlYqLjjJF7rje A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="14096333"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="14096333"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 06:22:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9845681"
Received: from jdoyle1x-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.204.109])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 06:22:52 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [PATCH v2 0/2] GPU hang replay
Date: Wed, 21 Feb 2024 14:22:43 +0000
Message-Id: <20240221142245.2331484-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Please see 2/2 for explanation and rationale.

v2:
 * Extracted shadowing of default state into a leading patch.

Tvrtko Ursulin (2):
  drm/i915: Shadow default engine context image in the context
  drm/i915: Support replaying GPU hangs with captured context image

 drivers/gpu/drm/i915/Kconfig.debug            |  17 +++
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 113 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
 drivers/gpu/drm/i915/gt/intel_context.h       |  22 ++++
 drivers/gpu/drm/i915/gt/intel_context_types.h |   3 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |   8 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   8 +-
 drivers/gpu/drm/i915/i915_params.c            |   5 +
 drivers/gpu/drm/i915/i915_params.h            |   3 +-
 include/uapi/drm/i915_drm.h                   |  27 +++++
 10 files changed, 201 insertions(+), 7 deletions(-)

-- 
2.40.1

