Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2097A407DB7
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 15:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951956EC80;
	Sun, 12 Sep 2021 13:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC58C6EC80
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 13:55:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54B55610A6;
 Sun, 12 Sep 2021 13:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1631454919;
 bh=bU1fx9RxQY+dJSkPVd28cMp2fgn6lpQkxiScIWnp1f4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qLUgeZmab3xVZUiCzIeqeT+S+qDMgmgLb+Uze6SSbDmdT/YntueMaAMcty//va5t1
 c9t4hLcnkjDtWerN8iKjtFBaEfpzR77CmqbclTO1DzChlsNl1tQYtM3TMKLYd7MLbu
 rGopICQnUiBqmCGilF3B4x6hAqVQMuvVNAeosyKs=
Date: Sun, 12 Sep 2021 15:55:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Oded Gabbay <ogabbay@kernel.org>, mzuckerman@habana.ai,
 dsinger@habana.ai, Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Subject: Accelerator drivers going forward (was Re: Habanalabs Open-Source
 TPC LLVM compiler and SynapseAI Core library)
Message-ID: <YT4GxO7ab+s0nbze@kroah.com>
References: <CAFCwf119s7iXk+qpwoVPnRtOGcxeuZb3rnihf6NWWoVT-4ODHA@mail.gmail.com>
 <YTsQJ753sm701R/n@kroah.com>
 <CAKMK7uFLBmdHphtnEa1nyAGUHdcP1KgmaK+vtV_GOU6wZZAOxg@mail.gmail.com>
 <CAKMK7uFj-m4y+N-q8uoNasJuksgDj-oRK3K=SjoyKMQL=QCENw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFj-m4y+N-q8uoNasJuksgDj-oRK3K=SjoyKMQL=QCENw@mail.gmail.com>
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

On Fri, Sep 10, 2021 at 06:10:27PM +0200, Daniel Vetter wrote:
> Forgot to add dri-devel.
> 
> On Fri, Sep 10, 2021 at 6:09 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Fri, Sep 10, 2021 at 9:58 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > On Fri, Sep 10, 2021 at 10:26:56AM +0300, Oded Gabbay wrote:
> > > > Hi Greg,
> > > >
> > > > Following our conversations a couple of months ago, I'm happy to tell you that
> > > > Habanalabs has open-sourced its TPC (Tensor Processing Core) LLVM compiler,
> > > > which is a fork of the LLVM open-source project.
> > > >
> > > > The project can be found on Habanalabs GitHub website at:
> > > > https://github.com/HabanaAI/tpc_llvm
> > > >
> > > > There is a companion guide on how to write TPC kernels at:
> > > > https://docs.habana.ai/en/latest/TPC_User_Guide/TPC_User_Guide.html
> > >
> > > That's great news, thanks for pushing for this and releasing it all!
> >
> > Yeah this is neat.
> >
> > There's still the problem that we spent the past 2.5 years pissing off
> > a lot of people for an imo questionable political project, bypassing
> > all the technical review and expertise. Now that the political
> > nonsense is resolved I think we need to look at at least the technical
> > cleanup. The angered people are much harder to fix, so let's maybe
> > ignore that (or perhaps a ks topic, no idea, I'm honestly not super
> > motivated to rehash this entire story again). Here's what I think we
> > should do:
> >
> > - move drivers/misc/habanalabs under drivers/gpu/habanalabs and
> > review/discussions on dri-devel

Wait, why move into gpu?  Are we going to do that for all hardware
accelerators that we currently have in the kernel tree?

These things are not GPUs in the sense of them being "do some work and
write out to a screen", which is what I would associate with a GPU (G
does stand for "Graphical", right?)

Yes, GPUs can do things that some accelerators can do, but they can do
things that accelerators can not do, and the other way around as well.
I doubt you want all of the existing gpu drivers to be only treated as
an "accelerator driver" now, as where would the logic that has to happen
to get the bits out to a screen live?

And since we have a long history of accepting accelerator drivers (I see
some in our tree since 2018 at the least), and there is no common
userspace collation trying to make a common userspace api, why do they
have to live in the same place?  What makes them common except for the
fact that they use the kernel as a semi-dumb pipe to send work to and
from a different processor?

Look at drivers/misc/cxl/ and drivers/misc/ocxl and drivers/misc/uacce/
and drivers/misc/sgi-gru and drivers/misc/bcm-vk/ even drivers/misc/mei/
as that is an off-load engine we talk to, right?

What about the drivers/fpga/ api we have, it handles accelerators as
well.  I'm sure we have many other examples in the kernel tree as well,
I just did a quick look and found these.

All the above accelerators do things in different ways because their
hardware is different, so they need different user/kernel apis, right?
How are we going to unify them?  Who is going to unify them?

So drivers/accel/ perhaps?  I would be able to get rid of loads of
drivers/misc/ code that way :)

Who is going to be the new maintainer of this subsystem?

So far they have all been going into drivers/misc/ because no one else
stepped up to do the review of them except me.  I would _LOVE_ the help
here as I end up reviewing a new one every kernel release at the least,
but companies do not seem to be willing to fund developers to be
maintainers these days :(

And yes, I have been reviewing the fpga code as well, even though they
do have a good maintainer, as those patches flow through my tree due to
historical reasons.  I know the fpga developers would have loved some
help with review of those patches.

> > - grandfather the entire current situation in as-is, it's not the only
> > driver we have with a funny uapi of its own (but the other driver did
> > manage to get their compiler into upstream llvm even, and not like 2
> > years late)

We have many many accelerator drivers with odd uapis as they all work
differently.  Are we going to have to have any new company that comes
along use one of the existing apis we have (and if so, which one?) or do
we allow them to create their own as everyone does do things
differently, which really is fine as far as a kernel is concerned
(again, semi-dumb pipe.)

> > - review the dma-buf stuff on dri-devel and then land it through
> > standard flows, not the gregk-misc bypass

Are dma-bufs somehow required to be reviewed on dri-devel?  As others
have asked in the past, they are already being used in other subsystems
(like IB) today, did those authors also get review there?

If so, great, if not, that feels odd to me, as I am seeing lots of
out-of-tree drivers start to use these structures, which is why the api
was created (to stop the roll-your-own-implementations.)  Does dri-devel
want me to have those vendors cc: you all when those get submitted?

> > - close drivers/misc backdoor for further accel driver submissions,
> > I'd like to focus on technical stuff in this area going forward and
> > not pointless exercises in bypassing due process and all that

I will be glad to not accept any more, but as I say above, what are the
new requirements going to be so that those companies that do want to
submit their code know what to do?

And what exactly are we using as a definition of an accelerator?  We
have networking cards that are "accelerators" as well as crypto
"accelerators" :)

> > I expect we'll have a proper discussion what the stack should look
> > like with the next submission (from a different vendor maybe), that
> > ship kinda sailed with habanalabs.

Who is going to define this stack?  As there is no industry standard,
why would we define this?

thanks,

greg k-h
