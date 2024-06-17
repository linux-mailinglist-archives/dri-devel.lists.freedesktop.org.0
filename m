Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AA790B9EE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 20:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F5110E4AD;
	Mon, 17 Jun 2024 18:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IfAKKD/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6197110E4AD;
 Mon, 17 Jun 2024 18:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718649777; x=1750185777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wL6NzG/bZuOomETS9LewLAi2M+BCc7Z83BEwf8Gtas0=;
 b=IfAKKD/ONOXcIISJCiw3r/Ce6gf6J9QH8YLsjLHz6gABvEVopcdk/cvS
 9lZVmPzn9G90Kv7fFN8ry4ddnSlxN9CsYOzuR/IgeJ2fW3QEQwHDk7Sc9
 CxdoxAF2WyHqUP33pGwD0KwK1CDTFwnxTS3kt+OBk7cWsXKsbTOn2ZQzG
 2wEKTVD3csiaf+0ldDSccaNsDFbyYBlsEvuJDuMGjN5ZAiC16YLBTLjmc
 KecyLKSuMdYn15ifAAI2UcrR/65lICT/pZ/9LzDZ7TrvhAeikpouArEjM
 O10Ex0rRwbQhRF5h+Rrfr1EQXPzFFxeuM0LK3KNPWHYiS685R9zvUnkc/ g==;
X-CSE-ConnectionGUID: xboT7JdlR9+voAIipJ7Oiw==
X-CSE-MsgGUID: ZZa9VbSqRUymklj+VcshbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15726657"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="15726657"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:42:56 -0700
X-CSE-ConnectionGUID: kbxuDoaLSnevQilmYvDPIA==
X-CSE-MsgGUID: gqyPBcDcSvyOrOkwYtT8Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41213599"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.127])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:42:53 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/2] Sparse errors on the i915_gem_stolen
Date: Mon, 17 Jun 2024 20:42:41 +0200
Message-ID: <20240617184243.330231-1-andi.shyti@linux.intel.com>
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

The difference between v1 and v2 is that the patch should return
a NULL, which won't cause any issues.

Andi

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Andi Shyti (2):
  drm/i915/gem: Return NULL instead of '0'
  drm/i915/gem: Use the correct format specifier for resource_size_t

 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.45.1

