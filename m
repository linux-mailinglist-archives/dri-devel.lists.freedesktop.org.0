Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C4952469C
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 09:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A4B10E3EA;
	Thu, 12 May 2022 07:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CBC10EE3E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 07:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652339651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHw4bW7IzLkJtw4xVEohRQ7RXKG7NPJ5rPcMug00zTQ=;
 b=Giw4S82cRXTZmDj9+0sOQvz5D0fdJZ7quEFG0dokRhyYJ9+WyR5eAAZRn5R38EMThWqIul
 putWZMfaZ0p8YFn0rmpSPFo7ht/My9lhgNlvqoUPov34M113zEiZwaA5rU/2fL9ygsH1wT
 ocnXRRtMXPuv1hoanRMM7whneE+zm3A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-mn_FcVAVMpKUs8J-RuezVQ-1; Thu, 12 May 2022 03:14:02 -0400
X-MC-Unique: mn_FcVAVMpKUs8J-RuezVQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n26-20020a1c721a000000b003941ea1ced7so1311350wmc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 00:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UHw4bW7IzLkJtw4xVEohRQ7RXKG7NPJ5rPcMug00zTQ=;
 b=xLpMgWVcpgV1HOdeeLmbMcCALP8hu3xivI8BW75ufe9agSWrgOLooQXBf1d1bU46Ve
 Rv5Twa6lp6ikOfLjPkDrSTLZq/9yZdmdT/ZlYVX9x3cUns21/N/ifD2ymakGdIfij5Ds
 5PpZ4jrbDo7IlFCqY1WbwxEG8iE80M33mSo4j1LBdZDt5cwLikcXWPAePtHZs7c88PGh
 uNONOJ7rGakxaRC4cAsQ+zrIJfazlj1WCNQxZ9MUkJVnKRUd68pgYlI8FraZKgqWR72k
 LZh0uloGnVcukExuEmfjNQn1jui3cYjW87TtczQ3iioUJkBILPRYHgbm4oYvHnR9rlwy
 pR1A==
X-Gm-Message-State: AOAM531MjqIwZsSAc547ycVUZ+FeAPlUfi/QCV/+r5fRedj+NxRUsR8l
 DQ1dsMPglx/apNMJAcNcVv92Y+H1SBFRzVQ9KbqlO+rC49WYXSn0voxpynYsIGZhNNcQT7YBZ10
 dGd8pifHkONt4II9ZiohBhHcDQZQm
X-Received: by 2002:a5d:6088:0:b0:20a:e81e:c76a with SMTP id
 w8-20020a5d6088000000b0020ae81ec76amr25363406wrt.182.1652339641259; 
 Thu, 12 May 2022 00:14:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZYr2RkrKtcgTTwQdEOgCLlwu400P2kVkLB6OWrtVr+60uWVHLGXE9aru17hWJQSaPVPXDcQ==
X-Received: by 2002:a5d:6088:0:b0:20a:e81e:c76a with SMTP id
 w8-20020a5d6088000000b0020ae81ec76amr25363386wrt.182.1652339640960; 
 Thu, 12 May 2022 00:14:00 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m6-20020adffe46000000b0020c5253d8casm3321274wrs.22.2022.05.12.00.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 00:14:00 -0700 (PDT)
Message-ID: <1996f1f6-bd6c-b4ce-60ce-e06b242233ce@redhat.com>
Date: Thu, 12 May 2022 09:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/3] drm: Always warn if user-defined modes are not
 supported
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20220511183125.14294-1-tzimmermann@suse.de>
 <20220511183125.14294-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220511183125.14294-2-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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

Hello Thomas,

On 5/11/22 20:31, Thomas Zimmermann wrote:
> Print a warning if a user-specifed display mode is not supported by
> the display pipeline. Users specified the display mode on the kernel
> command line with the use of the video= parameter. Setting an
> unsupported mode will leave the console blank, so we should at least
> let the user know why.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_modes.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 14b746f7ba97..40b7b245e98c 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1328,6 +1328,10 @@ void drm_mode_prune_invalid(struct drm_device *dev,
>  	list_for_each_entry_safe(mode, t, mode_list, head) {
>  		if (mode->status != MODE_OK) {
>  			list_del(&mode->head);
> +			if (mode->type & DRM_MODE_TYPE_USERDEF) {
> +				drm_warn(dev, "User-defined mode not supported: "
> +					 DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));

I wonder if should be more explicit here like "... and it will not be used".

> +			}
>  			if (verbose) {
>  				drm_mode_debug_printmodeline(mode);
>  				DRM_DEBUG_KMS("Not using %s mode: %s\n",

Does it make sense to keep this line when verbose is set if there's a warn
now. Maybe just keep the drm_mode_debug_printmode() but remove the rest ?

I think the patch is good as is too, so regardless you do:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

