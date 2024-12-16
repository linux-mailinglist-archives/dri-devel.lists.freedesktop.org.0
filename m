Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B83B9F38EA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 19:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A776A10E755;
	Mon, 16 Dec 2024 18:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JTWIjAq0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B32F10E755
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 18:27:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGFgKgq015320;
 Mon, 16 Dec 2024 18:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P3MBJgkWNt+1zBLdfIRA/UwIK+aKTPriY9UIm2BDsow=; b=JTWIjAq0wEeJj0lG
 za1U3OhU2EIKD31fsMk9PItVxQF6dyvdVUYlqbF7jXhS38wyt0qT0+v3UxWg/k/g
 ZWpMLVtiYuukDvjdZRq38PKqDzHYUJfokP69Y4JELAEbnxh2WLpLgAv+P7Aigxw2
 lAuxkbEFrpV5x4omSs4XzM+mBuz3lFQ0qK1LG2BAjumFCGdbkWlP2RJs1DQlKB7b
 Vgo+dRvVKeGIc3m51iU1fnpN22Ulms4viCHTZHYlejCCN19ZfyQ7H7A2n0tZdr8A
 pJ1xhGMFGgEwP0j3ljhbNoOSbQNzd4E6o0+YjqkJamrarM0rgFEKY1IpQPfg8PTN
 F73rBw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jq350e9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 18:27:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGIRlBJ013326
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 18:27:47 GMT
Received: from [10.110.88.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 10:27:46 -0800
Message-ID: <8484df79-6ad8-4702-853f-31d985178607@quicinc.com>
Date: Mon, 16 Dec 2024 10:27:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm: Allow encoder modeset when connectors are
 changed
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>
References: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
 <20241216-daring-opalescent-herring-bfdc8f@houat>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-daring-opalescent-herring-bfdc8f@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: A9NOT-SK5Om6gI5TeVP1qvnD4OBy27UW
X-Proofpoint-ORIG-GUID: A9NOT-SK5Om6gI5TeVP1qvnD4OBy27UW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 malwarescore=0 clxscore=1015 mlxlogscore=820 impostorscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160154
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



On 12/16/2024 3:06 AM, Maxime Ripard wrote:
> On Wed, Dec 11, 2024 at 01:18:41PM -0800, Jessica Zhang wrote:
>> Call encoder mode_set() when connectors are changed. This avoids issues
>> for cases where the connectors are changed but CRTC mode is not.
> 
> Looks great, thanks a lot for doing the tests :)
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> 
> Maxime

Thanks for your feedback.

Can we get an ack to land this through msm tree as part of the series 
which needed it?
