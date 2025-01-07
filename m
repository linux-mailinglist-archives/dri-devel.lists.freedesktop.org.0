Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF29DA03C9D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 11:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E17F10E3E8;
	Tue,  7 Jan 2025 10:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="duShz8cs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8051010E3EF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 10:39:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5078AeD2015052;
 Tue, 7 Jan 2025 10:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 olffPcbVhxGAPYBtnxW9rH14fKWdX8OdRVZGbiiwom8=; b=duShz8csW4nO1YaD
 MEK2V2lczs9liXZsLlNPtMHSvBP7VSUdSvhlEBY2pEsoBZKOTCAEsEnNenHCoz2/
 zwlA5NcxueAk5eHNeLfe8ippa68cg2L+g0vK+xL+VkOWYaknSns5u973qCCkJGAq
 hsiwi9n2RMvW5fHEzgBuXKBz+f0xPgwF+fcfLrpapCsAqcRNnfA532kizriCSY0H
 FredI4aI1YbASnJSsWkPiu0fjsGPasZPGcGmtu3C89PsjuwqeiFuvEMswPfgCkhf
 NBhTr391zLdlCHngVf0cmU3UYdGTyIZsYWCwGcQOOxlhsKz6+jf1rBMJcdTLJBFu
 cvscZg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4410he8bat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2025 10:39:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507Acxps020703
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Jan 2025 10:38:59 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 02:38:55 -0800
Message-ID: <ef75e12e-707c-410a-8b9b-c116f54bc7ba@quicinc.com>
Date: Tue, 7 Jan 2025 16:08:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, Vinod Koul
 <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <quic_vtanuku@quicinc.com>
References: <20241217170424.14703-1-quic_jseerapu@quicinc.com>
 <20241217170424.14703-2-quic_jseerapu@quicinc.com>
 <13c5b4d2-8fab-4ad2-98b7-1f71584509a6@quicinc.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <13c5b4d2-8fab-4ad2-98b7-1f71584509a6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: SDRavNl3jf52eKD5bID8gQFCqVdpp5QO
X-Proofpoint-ORIG-GUID: SDRavNl3jf52eKD5bID8gQFCqVdpp5QO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070088
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



On 1/7/2025 11:11 AM, Mukesh Kumar Savaliya wrote:
> 
> 
> On 12/17/2024 10:34 PM, Jyothi Kumar Seerapu wrote:
>> GSI hardware generates an interrupt for each transfer completion.
>> For multiple messages within a single transfer, this results in
>> N interrupts for N messages, leading to significant software
>> interrupt latency.
>>
>> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
>> Enabling BEI instructs the GSI hardware to prevent interrupt generation
>> and BEI is disabled when an interrupt is necessary.
>>
>> When using BEI, consider splitting a single multi-message transfer into
>> chunks of 8 internally. Interrupts are not expected for the first 7 
>> message
> chunks of 8 internally. This seems half statement to me. Something is 
> missing to complete the statement.
Okay, will review and update in next patch.
>> completions, only the last message triggers an interrupt,indicating
> ,indicating
> here give space before.
Sure, will update it in next patch v5.
>> the completion of 8 messages.
>>
>> This BEI mechanism enhances overall transfer efficiency.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
>>
>> v3 -> v4:
>>    - API's added for Block event interrupt with multi descriptor 
>> support for
>>      I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
>>    - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
>>      I2C driver.
>>
>> v2-> v3:
>>     - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
>>     - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>>     - Added documentation for newly added changes in "qcom-gpi-dma.h" 
>> file
>>     - Updated commit description.
>>
>> v1 -> v2:
>>     - Changed dma_addr type from array of pointers to array.
>>     - To support BEI functionality with the TRE size of 64 defined in 
>> GPI driver,
>>       updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.
>>
>>   drivers/dma/qcom/gpi.c           | 3 +++
>>   include/linux/dma/qcom-gpi-dma.h | 9 +++++++++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index 52a7c8f2498f..74eabcd1416d 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -1693,6 +1693,9 @@ static int gpi_create_i2c_tre(struct gchan 
>> *chan, struct gpi_desc *desc,
>>           tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>>           tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
>> +
>> +        if (i2c->flags & QCOM_GPI_BLOCK_EVENT_IRQ)
>> +            tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>>       }
>>       for (i = 0; i < tre_idx; i++)
>> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/ 
>> qcom-gpi-dma.h
>> index 6680dd1a43c6..d818c6a955e2 100644
>> --- a/include/linux/dma/qcom-gpi-dma.h
>> +++ b/include/linux/dma/qcom-gpi-dma.h
>> @@ -15,6 +15,13 @@ enum spi_transfer_cmd {
>>       SPI_DUPLEX,
>>   };
>> +/**
>> + * define QCOM_GPI_BLOCK_EVENT_IRQ - Block event interrupt support
>> + *
>> + * This is used to enable/disable the Block event interrupt mechanism.
>> + */
>> +#define QCOM_GPI_BLOCK_EVENT_IRQ    BIT(0)
>> +
>>   /**
>>    * struct gpi_spi_config - spi config for peripheral
>>    *
>> @@ -65,6 +72,7 @@ enum i2c_op {
>>    * @rx_len: receive length for buffer
>>    * @op: i2c cmd
>>    * @muli-msg: is part of multi i2c r-w msgs
>> + * @flags: true for block event interrupt support
>>    */
>>   struct gpi_i2c_config {
>>       u8 set_config;
>> @@ -78,6 +86,7 @@ struct gpi_i2c_config {
>>       u32 rx_len;
>>       enum i2c_op op;
>>       bool multi_msg;
>> +    bool flags;
> can we better singular name instead of general name ?
> something like bei_flag ? OR block_int_flag ?
Sure, will update it in next patch v5.
> 
>>   };
>>   #endif /* QCOM_GPI_DMA_H */
> 

