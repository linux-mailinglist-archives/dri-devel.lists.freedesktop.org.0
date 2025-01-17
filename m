Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9BAA1541E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D1E10E155;
	Fri, 17 Jan 2025 16:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CnX6rcDG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC73310E155
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:21:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HA2Wpf008653;
 Fri, 17 Jan 2025 16:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KzCeRgTXHGvUFFgvDT5AjmVOYYrqf1bwBxKOOnxZkSw=; b=CnX6rcDGbxfchv0q
 vyXFDZ2eDwrdeQW5cYWxecb0DObKf0z/O5qqwwakmcmx4qiHOwxXDqfqlrUEK3KW
 8pmG+tOQ3NdBygbepsEwmlu4B20nshboRnGEy0GaA3de83OOQtEeTUntcQLcyL16
 JBnrt1Aq/z8PLwD1EYkIygECo96kxqLUs9mwLeY15ZFUvJfGX9MDL2mx/x3xsM5/
 XIfxhVnDC0/s4rOZ6gc2HvRxRa1WcPT1pIUqtChsDMwNkhFpy4eY8B7IR/daVzDk
 ZtWP+SuTWieBNBwiIAOCXxmnz8smj/mt2GFduudDkpoKxXnCbyliwdP2nSuXdze4
 P+Gnlg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447n3vrxcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2025 16:21:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50HGLKRF029381
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2025 16:21:20 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 Jan
 2025 08:21:19 -0800
Message-ID: <9c29c3cf-d3b4-1832-960a-a72d003b71d5@quicinc.com>
Date: Fri, 17 Jan 2025 09:21:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/7] bus: mhi: host: Refactor BHI/BHIe based firmware
 loading
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <quic_carlv@quicinc.com>, <quic_yabdulra@quicinc.com>,
 <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>,
 <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
 <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-2-quic_jhugo@quicinc.com>
 <20250108052416.cqfoxzvw42me2kub@thinkpad>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250108052416.cqfoxzvw42me2kub@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: abYdJTg5IAC6fkAUS9BM4oHhMb-vAhsD
X-Proofpoint-ORIG-GUID: abYdJTg5IAC6fkAUS9BM4oHhMb-vAhsD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501170129
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

On 1/7/2025 10:24 PM, Manivannan Sadhasivam wrote:
> On Fri, Dec 13, 2024 at 02:33:34PM -0700, Jeffrey Hugo wrote:
>> From: Matthew Leung <quic_mattleun@quicinc.com>
>>
>> Refactor the firmware loading code to have distinct helper functions for
>> BHI and BHIe operations. This lays the foundation for separating the
>> firmware loading protocol from the firmware being loaded and the EE it
>> is loaded in.
>>
>> Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
>> Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
>> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> ---
>>   drivers/bus/mhi/host/boot.c | 155 +++++++++++++++++++++++++-----------
>>   1 file changed, 110 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>> index e8c92972f9df..e3f3c07166ad 100644
>> --- a/drivers/bus/mhi/host/boot.c
>> +++ b/drivers/bus/mhi/host/boot.c
>> @@ -177,6 +177,37 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
>>   }
>>   EXPORT_SYMBOL_GPL(mhi_download_rddm_image);
>>   
>> +static inline void mhi_fw_load_error_dump(struct mhi_controller *mhi_cntrl)
> 
> No need to add 'inline' keyword in c files. You can trust the compiler.

Done.

