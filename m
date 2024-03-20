Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F6E881752
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 19:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222BA10F9F4;
	Wed, 20 Mar 2024 18:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTN+vqMP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D114710F6D9;
 Wed, 20 Mar 2024 18:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710959446; x=1742495446;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pIMvEZlWIVtjNJitQfBbhwqYFC5rypTGNigzi89FX0w=;
 b=WTN+vqMPzTJM/kWoh0KwasBgygzr2cTheP6jKAuS+ePKwDeZZWa/LNwR
 BxGp7XllMF35Im02i9smL7gip40BELnnHwr4KR6MlaXT8miioaAjNm0kw
 yDTJTkWSENwhf2RekBmllFCYxZUMeEKm7oSy6PPzcHk3q81gCPmfdoYlZ
 wjRK906FkLiTUWZRU/D5zA8TFyd9Kml7ArkQhPP56J99hSBnEQR6eYj2p
 i24lIWfOpUvMTTIUTgdn3sve7me/4EzlbeGe1dhsHPFtLNxSnQLGqsFnT
 MnGwxgmjv0a1MGupRnPpVFIpfzZjp55/bYqPMVnYEUl4J+XbZaAx5eyZ+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5754538"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5754538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 11:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14303213"
Received: from unknown (HELO intel.com) ([10.247.118.186])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 11:30:33 -0700
Date: Wed, 20 Mar 2024 19:30:25 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Mrozek, Michal" <michal.mrozek@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@linux.intel.com>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 "Das, Nirmoy" <nirmoy.das@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/gt: Report full vm address range
Message-ID: <ZfsrQWNfzDGl8IVV@ashyti-mobl2.lan>
References: <20240313193907.95205-1-andi.shyti@linux.intel.com>
 <46ab1d25-5d16-4610-8b8f-2ee07064ec2e@intel.com>
 <35df0767-384f-49f2-806a-f83765ca7c4c@linux.intel.com>
 <ZfSAo791UDRnBSwc@ashyti-mobl2.lan>
 <BN9PR11MB527575D97CB63C5E4B1B0E7AE72D2@BN9PR11MB5275.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527575D97CB63C5E4B1B0E7AE72D2@BN9PR11MB5275.namprd11.prod.outlook.com>
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

Hi Michal,

On Mon, Mar 18, 2024 at 05:21:54AM +0000, Mrozek, Michal wrote:
> > > Lionel, Michal, thoughts?
> Compute UMD needs to know exact GTT total size.

the problem is that we cannot apply the workaround without
reserving one page from the GTT total size and we need to apply
the workaround.

If we provide the total GTT size we will have one page that will
be contended between kernel and userspace and, if userspace is
unaware that the page belongs to the kernel, we might step on
each other toe.

The ask here from kernel side is to relax the check on the
maxNBitValue() in userspace and take what the kernel provides.

Thanks,
Andi
