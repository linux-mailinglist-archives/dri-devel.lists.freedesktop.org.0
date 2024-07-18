Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCD49349E9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 10:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9C010E5EB;
	Thu, 18 Jul 2024 08:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bJ2Hitwb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF37E10E5E8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 08:31:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D93A8619FF;
 Thu, 18 Jul 2024 08:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C396CC116B1;
 Thu, 18 Jul 2024 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721291474;
 bh=H1YZoQDnsvam5dfTdpbjbzx7HojhDFEDH9pV9wUJvkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bJ2HitwbYZhpOs4V0RX5Yj9s3EoMqzr5hsoJqQhHHKRFQoKNzKqiXr2opz0qLHTXN
 sWJ5dpWw+J91epGZMsfm5KmkuIzEeLnwfh7NrtWkt61KbjZnu+rYltXA8rtYTAl6Ie
 WZHoXAKyQwM7+dgRY2+TK1wgo51EH+VwUnHbHKdIJy/ICrHxWSA92DN4ZDDlwNQm1A
 UrnfxxddmFZj9EKFJh9drErCM/QeLeOT4wjOp74xsdxSFkpE7Amfwi1hWifrlKIZ8d
 qk5GzYqnUeTY7BDfegZ1lwPGYh7zW/ov5wT2R8NTNWK1j2BeACyoBtlSF7RYAhrhTx
 RYZpmOGzymDDg==
Date: Thu, 18 Jul 2024 11:31:09 +0300
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
Message-ID: <20240718083109.GN5630@unreal>
References: <20240619105219.GO4025@unreal>
 <a5554266-55b7-4e96-b226-b686b8a6af89@habana.ai>
 <20240712130856.GB14050@ziepe.ca>
 <2c767517-e24c-416b-9083-d3a220ffc14c@habana.ai>
 <20240716134013.GF14050@ziepe.ca>
 <ca6c3901-c0c5-4f35-934b-2b4c9f1a61dc@habana.ai>
 <20240717073607.GF5630@unreal>
 <2050e95c-4998-4b2e-88e7-5964429818b5@habana.ai>
 <20240717123337.GI5630@unreal>
 <19c5be58-f87f-4440-a50e-b55b927dce62@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19c5be58-f87f-4440-a50e-b55b927dce62@habana.ai>
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

On Thu, Jul 18, 2024 at 06:54:17AM +0000, Omer Shpigelman wrote:
> On 7/17/24 15:33, Leon Romanovsky wrote:
> > On Wed, Jul 17, 2024 at 10:51:03AM +0000, Omer Shpigelman wrote:
> >> On 7/17/24 10:36, Leon Romanovsky wrote:
> >>> On Wed, Jul 17, 2024 at 07:08:59AM +0000, Omer Shpigelman wrote:
> >>>> On 7/16/24 16:40, Jason Gunthorpe wrote:
> >>>>> On Sun, Jul 14, 2024 at 10:18:12AM +0000, Omer Shpigelman wrote:
> >>>>>> On 7/12/24 16:08, Jason Gunthorpe wrote:

<...>

> So what is the problem with how we implemented it?

Please do you homework and send new version of the patch series.

Thanks
