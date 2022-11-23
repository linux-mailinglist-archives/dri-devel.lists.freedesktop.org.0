Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54C46352FA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3562010E517;
	Wed, 23 Nov 2022 08:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC03310E517
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669192949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tj5HHw0MaONX2OyD1O1MVIKr0mbpVL5mmj0LdmZ+V/Q=;
 b=U00ZakP84vVhE1bFp+kNdJWMY3uF0/gCo3aSuqnQIClGIybMi2N+HkAGw9uFp7RKoP51bY
 DxFYmx7Pyl0G3CEclQQvVY6vPRtmgXGDt/1QCjqDOYcvlqP9EL9xxvSPjPWiZ/3lIedzIf
 SiYO86VqHo1lgiNBHW6i43XyYtfZG+U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-MwzQz1uOOUGtMX7XppTmtQ-1; Wed, 23 Nov 2022 03:42:27 -0500
X-MC-Unique: MwzQz1uOOUGtMX7XppTmtQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 m17-20020adfa3d1000000b00241cbfd296eso2745504wrb.15
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 00:42:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tj5HHw0MaONX2OyD1O1MVIKr0mbpVL5mmj0LdmZ+V/Q=;
 b=gM6vW0cJY5pZUeDOwdgR4IlQL66AcOIvkXIpNuQI2nCZoDELYU1YXmSJx4aJpKh+zW
 PeWCY/6u0+pHvM9PJfHnxqy8yfwW+RIZrpue2Yf11oj+rUGp1AeO/JZyRcQztpm3x0Ak
 ynnDEGJvQOrO1cmDXW1QUDBuXBWHN04l/eyg6FtSPZ4LXV6CFmKBSwJi6iRElmBseJRS
 RiLgKIW067eWk5zf8ynTYTI9JYVoXci18e2bkVje6MAPFtICK2Gq+dL4LlszD96QZvEl
 q3So2h8ZqUVbFHLVjowXlXAUn3n9COvOpgKT+XBHKlvIelQdFsEETPVkidseshyAszvS
 wX7A==
X-Gm-Message-State: ANoB5pn5wRGliaInsH538ajsohgPqTZiLjM7VsVj06VUzOPuK5I6Sui4
 pDeUSwx8LNrJ6kE/fD0TwY5n6DJS+b20z4+Fdq91jkoTxF+IYP//p3wHoKZDvTloT6Xv47OUoXS
 /XshcUElrvjiUeRJu6u5hQPLnOfFm
X-Received: by 2002:a5d:6909:0:b0:241:d4c1:9ffd with SMTP id
 t9-20020a5d6909000000b00241d4c19ffdmr8526417wru.110.1669192946646; 
 Wed, 23 Nov 2022 00:42:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf47DoyU0Mj7BVBhhQnYkaJFktW5b66Y6L4ebrjnoDdVyyfuulEAbT8KnqXtm+eARmHUNyHhMA==
X-Received: by 2002:a5d:6909:0:b0:241:d4c1:9ffd with SMTP id
 t9-20020a5d6909000000b00241d4c19ffdmr8526404wru.110.1669192946408; 
 Wed, 23 Nov 2022 00:42:26 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c35cb00b003a84375d0d1sm1504114wmq.44.2022.11.23.00.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 00:42:26 -0800 (PST)
Message-ID: <e8cb1fef-8c0d-a2b1-7468-ce39f93f8dea@redhat.com>
Date: Wed, 23 Nov 2022 09:42:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 4/6] drm/gud: Split up gud_flush_work()
To: noralf@tronnes.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-4-9de3afa3383e@tronnes.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221122-gud-shadow-plane-v1-4-9de3afa3383e@tronnes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 11/22/22 21:58, Noralf Trønnes via B4 Submission Endpoint wrote:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> In preparation for inlining synchronous flushing split out the part of
> gud_flush_work() that can be shared by the sync and async code paths.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

