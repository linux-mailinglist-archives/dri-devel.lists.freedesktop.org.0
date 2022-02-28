Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86274C7C9F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 23:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9A210E610;
	Mon, 28 Feb 2022 22:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D364510E610;
 Mon, 28 Feb 2022 22:01:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5CBD2B8169B;
 Mon, 28 Feb 2022 22:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677EEC340F1;
 Mon, 28 Feb 2022 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646085677;
 bh=bmzYeqH+wd1Y/i05gxZoeqc9TywPR9wpt0imv9Fx7Nw=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=lb9MoeFhEeGqaET4WoooJnliR/Aftbuf2qgeJWcsJRMUD7lxaPDCkpbBw1fltPmKc
 jIEBu8SnVjgO3Aaf+8FYuXvVgG5MgAciJgva3R/8WVNn/ktDFk3hANDz2GKUoZWtxI
 SvipV/Wo2m8Yu0T44/FsB9ncJWS6zqb8Cis19xBBpG1gsQAhwdKCM2xymmzy1B6vAh
 NLgpj3CkfoCj7XXB9+t8bZHUSaMtCcXi/0/BYE3ppk5zRyoiwaHoQXmDsDHRdh2g9L
 BKDOg0IEHzQ+qInzyklcGdLSrMWPhR+ZxEuCQewyXU3mL+4cdRVVpWMroWAhmtcL3w
 /5xJdekiDQkIw==
Date: Mon, 28 Feb 2022 23:59:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Linus	Torvalds <torvalds@linux-foundation.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/6=5D_treewide=3A_remove_using?=
 =?US-ASCII?Q?_list_iterator_after_loop_body_as_a_ptr?=
User-Agent: K-9 Mail for Android
In-Reply-To: <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
Message-ID: <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On February 28, 2022 10:42:53 PM GMT+02:00, James Bottomley <James=2EBotto=
mley@HansenPartnership=2Ecom> wrote:
>On Mon, 2022-02-28 at 21:07 +0100, Christian K=C3=B6nig wrote:
>> Am 28=2E02=2E22 um 20:56 schrieb Linus Torvalds:
>> > On Mon, Feb 28, 2022 at 4:19 AM Christian K=C3=B6nig
>> > <christian=2Ekoenig@amd=2Ecom> wrote:
>> > > I don't think that using the extra variable makes the code in any
>> > > way
>> > > more reliable or easier to read=2E
>> > So I think the next step is to do the attached patch (which
>> > requires
>> > that "-std=3Dgnu11" that was discussed in the original thread)=2E
>> >=20
>> > That will guarantee that the 'pos' parameter of
>> > list_for_each_entry()
>> > is only updated INSIDE the for_each_list_entry() loop, and can
>> > never
>> > point to the (wrongly typed) head entry=2E
>> >=20
>> > And I would actually hope that it should actually cause compiler
>> > warnings about possibly uninitialized variables if people then use
>> > the
>> > 'pos' pointer outside the loop=2E Except
>> >=20
>> >   (a) that code in sgx/encl=2Ec currently initializes 'tmp' to NULL
>> > for
>> > inexplicable reasons - possibly because it already expected this
>> > behavior
>> >=20
>> >   (b) when I remove that NULL initializer, I still don't get a
>> > warning,
>> > because we've disabled -Wno-maybe-uninitialized since it results in
>> > so
>> > many false positives=2E
>> >=20
>> > Oh well=2E
>> >=20
>> > Anyway, give this patch a look, and at least if it's expanded to do
>> > "(pos) =3D NULL" in the entry statement for the for-loop, it will
>> > avoid the HEAD type confusion that Jakob is working on=2E And I think
>> > in a cleaner way than the horrid games he plays=2E
>> >=20
>> > (But it won't avoid possible CPU speculation of such type
>> > confusion=2E That, in my opinion, is a completely different issue)
>>=20
>> Yes, completely agree=2E
>>=20
>> > I do wish we could actually poison the 'pos' value after the loop
>> > somehow - but clearly the "might be uninitialized" I was hoping for
>> > isn't the way to do it=2E
>> >=20
>> > Anybody have any ideas?
>>=20
>> I think we should look at the use cases why code is touching (pos)
>> after the loop=2E
>>=20
>> Just from skimming over the patches to change this and experience
>> with the drivers/subsystems I help to maintain I think the primary
>> pattern looks something like this:
>>=20
>> list_for_each_entry(entry, head, member) {
>>      if (some_condition_checking(entry))
>>          break;
>> }
>> do_something_with(entry);
>
>
>Actually, we usually have a check to see if the loop found anything,
>but in that case it should something like
>
>if (list_entry_is_head(entry, head, member)) {
>    return with error;
>}
>do_somethin_with(entry);
>
>Suffice?  The list_entry_is_head() macro is designed to cope with the
>bogus entry on head problem=2E

Won't suffice because the end goal of this work is to limit scope of entry=
 only to loop=2E Hence the need for additional variable=2E

Besides, there are no guarantees that people won't do_something_with(entry=
) without the check or won't compare entry to NULL to check if the loop fin=
ished with break or not=2E

>James


--=20
Sincerely yours,
Mike
