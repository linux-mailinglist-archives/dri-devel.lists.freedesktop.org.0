Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8876AFCB59
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 15:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A76910E637;
	Tue,  8 Jul 2025 13:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pXwuuMym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8E210E637
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 13:05:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AATtA025473;
 Tue, 8 Jul 2025 13:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ruomlpVlZhIacYiD0ePUuK2du29Gndfd9nNiKKRvyyc=; b=pXwuuMymD7zR91xj
 ppbFN2R6VfSVBGDHtU/1mJ4kzwSHHcp2g51zrbx//R1w9tYWEz7A3D6+zartWHck
 RCua0Nqw8Nmm/4AtiiIKuUxGNq5CBrc7h5edBVujDGtStVlbuBrR+9D1ZAluSMFf
 yVUotgWskOMaipG950eFvG2Ab2ZUzuIF/Bdyt0dS2PJg1pIoX21dx0gJ/0/lNb+J
 /tCyisCipjZ3n5jLIe/hDcc8nIF3o40wbs6KMuercSr9NQ5LQkScQ8twuB9BxSKM
 oD/olgZ/3tuC6mrjk2ti/Kfgz7YoJ8292DzJMKCgjFHMs6ck68ie0l+OkFQ7MpGW
 IBPkdA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0wdbwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jul 2025 13:05:16 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 568D5FnV032597
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 8 Jul 2025 13:05:15 GMT
Received: from [10.239.29.49] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 8 Jul
 2025 06:05:11 -0700
Message-ID: <94f19455-dbcc-444d-9c5f-291f06682a77@quicinc.com>
Date: Tue, 8 Jul 2025 21:05:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Refactor domain ID to enforce
 strict mapping
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <quic_kuiw@quicinc.com>,
 <ekansh.gupta@oss.qualcomm.com>, <devicetree@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>
References: <20250702025341.1473332-1-quic_lxu5@quicinc.com>
 <20250702025341.1473332-4-quic_lxu5@quicinc.com>
 <56gevv7ripovymgclebnjdkxpfg3ppoosjxphkwqplef3hpikv@u5jua6hgxa34>
Content-Language: en-US
From: Ling Xu <quic_lxu5@quicinc.com>
In-Reply-To: <56gevv7ripovymgclebnjdkxpfg3ppoosjxphkwqplef3hpikv@u5jua6hgxa34>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 16nFtYuwCGKDV-tjsbLbbtKNOzpFz_U5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOCBTYWx0ZWRfX7SfyBHpwcpQa
 bXnLiMHs7KEA4Y1xETt17qu2CDgdZLu1QqOL/hjmT59YdT9gRdqMUzR0GkWc6PZ9j+xYy2L1dwi
 yrg0Qt7ri3WsrWSCzEa0vVL5ig+PDMrYyTNdsKw6Okg58veRFRMwz2AEr+M0s1y80H8E6FEHmRv
 +XryYOlZq4RRwggHbce/2AlAb0vemuFoxanevaAGDVykn9awuRWVkY7c6Jmvn9t03R2Wrz6wVTv
 dOhJBFZHCQWpHjliJIl4lKwCcl/tPrqc+6gW6dELIYZmj1zw1mOrkvTC+E7vaviFX9nM/+03TZ8
 7eO74TwVDxjOpwdztm2Mz2TTA1RRYpQeH0Ha3EKjEuWq1lOjuFfxnuoARtu1WIPphuwIz1ZS65o
 TZywL5KGep1+JJcji3tMHqXSAMvNaYucoTifflrkRYuvxRGgh7T/Nv77P6/49YTeiC96P9LJ
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686d178c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=oBII3UxN_x4qz-Jc6RUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 16nFtYuwCGKDV-tjsbLbbtKNOzpFz_U5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080108
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

在 7/5/2025 12:54 AM, Dmitry Baryshkov 写道:
> On Wed, Jul 02, 2025 at 08:23:40AM +0530, Ling Xu wrote:
>> Currently, domain ids are added for each instance, which is not scalable.
>> Strict domain IDs for domain.
> 
> What does this mean?

Currently the domain ids are added for each instance of domain,
like we defined 3 for cdsp and 4 for cdsp1, but driver doesn't care about
the instance id.Domain ids are strictly for a domain not each instance.

I will change the title and commit meassage as Srinis suggested in next patch.

misc: fastrpc: cleanup the domain names

Currently the domain ids are added for each instance of domain, this is
totally not scalable approach.

Clean this mess and create domain ids for only domains not its
instances.

