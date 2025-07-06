Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC43AF749F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 14:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ED910E825;
	Thu,  3 Jul 2025 12:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZLNFCW6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92C310E825
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 12:51:10 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5637Dg6I007093;
 Thu, 3 Jul 2025 12:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pgPkM4z9EmDCEAnFMebZ9hY/9mD9t0tdwZEavmwTb1k=; b=ZLNFCW6SRcJzHuP4
 U9TlZzKu2H2+mOK79rkyshjZy2CPHPD8oaqe4icqP49VjoS5hKIRULlpfzZGqt7T
 IS7lUEcpM5oGNh/q01flZUilULPeK7AZ2hQWQczKLNALlC4BGKdgGU71sXa7+PMk
 ktfQE+q+iDXSzVjK/vu1R3AM817WrjWuk09/qjXuvH538PN3CWOcVVh+bUCc/yH2
 bW+8JSOYyHMY4iXf5eOF4inMeYWo+lVPqUZYFfmf4RPxzd668bRj3UyIgltKwOdt
 CiwI0s2yceNgeqeSWIw5eoi9k6ilUYmBgVf6bSHGcT4eiXz6/xmK9fQvIW9LnOvS
 4YEcJg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jmykn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jul 2025 12:51:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563Cp4WP029439
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 3 Jul 2025 12:51:04 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 3 Jul
 2025 05:51:00 -0700
Message-ID: <28d26c70-178f-413b-b7f8-410c508cfdd7@quicinc.com>
Date: Thu, 3 Jul 2025 18:20:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
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
 <ba7559c8-36b6-4628-8fc4-26121f00abd5@quicinc.com>
 <w6epbao7dwwx65crst6md4uxi3iivkcj55mhr2ko3z5olezhdl@ffam3xif6tmh>
 <5ed77f6d-14d7-4b62-9505-ab988fa43bf2@quicinc.com>
 <644oygj43z2um42tmmldp3feemgzrdoirzfw7pu27k4zi76bwg@wfxbtgqqgh4p>
 <dc7358a1-ddc5-402e-9024-283f8e46e3b6@quicinc.com>
 <CAO9ioeVuAO6mYpBSpiTW0jhFRPtkubZ5eEskd1yLBHVdR8_YMA@mail.gmail.com>
 <1b55d9d4-f3ff-4cd9-8906-5f370da55732@quicinc.com>
Content-Language: en-US
In-Reply-To: <1b55d9d4-f3ff-4cd9-8906-5f370da55732@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=68667cb8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=x8f_750JEDoXyK8ovhkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VY_okcxpzkLBNEnezuRnbgzyUS4RNqPz
X-Proofpoint-GUID: VY_okcxpzkLBNEnezuRnbgzyUS4RNqPz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwNyBTYWx0ZWRfX+dVKWcnsOWJ0
 3XMbTotEMDSnA/Mv7+Ww/STjkbeAOcknaKdr+1AqwWIqGVXYUlZBUokPgf96zlZcEul5KlT49mO
 ahVDCM98q5pzT8W4m7I6ipN4j0GSvD25JXXvABoLh0JOS4zrPz4wEnD0aq77ZqKr9Lvz6CT3Wf4
 Yo/fN4dEZKkgIJ2iUsqQqyoxRMaUFSG7zi6nLKyx8o4SQ5NF8ACnODCSdpvaBSj3kxN6PQUuwTD
 tcKZx3XUl0LcRgYqFp2/VoNnHg7H4V93E1ulpTNHdD5qQX2OAt3agvcZFzlRv/31vG6R21mRIWL
 KpoKDI0snjNmsJNJIA1haEoCeCWRizBfNGkv+yUcIEoV/MDRKl+04pF66nzfCif847F2it+x1Qq
 EywsqgoeN4AD4FH5MGCVkJBx26FBByoeGURSrePzu0Trw2a2QUaaKSQsOvP/svY0jyVxyZU/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030107
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



