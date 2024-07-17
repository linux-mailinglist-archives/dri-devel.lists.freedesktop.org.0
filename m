Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCCA933D06
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 14:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E6010EAD1;
	Wed, 17 Jul 2024 12:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L8xRCewe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE73410EACD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 12:33:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 17039CE12E9;
 Wed, 17 Jul 2024 12:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEBCC32782;
 Wed, 17 Jul 2024 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721219623;
 bh=XPoHNvBvk5aWq4Z1/WJjxhDz8NnrxpWn5NC51h1FfQc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L8xRCeweLHGmv6CKbjkpl4zryLkOT68tBbaInoO2BoWnkD6sbKpEuyoAyc8KHw70t
 9khT7f05JdWaMoAuepBKqZ92egYEyal1O0M8jku1NCBVL+qbdyyAyt7fDXGts/ZYsN
 I55CCz8UC2zaZzyEHwxzjSaKTqopdAh3EDN1rw/jqsvQ5eIcKbbiH5LV5RFool9D1Z
 Dyh4p78JjS5Yzf7Q7lNO71AHUu0+PPCZyf+3gQ0DxL4r+RUznjEHLE3lSJoPGvQJRt
 hClqYrMiaoA+e6xVvBEQqLNdVg3JwlL3w9pqz9V0x8pmE86WyQzF1u97/u499idoJ9
 bRB5hNIoMLsow==
Date: Wed, 17 Jul 2024 15:33:37 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Message-ID: <20240717123337.GI5630@unreal>
References: <20240618125842.GG4025@unreal>
 <b4bda963-7026-4037-83e6-de74728569bd@habana.ai>
 <20240619105219.GO4025@unreal>
 <a5554266-55b7-4e96-b226-b686b8a6af89@habana.ai>
 <20240712130856.GB14050@ziepe.ca>
 <2c767517-e24c-416b-9083-d3a220ffc14c@habana.ai>
 <20240716134013.GF14050@ziepe.ca>
 <ca6c3901-c0c5-4f35-934b-2b4c9f1a61dc@habana.ai>
 <20240717073607.GF5630@unreal>
 <2050e95c-4998-4b2e-88e7-5964429818b5@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2050e95c-4998-4b2e-88e7-5964429818b5@habana.ai>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 17, 2024 at 10:51:03AM +0000, Omer Shpigelman wrote:
> On 7/17/24 10:36, Leon Romanovsky wrote:
> > On Wed, Jul 17, 2024 at 07:08:59AM +0000, Omer Shpigelman wrote:
> >> On 7/16/24 16:40, Jason Gunthorpe wrote:
> >>> On Sun, Jul 14, 2024 at 10:18:12AM +0000, Omer Shpigelman wrote:
> >>>> On 7/12/24 16:08, Jason Gunthorpe wrote:
> >>>>> [You don't often get email from jgg@ziepe.ca. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >>>>>
> >>>>> On Fri, Jun 28, 2024 at 10:24:32AM +0000, Omer Shpigelman wrote:
> >>>>>
> >>>>>> We need the core driver to access the IB driver (and to the ETH driver as
> >>>>>> well). As you wrote, we can't use exported symbols from our IB driver nor
> >>>>>> rely on function pointers, but what about providing the core driver an ops
> >>>>>> structure? meaning exporting a register function from the core driver that
> >>>>>> should be called by the IB driver during auxiliary device probe.
> >>>>>> Something like:
> >>>>>>
> >>>>>> int hbl_cn_register_ib_aux_dev(struct auxiliary_device *adev,
> >>>>>>                              struct hbl_ib_ops *ops)
> >>>>>> {
> >>>>>> ...
> >>>>>> }
> >>>>>> EXPORT_SYMBOL(hbl_cn_register_ib_aux_dev);
> >>>>>
> >>>>> Definately do not do some kind of double-register like this.
> >>>>>
> >>>>> The auxiliary_device scheme can already be extended to provide ops for
> >>>>> each sub device.
> >>>>>
> >>>>> Like
> >>>>>
> >>>>> struct habana_driver {
> >>>>>    struct auxiliary_driver base;
> >>>>>    const struct habana_ops *ops;
> >>>>> };
> >>>>>
> >>>>> If the ops are justified or not is a different question.
> >>>>>
> >>>>
> >>>> Well, I suggested this double-register option because I got a comment that
> >>>> the design pattern of embedded ops structure shouldn't be used.
> >>>> So I'm confused now...
> >>>
> >>> Yeah, don't stick ops in random places, but the device_driver is the
> >>> right place.
> >>>
> >>
> >> Sorry, let me explain again. My original code has an ops structure
> >> exactly like you are suggesting now (see struct hbl_aux_dev in the first
> >> patch of the series). But I was instructed not to use this ops structure
> >> and to rely on exported symbols for inter-driver communication.
> >> I'll be happy to use this ops structure like in your example rather than
> >> converting my code to use exported symbols.
> >> Leon - am I missing anything? what's the verdict here?
> > 
> > You are missing the main sentence from Jason's response:  "don't stick ops in random places".
> > 
> > It is fine to have ops in device driver, so the core driver can call them. However, in your
> > original code, you added ops everywhere. It caused to the need to implement module reference
> > counting and crazy stuff like calls to lock and unlock functions from the aux driver to the core.
> > 
> > Verdict is still the same. Core driver should provide EXPORT_SYMBOLs, so the aux driver can call
> > them directly and enjoy from proper module loading and unloading.
> > 
> > The aux driver can have ops in the device driver, so the core driver can call them to perform something
> > specific for that aux driver.
> > 
> > Calls between aux drivers should be done via the core driver.
> > 
> > Thanks
> 
> The only place we have an ops structure is in the device driver,
> similarly to Jason's example. In our code it is struct hbl_aux_dev. What
> other random places did you see?

This is exactly random place.

I suggest you to take time, learn how existing drivers in netdev and
RDMA uses auxbus infrastructure and follow the same pattern. There are
many examples already in the kernel.

And no, if you do everything right, you won't need custom module
reference counting and other hacks. There is nothing special in your
device/driver which requires special treatment.

Thanks
