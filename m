Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9509191B24E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 00:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE6810EB91;
	Thu, 27 Jun 2024 22:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTnu6oyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75C010EB8C;
 Thu, 27 Jun 2024 22:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719527808; x=1751063808;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4VTjFHxaIKRxwCqS3v3HXcMZfkDYQjF2heKD2BeVE0M=;
 b=NTnu6oyH9ZZIAcZU3suCsdan1UDrUliHiG4H+JpSWOqSkNhk8BsRaCnt
 K2ubUUgub5yEUjTcSUklcYWBcJcF1ZiM6T8kfP8tvkPIutD959cCsufAo
 IBTK2i1Kd+BPSyhlNDAF9PV6nv+YorpjYgZLBIFn74dNwUho9AW1pFLS0
 XaoQiByG1Fz8+zZd2j+EVc6AwROxAFxVG6JfsQcvQUiYilirCzGLYV8R0
 5p7eQyl71BwQwykhNjz6Pj016XWAVO338DESTuuTGPOTbTYcmjGJgKdTu
 JIPUbBR+ziM1zOz+SeyTPrZZ2nTJXrgyAHcBFkv9sumjD6ZbT5ROBPzTg Q==;
X-CSE-ConnectionGUID: XW1NsBe3RruPP+0eemBjGA==
X-CSE-MsgGUID: GmE67evcSQeumZ6Nk5QOqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16917593"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="16917593"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 15:36:47 -0700
X-CSE-ConnectionGUID: Rlgxk9RfT+ejmCLsE/+d2g==
X-CSE-MsgGUID: pn4lPLxGTziV7GGBZhpHxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="44655736"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.203])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 15:36:42 -0700
Date: Fri, 28 Jun 2024 00:36:39 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/gem: Suppress oom warning in favour of ENOMEM
 to userspace
Message-ID: <Zn3pdz4NrQJPnH6m@ashyti-mobl2.lan>
References: <20240626143318.11600-1-nirmoy.das@intel.com>
 <Zn05EPD0PRLdUmuj@ashyti-mobl2.lan>
 <fe18bed7-5a25-4abb-9745-e887d8211de8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe18bed7-5a25-4abb-9745-e887d8211de8@linux.intel.com>
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

On Thu, Jun 27, 2024 at 06:56:53PM +0200, Nirmoy Das wrote:
> On 6/27/2024 12:04 PM, Andi Shyti wrote:
> > On Wed, Jun 26, 2024 at 04:33:18PM +0200, Nirmoy Das wrote:
> > > We report object allocation failures to userspace with ENOMEM
> > > so add __GFP_NOWARN to remove superfluous oom warnings.
> > I think this should be the default behavior.
> Yes, when drivers handle ENOMEM situation which is the case for i915/gem
> code
> >   ENOMEM doesn't
> > necessarily mean that there is a kernel failure. Most of the time
> > we just run out of memory, deal with it :-)
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks!

while at it... merged in

drm-intel-gt-next

Andi
