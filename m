Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436B53B7B06
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 02:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3876E90C;
	Wed, 30 Jun 2021 00:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F3F6E90C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 00:35:09 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DB8E08318C;
 Wed, 30 Jun 2021 02:35:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1625013307;
 bh=7d+hvafjNqkuLN4l9EGDgvyWp865HKjDqji5vD6RecM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XaaIg08GyrpafgYTDYiZY3MYc4mI7Bgolmdb0ksmBVgQwLMkUIvHqf1+cUDFumHiM
 zL2FhNG/tvaZZsgGcnTrPq/77X8kNUGN4r/n5NP53N7fqFMkzQT1GhbBXqBBaV6k24
 KC/cQ6AyQ4kS9WQaCIP2jlmrtQXvrgwaz5qpN3WBsUPeuLbJRp1Wov1NoEWjke3tzK
 L8DrbtszwVK+km/EA1nAhW3Q8ByETdVM02oC62H5HxYpf3bb8mk26SYp9m8pz7zSIs
 1E7xVvdvTeXDQCrgeGgvLja05Aia6HvPpO8B+ac4wO/4l6KMIHbHec5z61x6AZnATD
 lLsW1y3k3NdOw==
Subject: Re: [PATCH] drm/stm: ltdc: improve pm_runtime to stop clocks
To: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
References: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <420e243d-7541-a07e-177b-d2db11c26aef@denx.de>
Date: Wed, 30 Jun 2021 02:35:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/29/21 1:58 PM, Raphael GALLAIS-POU - foss wrote:

[...]

> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -425,10 +425,17 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *crtc,
>   {
>   	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
>   	struct drm_device *ddev = crtc->dev;
> +	int ret;
>   
>   	DRM_DEBUG_DRIVER("\n");
>   
> -	pm_runtime_get_sync(ddev->dev);
> +	if (!pm_runtime_active(ddev->dev)) {
> +		ret = pm_runtime_get_sync(ddev->dev);

All these if (!pm_runtime_active()) then pm_runtime_get_sync() calls 
look like workaround for some larger issue. Shouldn't the pm_runtime do 
some refcounting on its own , so this shouldn't be needed ?
