Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DFA9F3E53
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 00:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA5410E7E3;
	Mon, 16 Dec 2024 23:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="I4jue2O+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A3610E138;
 Mon, 16 Dec 2024 23:38:49 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGFJHQa024350;
 Mon, 16 Dec 2024 23:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 awUZAAJrubDdbvCr3xCdap3tPFqFiQ6lFEbBtWcy8m0=; b=I4jue2O+rLacI51j
 QWfouo0vglN8lXSfv8N5yzsFGFNs4X/ZQzgDsK0zQ43wGOz9RvWJJudStdZeHOTw
 I4iGH4NAaXETeMUvoabFOivUeP5aX7pATbEWYGz2iEBEzLqmN1QlNj7jaywTM0a6
 o/kd8XY+gtjDJ+QnO/dXqadjSIjQG6mNZE980hM3kcsPGFNPx7MzOyCasQKoOn94
 j5J/l5r85hswfS+9JhKUnnzSKxgdk+flM2NoYHELH9cTOgUW7gQ0UheSo0sXL8L5
 85rKS+Hbxl6ssGRk8pRoOl5IdrY48aWhVnae7hDWqZxkmoi+PHWQtnHhvn/4KB2f
 H3mIsw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jpqmh3tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 23:38:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGNcjDh008005
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 23:38:45 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 15:38:44 -0800
Message-ID: <571e6fd5-11bc-40f7-9b82-48a045c7447a@quicinc.com>
Date: Mon, 16 Dec 2024 15:38:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/16] drm/msm/dp: split MMSS_DP_DSC_DTO register write
 to a separate function
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-6-f8d1961cf22f@linaro.org>
 <9fb5986b-f375-4300-b50c-92bb9c0b4399@quicinc.com>
 <6nt7cacoik4nxbjpgpidmovzilxf7q2gld64ch2p7ltatkzl4p@sg4ltm7jt47c>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <6nt7cacoik4nxbjpgpidmovzilxf7q2gld64ch2p7ltatkzl4p@sg4ltm7jt47c>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gS45qxIVQ7KGAqsV07jaPV8JgNulEVqx
X-Proofpoint-GUID: gS45qxIVQ7KGAqsV07jaPV8JgNulEVqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=964
 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160193
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



On 12/16/2024 2:24 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 11:46:21AM -0800, Abhinav Kumar wrote:
>>
>>
>> On 12/15/2024 2:44 PM, Dmitry Baryshkov wrote:
>>> It's the dp_panel's duty to clear the MMSS_DP_DSC_DTO register. Once DP
>>> driver gets DSC support, it will handle that register in other places
>>> too. Split a call to write 0x0 to that register to a separate function.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 8 ++++++++
>>>    drivers/gpu/drm/msm/dp/dp_catalog.h | 2 ++
>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    | 2 ++
>>>    3 files changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
>>> index 7b7eadb2f83b169d8df27ee93589abe05b38f3ae..354ec834f9357c4797fc08a4532e69acc67b4317 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>>> @@ -1039,6 +1039,14 @@ void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
>>>    	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
>>>    }
>>> +void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog)
>>> +{
>>> +	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
>>> +				struct msm_dp_catalog_private, msm_dp_catalog);
>>> +
>>> +	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
>>> +}
>>
>> This is already done msm_dp_catalog_ctrl_config_msa(), this is either a
>> duplicate or redundant.
>>
>> void msm_dp_catalog_ctrl_config_msa(..........)
>> {
>> 	**********
>>          msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
>>          msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
>> }
> 
> The chunk to remove it got squashed into a different patch.
> 

hmm, if you would indeed like it to be a separate API , the removal from 
the above chunk should go together in the same patch otherwise it looks 
redundant.

>>
>>> +
>>>    static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
>>>    {
>>>    	struct resource *res;
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
>>> index 6678b0ac9a67881244884d59487fa288d33d1be7..08bb42e91b779633875dbeb4130bc55a6571cfb1 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
>>> @@ -92,6 +92,8 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
>>>    				struct drm_display_mode *drm_mode);
>>>    void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
>>> +void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog);
>>> +
>>>    struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
>>>    /* DP Audio APIs */
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> index 9c463ae2f8fae916661fef1c7e225f55c1026478..b9c461fee96f8fae9259ce03a32e1155b42d17bb 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> @@ -2011,6 +2011,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
>>>    		pixel_rate_orig,
>>>    		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
>>> +	msm_dp_catalog_panel_clear_dsc_dto(ctrl->catalog);
>>> +
>>>    	msm_dp_ctrl_setup_tr_unit(ctrl);
>>>    	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
>>>
> 
