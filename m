Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B8706699
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 13:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C835E10E3EE;
	Wed, 17 May 2023 11:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0D510E3EE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 11:27:54 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 6892E164C27;
 Wed, 17 May 2023 13:27:50 +0200 (CEST)
Authentication-Results: mail.tesarici.cz;
 dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
 t=1684322870; bh=iAhSxGfe0maADmCWvSD0fNulJwuFazSi9OhOrRyLC70=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=al7Qx7SKAg8fypBvu192OYqvg3980UMzo23P4WbZZN5EH2Yw4wRAap8mWWUALVxFp
 Ld9iruYxHjHhoyaIPKx2HUg0dydQbdVS12ZL0jyYUGr3tDFcv5/z65sQdd1U2JFjgI
 e7/qI6Ork7Npu45/P4aVMlRF9pptXCj3La2E3EyRurgA7axUGz5d9oXSshFFXkebKu
 Pj5grUALyE+UOygXAj/VRLvXCG/vWfmQHU8QKCjZKf6Uyl2/QAa838OQ2wjNr+YakU
 +DzAURBbFZBr3jMSoA8l8hBZ/QWhg1MEmBBiQcb38sRUvMVQb3y6cfnFw6MpWhSMvJ
 j3jzPImJmhVjA==
Date: Wed, 17 May 2023 13:27:48 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 RESEND 4/7] swiotlb: Dynamically allocated bounce
 buffers
Message-ID: <20230517132748.2e250f9c@meshulam.tesarici.cz>
In-Reply-To: <20230517083510.0cd7fa1a@meshulam.tesarici.cz>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
 <346abecdb13b565820c414ecf3267275577dbbf3.1683623618.git.petr.tesarik.ext@huawei.com>
 <BYAPR21MB168874BC467BFCEC133A9DCDD7789@BYAPR21MB1688.namprd21.prod.outlook.com>
 <20230516061309.GA7219@lst.de>
 <20230516083942.0303b5fb@meshulam.tesarici.cz>
 <ZGPEgsplBSsI9li3@arm.com>
 <20230517083510.0cd7fa1a@meshulam.tesarici.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Kim Phillips <kim.phillips@amd.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Petr Tesarik <petrtesarik@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Borislav Petkov <bp@suse.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Paul E.
 McKenney" <paulmck@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Roberto Sassu <roberto.sassu@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 May 2023 08:35:10 +0200
Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:

>[...]
> Anyway, my greatest objection to allocating additional swiotlb chunks is
> that _all_ of them must be searched to determine that the physical
> address does _not_ belong to a swiotlb, incurring performance penalty

I thought about this part again, and I overlooked one option. We can
track only the _active_ swiotlbs for each device. If a device never
needs a swiotlb, there is no active swiotlb, and is_swiotlb_buffer()
short-circuits to false. This should avoid all collateral damage to
innocent devices.

We would also maintain a (global) list of all allocated swiotlbs, used
by swiotlb_map() to find free slots and add the respective swiotlb to
the per-device active list.

One potential advantage is that we could use mapping size and alignment
to choose a swiotlb cleverly and minimize internal fragmentation...

OK, I'm dreaming. Let's agree on the general approach first.

Petr T
