Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630855FB368
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C4510E7FA;
	Tue, 11 Oct 2022 13:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6994910E7FA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665494808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C/D2ubrokwdjZ4UmudjC7tKrqdHyl96YEsZuvnHbSsY=;
 b=INVOubcVJh5Wm+xHuawpgU883hJ+rX3GXhvbwQ+lsaXfh4suxSW064Nmi3FCHkYEMUnRpI
 vnXpsYPQ8n2DdgS5INrFKtebzKNsdPeyJSj3vDOkHz/JzL7B6ZyevYfEszYl8Nh4dwBx6d
 qnenn0oAxyITQhoR4NYpcU3HzuVL+yQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-attI8UZxNRe2kDpFHqyn6Q-1; Tue, 11 Oct 2022 09:26:46 -0400
X-MC-Unique: attI8UZxNRe2kDpFHqyn6Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 c5-20020a1c3505000000b003c56da8e894so4432042wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 06:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C/D2ubrokwdjZ4UmudjC7tKrqdHyl96YEsZuvnHbSsY=;
 b=K7bzeMigTeU/fAJAiYPX+9c6N/HkZNEcZ2Imb63pj2i/5Zqagf80pgn3RMGoGr9ZmP
 A3U0Q/VJ0EZoJqH+XY/ujxTl50lCo8kixy8imePsqQzw0nezZh2O1yUKB4eR622gc682
 GSKl0usEMetJPywkIm+FVgtaj0yGCWrzDfueWJknigXP9xegAGfX5sYzqzCrCOfvycpJ
 VO230fi/lbcHZ3KHlbsIOir57plAxoPyah7WmHJ3Gdh3TKyikPtagqJQpRnJZWgSufXa
 Rs9VwdEXbjI94UfNsCtioL0UPU8/uWbZkoWLYvzRmunm1u2U7idpl+2wiBhoO7nQGAo9
 gblg==
X-Gm-Message-State: ACrzQf3H2QPgsaL0ndWuI1SzbhvzyJKm9NCjKlsx1VHPKePJXUl0A21i
 WMGUbmBYnjI7EdMy6oNlEhqzLrnop48Rn2QbkncnK1/+fDacxOCNddrse2g33hBNn31BYSfg0k+
 yESf4TwUnv8cOI22F32QYpCCvHCq/
X-Received: by 2002:a5d:6f17:0:b0:22e:33e7:6f6c with SMTP id
 ay23-20020a5d6f17000000b0022e33e76f6cmr14672172wrb.201.1665494804647; 
 Tue, 11 Oct 2022 06:26:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7JCEmZje/mdCYZs1oElYJeXtNTZDsJU6C5VVdr9yT1pIHLP4srTC2ac//peQ+wjq9x4B44UA==
X-Received: by 2002:a5d:6f17:0:b0:22e:33e7:6f6c with SMTP id
 ay23-20020a5d6f17000000b0022e33e76f6cmr14672159wrb.201.1665494804467; 
 Tue, 11 Oct 2022 06:26:44 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bd22-20020a05600c1f1600b003c6b822bfe8sm4797242wmb.29.2022.10.11.06.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 06:26:26 -0700 (PDT)
Message-ID: <bbbd1ebb-f0cc-91d6-2959-28919a2e8893@redhat.com>
Date: Tue, 11 Oct 2022 15:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/3] drm/crtc-helper: Add a drm_crtc_helper_atomic_check()
 helper
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20221010170203.274949-1-javierm@redhat.com>
 <20221010170203.274949-4-javierm@redhat.com>
 <f6a49350-74d0-4923-7c80-8e6233dc135b@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <f6a49350-74d0-4923-7c80-8e6233dc135b@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/11/22 15:21, Thomas Zimmermann wrote:
> Hi
> 
> Am 10.10.22 um 19:02 schrieb Javier Martinez Canillas:
>> Provides a default CRTC state check handler for CRTCs that only have one
>> primary plane attached.
>>
>> There are some drivers that duplicate this logic in their helpers, such as
>> simpledrm and ssd130x. Factor out this common code into a CRTC helper and
>> make drivers use it.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> There really isn't much here for now. I suspect that there are more 
> drivers that could use this helper. If you merge this before ofdrm, I'll 
> rebase ofdrm on top.
>

Sure. I probably won't post a v2 until tomorrow and I believe ofdrm is
ready to be merged, so I'll just rebase this series on top of that once
just push it.

> Please also see my comment below.
> 
> 

[...]

>> +/**
>> + * drm_crtc_helper_atomic_check() - Helper to check CRTC atomic-state
>> + * @crtc: CRTC to check
>> + * @state: atomic state object
>> + *
>> + * Provides a default CRTC-state check handler for CRTCs that only have
>> + * one primary plane attached to it.
>> + *
>> + * This is often the case for the CRTC of simple framebuffers.
> 
> I'd add a reference to drm_plane_helper_atomic_check() to this 
> paragraph. Like
> 
>    See drm_plane_helper_atomic_check() for the respective plane helpers.
> 
> And also reference back from the plane-check helper to the CRTC-check 
> helper.
>

Good idea, I'll do that. Thanks for your review.
 
> Best regards
> Thomas
> 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

