Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF282ABF199
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 12:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8083C10EADC;
	Wed, 21 May 2025 10:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iJL7a+QV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE7710E930
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 10:29:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XJou013427;
 Wed, 21 May 2025 10:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VVILEe6kWrVCBKqWMjmHnGUNj3FWG78vm6Dl++52A2I=; b=iJL7a+QVOHQQfcVq
 8vf+XuU4h7/sFLUlNUVdhnaGXxxp4rB6Ov1TN/7WDiXdjdt66hCyFIdb7k3cF7Yl
 L2Z4+5U8DUXcGC1fUWR0Bv9Qg86FP96wcCBPSL2Kd8JDS7tL7dpNWW8OPODzGNWK
 4DYEDZz96Ix7ngMRp8GsaWKqLCVbCwKOLWrq5cuMhF+zdtXXd0D84c6zq05Sl/v9
 17UN4sT+R+Jb6bn5FcUAf1BAI4wnujbhLkP8wKHP3MStOlHBHvZI5LplnkTjP+hz
 P/0kE1cTLrDG0VL3dnCo4T7rCqIiWuUPN3C4cB/4Vh5GvSQXc3oy++N9tSNLZuxm
 ay80AQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5am52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 10:29:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LATR1s019680
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 10:29:27 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 03:29:22 -0700
Message-ID: <ba7559c8-36b6-4628-8fc4-26121f00abd5@quicinc.com>
Date: Wed, 21 May 2025 15:58:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Vinod Koul <vkoul@kernel.org>, Mukesh Kumar Savaliya
 <quic_msavaliy@quicinc.com>, Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <quic_vtanuku@quicinc.com>
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-3-quic_jseerapu@quicinc.com>
 <qizkfszruwcny7f3g3i7cjst342s6ma62k5sgc6pg6yfoti7b3@fo2ssj7jvff2>
 <3aa92123-e43e-4bf5-917a-2db6f1516671@quicinc.com>
 <a98f0f1a-d814-4c6a-9235-918091399e4b@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <a98f0f1a-d814-4c6a-9235-918091399e4b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEwMyBTYWx0ZWRfX7ITj4raTewvf
 fClrdA/srj5zibPdsI/7mySxFAeUxvQh5RpDSOomPAwlBET1cnzPpsj5qqxcrffnw4Px9s/CW51
 QwX9oEUSrj682o4VaRE9CgAckcElVyEKHfJUpa3NZG6IooRoe3Pdn8gmXoHUhFJIoZ+JzobUewJ
 9FwBSNkcFFxrT+1IVvyn7t9FzuH75yMSD4vogv2rR9xCJmwErIJBGHOn3t8PWq8LOzsb/UgfWL7
 GYbaUIjLr/6jX2lgmOP9FCDpB1PzycLOAZcVePqyxohyGs8cQvKVc4/lWWmgyVbEA/meoHEk7v4
 fkpJ95DVRNkGK/p4Q2jm3N4dNtQ+WS34rrluW9+ZDpDlNkvTIxSuf5XnMPqr+9NSYF6ECgDZ1QZ
 AUpCl3wBSj8EbQFjDu/n6rSbeOt5/JL0vPkJreimcVRMyCFDKoKD4+RirNlM1fU0t0Q3PGSj
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682dab07 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=9gQUcu_fBThL3mYRZ4IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PMnBKmUxqYKyJZcVSL_8_QCp28GK7F3R
X-Proofpoint-ORIG-GUID: PMnBKmUxqYKyJZcVSL_8_QCp28GK7F3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210103
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



