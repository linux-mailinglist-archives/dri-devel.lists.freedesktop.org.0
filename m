Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3890262E9F3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 01:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AA210E1DF;
	Fri, 18 Nov 2022 00:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE28B10E1DF;
 Fri, 18 Nov 2022 00:01:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3083B622AF;
 Fri, 18 Nov 2022 00:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EE3C433D6;
 Fri, 18 Nov 2022 00:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668729670;
 bh=ov1dwfKlY10jlyvvrILEMTGZym5hMBZuKYP5HTVbbNw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jUV6xj2ZuGt6gS++XzvZWg0g4N5kX3l4CCDn+/3k2C9z8oqImtI0RiS453F7mzV7s
 /i8YeU0Zk/s8iJXQZvkZ6VIwOVUccL/fB18s6uWeB5TNua5NHVLUQcG5c7g3lwD14I
 8Jqpt6YpzqDz7axweXGMZ0ccO8JOc2xAcPv93xP/E/hb/dTFiKsoQ4w++pKZjAtYEK
 elqG3Gz2r/BxmLl/PYwBnq6HveJstEV2yXkKHe9rQMIiGcSH/mM6UsBKQvXKyw0b+4
 lUDo3Np0l8usOfpNZ6bY7az78OiFW1/7dNoUFwg0kK1zJKH9f5UD7Xjq08EDHn3Vgp
 D4no7ZB6I5rHQ==
Date: Thu, 17 Nov 2022 17:01:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm-misc tree with the origin tree
Message-ID: <Y3bLRLDCrd7KYqom@dev-arch.thelio-3990X>
References: <20221116105702.746ce3cf@canb.auug.org.au>
 <Y3ZvffZiR+SgtY6h@dev-arch.thelio-3990X>
 <20221118090636.00bfc293@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118090636.00bfc293@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 09:06:36AM +1100, Stephen Rothwell wrote:
> Hi Nathan,
> 
> On Thu, 17 Nov 2022 10:29:33 -0700 Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > This resolution is not quite right, as pointed out by clang:
> > 
> >     drivers/gpu/drm/vc4/vc4_hdmi.c:351:14: error: variable 'vc4_hdmi' is uninitialized when used here [-Werror,-Wuninitialized]
> >             mutex_lock(&vc4_hdmi->mutex);
> >                         ^~~~~~~~
> >     ./include/linux/mutex.h:187:44: note: expanded from macro 'mutex_lock'
> >     #define mutex_lock(lock) mutex_lock_nested(lock, 0)
> >                                                ^~~~
> >     drivers/gpu/drm/vc4/vc4_hdmi.c:322:27: note: initialize the variable 'vc4_hdmi' to silence this warning
> >             struct vc4_hdmi *vc4_hdmi;
> >                                      ^
> >                                       = NULL
> >     1 error generated.
> > 
> > Obviously, the assignment of vc4_hdmi should be before mutex_lock().
> 
> Thanks for pointing that out (silly me :-) ).  I have fixed up the
> resolution for today.

Great, thank you so much! One less warning to worry about :)

Cheers,
Nathan
