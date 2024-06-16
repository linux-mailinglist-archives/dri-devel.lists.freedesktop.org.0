Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECF2909C02
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 09:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0C810E154;
	Sun, 16 Jun 2024 07:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKWyU4wc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F30710E14D;
 Sun, 16 Jun 2024 07:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718521451; x=1750057451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e8WDbDySH21kmQxtmiP+b8nHideIgsiJVQRGqb5HQwY=;
 b=fKWyU4wc1Jklgp+VJn+LTZy5gQ3EIlQ7XtHDcZrqzzbhHcGB20rt9okq
 w53EffaTRe7LSn+wZoccoJHZ/2OC0sZLVGhmtgt9d2oBA8g8g2aIHmTzg
 T0cR9lk7zJ2ouzH1WdKxohR/gwYzlygvmpHqY58bRllPsexffFTQ3ox+L
 G+cVw/CTWl6/VCZWxkdTw28jkCrE0mkOBudLNG2rdbD0JdsmDWJtGw5ug
 Xmc5jcWTSwHR2rZCqhzWy9MbpMLoASRDR6nX9S+0i/BZ6Fg6bz5j9psI/
 fykyxc5+gKrCbtB4PD6rHEVrR2gRykCOApafIbuO7tlpY068Q6pE4iLYl Q==;
X-CSE-ConnectionGUID: rXD/mvkFSQOQw/u298HKWg==
X-CSE-MsgGUID: QWqZu0GXTLusA2wk9WbOTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15504738"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; d="scan'208";a="15504738"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2024 00:04:10 -0700
X-CSE-ConnectionGUID: jl11ReBoTcGBLwlUo1G/wg==
X-CSE-MsgGUID: c73mZOHOQ5ik1vhYaFqV9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; d="scan'208";a="78379846"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2024 00:04:09 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 0/2] Sparse errors on the i915_gem_stolen
Date: Sun, 16 Jun 2024 09:03:47 +0200
Message-ID: <20240616070349.250899-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Hi Jonathan,

Commit 05da7d9f717b ("drm/i915/gem: Downgrade stolen lmem setup
warning") produces two sparse warnings. The first one being a bit
more sever as it might cause a segmentation fault.

Andi

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>

Andi Shyti (2):
  drm/i915/gem: Return -EINVAL instead of '0'
  drm/i915/gem: Use the correct format specifier for resource_size_t

 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.45.1

