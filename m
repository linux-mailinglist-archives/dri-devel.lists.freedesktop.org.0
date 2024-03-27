Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8460A88F0A3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 22:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D9E112048;
	Wed, 27 Mar 2024 21:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcqUH9Vh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF4F112047;
 Wed, 27 Mar 2024 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711573800; x=1743109800;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HIR6ORA8ivaGvER4UfQMPmG83USC1ryp+tI4TXFkQm8=;
 b=fcqUH9VhGU0N6Mth1E81+LOuNLl1wlTohdjr4j14brK8I1ZJbfy+wtV3
 WjANv81atpx/v+2uTAn+YEA+NjAOT9pY9t9Lru4CB1Qi8fhGlfZnbPXKP
 wzfDZt4dyuPJvxhXm8M6AhjIDiNncfsovG1EuDpCokFvDmmirFLhyc0xz
 gOrys/OATDoZX7/2WrAStT/GSoA/iP/p4XSuq4tV4L6PRrXRVwDyx+gwx
 z3/Gr9uEMguy0UZ6PLe2VVmFu9ATcp/7bl7T01efYR+cjbaPh+T1YEdjJ
 iG5I9PtiPH0qH5Q67DtvtxpOEpz/zqgHeqfuvVVIKIaTfRxcBtU34ImPV Q==;
X-CSE-ConnectionGUID: IvUnd639RE6QSPE7Ca/66w==
X-CSE-MsgGUID: 5f+JhTMVTsCww7/XXdCJTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18140960"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="18140960"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 14:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="16883526"
Received: from unknown (HELO intel.com) ([10.247.118.215])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 14:09:52 -0700
Date: Wed, 27 Mar 2024 22:09:46 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 mateusz.jablonski@intel.com, Andi Shyti <andi.shyti@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Limit the reserved VM space to only the
 platforms that need it
Message-ID: <ZgSLGqazTlpUzlIm@ashyti-mobl2.lan>
References: <20240327200546.640108-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327200546.640108-1-andi.shyti@linux.intel.com>
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

Hi,

On Wed, Mar 27, 2024 at 09:05:46PM +0100, Andi Shyti wrote:
> Commit 9bb66c179f50 ("drm/i915: Reserve some kernel space per
> vm") reduces the available VM space of one page in order to apply
> Wa_16018031267 and Wa_16018063123.
> 
> This page was reserved indiscrimitely in all platforms even when
> not needed. Limit it to DG2 onwards.
> 
> Fixes: 9bb66c179f50 ("drm/i915: Reserve some kernel space per vm")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>

I forgot to add stable here:

Cc: <stable@vger.kernel.org> # v6.8+

Sorry about that!

Andi
