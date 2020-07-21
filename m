Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDEA228B17
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 23:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E8F6E0FB;
	Tue, 21 Jul 2020 21:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6406E0FB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 21:24:24 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A36D20717;
 Tue, 21 Jul 2020 21:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595366664;
 bh=F15VAIQ+YcMoi/vlFKHrDvp0zggcPKztBbuy29xhWTM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fL7u260G4CO6iuAQXZToNhssS1mkJZOPhWIFmh7Dj9W+gyv+/B5fZSQN1ALuEZ+dI
 tR8c5BcPe600k7in81VO97qkAk4/wg9fVNDvyZAAdgnWEkuIcSglP7YuYTQYxPZ//S
 8ZjUlMKltIsIGQIWDb4q4U8YNe/Rjmiau8nIH5SE=
Date: Tue, 21 Jul 2020 14:24:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH v2] io-mapping: Indicate mapping failure
Message-Id: <20200721142424.b8846cddf1efd48e45278a42@linux-foundation.org>
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E866301245E046C@FMSMSX108.amr.corp.intel.com>
References: <20200721171936.81563-1-michael.j.ruhl@intel.com>
 <20200721135648.9603d924377825a7e6c0023b@linux-foundation.org>
 <14063C7AD467DE4B82DEDB5C278E866301245E046C@FMSMSX108.amr.corp.intel.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Jul 2020 21:02:44 +0000 "Ruhl, Michael J" <michael.j.ruhl@intel.com> wrote:

> >--- a/include/linux/io-mapping.h~io-mapping-indicate-mapping-failure-fix
> >+++ a/include/linux/io-mapping.h
> >@@ -107,9 +107,12 @@ io_mapping_init_wc(struct io_mapping *io
> > 		   resource_size_t base,
> > 		   unsigned long size)
> > {
> >+	iomap->iomem = ioremap_wc(base, size);
> >+	if (!iomap->iomem)
> >+		return NULL;
> >+
> 
> This does make more sense.
> 
> I am confused by the two follow up emails I just got.

One was your original patch, the other is my suggested alteration.

> Shall I resubmit, or is this path (if !iomap->iomem) return NULL)
> now in the tree.

All is OK.  If my alteration is acceptable (and, preferably, tested!)
then when the time comes, I'll fold it into the base patch, add a
note indicating this change and shall then send it to Linus.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
