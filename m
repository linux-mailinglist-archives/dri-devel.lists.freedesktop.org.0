Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE322A5A568
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 22:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B056810E4E2;
	Mon, 10 Mar 2025 21:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XELG8I6W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA8A10E4E2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 21:01:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B8CE95C5D11;
 Mon, 10 Mar 2025 20:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE6AC4CEE5;
 Mon, 10 Mar 2025 21:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741640463;
 bh=aYyGi+0GlhtZZOl3eElkEgro/Og6UgEBW7ME0Eh2cEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XELG8I6WYICbM6YDswWTIzR5vBY0ZCdCcGJ/XwRd+rPF8jWKv8h3HR7gxrqFV55Yk
 YC03rspukIbY7kdASAul32qn3tTTF0Mjsk4YyEhIb3u5/Qj1XV8c+Zcm0FFT2h6v/m
 F+zkgxIJhbNnd1atUL3+ZMTBsK1wGd1gj7eVnMIfItWqcZQxPHdLUiPB76A4Z3cCow
 IF6tot8i/DiR7HlFaN9aZMA18vcatU2dTOp5YxckUak3MYgFIzXJtGfVYF6T2k2P02
 /qA3Twqr+moDiV/Zm01s5J3HOrF4lAXYPAyy3NYPcJQWX3oaLIFX74c7Yw+/KrdG1v
 Dwfdi1Ujv4h8A==
Date: Tue, 11 Mar 2025 02:30:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com
Subject: Re: [PATCH v5 RESEND 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <Z89TC7fKzmmeu6tW@vaman>
References: <20250212120536.28879-1-quic_jseerapu@quicinc.com>
 <20250212120536.28879-2-quic_jseerapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212120536.28879-2-quic_jseerapu@quicinc.com>
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

On 12-02-25, 17:35, Jyothi Kumar Seerapu wrote:
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results in
> N interrupts for N messages, leading to significant software
> interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
> Enabling BEI instructs the GSI hardware to prevent interrupt generation
> and BEI is disabled when an interrupt is necessary.
> 
> When using BEI, consider splitting a single multi-message transfer into
> chunks of 8 messages internally and so interrupts are not expected for
> the first 7 message completions, only the last message triggers
> an interrupt, indicating the completion of 8 messages.
> 
> This BEI mechanism enhances overall transfer efficiency.

That sounds good but I dont like the idea that we add a custom interface
for this. Please use DMA_PREP_INTERRUPT instead. Adding this flag should
trigger N interrupts, absence of this should lead to Block events only

-- 
~Vinod