> 
>>
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c      | 51 ++++++++++++++++---------------------
>>  include/uapi/misc/fastrpc.h |  2 +-
>>  2 files changed, 23 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 378923594f02..441f5851eb97 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -27,8 +27,7 @@
>>  #define MDSP_DOMAIN_ID (1)
>>  #define SDSP_DOMAIN_ID (2)
>>  #define CDSP_DOMAIN_ID (3)
>> -#define CDSP1_DOMAIN_ID (4)
>> -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>> +#define FASTRPC_DOMAIN_MAX    CDSP_DOMAIN_ID
> 
> Unused
will delete above line.
> 
>>  #define FASTRPC_MAX_SESSIONS	14
>>  #define FASTRPC_MAX_VMIDS	16
>>  #define FASTRPC_ALIGN		128
>> @@ -106,8 +105,6 @@
>>  
>>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>  
>> -static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>> -						"sdsp", "cdsp", "cdsp1" };
>>  struct fastrpc_phy_page {
>>  	u64 addr;		/* physical address */
>>  	u64 size;		/* size of contiguous region */
>> @@ -1723,7 +1720,6 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>  	uint32_t attribute_id = cap->attribute_id;
>>  	uint32_t *dsp_attributes;
>>  	unsigned long flags;
>> -	uint32_t domain = cap->domain;
>>  	int err;
>>  
>>  	spin_lock_irqsave(&cctx->lock, flags);
>> @@ -1741,7 +1737,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>  	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
>>  	if (err == DSP_UNSUPPORTED_API) {
>>  		dev_info(&cctx->rpdev->dev,
>> -			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
>> +			 "Warning: DSP capabilities not supported\n");
>>  		kfree(dsp_attributes);
>>  		return -EOPNOTSUPP;
>>  	} else if (err) {
>> @@ -1769,17 +1765,6 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>>  		return  -EFAULT;
>>  
>>  	cap.capability = 0;
>> -	if (cap.domain >= FASTRPC_DEV_MAX) {
>> -		dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
>> -			cap.domain, err);
>> -		return -ECHRNG;
>> -	}
>> -
>> -	/* Fastrpc Capablities does not support modem domain */
>> -	if (cap.domain == MDSP_DOMAIN_ID) {
>> -		dev_err(&fl->cctx->rpdev->dev, "Error: modem not supported %d\n", err);
>> -		return -ECHRNG;
>> -	}
>>  
>>  	if (cap.attribute_id >= FASTRPC_MAX_DSP_ATTRIBUTES) {
>>  		dev_err(&fl->cctx->rpdev->dev, "Error: invalid attribute: %d, err: %d\n",
>> @@ -2255,6 +2240,20 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
>>  	return err;
>>  }
>>  
>> +static int fastrpc_get_domain_id(const char *domain)
>> +{
>> +	if (!strncmp(domain, "adsp", 4))
>> +		return ADSP_DOMAIN_ID;
>> +	else if (!strncmp(domain, "cdsp", 4))
>> +		return CDSP_DOMAIN_ID;
>> +	else if (!strncmp(domain, "mdsp", 4))
>> +		return MDSP_DOMAIN_ID;
>> +	else if (!strncmp(domain, "sdsp", 4))
>> +		return SDSP_DOMAIN_ID;
>> +
>> +	return -EINVAL;
>> +}
>> +
>>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  {
>>  	struct device *rdev = &rpdev->dev;
>> @@ -2272,15 +2271,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  		return err;
>>  	}
>>  
>> -	for (i = 0; i < FASTRPC_DEV_MAX; i++) {
>> -		if (!strcmp(domains[i], domain)) {
>> -			domain_id = i;
>> -			break;
>> -		}
>> -	}
>> +	domain_id = fastrpc_get_domain_id(domain);
>>  
>>  	if (domain_id < 0) {
>> -		dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
>> +		dev_info(rdev, "FastRPC Domain %s not supported\n", domain);
>>  		return -EINVAL;
>>  	}
>>  
>> @@ -2330,21 +2324,20 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	case ADSP_DOMAIN_ID:
>>  	case MDSP_DOMAIN_ID:
>>  	case SDSP_DOMAIN_ID:
>> -		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
>> +		/* Unsigned PD offloading is only supported on CDSP */
>>  		data->unsigned_support = false;
>> -		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
>> +		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>>  		if (err)
>>  			goto err_free_data;
>>  		break;
>>  	case CDSP_DOMAIN_ID:
>> -	case CDSP1_DOMAIN_ID:
>>  		data->unsigned_support = true;
>>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>> -		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
>> +		err = fastrpc_device_register(rdev, data, true, domain);
>>  		if (err)
>>  			goto err_free_data;
>>  
>> -		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
>> +		err = fastrpc_device_register(rdev, data, false, domain);
>>  		if (err)
>>  			goto err_deregister_fdev;
>>  		break;
>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>> index f33d914d8f46..27b892b546f6 100644
>> --- a/include/uapi/misc/fastrpc.h
>> +++ b/include/uapi/misc/fastrpc.h
>> @@ -134,7 +134,7 @@ struct fastrpc_mem_unmap {
>>  };
>>  
>>  struct fastrpc_ioctl_capability {
>> -	__u32 domain;
>> +	__u32 domain; /* deprecated, ignored by the kernel */
> 
> reserved1 or unused
thanks
will change to _u32 unused;
> 
>>  	__u32 attribute_id;
>>  	__u32 capability;   /* dsp capability */
>>  	__u32 reserved[4];
>> -- 
>> 2.34.1
>>
> 

-- 
Thx and BRs,
Ling Xu

