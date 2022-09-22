Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 813865E6C8C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 22:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6460910E1FD;
	Thu, 22 Sep 2022 20:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07FF10E21E;
 Thu, 22 Sep 2022 20:01:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28MJNfii011612;
 Thu, 22 Sep 2022 20:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1pMaUoTR3YrWZWr8YoQKMxOkKXfqTTJJFPlXZWdqh80=;
 b=Pwax92A9FQ04+cU34eb4mvfB88pF0O8M9sFISJQxW00slRE1uhyV7fU+AyLGAwOcUQYq
 GGPA2dHRsj4iY1PhZL+nVBq0n1wExSfuMa1XbzCV5HvdFdzsFRiRq/8tUzLN5tgWKSU2
 +GISYIvqwfJRZLEH0hLFnjMu/YyymDK/YZzFW1Sq3yCDOEoGqC39xNQu65QUEGwR7lR+
 943b1btSJZXyoe9GQAEqC8mROcCsIPG7WtPAJCA6KefWlDRbq7FIU8TpzqQIgyZtK3bP
 WcbuTL9QlJ7pqUmOXO5iKCaif4CwXiF6bypryCkzGoAqZobAUfqS8Jxrbb3noPM9FDEZ Og== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jrutp8hqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Sep 2022 20:01:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28MK1KEX001846
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Sep 2022 20:01:20 GMT
Received: from [10.110.101.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 22 Sep
 2022 13:01:19 -0700
Message-ID: <39ee3606-6021-b4a8-12ec-c07b554e3b55@quicinc.com>
Date: Thu, 22 Sep 2022 13:01:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Freedreno] [PATCH v2 01/10] drm/msm: fix use-after-free on probe
 deferral
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Rob Clark" <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-2-johan+linaro@kernel.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220913085320.8577-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FZC-_1HAD1V0zZnWbDTOWLsb_vo_aEFb
X-Proofpoint-ORIG-GUID: FZC-_1HAD1V0zZnWbDTOWLsb_vo_aEFb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_14,2022-09-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209220129
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
Cc: Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, freedreno@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/13/2022 1:53 AM, Johan Hovold wrote:
> The bridge counter was never reset when tearing down the DRM device so
> that stale pointers to deallocated structures would be accessed on the
> next tear down (e.g. after a second late bind deferral).
>
> Given enough bridges and a few probe deferrals this could currently also
> lead to data beyond the bridge array being corrupted.
>
> Fixes: d28ea556267c ("drm/msm: properly add and remove internal bridges")
> Fixes: a3376e3ec81c ("drm/msm: convert to drm_bridge")
> Cc: stable@vger.kernel.org      # 3.12
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 391d86b54ded..d254fe2507ec 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -241,6 +241,7 @@ static int msm_drm_uninit(struct device *dev)
>   
>   	for (i = 0; i < priv->num_bridges; i++)
>   		drm_bridge_remove(priv->bridges[i]);
> +	priv->num_bridges = 0;
>   
>   	pm_runtime_get_sync(dev);
>   	msm_irq_uninstall(ddev);
