Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2E688FAD3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3F2112386;
	Thu, 28 Mar 2024 09:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KtK5tZMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BD9112377;
 Thu, 28 Mar 2024 09:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711617118; x=1743153118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uwBkjlJ58CijzrIzaw79ggND/TRgcEmuGX2F5espy1w=;
 b=KtK5tZMaZImWDnUk6iWZK4ent4VBlldEXnoKcV/13LCu0R7phOE6iCPu
 cJpZAEeecdL9WI3ZPcxxXbarJXRb/UZKsxhwXANjOU0OKoiRux058mcUn
 MkKplCXAx0TgE3IElqvFqsrvMdBn+7wP5FpHMgZTQB02rxTBQe4wuQW3W
 z2fNSl1Q1K+mQl40iTL4MX9l5WT1Q7bVwG9hTB2bm/owDiFztopX9alCO
 zbctm5UC7tnavOG59LdNJ9XFh+KaSHTNSyK7hYAWYnxbvSPb/Qi7HGI27
 zBTX4AYL6cU22tG4aCQw+DhljybRI0AJk4hXBBeqaVCQK6DuOL6wjmXQH Q==;
X-CSE-ConnectionGUID: DdGANYk8SFmIccXDwNtBWQ==
X-CSE-MsgGUID: jzCrciaJS+mybZdqiIbhsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6978127"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6978127"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="54029918"
Received: from unknown (HELO intel.com) ([10.247.118.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:11:51 -0700
Date: Thu, 28 Mar 2024 10:11:44 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 mateusz.jablonski@intel.com, Andi Shyti <andi.shyti@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Limit the reserved VM space to only the
 platforms that need it
Message-ID: <ZgU0ULqEyF8wgFmm@ashyti-mobl2.lan>
References: <20240327200546.640108-1-andi.shyti@linux.intel.com>
 <692791d8-8f6d-4f3b-8ade-dc23879809c3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <692791d8-8f6d-4f3b-8ade-dc23879809c3@intel.com>
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

On Thu, Mar 28, 2024 at 09:54:12AM +0100, Nirmoy Das wrote:
> On 3/27/2024 9:05 PM, Andi Shyti wrote:
> > Commit 9bb66c179f50 ("drm/i915: Reserve some kernel space per
> > vm") reduces the available VM space of one page in order to apply
> > Wa_16018031267 and Wa_16018063123.
> > 
> > This page was reserved indiscrimitely in all platforms even when
> > not needed. Limit it to DG2 onwards.
> 
> I would use "Limit it to platforms that need WAs" as those WA are only

Thanks, will improve it.

> needed till 12.71,  otherwise

I easily get confused by the versioning... is 12.71 defined at
all in i915?

Thanks,
Andi
