Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C038FBA8
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 09:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BF96E09F;
	Tue, 25 May 2021 07:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFF26E09F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 07:27:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so9574968wmq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 00:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3ULzEBN0Jp6XpJ/GBCDjzUsE47Bj6V3OGDqs3nkCmBQ=;
 b=NfZNK3AP4Og/CCDj7YYSs3dxKXI9Yon/pw5TGBatv6Z3hbr71FBpaqjvfhyK00mUnl
 UIdBQiPqdFiqwOhmVUnNfwiV1y9R0umkNt4Tq0w+gZos6CmFq5RECL9MXuLRIQ7275Qq
 Gn822MmikBlAoDmGTjlFZkWki47X/e14d2JPNIsjYO+YmYRhHCufrKtatPJXvdkpt8nM
 Mjj12l2nlaOhCn+tfBhEr01K9++dRz3EyUJ4WNfwiWiqeZvhnjC6drVmX9Trd7PKhdrJ
 LpKweY3Q0tJHgXpqzwAm9sjT0HmmWfJXVQrZU+AkvDHHcMpfsBCQaPANLPWiGNGMNpMC
 H0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3ULzEBN0Jp6XpJ/GBCDjzUsE47Bj6V3OGDqs3nkCmBQ=;
 b=Owp6B1vHksLzz2pWbRqFN5HH1LIczrFpILE/4nGoRNghhK6yJ2sqKefb/e0fsFQHMG
 2ptheLodza9zOmpP+cyQbJRtC3SVzRqKvumR3iMymPcFGalqWtpBS15TpWSKd6Br1v1L
 AjSRx5Xu6gR4qkdRnwHllRrVLCOv8zSKbqnlBIM0pkD1a/jdxV10mqY+okyqsyxYrBNs
 7qZ1nZME47CUyQFOh7J2FR4mK9Z4IK3+g9bj7j26XCb5Vt9vJ0wOWi+/57KnW7td8xe+
 xkYjMQwxoA7EN0QhL9VoAg0VOq78lOwv0hrDdOMoN9qsP9MWxBX4XcowsMjhrcxnnpyH
 F1hA==
X-Gm-Message-State: AOAM530KOw/iAzGtyp1qlnTn1fQCfcoT8rnjPyPfQSnWpB0RjYknBX8f
 MjVGLn+O5UGGqcY4OZDgYACCvg==
X-Google-Smtp-Source: ABdhPJxyYxttWGaOHQK/+i3OGI3H2+FM/NOaYwrT/XMwPbrCsfvs/WLauniXQAHjriF6Y7oiTOIgDw==
X-Received: by 2002:a1c:b457:: with SMTP id d84mr2458736wmf.58.1621927632859; 
 Tue, 25 May 2021 00:27:12 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:1062:9531:8150:c5f3?
 ([2a01:e0a:90c:e290:1062:9531:8150:c5f3])
 by smtp.gmail.com with ESMTPSA id h14sm1932369wmb.1.2021.05.25.00.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 00:27:12 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: fix shutdown crash when component not probed
To: dri-devel@lists.freedesktop.org
References: <20210430082744.3638743-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0359d826-49d5-d724-b38e-012e3389ae43@baylibre.com>
Date: Tue, 25 May 2021 09:27:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430082744.3638743-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/04/2021 10:27, Neil Armstrong wrote:
> When main component is not probed, by example when the dw-hdmi module is
> not loaded yet or in probe defer, the following crash appears on shutdown:
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
> ...
> pc : meson_drv_shutdown+0x24/0x50
> lr : platform_drv_shutdown+0x20/0x30
> ...
> Call trace:
> meson_drv_shutdown+0x24/0x50
> platform_drv_shutdown+0x20/0x30
> device_shutdown+0x158/0x360
> kernel_restart_prepare+0x38/0x48
> kernel_restart+0x18/0x68
> __do_sys_reboot+0x224/0x250
> __arm64_sys_reboot+0x24/0x30
> ...
> 
> Simply check if the priv struct has been allocated before using it.
> 
> Fixes: fa0c16caf3d7 ("drm: meson_drv add shutdown function")
> Reported-by: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 453d8b4c5763..07fcd12dca16 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -485,11 +485,12 @@ static int meson_probe_remote(struct platform_device *pdev,
>  static void meson_drv_shutdown(struct platform_device *pdev)
>  {
>  	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
> -	struct drm_device *drm = priv->drm;
>  
> -	DRM_DEBUG_DRIVER("\n");
> -	drm_kms_helper_poll_fini(drm);
> -	drm_atomic_helper_shutdown(drm);
> +	if (!priv)
> +		return;
> +
> +	drm_kms_helper_poll_fini(priv->drm);
> +	drm_atomic_helper_shutdown(priv->drm);
>  }
>  
>  static int meson_drv_probe(struct platform_device *pdev)
> 

Applied to drm-misc-fixes

Neil