On 6/19/2025 9:46 PM, Jyothi Kumar Seerapu wrote:
> 
> 
> On 6/18/2025 1:02 AM, Dmitry Baryshkov wrote:
>> On Tue, 17 Jun 2025 at 17:11, Jyothi Kumar Seerapu
>> <quic_jseerapu@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 5/30/2025 10:12 PM, Dmitry Baryshkov wrote:
>>>> On Fri, May 30, 2025 at 07:36:05PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>
>>>>>
>>>>> On 5/21/2025 6:15 PM, Dmitry Baryshkov wrote:
>>>>>> On Wed, May 21, 2025 at 03:58:48PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 5/9/2025 9:31 PM, Dmitry Baryshkov wrote:
>>>>>>>> On 09/05/2025 09:18, Jyothi Kumar Seerapu wrote:
>>>>>>>>> Hi Dimitry, Thanks for providing the review comments.
>>>>>>>>>
>>>>>>>>> On 5/6/2025 5:16 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Tue, May 06, 2025 at 04:48:44PM +0530, Jyothi Kumar Seerapu 
>>>>>>>>>> wrote:
>>>>>>>>>>> The I2C driver gets an interrupt upon transfer completion.
>>>>>>>>>>> When handling multiple messages in a single transfer, this
>>>>>>>>>>> results in N interrupts for N messages, leading to significant
>>>>>>>>>>> software interrupt latency.
>>>>>>>>>>>
>>>>>>>>>>> To mitigate this latency, utilize Block Event Interrupt (BEI)
>>>>>>>>>>> mechanism. Enabling BEI instructs the hardware to prevent 
>>>>>>>>>>> interrupt
>>>>>>>>>>> generation and BEI is disabled when an interrupt is necessary.
>>>>>>>>>>>
>>>>>>>>>>> Large I2C transfer can be divided into chunks of 8 messages 
>>>>>>>>>>> internally.
>>>>>>>>>>> Interrupts are not expected for the first 7 message 
>>>>>>>>>>> completions, only
>>>>>>>>>>> the last message triggers an interrupt, indicating the 
>>>>>>>>>>> completion of
>>>>>>>>>>> 8 messages. This BEI mechanism enhances overall transfer 
>>>>>>>>>>> efficiency.
>>>>>>>>>>
>>>>>>>>>> Why do you need this complexity? Is it possible to set the
>>>>>>>>>> DMA_PREP_INTERRUPT flag on the last message in the transfer?
>>>>>>>>>
>>>>>>>>> If i undertsand correctly, the suggestion is to get the single
>>>>>>>>> intetrrupt for last i2c message only.
>>>>>>>>>
>>>>>>>>> But With this approach, we can't handle large number of i2c 
>>>>>>>>> messages
>>>>>>>>> in the transfer.
>>>>>>>>>
>>>>>>>>> In GPI driver, number of max TREs support is harcoded to 64 
>>>>>>>>> (#define
>>>>>>>>> CHAN_TRES   64) and for I2C message, we need Config TRE, GO TRE 
>>>>>>>>> and
>>>>>>>>> DMA TREs. So, the avilable TREs are not sufficient to handle 
>>>>>>>>> all the
>>>>>>>>> N messages.
>>>>>>>>
>>>>>>>> It sounds like a DMA driver issue. In other words, the DMA 
>>>>>>>> driver can
>>>>>>>> know that it must issue an interrupt before exausting 64 TREs in 
>>>>>>>> order
>>>>>>>> to
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Here, the plan is to queue i2c messages (QCOM_I2C_GPI_MAX_NUM_MSGS
>>>>>>>>> or 'num' incase for less messsages), process and unmap/free 
>>>>>>>>> upon the
>>>>>>>>> interrupt based on QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
>>>>>>>>
>>>>>>>> Why? This is some random value which has no connection with 
>>>>>>>> CHAN_TREs.
>>>>>>>> Also, what if one of the platforms get a 'liter' GPI which 
>>>>>>>> supports less
>>>>>>>> TREs in a single run? Or a super-premium platform which can use 256
>>>>>>>> TREs? Please don't workaround issues from one driver in another 
>>>>>>>> one.
>>>>>>>
>>>>>>> We are trying to utilize the existing CHAN_TRES mentioned in the 
>>>>>>> GPI driver.
>>>>>>> With the following approach, the GPI hardware can process N 
>>>>>>> number of I2C
>>>>>>> messages, thereby improving throughput and transfer efficiency.
>>>>>>>
>>>>>>> The main design consideration for using the block event interrupt 
>>>>>>> is as
>>>>>>> follows:
>>>>>>>
>>>>>>> Allow the hardware to process the TREs (I2C messages), while the 
>>>>>>> software
>>>>>>> concurrently prepares the next set of TREs to be submitted to the 
>>>>>>> hardware.
>>>>>>> Once the TREs are processed, they can be freed, enabling the 
>>>>>>> software to
>>>>>>> queue new TREs. This approach enhances overall optimization.
>>>>>>>
>>>>>>> Please let me know if you have any questions, concerns, or 
>>>>>>> suggestions.
>>>>>>
>>>>>> The question was why do you limit that to 
>>>>>> QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
>>>>>> What is the reason for that limit, etc. If you think about it, The 
>>>>>> GENI
>>>>>> / I2C doesn't impose any limit on the number of messages processed in
>>>>>> one go (if I understand it correctly). Instead the limit comes 
>>>>>> from the
>>>>>> GPI DMA driver. As such, please don't add extra 'handling' to the I2C
>>>>>> driver. Make GPI DMA driver responsible for saying 'no more for now',
>>>>>> then I2C driver can setup add an interrupt flag and proceed with
>>>>>> submitting next messages, etc.
>>>>>>
>>>>>
>>>>> For I2C messages, we need to prepare TREs for Config, Go and DMAs. 
>>>>> However,
>>>>> if a large number of I2C messages are submitted then may may run 
>>>>> out of
>>>>> memory for serving the TREs. The GPI channel supports a maximum of 
>>>>> 64 TREs,
>>>>> which is insufficient to serve 32 or even 16 I2C messages 
>>>>> concurrently,
>>>>> given the multiple TREs required per message.
>>>>>
>>>>> To address this limitation, a strategy has been implemented to 
>>>>> manage how
>>>>> many messages can be queued and how memory is recycled. The constant
>>>>> QCOM_I2C_GPI_MAX_NUM_MSGS is set to 16, defining the upper limit of
>>>>> messages that can be queued at once. Additionally,
>>>>> QCOM_I2C_GPI_NUM_MSGS_PER_IRQ is set to 8, meaning that
>>>>> half of the queued messages are expected to be freed or deallocated 
>>>>> per
>>>>> interrupt.
>>>>> This approach ensures that the driver can efficiently manage TRE 
>>>>> resources
>>>>> and continue queuing new I2C messages without exhausting memory.
>>>>>> I really don't see a reason for additional complicated handling in 
>>>>>> the
>>>>>> geni driver that you've implemented. Maybe I misunderstand 
>>>>>> something. In
>>>>>> such a case it usually means that you have to explain the design 
>>>>>> in the
>>>>>> commit message / in-code comments.
>>>>>>
>>>>>
>>>>>
>>>>> The I2C Geni driver is designed to prepare and submit descriptors 
>>>>> to the GPI
>>>>> driver one message at a time.
>>>>> As a result, the GPI driver does not have visibility into the current
>>>>> message index or the total number of I2C messages in a transfer. 
>>>>> This lack
>>>>> of context makes it challenging to determine when to set the block 
>>>>> event
>>>>> interrupt, which is typically used to signal the completion of a 
>>>>> batch of
>>>>> messages.
>>>>>
>>>>> So, the responsibility for deciding when to set the BEI should lie 
>>>>> with the
>>>>> I2C driver.
>>>>>
>>>>> If this approach is acceptable, I will proceed with updating the 
>>>>> relevant
>>>>> details in the commit message.
>>>>>
>>>>> Please let me know if you have any concerns or suggestions.
>>>>
>>> Hi Dmitry, Sorry for the delayed response, and thank you for the
>>> suggestions.
>>>
>>>> - Make gpi_prep_slave_sg() return NULL if flags don't have
>>>>     DMA_PREP_INTERRUPT flag and there are no 3 empty TREs for the
>>>>     interrupt-enabled transfer.
>>> "there are no 3 empty TREs for the interrupt-enabled transfer."
>>> Could you please help me understand this a bit better?
>>
>> In the GPI driver you know how many TREs are available. In
>> gpi_prep_slave_sg() you can check that and return an error if there
>> are not enough TREs available.
>>
>>>>
>>>> - If I2C driver gets NULL from dmaengine_prep_slave_single(), retry
>>>>     again, adding DMA_PREP_INTERRUPT. Make sure that the last one 
>>>> always
>>>>     gets DMA_PREP_INTERRUPT.
>>> Does this mean we need to proceed to the next I2C message and ensure
>>> that the DMA_PREP_INTERRUPT flag is set for the last I2C message in each
>>> chunk? And then, should we submit the chunk of messages to the GSI
>>> hardware for processing?
>>
>> No. You don't have to peek at the next I2C message. This all concerns
>> the current I2C message. The only point where you have to worry is to
>> explicitly set the flag for the last message.
>>
>>>
>>>>
>>>> - In geni_i2c_gpi_xfer() split the loop to submit messages until you
>>>>     can, then call wait_for_completion_timeout() and then
>>>>     geni_i2c_gpi_unmap() for submitted messages, then continue with 
>>>> a new
>>>>     portion of messages.
>>> Since the GPI channel supports a maximum of 64 TREs, should we consider
>>> submitting a smaller number of predefined messages — perhaps fewer than
>>> 32, such as 16?
>>
>> Why? Just submit messages until they fit, then flush the DMA async 
>> channel.
>>
>>> This is because handling 32 messages would require one TRE for config
>>> and 64 TREs for the Go and DMA preparation steps, which exceeds the
>>> channel's TRE capacity of 64.
>>>
>>> We designed the approach to submit a portion of the messages — for
>>> example, 16 at a time. Once 8 messages are processed and freed, the
>>> hardware can continue processing the TREs, while the software
>>> simultaneously prepares the next set of TREs. This parallelism helps in
>>> efficiently utilizing the hardware and enhances overall system
>>> optimization.
>>
>>
>> And this overcomplicates the driver and introduces artificial
>> limitations which need explanation. Please fix it in a simple way
>> first. Then you can e.g. implement the watermark at the half of the
>> GPI channel depth and request DMA_PREP_INTERRUPT to be set in the
>> middle of the full sequence, allowing it to be used asynchronously in
>> the background.
>>
> 
> Okay, will review it. Thanks.
> 
> 

Hi Dmitry,

Can you please check and confirm the approach to follow is something 
like the pseudo code mentioned below:

GPI driver:
In gpi_prep_slave_sg() function,

if (!(flags & DMA_PREP_INTERRUPT) && !gpi_available_tres(chan))
	return NULL;


I2C GENI driver:

for (i = 0; i < num; i++)
{
    /* Always set interrupt for the last message */
    if (i == num_msgs - 1)
	flags |= DMA_PREP_INTERRUPT;


    desc = dmaengine_prep_slave_single(chan, dma_addr, len, dir, flags);
    if (!desc && !(flags & DMA_PREP_INTERRUPT)) {
	  /* Retry with interrupt if not enough TREs */
	  flags |= DMA_PREP_INTERRUPT;
	  desc = dmaengine_prep_slave_single(chan, dma_addr, len, dir,   flags);
    }


    if (!desc)
	break;
	

     dmaengine_submit(desc);
     msg_idx++;
}	

dma_async_issue_pending(chan));

time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
if (!time_left)
	return -ETIMEDOUT;

Now Invoke "geni_i2c_gpi_unmap" for unmapping all submitted I2C messages.


Thanks,
JyothiKumar



