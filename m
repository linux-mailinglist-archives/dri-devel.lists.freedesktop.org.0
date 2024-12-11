Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F14139EDA17
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C262710E169;
	Wed, 11 Dec 2024 22:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="FsCDDLrl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66BF10E169;
 Wed, 11 Dec 2024 22:38:15 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD9So027303;
 Wed, 11 Dec 2024 22:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z2C7/fCtt5pTk0XOcT922hfBtdgDzW72cIzpyOZ/pDQ=; b=FsCDDLrlecHyhAW3
 KyM1GjKYg0G2WSIri5NS1Jtxcy0g2jNItQ4hKN6OLoGRejx52ZnrK5zgjm6pPk9o
 ZSyJhki4ahs+4iHDfDTGKQUNsqbOGktGJUmLG5Sta4jOfcStqrBu0pVSAUdQQK00
 PxdilWh4ktFI09EIliHMdqq1U7ZlMwyS2w+Px9HIEmEOdOnoRwh3Hwu1IjQTrx/Q
 5kzVvNSg7JF9BqvRZZ7iSnSm+L1dQTaNBRwqzp2jYP6Oxbqi2K8WO2CJFGi+oiCs
 Z1DkkAttAt9bQSfSJRcB3q+SZhxve08X4gEKhl1TBCY1To8L+5CGEnDCeZ4wtIpX
 Zj9+Wg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43etn8v9w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 22:38:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBMcCYu008305
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 22:38:12 GMT
Received: from [10.110.5.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 14:38:10 -0800
Message-ID: <cfbadc5a-6de0-4081-948c-3542c615a992@quicinc.com>
Date: Wed, 11 Dec 2024 14:38:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241130-dpu-virtual-wide-v7-0-991053fcf63c@linaro.org>
 <20241130-dpu-virtual-wide-v7-2-991053fcf63c@linaro.org>
 <160151f0-9cc6-40f6-9f53-466185835e4d@quicinc.com>
 <hpmxj7tjmvbo55izoxgygqmysbabnpb35mprvn6w53vbtehnwe@yxmiigoeuyf3>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <hpmxj7tjmvbo55izoxgygqmysbabnpb35mprvn6w53vbtehnwe@yxmiigoeuyf3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 1Ceqt1n_9QUXArHlCDcs3zamBR8BFko0
X-Proofpoint-GUID: 1Ceqt1n_9QUXArHlCDcs3zamBR8BFko0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=946 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110158
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



On 12/11/2024 2:24 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 11, 2024 at 01:51:51PM -0800, Abhinav Kumar wrote:
>>
>>
>> On 11/29/2024 5:55 PM, Dmitry Baryshkov wrote:
>>> Virtual wide planes give high amount of flexibility, but it is not
>>> always enough:
>>>
>>> In parallel multirect case only the half of the usual width is supported
>>> for tiled formats. Thus the whole width of two tiled multirect
>>> rectangles can not be greater than max_linewidth, which is not enough
>>> for some platforms/compositors.
>>>
>>> Another example is as simple as wide YUV plane. YUV planes can not use
>>> multirect, so currently they are limited to max_linewidth too.
>>>
>>> Now that the planes are fully virtualized, add support for allocating
>>> two SSPP blocks to drive a single DRM plane. This fixes both mentioned
>>> cases and allows all planes to go up to 2*max_linewidth (at the cost of
>>> making some of the planes unavailable to the user).
>>>
>>
>> Overall looks so much cleaner after unification!
>>
>> One small nit below,
>>
>>
>> You can still have,
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Note: we have started testing this series with sc7180 CrOS, and will report
>> our findings/ give tested-by this week.
>>
>>
>> <snip>
>>
>>> +static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dpu_sw_pipe_cfg *pipe_cfg,
>>> +					     struct dpu_sw_pipe *r_pipe, struct dpu_sw_pipe_cfg *r_pipe_cfg,
>>> +					     struct dpu_hw_sspp *sspp, const struct msm_format *fmt,
>>> +					     uint32_t max_linewidth)
>>> +{
>>> +	r_pipe->sspp = NULL;
>>> +
>>> +	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>> +	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> +
>>> +	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>> +	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> +
>>
>>
>> There are two places where the multirect_index and multirect_mode are reset.
>> Would it be better to just have a small api dpu_plane_reset_multirect() and
>> do this there?
> 
> I'm not sure, what's the benefit. We can add an API to reset one pipe
> (to also be able to use it in _dpu_plane_atomic_disable()), but then
> it's just deduplication for the sake of deduplication.
> 

Yeah I was thinking something like

dpu_plane_reset_multirect(pipe);
dpu_plane_reset_multirect(r_pipe);

But its only a minor benefit, hence as I wrote it as a nit. We can keep 
things as it is, if its unnecessary in your opinion.


> 
