Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7571A00D52
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 19:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37C210E00D;
	Fri,  3 Jan 2025 18:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="AUV485Ec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D192310E105;
 Fri,  3 Jan 2025 18:03:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503EVgEd025998;
 Fri, 3 Jan 2025 18:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 N7/5D35/YiRUtzZJZNQoO3O+kQHt8BXBpGZN/GDS5RM=; b=AUV485Ec23bB860H
 0pJw0mqqJT6LvY3fZn8JQ+Q0kobNs0lWyqjITZPecoKe78fwpMesAxb45/xJ26Po
 m2aFDpBY9QM+5Po5XaEjVgrhiyveJFh9I10R9exhOSYKfWaefDx0IsYTrQmBtsjP
 M6uny9U2efStUWyHQtAkmhqqy2vBGeUYgx5P85w9+lx/9naq5s6xTkKG9MtbkRIz
 d9E+eFMU4mDeZr3y2qWrD0mXyUTXxl5MWOu9YnMmP/V52O39gsF/jGtTPF9sB2Qx
 z+FaSMJBVPioWfz9+tynDJY42X5hhbG18/tB2rojOrFFVmEElo5qxriFe0UbxQTb
 V+CtEw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xhqy0d0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jan 2025 18:03:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503I3ct6021165
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Jan 2025 18:03:38 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 10:03:36 -0800
Message-ID: <4069bd6a-c37f-4dbe-bbd6-5b333ee54ad8@quicinc.com>
Date: Fri, 3 Jan 2025 10:03:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 15/25] drm/msm/dpu: Add CWB to msm_display_topology
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>
 <ki35rornnos35r3fzg5yyqzxnqua3dyfb6ewq2aefrh4u74vfi@opdnf44ntten>
Content-Language: en-US
In-Reply-To: <ki35rornnos35r3fzg5yyqzxnqua3dyfb6ewq2aefrh4u74vfi@opdnf44ntten>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: c2jBojO7fRrDkuPuG05TgCZTSfUldBrI
X-Proofpoint-ORIG-GUID: c2jBojO7fRrDkuPuG05TgCZTSfUldBrI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030159
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



On 12/19/2024 9:03 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 04:43:26PM -0800, Jessica Zhang wrote:
>> Add the cwb_enabled flag to msm_display topology and adjust the toplogy
>> to account for concurrent writeback
> 
> Why?

Hi Dmitry,

This flag is necessary to specify that CWB mux(es) need to be assigned 
for the given reqeusted topology.

> 
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h   |  2 ++
>>   3 files changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index b4bfded3d53025853cee112ca598533ece290318..b063c8fe4c0594772d84401fa56c9c21afc0ad18 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1198,6 +1198,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
>>   		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>>   					    &crtc_state->adjusted_mode);
>>   
>> +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
>> +
>>   	/*
>>   	 * Datapath topology selection
>>   	 *
>> @@ -1209,9 +1211,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
>>   	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>>   	 *
>>   	 * Add dspps to the reservation requirements if ctm is requested
>> +	 *
>> +	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
>> +	 * enabled. This is because in cases where CWB is enabled, num_intf will
>> +	 * count both the WB and real-time phys encoders.
>> +	 *
>> +	 * For non-DSC CWB usecases, have the num_lm be decided by the
>> +	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
>>   	 */
>>   
>> -	if (topology.num_intf == 2)
>> +	if (topology.num_intf == 2 && !topology.cwb_enabled)
>>   		topology.num_lm = 2;
>>   	else if (topology.num_dsc == 2)
>>   		topology.num_lm = 2;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index b763ef19f4c60ae8a35df6a6ffb19e8411bc63f8..85adaf256b2c705d2d7df378b6ffc0e578f52bc3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -382,8 +382,14 @@ static int _dpu_rm_reserve_ctls(
>>   	int i = 0, j, num_ctls;
>>   	bool needs_split_display;
>>   
>> -	/* each hw_intf needs its own hw_ctrl to program its control path */
>> -	num_ctls = top->num_intf;
>> +	/*
>> +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
>> +	 * control path. Hardcode num_ctls to 1 if CWB is enabled
>> +	 */
> 
> Why?

This is because num_intf is based on the number of phys_encs. Since in 
the CWB case, the WB and real-time encoders will be driven by the same 
CTL. I can add this to the comment doc.

Thanks,

Jessica Zhang

> 
>> +	if (top->cwb_enabled)
>> +		num_ctls = 1;
>> +	else
>> +		num_ctls = top->num_intf;
>>   
>>   	needs_split_display = _dpu_rm_needs_split_display(top);
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> index b061dfdab52e04ab7d777e912a30173273cb3db7..12db21a2403ec6930894c36a58e898c5d94c2568 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> @@ -46,6 +46,7 @@ struct dpu_rm {
>>    * @num_dspp:     number of dspp blocks used
>>    * @num_dsc:      number of Display Stream Compression (DSC) blocks used
>>    * @needs_cdm:    indicates whether cdm block is needed for this display topology
>> + * @cwb_enabled:  indicates whether CWB is enabled for this display topology
>>    */
>>   struct msm_display_topology {
>>   	u32 num_lm;
>> @@ -53,6 +54,7 @@ struct msm_display_topology {
>>   	u32 num_dspp;
>>   	u32 num_dsc;
>>   	bool needs_cdm;
>> +	bool cwb_enabled;
>>   };
>>   
>>   int dpu_rm_init(struct drm_device *dev,
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry

