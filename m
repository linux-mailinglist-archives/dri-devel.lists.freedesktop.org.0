Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF59E776712
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 20:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E5610E48B;
	Wed,  9 Aug 2023 18:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B0410E489
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 18:15:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 379F8act005806; Wed, 9 Aug 2023 18:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TdTJK7rXmdvom4IujR3FyQVvWCyDKaXZBuauVoQ6NAU=;
 b=fiOJ69Y3LbVUAxCdMFyXFMdoy7dgkk1tOlpPCPOiExlPAWbLuR6QDdYQ0YuHEgASHNoa
 XvA4NNlNscEzGTaiH1eTYI1JB7oynd/wrBrnZ1f/FaPNUuHIZVC6Q6HY6CVtrcsEWstN
 DImUPFEsEKUIHZ7tTPbTY/IX6HkoAuyUHVKXgdr34Ve8wVzzKtLY1Uj5KNrVX9kUvszC
 QQpUQD/A5eLWrJGKEvcQ+j8DELOH1YNy2vCJWfWntjllmvrayRuyuJ4JSvylI87wQKIw
 /vqlwIhfQf1NFDC4Xi5Dx7mk9J8ZG6ZYJGqkR2ldgaxfQDo6x1TgTVHmTEsP9oujEDgn +w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3scbd4gpvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Aug 2023 18:15:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 379IFVLA026746
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 9 Aug 2023 18:15:31 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 9 Aug
 2023 11:15:30 -0700
Message-ID: <3dd7ba0d-61d5-813f-6895-56e2943cb465@quicinc.com>
Date: Wed, 9 Aug 2023 12:15:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5] accel/qaic: tighten integer overflow checking in
 map_user_pages()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <e6cbc8a3-c2ae-46be-a731-494470c0a21c@moroto.mountain>
 <67e728b4-7d3f-447d-bbaa-2f69f65bb63e@kadam.mountain>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <67e728b4-7d3f-447d-bbaa-2f69f65bb63e@kadam.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rXp-Fn8L1kFksLKKSkADqc8ELJa3HSda
X-Proofpoint-ORIG-GUID: rXp-Fn8L1kFksLKKSkADqc8ELJa3HSda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_16,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308090160
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/7/2023 8:43 AM, Dan Carpenter wrote:
> On Mon, Aug 07, 2023 at 05:09:34PM +0300, Dan Carpenter wrote:
>> The encode_dma() function has some validation on in_trans->size but it's
>> not complete and it would be more clear to move those checks to
>> find_and_map_user_pages().
>>
>> The encode_dma() had two checks:
>>
>> 	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
>> 		return -EINVAL;
>>
>> It's not sufficeint to just check if in_trans->size is zero.  The

sufficient

>> resources->xferred_dma_size variable represent the number of bytes
>> already transferred.  If we have already transferred more bytes than
>> in_trans->size then there are negative bytes remaining which doesn't
>> make sense.  Check for that as well.
>>
>> I introduced a new variable "remaining" which represents the amount

introduce (commit text should be present tense per my understanding)

>> we want to transfer (in_trans->size) minus the ammount we have already

amount

>> transferred (resources->xferred_dma_size).
>>
>> The check in encode_dma() checked that "addr + size" could not overflow
>> however we may already have transferred some bytes so the real starting
>> address is "xfer_start_addr" so check that "xfer_start_addr + size"
>> cannot overflow instead.  Also check that "addr +
>> resources->xferred_dma_size cannot overflow.
>>
>> My other concern was that we are dealing with u64 values but on 32bit
>> systems the kmalloc() function will truncate the sizes to 32 bits.  So
>> I calculated "total = in_trans->size + offset_in_page(xfer_start_addr);"
>> and returned -EINVAL if it were >= SIZE_MAX.  This will not affect 64bit
>> systems.
>>
>> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>> This is re-write re-write of the previous version.
>>
>> I am not necessarily sure it is correct.  Please review carefully.  In
>> particular, please check how "total" is calculated.  Maybe it would make
>> more sense to write that as:
>>
>> 	total = remaining + offset_in_page(xfer_start_addr);

I think this makes more sense.

>>
>> The other question I had is should we add a check:
>>
>> 	if (remaining == 0)
>> 		return 0;

I don't see why adding this would hurt anything.  I don't believe it is 
necessary.  Remaining is a function of of the driver code and not an 
external input.  The driver transfers as much as it can, and stops when 
everything is sent (remaining == 0).  If we hit this check, it is a 
driver bug.

