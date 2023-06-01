Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F88171EEBE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 18:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A57610E153;
	Thu,  1 Jun 2023 16:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1BE10E153;
 Thu,  1 Jun 2023 16:24:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351Ce1mY025423; Thu, 1 Jun 2023 16:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WNAynx4tlKqXRZp5kDxLG89UEaNImx42SZIHHfZDXfM=;
 b=atZgqiL3xeyOLWRoxI/AOXm9BRSfaqwpC4rhRKLyCk0Z9xVR3pMTmp7XwSSTUilh5F9M
 KXMmV3g1Jauy+YqoSRv/a2lDUY8G1mMcqaAiWyxC1oN7PAUe+tLIBOTwzKqHVYLF5kd0
 k2gGtqi41UBn6/GzRM8aOsgp2azkKhpB5J+y+SV0Dd30t1O9LylTT+l6zZTjl48izrgQ
 oLxUXunDWxsSP6DTjLU2jei8gTIzUGfAIJXJ7sGWoCgmbYYRA6CMl3vaEFuyHol0Ffsq
 cNN9EajVbR8NzSfeczRWlVJgqVvm5kBEC9746PqLrcZiC/CDHFzyT0IacMrINDy4tcvv qA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qxugrgn8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jun 2023 16:24:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 351GOPRD013298
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Jun 2023 16:24:25 GMT
Received: from [10.110.26.45] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 1 Jun 2023
 09:24:21 -0700
Message-ID: <d6fc9ce5-75e8-3b8d-a598-beb3cc18fd2a@quicinc.com>
Date: Thu, 1 Jun 2023 09:24:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 11/13] drm/msm: Use regular fbdev I/O helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <javierm@redhat.com>, <sam@ravnborg.org>,
 <suijingfeng@loongson.cn>
References: <20230530150253.22758-1-tzimmermann@suse.de>
 <20230530150253.22758-12-tzimmermann@suse.de>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230530150253.22758-12-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BwxUl_z5rEwYNDxEuLg0AizkPvjkYHQB
X-Proofpoint-GUID: BwxUl_z5rEwYNDxEuLg0AizkPvjkYHQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=657 spamscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1011 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010142
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
Cc: Sean Paul <sean@poorly.run>, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/30/2023 8:02 AM, Thomas Zimmermann wrote:
> Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> helpers. Msm does not use damage handling, so DRM's fbdev helpers
> are mere wrappers around the fbdev code.
> 
> By using fbdev helpers directly within each DRM fbdev emulation,
> we can eventually remove DRM's wrapper functions entirely.
> 
> Msm's fbdev emulation has been incomplete as it didn't implement
> damage handling. Partilly fix this by implementing damage handling
> for write and draw operation. It is still missing for mmaped pages.
> 
> v4:
> 	* use initializer macros for struct fb_ops
> 	* partially support damage handling
> v2:
> 	* use FB_SYS_HELPERS option
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> ---

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
