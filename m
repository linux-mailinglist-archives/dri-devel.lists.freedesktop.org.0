Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE7F651F54
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C0010E3A1;
	Tue, 20 Dec 2022 10:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8657510E3A1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 10:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671533817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vkjasi8TwlRlWlSs36qbeqEttPuAP+V0x8sDwV4pAOM=;
 b=YVOmFxRDkkzTnSmWGKNiOSKuTPslFcj1PT/N44kav7FKMip69MRuFfhta1cdD4nJfrihYV
 GFQeEbxoOLXum2LJDvaq6bbLt3AWKmnALWXch6AK0ehj9AgvdRdaaWpEZ/ehP3Eu1RbON1
 OQpqALKxLYAnk3Bq9LXJL4TsoSbU+kE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-577-5cGAb4OMOn-Stje2_O0aaQ-1; Tue, 20 Dec 2022 05:56:56 -0500
X-MC-Unique: 5cGAb4OMOn-Stje2_O0aaQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r67-20020a1c4446000000b003d09b0fbf54so7876193wma.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 02:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vkjasi8TwlRlWlSs36qbeqEttPuAP+V0x8sDwV4pAOM=;
 b=e7e+2vaVR93pACPKeTpyUAG+tmFx++7KJoVnu3uftf9EJTT9sEDCf+B+A6LqgKQSKg
 Ho+wVqjT3JWYdAcCP52hkUguTChqDfhUvxiw18Tk/rWkYu+Hf4k1IoZgXaCpcWxGqE5R
 orUbUIVVOXrWysDqlWCRS68rTyxSKACLB/gVSmRopR5apZ5nMCnBUaXFDpjF99niJaI6
 6WqGu0k2aD/N9J4DnR0RnwfVGpPF4iqO9kuisPmPY4fcxmfU9PZ2FDPyf87KnQzHWj6G
 W1hoqVpZG5Gxyw+5bPHBYFP+leyDOSa4g9gvqF3h+ecHmPzpgWV9adb8KQ1nC3L2ySOb
 iKYg==
X-Gm-Message-State: ANoB5pmw1cg1C53zpdTv2psWgJHckAm6IcfbdBsk8tr4Ca2cM8gsHLZj
 ak60b1AhxuGHJw1X/36TmXYhd6wAhFvohE7wduHk4h0Z1y/YnTyZEketv7vg5VLMxC13V0ukK5g
 +q9xIDsNPRbGVqEBlIJy3u01ktJjs
X-Received: by 2002:a05:600c:1e8c:b0:3d2:381f:2db5 with SMTP id
 be12-20020a05600c1e8c00b003d2381f2db5mr19209751wmb.22.1671533815487; 
 Tue, 20 Dec 2022 02:56:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4a+ZtxclIBChh0mEg/0iBXMSsKhOrf2tVAYpV1g/PbE5hUiB1G8zmgvlQiiVuguSFTXrfvlw==
X-Received: by 2002:a05:600c:1e8c:b0:3d2:381f:2db5 with SMTP id
 be12-20020a05600c1e8c00b003d2381f2db5mr19209736wmb.22.1671533815320; 
 Tue, 20 Dec 2022 02:56:55 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t189-20020a1c46c6000000b003cf87623c16sm22517133wma.4.2022.12.20.02.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 02:56:54 -0800 (PST)
Message-ID: <0a9cbae1-941f-0f50-3ba6-5a47d15bc1ce@redhat.com>
Date: Tue, 20 Dec 2022 11:56:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 7/9] drm/fb-helper: Fix single-probe color-format selection
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net
References: <20221213201233.9341-1-tzimmermann@suse.de>
 <20221213201233.9341-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221213201233.9341-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/13/22 21:12, Thomas Zimmermann wrote:
> Fix the color-format selection of the single-probe helper. Go
> through all user-specified values and test each for compatibility
> with the driver. If none is supported, use the driver-provided
> default. This guarantees that the console is always available in
> any color format at least.
> 
> Until now, the format selection of the single-probe helper tried
> to either use a user-specified format or a 32-bit default format.
> If the user-specified format was not supported by the driver, the
> selection failed and the display remained blank.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Thanks a lot for fixing this.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

