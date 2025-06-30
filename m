Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DFCAED620
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 09:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5041A10E3A4;
	Mon, 30 Jun 2025 07:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="4Jj783QG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A4610E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 07:50:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U1IAM4012038;
 Mon, 30 Jun 2025 09:50:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 5wRs57iG0bPsaNqmyxgE2epLKZasf1o2RYklIaIkv90=; b=4Jj783QGFk2XcNZ3
 tFMN9h/cZOJUtNrBE9viejbylnaR5Naoz9CrGrSvddPpntJWX2qUe5oP8vPsKvIB
 u1hnSXQ9pCP3QaLa8qV7gWXQTfEIHjJWLTo68Zwj/zz354jgcB0qpZViltVqRJ0d
 HUFA6DeGsPeewv5Vp+XpANm+eBUZZqOOgIqT6p4uWfT9m1xVzRUGWstBZoIrBCBT
 eivfvo5VZ4VbkC4rlEcn6QyDL/Eyzi+oeKJEGrnfeTNSarbyNOuNGqBEnwtd69qr
 COD6aX4+jNPTH6eKyiUn2eSikw+ZdTyI+cHTfzY1u5ui5SCaPRg17QupeZPLOdfn
 FmL7ug==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j79h5whh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 09:50:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8E7C640051;
 Mon, 30 Jun 2025 09:49:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13F6451DCCC;
 Mon, 30 Jun 2025 09:48:09 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 09:48:08 +0200
Date: Mon, 30 Jun 2025 09:48:03 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Andi Shyti
 <andi.shyti@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, M'boumba Cedric Madianga
 <cedric.madianga@gmail.com>, Wolfram Sang <wsa@kernel.org>, "Pierre-Yves
 MORDRET" <pierre-yves.mordret@st.com>, <linux-i2c@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v2 1/3] i2c: stm32: fix the device used for the DMA map
Message-ID: <20250630074803.GA396213@gnbcxd0016.gnb.st.com>
References: <20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com>
 <20250627-i2c-upstream-v2-1-8c14523481dc@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627-i2c-upstream-v2-1-8c14523481dc@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
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

Hello Clément,

On Fri, Jun 27, 2025 at 12:12:56PM +0200, Clément Le Goffic wrote:
> If the DMA mapping failed, it produced an error log with the wrong
> device name:
> "stm32-dma3 40400000.dma-controller: rejecting DMA map of vmalloc memory"
> Fix this issue by replacing the dev with the I2C dev.
> 
> Fixes: bb8822cbbc53 ("i2c: i2c-stm32: Add generic DMA API")
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

Thanks for the v2.

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

> -- 
> 2.43.0
> 