On 5/9/2025 9:31 PM, Dmitry Baryshkov wrote:
> On 09/05/2025 09:18, Jyothi Kumar Seerapu wrote:
>> Hi Dimitry, Thanks for providing the review comments.
>>
>> On 5/6/2025 5:16 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 06, 2025 at 04:48:44PM +0530, Jyothi Kumar Seerapu wrote:
>>>> The I2C driver gets an interrupt upon transfer completion.
>>>> When handling multiple messages in a single transfer, this
>>>> results in N interrupts for N messages, leading to significant
>>>> software interrupt latency.
>>>>
>>>> To mitigate this latency, utilize Block Event Interrupt (BEI)
>>>> mechanism. Enabling BEI instructs the hardware to prevent interrupt
>>>> generation and BEI is disabled when an interrupt is necessary.
>>>>
>>>> Large I2C transfer can be divided into chunks of 8 messages internally.
>>>> Interrupts are not expected for the first 7 message completions, only
>>>> the last message triggers an interrupt, indicating the completion of
>>>> 8 messages. This BEI mechanism enhances overall transfer efficiency.
>>>
>>> Why do you need this complexity? Is it possible to set the
>>> DMA_PREP_INTERRUPT flag on the last message in the transfer?
>>
>> If i undertsand correctly, the suggestion is to get the single 
>> intetrrupt for last i2c message only.
>>
>> But With this approach, we can't handle large number of i2c messages 
>> in the transfer.
>>
>> In GPI driver, number of max TREs support is harcoded to 64 (#define 
>> CHAN_TRES   64) and for I2C message, we need Config TRE, GO TRE and 
>> DMA TREs. So, the avilable TREs are not sufficient to handle all the N 
>> messages.
> 
> It sounds like a DMA driver issue. In other words, the DMA driver can 
> know that it must issue an interrupt before exausting 64 TREs in order to
> 
>>
>> Here, the plan is to queue i2c messages (QCOM_I2C_GPI_MAX_NUM_MSGS or 
>> 'num' incase for less messsages), process and unmap/free upon the 
>> interrupt based on QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> 
> Why? This is some random value which has no connection with CHAN_TREs. 
> Also, what if one of the platforms get a 'liter' GPI which supports less 
> TREs in a single run? Or a super-premium platform which can use 256 
> TREs? Please don't workaround issues from one driver in another one.

We are trying to utilize the existing CHAN_TRES mentioned in the GPI 
driver.
With the following approach, the GPI hardware can process N number of 
I2C messages, thereby improving throughput and transfer efficiency.

The main design consideration for using the block event interrupt is as 
follows:

Allow the hardware to process the TREs (I2C messages), while the 
software concurrently prepares the next set of TREs to be submitted to 
the hardware. Once the TREs are processed, they can be freed, enabling 
the software to queue new TREs. This approach enhances overall optimization.