>>
>>   drivers/accel/qaic/qaic_control.c | 23 +++++++++++++++--------
>>   1 file changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
>> index cfbc92da426f..d64505bcf4ae 100644
>> --- a/drivers/accel/qaic/qaic_control.c
>> +++ b/drivers/accel/qaic/qaic_control.c
>> @@ -392,18 +392,28 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
>>   				   struct qaic_manage_trans_dma_xfer *in_trans,
>>   				   struct ioctl_resources *resources, struct dma_xfer *xfer)
>>   {
>> +	u64 xfer_start_addr, remaining, end, total;
>>   	unsigned long need_pages;
>>   	struct page **page_list;
>>   	unsigned long nr_pages;
>>   	struct sg_table *sgt;
>> -	u64 xfer_start_addr;
>>   	int ret;
>>   	int i;
>>   
>> -	xfer_start_addr = in_trans->addr + resources->xferred_dma_size;
>> +	if (check_add_overflow(in_trans->addr, resources->xferred_dma_size, &xfer_start_addr))
>> +		return -EINVAL;
>> +
>> +	if (in_trans->size == 0 ||
>> +	    in_trans->size < resources->xferred_dma_size ||
>> +	    check_add_overflow(xfer_start_addr, in_trans->size, &end))
>                                                  ^^^^^^^^^^^^^^
> This should be remaining.  So maybe it should be something like this
> with a return 0 for no bytes remaining and total calculated differently.

Yep, should be remaining.  Your below proposed version looks good to me.

> 
> 	if (check_add_overflow(in_trans->addr, resources->xferred_dma_size, &xfer_start_addr))
> 		return -EINVAL;
> 
> 	if (in_trans->size < resources->xferred_dma_size)
> 		return -EINVAL;

This check should never hit unless we have a driver bug.  I don't object 
to having it though.

> 	remaining = in_trans->size - resources->xferred_dma_size;
> 	if (remaining == 0)
> 		return 0;
> 
> 	if (check_add_overflow(xfer_start_addr, remaining, &end))
> 		return -EINVAL;
> 
> 	/* Still not really sure why total is calculated this way */

Physical memory layout.

Lets say remaining is 4k, and PAGE_SIZE is 4k.

4k / 4k = 1 so we need 1 page.

Except, if that 4k remaining is some remainder of the transfer and not 
the complete transfer, then where we start the transfer matters.

If the remaining 4k starts right at a page boundary, then we just need a 
single page.  However, if the remaining 4k starts X bytes into a page 
(where X is non-zero), we would actually be transferring data from two 
physical pages, even though 4k can be fully represented by one page.

This representation might make a bit more sense (although I argue it is 
wrong) -

total = remaining;
need_pages = DIV_ROUND_UP(total, PAGE_SIZE);
if (offset_in_page(xfer_state_addr))
	need_pages++;

Where this breaks down is when the start addr and the remaining combine 
to fit into a page.

Assume remaining == 5k and PAGE_SIZE == 4k.  offset_in_page() is going 
to return 1k.

The right answer is 2 pages.  The first page will contain 3k (4k - 1k 
from the offset) and the second page will contain 2k.

DIV_ROUND_UP(remaining, PAGE_SIZE) == 5k / 4k == 2

DIV_ROUND_UP(remaining + offset_in_page(), PAGE_SIZE) == (5k + 1k) / 4k == 2

Seems like we need a comment explaining this.

> 	total = remaining + offset_in_page(xfer_start_addr);
> 	if (total >= SIZE_MAX)
> 		return -EINVAL;
> 
> 	need_pages = DIV_ROUND_UP(total, PAGE_SIZE);
> 
> regards,
> dan carpenter
> 
>> +		return -EINVAL;
>>   
>> -	need_pages = DIV_ROUND_UP(in_trans->size + offset_in_page(xfer_start_addr) -
>> -				  resources->xferred_dma_size, PAGE_SIZE);
>> +	remaining = in_trans->size - resources->xferred_dma_size;
>> +	total = in_trans->size + offset_in_page(xfer_start_addr);
>> +	if (total >= SIZE_MAX)
>> +		return -EINVAL;
>> +
>> +	need_pages = DIV_ROUND_UP(total - resources->xferred_dma_size, PAGE_SIZE);
>>   
>>   	nr_pages = need_pages;
>>   
>> @@ -435,7 +445,7 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
>>   
>>   	ret = sg_alloc_table_from_pages(sgt, page_list, nr_pages,
>>   					offset_in_page(xfer_start_addr),
>> -					in_trans->size - resources->xferred_dma_size, GFP_KERNEL);
>> +					remaining, GFP_KERNEL);
>>   	if (ret) {
>>   		ret = -ENOMEM;
>>   		goto free_sgt;
>> @@ -566,9 +576,6 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
>>   	    QAIC_MANAGE_EXT_MSG_LENGTH)
>>   		return -ENOMEM;
>>   
>> -	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
>> -		return -EINVAL;
>> -
>>   	xfer = kmalloc(sizeof(*xfer), GFP_KERNEL);
>>   	if (!xfer)
>>   		return -ENOMEM;
>> -- 
>> 2.39.2

