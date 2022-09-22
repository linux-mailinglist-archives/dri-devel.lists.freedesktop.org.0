Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 195D95E6C3A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 21:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660F810E14B;
	Thu, 22 Sep 2022 19:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D9710E14B;
 Thu, 22 Sep 2022 19:55:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28MJN0Ox002535;
 Thu, 22 Sep 2022 19:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gFr2LQ9xc9OVzf2n0w1l0UrXp4SUITEsCLAKeCBrq3I=;
 b=LHXRNxWO0DOiRG0jTL1HfYb9k78Q66Bc9Z5YfADq8ZtreZ2cSWiPXTzdyPR8a8C1pxEe
 GhAOE1nF1nIRAAsGC+cnHABeH07XPC1apZHodJLYGwVkfNxuziZpMhIxnX9dpaiWkyff
 qwSTq6oU+X8qcqqVqTcdG1TbMyX6NNclIqg8uNr89Rqrb5k0T365kUK1GfD5qmi5EAcU
 So4pa6184QMyHKfEqWzDUwQI+Pr7WheJM1uPFVh8uFKMIpQNeI5VJFHB7Ozo/7JiEb6F
 pq7kFeg/rxiBpBs1mxsm40m8LAYept6ky4DgI9+OavXmqF8xCfGQJo98IlhUGhlcAQgQ lA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jrpp995tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Sep 2022 19:55:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28MJt55E017766
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Sep 2022 19:55:05 GMT
Received: from [10.110.101.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 22 Sep
 2022 12:55:04 -0700
Message-ID: <9e223c13-15e2-de5e-e1e1-0dbbe629a0a1@quicinc.com>
Date: Thu, 22 Sep 2022 12:55:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 08/10] drm/msm/hdmi: fix IRQ lifetime
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Rob Clark" <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-9-johan+linaro@kernel.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220913085320.8577-9-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VBZAWRAC-zK6Kkxuhy-HuFR_TtBm2T-P
X-Proofpoint-ORIG-GUID: VBZAWRAC-zK6Kkxuhy-HuFR_TtBm2T-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_14,2022-09-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209220129
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, stable@vger.kernel.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Steev Klimaszewski <steev@kali.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/13/2022 1:53 AM, Johan Hovold wrote:
> Device-managed resources allocated post component bind must be tied to
> the lifetime of the aggregate DRM device or they will not necessarily be
> released when binding of the aggregate device is deferred.
>
> This is specifically true for the HDMI IRQ, which will otherwise remain
> requested so that the next bind attempt fails when requesting the IRQ a
> second time.
>
> Fix this by tying the device-managed lifetime of the HDMI IRQ to the DRM
> device so that it is released when bind fails.
>
> Fixes: 067fef372c73 ("drm/msm/hdmi: refactor bind/init")
> Cc: stable@vger.kernel.org      # 3.19
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

> Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index a0ed6aa8e4e1..f28fb21e3891 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -344,7 +344,7 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>   		goto fail;
>   	}
>   
> -	ret = devm_request_irq(&pdev->dev, hdmi->irq,
> +	ret = devm_request_irq(dev->dev, hdmi->irq,
>   			msm_hdmi_irq, IRQF_TRIGGER_HIGH,
>   			"hdmi_isr", hdmi);
>   	if (ret < 0) {
