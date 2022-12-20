Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFC5651D0D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106F310E34D;
	Tue, 20 Dec 2022 09:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D51E10E34D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671527905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CYPgbcL3YuPfVJ8jSVJcJdgIz73ia329cUV03P7B6jw=;
 b=bOUsTSXOlMEW133RLX9MsRAB4811MCey9OTVJnaZ3eEA571/b9gwHV5B6WNXf7edkud6xs
 liub5ALFpBwL4WsnGXAk11X1xIusxqBUe/EhDYsNZng3mc4Vtk8L9wkFIzNvPr8S7+wvi8
 YSK7xkp65bgbPBvFto8A5VDC6mv4peo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-65-grddHMEkNEi4H8phet127Q-1; Tue, 20 Dec 2022 04:18:24 -0500
X-MC-Unique: grddHMEkNEi4H8phet127Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 i25-20020adfaad9000000b002426945fa63so2076041wrc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CYPgbcL3YuPfVJ8jSVJcJdgIz73ia329cUV03P7B6jw=;
 b=e1zNtrdrriQX4/BmDgwGNvrAhojNJj4A/VoNNpFi859HXlSZld0mnXpdx+D3EskJBC
 YF0wFKoSTCS+xlSHPt0CnGlWxdJFaoOWSlbmSegtJQ3dpkf0xwzBhVRl3HmyMlkru7Vz
 d5wmjADKWO9MULpJ44RR1oZLXtVBA56bt7WqxSmZJqMn6c4QK2cWt/qY1dPcRIsgzxcD
 /Sn7wH7Kx92KjLpLxhBOygmeLYHTcyr39ZolzVlTWXPgJiOKw9EyZclTQsqFdr9CoAfe
 476mw996q3dQfWRosr4dPpob+tGz4+SlZZ77jJEuRxvkdK0u1IRF6yPit8zWBBsmThjA
 savg==
X-Gm-Message-State: ANoB5pno+RK+W2uvsJRdTvc6WXbX771DGbt9Z7Y/N16hjO/g79/wUsIq
 d8MpiBrvhYYAeoz3o3atYgGO+YfyVD//8/2mW1mmdiKRIDGvD3YUZgcjrd+B+fbUKfQwdj1JWTz
 UG4jhJ/u6CEtseD33nHNVmJ/mCS/W
X-Received: by 2002:a05:600c:4688:b0:3d0:480b:ac53 with SMTP id
 p8-20020a05600c468800b003d0480bac53mr34783506wmo.12.1671527903072; 
 Tue, 20 Dec 2022 01:18:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7a6jFw63UWWlEAcRGouWqv0+PyfmsRgEqFDZ0lDKi9NgqR6nR2LVLem8I8AFhmP6J9qXEYGA==
X-Received: by 2002:a05:600c:4688:b0:3d0:480b:ac53 with SMTP id
 p8-20020a05600c468800b003d0480bac53mr34783491wmo.12.1671527902879; 
 Tue, 20 Dec 2022 01:18:22 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f24-20020a1c6a18000000b003b95ed78275sm14622837wmc.20.2022.12.20.01.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:18:22 -0800 (PST)
Message-ID: <3593e206-7c89-5cfe-1aca-d805ca76135e@redhat.com>
Date: Tue, 20 Dec 2022 10:18:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 03/18] drm/gma500: Do not set struct fb_info.apertures
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-4-tzimmermann@suse.de>
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
> not set the values in gma500.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

