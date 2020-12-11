Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCCE2D93FF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EF66E0B8;
	Mon, 14 Dec 2020 08:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3616ECB9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 22:06:29 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-25-lRPy8p40M8CPiAlacIukIQ-1; Fri, 11 Dec 2020 22:06:25 +0000
X-MC-Unique: lRPy8p40M8CPiAlacIukIQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 11 Dec 2020 22:06:24 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Fri, 11 Dec 2020 22:06:24 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Thomas Gleixner' <tglx@linutronix.de>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>
Subject: RE: [patch 14/30] drm/i915/pmu: Replace open coded kstat_irqs() copy
Thread-Topic: [patch 14/30] drm/i915/pmu: Replace open coded kstat_irqs() copy
Thread-Index: AQHWz72qwjNpP0n0UkWT70W8RrLS8qnx7xrwgAB1jgCAAA6ksA==
Date: Fri, 11 Dec 2020 22:06:24 +0000
Message-ID: <6dd2eb7de7ad4a5893f057b90662718f@AcuMS.aculab.com>
References: <20201210192536.118432146@linutronix.de>
 <20201210194043.957046529@linutronix.de>
 <ad05af1a-5463-2a80-0887-7629721d6863@linux.intel.com>
 <87y2i4h54i.fsf@nanos.tec.linutronix.de>
 <d6cbfa118490459bb0671394f00323fc@AcuMS.aculab.com>
 <87eejwgib7.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87eejwgib7.fsf@nanos.tec.linutronix.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:40 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, "James
 E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Leon
 Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Juergen Gross <jgross@suse.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Airlie <airlied@linux.ie>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq
 Toukan <tariqt@nvidia.com>, Jon Mason <jdmason@kudzu.us>,
 "linux-ntb@googlegroups.com" <linux-ntb@googlegroups.com>,
 Saeed Mahameed <saeedm@nvidia.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Gleixner
> Sent: 11 December 2020 21:11
> 
> On Fri, Dec 11 2020 at 14:19, David Laight wrote:
> > From: Thomas Gleixner
> >> You can't catch that. If this really becomes an issue you need a
> >> sequence counter around it.
> >
> > Or just two copies of the high word.
> > Provided the accesses are sequenced:
> > writer:
> > 	load high:low
> > 	add small_value,high:low
> > 	store high
> > 	store low
> > 	store high_copy
> > reader:
> > 	load high_copy
> > 	load low
> > 	load high
> > 	if (high != high_copy)
> > 		low = 0;
> 
> And low = 0 is solving what? You need to loop back and retry until it's
> consistent and then it's nothing else than an open coded sequence count.

If it is a counter or timestamp then the high:0 value happened
some time between when you started trying to read the value and
when you finished trying to read it.

As such it is a perfectly reasonable return value.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
