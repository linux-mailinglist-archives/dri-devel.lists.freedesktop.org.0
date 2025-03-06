Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9181A54687
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 10:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0064010E924;
	Thu,  6 Mar 2025 09:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6yhuVlR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B8110E151;
 Thu,  6 Mar 2025 09:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741253920; x=1772789920;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yg9a4ShFg0RQ9AlyyGbnp+mN7hb0Beorgdfbkp4r/8c=;
 b=b6yhuVlRiDYV3s8KRAzTXEydCEaKTWbEc2FeqpjNM3bUi1quJXUgMYVu
 zha6UDcFliCaoa8vGhmQsJiLr5BbeWRWxBuz+2JBEEA4xZb9p7eREDZBE
 08dU2RXqTqHBB/bAFCckBn3rda1qfhOgMUAhuLQgRBcu+3gx7r3oKSACi
 X1PFxCcyDaJkvZxL82pN4TZGK/rvl176ELzZXVkl/i5GDp9djwd5JXV88
 v1GVu5HIexMfY66dHBaCDDMk86VcMHr3dZ1uAv7iQCIr5XzHCrV0C4ZqP
 ZRCyHTG5MCnYBCKZdKuEjeQg2a1K2Y77sSp2WtzLqft+q1FeN95i7JjoY w==;
X-CSE-ConnectionGUID: 8ePKSHCgT8mZr/sIitIUxQ==
X-CSE-MsgGUID: X0Mg2yG8QmWHAdh67lHkxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53238516"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="53238516"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:38:40 -0800
X-CSE-ConnectionGUID: ENgsSW8kRxCB4vdXYvN8gg==
X-CSE-MsgGUID: cqvygY7dRT+BGoKLY2VSrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="118781449"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.125])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:38:34 -0800
Date: Thu, 6 Mar 2025 10:38:31 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: =?iso-8859-15?Q?Asbj=F8rn_Sloth_T=F8nnesen?= <asbjorn@asbjorn.st>
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jouni =?iso-8859-15?Q?H=F6gander?= <jouni.hogander@intel.com>,
 Zhao Liu <zhao1.liu@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: implement vmap/vunmap GEM object functions
Message-ID: <Z8ltF3n4n6iwDfxr@ashyti-mobl2.lan>
References: <20240629182513.78026-1-asbjorn@asbjorn.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240629182513.78026-1-asbjorn@asbjorn.st>
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

Hi Asbjorn,

On Sat, Jun 29, 2024 at 06:25:06PM +0000, Asbjørn Sloth Tønnesen wrote:
> Implement i915_gem_vmap_object() and i915_gem_vunmap_object(),
> based on i915_gem_dmabuf_vmap() and i915_gem_dmabuf_vunmap().
> 
> This enables a drm_client to use drm_client_buffer_vmap() and
> drm_client_buffer_vunmap() on hardware using the i915 driver.
> 
> Tested with a currently out of tree pixelflut drm_client[1] on:
> - Lenovo ThinkCentre M720q (CoffeeLake-S GT2 / Intel UHD Graphics 630)
> - Dell Wyse N06D - 3030 LT (ValleyView on Intel Celeron N2807 SOC)

do you mind sharing the tests?

> [1] XDP->DRM pixelflut: https://labitat.dk/wiki/Pixelflut-XDR
> 
> Signed-off-by: Asbjørn Sloth Tønnesen <asbjorn@asbjorn.st>

thanks, reviewed and merged to drm-intel-gt-next.

Andi
