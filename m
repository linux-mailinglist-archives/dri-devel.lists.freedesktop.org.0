Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C67191826
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 18:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89F46E4FF;
	Tue, 24 Mar 2020 17:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA746E4FF;
 Tue, 24 Mar 2020 17:50:56 +0000 (UTC)
Received: from localhost (mobile-166-175-186-165.mycingular.net
 [166.175.186.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B93C206F6;
 Tue, 24 Mar 2020 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585072256;
 bh=CCEABUBAN9MRCpgZksVbrjdDahiV/d+RR5NEsl42kLY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=oTKbBiukjqGnd1ubSkTzU8ZLakbO+PNdBHpsd8jDmeekp1cwfiFnpXrA2nBak0QkQ
 9mCR81onE5mAvc0ko9+NVjWOYqRzaqDEoNZa9+n+ap7j4FuFUn2oQ2X8zJ2+5Dxm4T
 vFbo7RkPWVrOqpmSMGot0Yf4DD1FBSBxWL6lhhsE=
Date: Tue, 24 Mar 2020 12:50:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v7] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20200324175054.GA23029@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55ttvb5uC37ORiLuVBidhfSn-+WSReJ+aCfWR3k-fLtPBnA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 06:31:08PM +0100, Karol Herbst wrote:
> On Sat, Mar 21, 2020 at 2:02 AM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Fri, Mar 20, 2020 at 11:19 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > >
> > > On Tue, Mar 10, 2020 at 08:26:27PM +0100, Karol Herbst wrote:
> > > > Fixes the infamous 'runtime PM' bug many users are facing on Laptops with
> > > > Nvidia Pascal GPUs by skipping said PCI power state changes on the GPU.
> > > >
> > > > Depending on the used kernel there might be messages like those in demsg:
> > > >
> > > > "nouveau 0000:01:00.0: Refused to change power state, currently in D3"
> > > > "nouveau 0000:01:00.0: can't change power state from D3cold to D0 (config
> > > > space inaccessible)"
> > > > followed by backtraces of kernel crashes or timeouts within nouveau.
> > > >
> > > > It's still unkown why this issue exists, but this is a reliable workaround
> > > > and solves a very annoying issue for user having to choose between a
> > > > crashing kernel or higher power consumption of their Laptops.
> > >
> > > Thanks for the bugzilla link.  The bugzilla mentions lots of mailing
> > > list discussion.  Can you include links to some of that?
> > >
> > > IIUC this basically just turns off PCI power management for the GPU.
> > > Can you do that with something like the following?  I don't know
> > > anything about DRM, so I don't know where you could save the pm_cap,
> > > but I'm sure the driver could keep it somewhere.
> > >
> >
> > Sure this would work? From a quick look over the pci code, it looks
> > like a of code would be skipped we really need, like the platform code
> > to turn off the GPU via ACPI. But I could also remember incorrectly on
> > how all of that worked again. I can of course try and see what the
> > effect of this patch would be. And would the parent bus even go into
> > D3hot if it knows one of its children is still at D0? Because that's
> > what the result of that would be as well, no? And I know that if the
> > bus stays in D0, that it has a negative impact on power consumption.
> >
> > Anyway, I will try that out, I am just not seeing how that would help.
> 
> so it seems like that has worked unless I screwed up locally. Will do
> some proper testing and then I think we won't need to go through the
> pci tree anymore as no changes are required there with that.

Hehe, looks like our responses crossed in the mail :)  I hope further
testing is still positive; let me know if not.

Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
