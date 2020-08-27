Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0634A2544D4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 14:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86F26E43F;
	Thu, 27 Aug 2020 12:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8526E43F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 12:15:17 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D921C207CD;
 Thu, 27 Aug 2020 12:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598530517;
 bh=8/Uo/bTKsupSIoAgh+tXShD0dKwcGgGzU0K627XFrFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PzKvfy1hGR/NN+N9EjNznIChtG5H44kvPSm86JsQGtfu+fceycAShj9VaBWI4C3D9
 jPsIp0d49ZuALDccnFbexxD5okRzl4CmBC4YPIdQzG3pswyiIvV4QcchFZsNHz/XWL
 87K3RFXizjXgfVf4XITuYOeAAOriC2BS/ltXc1gw=
Date: Thu, 27 Aug 2020 14:15:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Stultz <john.stultz@linaro.org>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 0/2] staging: android: Remove BUG/BUG_ON from ion
Message-ID: <20200827121531.GD417381@kroah.com>
References: <cover.1598023523.git.tomersamara98@gmail.com>
 <20200825064729.GA30014@infradead.org>
 <20200825065229.GA1319770@kroah.com>
 <20200827071654.GB25305@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200827071654.GB25305@infradead.org>
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Suren Baghdasaryan <surenb@google.com>, Tomer Samara <tomersamara98@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hridya Valsaraju <hridya@google.com>, Riley Andrews <riandrews@android.com>,
 Arve Hj?nnev?g <arve@android.com>, Joel Fernandes <joel@joelfernandes.org>,
 Laura Abbott <labbott@redhat.com>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 27, 2020 at 08:16:54AM +0100, Christoph Hellwig wrote:
> On Tue, Aug 25, 2020 at 08:52:29AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Aug 25, 2020 at 07:47:29AM +0100, Christoph Hellwig wrote:
> > > On Fri, Aug 21, 2020 at 06:27:04PM +0300, Tomer Samara wrote:
> > > > Remove BUG/BUG_ON from androind/ion
> > > 
> > > Please just remove ion.  It has been rejected and we have developed
> > > proper kernel subsystens to replace it.  Don't waste your time on it.
> > 
> > It is going to be removed at the end of this year.  Why we keep it
> > around until then, I really don't know, but John and Laura have this as
> > the plan.
> 
> It keeps getting in the way of various projects and has no path
> going upstream properly.  Seems weird to keep this dead and not all
> that great code around.

In looking at the mess of ion changes that are currently in the AOSP
kernel tree (where android devices are pulled from), it looks almost
nothing like what we currently have here in the mainline kernel tree.

So if what we have here, today, is not of use to anyone who actually
wants to use this interface, why are we keeping it around?

John, why can't we just drop all of this code from the kernel today, and
then Android will keep their own copy for their next LTS release anyway.
It doesn't look like what we have here, and the merge issues it causes
is a pain (as I know from having to do them...)  So keeping this around
in-tree any longer feels pointless to me, and actively causes me, and
others, more work for no gain.

I'll go make a patch set to just drop this code now...

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