Please let me know if you have any questions, concerns, or suggestions.
> 
>>
>>
>>>
>>>>
>>>> This optimization reduces transfer time from 168 ms to 48 ms for a
>>>> series of 200 I2C write messages in a single transfer, with a
>>>> clock frequency support of 100 kHz.
>>>>
>>>> BEI optimizations are currently implemented for I2C write transfers 
>>>> only,
>>>> as there is no use case for multiple I2C read messages in a single 
>>>> transfer
>>>> at this time.
>>>>
>>>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>>>> ---
>>>> v5 -> v6:
>>>>    - Instead of using bei_flag, moved the logic to use with DMA
>>>>      supported flags like DMA_PREP_INTERRUPT.
>>>>    - Additional parameter comments removed from 
>>>> geni_i2c_gpi_multi_desc_unmap
>>>>      function documentation.
>>>> v4 -> v5:
>>>>    - Block event interrupt flag naming changed from flags to bei_flag.
>>>>    - Documentation added for "struct geni_i2c_dev".
>>>>
>>>> v3 -> v4:
>>>>    - API's added for Block event interrupt with multi descriptor 
>>>> support for
>>>>      I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver 
>>>> file.
>>>>    - gpi_multi_xfer_timeout_handler function is moved from GPI 
>>>> driver to
>>>>      I2C driver.
>>>>    - geni_i2c_gpi_multi_desc_xfer structure is added as a member of
>>>>      struct geni_i2c_dev.
>>>>
>>>> v2 -> v3:
>>>>     - In i2c_gpi_cb_result function, moved the logic of
>>>>      "!is_tx_multi_xfer" to else.
>>>>     - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>>>>     - Updated commit description
>>>>
>>>> v1 -> v2:
>>>>     - Moved gi2c_gpi_xfer->msg_idx_cnt to separate local variable.
>>>>     - Updated goto labels for error scenarios in geni_i2c_gpi function
>>>>     - memset tx_multi_xfer to 0.
>>>>     - Removed passing current msg index to geni_i2c_gpi
>>>>     - Fixed kernel test robot reported compilation issues.
>>>>
>>>>
>>>>   drivers/i2c/busses/i2c-qcom-geni.c | 307 +++++++++++++++++++++++++ 
>>>> +---
>>>>   1 file changed, 280 insertions(+), 27 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/ 
>>>> busses/ i2c-qcom-geni.c
>>>> index 515a784c951c..e390cf5b4ddc 100644
>>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>>> @@ -78,6 +78,62 @@ enum geni_i2c_err_code {
>>>>   #define XFER_TIMEOUT        HZ
>>>>   #define RST_TIMEOUT        HZ
>>>> +#define QCOM_I2C_GPI_MAX_NUM_MSGS        16
>>>> +#define QCOM_I2C_GPI_NUM_MSGS_PER_IRQ        8
>>>> +#define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC    2
>>>> +
>>>> +/**
>>>> + * struct geni_i2c_gpi_multi_desc_xfer - Used for multi transfer 
>>>> support
>>>> + *
>>>> + * @msg_idx_cnt: message index for the transfer
>>>> + * @buf_idx: dma buffer index
>>>> + * @unmap_msg_cnt: unmapped transfer index
>>>> + * @freed_msg_cnt: freed transfer index
>>>> + * @irq_cnt: received interrupt count
>>>> + * @irq_msg_cnt: transfer message count for the received irqs
>>>> + * @dma_buf: virtual addresses of the buffers
>>>> + * @dma_addr: dma addresses of the buffers
>>>> + */
>>>> +struct geni_i2c_gpi_multi_desc_xfer {
>>>> +    u32 msg_idx_cnt;
>>>> +    u32 buf_idx;
>>>> +    u32 unmap_msg_cnt;
>>>> +    u32 freed_msg_cnt;
>>>> +    u32 irq_cnt;
>>>> +    u32 irq_msg_cnt;
>>>> +    void *dma_buf[QCOM_I2C_GPI_MAX_NUM_MSGS];
>>>> +    dma_addr_t dma_addr[QCOM_I2C_GPI_MAX_NUM_MSGS];
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct geni_i2c_dev - I2C Geni device specific structure
>>>> + *
>>>> + * @se: geni serial engine
>>>> + * @tx_wm: Tx watermark level
>>>> + * @irq: i2c serial engine interrupt
>>>> + * @err: specifies error codes in i2c transfer failures
>>>> + * @adap: i2c geni adapter
>>>> + * @done: completion variable
>>>> + * @cur: pointer to the i2c_msg mentioning current i2c message in use
>>>> + * @cur_wr: variable used for i2c write opertions
>>>> + * @cur_rd: variable used for i2c read operations
>>>> + * @lock: spinlock variable used for synchronization
>>>> + * @core_clk: pointer to clk
>>>> + * @clk_freq_out: contains the i2c clock frequency
>>>> + * @clk_fld: pointer to geni_i2c_clk_fld
>>>> + * @suspended: flag used for system supend status
>>>> + * @dma_buf: virtual address of the buffer
>>>> + * @xfer_len: holds length for the dma operation
>>>> + * @dma_addr: dma address of the buffer
>>>> + * @tx_c: Tx dma channel
>>>> + * @rx_c: Rx dma channel
>>>> + * @gpi_mode: GPI DMA mode of operation
>>>> + * @abort_done: true for marking i2c abort transfer
>>>> + * @is_tx_multi_desc_xfer: true for i2c multi transfer support
>>>> + * @num_msgs: number of i2c messages in a transfer
>>>> + * @tx_irq_cnt: flag used for tx irq count in i2c multi transfer
>>>> + * @i2c_multi_desc_config: used for multi transfer support
>>>> + */
>>>
>>> Unrelated. Documentation should go to a separate patch.
>> Sure, I will follow it in next patch.
>>>
>>>>   struct geni_i2c_dev {
>>>>       struct geni_se se;
>>>>       u32 tx_wm;
>>>> @@ -100,6 +156,10 @@ struct geni_i2c_dev {
>>>>       struct dma_chan *rx_c;
>>>>       bool gpi_mode;
>>>>       bool abort_done;
>>>> +    bool is_tx_multi_desc_xfer;
>>>> +    u32 num_msgs;
>>>> +    u32 tx_irq_cnt;
>>>> +    struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
>>>>   };
>>>>   struct geni_i2c_desc {
>>>> @@ -500,6 +560,7 @@ static int geni_i2c_tx_one_msg(struct 
>>>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>>>   static void i2c_gpi_cb_result(void *cb, const struct 
>>>> dmaengine_result *result)
>>>>   {
>>>>       struct geni_i2c_dev *gi2c = cb;
>>>> +    struct geni_i2c_gpi_multi_desc_xfer *tx_multi_xfer;
>>>
>>> Define it in the corresponding chunk.
>> If I understand correctly, do i need to add this in else block ?
> 
> Yes.
> 
>>>
>>>>       if (result->result != DMA_TRANS_NOERROR) {
>>>>           dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
>>>> @@ -508,7 +569,22 @@ static void i2c_gpi_cb_result(void *cb, const 
>>>> struct dmaengine_result *result)
>>>>           dev_dbg(gi2c->se.dev, "DMA xfer has pending: %d\n", 
>>>> result- >residue);
>>>>       }
>>>> -    complete(&gi2c->done);
>>>> +    if (!gi2c->is_tx_multi_desc_xfer) {
>>>> +        complete(&gi2c->done);
>>>> +    } else {
>>>> +        tx_multi_xfer = &gi2c->i2c_multi_desc_config;
>>>> +
>>>> +        /*
>>>> +         * Send Completion for last message or multiple of
>>>> +         * QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
>>>> +         */
>>>> +        if ((tx_multi_xfer->irq_msg_cnt == gi2c->num_msgs - 1) ||
>>>> +            (!((tx_multi_xfer->irq_msg_cnt + 1) % 
>>>> QCOM_I2C_GPI_NUM_MSGS_PER_IRQ))) {
>>>> +            tx_multi_xfer->irq_cnt++;
>>>> +            complete(&gi2c->done);
>>>> +        }
>>>> +        tx_multi_xfer->irq_msg_cnt++;
>>>> +    }
>>>>   }
>>>>   static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct 
>>>> i2c_msg *msg,
>>>> @@ -526,38 +602,140 @@ static void geni_i2c_gpi_unmap(struct 
>>>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>>>       }
>>>>   }
>>>> -static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg 
>>>> *msg,
>>>> +/**
>>>> + * geni_i2c_gpi_multi_desc_unmap() - unmaps the buffers post multi 
>>>> message TX transfers
>>>> + * @gi2c: i2c dev handle
>>>> + * @msgs: i2c messages array
>>>> + * @peripheral: pointer to gpi_i2c_config
>>>> + */
>>>> +static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev 
>>>> *gi2c, struct i2c_msg msgs[],
>>>> +                      struct gpi_i2c_config *peripheral)
>>>> +{
>>>> +    u32 msg_xfer_cnt, wr_idx = 0;
>>>> +    struct geni_i2c_gpi_multi_desc_xfer *tx_multi_xfer = &gi2c- 
>>>> >i2c_multi_desc_config;
>>>> +
>>>> +    /*
>>>> +     * In error case, need to unmap all messages based on the 
>>>> msg_idx_cnt.
>>>> +     * Non-error case unmap all the processed messages.
>>>> +     */
>>>> +    if (gi2c->err)
>>>> +        msg_xfer_cnt = tx_multi_xfer->msg_idx_cnt;
>>>> +    else
>>>> +        msg_xfer_cnt = tx_multi_xfer->irq_cnt * 
>>>> QCOM_I2C_GPI_NUM_MSGS_PER_IRQ;
>>>> +
>>>> +    /* Unmap the processed DMA buffers based on the received 
>>>> interrupt count */
>>>> +    for (; tx_multi_xfer->unmap_msg_cnt < msg_xfer_cnt; 
>>>> tx_multi_xfer->unmap_msg_cnt++) {
>>>> +        if (tx_multi_xfer->unmap_msg_cnt == gi2c->num_msgs)
>>>> +            break;
>>>> +        wr_idx = tx_multi_xfer->unmap_msg_cnt % 
>>>> QCOM_I2C_GPI_MAX_NUM_MSGS;
>>>> +        geni_i2c_gpi_unmap(gi2c, &msgs[tx_multi_xfer->unmap_msg_cnt],
>>>> +                   tx_multi_xfer->dma_buf[wr_idx],
>>>> +                   tx_multi_xfer->dma_addr[wr_idx],
>>>> +                   NULL, (dma_addr_t)NULL);
>>>> +        tx_multi_xfer->freed_msg_cnt++;
>>>> +    }
>>>> +}
>>>> +
>>>> +/**
>>>> + * geni_i2c_gpi_multi_xfer_timeout_handler() - Handle multi message 
>>>> transfer timeout
>>>> + * @dev: pointer to the corresponding dev node
>>>> + * @multi_xfer: pointer to the geni_i2c_gpi_multi_desc_xfer
>>>> + * @num_xfers: total number of transfers
>>>> + * @transfer_timeout_msecs: transfer timeout value
>>>> + * @transfer_comp: completion object of the transfer
>>>> + *
>>>> + * This function is used to wait for the processed transfers based on
>>>> + * the interrupts generated upon transfer completion.
>>>> + * Return: On success returns 0, otherwise return error code (- 
>>>> ETIMEDOUT)
>>>> + */
>>>> +static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
>>>> +                           struct geni_i2c_gpi_multi_desc_xfer 
>>>> *multi_xfer,
>>>> +                           u32 num_xfers, u32 transfer_timeout_msecs,
>>>> +                           struct completion *transfer_comp)
>>>> +{
>>>> +    int i;
>>>> +    u32 max_irq_cnt, time_left;
>>>> +
>>>> +    max_irq_cnt = num_xfers / QCOM_I2C_GPI_NUM_MSGS_PER_IRQ;
>>>> +    if (num_xfers % QCOM_I2C_GPI_NUM_MSGS_PER_IRQ)
>>>> +        max_irq_cnt++;
>>>> +
>>>> +    /*
>>>> +     * Wait for the interrupts of the processed transfers in multiple
>>>> +     * of 8 and for the last transfer. If the hardware is fast and
>>>> +     * already processed all the transfers then no need to wait.
>>>> +     */
>>>> +    for (i = 0; i < max_irq_cnt; i++) {
>>>> +        reinit_completion(transfer_comp);
>>>> +        if (max_irq_cnt != multi_xfer->irq_cnt) {
>>>> +            time_left = wait_for_completion_timeout(transfer_comp,
>>>> +                                transfer_timeout_msecs);
>>>> +            if (!time_left) {
>>>> +                dev_err(dev, "%s: Transfer timeout\n", __func__);
>>>> +                return -ETIMEDOUT;
>>>> +            }
>>>> +        }
>>>> +        if (num_xfers > multi_xfer->msg_idx_cnt)
>>>> +            return 0;
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg 
>>>> msgs[],
>>>>               struct dma_slave_config *config, dma_addr_t *dma_addr_p,
>>>>               void **buf, unsigned int op, struct dma_chan *dma_chan)
>>>>   {
>>>>       struct gpi_i2c_config *peripheral;
>>>> -    unsigned int flags;
>>>>       void *dma_buf;
>>>>       dma_addr_t addr;
>>>>       enum dma_data_direction map_dirn;
>>>>       enum dma_transfer_direction dma_dirn;
>>>>       struct dma_async_tx_descriptor *desc;
>>>>       int ret;
>>>> +    struct geni_i2c_gpi_multi_desc_xfer *gi2c_gpi_xfer;
>>>> +    dma_cookie_t cookie;
>>>> +    u32 msg_idx;
>>>>       peripheral = config->peripheral_config;
>>>> -
>>>> -    dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
>>>> -    if (!dma_buf)
>>>> -        return -ENOMEM;
>>>> +    gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
>>>> +    dma_buf = gi2c_gpi_xfer->dma_buf[gi2c_gpi_xfer->buf_idx];
>>>> +    addr = gi2c_gpi_xfer->dma_addr[gi2c_gpi_xfer->buf_idx];
>>>> +    msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
>>>> +
>>>> +    dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
>>>> +    if (!dma_buf) {
>>>> +        ret = -ENOMEM;
>>>> +        goto out;
>>>> +    }
>>>>       if (op == I2C_WRITE)
>>>>           map_dirn = DMA_TO_DEVICE;
>>>>       else
>>>>           map_dirn = DMA_FROM_DEVICE;
>>>> -    addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, 
>>>> map_dirn);
>>>> +    addr = dma_map_single(gi2c->se.dev->parent, dma_buf,
>>>> +                  msgs[msg_idx].len, map_dirn);
>>>>       if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
>>>> -        i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>>>> -        return -ENOMEM;
>>>> +        i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
>>>> +        ret = -ENOMEM;
>>>> +        goto out;
>>>> +    }
>>>> +
>>>> +    if (gi2c->is_tx_multi_desc_xfer) {
>>>> +        if (((msg_idx + 1) % QCOM_I2C_GPI_NUM_MSGS_PER_IRQ))
>>>> +            peripheral->dma_flags = DMA_CTRL_ACK;
>>>> +        else
>>>> +            peripheral->dma_flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
>>>> +
>>>> +        /* BEI bit to be cleared for last TRE */
>>>> +        if (msg_idx == gi2c->num_msgs - 1)
>>>> +            peripheral->dma_flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
>>>> +    } else {
>>>> +        peripheral->dma_flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
>>>
>>> No-no-no. There is no need to set peripheral->dma_flags.
>>
>> Initially it was "flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;".
>>
>> I thought of using flags in GPI driver as well, so moved flags gpi 
>> include file to access b/w I2C and GPI.
>>
>> But as per your suggestion i will review if 
>> "dma_async_tx_descriptor.flags" can be retrieved in GPI driver for 
>> getting DMA_PREP_INTERRUPT flag status.
> 
> Well. Nobody thought that you'd continue inventing drvier-specific API 
> when we asked you to use a generic pre-existing const.
> 
>>>
>>>>       }
>>>>       /* set the length as message for rx txn */
>>>> -    peripheral->rx_len = msg->len;
>>>> +    peripheral->rx_len = msgs[msg_idx].len;
>>>>       peripheral->op = op;
>>>>       ret = dmaengine_slave_config(dma_chan, config);
>>>> @@ -568,14 +746,14 @@ static int geni_i2c_gpi(struct geni_i2c_dev 
>>>> *gi2c, struct i2c_msg *msg,
>>>>       peripheral->set_config = 0;
>>>>       peripheral->multi_msg = true;
>>>> -    flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
>>>>       if (op == I2C_WRITE)
>>>>           dma_dirn = DMA_MEM_TO_DEV;
>>>>       else
>>>>           dma_dirn = DMA_DEV_TO_MEM;
>>>> -    desc = dmaengine_prep_slave_single(dma_chan, addr, msg->len, 
>>>> dma_dirn, flags);
>>>> +    desc = dmaengine_prep_slave_single(dma_chan, addr, 
>>>> msgs[msg_idx].len,
>>>> +                       dma_dirn, peripheral->dma_flags);
>>>>       if (!desc) {
>>>>           dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
>>>>           ret = -EIO;
>>>> @@ -585,15 +763,48 @@ static int geni_i2c_gpi(struct geni_i2c_dev 
>>>> *gi2c, struct i2c_msg *msg,
>>>>       desc->callback_result = i2c_gpi_cb_result;
>>>>       desc->callback_param = gi2c;
>>>> -    dmaengine_submit(desc);
>>>> -    *buf = dma_buf;
>>>> -    *dma_addr_p = addr;
>>>> +    if (!((msgs[msg_idx].flags & I2C_M_RD) && op == I2C_WRITE)) {
>>>> +        gi2c_gpi_xfer->msg_idx_cnt++;
>>>> +        gi2c_gpi_xfer->buf_idx = (msg_idx + 1) % 
>>>> QCOM_I2C_GPI_MAX_NUM_MSGS;
>>>> +    }
>>>> +    cookie = dmaengine_submit(desc);
>>>> +    if (dma_submit_error(cookie)) {
>>>> +        dev_err(gi2c->se.dev,
>>>> +            "%s: dmaengine_submit failed (%d)\n", __func__, cookie);
>>>> +        ret = -EINVAL;
>>>> +        goto err_config;
>>>> +    }
>>>> +    if (gi2c->is_tx_multi_desc_xfer) {
>>>> +        dma_async_issue_pending(gi2c->tx_c);
>>>> +        if ((msg_idx == (gi2c->num_msgs - 1)) ||
>>>> +            (gi2c_gpi_xfer->msg_idx_cnt >=
>>>> +             QCOM_I2C_GPI_MAX_NUM_MSGS + gi2c_gpi_xfer- 
>>>> >freed_msg_cnt)) {
>>>> +            ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c- 
>>>> >se.dev, gi2c_gpi_xfer,
>>>> +                                      gi2c->num_msgs, XFER_TIMEOUT,
>>>> +                                      &gi2c->done);
>>>> +            if (ret) {
>>>> +                dev_err(gi2c->se.dev,
>>>> +                    "I2C multi write msg transfer timeout: %d\n",
>>>> +                    ret);
>>>> +                gi2c->err = ret;
>>>> +                goto err_config;
>>>> +            }
>>>> +        }
>>>> +    } else {
>>>> +        /* Non multi descriptor message transfer */
>>>> +        *buf = dma_buf;
>>>> +        *dma_addr_p = addr;
>>>> +    }
>>>>       return 0;
>>>>   err_config:
>>>> -    dma_unmap_single(gi2c->se.dev->parent, addr, msg->len, map_dirn);
>>>> -    i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>>>> +    dma_unmap_single(gi2c->se.dev->parent, addr,
>>>> +             msgs[msg_idx].len, map_dirn);
>>>> +    i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
>>>> +
>>>> +out:
>>>> +    gi2c->err = ret;
>>>>       return ret;
>>>>   }
>>>> @@ -605,6 +816,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev 
>>>> *gi2c, struct i2c_msg msgs[], i
>>>>       unsigned long time_left;
>>>>       dma_addr_t tx_addr, rx_addr;
>>>>       void *tx_buf = NULL, *rx_buf = NULL;
>>>> +    struct geni_i2c_gpi_multi_desc_xfer *tx_multi_xfer;
>>>>       const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>>>>       config.peripheral_config = &peripheral;
>>>> @@ -618,6 +830,33 @@ static int geni_i2c_gpi_xfer(struct 
>>>> geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>>       peripheral.set_config = 1;
>>>>       peripheral.multi_msg = false;
>>>> +    gi2c->num_msgs = num;
>>>> +    gi2c->is_tx_multi_desc_xfer = false;
>>>> +    gi2c->tx_irq_cnt = 0;
>>>> +
>>>> +    tx_multi_xfer = &gi2c->i2c_multi_desc_config;
>>>> +    memset(tx_multi_xfer, 0, sizeof(struct 
>>>> geni_i2c_gpi_multi_desc_xfer));
>>>> +
>>>> +    /*
>>>> +     * If number of write messages are two and higher then
>>>> +     * configure hardware for multi descriptor transfers with BEI.
>>>> +     */
>>>> +    if (num >= QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC) {
>>>> +        gi2c->is_tx_multi_desc_xfer = true;
>>>> +        for (i = 0; i < num; i++) {
>>>> +            if (msgs[i].flags & I2C_M_RD) {
>>>> +                /*
>>>> +                 * Multi descriptor transfer with BEI
>>>> +                 * support is enabled for write transfers.
>>>> +                 * TODO: Add BEI optimization support for
>>>> +                 * read transfers later.
>>>> +                 */
>>>> +                gi2c->is_tx_multi_desc_xfer = false;
>>>> +                break;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>>       for (i = 0; i < num; i++) {
>>>>           gi2c->cur = &msgs[i];
>>>>           gi2c->err = 0;
>>>> @@ -628,14 +867,16 @@ static int geni_i2c_gpi_xfer(struct 
>>>> geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>>               peripheral.stretch = 1;
>>>>           peripheral.addr = msgs[i].addr;
>>>> +        if (i > 0 && (!(msgs[i].flags & I2C_M_RD)))
>>>> +            peripheral.multi_msg = false;
>>>> -        ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>>>> +        ret =  geni_i2c_gpi(gi2c, msgs, &config,
>>>>                       &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
>>>
>>> Can't you just pass the flag to set DMA_PREP_INTERRUPT for the last
>>> message here and on the next geni_i2c_gpi() call?
>>
>> Sure, I will review it.
>> We need to set/mask DMA_PREP_INTERRUPT through dma_async_tx_descriptor 
>> structure and need to pass this structure to GPI and so GPI can 
>> retrives flags for GPI HW BEI set functionality.
> 
> Hmm. Do you? Check how other drivers handle the flag, it's not that you 
> are the first driver author implementing it.
> 
>>>
>>>>           if (ret)
>>>>               goto err;
>>>>           if (msgs[i].flags & I2C_M_RD) {
>>>> -            ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>>>> +            ret =  geni_i2c_gpi(gi2c, msgs, &config,
>>>>                           &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
>>>>               if (ret)
>>>>                   goto err;
>>>> @@ -643,18 +884,26 @@ static int geni_i2c_gpi_xfer(struct 
>>>> geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>>               dma_async_issue_pending(gi2c->rx_c);
>>>>           }
>>>> -        dma_async_issue_pending(gi2c->tx_c);
>>>> -
>>>> -        time_left = wait_for_completion_timeout(&gi2c->done, 
>>>> XFER_TIMEOUT);
>>>> -        if (!time_left)
>>>> -            gi2c->err = -ETIMEDOUT;
>>>> +        if (!gi2c->is_tx_multi_desc_xfer) {
>>>> +            dma_async_issue_pending(gi2c->tx_c);
>>>> +            time_left = wait_for_completion_timeout(&gi2c->done, 
>>>> XFER_TIMEOUT);
>>>> +            if (!time_left) {
>>>> +                dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
>>>> +                gi2c->err = -ETIMEDOUT;
>>>> +            }
>>>> +        }
>>>>           if (gi2c->err) {
>>>>               ret = gi2c->err;
>>>>               goto err;
>>>>           }
>>>> -        geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, 
>>>> rx_addr);
>>>> +        if (!gi2c->is_tx_multi_desc_xfer) {
>>>> +            geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, 
>>>> rx_buf, rx_addr);
>>>> +        } else if (gi2c->tx_irq_cnt != tx_multi_xfer->irq_cnt) {
>>>> +            gi2c->tx_irq_cnt = tx_multi_xfer->irq_cnt;
>>>> +            geni_i2c_gpi_multi_desc_unmap(gi2c, msgs, &peripheral);
>>>> +        }
>>>>       }
>>>>       return num;
>>>> @@ -663,7 +912,11 @@ static int geni_i2c_gpi_xfer(struct 
>>>> geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>>       dev_err(gi2c->se.dev, "GPI transfer failed: %d\n", ret);
>>>>       dmaengine_terminate_sync(gi2c->rx_c);
>>>>       dmaengine_terminate_sync(gi2c->tx_c);
>>>> -    geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, 
>>>> rx_addr);
>>>> +    if (gi2c->is_tx_multi_desc_xfer)
>>>> +        geni_i2c_gpi_multi_desc_unmap(gi2c, msgs, &peripheral);
>>>> +    else
>>>> +        geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, 
>>>> rx_addr);
>>>> +
>>>>       return ret;
>>>>   }
>>>> -- 
>>>> 2.17.1
>>>>
>>>
>>
> 
> 

