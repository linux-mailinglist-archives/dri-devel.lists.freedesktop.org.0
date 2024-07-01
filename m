Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABDC91DFBE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 14:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8118B10E3F5;
	Mon,  1 Jul 2024 12:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ik5yZTtU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31B410E3F5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 12:46:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CACE9CE139F;
 Mon,  1 Jul 2024 12:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86763C116B1;
 Mon,  1 Jul 2024 12:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719837981;
 bh=5Go4iu06W4P/5NpWX8+tSflVUT2oZD0yzvVFwiclK2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ik5yZTtUFrKm7RPJ5OF5iiaFQA81/P+fEes2nK/0yeZS78oK8K3j0gALFCkSSVomt
 KFWCMwHf5PmnF0xbQIVIfvixR3vMj/vVIViybWILJ/+57onv9pRCTLc6ECO6eZdjod
 0SiuL+mJuJ3nXo8pgeCJdUexpPCH7fsQf9nKOvC/1yI/oRe3lgQoyk3CZXdWd0Kmzt
 Y9uKFGBajkZikDzrGVCOI/SjZWw0ooqx5ZQ3jHjNUBNYQJiBUUC4VNKx2y5OCrPhw5
 wlMVJa8faqIe5R8lh5e7FWetZg1U9rkZ+m+GZkEx59/rCMDCkIQbf06pKqz7n6neI3
 YesKoL0LRAdWg==
Date: Mon, 1 Jul 2024 15:46:17 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Message-ID: <20240701124617.GD13195@unreal>
References: <20240613191828.GJ4966@unreal>
 <fbb34afa-8a38-4124-9384-9b858ce2c4e5@habana.ai>
 <20240617190429.GB4025@unreal>
 <461bf44e-fd2f-4c8b-bc41-48d48e5a7fcb@habana.ai>
 <20240618125842.GG4025@unreal>
 <b4bda963-7026-4037-83e6-de74728569bd@habana.ai>
 <20240619105219.GO4025@unreal>
 <a5554266-55b7-4e96-b226-b686b8a6af89@habana.ai>
 <20240630132911.GB176465@unreal>
 <a19d80d4-e452-461c-a060-2c94030301a7@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a19d80d4-e452-461c-a060-2c94030301a7@habana.ai>
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

On Mon, Jul 01, 2024 at 10:46:48AM +0000, Omer Shpigelman wrote:
> On 6/30/24 16:29, Leon Romanovsky wrote:
> > On Fri, Jun 28, 2024 at 10:24:32AM +0000, Omer Shpigelman wrote:
> >> On 6/19/24 13:52, Leon Romanovsky wrote:
> >>> On Wed, Jun 19, 2024 at 09:27:54AM +0000, Omer Shpigelman wrote:
> >>>> On 6/18/24 15:58, Leon Romanovsky wrote:
> >>>>> On Tue, Jun 18, 2024 at 11:08:34AM +0000, Omer Shpigelman wrote:
> >>>>>> On 6/17/24 22:04, Leon Romanovsky wrote:
> >>>>>>> [Some people who received this message don't often get email from leon@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >>>>>>>
> >>>>>>> On Mon, Jun 17, 2024 at 05:43:49PM +0000, Omer Shpigelman wrote:
> >>>>>>>> On 6/13/24 22:18, Leon Romanovsky wrote:
> >>>>>>>>> [Some people who received this message don't often get email from leon@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >>>>>>>>>
> >>>>>>>>> On Thu, Jun 13, 2024 at 11:22:04AM +0300, Omer Shpigelman wrote:
> >>>>>>>>>> Add an RDMA driver of Gaudi ASICs family for AI scaling.
> >>>>>>>>>> The driver itself is agnostic to the ASIC in action, it operates according
> >>>>>>>>>> to the capabilities that were passed on device initialization.
> >>>>>>>>>> The device is initialized by the hbl_cn driver via auxiliary bus.
> >>>>>>>>>> The driver also supports QP resource tracking and port/device HW counters.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
> >>>>>>>>>> Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
> >>>>>>>>>> Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
> >>>>>>>>>> Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
> >>>>>>>>>> Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
> >>>>>>>>>> Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
> >>>>>>>>>> Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
> >>>>>>>>>> Co-developed-by: David Meriin <dmeriin@habana.ai>
> >>>>>>>>>> Signed-off-by: David Meriin <dmeriin@habana.ai>
> >>>>>>>>>> Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
> >>>>>>>>>> Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
> >>>>>>>>>> Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
> >>>>>>>>>> Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>
> >>>>>>>>>
> >>
> >> <...>
> >>
> >>>> mlx5 IB driver doesn't export any symbol that is used by the core driver,
> >>>> that's why the core driver can be loaded without the IB driver (althought
> >>>> you'll get circular dependency if you would export).
> >>>
> >>> Yes, IB and ETH drivers are "users" of core driver. As RDMA maintainer,
> >>> I'm reluctant to accept code that exports symbols from IB drivers to
> >>> other subsystems. We have drivers/infiniband/core/ for that.
> >>>
> >>
> >> We need the core driver to access the IB driver (and to the ETH driver as
> >> well). As you wrote, we can't use exported symbols from our IB driver nor
> >> rely on function pointers, but what about providing the core driver an ops
> >> structure? meaning exporting a register function from the core driver that
> >> should be called by the IB driver during auxiliary device probe.
> >> Something like:
> >>
> >> int hbl_cn_register_ib_aux_dev(struct auxiliary_device *adev,
> >> 			       struct hbl_ib_ops *ops)
> >> {
> >> ...
> >> }
> >> EXPORT_SYMBOL(hbl_cn_register_ib_aux_dev);
> >>
> >> That's how only the parent driver exports symbols to the son driver so the
> >> IB driver is a "user" of the core driver and so we count on the internal
> >> module reference counter. But we also get the ability to access the IB
> >> driver from the core driver (to report a HW error for example).
> > 
> > Before you are talking about solutions, please explain in technical
> > terms why you absolutely need to access IB from core driver and any
> > other possible way is not possible.
> > 
> > Thanks
> 
> First of all, as a general assumption, everything we do today can also be
> done with unidirectional drivers communication only. If the parent driver
> cannot access the son driver directly, then we can have a blocking command
> queue on the parent side that the parent driver will push to it and the
> son driver will fetch from it, execute the command and unblock the parent.
> That will work but it adds complexity which I'm not sure that is needed.
> The second point is not necessarily about the direction of the
> communication but more about generally using function pointers rather than
> exported symbols - we have 2 flavors of functions for inter driver
> communications: common functions and ASIC specific functions. The ASIC
> specific functions are exposed and initialized per ASIC. If we convert
> them to EXPORT_SYMBOLs then we expose ASIC specific functions regardless
> of the ASIC in action.
> Again, that will work but seems unnecessary. We can check the ASIC type
> that was passed in each exported function and fail if a wrong ASIC type
> was used, but it seems to me like an incorrect approach to use exported
> symbols for ASIC specific communication. EXPORT_SYMBOLs were meant to be
> used for driver level communication, not for utilizing device specific
> capabilities. For that, an ops struct seems more appropriate.
> That's why I'm suggesting to combine both exported symbols and function
> pointers.

Thanks for the explanation. I understand your concerns, but I don't see
any technical justification for the need to access IB driver from the
core.

Thanks
