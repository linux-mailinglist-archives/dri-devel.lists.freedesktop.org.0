Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E429BE34DC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 14:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A867210E30F;
	Thu, 16 Oct 2025 12:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PeDtq8Av";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E695610E30F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 12:17:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D09A763EF7;
 Thu, 16 Oct 2025 12:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EAADC4CEF1;
 Thu, 16 Oct 2025 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760617056;
 bh=eQNULmO/I7j0ha8Tji2AaF8Xy3xc/zj3lBAQqeAkCIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PeDtq8AvGvCVglA9M2ikmOI8PO7aHO6yBJh163Uchzxz4Uq+PU36AxAthB06gDWp4
 ogSnU2uEB59c8utILPaiIRLM2mi9zkrdMW0cKNcNTGF/FnT9TKTuuMyHT8mDvqIQF0
 JOQNlk8Mesh7Y35c3Y0EHKMZGPThyZ4IBxMmbuUnSRi4d72eIZ5pDpLancV3u9aGqa
 vn5Fz2r8VwlMQIfntJTLz+OB0a5atD+6wqYnv36UurfHnBOV2WmAyfcm2qyaJiJv23
 yutrDRgmvgav2ASShM6A84/0M+coXLU4nVOwEMuU2JIy5tCkWWEfOED5+XR0BcxE4B
 EnydCU7HpxiLQ==
Date: Thu, 16 Oct 2025 17:47:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v8 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <aPDiXIMcdM-Gm_J3@vaman>
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
 <3lgris6k6ewqjdcfmmovygstqrqjx2jidtr3hb3v47gpgadkka@wlua7qpd7ahf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3lgris6k6ewqjdcfmmovygstqrqjx2jidtr3hb3v47gpgadkka@wlua7qpd7ahf>
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

On 03-10-25, 20:50, Andi Shyti wrote:
> On Thu, Sep 25, 2025 at 05:30:35PM +0530, Jyothi Kumar Seerapu wrote:
> > From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> > 
> > The I2C driver gets an interrupt upon transfer completion.
> > When handling multiple messages in a single transfer, this
> > results in N interrupts for N messages, leading to significant
> > software interrupt latency.
> > 
> > To mitigate this latency, utilize Block Event Interrupt (BEI)
> > mechanism. Enabling BEI instructs the hardware to prevent interrupt
> > generation and BEI is disabled when an interrupt is necessary.
> > 
> > Large I2C transfer can be divided into chunks of messages internally.
> > Interrupts are not expected for the messages for which BEI bit set,
> > only the last message triggers an interrupt, indicating the completion of
> > N messages. This BEI mechanism enhances overall transfer efficiency.
> > 
> > BEI optimizations are currently implemented for I2C write transfers only,
> > as there is no use case for multiple I2C read messages in a single transfer
> > at this time.
> > 
> > Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> Because this series is touching multiple subsystems, I'm going to
> ack it:
> 
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> 
> We are waiting for someone from DMA to ack it (Vinod or Sinan).

Thanks, I will pick it with your ack

-- 
~Vinod
