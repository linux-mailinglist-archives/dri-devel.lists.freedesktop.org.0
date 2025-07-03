Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15878AF6E77
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 11:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1911510E7F3;
	Thu,  3 Jul 2025 09:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="Rg6zIqxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6010610E7F3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 09:21:46 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5639KN7v012395;
 Thu, 3 Jul 2025 11:21:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 U8/3UFXjScc/VhoP6EsW6/w+rmVzUP3VLZMHXQEnMOc=; b=Rg6zIqxXVN/lfQGs
 fKnQFf0q/7ilTG9vRlVMMzqP/IgJ92tkaLQr0rS2KExqysC3Gy6bGWQZhiSg9SRA
 jPXgr7nCkK63QVKuTpnMDT6fg8jn97ZefaBY+hOB+VJ8t3DSDHOupGONAyg8dHE5
 sHbhWZGSOr88smm5nf3mNdHedMB6jSUpHqp2dRgtTQQp53Pt5zv7CgCk5S74shfW
 u0lGL8pRyaqSKir+pjJ/47XtcfNMHjAG6Q2vykONLC6UkAYpCthqqASIIu8KvJa5
 w2Gvkb2yRzCfgbdOCIrjV6GU3SY6XNIPh/8VDNxIlmXv6nxOEC/QwvH+yk5bCZws
 8I56Bg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jubp3tx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jul 2025 11:21:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 570B54002D;
 Thu,  3 Jul 2025 11:20:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD797B2B8A3;
 Thu,  3 Jul 2025 11:19:06 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Jul
 2025 11:19:05 +0200
Message-ID: <01d03052-4d9b-4d71-9781-a050ee669d45@foss.st.com>
Date: Thu, 3 Jul 2025 11:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] i2c: stm32f7: unmap DMA mapped buffer
To: Andi Shyti <andi.shyti@kernel.org>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, M'boumba Cedric Madianga
 <cedric.madianga@gmail.com>, Wolfram Sang <wsa@kernel.org>, "Pierre-Yves
 MORDRET" <pierre-yves.mordret@st.com>, <linux-i2c@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-2-7a23ab26683a@foss.st.com>
 <zp3pagbojmu67o4sjm65a44ovvui5uvybs32nayvhtewfbm4el@n5lro4v5iq36>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <zp3pagbojmu67o4sjm65a44ovvui5uvybs32nayvhtewfbm4el@n5lro4v5iq36>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_02,2025-07-02_04,2025-03-28_01
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

Hi Andi,

On 7/2/25 19:08, Andi Shyti wrote:
> Hi Clement,
> 
> On Mon, Jun 30, 2025 at 02:55:14PM +0200, Clément Le Goffic wrote:
>> Fix an issue where the mapped DMA buffer was not unmapped.
> 
> "Fix an issue..." is too generic. Can you be more specific? Where
> was it mapped? Where was it left unmapped?
> 
> Please, do consider that the user needs to understand what
> happens in the patch without needing to look into the patch.

Ok sure I'll refine the commit message.

> 
>> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
>> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   drivers/i2c/busses/i2c-stm32f7.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
>> index e4aaeb2262d0..042386b4cabe 100644
>> --- a/drivers/i2c/busses/i2c-stm32f7.c
>> +++ b/drivers/i2c/busses/i2c-stm32f7.c
>> @@ -1554,6 +1554,8 @@ static irqreturn_t stm32f7_i2c_handle_isr_errs(struct stm32f7_i2c_dev *i2c_dev,
>>   	if (i2c_dev->use_dma) {
>>   		stm32f7_i2c_disable_dma_req(i2c_dev);
>>   		dmaengine_terminate_async(dma->chan_using);
>> +		dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
>> +				 dma->dma_data_dir);
>>   	}
>>   
>>   	i2c_dev->master_mode = false;
>> @@ -1622,6 +1624,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>>   		if (i2c_dev->use_dma) {
>>   			stm32f7_i2c_disable_dma_req(i2c_dev);
>>   			dmaengine_terminate_async(dma->chan_using);
>> +			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
>> +					 dma->dma_data_dir);
>>   		}
>>   		f7_msg->result = -ENXIO;
>>   	}
>> @@ -1642,6 +1646,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>>   				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
>>   				stm32f7_i2c_disable_dma_req(i2c_dev);
>>   				dmaengine_terminate_async(dma->chan_using);
>> +				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
>> +						 dma->dma_data_dir);
> 
> Can't we use the dma_callback here, or similar? I see some
> similar patterns and I think the code can be improved.

Yes, it seems the code can be factorized.
I'll submit a new version with the factorization.

Best regards,
Clément

