Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F05BA69D3B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 01:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC05310E27D;
	Thu, 20 Mar 2025 00:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BqqwMNDO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C648310E27D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 00:27:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E19EB68178;
 Thu, 20 Mar 2025 00:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756E0C4CEE4;
 Thu, 20 Mar 2025 00:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742430420;
 bh=IzJC/y24HF2nc/AgwvbD+AJQstykALpjbfnse7+w71M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BqqwMNDOmTR/QbEME0HxaXTn4E2RWoLaUNqJ0W+IjXF1YNNBV1+eHKbROgOH9Emew
 pIEwi2ZKKUad8pDyBYIp0/KWrLK9Wc8GwxAU3BI4SF6BdvkfbxUU9EDVuHxAl1jEAR
 bcRgDbXQo2kS3Vr0YdybuovvHeKZqo320MjI2fAuXl1TmlLj2QZwKVSir+2J2btmEb
 j4ZgaETZILgdPowAIWff/KhFJ3fImx7sRFnECxFvu4hmpobVhSwLTubUz7GC0upOUx
 0eT2TP1ieLlk1kx6k2sKWubH/yJRXB84tlyEAoy/TBdSEcTLH++yF4aL+/X0mBs36Q
 WnCLNqrr9Oe/g==
Date: Thu, 20 Mar 2025 01:26:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v5 RESEND 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <sni4bawucwkeyy7lh45p364ngv6bjomv7wxq3qjek2mjd7ucal@tfoeom2qohj2>
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

Hi,

On Wed, Feb 12, 2025 at 05:35:35PM +0530, Jyothi Kumar Seerapu wrote:
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
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Vinod any chance you can check this patch, please?

Andi
