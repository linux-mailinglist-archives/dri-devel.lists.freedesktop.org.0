Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F1A87D267
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 18:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64D31123A4;
	Fri, 15 Mar 2024 17:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJNcpa3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B9A1123A4;
 Fri, 15 Mar 2024 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710522544; x=1742058544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rDKBtEaBZintqNzBGvOPMViXG4XBLyFGvbuLLtaRa7E=;
 b=OJNcpa3ql2R7NbdKsCced/oT7tTAVAf/6j7xnT4ITjBZdJQCUllPEmtb
 uEfM6oRgvDSgOffehxDvjt5bxtiU9NdhQokrd90qZdxs29+Kc1/HfvvLv
 CllANlCT2CMRQRGdDIARL3zsvSiK6TeqsAT3YtvziJb6Ss4hVEpnVcmkE
 IgXlbd9Z3vFm2pqouHhEoUpE/PBf/eFGLbKod5mGtZhby55l1LkdXxMqd
 vF4LTXkmugdZGQKmIDzfJ1TqQ8199AV+CVgLGcSVkO/ebIM7wIejUicqy
 A/FsF8zX5ZBHab3eP+PP/AaNs6CUegp6RzASfPk63P4JT63N1+ohZqgKc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5590129"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5590129"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 10:09:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12659293"
Received: from unknown (HELO intel.com) ([10.247.118.169])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 10:08:57 -0700
Date: Fri, 15 Mar 2024 18:08:51 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Report full vm address range
Message-ID: <ZfSAo791UDRnBSwc@ashyti-mobl2.lan>
References: <20240313193907.95205-1-andi.shyti@linux.intel.com>
 <46ab1d25-5d16-4610-8b8f-2ee07064ec2e@intel.com>
 <35df0767-384f-49f2-806a-f83765ca7c4c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35df0767-384f-49f2-806a-f83765ca7c4c@linux.intel.com>
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

Hi Nirmoy,

> > In Mesa we've been relying on I915_CONTEXT_PARAM_GTT_SIZE so as long as
> > that is adjusted by the kernel
> 
> What do you mean by adjusted by, should it be a aligned size?
> 
> I915_CONTEXT_PARAM_GTT_SIZE ioctl is returning vm->total which is
> adjusted(reduced by a page).
> 
> This patch might cause silent error as it is not removing WABB which is
> using the reserved page to add dummy blt and if userspace is using that
> 
> page then it will be overwritten.

yes, I think this could happen, but there is no solution,
unfortunately. We need to fail at some point.

On the other hand, I think mesa is miscalculating the vm size. In
userspace the total size is derived by the bit size
(maxNBitValue()).

By doing so, I guess there will always be cases of
miscalculation.

There are two solutions here:

 1. we track two sizes, one the true available size and one the
    total size. But this looks like a dirty hack to me.
 2. UMD fixes the size calculation by taking for granted what the
    driver provides and we don't have anything to do in KMD.

Lionel, Michal, thoughts?

Andi
