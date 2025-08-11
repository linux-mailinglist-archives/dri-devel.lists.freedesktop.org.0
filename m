Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D2B2137B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 19:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D18610E1B5;
	Mon, 11 Aug 2025 17:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UstHmftV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC46010E196
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 17:40:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D43A95C5D0A;
 Mon, 11 Aug 2025 17:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853A5C4CEED;
 Mon, 11 Aug 2025 17:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754934040;
 bh=vNeEGZtQOxuFBJ03hCHxJ0zqee0UqgJZnTvwQUQSHrQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UstHmftVxCQTMDVIZqfzPXOXwi8NsvUVZuh7gnMbMAJO75iNtUapyN9pt3lojXddG
 2JFtVrEKDxONVM+YH8C2IvIIA7hW9k5x3y+nGBYfkkHsZivSgcckFrYyrVvKG794QY
 d0LyZfmVRfv+7aJfjat6kooL3o32XbPKKfYad6koOc1zZFJ2NmE/n9yhm6hJx68cX6
 svvQSl1PR4JA1TF76TO0BNZLm7vS2M/gL0QirKfeX5ZQ5DFqSd15GwcwnI9ZX51jTQ
 +gGpSQCL4epXTgu32ZuurDjucscXI+fHhDm4gWOzEAkYGWOdBkaU6vkk42hgZU0bAO
 ome+ZBHH2RKAA==
Date: Mon, 11 Aug 2025 23:10:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Message-ID: <aJorE6bL2d8se6E4@vaman>
References: <CAO9ioeVuAO6mYpBSpiTW0jhFRPtkubZ5eEskd1yLBHVdR8_YMA@mail.gmail.com>
 <1b55d9d4-f3ff-4cd9-8906-5f370da55732@quicinc.com>
 <28d26c70-178f-413b-b7f8-410c508cfdd7@quicinc.com>
 <CAO9ioeXBwFYL8q7x7_fHvx5YO+qyAXk4wpnfPrku4iY9yBsk0Q@mail.gmail.com>
 <cac5e84b-fbdb-47a9-860d-16a7fa4dc773@quicinc.com>
 <4q3vlydi5xgltd3pcez54alxgrehhfn4pppg47ngwp6y5k7n33@d4d4htntj64k>
 <53dd18ec-9a65-4bf7-8490-ca3eb56ce2a5@quicinc.com>
 <iang2jpe4s6wmbypmtq5uswcm6n6xntqdulyhekcz5k6zxddu3@re3rrr4dso5p>
 <aICMDROkyjzBZFHo@vaman>
 <8a149580-5044-4744-b432-9f0eef0a0d31@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a149580-5044-4744-b432-9f0eef0a0d31@quicinc.com>
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

On 25-07-25, 16:20, Jyothi Kumar Seerapu wrote:
> 
> 
> On 7/23/2025 12:45 PM, Vinod Koul wrote:
> > On 22-07-25, 15:46, Dmitry Baryshkov wrote:
> > > On Tue, Jul 22, 2025 at 05:50:08PM +0530, Jyothi Kumar Seerapu wrote:
> > > > On 7/19/2025 3:27 PM, Dmitry Baryshkov wrote:
> > > > > On Mon, Jul 07, 2025 at 09:58:30PM +0530, Jyothi Kumar Seerapu wrote:
> > > > > > On 7/4/2025 1:11 AM, Dmitry Baryshkov wrote:
> > > > > > > On Thu, 3 Jul 2025 at 15:51, Jyothi Kumar Seerapu
> > 
> > [Folks, would be nice to trim replies]
> > 
> > > > > > Could you please confirm if can go with the similar approach of unmap the
> > > > > > processed TREs based on a fixed threshold or constant value, instead of
> > > > > > unmapping them all at once?
> > > > > 
> > > > > I'd still say, that's a bad idea. Please stay within the boundaries of
> > > > > the DMA API.
> > > > > 
> > > > I agree with the approach you suggested—it's the GPI's responsibility to
> > > > manage the available TREs.
> > > > 
> > > > However, I'm curious whether can we set a dynamic watermark value perhaps
> > > > half the available TREs) to trigger unmapping of processed TREs ? This would
> > > > allow the software to prepare the next set of TREs while the hardware
> > > > continues processing the remaining ones, enabling better parallelism and
> > > > throughput.
> > > 
> > > Let's land the simple implementation first, which can then be improved.
> > > However I don't see any way to return 'above the watermark' from the DMA
> > > controller. You might need to enhance the API.
> > 
> > Traditionally, we set the dma transfers for watermark level and we get a
> > interrupt. So you might want to set the callback for watermark level
> > and then do mapping/unmapping etc in the callback. This is typical model
> > for dmaengines, we should follow that well
> > 
> > BR
> 
> Thanks Dmitry and Vinod, I will work on V7 patch for submitting the I2C
> messages until they fit and and unmap all processed messages together for
> now.
> 
> Regarding the watermark mechanism, looks GENI SE DMA supports watermark
> interrupts but it appears that GPI DMA doesn't have such provision of
> watermark.

What is the mechanism to get interrupts from the GPI? If you submit 10
txn, can you ask it to interrupt when half of them are done?

-- 
~Vinod
