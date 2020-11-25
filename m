Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6802C504C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 09:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A306E885;
	Thu, 26 Nov 2020 08:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 506 seconds by postgrey-1.36 at gabe;
 Wed, 25 Nov 2020 09:09:46 UTC
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6EC89BF8;
 Wed, 25 Nov 2020 09:09:46 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
 id C2D44C63FB; Wed, 25 Nov 2020 09:01:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1606294874; bh=KH9dzgywMXfGPGDwmO8Qm6o//zr8KQDL4nO6EawRuDY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SJYLrwiKZrmMRjkeBYo7cqsbs6xljPuQypU3vE6W0mhxhiBNmXN2bqL5RV07d2awA
 Wb5Oa7L0TiIxfU/vxoLt2vFycI3gN8Kh1qdOF59uK2dEnqITAnDV+wsiQw/exDF78D
 hoTz22IC76edW7bl4Xm8hYrqoRAlLOCNTSbizDTKI7x8BBnutJW03OyPsTxurVqfdC
 T9t8y4uSMzXA9L5TYoAbkkzEdR07qHfBTYdhaiYGGYuE1E1bdzLhtRTU2iYu251NBa
 zqIr2827TZMk9I1fNh/951tgkmCQWewUCt5nrmXnkgqHhLp9nxDE6gWAGCUXG6XCXv
 3mw8Hv064saVQ==
Date: Wed, 25 Nov 2020 09:01:14 +0000
From: Sean Young <sean@mess.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
Message-ID: <20201125090114.GA24274@gofer.mess.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
 <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
 <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 26 Nov 2020 08:24:08 +0000
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
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input <linux-input@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-nfs@vger.kernel.org,
 GR-Linux-NIC-Dev@marvell.com, tipc-discussion@lists.sourceforge.net,
 Linux-MM <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-renesas-soc@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 23, 2020 at 07:58:06AM -0800, James Bottomley wrote:
> On Mon, 2020-11-23 at 15:19 +0100, Miguel Ojeda wrote:
> > On Sun, Nov 22, 2020 at 11:36 PM James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:
> > > It's not about the risk of the changes it's about the cost of
> > > implementing them.  Even if you discount the producer time (which
> > > someone gets to pay for, and if I were the engineering manager, I'd
> > > be unhappy about), the review/merge/rework time is pretty
> > > significant in exchange for six minor bug fixes.  Fine, when a new
> > > compiler warning comes along it's certainly reasonable to see if we
> > > can benefit from it and the fact that the compiler people think
> > > it's worthwhile is enough evidence to assume this initially.  But
> > > at some point you have to ask whether that assumption is supported
> > > by the evidence we've accumulated over the time we've been using
> > > it.  And if the evidence doesn't support it perhaps it is time to
> > > stop the experiment.
> > 
> > Maintainers routinely review 1-line trivial patches, not to mention
> > internal API changes, etc.
> 
> We're also complaining about the inability to recruit maintainers:
> 
> https://www.theregister.com/2020/06/30/hard_to_find_linux_maintainers_says_torvalds/
> 
> And burn out:
> 
> http://antirez.com/news/129
> 
> The whole crux of your argument seems to be maintainers' time isn't
> important so we should accept all trivial patches ... I'm pushing back
> on that assumption in two places, firstly the valulessness of the time
> and secondly that all trivial patches are valuable.

You're assuming burn out or recruitment problems is due to patch workload
or too many "trivial" patches.

In my experience, "other maintainers" is by far the biggest cause of
burn out for my kernel maintenance work.

Certainly arguing with a maintainer about some obviously-correct patch
series must be a good example of this.


Sean
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
