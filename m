Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714FC22C827
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 16:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42366E980;
	Fri, 24 Jul 2020 14:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C756E0C4;
 Fri, 24 Jul 2020 14:35:51 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B3082065C;
 Fri, 24 Jul 2020 14:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595601351;
 bh=L7/MwNAWCUFGl5PPjS4I/NXskBIhuh/a8szTHPAtB2o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=evvrI1BGgtE+SPkmfhvSpzy6GLmEfaY0aSMDB9mfPSAxpEbjPPEZaef/LG/UBN+r1
 8qLDaag77ZA8ppddFZbsFWU7TXPA2EdzAelblCXO2loDBPVbtbbAnfR+RcaRNO4wO2
 xle9Sz+cT1LnAaOZqG37Pb02PUlPprfbBv/AHLf4=
Date: Fri, 24 Jul 2020 09:35:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
Message-ID: <20200724143549.GA1516749@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724095751.GU1375436@lahna.fi.intel.com>
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
Cc: Sasha Levin <sashal@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Patrick Volkerding <volkerdi@gmail.com>, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 24, 2020 at 12:57:51PM +0300, Mika Westerberg wrote:
> On Thu, Jul 23, 2020 at 10:30:58PM +0200, Karol Herbst wrote:
> > On Wed, Jul 22, 2020 at 11:25 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > >
> > > On Tue, Jul 21, 2020 at 01:37:12PM -0500, Patrick Volkerding wrote:
> > > > On 7/21/20 10:27 AM, Mika Westerberg wrote:
> > > > > On Tue, Jul 21, 2020 at 11:01:55AM -0400, Lyude Paul wrote:
> > > > >> Sure thing. Also, feel free to let me know if you'd like access to one of the
> > > > >> systems we saw breaking with this patch - I'm fairly sure I've got one of them
> > > > >> locally at my apartment and don't mind setting up AMT/KVM/SSH
> > > > > Probably no need for remote access (thanks for the offer, though). I
> > > > > attached a test patch to the bug report:
> > > > >
> > > > >   https://bugzilla.kernel.org/show_bug.cgi?id=208597
> > > > >
> > > > > that tries to work it around (based on the ->pm_cap == 0). I wonder if
> > > > > anyone would have time to try it out.
> > > >
> > > >
> > > > Hi Mika,
> > > >
> > > > I can confirm that this patch applied to 5.4.52 fixes the issue with
> > > > hybrid graphics on the Thinkpad X1 Extreme gen2.
> > >
> > > Great, thanks for testing!
> > 
> > yeah, works on the P1G2 as well.
> 
> Thanks for testing!
> 
> Since we have the revert queued for this release cycle, I think I will
> send an updated version of "PCI/PM: Assume ports without DLL Link Active
> train links in 100 ms" after v5.9-rc1 is released that has this
> workaround in place.
> 
> (I'm continuing my vacation so will be offline next week).

Sounds fine, sorry for interrupting your vacation!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
