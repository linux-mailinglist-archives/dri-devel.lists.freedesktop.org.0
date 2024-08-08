Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183C394BAE9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 12:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D3210E6C2;
	Thu,  8 Aug 2024 10:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLajgr78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B642F10E6C2;
 Thu,  8 Aug 2024 10:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723112902; x=1754648902;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/T4zktRCC/tekQe+31IFuekukSVCvT2hCH+cHHbDFVM=;
 b=jLajgr78G+Lyi4SAs0XdRDQViCdMsJ3V0FApmncgfCARd1cNgDFOsZOk
 xRW19O1lKOhGKgofJjHkcbDZ6ClPYAlv1L5XGB5weNY0zSI18r0mc9Vt0
 bgfMrP5iNltT/K3ff0JYVe2+K+HczM9eI6311sY/Htp4X/2g66G7/TERj
 fsgKTrI4sfWvyARBJQfbYXLpXRC6p+lPLKRkM2AUIdf1LIZHKw5wGJZPE
 Acr3uF2a+gdZNc9j3PL2t4zhGFHYIVKtlG5KLoQGUb9e//gXX2YWVI+Dj
 pqiBEF/kSL/MhtKetDWDqKGSkJaYHnV9cDSX95BtuvxqBeXsIvgculs9n w==;
X-CSE-ConnectionGUID: LytA9aAKQXeTwpFe6pJPWA==
X-CSE-MsgGUID: 2Y9osqhLTNGcBsROcnNdnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21371669"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="21371669"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 03:28:22 -0700
X-CSE-ConnectionGUID: Tmv0lIGvShuUtX1wXuFlPg==
X-CSE-MsgGUID: K/2Ms2XQTEGq/GOZnChtOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="61564684"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.71])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 03:28:20 -0700
Date: Thu, 8 Aug 2024 11:28:14 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Jonathan Cavitt <Jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/i915/gem: Improve pfn calculation readability in
 vm_fault_gtt()
Message-ID: <ZrSdvj_4-p1dEKxS@ashyti-mobl2.lan>
References: <20240807104553.481763-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807104553.481763-1-andi.shyti@linux.intel.com>
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

On Wed, Aug 07, 2024 at 11:45:53AM +0100, Andi Shyti wrote:
> By moving the pfn calculation to the set_address_limits()
> function we improve code readability. This way,
> set_address_limits() is responsible for calculating all memory
> mapping paramenters: "start", "end" and "pfn".
> 
> This suggestion from Jonathan was made during the review of
> commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix Virtual Memory mapping
> boundaries calculation"), which I liked, but it got lost on the
> way.
> 
> Suggested-by: Jonathan Cavitt <Jonathan.cavitt@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

merged to drm-intel-gt-next.

Andi
