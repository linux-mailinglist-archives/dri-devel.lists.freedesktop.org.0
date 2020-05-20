Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F81DAA6E
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 08:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805106E56D;
	Wed, 20 May 2020 06:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5A76E56D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 06:14:00 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B44520748;
 Wed, 20 May 2020 06:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589955239;
 bh=JPF6FxRfXiDX6GOz4VjTFzelnl5fzmMBAKNkt5sZv7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T85sC09yPYQ2gHtXFfMphwDGOw22fXYS+U4OSyMwOTQ/M1Fd/QkLJ+ToBzanvnOaL
 83IIYNJT8QfCVrvWbjChw3vwT3gyOnIZqtuv8Uc4K4Ib3Om5JdXZKkSkF9SD/alRE8
 yQKznnVZVZE3rtfP5gIKlwX42ex3ZK/aLiBElsng=
Date: Wed, 20 May 2020 08:13:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [RFC PATCH 1/4] gpu: dxgkrnl: core code
Message-ID: <20200520061356.GA2269481@kroah.com>
References: <20200519163234.226513-1-sashal@kernel.org>
 <20200519163234.226513-2-sashal@kernel.org>
 <20200519172105.GB1101627@kroah.com>
 <20200519174553.GF33628@sasha-vm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519174553.GF33628@sasha-vm>
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
Cc: linux-hyperv@vger.kernel.org, sthemmin@microsoft.com,
 tvrtko.ursulin@intel.com, haiyangz@microsoft.com, spronovo@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, wei.liu@kernel.org, linux-fbdev@vger.kernel.org,
 iourit@microsoft.com, alexander.deucher@amd.com, kys@microsoft.com,
 Hawking.Zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 19, 2020 at 01:45:53PM -0400, Sasha Levin wrote:
> On Tue, May 19, 2020 at 07:21:05PM +0200, Greg KH wrote:
> > On Tue, May 19, 2020 at 12:32:31PM -0400, Sasha Levin wrote:
> > > +
> > > +#define DXGK_MAX_LOCK_DEPTH	64
> > > +#define W_MAX_PATH		260
> > 
> > We already have a max path number, why use a different one?
> 
> It's max path for Windows, not Linux (thus the "W_" prefix) :)

Ah, not obvious :)

> Maybe changing it to WIN_MAX_PATH or such will make it better?

Probably.

> > > +#define d3dkmt_handle		u32
> > > +#define d3dgpu_virtual_address	u64
> > > +#define winwchar		u16
> > > +#define winhandle		u64
> > > +#define ntstatus		int
> > > +#define winbool			u32
> > > +#define d3dgpu_size_t		u64
> > 
> > These are all ripe for a simple search/replace in your editor before you
> > do your next version :)
> 
> I've actually attempted that, and reverted that change, mostly because
> the whole 'handle' thing became very confusing.

Yeah, "handles" in windows can be a mess, with some being pointers and
others just integers.  Trying to make a specific typedef for it is
usually the better way overall, that way you can get the compiler to
check for mistakes.  These #defines will not really help with that.

But, 'ntstatus' should be ok to just make "int" everywhere, right?

> Note that we have a few 'handles', each with a different size, and thus
> calling get_something_something_handle() type of functions becase very
> confusing since it's not clear what handle we're working with in that
> case.

Yeah, typedefs can help there.

> With regards to the rest, I wanted to leave stuff like 'winbool' to
> document the expected ABI between the Windows and Linux side of things.
> Ideally it would be 'bool' or 'u8', but as you see we had to use 'u32'
> here which I feel lessens our ability to have the code document itself.

'bool' probably will not work as I think it's compiler dependent, __u8
is probably best.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
