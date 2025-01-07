Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA945A04BE4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 22:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB6310E247;
	Tue,  7 Jan 2025 21:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UCka17hn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD5610E247
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 21:43:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507J7ade014628;
 Tue, 7 Jan 2025 21:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VChI5pOqP4eUNaUP9+5BPWB/7jKXUwpN4TmSBo6DvyA=; b=UCka17hnFMRkJupg
 xDLYmqJ5SDnXJ1b4ozMi0/fgDSaJBoka6TBHOX2PGypz+DYIJdPWQHMjIFsEfjUz
 DHt/IiDmOtye//KZkl1ceTcoWDkg+jUWcXjca3h/j/igtKMftJHwOYRyrCsI5T2L
 GFCm+Vkvs0qRTbyM8e6W4qhJFB1xuaPKcd8VZyd7EZd9Abj5OD67rAbCWSx2ID85
 WrESOVb55T1cVFZAz/kw8N9x46BFcjghDizZNtHttL70Wvq16K7JpiEhrRg+68sf
 D5gtejalx+YwD17K6yg9Qu/eXnNeCMKOf17pd6PkHygm+sj9ABBOaw/sGFeVPI/v
 cFA6qA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441a5dg9n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2025 21:43:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507LhogL029137
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Jan 2025 21:43:50 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 13:43:49 -0800
Message-ID: <d9181abb-f23d-4f16-9254-6794a9c8ce21@quicinc.com>
Date: Tue, 7 Jan 2025 13:43:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm: Allow encoder modeset when connectors are
 changed
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maxime Ripard
 <mripard@kernel.org>
CC: Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <robdclark@gmail.com>
References: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
 <20241216-daring-opalescent-herring-bfdc8f@houat>
 <8484df79-6ad8-4702-853f-31d985178607@quicinc.com>
 <20241217-fervent-hot-teal-dc3516@houat>
 <oaus2k2oilaxd33ysecpak7b6pz5fiqsyhfr3ei6om7hzsgn3f@5j3ykluusjuz>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <oaus2k2oilaxd33ysecpak7b6pz5fiqsyhfr3ei6om7hzsgn3f@5j3ykluusjuz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hfFlQa0Tsw4g3Ut208VOHnKin2QrNcWd
X-Proofpoint-GUID: hfFlQa0Tsw4g3Ut208VOHnKin2QrNcWd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 mlxlogscore=852 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070177
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



On 12/19/2024 6:05 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 17, 2024 at 04:02:21PM +0100, Maxime Ripard wrote:
>> On Mon, Dec 16, 2024 at 10:27:44AM -0800, Abhinav Kumar wrote:
>>>
>>>
>>> On 12/16/2024 3:06 AM, Maxime Ripard wrote:
>>>> On Wed, Dec 11, 2024 at 01:18:41PM -0800, Jessica Zhang wrote:
>>>>> Call encoder mode_set() when connectors are changed. This avoids issues
>>>>> for cases where the connectors are changed but CRTC mode is not.
>>>>
>>>> Looks great, thanks a lot for doing the tests :)
>>>>
>>>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>>>>
>>>> Maxime
>>>
>>> Thanks for your feedback.
>>>
>>> Can we get an ack to land this through msm tree as part of the series which
>>> needed it?
>>
>> If possible, I'd rather merge it through drm-misc. We merge a
>> significant number of patches affecting the framework there, so a
>> conflict would be less likely there.
> 
> I think it should be fine to merge this patchset + core part of the
> Jessica's CWB patches ([1]) through drm-misc, then merge drm-misc-next
> into msm-next. I'd ask for such a merge anyway, once Vignesh's IGT uprev
> [2] lands in drm-misc as I need it to finally land the patchset
> converting msm/hdmi to use the HDMI Connector framework.
> 
> [1] https://lore.kernel.org/dri-devel/20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com/#r
> [2] https://lore.kernel.org/dri-devel/20241217160655.2371138-1-vignesh.raman@collabora.com/
> 

Ok sounds good, I am fine to land this through drm-misc as well.

But we dont need to wait for CWB or the HDMI connector framework. This 
is needed not just for CWB but also other features as well including the 
bug we had fixed earlier ( mentioned here : 
https://patchwork.freedesktop.org/patch/612740/#comment_1115262 )

So, if we can land this into drm-misc first it will unblock many other 
things not just CWB.
