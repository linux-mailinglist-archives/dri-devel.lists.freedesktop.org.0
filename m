Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A17007F42D0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 10:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8D10E2F0;
	Wed, 22 Nov 2023 09:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FC810E2F0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700646690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1YRUQw0IBZCnz+KuoV47ilnnGzdOSR+bjrSCjbtytRA=;
 b=UfMMc91e4ZmJUzd7w1/pjgj4AMB6r15ln3QnSi5N0ZFjr/9stqOKCFZxfUGbVj0NUGvZ2/
 nIfi5jq5i7+UFJGbNNi7U7YndLCzytPbbsvCnY9g3xwllLhBD6U1tIPWKxvRKwJGlnCP+L
 n8naV+7sAliI7+Zwvt/EqLP6lJIvvCI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-ewFIhZtVOWO0FfoyQKwfWA-1; Wed, 22 Nov 2023 04:51:28 -0500
X-MC-Unique: ewFIhZtVOWO0FfoyQKwfWA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a02cc56af16so106916466b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 01:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700646688; x=1701251488;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1YRUQw0IBZCnz+KuoV47ilnnGzdOSR+bjrSCjbtytRA=;
 b=dKFnHB6WqslD1a8TiThUzGyH05Y467V4FVZPuyVIdD4Eq5f4pPh296psC0BSAKxw30
 sFSU2LVrno8SEUecQRRTKxZeqIBvSZb9kZ/Zg7YVtsSNZMlntLF/ugctLvuYzzWB/PBW
 gfJfnEAi8k0sswToKqbRWMol9Qt5gjYJHLN8iTFPOsR8s4ZJyObFzei6TJawyzufXRby
 8L0F0umiMAHcDUKCoexli11jVGyZpKTbdc1qjE2r/3SfnnsKNb7G6aqAbOorKrPBAFDs
 lYqNxhvL+vbqAPVvm72aX9pkRmo+LUFxazRpI4qIF+pk9gtYMJtCU6vwJqIdUe+/JmWH
 iZXA==
X-Gm-Message-State: AOJu0Yzwr/AKgBt+2DKninOCvQpHhkLQhtAu+CWe29VTF2opwSmbj45+
 gi217BESLYGPei7BQMLsUo38yidZi/KJ0zZVECkwdNOuTECJ+yqgbLJinedPBZK23NTzHDQs7OX
 NiRsNsiCYKRKc79VCnzY33tOQYUPl
X-Received: by 2002:a17:906:52c8:b0:a02:bc2d:e026 with SMTP id
 w8-20020a17090652c800b00a02bc2de026mr901981ejn.46.1700646687885; 
 Wed, 22 Nov 2023 01:51:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNpJQXS0vsmxpqXnk0hQQ64thRkz+tdFplkxp4vhRTrwp6LdJ3G8irR5i0TgR9d7R+d347Cg==
X-Received: by 2002:a17:906:52c8:b0:a02:bc2d:e026 with SMTP id
 w8-20020a17090652c800b00a02bc2de026mr901962ejn.46.1700646687525; 
 Wed, 22 Nov 2023 01:51:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a170906349900b009fd541851f4sm4012620ejb.198.2023.11.22.01.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 01:51:27 -0800 (PST)
Message-ID: <c6f5e15d-600d-4f31-bdce-9429a3dd82b7@redhat.com>
Date: Wed, 22 Nov 2023 10:51:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/simplefb: Suppress error on missing power domains
To: Richard Acayan <mailingradian@gmail.com>, Helge Deller <deller@gmx.de>,
 Thierry Reding <treding@nvidia.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20231122005457.330066-3-mailingradian@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231122005457.330066-3-mailingradian@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/22/23 01:54, Richard Acayan wrote:
> When the power domains are missing, the call to of_count_phandle_with_args
> fails with -ENOENT. The power domains are not required and there are
> some device trees that do not specify them. Suppress this error to fix
> devices without power domains attached to simplefb.
> 
> Fixes: 92a511a568e4 ("fbdev/simplefb: Add support for generic power-domains")
> Closes: https://lore.kernel.org/linux-fbdev/ZVwFNfkqjrvhFHM0@radian
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Thank you for the patch.

I've pushed this to drm-misc-next now.

Regards,

Hans



> ---
>  drivers/video/fbdev/simplefb.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> index fe682af63827..6f58ee276ad1 100644
> --- a/drivers/video/fbdev/simplefb.c
> +++ b/drivers/video/fbdev/simplefb.c
> @@ -466,6 +466,10 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
>  	err = of_count_phandle_with_args(dev->of_node, "power-domains",
>  					 "#power-domain-cells");
>  	if (err < 0) {
> +		/* Nothing wrong if optional PDs are missing */
> +		if (err == -ENOENT)
> +			return 0;
> +
>  		dev_info(dev, "failed to parse power-domains: %d\n", err);
>  		return err;
>  	}

