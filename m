Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9105B10CB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 02:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D784410E444;
	Thu,  8 Sep 2022 00:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3013A10E3A0;
 Thu,  8 Sep 2022 00:08:38 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28801o9P028776;
 Thu, 8 Sep 2022 00:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=oDpVedNrosb5QjVee7Ck2ZJkahqy0+DbwH85mHpTNVk=;
 b=KL0CG42jMqDASz3vWGnIHBoDYnrS9r8wEvhwK56vl+2XowZjC7/oSlzJOhF9T0paWgg0
 UTmFLhRbC5KMVKZ61HZUNNquHfjB+IZ7rqlyWq/XRms3VkSFom/HaR425T5MlBylFpmX
 ijOAyXwTHqyBYqgz1udXGwKpMJStgUv3rAMCo2JlLHspYooHbdpcO2Nz9igOJ8PvbjIj
 LbVFt3H3bpNFgqEr+q8QDPp2JEQXt01g4V7HKymxZoRk8G11cCM1LuqRPZvJ1CaJg8He
 aTcpKdIPmw3GGBR/ZRc1/0wNUIwGnFXnuFfOeM6iYN+3V3Xb6XwC7MZaJeadsyb3r3An 2g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jefntc55m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 00:08:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28808Scf029715
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Sep 2022 00:08:28 GMT
Received: from [10.111.169.242] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 7 Sep 2022
 17:08:26 -0700
Message-ID: <4f4862fd-4cbd-82ac-f162-e38c05c92423@quicinc.com>
Date: Wed, 7 Sep 2022 17:08:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 1/4] drm/msm: clean event_thread->worker in case of an
 error
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
 <20220617233328.1143665-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220617233328.1143665-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: --FaAQ_84JarqRUgygYyrVVXD8YmkAZD
X-Proofpoint-GUID: --FaAQ_84JarqRUgygYyrVVXD8YmkAZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_10,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070089
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/17/2022 4:33 PM, Dmitry Baryshkov wrote:
> If worker creation fails, nullify the event_thread->worker, so that
> msm_drm_uninit() doesn't try accessing invalid memory location. While we
> are at it, remove duplicate assignment to the ret variable.
> 
> Fixes: 1041dee2178f ("drm/msm: use kthread_create_worker instead of kthread_run")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

the change itself LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

One minor nit below
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 44485363f37a..1aab6bf86278 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -436,7 +436,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   		if (IS_ERR(priv->event_thread[i].worker)) {
>   			ret = PTR_ERR(priv->event_thread[i].worker);
>   			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");

Can we print ret in this error message?

> -			ret = PTR_ERR(priv->event_thread[i].worker);
> +			priv->event_thread[i].worker = NULL;
>   			goto err_msm_uninit;
>   		}
>   
