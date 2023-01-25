Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224C167AD3D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 10:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB9A10E75C;
	Wed, 25 Jan 2023 09:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408EB10E75C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 09:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674637562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ibAilFrTZpaXjvkv+J4hBVKGt8aImsFqCRRw10Pzcew=;
 b=bb0cqsZz0zKgtjULylOvCA5zhjbhsiy7kCWvEcUDU7FIWespAcyAhvJgC8zanwc9H8Bokr
 f4b0p1VBuRFRAPXXm46sJuZTijcuJFCPcU3MzxWDQ4PsXEhYUuhwhPTkh29+LbjunbxIhA
 Sd56FNpXh7VUBBvmu21Gj7MRC8VoZ+A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-aaG0QyGQNOa49-C1LHsaMg-1; Wed, 25 Jan 2023 04:06:01 -0500
X-MC-Unique: aaG0QyGQNOa49-C1LHsaMg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi18-20020a05600c3d9200b003d991844dbcso768325wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 01:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ibAilFrTZpaXjvkv+J4hBVKGt8aImsFqCRRw10Pzcew=;
 b=ho65iGW5StkFna9wtDmxR1dE/dO/XEQhV7rjHRCHB+yMtons6Zqb+NLRkuJsTK9oVQ
 pb5q6U7p5wrBr4G/fwkVc5iqqD2zluVLiJBkyRpqffXX0WTCxD9Knep65jK1nXp6TbTr
 H17QB1ruej/lu908ZMhaWahJaJOoNTELea2IMW65/TmoaRjsc2TxwTdt0e/wOVTTQc+i
 0sxilBZTq6eaCY0jora8rjHoqZRG2FV8pHl4oDdbtyi/R5E6NxFhVk/xpzXxJdHDZypT
 CHN6L//r3lAW4bLgrraVSLRC8PTDLPWXv/HvCu6oPkjG1b5v7eVhiIbBMujhpEDxwDat
 s0oQ==
X-Gm-Message-State: AFqh2kqIc/sQmUnuCz2TYIgPHXSIVjHnSecLzx230SDlZ7UfADjfxwsY
 tv5AvasXzCwCRBbp2c29P3g/t6bnw6L5yeB+esmVZdGrPdSvnYjTDEuwpkgzl+bPLIXrTkNUPGl
 AEvicwB5Swqx8WTIlkU4fbEdzcCUB
X-Received: by 2002:adf:c614:0:b0:248:ab8a:5144 with SMTP id
 n20-20020adfc614000000b00248ab8a5144mr21094643wrg.63.1674637559804; 
 Wed, 25 Jan 2023 01:05:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtMP+tIsLwCvIpxNk0o5l1ZP8xAGyOaXYfWMtnUqU1wHmPoAjbKjb1Za9A6b4DyRU3i/fPKxQ==
X-Received: by 2002:adf:c614:0:b0:248:ab8a:5144 with SMTP id
 n20-20020adfc614000000b00248ab8a5144mr21094625wrg.63.1674637559560; 
 Wed, 25 Jan 2023 01:05:59 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y15-20020a5d470f000000b002bc8130cca7sm3865503wrq.23.2023.01.25.01.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:05:59 -0800 (PST)
Message-ID: <a8beffd8-5977-aa51-97aa-feef314541e0@redhat.com>
Date: Wed, 25 Jan 2023 10:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 02/10] drm/client: Add hotplug_failed flag
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-3-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Signal failed hotplugging with a flag in struct drm_client_dev. If set,
> the client helpers will not further try to set up the fbdev display.
> 
> This used to be signalled with a combination of cleared pointers in
> struct drm_fb_helper, which prevents us from initializing these pointers
> early after allocation.
> 
> The change also harmonizes behavior among DRM clients. Additional DRM
> clients will now handle failed hotplugging like fbdev does.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

