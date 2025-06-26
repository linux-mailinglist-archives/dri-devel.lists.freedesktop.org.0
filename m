Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B0FAE9997
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 11:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C065F10E8A0;
	Thu, 26 Jun 2025 09:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="Ua/0wZiz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF49B10E8A0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 09:06:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q8TXu5002736;
 Thu, 26 Jun 2025 11:06:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 yzHnsmLTewRsBfKjcqS7Ovd/FClDc2H6W6if0kL0/KE=; b=Ua/0wZizeUaayLiM
 sXZv4jngLUekGFY86nIQFCWLKslebcuvBKzdPrea+yMDtXzzxzxfyhX5LMbZRH+P
 oOGTBIo9bXUT/cp/J6+IO77mhvsWjHXC6ZKvqXwUB/ogCZj11EQ+kN2PE3dqc9gz
 RE0nKR6sNtNgyQf/PLFfA092pxu9hfeHkvHwIpWynI8puTlTi/K5dbd9CuVUo06m
 8TazMhhD/mLbcgaqPMYVdja6IEsIM4QVwslyBxSK1q000NUQgrfHLF260QvrwVeY
 yue7Q5r14Mqgvx90T+BPa5zALMXGv0HEjMXtSHHCx4om84GLlhcC7lYmoqdntUZK
 ZFoV2Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dhvbwk1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jun 2025 11:06:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B3AA14002D;
 Thu, 26 Jun 2025 11:03:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 241D0B2F98C;
 Thu, 26 Jun 2025 11:03:03 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 11:03:02 +0200
Date: Thu, 26 Jun 2025 11:03:01 +0200
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
Subject: Re: [PATCH 2/3] i2c: stm32f7: unmap DMA mapped buffer
Message-ID: <20250626090301.GC348766@gnbcxd0016.gnb.st.com>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
 <20250616-i2c-upstream-v1-2-42d3d5374e65@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616-i2c-upstream-v1-2-42d3d5374e65@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
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

Hi Clément,

thanks for the patch.

On Mon, Jun 16, 2025 at 10:53:55AM +0200, Clément Le Goffic wrote:
> Fix an issue where the mapped DMA buffer was not unmapped.
> 
> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 973a3a8c6d4a..a05cac5ee9db 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1622,6 +1622,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  		if (i2c_dev->use_dma) {
>  			stm32f7_i2c_disable_dma_req(i2c_dev);
>  			dmaengine_terminate_async(dma->chan_using);
> +			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +					 dma->dma_data_dir);
>  		}
>  		f7_msg->result = -ENXIO;
>  	}
> @@ -1642,6 +1644,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
>  				stm32f7_i2c_disable_dma_req(i2c_dev);
>  				dmaengine_terminate_async(dma->chan_using);
> +				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +						 dma->dma_data_dir);
>  				f7_msg->result = -ETIMEDOUT;
>  			}
>  		}
> 

Sounds good to me, however there might be an additional place to fix
within the function stm32f7_i2c_handle_isr_errs:
Could you also take care of the unmap in the error ITs handling ?

Regards,
Alain

> -- 
> 2.43.0
> 
