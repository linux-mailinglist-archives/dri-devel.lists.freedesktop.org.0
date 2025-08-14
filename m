Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC858B25EA1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 10:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E880C10E2A0;
	Thu, 14 Aug 2025 08:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fzdUpndw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C01810E2A0;
 Thu, 14 Aug 2025 08:23:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMxFWo023986;
 Thu, 14 Aug 2025 08:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 21u6GHncD1qmZgE3QDHrS+U+JosoC2ENVBFuXbIqbs0=; b=fzdUpndwgPHJxNqw
 /upag5MfItrA8otjChTYrHZmwvJt/AxU2sbrm+amrmWuTQsXxjoVWqQhWdoYWWCS
 O0lbVZwEjkOSotkrsGIHdrmp8QwX08ajo2wgIHKPrl+b2Gq5UP2deb0G2wXYgm/w
 okl66xRfIDBaqmSMFurG7kCeol2H9/hNotMHimrOq5PMJgHe7+yFW7v7X6/uFBPj
 tZPP+l1/CJBxENC2enYo76ivf6PhBZe6mQLY28RdjoqFdcftM+BD3DtzqCXfsEKA
 KfMncMlnaOYCxtaTbRjNSra8p2N5OkmA1/wmf1k3Xlfgbd1manvrlv87wB6Gw+v4
 dtkxfg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9ruk2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Aug 2025 08:22:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57E8Mqtv028839
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Aug 2025 08:22:52 GMT
Received: from [10.133.33.43] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 01:22:47 -0700
Message-ID: <e3b5721d-cf37-4b35-9851-5e822fa16c09@quicinc.com>
Date: Thu, 14 Aug 2025 16:22:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/38] drm/msm/dp: skip reading the EDID for MST cases
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-26-a54d8902a23d@quicinc.com>
 <lusd35wv2pj5sy6mdiw7axqxnei2wqo57pf6ju5ys2ibfrkidu@63lkbckuu2n6>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <lusd35wv2pj5sy6mdiw7axqxnei2wqo57pf6ju5ys2ibfrkidu@63lkbckuu2n6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfXz0R48Ozax+dY
 YeUVoGep7qlHG84sm/Y+fX22S3bxTTpET41A3br5EZ+on/hF1dBKlsYxdXApN1AZ00T3qobecFN
 Jb3BPp/XqRFlaaO6dKL23ljz6ye8YzLqCmFcdcksJtfjj8XSFuk8ZmwzCi2iIZ3nKQUe/8Yuwqo
 pSLOEx+YP5IFjc/zIU3UPDCxJVH/fjI4zQhNvhX6T+m9Cht9ynUNM5bNtAPWiofuRuqZslw5FYJ
 pRHbD10EjBmcK8JxQe22rNruwOj1nEFaKXcjyeFJ1DF0P10cS0ILmmTqoFV2W1H63h84vP39hhp
 4QrOqrEL+rjppMW6GwIlUaqUJ4cQqvkdtQTjpS3gkxVXGK3mJhc1B9Q7Yuxnp60RAJM3rg2/UD4
 bK0peKeN
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689d9cdc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=iVGnFgL3FlcK6foRaNUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rzjTHFpEi3Ufbeh180Q_9_FpJu5CfPRI
X-Proofpoint-GUID: rzjTHFpEi3Ufbeh180Q_9_FpJu5CfPRI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094
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



On 2025/6/9 23:58, Dmitry Baryshkov wrote:
> On Mon, Jun 09, 2025 at 08:21:45PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> For MST cases, EDID is handled through AUX sideband messaging.
>> Skip the EDID read during hotplug handle for MST cases.
> 
> Why? It makes sense to read it during the HPD processing, ping HDMI
> codec, update CEC info, etc.
> 
For MST case to read EDID. we will use drm_dp_mst_edid_read when MST 
connetors .get_modes() called.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 88cae0ca66015377e59bee757462edeae5ae91bf..b1b025d1d356046f8f9e3d243fc774185df24318 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -438,9 +438,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	if (rc)
>>   		goto end;
>>   
>> -	rc = msm_dp_panel_read_edid(dp->panel, connector);
>> -	if (rc)
>> -		goto end;
>> +	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
>> +		rc = msm_dp_panel_read_edid(dp->panel, connector);
>> +		if (rc)
>> +			goto end;
>> +	}
>>   
>>   	msm_dp_link_process_request(dp->link);
>>   
>>
>> -- 
>> 2.34.1
>>
> 

