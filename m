Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D307651D41
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350A810E09B;
	Tue, 20 Dec 2022 09:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4893E10E09B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671528250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYMKnwowgCZbmQLyZb+O1xPkwcQc1vWKiI5mpSCZQTU=;
 b=KnJlTv6Iotd8KkRcpmM2JzLxMdXebSyl4QeksvLdKsMe3rq9wUczzvDs72Od2aTtRSgLaD
 WtaF3g6Ph3g2dcdr3fHYoyG2P8wCnm4Wm1HRLjIxeClp2zjVCsMQctEItLyM0Lc3TUBy3R
 p+UyJVD5KBUhV6xIZZZFiMv3lVfrUA0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-161-fT_WNUOzOsGnrqAkDY89lQ-1; Tue, 20 Dec 2022 04:24:09 -0500
X-MC-Unique: fT_WNUOzOsGnrqAkDY89lQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o5-20020a05600c510500b003cfca1a327fso6284760wms.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:24:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hYMKnwowgCZbmQLyZb+O1xPkwcQc1vWKiI5mpSCZQTU=;
 b=Vvb9ZLnYZeB/gcbtlfx8yfp4YQFftaiG2yNWPI1MhKcYKFgcJ9o8Uu1r9b8tv/rshG
 AyNoDYEcLxyMBj3S+HVIDRs5J9jWpGvQTJZ8VoYLkZXDou+2STSHy1GWwdK+z5eBkZyC
 CdnFkmBjfVhHc6FW5Nvy9eDkX9oS6OE83OxPgfzsILLgQ73bvNe4Z/6OBHlMF3GIC6pb
 4ke8i4Gy9LqlkIhU3m7XLLNV4WfEQxuPKa6C3fwhWEq/9PYLDGTaKSslklP9dGYKRxmX
 TmNLK14g07ML+zX9auJujuHR+IKaHynG277kl6w2M9Nc3eCrvyUw6P4T4/6yYfZTfXGA
 FnqA==
X-Gm-Message-State: ANoB5pmz3yjcrdr7o5lYDJLjsxdAyc9vDl0MwySkjRGH3CyWA5Iic7Rh
 ghu+jcoBN0axPNZNWrf+w8eOrvUQsrB4zuPpiiheZAZYNHokBcZHoE4C8kAWA7/CMuWEzDDWW1Y
 u2cu4eGSXB00TKM3/wlyjkFL7bqxc
X-Received: by 2002:a05:600c:3592:b0:3d1:bc32:2447 with SMTP id
 p18-20020a05600c359200b003d1bc322447mr34442420wmq.21.1671528248079; 
 Tue, 20 Dec 2022 01:24:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf63KxuIxT0M/bl3iLHanyFrnj5hgoC/KBz3bLt1CmA/PA7eDrziJ0q3Lz1WCcHGowxEUJxpPQ==
X-Received: by 2002:a05:600c:3592:b0:3d1:bc32:2447 with SMTP id
 p18-20020a05600c359200b003d1bc322447mr34442411wmq.21.1671528247925; 
 Tue, 20 Dec 2022 01:24:07 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c1c9200b003a84375d0d1sm24663667wms.44.2022.12.20.01.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:24:07 -0800 (PST)
Message-ID: <e807855d-cfaa-ebab-8aff-7a3e78b1967d@redhat.com>
Date: Tue, 20 Dec 2022 10:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 07/18] fbdev/clps711x-fb: Do not set struct
 fb_info.apertures
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-8-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/22 17:05, Thomas Zimmermann wrote:
> Generic fbdev drivers use the apertures field in struct fb_info to
> control ownership of the framebuffer memory and graphics device. Do
> not set the values in clps711x-fb.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

