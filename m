Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246F24D9B59
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 13:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137A610E41A;
	Tue, 15 Mar 2022 12:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B9310E443
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647347793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=meH+qCfj6lH9OjS/cwuXTPPvOKgAu1/eJ1NA4WtkLWw=;
 b=XhNkYtxDs/rmrIQunN/OjYQDceUHOKaqqboWz6KTZh0ESrW2l0qqXr4WC9siLa6QwH8cxt
 Rozx3CW0JdNmaFKaQjnvo7+VGs9ml/xeIwdyEN4vyPqU1oMXUnm2IRArf36z0X2Btv1Pqh
 l2Ofs1GxhMnKLVMjG7BwnIAyCAFBPX4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-jnesOGlhOOaNIjLv_VazSg-1; Tue, 15 Mar 2022 08:36:32 -0400
X-MC-Unique: jnesOGlhOOaNIjLv_VazSg-1
Received: by mail-wm1-f70.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so1110326wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=meH+qCfj6lH9OjS/cwuXTPPvOKgAu1/eJ1NA4WtkLWw=;
 b=mnXcKb1ur5zShy5ScNEm5mTTGCZQzdVR1xEyJxgjLIx09Nc9iSK1pxEKYv7H3NpfG+
 lCfLl+RoZAnkF8WBt9upj1pnJGG2h73vZ6P7BEgLucdH1ZXTn6SvgeytC1FnkapnNU78
 2RLSgRk5kxJdhDKLbfYNCfl8ovK4tOgumTAaxX6un/MknRY9xNLIeYOmCyv6cXwApX7D
 nnqmF+3g1qYu0wOhs9WUccsWp0jytQyOlELy6XxYdORIMTUywA3aBD2LgsrNO7k/4Cp5
 WXlzsm11OqGPCZZFCdJ2+BganFpFhP4tJboAWPro+dyKmGPNJLiowyq2KMoN4e9dgtmw
 pBeg==
X-Gm-Message-State: AOAM533i29WVLjJEVKzocJu49hjmu69ARUrDz4z2tr/h/nK+jIXF1tcd
 5NtnmvFdinFBCT4vRJsfcRHFkbulroQtCNCIPgEqsXIIRY1OKqhMQyNgUSFFBGtw/RpMIL4IWt+
 UFIgbUAmsz9qPTFv/xxONlmdUOsm8
X-Received: by 2002:a5d:5848:0:b0:203:a65d:1f49 with SMTP id
 i8-20020a5d5848000000b00203a65d1f49mr9962620wrf.397.1647347791478; 
 Tue, 15 Mar 2022 05:36:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxs66bOxh/TumvNSO4GmYvVoUpKAXWPE2kOcJ3ObbpEpN4Okx+fZPk6CJYHBO98nKh9ymjiA==
X-Received: by 2002:a5d:5848:0:b0:203:a65d:1f49 with SMTP id
 i8-20020a5d5848000000b00203a65d1f49mr9962610wrf.397.1647347791249; 
 Tue, 15 Mar 2022 05:36:31 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a5d5407000000b001f0be7a7578sm15371811wrv.5.2022.03.15.05.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 05:36:30 -0700 (PDT)
Message-ID: <fcdcd046-63f5-495d-b5ad-f407592f2160@redhat.com>
Date: Tue, 15 Mar 2022 13:36:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] drm/repaper: Reduce temporary buffer size in
 repaper_fb_dirty()
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20220315110707.628166-1-geert@linux-m68k.org>
 <20220315110707.628166-6-geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220315110707.628166-6-geert@linux-m68k.org>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/15/22 12:07, Geert Uytterhoeven wrote:
> As the temporary buffer is no longer used to store 8-bit grayscale data,
> its size can be reduced to the size needed to store the monochrome
> bitmap data.
> 
> Fixes: 24c6bedefbe71de9 ("drm/repaper: Use format helper for xrgb8888 to monochrome conversion")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Untested due to lack of hardware.
> 

Patch looks good to me but I also don't have this hardware.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

