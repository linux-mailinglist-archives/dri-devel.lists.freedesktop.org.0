Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCED480C22
	for <lists+dri-devel@lfdr.de>; Tue, 28 Dec 2021 18:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F1E899B5;
	Tue, 28 Dec 2021 17:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF4E893D5;
 Tue, 28 Dec 2021 17:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640712996; x=1672248996;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4OYDghXVhKB7oG2GEWMd9vQDKAFwA7xtNF7C6sQ+okg=;
 b=UwwTknU+ztYX2eNtwfesey2dzAVqcayrRIhVTCw7CyO3Pe5Cuv7nm8Ra
 9gGE+fjX/n+NXk6HVCzuUtvoPFSUDxvrZ2VHwWGwJyzfztkjyICY8C9kW
 nI1oh+cjSDXvXpv7dYgfkN4fn6gUHwNa6QZWo0zX6YAAb3AHp9FRU7KLG g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Dec 2021 09:36:35 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 09:36:34 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 28 Dec 2021 09:36:34 -0800
Received: from [10.110.91.229] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 28 Dec
 2021 09:36:33 -0800
Message-ID: <1a8dc2f2-b058-7243-f3dd-2defbca50e3d@quicinc.com>
Date: Tue, 28 Dec 2021 09:36:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/msm/dp: Fix a potential double free in an error
 handling path
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, <robdclark@gmail.com>, 
 <sean@poorly.run>, <quic_abhinavk@quicinc.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <bjorn.andersson@linaro.org>, <swboyd@chromium.org>
References: <6fd20c8779d6b03a5b54509af25b478049482087.1640531508.git.christophe.jaillet@wanadoo.fr>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <6fd20c8779d6b03a5b54509af25b478049482087.1640531508.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/26/2021 7:14 AM, Christophe JAILLET wrote:
> 'dp_bridge' is devm_alloc'ed, so there is no need to free it explicitly or
> there will be a double free().
>
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_drm.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 188e77c59885..d4d360d19eba 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -243,7 +243,6 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
>   	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   	if (rc) {
>   		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
> -		kfree(dp_bridge);
>   		return ERR_PTR(rc);
>   	}
>   
