Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52356A3C1F1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B218F10E81D;
	Wed, 19 Feb 2025 14:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KvjMdccX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AEF10E81D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:22:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7C5C75C57FE;
 Wed, 19 Feb 2025 14:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1ECCC4CED1;
 Wed, 19 Feb 2025 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1739974969;
 bh=GTM0nMqLEseQqbskm/xMfNFu229ExtSbl6yk5KrJ6gI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KvjMdccXWY0mGNivdlQdAsrJ0unYr0odpSg0DzGNRRdmxH0mYIK43hTxK/ic0SumD
 9hX2L8wNafdx57zHXjzMpsYnuuhDXJgdL9Vuz+hNDGrAXRMViLbpoy+KsZvWqol9wo
 OCk8TmnkV1n2KQUYRWf0Up+60IanHkiyQKaRJ02Q=
Date: Wed, 19 Feb 2025 15:22:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Elizabeth Figura <zfigura@codeweavers.com>
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Mike Lothian <mike@fireburn.co.uk>, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org, wine-devel@winehq.org,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Wolfram Sang <wsa@kernel.org>, Arkadiusz Hiler <ahiler@codeweavers.com>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH] ntsync: Set the permissions to be 0666
Message-ID: <2025021933-sureness-tipped-ff2b@gregkh>
References: <20250214122759.2629-2-mike@fireburn.co.uk>
 <2768333.mvXUDI8C0e@camazotz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2768333.mvXUDI8C0e@camazotz>
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

On Tue, Feb 18, 2025 at 05:57:31PM -0600, Elizabeth Figura wrote:
> On Friday, 14 February 2025 06:28:00 CST Mike Lothian wrote:
> > This allows ntsync to be usuable by non-root processes out of the box
> > 
> > Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
> > ---
> >  drivers/misc/ntsync.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/misc/ntsync.c b/drivers/misc/ntsync.c
> > index 055395cde42b..586b86243e1d 100644
> > --- a/drivers/misc/ntsync.c
> > +++ b/drivers/misc/ntsync.c
> > @@ -1208,6 +1208,7 @@ static struct miscdevice ntsync_misc = {
> >  	.minor		= MISC_DYNAMIC_MINOR,
> >  	.name		= NTSYNC_NAME,
> >  	.fops		= &ntsync_fops,
> > +	.mode		= 0666, // Setting file permissions to 0666
> >  };
> >  
> >  module_misc_device(ntsync_misc);
> > 
> 
> Reviewed-by: Elizabeth Figura <zfigura@codeweavers.com>
> 
> --
> 
> The comment seems rather redundant, but otherwise this is correct and prudent.

I agree, I'll drop the comment when I apply it, thanks.

greg k-h
