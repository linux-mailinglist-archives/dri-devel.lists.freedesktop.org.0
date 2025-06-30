Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B4EAEDEC3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 15:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AE110E451;
	Mon, 30 Jun 2025 13:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="pBg5XVT8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 662 seconds by postgrey-1.36 at gabe;
 Mon, 30 Jun 2025 13:19:39 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B70110E451
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 13:19:39 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UBlus3021366;
 Mon, 30 Jun 2025 15:09:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 s6SnTj7TQmM6IV7OH8vHiU8wCQ741Ir076aqyio17M0=; b=pBg5XVT8Yg+YHR19
 hSMKT4IhjJyppJ/mHjK699QA1oMWSFbCESVoG39WjiLB4ou3GCGBkQ0ICIUT33BH
 BDDNh622ioVsXNwqrH+no+HJDTdyoHoMxVDSQ+PUcyYg66tIkzTLpP4yjoB8kcwX
 MWjj+SATjcY0SCtMAqZAsMHRJG5mSlW5G302JRVljZ5EkPfyEWcSJXlk9XeYYni2
 9U62A0DtoY9YYSKILLetlmYf7g4uD2d2Rad9VzI1FsxmwVb6LTW/dS+eCESicZ+d
 F0xix/SV8A5wQ5+Uu5WHBYhLYRNVJFZW1KljFhcCxVJZXaPUZ/QJcr0kvzqUAx+B
 dYiAhA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j7r5yt8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 15:09:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DBE5A4004B;
 Mon, 30 Jun 2025 15:08:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48160B4CBCE;
 Mon, 30 Jun 2025 15:07:22 +0200 (CEST)
Received: from [10.252.14.13] (10.252.14.13) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 15:07:21 +0200
Message-ID: <74981e35-1d0f-4649-bb10-2b54e4db5e47@foss.st.com>
Date: Mon, 30 Jun 2025 15:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs
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
 <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
Content-Language: en-US
From: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
In-Reply-To: <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
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
> Use the i2c-core-base APIs to allocate a DMA safe buffer when needed.
> 
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 36 +++++++++++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 042386b4cabe..d06f0efdece3 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -742,9 +742,12 @@ static void stm32f7_i2c_dma_callback(void *arg)
>  	struct stm32f7_i2c_dev *i2c_dev = (struct stm32f7_i2c_dev *)arg;
>  	struct stm32_i2c_dma *dma = i2c_dev->dma;
>  	struct device *dev = dma->chan_using->device->dev;
> +	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
>  
>  	stm32f7_i2c_disable_dma_req(i2c_dev);
>  	dma_unmap_single(dev, dma->dma_buf, dma->dma_len, dma->dma_data_dir);
> +	if (!f7_msg->smbus)
> +		i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, true);
>  	complete(&dma->dma_complete);
>  }
>  
> @@ -880,6 +883,7 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
>  {
>  	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
>  	void __iomem *base = i2c_dev->base;
> +	u8 *dma_buf;
>  	u32 cr1, cr2;
>  	int ret;
>  
> @@ -929,17 +933,23 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
>  
>  	/* Configure DMA or enable RX/TX interrupt */
>  	i2c_dev->use_dma = false;
> -	if (i2c_dev->dma && f7_msg->count >= STM32F7_I2C_DMA_LEN_MIN
> -	    && !i2c_dev->atomic) {
> -		ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
> -					      msg->flags & I2C_M_RD,
> -					      f7_msg->count, f7_msg->buf,
> -					      stm32f7_i2c_dma_callback,
> -					      i2c_dev);
> -		if (!ret)
> -			i2c_dev->use_dma = true;
> -		else
> -			dev_warn(i2c_dev->dev, "can't use DMA\n");
> +	if (i2c_dev->dma && !i2c_dev->atomic) {
> +		dma_buf = i2c_get_dma_safe_msg_buf(msg, STM32F7_I2C_DMA_LEN_MIN);
> +		if (dma_buf) {
> +			f7_msg->buf = dma_buf;
> +			ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
> +						      msg->flags & I2C_M_RD,
> +						      f7_msg->count, f7_msg->buf,
> +						      stm32f7_i2c_dma_callback,
> +						      i2c_dev);
> +			if (ret) {
> +				dev_warn(i2c_dev->dev, "can't use DMA\n");
> +				i2c_put_dma_safe_msg_buf(f7_msg->buf, msg, false);
> +				f7_msg->buf = msg->buf;
> +			} else {
> +				i2c_dev->use_dma = true;
> +			}
> +		}
>  	}
>  
>  	if (!i2c_dev->use_dma) {
> @@ -1626,6 +1636,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  			dmaengine_terminate_async(dma->chan_using);
>  			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
>  					 dma->dma_data_dir);
> +			if (!f7_msg->smbus)
> +				i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, false);
>  		}
>  		f7_msg->result = -ENXIO;
>  	}
> @@ -1648,6 +1660,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  				dmaengine_terminate_async(dma->chan_using);
>  				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
>  						 dma->dma_data_dir);
> +				if (!f7_msg->smbus)
> +					i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, false);
>  				f7_msg->result = -ETIMEDOUT;
>  			}
>  		}
> 

Thx for this V3 submission

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

-- 
--
~ Py MORDRET
--
