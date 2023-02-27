Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 522D76A4CC5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 22:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE7810E411;
	Mon, 27 Feb 2023 21:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559EA10E3F9;
 Mon, 27 Feb 2023 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677532129; x=1709068129;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xQdmnNz0wy2zumlRPdmu5npk6Gs+ByLF9iRjVoHFfFM=;
 b=khJYExYuwJ6ojKZe0DVbjGlT9F1uOdMonDHEFnfBRQUHFhGprX3uEf6q
 5qvUgDp0I1W5BXJDYe7MaZp5lYa8wT4Gim1WO/b3OBo4KJCzt+mlfTjpP
 IGlzUybWlpP0ei2rK+a26FfVisNwkFQLBV4qttpVyqvRTf3Hl8FzjiOGI
 wxy1n7JN2OCRloR65C3qMzN73BFRo7aIVU86lsu6O3S0myxRksZ1WHjy7
 ePXVVvDr13pRQ6x7qyL5loD9LRTfrMkia5sDAqcgNHAfHBr5pgO3NIWMw
 rATEe5dWFBycviSKtql3KoG2z33e9ehDsmlpXVDl05MB06I4ZFnCscp7J w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="317767922"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="317767922"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 13:08:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="623761623"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="623761623"
Received: from jrissane-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.249.41.42])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 13:08:28 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: [PATCH v2 0/2] Fix error propagation amongst requests
Date: Mon, 27 Feb 2023 22:08:16 +0100
Message-Id: <20230227210818.1731172-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.1
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
Cc: Andi Shyti <andi@etezian.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series of two patches fixes the issue introduced in
cf586021642d80 ("drm/i915/gt: Pipelined page migration") where,
as reported by Matt, in a chain of requests an error is reported
only if happens in the last request.

However Chris noticed that without ensuring exclusivity in the
locking we might end up in some deadlock. That's why patch 1
throttles for the ringspace in order to make sure that no one is
holding it.

Version 1 of this patch has been reviewed by matt and this
version is adding Chris exclusive locking.

Thanks Chris for this work.

Andi

Changelog
=========
v1 -> v2
 - Add patch 1 for ensuring exclusive locking of the timeline
 - Reword git commit of patch 2.

Andi Shyti (1):
  drm/i915/gt: Make sure that errors are propagated through request
    chains

Chris Wilson (1):
  drm/i915: Throttle for ringspace prior to taking the timeline mutex

 drivers/gpu/drm/i915/gt/intel_context.c | 41 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_context.h |  2 ++
 drivers/gpu/drm/i915/gt/intel_migrate.c | 31 +++++++++++++------
 drivers/gpu/drm/i915/i915_request.c     |  3 ++
 4 files changed, 67 insertions(+), 10 deletions(-)

-- 
2.39.1

