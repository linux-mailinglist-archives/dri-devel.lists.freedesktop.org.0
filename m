Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431F8962234
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 10:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7F310E4D7;
	Wed, 28 Aug 2024 08:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oByxYBPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3877910E4D5;
 Wed, 28 Aug 2024 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724833226; x=1756369226;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h6uzyaR6vrRnyL5ufg31uNTbvg/BIwONFU0pN8LO2C0=;
 b=oByxYBPQeYEWB5A0x/lDsYXkKv4huNH3EuAmn9l3PROc09DCjni+LdGX
 jbewrzXp4YqWzH9gTbC1uNt8DooYZZEFWx7iDq4P2CuczLyFa/l4Yd1WJ
 FwwZlHPcIGImoAFxfIWMvdokHLNAGS2KzYgMJt2Jz/Z/95AEjVAgRsv9+
 dvbWyClJZjMOnRZ5YF/JiTyBJrcWJEfjq0n9ElH5uvkv4a9m3EgaS4pwn
 Za07IOZG1uUP1F7vCzu2a5ETMMDy0j2T+m2NH5lhbG0we2YGKZkNKyO9X
 aRR9wxM46yTjcO80kP8AYSGTkme69rCrZdYib6DtvF9nLM456aCJgHRmd A==;
X-CSE-ConnectionGUID: KZX3hEWxTk6inE2dbPntwQ==
X-CSE-MsgGUID: VNOIH6kdTSKRYArvu23xIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23215061"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="23215061"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:20:26 -0700
X-CSE-ConnectionGUID: wRpxkAmHSUOjB7PiQ6636w==
X-CSE-MsgGUID: xpC0Z5/UTnqLlckcCK4KDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="67515829"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.107])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:20:21 -0700
Date: Wed, 28 Aug 2024 10:20:15 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v3 00/15] CCS static load balance
Message-ID: <Zs7dv57piSIj3Og4@ashyti-mobl2.lan>
References: <20240823130855.72436-1-andi.shyti@linux.intel.com>
 <Zs4NaUgcDhcBb4Ok@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs4NaUgcDhcBb4Ok@phenom.ffwll.local>
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

Hi Sima,

first of all, thanks for looking into this series.

On Tue, Aug 27, 2024 at 07:31:21PM +0200, Daniel Vetter wrote:
> On Fri, Aug 23, 2024 at 03:08:40PM +0200, Andi Shyti wrote:
> > Hi,
> > 
> > This patch series introduces static load balancing for GPUs with
> > multiple compute engines. It's a lengthy series, and some
> > challenging aspects still need to be resolved.
> 
> Do we have an actual user for this, where just reloading the entire driver
> (or well-rebinding, if you only want to change the value for a specific
> device) with a new module option isn't enough?

Yes, we have users for this and this has been already agreed with
architects and maintainers.

Why are you saying that we are reloading/rebinding the driver?
I'm only removing the exposure of user engines, which is
basically a flag in the engines data structure.

> There's some really gnarly locking and lifetime fun in there, and it needs
> a corresponding justification.

What locking are you referring about?

I only added one single mutex that has a comment and a
justification. If you think that's not enough, I can of course
improve it (please note that the changes have a good amount of
comments and I tried to be aso more descriptive as I could).

When I change the engines configurations only for the compute
engines and only for DG2 platforms, I need to make sure that no
other user is affected by the change. Thus I need to make sure
that access to some of the strucures are properly serialized.

> Which needs to be enormous for this case,
> meaning actual customers willing to shout on dri-devel that they really,
> absolutely need this, or their machines will go up in flames.
> Otherwise this is a nack from me.

Would you please tell me why are you nacking the patch? So that I
address your comments for v4?

Thanks,
Andi
