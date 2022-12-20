Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D0D651DDC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549FA10E36D;
	Tue, 20 Dec 2022 09:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC17710E36D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671529494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1J4eLv+5To8BjnLItTbs6pq8g5LjZHk9PMjLEQIi8Lo=;
 b=IwhJ1TnMPfZUbZ7tPKa6oNzi3XFasCTygm/h3L4s5eQg+txyIoqVQh5S8A8IJZjsuqCzud
 3qgTO9buphS/BGOFWNOSVoBqiWEaYEYbh5yLDJFNMHzGDQOAXwPyUUiJzhRyUctC0fVOwu
 U0I91t9VQadKHfNJPZYV7mvSHTLwb9M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-STcHXkhkMEqMNRnoqH5zOQ-1; Tue, 20 Dec 2022 04:44:53 -0500
X-MC-Unique: STcHXkhkMEqMNRnoqH5zOQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 q21-20020a7bce95000000b003d236c91639so2402471wmj.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1J4eLv+5To8BjnLItTbs6pq8g5LjZHk9PMjLEQIi8Lo=;
 b=na9izpLrc3kmnh5MOowbbYXNCrIkw5FORI1CJFthAkkSuTgxLS9zAt9CvGCRyoE5tv
 XXARK++kTAG6SO890Z7TUIG666pO+tVZeEvfsZl3iAOyPSo6qrLOmR5rbUNSAg8rGiws
 S575f4R6WQuVTKGSfNmOswkx39NNOIV08MnzIOlQl/RtNFfaQ46ARtiJmVuh0GoU4oNZ
 Qll3SMk4hQ6tMyxj75EYY2KmI/J628vg8GeTt6P53iCZ7NvpW4vW8pnG/KlfUSm7sI28
 hY7UcKVWjIUoGVWdMH5db/p9t2ceWX5QXAhN9nxFt927rWDj85bBR1x1DYyddOM0OhMx
 sJqA==
X-Gm-Message-State: ANoB5pmyXgu7Jg3AbVAHDh71idWnPSRhTH0fhMwGbC/j49bLxLJJ8dUw
 svHKASUPgoV9atFZ5z0N5iy8b8YNkBFMbelk3KsBp7od+bZB4My3LaReyuX/eBtqG/cJJhnD5W7
 nsyuJISC9t0O8tprvXi0DpFYuj9xP
X-Received: by 2002:a05:600c:3508:b0:3cf:b73f:bf8f with SMTP id
 h8-20020a05600c350800b003cfb73fbf8fmr34866242wmq.7.1671529492810; 
 Tue, 20 Dec 2022 01:44:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf74M8Sm1ZUMeD1MRSt8ye6pyF2JALOeT/hhACXzocPTXyP3LI6efvyoi2Xa1weHvEDgcZ0pkQ==
X-Received: by 2002:a05:600c:3508:b0:3cf:b73f:bf8f with SMTP id
 h8-20020a05600c350800b003cfb73fbf8fmr34866233wmq.7.1671529492648; 
 Tue, 20 Dec 2022 01:44:52 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t16-20020a1c7710000000b003c6f3f6675bsm21680659wmi.26.2022.12.20.01.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:44:52 -0800 (PST)
Message-ID: <cb8af91b-4d5a-6d0a-6604-d99fc4a0f0e9@redhat.com>
Date: Tue, 20 Dec 2022 10:44:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 17/18] fbdev/vga16fb: Do not use struct fb_info.apertures
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-18-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-18-tzimmermann@suse.de>
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
> Acquire ownership of the firmware scanout buffer by calling Linux'
> aperture helpers. Remove the use of struct fb_info.apertures and do
> not set FBINFO_MISC_FIRMWARE; both of which previously configured
> buffer ownership.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

