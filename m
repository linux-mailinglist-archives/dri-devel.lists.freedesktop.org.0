Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F224D2F7C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 13:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645AD10E96D;
	Wed,  9 Mar 2022 12:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C11710E96D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 12:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646830410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHT0karyGRRNCWlLhVHNQSuvHWxMwLXpGfkux8ifP78=;
 b=WoV1SDspwTkuXdIYl4tHkWEr475mZtxZKGxb8Kuh7X7FP7RcA7xcM2s+t8vmT1r78taVHm
 3M9C5S5THbE5gMyZ4Ywyia7+0ZrXTKzEXLkVHIoTZAqachuZoNXieDxjWVZSe8HODKKAhK
 vQWPN2VJe42pqVSjxcBOP2WgTqzaVP4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-aOX7m78zNQeQZ4AVDIcBIA-1; Wed, 09 Mar 2022 07:53:28 -0500
X-MC-Unique: aOX7m78zNQeQZ4AVDIcBIA-1
Received: by mail-wm1-f72.google.com with SMTP id
 10-20020a1c020a000000b0037fae68fcc2so2540818wmc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 04:53:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bHT0karyGRRNCWlLhVHNQSuvHWxMwLXpGfkux8ifP78=;
 b=m6SqtRl3GbEwudlL93vygcyXkPZ3ClRfT/UweaQUZ3B34kaiKvJiKA6sJXSqFre6AQ
 mRq7OkG99PaCKM7A6nyLoyDuxwmmA62Om7rZcZYZLIqhRBA+ADdi0niL9aaL2s7XQyHr
 NXYywW9oqLYJdFNSnHanmEiElmC0fkbUXumv2roCysNUFjMaEJRNzGMlgvsbW5UWxIr7
 Nqbk9wpWYUI1kjemnqhsGNyGEuf1qEFnq859GmpVtqo2k5rnvI4jkwKSqg38o4vIzdG7
 TurQhE5SOuaVDyJ46MMaTFjzKS422N9Nh6yitBSAebv50Iey4gAdq0jtRvhBHTQJkV+F
 35Qg==
X-Gm-Message-State: AOAM531JCJD9N/+U5NhCcKr6VCT54fsvENFrMBTI2caS89FjOZsTIx34
 sKX+L4YSIUmVkOv/3/qZT3qyD1QhO8mTbisd1y/HrcsU1wCoH08ugXClSQ5GM6jcMRAZTjJAUsW
 P0xrAkzzE24lKdh8LuKcIzC+Ms01n
X-Received: by 2002:a05:600c:4f8f:b0:383:d0b:3706 with SMTP id
 n15-20020a05600c4f8f00b003830d0b3706mr3328423wmq.117.1646830407592; 
 Wed, 09 Mar 2022 04:53:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhA94T4hLNZGfPp9ZlHTC1cFNUMD4hfeN8kfLp3ziXcsrKaa2MDMubqSWEOGZcY5C6vhou4g==
X-Received: by 2002:a05:600c:4f8f:b0:383:d0b:3706 with SMTP id
 n15-20020a05600c4f8f00b003830d0b3706mr3328411wmq.117.1646830407398; 
 Wed, 09 Mar 2022 04:53:27 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a1c7919000000b0038999b380e9sm1663075wme.38.2022.03.09.04.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 04:53:27 -0800 (PST)
Message-ID: <7d9b2035-13d6-5d58-e21c-52bbb9282796@redhat.com>
Date: Wed, 9 Mar 2022 13:53:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 04/10] drm/framebuffer: Use actual bpp for
 DRM_IOCTL_MODE_GETFB
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <d87068fd1e2cc6f772a64ba9306350a31baeae58.1646683502.git.geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <d87068fd1e2cc6f772a64ba9306350a31baeae58.1646683502.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> When userspace queries the properties of a frame buffer, the number of
> bits per pixel is derived from the deprecated drm_format_info.cpp[]
> field, which does not take into account block sizes.
> 
> Fix this by using the actual number of bits per pixel instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

