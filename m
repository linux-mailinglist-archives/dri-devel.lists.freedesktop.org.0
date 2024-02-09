Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8610384FBED
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 19:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C07A10F970;
	Fri,  9 Feb 2024 18:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ni/Y1Fbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8276210F933;
 Fri,  9 Feb 2024 18:34:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 419Fa1nH005485; Fri, 9 Feb 2024 18:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=3B4PpLKpF8FyHa9lkEjMzK39Y6n8//6w/dm0IetCClc=; b=Ni
 /Y1FbqrfKa7Sxl9IjOOTatpiqNNO/x8p5Ksi45dctBWouxmftG06fM5D4VTGyYMD
 6zgJa4YgdCYDW5Gf+YbmIJGTrreaOZc16u2xISg+FNbj13AvQ7vySNB7t58zRfYB
 U2wae30aEK4ozUrzuZ67kxzMC4NDtjApyGdQWORmSkxVajfe22IkQGqdzVdkkn7p
 fFXu9vQxKLpruY1expaU30OLbBYQtTWgka+bzXZL4EcZfp+7EzPmkstyysgf/uzl
 WkdwbV97nNDHK8pv51uHKJxbbpE1njlWiRgsueIAH8Yqmzh1XZwfjZdH9DbWF2Ym
 sRwAOEzU/rJzLhzW9HYA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5pa10g5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Feb 2024 18:34:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419IYgoV005658
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Feb 2024 18:34:42 GMT
Received: from [10.110.105.190] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 10:34:42 -0800
Message-ID: <485ad43f-43fc-f57e-d118-8ad506f62698@quicinc.com>
Date: Fri, 9 Feb 2024 10:34:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 4/5] drm/msm/dpu: move writeback's atomic_check to
 dpu_writeback.c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
 <20240208-fd_remove_phys_ops_atomic_mode_set-v4-4-caf5dcd125c0@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-4-caf5dcd125c0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hlAWMp1PtELiO7jPdvIyABbGNAamBtaI
X-Proofpoint-ORIG-GUID: hlAWMp1PtELiO7jPdvIyABbGNAamBtaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_16,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 mlxlogscore=668 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090135
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


On 2/8/2024 7:20 AM, Dmitry Baryshkov wrote:
> dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
> Move corresponding checks to drm_writeback_connector's implementation
> and drop the dpu_encoder_phys_wb_atomic_check() function.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Tested-by: Paloma Arellano <quic_parellan@quicinc.com>


