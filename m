Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FEAA0113B
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2025 01:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6597C10E028;
	Sat,  4 Jan 2025 00:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sKarAGkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4262710E028
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2025 00:09:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DEE245C32AB;
 Sat,  4 Jan 2025 00:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B75C4CEDD;
 Sat,  4 Jan 2025 00:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735949370;
 bh=NL+6UMAqEckQgTyP9CfH1geXhZoa5MSlyXNrFreAQ64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sKarAGkp3shhVy//F9vhDi4mvw09GclBlXaRSATpbcyL8j552aZD9Y7cQ5DF9COtd
 JdtaeWyIjgtXy6u934m7tcw8FtUCT4nmEkv+DVNDNNXsqcN8YZaoUXiUmVxZAWVAj7
 qblQ1+7OKVcVpoMHDT//fgnivbb5LpPw9LZ1OHU7ZVBbTnoKKBSLBYzN9Bp4oiFUx0
 sGWNpJAKUUqNgO3FGHsp1lggl5I8tVADngudzQ99v2PAdol3TSmxGPoCt0jHtO26TH
 Wb/Sa8sJYqufUshEHl3GYTFUlwvVcbCaS1NnpaBnYYOQ/elsPbIf7QFakZUWorC7OW
 A91XqQ8ANJJNg==
Date: Sat, 4 Jan 2025 01:09:26 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v4 0/2] Add Block event interrupt support for I2C protocol
Message-ID: <pvcu35x7prqonlhptakepn5bdqm6skd4qmigvoavejyjj363ug@aemx3pd2po2v>
References: <20241217170424.14703-1-quic_jseerapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217170424.14703-1-quic_jseerapu@quicinc.com>
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

this patch has been hanging here for a while, can we please have
someone from DMA and Qualcomm look at it?

Thanks,
Andi

On Tue, Dec 17, 2024 at 10:34:22PM +0530, Jyothi Kumar Seerapu wrote:
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of 8 messages internally.
> Interrupts are not expected for the first 7 message completions, only
> the last message triggers an interrupt, indicating the completion of
> 8 messages. This BEI mechanism enhances overall transfer efficiency.
> 
> This optimization reduces transfer time from 168 ms to 48 ms for a
> series of 200 I2C write messages in a single transfer, with a
> clock frequency support of 100 kHz.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> v3 -> v4:
>   - API's added for Block event interrupt with multi descriptor support is 
>     moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
>   - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
>     I2C driver.
>   - geni_i2c_gpi_multi_desc_xfer structure is added as a member of
>     struct geni_i2c_dev.
>   - Removed the changes of making I2C driver is dependent on GPI driver.
> 
> v2 -> v3:
>   - Updated commit description
>   - In I2C GENI driver, for i2c_gpi_cb_result moved the logic of
>     "!is_tx_multi_xfer" to else part.
>   - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>   - Changes of I2C GENI driver to depend on the GPI driver moved
>     to patch3.
>   - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
>   - Added description for newly added changes in "qcom-gpi-dma.h" file.
> 
> v1 -> v2:
>   - DT changes are reverted for adding dma channel size as a new arg of
>     dma-cells property.
>   - DT binding change reveted for dma channel size as a new arg of
>     dma-cells property.
>   - In GPI driver, reverted the changes to parse the channel TRE size
>     from device tree.
>   - Made the changes in QCOM I2C geni driver to support the BEI
>     functionality with the existing TRE size of 64.
>   - Made changes in QCOM I2C geni driver as per the review comments.
>   - Fixed Kernel test robot reported compiltion issues.
> 
> 
> Jyothi Kumar Seerapu (2):
>   dmaengine: qcom: gpi: Add GPI Block event interrupt support
>   i2c: i2c-qcom-geni: Add Block event interrupt support
> 
>  drivers/dma/qcom/gpi.c             |   3 +
>  drivers/i2c/busses/i2c-qcom-geni.c | 275 ++++++++++++++++++++++++++---
>  include/linux/dma/qcom-gpi-dma.h   |   9 +
>  3 files changed, 262 insertions(+), 25 deletions(-)
> 
> -- 
> 2.17.1
> 
