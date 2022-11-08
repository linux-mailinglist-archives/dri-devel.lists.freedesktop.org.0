Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0334621023
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033EF10E26E;
	Tue,  8 Nov 2022 12:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92C210E26E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667909897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tzSkIHNpARRvZ0xcI8j7R+hpjM6I62qNLU07MBA6SM0=;
 b=GABF+KcpWf83XM8NSAu+l++/YGOsQJV0Gt4vf97PQg5jHWFHteSxfNI4/Pht1sxTBMwK1v
 pmc2C8tmFWs9MDQsoHN9cbo3Fqs43oMoZUZFAsapsb3TrBzrDTq3Z+4F0ZJ5NwofxDqXbK
 Qu27cBB4kW4F/ph1k8yJFaBXnkfCGXQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-f614w4WHPAO84yU6CzmLrg-1; Tue, 08 Nov 2022 07:18:14 -0500
X-MC-Unique: f614w4WHPAO84yU6CzmLrg-1
Received: by mail-wr1-f71.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso3947776wrc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 04:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tzSkIHNpARRvZ0xcI8j7R+hpjM6I62qNLU07MBA6SM0=;
 b=G1sONQx4AYogYmnjI8hRyaJMwWYs+/5QRCQY7GDDMsNFBwv3OZgxQkpruhpXSDGKPR
 5iTTqdfHRs2MpAR3BY3ognfhxhtDAB4taLcNICMy4Ru1LssaZAhuK4SjvBoG/EVjMeWv
 BfO0ROn8pI2ZiaMOK+AAOgLFHhgUVEkUwrD8AZvq+nD56PTXLyOnZeTCgeo6W1jhNanJ
 j9h3ncVZcX6cCyIMQANSYqEg+6NPfD7iwn7R/lrMD/SN229FfG7VRpeEzHSaCyloU+cP
 sFgoXgf6NYcSgJsZY0ELNtzWothTTEEenJnNchRCWYT0Zh0H8lKDbsFcLoNYxDFFPq7N
 s8og==
X-Gm-Message-State: ACrzQf2oAAMvGg1cvT6KTynF+j3IzJlLxyS03TaLegjU7mo8b94DJ8P/
 Nf7rX8JVBV0d0X/4IDJ6HyGu95hQG84VtZxnU3KZDaUEwdl3FDWtquzCAz2BoQD3vr+icaSSclw
 n9lSd5G9U4nZRo5vWZA2VZBGEWBw2
X-Received: by 2002:a5d:6181:0:b0:22e:3db0:67a2 with SMTP id
 j1-20020a5d6181000000b0022e3db067a2mr35950780wru.257.1667909893134; 
 Tue, 08 Nov 2022 04:18:13 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7b03W2y+hlbdm4alaAaaW0bPhLquK0Jqg5VkaQm3j+gNWYZtD4CaSzY2GGbU7EQvUNY4kKhg==
X-Received: by 2002:a5d:6181:0:b0:22e:3db0:67a2 with SMTP id
 j1-20020a5d6181000000b0022e3db067a2mr35950764wru.257.1667909892943; 
 Tue, 08 Nov 2022 04:18:12 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b9-20020a05600003c900b0022e6178bd84sm10223893wrg.8.2022.11.08.04.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 04:18:12 -0800 (PST)
Message-ID: <03d8f5b2-7ed8-bcaf-0c69-424b5d2fef67@redhat.com>
Date: Tue, 8 Nov 2022 13:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/2] drm/gem: Implement shadow-plane
 {begin,end}_fb_access with vmap
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20221025101737.8874-1-tzimmermann@suse.de>
 <20221025101737.8874-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221025101737.8874-3-tzimmermann@suse.de>
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

On 10/25/22 12:17, Thomas Zimmermann wrote:
> Move the vmap code for shadow-plane helpers from prepare_fb to
> begin_fb_access helpers. Vunmap is now performed at the end of
> the current pageflip, instead of the end of the following pageflip.
> 
> Reduces the duration of the mapping from while the framebuffer is
> being displayed to just the atomic commit. This is safe as outside
> of the pageflip, nothing should access the mapped buffer memory.
> Unmapping the framebuffer BO memory early allows reduces address-space

"allows to reduce" or "allows a reduced" ?

> consumption and possibly allows for evicting the memory pages.
> 
> The change is effectively a rename of prepare_fb and cleanup_fb
> implementations, plus updates to the shadow-plane init macro. As
> there's no longer a prepare_fb helper for shadow planes, atomic
> helpers will call drm_gem_plane_helper_prepare_fb() automatically.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