> 
>> +{
>> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
>> +	void __iomem *base = mhi_cntrl->bhi;
>> +	int ret;
>> +	u32 val;
>> +	int i;
> 
> int ret, i?

Done.

> 
>> +	struct {
>> +		char *name;
>> +		u32 offset;
>> +	} error_reg[] = {
>> +		{ "ERROR_CODE", BHI_ERRCODE },
>> +		{ "ERROR_DBG1", BHI_ERRDBG1 },
>> +		{ "ERROR_DBG2", BHI_ERRDBG2 },
>> +		{ "ERROR_DBG3", BHI_ERRDBG3 },
>> +		{ NULL },
>> +	};
>> +
>> +	read_lock_bh(pm_lock);
>> +	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
>> +		for (i = 0; error_reg[i].name; i++) {
>> +			ret = mhi_read_reg(mhi_cntrl, base, error_reg[i].offset, &val);
>> +			if (ret)
>> +				break;
>> +			dev_err(dev, "Reg: %s value: 0x%x\n", error_reg[i].name, val);
>> +		}
>> +	}
>> +	read_unlock_bh(pm_lock);
>> +}
>> +
> 
> [...]
> 
>> +static int mhi_alloc_bhi_buffer(struct mhi_controller *mhi_cntrl,
>> +				struct image_info **image_info,
>> +				size_t alloc_size)
>> +{
>> +	struct image_info *img_info;
>> +	struct mhi_buf *mhi_buf;
>> +	int segments = 1;
>> +
>> +	img_info = kzalloc(sizeof(*img_info), GFP_KERNEL);
>> +	if (!img_info)
>> +		return -ENOMEM;
>> +
>> +	/* Allocate memory for entry */
>> +	img_info->mhi_buf = kcalloc(segments, sizeof(*img_info->mhi_buf),
>> +				    GFP_KERNEL);
> 
> Why do you need kcalloc for only 1 segment?

Symmetry with mhi_alloc_bhie_table().  Will change.

> 
>> +	if (!img_info->mhi_buf)
>> +		goto error_alloc_mhi_buf;
>> +
>> +	/* Allocate and populate vector table */
>> +	mhi_buf = img_info->mhi_buf;
>> +
>> +	mhi_buf->len = alloc_size;
>> +	mhi_buf->buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
>> +					  &mhi_buf->dma_addr, GFP_KERNEL);
>> +	if (!mhi_buf->buf)
>> +		goto error_alloc_segment;
>> +
>> +	img_info->bhi_vec = NULL;
>> +	img_info->entries = segments;
>> +	*image_info = img_info;
>> +
>> +	return 0;
>> +
>> +error_alloc_segment:
>> +	kfree(mhi_buf);
>> +error_alloc_mhi_buf:
>> +	kfree(img_info);
>> +
>> +	return -ENOMEM;
>> +}
>> +
>>   int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>>   			 struct image_info **image_info,
>>   			 size_t alloc_size)
>> @@ -364,9 +422,18 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>>   	return -ENOMEM;
>>   }
>>   
>> -static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
>> -			      const u8 *buf, size_t remainder,
>> -			      struct image_info *img_info)
>> +static void mhi_firmware_copy_bhi(struct mhi_controller *mhi_cntrl,
>> +				  const u8 *buf, size_t size,
>> +				  struct image_info *img_info)
>> +{
>> +	struct mhi_buf *mhi_buf = img_info->mhi_buf;
>> +
>> +	memcpy(mhi_buf->buf, buf, size);
>> +}
>> +
>> +static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
>> +				   const u8 *buf, size_t remainder,
>> +				   struct image_info *img_info)
>>   {
>>   	size_t to_cpy;
>>   	struct mhi_buf *mhi_buf = img_info->mhi_buf;
>> @@ -390,10 +457,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>>   	const struct firmware *firmware = NULL;
>>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>   	enum mhi_pm_state new_state;
>> +	struct image_info *image;
>>   	const char *fw_name;
>>   	const u8 *fw_data;
>> -	void *buf;
>> -	dma_addr_t dma_addr;
>>   	size_t size, fw_sz;
>>   	int ret;
>>   
>> @@ -452,17 +518,16 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>>   	fw_sz = firmware->size;
>>   
>>   skip_req_fw:
>> -	buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
>> -				 GFP_KERNEL);
>> -	if (!buf) {
>> +	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
>> +	if (ret) {
>>   		release_firmware(firmware);
>>   		goto error_fw_load;
>>   	}
>> +	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);
> 
> Why can't you directly use memcpy here? I know what you want to keep symmetry
> with mhi_firmware_copy_bhie(), but it seems unnecessary to me.
> 
> Adding a comment like "Load the firmware into BHI vec table" is enough.

Just symmetry.  Jarek had the same comment.  Will inline.

