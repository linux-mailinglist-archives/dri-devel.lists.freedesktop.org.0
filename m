Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F95246C3
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 09:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C226410E8B5;
	Thu, 12 May 2022 07:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3306C10E8B5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 07:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652340027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cg82XRhfZXAnT7e0TgcoO7FAhwIhCTsEZtqwekHHeHg=;
 b=MDjZ7iAUzyDvtA+WN8uV5+f55XBS7Oz0Zkkbgipi74PtxqhnSN2MuEnDVvhDb+NUgT1SYo
 0p8T4Wl2VR2G/dnPoD5Nxl6yQXbmAmoSa/Wjf8Y794XMu/pxXbgXRMBX1BWHGTaxBFWMBH
 sF3r+BWDTFY6eIS6r3gEqWGfjSqE8EI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-aj3Trf-SPnGLOoas3G-DcQ-1; Thu, 12 May 2022 03:20:26 -0400
X-MC-Unique: aj3Trf-SPnGLOoas3G-DcQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 q6-20020a1cf306000000b0038c5726365aso1328262wmq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 00:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cg82XRhfZXAnT7e0TgcoO7FAhwIhCTsEZtqwekHHeHg=;
 b=SoQijm108Xetu76hexufYsBi+kOlJJKOFa2NdpkpAtaMALc9NnZKzaCdw1Ya1SXwuO
 HXnq5gfQsB1jBugm/EWJ493Tzzb/T+I5CpTUfPOI6pcSQ9StWrJk2vJDR+1FeIbgYJkj
 PRJiuIbEprMFPh7pGSOdXxln9SQWwZ9y89oXVnbRVKxoHV1ANjU3br1WEMi+SVY8+5Dc
 Rblz/EGF9niCqvHwbfmocBIJHNL3YLcS6VAI7Vggql0MeiDlLPrIbMwrsrGKENHIjSuu
 lU83bBk1ValUlBi+wcZ83eSU0VnpIEq6l6SObquDX3zekOEzjRd6RYuiyIFuTUw3qxkH
 Yu6g==
X-Gm-Message-State: AOAM532cNJjFxGKvRxcqit8eX3MuPU3Hq4FvBsGJwGU/BoDCCGwwymOr
 PNMGUSATWcnz4pXhs/UgpwSQR1YSleorEmL93t2/sonZbfqjhiI9UJfQoqBgnVnH/epmNsmtf6d
 oBCD6coC0truWeibmHt6Mq80QbOT0
X-Received: by 2002:a5d:648f:0:b0:20c:4eba:f529 with SMTP id
 o15-20020a5d648f000000b0020c4ebaf529mr26398557wri.237.1652340024873; 
 Thu, 12 May 2022 00:20:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa6iH0TwBuswN1YmiIM81C7zw6SowRuWsnSaWatg/HsGp3TcTAEBMUjq3vfjgSjTe4Sbrtpg==
X-Received: by 2002:a5d:648f:0:b0:20c:4eba:f529 with SMTP id
 o15-20020a5d648f000000b0020c4ebaf529mr26398539wri.237.1652340024678; 
 Thu, 12 May 2022 00:20:24 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e1-20020adfe7c1000000b0020cb42671aasm3307235wrn.105.2022.05.12.00.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 00:20:24 -0700 (PDT)
Message-ID: <33d80e77-88a5-1eb6-b488-34620c4478a2@redhat.com>
Date: Thu, 12 May 2022 09:20:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/3] drm/client: Don't add new command-line mode
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20220511183125.14294-1-tzimmermann@suse.de>
 <20220511183125.14294-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220511183125.14294-4-tzimmermann@suse.de>
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

On 5/11/22 20:31, Thomas Zimmermann wrote:
> Don't add a mode for the kernel's command-line parameters from
> within the DRM client code. Doing so can result in an unusable
> display. If there's no compatible command-line mode, the client
> will use one of the connector's preferred modes.
> 
> All mode creation and validation has to be performed by the
> connector. When clients run, the connector's fill_modes callback
> has already processes the kernel parameters and validates each

s/process/processed and s/validates/validated ?

or 

remove the "has" in the sentence, either work I think.

> mode before adding it. The connector's mode list does not contain
> invalid modes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index b777faa87f04..48e6ce16439f 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -158,8 +158,7 @@ drm_connector_has_preferred_mode(struct drm_connector *connector, int width, int
>  	return NULL;
>  }
>  
> -static struct drm_display_mode *
> -drm_connector_pick_cmdline_mode(struct drm_connector *connector)
> +static struct drm_display_mode *drm_connector_pick_cmdline_mode(struct drm_connector *connector)

This seems like an unrelated cleanup.

The rest looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

