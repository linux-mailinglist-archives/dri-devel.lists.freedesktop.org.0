Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020C2854407
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 09:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2C710E560;
	Wed, 14 Feb 2024 08:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WbOf/DOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C038110E560
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 08:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707899390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vb/g1159e0DO4hnfKwx1FD37+ejv2muFNbaldYH/o+A=;
 b=WbOf/DOzNJhNMPt1goI1XfasuprSc8+6yRqXY2+0+0FI3xzI2wzSCo+VbOY8ioaoNgPjsi
 llvD91D00yfXBVyQ0+6Fv4J5hE6Ea6Pf+qzhOotylb2FW4cYu4EYkl6bgfwMyMS0b97Nii
 rjVWDPIp+sQTwF3osNqUEuxrDiAGzXs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-_c-W9KjdN9eWSzBUS2F4zA-1; Wed, 14 Feb 2024 03:29:48 -0500
X-MC-Unique: _c-W9KjdN9eWSzBUS2F4zA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-51151b8de86so4924627e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 00:29:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707899387; x=1708504187;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vb/g1159e0DO4hnfKwx1FD37+ejv2muFNbaldYH/o+A=;
 b=JICPTTTh2RAQBmRlvRkIPp6Fx6OEFlV0xwc0adZLD7Iwi/rR3uK7yDTcMLkjIwoufL
 GbjPKr+PawjqgVJL85+qyfHHTDu0D7wHqj1wNHUrKqjVt0bQR7n9fTueXQ/r/FNx4hlW
 g0Q9BPZoXwqm8KMFGAEua2/o56w7JD/KgE2QfAA4SshVZ2FrzMBoO8XMKpPgEQLfryfj
 wGxeeE1hIBzPz+k6q9hPF3cOnNBCHzLMj/I+0osLEHLmVYYANvkr9PrYXrCIR74XOOzR
 R8m2ZEo9HV44XD0+YHGTWBH22t70+cHd/h15Tc0KGqF5Qa++g4NouiISHDueQR2X7SfV
 EagA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAfXQMKiEQjM0cwF6Dxrb5lxZ6vWVWHpsOnzSa+irBJMkqeHPAs4Ag1qBl2mZ5aczKbMyTozF+zVWYdBFhOOwEilZdiEjI+yJ2rUekdeki
X-Gm-Message-State: AOJu0YwCE1FKxH8AeUpW04tmN5un6VzWOCsadHf+qZjDth9ZhNE0oGDi
 EiceSR4MWDjXWjIHsrKTH65sXSVeRm/UyWDZiA5Y+0zU38o9m3awSlwYTa3fTlFq3uTPILh5K4p
 Jqnum8V2FpLwK/yC9yCIIttLgHrnisfYf55VeUiIpQmjPP9dnuvEkJeRSusDUdl6U1g==
X-Received: by 2002:a05:6512:31d2:b0:511:6bbb:7ff4 with SMTP id
 j18-20020a05651231d200b005116bbb7ff4mr1650174lfe.28.1707899387159; 
 Wed, 14 Feb 2024 00:29:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsLfgWG/30yrRsS8j6eyKwETXq3//aeDhjygzrlpII45P5KOddG3karYL+WkrkvZKL5sO5Sw==
X-Received: by 2002:a05:6512:31d2:b0:511:6bbb:7ff4 with SMTP id
 j18-20020a05651231d200b005116bbb7ff4mr1650160lfe.28.1707899386794; 
 Wed, 14 Feb 2024 00:29:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVRJ5ra1Ww+fJK/5MMBRDzXr77JRTW+837gGQewt9e0TsXZDVffQkOcLqCpaO+UdjsKVB9ZOPD2U+h9i88g1DtSXMeY843Bt50MpnDUs4Lim21DIJXTf039lhSinIOjE7EqPwLfNc9D4R2/4h3RlF/pSPC5VDImI44l846EuDjqOKhRLUYXz1erKJabwn2k2f5UI+gudFD0p63bGI9JeTJ5MPSiTUA+AzcrQrPHMziCufhmxIsKt8n3IO0jNTEpdCo8jkReoJj56R5Xgn8j3gFCbTo3rQBVYNwOAoHIEJWvEl+RggDYFZ6Fb1rlO9RVWiYqkfwBNwGHoKgBivpCgj39F18nY8b4W6qztthYuIkracHTLCdiKk8lq3Zz8/XvX0MkG2+P9z6pwnaeGkSNoNWNRIELp1k=
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 az17-20020adfe191000000b0033b87c2725csm6133062wrb.104.2024.02.14.00.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 00:29:46 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm: ci: use clk_ignore_unused for apq8016
In-Reply-To: <20240213193931.2300211-1-dmitry.baryshkov@linaro.org>
References: <20240213193931.2300211-1-dmitry.baryshkov@linaro.org>
Date: Wed, 14 Feb 2024 09:29:45 +0100
Message-ID: <87plwzjvnq.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

Hello Dmitry,

> If the ADV7511 bridge driver is compiled as a module, while DRM_MSM is
> built-in, the clk_disable_unused congests with the runtime PM handling
> of the DSI PHY for the clk_prepare_lock(). This causes apq8016 runner to
> fail without completing any jobs ([1]). Drop the BM_CMDLINE which
> duplicate the command line from the .baremetal-igt-arm64 clause and
> enforce the clk_ignore_unused kernelarg instead to make apq8016 runner
> work.
>

Agree that this is the only practical option for the short term...

> [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/54990475
>
> Fixes: 0119c894ab0d ("drm: Add initial ci/ subdirectory")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

>  drivers/gpu/drm/ci/test.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 355b794ef2b1..b9f864e062df 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -119,7 +119,7 @@ msm:apq8016:
>      DRIVER_NAME: msm
>      BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
>      GPU_VERSION: apq8016
> -    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"

Maybe add a comment here explaining why the clk_ignore_unused param is
needed ? (basically what you have in your commit message), that way it
could be dropped once the underlying issue is fixed.

> +    BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
>      RUNNER_TAG: google-freedreno-db410c
>    script:
>      - ./install/bare-metal/fastboot.sh
> -- 
> 2.39.2
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

