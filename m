Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E27029D2
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 12:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82B110E1A1;
	Mon, 15 May 2023 10:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bee.tesarici.cz (bee.tesarici.cz [IPv6:2a03:3b40:fe:2d4::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265C310E1A7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 10:01:00 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 326E5160138;
 Mon, 15 May 2023 12:00:55 +0200 (CEST)
Authentication-Results: mail.tesarici.cz;
 dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
 t=1684144855; bh=FVFsQnYYTuwSDfQT1gRhMw75JP0WYBxpbYd1nJTsCHE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ukVkPEFMenbg+4nKrZB3AJ2+vq21sO5D8rLu5evn+zhUMlfOJW7LnSZwrDqZqoFpK
 7TqR4dBsvR7NxgLCpSJfGnuJiD8QpqHejOt8ff2mYfN3CJnYi2+V3tBS/BnE1H3fYG
 z+4qFhYA/Z6kZ5gyzmTx3/Jl/x/la5CE6tV5yKkBag0XkDCTki+dId+FMNgyYZRza4
 cWz4S7wDuPqX3DzRAr0shXwjcSE1jXYQO7f+mO1u+qLQE3151PjXt+9alskoe+lI/I
 y0VV68MDZs+bTqidCD+qs2Q2/S0Bvr2EiTL3Pu7HIzaw188xAS3xMnUWB2+jLFWVNz
 sIlUxYdXua66Q==
Date: Mon, 15 May 2023 12:00:54 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 RESEND 7/7] swiotlb: per-device flag if there are
 dynamically allocated buffers
Message-ID: <20230515120054.0115a4eb@meshulam.tesarici.cz>
In-Reply-To: <20230515104847.6dfdf31b@meshulam.tesarici.cz>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
 <69f9e058bb1ad95905a62a4fc8461b064872af97.1683623618.git.petr.tesarik.ext@huawei.com>
 <ZGEuYxR2PM6wHeDh@arm.com>
 <20230515104847.6dfdf31b@meshulam.tesarici.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Kim Phillips <kim.phillips@amd.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Petr Tesarik <petrtesarik@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, "open list:DMA
 MAPPING HELPERS" <iommu@lists.linux.dev>, Borislav Petkov <bp@suse.de>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Roberto Sassu <roberto.sassu@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 May 2023 10:48:47 +0200
Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:

> Hi Catalin,
>=20
> On Sun, 14 May 2023 19:54:27 +0100
> Catalin Marinas <catalin.marinas@arm.com> wrote:
>[...]
> > Now, thinking about the list_head access and the flag ordering, since it
> > doesn't matter, you might as well not bother with the flag at all and
> > rely on list_add() and list_empty() ordering vs the hypothetical 'blah'
> > access. Both of these use READ/WRITE_ONCE() for setting
> > dma_io_tlb_dyn_slots.next. You only need an smp_wmb() after the
> > list_add() and an smp_rmb() before a list_empty() check in
                      ^^^^^^^^^
Got it, finally. Well, that's exactly something I don't want to do.
For example, on arm64 (seeing your email address), smp_rmb() translates
to a "dsb ld" instruction. I would expect that this is more expensive
than a "ldar", generated by smp_load_acquire().

I mean, for devices that do not need swiotlb, the flag never changes
from zero, so reading it must be as cheap as possible.

Petr T

> > is_swiotlb_buffer(), no dma_iotlb_have_dyn variable. =20
>=20
> Wait, let me check that I understand you right. Do you suggest that I
> convert dma_io_tlb_dyn_slots to a lockless list and get rid of the
> spinlock?
>=20
> I'm sure it can be done for list_add() and list_del(). I'll have
> to think about list_move().

Hm, even the documentation of llist_empty() says that it is "not
guaranteed to be accurate or up to date". If it could be, I'm quite
sure the authors would have gladly implemented it as such.

Petr T
