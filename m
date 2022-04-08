Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654A04F8BDF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 03:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C8F10E0D1;
	Fri,  8 Apr 2022 01:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BDE10E0D1;
 Fri,  8 Apr 2022 01:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649382268; x=1680918268;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ChtkOh/ISpvqUuW9xdvHdmhTKpHeeirOwyFuISQwhDA=;
 b=IKEwzNTi3fp6YCF1pDyxb3i83d7/Zxa6s0ILZMj9X4eLdqW2YaLkaGP7
 DyxPmISjcqx1z7Ed92zpIDST9tb4V6HyEhe+aa0n8XFCclXizs08awkqU
 HKZA70G1/TTYegGty2FebBILyGt4qyQGURkLAUiqhHwIzsg33gzksKJXk
 GAu4hIBu9uELMmEVfel2/wjN7hY43133k+9SloTwwjGI/rTYKEOVSe/QY
 qV2kqb1KO/zv8R5UTdlvsLbHYP6RZkSrgqq/zSmjib0vzMd6MKldLCqNs
 AY8O0J9/L7pvUdK+2ExTtUp7uy5ht5M5ncQDm9wWA8G5qxeU0rMj2dKov g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="249014795"
X-IronPort-AV: E=Sophos;i="5.90,243,1643702400"; d="scan'208";a="249014795"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 18:44:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,243,1643702400"; d="scan'208";a="571306392"
Received: from aalkukhu-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.172.187])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 18:44:27 -0700
Date: Thu, 7 Apr 2022 18:44:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: fix
 i915_gem_object_wait_moving_fence
Message-ID: <20220408014427.7qincl464uyxj3sx@ldmartin-desk2>
References: <20220407164532.1242578-1-matthew.auld@intel.com>
 <20220407164532.1242578-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220407164532.1242578-2-matthew.auld@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 07, 2022 at 05:45:32PM +0100, Matthew Auld wrote:
>All of CI is just failing with the following, which prevents loading of
>the module:
>
>    i915 0000:03:00.0: [drm] *ERROR* Scratch setup failed
>
>Best guess is that this comes from the pin_map() for the scratch page,
>which does an i915_gem_object_wait_moving_fence() somewhere. It looks
>like this now calls into dma_resv_wait_timeout() which can return the
>remaining timeout, leading to the caller thinking this is an error.
>
>Fixes: 1d7f5e6c5240 ("drm/i915: drop bo->moving dependency")
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Christian König <christian.koenig@amd.com>
>Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

This indeed brings CI back to life.


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi
