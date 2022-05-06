Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B71C51D259
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 09:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B01112070;
	Fri,  6 May 2022 07:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2898112070
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651822349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Esh+VtFiG4BswDTMwa1WxXaR2Q4vfRjhnN3ZC2gg1v4=;
 b=YlOwHYaGgReuULOXTpbgRy8AAAwEbbKGv8n5IGZ6DcwjO88GUsPTv9VkB4fEOdJg5iAG0s
 QtRXSLWvo7pGCeZMOl6VdR4EfeYAxUXWi2leK9lV6ZIa0PSO2rpeWWCw4lLkSTOdX/Vnr0
 IXj4CBsFN6zhumttKCEnU32LmAlr9eU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-H8WNgajaMmm4JF1SixTpog-1; Fri, 06 May 2022 03:32:28 -0400
X-MC-Unique: H8WNgajaMmm4JF1SixTpog-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so2528739wmr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 00:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Esh+VtFiG4BswDTMwa1WxXaR2Q4vfRjhnN3ZC2gg1v4=;
 b=mV/5xO3vF9I+TX6sgVZ7+ZEfbsiOSyRb18oORlse6m0MPdzkQS/uA9CCS4t9tck7pl
 P+YbFC4er7zVVfw4LNIJlNwRqooUd9O7aM+iFE/hiCKElkHg8TOMq6N1ruaOTX8Sqk0M
 V8J+LebawmfnnCy9x59hTxXeRkQWF6Mx+CipVqShwftO5B7eE8HK13RC4dFNFcdcJKP2
 /q/dsmQ6yaYMXeGoFHFo83Al18zeC+HWw9HIY2lfuJIw+0JjiS1IfuHVXxhxxXp0XVpx
 fgH/PgrzqY0PNv6zax7Db52y8+lxClo31rZ7oaP+zMsWMeAaJ0JYqPq08NF6AJ/RHeBR
 3Maw==
X-Gm-Message-State: AOAM532dtAqNvscXIyfXxxf3/zM6wCJ6XF3bVf+ORaT1MaNd5mUg+hUL
 3IfQgghyyQ9LzJ/obgJxlU2XSgMBUryZSqhEJj1XcwRguBFf8DPuK1ecu4eU0gjY+Ftc69rJDcW
 CUuCEBvZfyRtSBm0ZvXNcl/4tZu9P
X-Received: by 2002:a05:600c:4e86:b0:394:1cac:4146 with SMTP id
 f6-20020a05600c4e8600b003941cac4146mr8436304wmq.130.1651822346501; 
 Fri, 06 May 2022 00:32:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3wzAqzDwdh+znVgqwfq+00rTuhWA2qWcgd56hBPkF6MqkT23hcfOtTlTn8ls2dSsXhVzhqg==
X-Received: by 2002:a05:600c:4e86:b0:394:1cac:4146 with SMTP id
 f6-20020a05600c4e8600b003941cac4146mr8436273wmq.130.1651822346271; 
 Fri, 06 May 2022 00:32:26 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r10-20020a5d4e4a000000b0020c5253d921sm2803889wrt.109.2022.05.06.00.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 00:32:25 -0700 (PDT)
Message-ID: <642f515e-aa71-7c90-a715-e49dcf12baee@redhat.com>
Date: Fri, 6 May 2022 09:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] Revert "fbdev: Make fb_release() return -ENODEV if
 fbdev was unregistered"
To: linux-kernel@vger.kernel.org
References: <20220504115917.758787-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220504115917.758787-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/4/22 13:59, Javier Martinez Canillas wrote:
> This reverts commit aafa025c76dcc7d1a8c8f0bdefcbe4eb480b2f6a. That commit
> attempted to fix a NULL pointer dereference, caused by the struct fb_info
> associated with a framebuffer device to not longer be valid when the file
> descriptor was closed.
> 
> The issue was exposed by commit 27599aacbaef ("fbdev: Hot-unplug firmware
> fb devices on forced removal"), which added a new path that goes through
> the struct device removal instead of directly unregistering the fb.
> 
> Most fbdev drivers have issues with the fb_info lifetime, because call to
> framebuffer_release() from their driver's .remove callback, rather than
> doing from fbops.fb_destroy callback. This meant that due to this switch,
> the fb_info was now destroyed too early, while references still existed,
> while before it was simply leaked.
> 
> The patch we're reverting here reinstated that leak, hence "fixed" the
> regression. But the proper solution is to fix the drivers to not release
> the fb_info too soon.
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> 

Pushed this to drm-misc (drm-misc-fixes).

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

