Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7B0493CBE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8DF10E1E5;
	Wed, 19 Jan 2022 15:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E575110E204
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:13:36 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso2800407wmf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=nojvlSBxMxzR4GSErwgQdagPUIgNBTK8vSAAewWJfGo=;
 b=UdOh/AhxxSV2+uxZH/MLQG8GMpYKK7LtGvtEgzc0oMjASCb0xgLv1JVkWwbP0Mcj+V
 FTB44ALi2Dkmxa5TtFeeIbigQ+N1KF2QOFjs7nfHIYs/h2YuRCfAJjZQE2rSWo5KHyMt
 4CPSxa99XOEfmjqqpp6mRZSATV4pq1lBLqP7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=nojvlSBxMxzR4GSErwgQdagPUIgNBTK8vSAAewWJfGo=;
 b=NzJvC3YsZhj3hYKYRhcmokKVzkA09kFesxRM7LOJb57t6rHfjP5jP1vP2Y6k3PM787
 pPl4nuZUxPCGMy0508Psa3Q5bP8CGx90fOEQkwZx7VE6lGENmFHKpaG1DJDncoSN4QKu
 gUnYM9Ul/bDG8bFtG4JwViGEuIQQKF8fZQL6x49D1ZhlW3Kl4lK/ao60jXvrbgkyfMbg
 GiBP8nLkL90iXi+DNXbswpLiW0LhzwxS5YFaNNdkQpkG8ght7C9sLFwdBbmbQE4TMDeU
 XKNq+rdMB6KdsB7PyivnFNGM3IjOACAIDx6RsXWn4GaRaWlYPu3ReWKJr45JfwLw6TYj
 k0yw==
X-Gm-Message-State: AOAM530zt7UDeDfV6AHEQUv672tK2qpj9FZ4DAIb9BqMG70oi9iZ7QMq
 FVDLDuH7eXSbgLO0OeRpl4QjvA==
X-Google-Smtp-Source: ABdhPJzgCMa/tbYtoVRSIfTNfXLaMUVi4OH5qPmaP5VowNhx7sB3F/GwbvttLoWt7A3z38o+qBf4Sw==
X-Received: by 2002:a05:6000:3c5:: with SMTP id
 b5mr26652200wrg.312.1642605215514; 
 Wed, 19 Jan 2022 07:13:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z1sm5057694wma.20.2022.01.19.07.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:13:34 -0800 (PST)
Date: Wed, 19 Jan 2022 16:13:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH v2] drm/selftests/test-drm_dp_mst_helper: Fix memory leak
 in sideband_msg_req_encode_decode
Message-ID: <YegqnfDXHmxUBWxI@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 airlied@linux.ie, lee.jones@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220108165812.46797-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220108165812.46797-1-jose.exposito89@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: airlied@linux.ie, lee.jones@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 08, 2022 at 05:58:12PM +0100, José Expósito wrote:
> Avoid leaking the "out" variable if it is not possible to allocate
> the "txmsg" variable.
> 
> Fixes: 09234b88ef55 ("drm/selftests/test-drm_dp_mst_helper: Move 'sideband_msg_req_encode_decode' onto the heap")
> Addresses-Coverity-ID: 1475685 ("Resource leak")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> ---
> 
> v2: Improve commit message

Applied to drm-misc-next, thanks.
-Daniel

> ---
>  drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> index 6b4759ed6bfd..c491429f1a02 100644
> --- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> @@ -131,8 +131,10 @@ sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
>  		return false;
>  
>  	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
> -	if (!txmsg)
> +	if (!txmsg) {
> +		kfree(out);
>  		return false;
> +	}
>  
>  	drm_dp_encode_sideband_req(in, txmsg);
>  	ret = drm_dp_decode_sideband_req(txmsg, out);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
