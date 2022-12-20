Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E83651D20
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EC510E351;
	Tue, 20 Dec 2022 09:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F5310E351
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671528003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1OcEOi6wfApoNJ5QX9xUUF80M6DZAUCfFxv9pSqRsVA=;
 b=WnPihU+vfoHV2bn1BbhoanVL1Ohe6aVQ+nQoht4oRG1UB5JFTKWn5YRgn2w4mI1Bprt+EG
 fikBvyf23yllhuoU96+8Irj/POOpM4UMqPZV6VbYixO21TcFCBplFwEubl9wujgq+1Mm3R
 TCiFigS6kcLYld5hTCqBrvgk8r7mZ2M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-BrsWqktQMT-n_3SF0lyTOw-1; Tue, 20 Dec 2022 04:20:02 -0500
X-MC-Unique: BrsWqktQMT-n_3SF0lyTOw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso2376158wml.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1OcEOi6wfApoNJ5QX9xUUF80M6DZAUCfFxv9pSqRsVA=;
 b=x/iswEDN4g/zzlYsi4eAheuKLR/mkDRAl6RsD5+9sHwaFffJe9w4oKVJKRScjequyR
 LBD6wYHoGiDQTrPjDXuN+A5L5LzhIquieNJpKNiV4/oPr9sxfdEzc9ReRp9h5qgz6iQ3
 KHrHxV+bWlhyBDt8XXYRYOvCLi38cgNrWEmExEGDboXHOEvEf0l5tVtxAh+xETH+Y5cn
 lroT7heC4SuTt/pzanqMmN93ReW+27IOFcsADRygEWnRIsT062xMV3cnApoIKDH7/r+9
 XTIpRxZ7wL60R3q58PA/EmrFxjXOdecUtn9KsSN3tiVC6YQ5yIA3VArcvMGbQaxVSPaf
 Dqfw==
X-Gm-Message-State: ANoB5pn49Xx/+snMqN/O0xD9N1Yy1OHJ1F6JmBVlwfdXjSgJ0r0VmUPz
 jMhJGMvyTOeOz7apusUx4pGOsKnufpxIXQDajfrALtQlhywxuaZia3XHYrCz8M/kxFfrIyrfWjW
 xxTpUF+vUpL0pylphuaESRFX4syb2
X-Received: by 2002:a05:600c:4f85:b0:3cf:93de:14e8 with SMTP id
 n5-20020a05600c4f8500b003cf93de14e8mr33662652wmq.39.1671528001150; 
 Tue, 20 Dec 2022 01:20:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7YfyRC8GN1CmHHU+h6zQnG8fHr/grTiv22vuNVltDRj2C7JBfNLZj3eqwiClNyExLknW6NJw==
X-Received: by 2002:a05:600c:4f85:b0:3cf:93de:14e8 with SMTP id
 n5-20020a05600c4f8500b003cf93de14e8mr33662634wmq.39.1671528000916; 
 Tue, 20 Dec 2022 01:20:00 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p16-20020a1c5450000000b003d07de1698asm21890206wmi.46.2022.12.20.01.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:20:00 -0800 (PST)
Message-ID: <bf88b4bf-4c81-29d3-3518-ef149f93265d@redhat.com>
Date: Tue, 20 Dec 2022 10:19:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 05/18] drm/radeon: Do not set struct fb_info.apertures
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-6-tzimmermann@suse.de>
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
> not set the values in radeon.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

