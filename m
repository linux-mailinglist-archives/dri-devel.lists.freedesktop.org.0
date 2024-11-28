Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FA69DB6E4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 12:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8354F10E1F1;
	Thu, 28 Nov 2024 11:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ArYOpwNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A07310E0D4;
 Thu, 28 Nov 2024 11:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732794526; x=1764330526;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1z7JkOtGu3oguHkHpEdwAnaqNk5e6McbHqCPM/nUY5g=;
 b=ArYOpwNGN3AsgsedkGBwKjZvF8FBJh/zIRHyzeRro6F1cqdR1xj8HTSz
 sXPdeMhJjnTPxrJesr0lRnGJdFYuRvZ3MDFMYLRYXgKUWG2QE5LR9KEg5
 ibrjmMvWhM9Z7/+J2vEQvVOir2sMdBvGZclVXEBYZOnomIh4cu32DbuWH
 Lz/JU40ULKbX12mk1ICrERQsD2CV0zWwDZjm3/EbZlXPZMX34XWcpOolk
 hG3dIyoYXJbR8B4Oul6pTG/hlgKcz7hpM+FKyaV6CZnPgba0f0aKD2AMI
 2Cd8AXzW7EDlRpUQsJobE4rrxAkQqEkd4FWvdh6BCw6W+zz8Gl6BvmlHQ w==;
X-CSE-ConnectionGUID: sO9hFFsFRH2dT0YLlyRHkA==
X-CSE-MsgGUID: 9JEfGMoVQJeVoioYa9S2tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33268093"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="33268093"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 03:48:45 -0800
X-CSE-ConnectionGUID: YCpBMwp+TGy9HtqSxvOd+A==
X-CSE-MsgGUID: W8jUaiktQs+93EeM8vuljg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="96311749"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.166])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 03:48:40 -0800
Date: Thu, 28 Nov 2024 12:48:36 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: nirmoy.das@linux.intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@outlook.com>,
 stable@vger.kernel.org, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH RESEND v2] drm/i915: Fix memory leak by correcting cache
 object name in error handler
Message-ID: <Z0hYlNey1zyinvby@ashyti-mobl2.lan>
References: <20241127201042.29620-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127201042.29620-1-jiashengjiangcool@gmail.com>
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

Hi Jiasheng,

On Wed, Nov 27, 2024 at 08:10:42PM +0000, Jiasheng Jiang wrote:
> From: Jiasheng Jiang <jiashengjiangcool@outlook.com>
> 
> Replace "slab_priorities" with "slab_dependencies" in the error handler
> to avoid memory leak.
> 
> Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
> Cc: <stable@vger.kernel.org> # v5.2+
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@outlook.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
