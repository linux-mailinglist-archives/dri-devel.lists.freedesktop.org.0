Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C784C7B05
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 21:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F67310E4BB;
	Mon, 28 Feb 2022 20:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 623 seconds by postgrey-1.36 at gabe;
 Mon, 28 Feb 2022 20:53:23 UTC
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [IPv6:2607:fcd0:100:8a00::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F408F10E442;
 Mon, 28 Feb 2022 20:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1646080979;
 bh=syYpb/xpUEM74XaWkn+xK6Z1vfQJZQo/NwVp9EVw5rs=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=ujxiIgy0T+0bXa5l/GTOdjcngh6b85JmDA0WyHri0Bbh2a93S9iJ0SxWyDfl/MyPo
 LfSkwtJLqYe+MRa0ZrGntCtSGoW1hjohSGvPcqjksKBYaUrg8Aw3UwyQBazEu7CyPQ
 sHqUpBIAmzvzOB+1XNyd+aN4TkXOB/egoLerum4w=
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 4748C1280EAE;
 Mon, 28 Feb 2022 15:42:59 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id i-njNjm3Pi4q; Mon, 28 Feb 2022 15:42:59 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1646080979;
 bh=syYpb/xpUEM74XaWkn+xK6Z1vfQJZQo/NwVp9EVw5rs=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=ujxiIgy0T+0bXa5l/GTOdjcngh6b85JmDA0WyHri0Bbh2a93S9iJ0SxWyDfl/MyPo
 LfSkwtJLqYe+MRa0ZrGntCtSGoW1hjohSGvPcqjksKBYaUrg8Aw3UwyQBazEu7CyPQ
 sHqUpBIAmzvzOB+1XNyd+aN4TkXOB/egoLerum4w=
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:5c4:4300:c551::527])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id DDA6D12806A6;
 Mon, 28 Feb 2022 15:42:54 -0500 (EST)
Message-ID: <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop
 body as a ptr
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Linus
 Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 15:42:53 -0500
In-Reply-To: <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-02-28 at 21:07 +0100, Christian König wrote:
> Am 28.02.22 um 20:56 schrieb Linus Torvalds:
> > On Mon, Feb 28, 2022 at 4:19 AM Christian König
> > <christian.koenig@amd.com> wrote:
> > > I don't think that using the extra variable makes the code in any
> > > way
> > > more reliable or easier to read.
> > So I think the next step is to do the attached patch (which
> > requires
> > that "-std=gnu11" that was discussed in the original thread).
> > 
> > That will guarantee that the 'pos' parameter of
> > list_for_each_entry()
> > is only updated INSIDE the for_each_list_entry() loop, and can
> > never
> > point to the (wrongly typed) head entry.
> > 
> > And I would actually hope that it should actually cause compiler
> > warnings about possibly uninitialized variables if people then use
> > the
> > 'pos' pointer outside the loop. Except
> > 
> >   (a) that code in sgx/encl.c currently initializes 'tmp' to NULL
> > for
> > inexplicable reasons - possibly because it already expected this
> > behavior
> > 
> >   (b) when I remove that NULL initializer, I still don't get a
> > warning,
> > because we've disabled -Wno-maybe-uninitialized since it results in
> > so
> > many false positives.
> > 
> > Oh well.
> > 
> > Anyway, give this patch a look, and at least if it's expanded to do
> > "(pos) = NULL" in the entry statement for the for-loop, it will
> > avoid the HEAD type confusion that Jakob is working on. And I think
> > in a cleaner way than the horrid games he plays.
> > 
> > (But it won't avoid possible CPU speculation of such type
> > confusion. That, in my opinion, is a completely different issue)
> 
> Yes, completely agree.
> 
> > I do wish we could actually poison the 'pos' value after the loop
> > somehow - but clearly the "might be uninitialized" I was hoping for
> > isn't the way to do it.
> > 
> > Anybody have any ideas?
> 
> I think we should look at the use cases why code is touching (pos)
> after the loop.
> 
> Just from skimming over the patches to change this and experience
> with the drivers/subsystems I help to maintain I think the primary
> pattern looks something like this:
> 
> list_for_each_entry(entry, head, member) {
>      if (some_condition_checking(entry))
>          break;
> }
> do_something_with(entry);


Actually, we usually have a check to see if the loop found anything,
but in that case it should something like

if (list_entry_is_head(entry, head, member)) {
    return with error;
}
do_somethin_with(entry);

Suffice?  The list_entry_is_head() macro is designed to cope with the
bogus entry on head problem.

James


