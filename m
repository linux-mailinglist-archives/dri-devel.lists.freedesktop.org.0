Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB159B2C00
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDD910E453;
	Mon, 28 Oct 2024 09:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iS3C3XX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316F010E454;
 Mon, 28 Oct 2024 09:52:53 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RMuLuk022812;
 Mon, 28 Oct 2024 09:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UkTxf4gaD036X0C6z7xJty9Jiq0rYK5X0z2wJjj4Rhs=; b=iS3C3XX8BTpl06zk
 0o5qPYFsIRWeMvJp2fGsw24Za5j+LO3Y3y8t0BQGsJ/gAFZl/sQqHo4/vLW8gUYB
 pAGev9niTlTnBNuhe3EkDr1nRCS+MyT03owpE2QGVAgCytyugPLxUFVZ1ntnr3JP
 2axj+zGnYwfDZ/XqG94yAzTH2QNsV5Q5/50HsAzRLpxby4ErA+BSxGOtL27dq05M
 GC1Af5fxrtA05YsLzgYvpJxzgpDy9WYXjP+KNcDn+c1BEvihwl3YN9POzBQuAgcY
 Qvy4UvqjkLaGpe3bT2ywBlLt2iLgJcMPeV3Xpdy+q+yoXsoH1raFfo4LQvcA835h
 y3Fk+Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqe5vd7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2024 09:52:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S9qg0d025032
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2024 09:52:42 GMT
Received: from [10.216.3.65] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 02:52:37 -0700
Message-ID: <6b7c2ae7-3210-4d57-a7b0-2efea594b2b9@quicinc.com>
Date: Mon, 28 Oct 2024 15:22:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
To: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>, "Sean
 Paul" <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Dave Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <3fb376b3-2db7-4730-a2e1-958f1ddd9f5c@app.fastmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <3fb376b3-2db7-4730-a2e1-958f1ddd9f5c@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RLGzJP7jIKKYA0-T9wAJAa24yIyjvz53
X-Proofpoint-ORIG-GUID: RLGzJP7jIKKYA0-T9wAJAa24yIyjvz53
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280080
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

On 10/28/2024 12:13 AM, Arnd Bergmann wrote:
> On Sun, Oct 27, 2024, at 18:05, Akhil P Oommen wrote:
>> Clang-19 and above sometimes end up with multiple copies of the large
>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
>> fill the structure, but these create another copy of the structure on
>> the stack which gets copied to the first.
>>
>> If the functions get inlined, that busts the warning limit:
>>
>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size 
>> (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' 
>> [-Werror,-Wframe-larger-than]
>>
>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
>> the stack. Also, use this opportunity to skip re-initializing this table
>> to optimize gpu wake up latency.
>>
>> Cc: Arnd Bergmann <arnd@kernel.org>
> 
> Please change this to "Reported-by:"

Sure.

> 
> The patch looks correct to me, just one idea for improvement.
> 
>> b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> index 94b6c5cab6f4..b4a79f88ccf4 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
>>  	struct completion pd_gate;
>>
>>  	struct qmp *qmp;
>> +	struct a6xx_hfi_msg_bw_table *bw_table;
>>  };
> 
> I think the bw_table is better just embedded
> in here rather than referenced as a pointer:
> 
There are some low tier chipsets with relatively lower RAM size that
doesn't require this table. So, dynamically allocating this here helps
to save 640 bytes (minus the overhead of tracking).

-Akhil

>> +	if (gmu->bw_table)
>> +		goto send;
>> +
>> +	msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
>> +	if (!msg)
>> +		return -ENOMEM;
> 
> It looked like it's always allocated here when the device
> is up, so you can avoid the extra overhead for keeping
> track of the allocation.
> 
>       Arnd

