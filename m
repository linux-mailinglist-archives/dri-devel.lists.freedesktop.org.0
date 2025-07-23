Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF9B0EB8C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D7610E761;
	Wed, 23 Jul 2025 07:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ryz3mPKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A360E10E75E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:15:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2D8C75C57E1;
 Wed, 23 Jul 2025 07:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEA7C4CEE7;
 Wed, 23 Jul 2025 07:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753254929;
 bh=aoQqriX7CooIPgMf9W7uo25rnfymCO1WAzndg4imAxs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ryz3mPKKqpMYfFdxtdLwsLUNADzvjjWOQj9xApvRL/oZjV4pGyNB2CcAVql1LM8gG
 1OF9dXIptw4qYkMUmgtx+r9Vp/wvKnGmqsj/PV77SOobPPfX7QQQ3jHGzTw3TdaEqp
 k9Z9zcaC1+9uZRm3Llky+X0MyyzfgEK2GILXMURVCyZV6vZAUrBZSrsyoTi2S0Supq
 1n0X1Y8POOkozkFMTU5KAB9sxAqzQQZRkqNSJpjrGJIA8ME/leaiOBYrfGni7yGH4K
 jcZ0K4UK0HtJs8RpnVR3qiQEqUeIoTK9cVtc9oXU7KT5bDUpV4tGlAvAI5jKFzuvm2
 crjsI7K7CdRXQ==
Date: Wed, 23 Jul 2025 12:45:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <aICMDROkyjzBZFHo@vaman>
References: <644oygj43z2um42tmmldp3feemgzrdoirzfw7pu27k4zi76bwg@wfxbtgqqgh4p>
 <dc7358a1-ddc5-402e-9024-283f8e46e3b6@quicinc.com>
 <CAO9ioeVuAO6mYpBSpiTW0jhFRPtkubZ5eEskd1yLBHVdR8_YMA@mail.gmail.com>
 <1b55d9d4-f3ff-4cd9-8906-5f370da55732@quicinc.com>
 <28d26c70-178f-413b-b7f8-410c508cfdd7@quicinc.com>
 <CAO9ioeXBwFYL8q7x7_fHvx5YO+qyAXk4wpnfPrku4iY9yBsk0Q@mail.gmail.com>
 <cac5e84b-fbdb-47a9-860d-16a7fa4dc773@quicinc.com>
 <4q3vlydi5xgltd3pcez54alxgrehhfn4pppg47ngwp6y5k7n33@d4d4htntj64k>
 <53dd18ec-9a65-4bf7-8490-ca3eb56ce2a5@quicinc.com>
 <iang2jpe4s6wmbypmtq5uswcm6n6xntqdulyhekcz5k6zxddu3@re3rrr4dso5p>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <iang2jpe4s6wmbypmtq5uswcm6n6xntqdulyhekcz5k6zxddu3@re3rrr4dso5p>
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

On 22-07-25, 15:46, Dmitry Baryshkov wrote:
> On Tue, Jul 22, 2025 at 05:50:08PM +0530, Jyothi Kumar Seerapu wrote:
> > On 7/19/2025 3:27 PM, Dmitry Baryshkov wrote:
> > > On Mon, Jul 07, 2025 at 09:58:30PM +0530, Jyothi Kumar Seerapu wrote:
> > > > On 7/4/2025 1:11 AM, Dmitry Baryshkov wrote:
> > > > > On Thu, 3 Jul 2025 at 15:51, Jyothi Kumar Seerapu

[Folks, would be nice to trim replies]

> > > > Could you please confirm if can go with the similar approach of unmap the
> > > > processed TREs based on a fixed threshold or constant value, instead of
> > > > unmapping them all at once?
> > > 
> > > I'd still say, that's a bad idea. Please stay within the boundaries of
> > > the DMA API.
> > >
> > I agree with the approach you suggested—it's the GPI's responsibility to
> > manage the available TREs.
> > 
> > However, I'm curious whether can we set a dynamic watermark value perhaps
> > half the available TREs) to trigger unmapping of processed TREs ? This would
> > allow the software to prepare the next set of TREs while the hardware
> > continues processing the remaining ones, enabling better parallelism and
> > throughput.
> 
> Let's land the simple implementation first, which can then be improved.
> However I don't see any way to return 'above the watermark' from the DMA
> controller. You might need to enhance the API.

Traditionally, we set the dma transfers for watermark level and we get a
interrupt. So you might want to set the callback for watermark level
and then do mapping/unmapping etc in the callback. This is typical model
for dmaengines, we should follow that well

BR
-- 
~Vinod
