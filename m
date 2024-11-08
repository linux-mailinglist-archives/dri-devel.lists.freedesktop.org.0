Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D439C185C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 09:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC1210E1A4;
	Fri,  8 Nov 2024 08:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h6zJ/Xvu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7B010E1A4;
 Fri,  8 Nov 2024 08:49:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4288BA44E0C;
 Fri,  8 Nov 2024 08:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B732C4CECD;
 Fri,  8 Nov 2024 08:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1731055763;
 bh=l9sY1OHDO8wFIDCdzrR2/15Yw7PfigB1KCl3QZf41FE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h6zJ/XvuS7XXzK1Ct5OUSBE+f1pvTtZzKmi7E9ki5m3c0wZAT7xt5nOmJzLFRMGNY
 Ld60VNZ7EaU6PNpU114MBwrJ7l5r3qTSh/g9uSENTzgWcRQMo2pXbdyqaP1hbYcSxV
 lhRQqCJ8QApvyOAZUtineIyvF2vB32SnxBsUb//A=
Date: Fri, 8 Nov 2024 09:49:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jonathan Gray <jsg@jsg.id.au>
Subject: Re: [PATCH 0/1] On DRM -> stable process
Message-ID: <2024110803-undermine-viewable-2605@gregkh>
References: <20241029133141.45335-1-pchelkin@ispras.ru>
 <ZyDvOdEuxYh7jK5l@sashalap>
 <20241029-3ca95c1f41e96c39faf2e49a-pchelkin@ispras.ru>
 <20241104-61da90a19c561bb5ed63141b-pchelkin@ispras.ru>
 <2024110521-mummify-unloved-4f5d@gregkh>
 <20241108-267fb65587d32642092cea40-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-267fb65587d32642092cea40-pchelkin@ispras.ru>
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

On Fri, Nov 08, 2024 at 11:41:18AM +0300, Fedor Pchelkin wrote:
> On Tue, 05. Nov 07:57, Greg Kroah-Hartman wrote:
> > On Mon, Nov 04, 2024 at 05:55:28PM +0300, Fedor Pchelkin wrote:
> > > It is just strange that the (exact same) change made by the commits is
> > > duplicated by backporting tools. As it is not the first case where DRM
> > > patches are involved per Greg's statement [1], I wonder if something can be
> > > done on stable-team's side to avoid such odd behavior in future.
> > 
> > No, all of this mess needs to be fixed up on the drm developer's side,
> > they are the ones doing this type of crazy "let's commit the same patch
> > to multiple branches and then reference a commit that will show up at an
> > unknown time in the future and hope for the best!" workflow.
> > 
> > I'm amazed it works at all, they get to keep fixing up this mess as this
> > is entirely self-inflicted.
> 
> Thanks for reply, I get your remark. DRM people are mostly CC'ed here,
> hopefully it won't be that difficult to tune their established workflow to
> make the stable process easier and more straightforward.
> 
> As of now, would you mind to take the revert for 6.1? It's [PATCH 1/1] in
> this thread. No point to keep it there, and the duplicated commits were
> already reverted from the fresher stable kernels.
> 

I don't see it in my review queue anymore, can you please resend it?

thanks,

greg k-h
