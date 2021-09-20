Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9289E41106C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 09:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299626E40D;
	Mon, 20 Sep 2021 07:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD146E409;
 Mon, 20 Sep 2021 07:44:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id z2so3327727wmc.3;
 Mon, 20 Sep 2021 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=UuwX+BZTrhgkM5095i9y1izfITUl3ZNzJEk4qvv1Wvo=;
 b=WZV/vN+Rzhvt2qdmkiqIMPMfPh2ezmBLQvFYmyExzx3tyD++Mb8PF19c8FohC7Jq4i
 z3JHqMJqWpoDC3YiqxYAfXFpywdRSJ0BNxAVBTaUmCme+wx0L3X06Tw+KAIDrNmC/+Gw
 W6hVH/r2NombkAj5H9+G+aZA0S8CR/djjuv6lqxKWk+Y2AejHgyazhZx8yZQcP44cRTb
 2mNZpoH+Lr93S5LRtUoBuCDaBU7tkDru2lOZJgcNL2Q++nuQryy64qPP7OYwExXs10WX
 2VMBISSh0S/WdtYws7kd90OZV5ZitgXYpqOLQuoDbt3Ll+alg+HHLGjbR9tIEWz4kndo
 qi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UuwX+BZTrhgkM5095i9y1izfITUl3ZNzJEk4qvv1Wvo=;
 b=DWxHp3k9QZ/PMEV2kUZeq4YXptgTkbtT2gUmgGxtF74TVBbSrYcV39pO+aw8lZ3eKc
 jztPhLml/YGvSqHNqyW80U6ahd02kNVXH+9MOQXxqZefXILlVl99NSFrGAs8JU/9QNAm
 Q4VvuoF+/EGGr1kmiLeq3nce7SBu6IM5xga80jwjlxnjOaje3t86qm2fgFDuXPUgY+dM
 +iuD2fo5fLuukMhA162iC0l/s48YtHP7XD8ibEuEIyObnEr1cCb2FZFKtmroNCtLytpb
 jVnNf0u+mzHmxmGzPYbItoWCw1eTU71wW2pnb8/SfxcDl2mvpuGwbTJ2dh4CUpC28w+g
 uISA==
X-Gm-Message-State: AOAM530etvtLJQ2SDqKZ8xMB0xbKsS+kgN+advMa5gvxDcXZisuSypzy
 5r1FHbD/4/6OsbA3t947Ggg=
X-Google-Smtp-Source: ABdhPJzLZsJv19kIPrY2w25+vrvZR1MhAgajmQ9+0KprWwhQ+GG2BYlEIOgvZ61/j9zZUzGy0NlQnw==
X-Received: by 2002:a7b:ce06:: with SMTP id m6mr27994539wmc.85.1632123842985; 
 Mon, 20 Sep 2021 00:44:02 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id r27sm15163967wrr.70.2021.09.20.00.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 00:44:02 -0700 (PDT)
Subject: Re: [PATCH] drm/radeon: fix uninitialized bool variable
To: Zhiwei Yang <yangzhiwei@uniontech.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210918094157.4770-1-yangzhiwei@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <484936f6-86e8-2078-3739-674a04283666@gmail.com>
Date: Mon, 20 Sep 2021 09:44:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210918094157.4770-1-yangzhiwei@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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



Am 18.09.21 um 11:41 schrieb Zhiwei Yang:
> The bool variable detected_hpd_without_ddc in struct radeon_connector
> is uninitialized when first used, that may cause unnecessary ddc ops.
> Make it as false when a new connector is alloced.
>
> Signed-off-by: Zhiwei Yang <yangzhiwei@uniontech.com>
> ---
>   drivers/gpu/drm/radeon/radeon_connectors.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
> index fe12d9d91d7a..c1987a66373f 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -1866,6 +1866,7 @@ radeon_add_atom_connector(struct drm_device *dev,
>   	bool shared_ddc = false;
>   	bool is_dp_bridge = false;
>   	bool has_aux = false;
> +	bool detected_hpd_without_ddc = false;

In general good catch, but I don't see the need for a local variable here.

Just initialize the member directly or even better change the allocation 
of the connector into a kzalloc().

Christian.

>   
>   	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
>   		return;
> @@ -1923,6 +1924,7 @@ radeon_add_atom_connector(struct drm_device *dev,
>   	radeon_connector->shared_ddc = shared_ddc;
>   	radeon_connector->connector_object_id = connector_object_id;
>   	radeon_connector->hpd = *hpd;
> +	radeon_connector->detected_hpd_without_ddc = detected_hpd_without_ddc;
>   
>   	radeon_connector->router = *router;
>   	if (router->ddc_valid || router->cd_valid) {
> @@ -2384,6 +2386,7 @@ radeon_add_legacy_connector(struct drm_device *dev,
>   	struct radeon_connector *radeon_connector;
>   	struct i2c_adapter *ddc = NULL;
>   	uint32_t subpixel_order = SubPixelNone;
> +	bool detected_hpd_without_ddc = false;
>   
>   	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
>   		return;
> @@ -2414,6 +2417,7 @@ radeon_add_legacy_connector(struct drm_device *dev,
>   	radeon_connector->devices = supported_device;
>   	radeon_connector->connector_object_id = connector_object_id;
>   	radeon_connector->hpd = *hpd;
> +	radeon_connector->detected_hpd_without_ddc = detected_hpd_without_ddc;
>   
>   	switch (connector_type) {
>   	case DRM_MODE_CONNECTOR_VGA:

