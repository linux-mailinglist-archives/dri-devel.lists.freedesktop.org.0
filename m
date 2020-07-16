Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B572222F6B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 01:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1863C6E134;
	Thu, 16 Jul 2020 23:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A646E134;
 Thu, 16 Jul 2020 23:54:42 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1AA32206F4;
 Thu, 16 Jul 2020 23:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594943682;
 bh=5JJSHjqmJlDv9mXOvlmTppZP30lsQeoHcSBH5e6zomY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=jYtPm3RtLoP4YCa/HNF9mG73mziytXde43UKFlYiPwOZ0xNzjIZuANUx82RnQOxzM
 D4bYVCLwh14O89ldVqnKI1QeRVqkKLYckkMDsttFq1Ff/j7ClI2CZzD6jtG8zdgTmS
 HLXCuGk3naDByOot88co+hUnYRj30e+fIupHmo3A=
Date: Thu, 16 Jul 2020 18:54:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
Message-ID: <20200716235440.GA675421@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
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
Cc: Sasha Levin <sashal@kernel.org>, Patrick Volkerding <volkerdi@gmail.com>,
 Linux PCI <linux-pci@vger.kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+cc Sasha -- stable kernel regression]
[+cc Patrick, Kai-Heng, LKML]

On Fri, Jul 17, 2020 at 12:10:39AM +0200, Karol Herbst wrote:
> On Tue, Jul 7, 2020 at 9:30 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > Hi everybody,
> >
> > with the mentioned commit Nouveau isn't able to load firmware onto the
> > GPU on one of my systems here. Even though the issue doesn't always
> > happen I am quite confident this is the commit breaking it.
> >
> > I am still digging into the issue and trying to figure out what
> > exactly breaks, but it shows up in different ways. Either we are not
> > able to boot the engines on the GPU or the GPU becomes unresponsive.
> > Btw, this is also a system where our runtime power management issue
> > shows up, so maybe there is indeed something funky with the bridge
> > controller.
> >
> > Just pinging you in case you have an idea on how this could break Nouveau
> >
> > most of the times it shows up like this:
> > nouveau 0000:01:00.0: acr: AHESASC binary failed
> >
> > Sometimes it works at boot and fails at runtime resuming with random
> > faults. So I will be investigating a bit more, but yeah... I am super
> > sure the commit triggered this issue, no idea if it actually causes
> > it.
> 
> so yeah.. I reverted that locally and never ran into issues again.
> Still valid on latest 5.7. So can we get this reverted or properly
> fixed? This breaks runtime pm for us on at least some hardware.

Yeah, that stinks.  We had another similar report from Patrick:

  https://lore.kernel.org/r/CAErSpo5sTeK_my1dEhWp7aHD0xOp87+oHYWkTjbL7ALgDbXo-Q@mail.gmail.com

Apparently the problem is ec411e02b7a2 ("PCI/PM: Assume ports without
DLL Link Active train links in 100 ms"), which Patrick found was
backported to v5.4.49 as 828b192c57e8, and you found was backported to
v5.7.6 as afaff825e3a4.

Oddly, Patrick reported that v5.7.7 worked correctly, even though it
still contains afaff825e3a4.

I guess in the absence of any other clues we'll have to revert it.
I hate to do that because that means we'll have slow resume of
Thunderbolt-connected devices again, but that's better than having
GPUs completely broken.

Could you and Patrick open bugzilla.kernel.org reports, attach dmesg
logs and "sudo lspci -vv" output, and add the URLs to Kai-Heng's
original report at https://bugzilla.kernel.org/show_bug.cgi?id=206837
and to this thread?

There must be a way to fix the slow resume problem without breaking
the GPUs.

Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
