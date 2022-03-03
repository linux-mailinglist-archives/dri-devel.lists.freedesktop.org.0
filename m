Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3924D4CBA10
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 10:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0869310EE8A;
	Thu,  3 Mar 2022 09:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2EB10EE7C;
 Thu,  3 Mar 2022 09:21:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D15781F4537A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646299309;
 bh=Oe2pV1nTwtl1ZAeBq7ptzCBBqpUgYg8U9OQ8spRg7k0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kxwvKdJAr8t3ibeUYyY3yZwFjajIrc8P7Izj4oGXdVD8DepEDb8cHlC6SQHcUe1+6
 P5wGoTx1r7580zSAScrN+FoSMg4nK1kc+Fgmz3YnDKHYHFW5erqwKkfCNF4U0af5ai
 69xDhPXEgIYTW4uFXwOIqY0Ef1Jr8KYiRT/Fjfdm1216hApVM0PU+0TKPWSzNfDtKq
 DyslyhiFTfwRe/3qTRGRB++2ApHP5qAZkP21+hqNqdmz+euw1ZlrArm5QJNTRwXiY2
 wqhx33a2wZqYobw/xwc/InZYoztSn7aOsMLZ3nhANidG5f9l2kcEM0jwDOTjF3Xujm
 QGKio3vllwnFw==
Message-ID: <373491a2-0fa5-0326-29cd-1650f86202d4@collabora.com>
Date: Thu, 3 Mar 2022 10:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1 07/10] drm/msm/adreno: Retry on gpu resume failure
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1646242056-2456-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220302225551.v1.7.I55e39e28375b64455d1605f67453d5e91b0c2710@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220302225551.v1.7.I55e39e28375b64455d1605f67453d5e91b0c2710@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 Martin Botka <martin.botka@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 02/03/22 18:27, Akhil P Oommen ha scritto:
> Retry infinitely on resume failure because there is nothing much we can
> do if GPU is not ON. Also, this helps us to avoid checking for the
> return value of pm_runtime_get() to see if GPU is ON.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 89cfd84..abcc553 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -603,8 +603,16 @@ static const struct of_device_id dt_match[] = {
>   static int adreno_resume(struct device *dev)
>   {
>   	struct msm_gpu *gpu = dev_to_gpu(dev);
> +	int ret;
> +
> +	/* What hope do we have for the future if we can't turn ON gpu */

Hello Akhil,

the hope for the future would be to at least not lock up everything with
an infinite loop, so, please change this to have a limited amount of retries.

My guess would be that a maximum of 10 is already a lot of retries, but
feel free to choose an appropriate number.

Regards,
Angelo

> +	while (true) {
> +		ret = gpu->funcs->pm_resume(gpu);
> +		if (!ret)
> +			break;
> +	}
>   
> -	return gpu->funcs->pm_resume(gpu);
> +	return 0;
>   }
>   
>   static int active_submits(struct msm_gpu *gpu)


