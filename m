Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737E45EF643
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A2510E619;
	Thu, 29 Sep 2022 13:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4468210E617
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664457659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADRj/CZhJu+YRYhcRWl5EAnXhCoDamXVX7Xznhs4ZBU=;
 b=BAVrTq6SGgmAtHlPGI8c38RYWgEqUV+B/5Cgm4k0skhuxghZun1QHXitcvLO2qIoXF+WJb
 R4Xxyrol47jtCmSyK34xEemS/ZMOVK3WOhbQ9MAKI79U0y0BOuB1Vu6vT9qQ5rNPDYfhkl
 y7NKrZ2QWD+rKJ/UAixvZCj5JMQaflY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-RzaJ5NnQO-SES7CYy5wEDg-1; Thu, 29 Sep 2022 09:20:58 -0400
X-MC-Unique: RzaJ5NnQO-SES7CYy5wEDg-1
Received: by mail-wr1-f70.google.com with SMTP id
 m3-20020adfc583000000b0022cd60175bbso527766wrg.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ADRj/CZhJu+YRYhcRWl5EAnXhCoDamXVX7Xznhs4ZBU=;
 b=yTQa/Joyc8NGzIdowGdXRNdWMDyuj3FDeOf3pSH4tnGwco8czPkDFS+K2LZlRUzVGB
 QnK/yLk8A6l5RwU32+S9Xz8upFm3zFXwDquftFYx/srPPo/ZFcYuzwLy3jrA+DoVQt19
 HPtoFytx4YuKl7cn4ogbKqwxcj4Gcgzt5YdJWual5DhdACdvXym8S5cRfi6KC2aBfMOm
 T1aslCloa2FZVwoSVc2eWZGzvMES0W0FJpeDtZ18qsGc5Hx7c4IzEK1hun5oVt2nEmSV
 pzM9+yPCMMnavnLUd49852+QT5Ow25Rp5tEZh1tiJ2+K9i0hNTuEpFVGvDB4p5zzyV+V
 DGzA==
X-Gm-Message-State: ACrzQf1/R3VGyHPjMCW1pxDMm7tcHPdIGPoc+KLnxnkfgnf7JbHLXHhj
 GsJbIVvL7mBUknrY7rM2AMhjN4Sk4ock1g4f9fE+cPavzGSjIrk0lNy7KJj5dF5hAt9PeffpQHu
 gyAasjOA4q4ud29TxzLZ35rHgCLDE
X-Received: by 2002:a5d:6dac:0:b0:22a:fbff:b2d3 with SMTP id
 u12-20020a5d6dac000000b0022afbffb2d3mr2193703wrs.543.1664457655732; 
 Thu, 29 Sep 2022 06:20:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7snOu42qNw5+9xxR/RA94kSZhLn0J2M5vFF7uHjcw2FjAx1r3IuVCrikE6en9/BNjPW8r3MA==
X-Received: by 2002:a5d:6dac:0:b0:22a:fbff:b2d3 with SMTP id
 u12-20020a5d6dac000000b0022afbffb2d3mr2193688wrs.543.1664457655502; 
 Thu, 29 Sep 2022 06:20:55 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b8-20020a5d45c8000000b0022ca921dc67sm6550047wrs.88.2022.09.29.06.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 06:20:55 -0700 (PDT)
Message-ID: <562ca68d-a241-90e9-975b-c1274db329f6@redhat.com>
Date: Thu, 29 Sep 2022 15:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 02/16] drm/udl: Test pixel limit in mode-config's
 mode-valid function
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-3-tzimmermann@suse.de>
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

On 9/19/22 15:03, Thomas Zimmermann wrote:
> The sku_pixel_limit is a per-device property, similar to the amount
> of available video memory. Move the respective mode-valid test from
> the connector to the mode-config structure.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +static enum drm_mode_status udl_mode_config_mode_valid(struct drm_device *dev,
> +						       const struct drm_display_mode *mode)
> +{
> +	struct udl_device *udl = to_udl(dev);
> +
> +	if (udl->sku_pixel_limit) {
> +		if (mode->vdisplay * mode->hdisplay > udl->sku_pixel_limit)
> +			return MODE_MEM;
> +	}
> +
> +	return MODE_OK;
> +}
> +
>  static const struct drm_mode_config_funcs udl_mode_funcs = {
>  	.fb_create = drm_gem_fb_create_with_dirty,
> +	.mode_valid = udl_mode_config_mode_valid,
>  	.atomic_check  = drm_atomic_helper_check,
>  	.atomic_commit = drm_atomic_helper_commit,
>  };

It's always confusing to me whether something has to be in the .mode_valid
for drm_mode_config helper function or for the drm_crtc_helper_funcs. This
driver is still using the simple-KMS at this point so that will be in the
udl_simple_display_pipe_mode_valid() if should be the latter.

In this case since it seems to be about a pixel limit, it might make sense
to have this constraint for the DRM mode config. But since it depends on the
{h,v}display, I thought that needed to ask if instead should be for the CRTC.

Any in case,

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

