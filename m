Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA4C983A75
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 01:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7D610E4B6;
	Mon, 23 Sep 2024 23:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZrltTDfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DA210E4B6;
 Mon, 23 Sep 2024 23:41:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 617895C4CCC;
 Mon, 23 Sep 2024 23:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6BFC4CEC4;
 Mon, 23 Sep 2024 23:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727134895;
 bh=UM2NgGDwtcdfCAtmpbmXSRYydqO0kQ6t2IqeO1HMfTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZrltTDfMIdK9chV+a27Kc6oD1k2oNPFhUR51eP9J/aLO15BZa/+funfnAGsO+FYHA
 wUepj8z0fmISzl8G9gB2RBUIYCHAO1UTWDxtVEmuuGk5ujv2cWFhcEtJ0RrWB6FE1t
 Gtoh8mA3fgl6bqKJ1vRBPjXKGJka/4NJ6GOFbyoRQmEgiqJhPxyjBtjsU+U6vDZcUY
 xYRIv5FyQ/dw/BmiLv7zXhqM6NcDEootXF8Ytp5rDsq1X2mJUSkZtXDE0vPRtel1Z/
 QOIp+kOM4gfwCN828sYwuEL0D2zNrPY223IY1FfKidPKOGhw2t/yn2Ldt4tEePtvUD
 WoD4PHn6ve/Yg==
Date: Tue, 24 Sep 2024 01:41:31 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: "Zeng, Oak" <oak.zeng@intel.com>
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range during a map
 operation
Message-ID: <ZvH8qyiMe9CzqkLm@pollux.localdomain>
References: <20240918164740.3955915-1-oak.zeng@intel.com>
 <ZuseA6s2nip+PbTC@DUT025-TGLU.fm.intel.com>
 <BYAPR11MB315944FFB3DE254952FE298592632@BYAPR11MB3159.namprd11.prod.outlook.com>
 <cbf61ca5-870f-4617-839f-3e7a66fe7f1a@kernel.org>
 <BYAPR11MB3159CA7CBC2C4F53EFA8C046926F2@BYAPR11MB3159.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR11MB3159CA7CBC2C4F53EFA8C046926F2@BYAPR11MB3159.namprd11.prod.outlook.com>
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

(adding dri-devel)

On Mon, Sep 23, 2024 at 02:24:02PM +0000, Zeng, Oak wrote:
> > > This patch is an old one in my back log. I roughly remember I ran into
> > a situation where there were two duplicated VMAs covering
> > > Same virtual address range are kept in gpuvm's RB-tree. One VMA
> > was actually already destroyed. This further caused issues as
> > > The destroyed VMA was found during a GPUVM RB-tree walk. This
> > triggered me to look into the gpuvm merge split logic and end
> > > Up with this patch. This patch did fix that issue.
> > 
> > That would indeed be a big issue. As Matt suggests, is there a
> > reproducer?
> > 
> > Either way, adding merge support can't be the fix for this, we need a
> > separate
> > one, that's back-portable.
> > 
> 
> The discussion went on when you were away. See https://patchwork.freedesktop.org/patch/614941/?series=138835&rev=1

Yes, I'm aware. But I don't see how this is related to what I said above?

> 
> Matt and me agreed to implement a merge logic in gpuvm, but gpuvm need to check a driver cookie/callback to decide merge or not.
> We reached this conclusion based on some requirement from system allocator design. See more details in above link.
> 
> Can you take a look and let us know whether you agree?

Generally, I'm fine with that, one of my early versions of GPUVM had this. But I
dropped it because I don't saw an immediate benefit.

From my old change log:

    "Remove merging of GPUVAs; the kernel has limited to none knowlege about
    the semantics of mapping sequences. Hence, merging is purely speculative.
    It seems that gaining a significant (or at least a measurable) performance
    increase through merging is way more likely to happen when userspace is
    responsible for merging mappings up to the next larger page size if
    possible."

If the pure number of GPUVA structures is a concern though, I think it's fair to
add it. So, feel to send a patch.

It's probably also a good idea to double check with my old merge implementation
[1]. It's pretty easy to get this wrong. I'm not saying I got it right, but if
we both ended up with the same logic, it's a good indicator. :)

However, this should *not* be a solution for an existing bug. Above you mention
a bug related to "duplicated VMAs covering the same virtual address range". This
is unrelated and must be fixed separately. Do you have a way to reproduce this?

[1] https://lore.kernel.org/dri-devel/20230217134422.14116-6-dakr@redhat.com/

> 
> > Also, can we move this on DRI-devel please?
> 
> Yes will do.
> 
> Oak
