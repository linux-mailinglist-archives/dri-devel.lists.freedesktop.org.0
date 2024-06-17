Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0552790AD46
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 13:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1271510E029;
	Mon, 17 Jun 2024 11:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UoW/inhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0BD10E029
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 11:48:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3B912CE112C;
 Mon, 17 Jun 2024 11:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE404C2BD10;
 Mon, 17 Jun 2024 11:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718624903;
 bh=8mrUC6mVjItynfICh+9jvCqG2bG3xJrYYmUAT7/n2IY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UoW/inhH3vClfVH+2Jv1vfwiBJ+oOejjBQaGAKozdbZyzVsQfT41G4jOgBGWGUmsE
 I2TkMLU1k5TV2j5tsigmEtLKVypaS+VxXB16NtGzAMTHpqYXPe/qt2+AwSPBtcn8VP
 ZTlDYratz4D87W7TTh3X5vk+mfQOhrXKFH/mIl0ngcJ5sOYMxUMMyas7hfcl0syk2u
 FwQY1hlG6rcehnkHnslreqdRxOlnW198B37fcEmgNc6SB3VzA9Vb70dUnUEBpOjoX8
 igGRNvt7TJUp3wOFU/ZTtWU7/fn17gsri4/VA00Vbqjyx2ueheGeLqfOeFno8YFV2P
 3dWgY5OVm9vZA==
Date: Mon, 17 Jun 2024 14:48:18 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 01/15] net: hbl_cn: add habanalabs Core Network driver
Message-ID: <20240617114818.GB6805@unreal>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-2-oshpigelman@habana.ai>
 <a0e8f31e-fa12-4f48-853d-16c78bce1d76@intel.com>
 <83a6029e-1e45-4ce7-99bb-a3643ddbf8ab@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83a6029e-1e45-4ce7-99bb-a3643ddbf8ab@habana.ai>
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

On Mon, Jun 17, 2024 at 08:08:26AM +0000, Omer Shpigelman wrote:
> On 6/13/24 16:01, Przemek Kitszel wrote:
> > [Some people who received this message don't often get email from przemyslaw.kitszel@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > On 6/13/24 10:21, Omer Shpigelman wrote:
> >> Add the hbl_cn driver which will serve both Ethernet and InfiniBand
> >> drivers.
> >> hbl_cn is the layer which is used by the satellite drivers for many shared
> >> operations that are needed by both EN and IB subsystems like QPs, CQs etc.
> >> The CN driver is initialized via auxiliary bus by the habanalabs driver.
> >>
> >> Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
> >> Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
> >> Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
> >> Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
> >> Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
> >> Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
> >> Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
> >> Co-developed-by: David Meriin <dmeriin@habana.ai>
> >> Signed-off-by: David Meriin <dmeriin@habana.ai>
> >> Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
> >> Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
> >> Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
> >> Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>
> >> ---
> >>   .../device_drivers/ethernet/index.rst         |    1 +
> >>   .../device_drivers/ethernet/intel/hbl.rst     |   82 +
> >>   MAINTAINERS                                   |   11 +
> >>   drivers/net/ethernet/intel/Kconfig            |   20 +
> >>   drivers/net/ethernet/intel/Makefile           |    1 +
> >>   drivers/net/ethernet/intel/hbl_cn/Makefile    |    9 +
> >>   .../net/ethernet/intel/hbl_cn/common/Makefile |    3 +
> >>   .../net/ethernet/intel/hbl_cn/common/hbl_cn.c | 5954 +++++++++++++++++
> >>   .../net/ethernet/intel/hbl_cn/common/hbl_cn.h | 1627 +++++
> >>   .../ethernet/intel/hbl_cn/common/hbl_cn_drv.c |  220 +
> >>   .../intel/hbl_cn/common/hbl_cn_memory.c       |   40 +
> >>   .../ethernet/intel/hbl_cn/common/hbl_cn_phy.c |   33 +
> >>   .../ethernet/intel/hbl_cn/common/hbl_cn_qp.c  |   13 +
> >>   include/linux/habanalabs/cpucp_if.h           |  125 +-
> >>   include/linux/habanalabs/hl_boot_if.h         |    9 +-
> >>   include/linux/net/intel/cn.h                  |  474 ++
> >>   include/linux/net/intel/cn_aux.h              |  298 +
> >>   include/linux/net/intel/cni.h                 |  636 ++
> >>   18 files changed, 9545 insertions(+), 11 deletions(-)
> >
> > this is a very big patch, it asks for a split; what's worse, it's
> > proportional to the size of this series:
> >  146 files changed, 148514 insertions(+), 70 deletions(-)
> > which is just too big
> >
> > [...]
> >
> 
> Yeah, well I'm limited to 15 patches per patch set according to the kernel
> doc so I had to have this big patch.
> Our changes are contained in 4 different drivers and all of the changes
> should be merged together so the HW will be operational.
> Hence I had to squeeze some code to a big patch.

Submit your code in multiple steps. One driver at a time.

Thanks
