Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771BFAEDF5F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 15:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C6510E123;
	Mon, 30 Jun 2025 13:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="1vzjvOCI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FD310E123
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 13:41:23 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAxWXM001329;
 Mon, 30 Jun 2025 15:08:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 nzcuf3ALxiZnugdRzIcsnWWDfy0C8Ttz0HVMvwBD/F8=; b=1vzjvOCIUogiQ6hQ
 NLYkokAyh7ZxRBSd0VrOeQTfxEuzxqoDgDzsOLksLlBcXxP0eHr2P5GML6mho29s
 p2ACWhsSgT7UDQKE3nnPv8jh1wlmyJWtMhl9HWRqSkjUZ+UaptO0RSFyurI4eZCa
 l1OEHVBpy6Xsfcsyz8O8S07M+2sDlAW8iwJmnLdH8m9a1kOo8zTsIfqP5JkILBt/
 q3HrQDvamN86Iyj8wnep7MpDtOyLDjTjqU00CetPKKGS07feG7y9tatFBU0lPLAq
 ZulowVvlk0Vt+ucnYgPE7LXtsYaPfxAZpigJ/mTJJA0CG6cM7TaHP6blDSnCTMww
 paklIw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tm03v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 15:08:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CD1AE40044;
 Mon, 30 Jun 2025 15:07:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE232B4CA85;
 Mon, 30 Jun 2025 15:06:13 +0200 (CEST)
Received: from [10.252.14.13] (10.252.14.13) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 15:06:12 +0200
Message-ID: <b0ea55b6-32fe-43ca-b815-29888a3eba59@foss.st.com>
Date: Mon, 30 Jun 2025 15:05:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] i2c: stm32: fix the device used for the DMA map
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, "Alain
 Volmat" <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
 Wolfram Sang <wsa@kernel.org>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 <linux-i2c@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
Content-Language: en-US
From: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
In-Reply-To: <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.14.13]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
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

Hi Clement,

On 6/30/25 14:55, Clément Le Goffic wrote:
> If the DMA mapping failed, it produced an error log with the wrong
> device name:
> "stm32-dma3 40400000.dma-controller: rejecting DMA map of vmalloc memory"
> Fix this issue by replacing the dev with the I2C dev.
> 
> Fixes: bb8822cbbc53 ("i2c: i2c-stm32: Add generic DMA API")
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
> index 157c64e27d0b..272a5dffb08f 100644
> --- a/drivers/i2c/busses/i2c-stm32.c
> +++ b/drivers/i2c/busses/i2c-stm32.c
> @@ -118,7 +118,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
>  	dma->dma_len = len;
>  	chan_dev = dma->chan_using->device->dev;
>  
> -	dma->dma_buf = dma_map_single(chan_dev, buf, dma->dma_len,
> +	dma->dma_buf = dma_map_single(dev, buf, dma->dma_len,
>  				      dma->dma_data_dir);
>  	if (dma_mapping_error(chan_dev, dma->dma_buf)) {
>  		dev_err(dev, "DMA mapping failed\n");
> @@ -150,7 +150,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
>  	return 0;
>  
>  err:
> -	dma_unmap_single(chan_dev, dma->dma_buf, dma->dma_len,
> +	dma_unmap_single(dev, dma->dma_buf, dma->dma_len,
>  			 dma->dma_data_dir);
>  	return ret;
>  }
> 

Thx for this V3 submission

Reviewed-by : Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

-- 
--
~ Py MORDRET
--
