Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888E37042BA
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 03:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DF110E2CA;
	Tue, 16 May 2023 01:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0A010E2CB;
 Tue, 16 May 2023 01:16:27 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34G1999e025157; Tue, 16 May 2023 01:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tHUeHBWVOJAsrOXY6KdpQSqU9/3eHh4UjM0dtkhYnAo=;
 b=dbZdDkb6DVGeqqq+sdGUhGlvoCFQfgXUNb2pdVPzZjdnnN0C4yzF5rI8/AwiZA9rRJBg
 8JRzW/sWUd9FkXBbmhJU8/p/QYs6Vn48ls4T72rg6cRXOtAOuAFmB5AkT5zlQgLtrLpb
 wqpSIID5uy3T2Y6h/fNFVnNvk7xBGZaCgurhRZERwGz11oVKGQ5n7PlqIx6PEEXNC15H
 YWqkXeb+QNIc7osAM7xzHPvgrw6bkX7gk9+RljuzaVx5N9OSgpXBw6KycZ/urKIaRdH8
 Kk/+uOTFW2R4myTTvcmccWUYVKD287VyV+WWs9J4ij4ug4sf6SB1N9nyrtB/jgWPqUrL +A== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qj3qw55qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 01:16:24 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34G1GOLJ024826
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 01:16:24 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 15 May
 2023 18:16:23 -0700
Message-ID: <8a321c11-17b1-157d-ccd0-d313b38d1cca@quicinc.com>
Date: Mon, 15 May 2023 18:16:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 4/8] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-4-4cb21168c227@quicinc.com>
 <kx3be4c2okye2ts4rzy4j4ltnveixf7v4rxp5v4tl2irvevg6t@c5tuelunmn4c>
 <0e8a8af5-5ab8-c1b9-e08d-909072cc9b76@quicinc.com>
 <4cbqbu47vcshskl4npyzos5r7gxipjbbzyfvdfx7fenfh4mzmx@jj6lrysp35du>
 <a5a56711-3607-407c-aa8f-aed39a41fb73@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <a5a56711-3607-407c-aa8f-aed39a41fb73@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZOj5-mJhooBc2i231yTSzdDhV4gRNcKo
X-Proofpoint-GUID: ZOj5-mJhooBc2i231yTSzdDhV4gRNcKo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_21,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=948 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305160008
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/15/2023 3:07 PM, Dmitry Baryshkov wrote:
> On 16/05/2023 01:01, Marijn Suijten wrote:
>> On 2023-05-15 13:29:21, Jessica Zhang wrote:
>> <snip>
>>>> Const, as requested elsewhere.  But this function is not used anywhere
>>>> in any of the series (because we replaced the usages with more sensible
>>>> member accesses like slice_chunk_size).
>>>
>>> Acked.
>>>
>>> I would prefer to keep this helper so that we have a way to easily get
>>> BPP information from the DRM DSC config in the future, but if you'd
>>> prefer we add this helper then, I'm also ok with that.
>>
>> The inverse helper is available ad DSC_BPP in drm_dsc_helper.c.  Perhaps
>> we can move the two variants to the header and define them uniformly?
>> This isn't MSM-specific it seems (i.e. the format supports fractional
>> bpp but no RC parameters appear to be defined for such a format yet).
> 
> I think DSC_BPP was removed (around v2 or v3 if I read changelog 
> correctly).

Hi Dmitry,

That's correct, we did have a DSC_BPP macro with the same functionality 
as msm_dsc_get_bpp_int, but it was renamed in v2 to msm_dsc_get_bpp_int 
(there's a typo in the changelog... I will correct that in the next 
revision).

However, I do see a DSC_BPP macro in drm_dsc_helper.c that has a 
different functionality.

Thanks,

Jessica Zhang

> 
> As for the fraction-point BPP, I think AMD supports .5 bpp granularity, 
> see drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h
> 
> -- 
> With best wishes
> Dmitry
> 
