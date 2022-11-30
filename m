Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8C063CFA1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 08:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612CF10E417;
	Wed, 30 Nov 2022 07:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7AA10E417
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 07:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669792758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3I/EwWIvIzdfCE7yazGJlpRrHI2l7KvFB8IYsvJouI=;
 b=UqdOc6A7MOkfCyg7frMPYfgWU/PRx7oesGnBHJBTf1n1o6Qd6dLX0Qr/c4lPwP4EFghXSa
 WaxmJ3idgVGl0MoMGTc8Pn9Hin1OMQefnPVyVEZQ9xW5Nnv47dNmpOo1r/qYaibPm4ON9N
 O2/J3/916Z+gBYQE+7mIwe7JIU7Z7b0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-y6Rj1mIDODiE6LBa9vcyVQ-1; Wed, 30 Nov 2022 02:19:16 -0500
X-MC-Unique: y6Rj1mIDODiE6LBa9vcyVQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so593324wmb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 23:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b3I/EwWIvIzdfCE7yazGJlpRrHI2l7KvFB8IYsvJouI=;
 b=BFFx1rAHVzrawBAyx11lifI0XdpJFfcJcx87z6gyAjzaHz7PKwTiJLU2av994EnKTX
 EQVyOoh2lv1rDcxmnXoToFoASOssBbNoi4DUTbp8tzFA9GL8My2yXyy1uq1zCAnCPp1u
 LzJEfjCSmtZpPaBPR1Don85n8q+XXoV+Qqbxw1QoS4BsX+lVYKo3S55LuSs0MHlujPoF
 HSQdFT2tuNH3YKMKUF3FggJBl2kv8Ph0K6lRkB9WwrNfVDDrTFFrO5mF4DTlDe7lsOhT
 eITEnSOvottTUTZO7TwwNTLQITOYbrdHVewrZT1PElKQNG+YtrLPbWMzotL616Hg+LCJ
 Da3Q==
X-Gm-Message-State: ANoB5pn3Ks3ky9d1/uU7AOVU4e7okc0MWgWwdraCp54gpCMcgy20b5Ff
 4Ip/KU+4P6aCgsMugB5ibH2gi53DbTUz5NQFYBxJMBAVa3j84Rve4bkXIChVPsFon9xe4KCGppk
 roKK76lxxwwUlB6KBCssKwyai8E7I
X-Received: by 2002:a5d:6745:0:b0:242:7e6:a0a0 with SMTP id
 l5-20020a5d6745000000b0024207e6a0a0mr14503980wrw.512.1669792755231; 
 Tue, 29 Nov 2022 23:19:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Zk7aXs5vfGV8dfY5nRClnqik0D4x6p3lTiaL7OzFnsCeKm2wXlrhnwJBvlKzba4gRcHkdbg==
X-Received: by 2002:a5d:6745:0:b0:242:7e6:a0a0 with SMTP id
 l5-20020a5d6745000000b0024207e6a0a0mr14503963wrw.512.1669792754953; 
 Tue, 29 Nov 2022 23:19:14 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e15-20020a5d530f000000b002420dba6447sm626294wrv.59.2022.11.29.23.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 23:19:14 -0800 (PST)
Message-ID: <15eeb225-0b3f-3bc6-134b-264c2a58c907@redhat.com>
Date: Wed, 30 Nov 2022 08:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 0/8] drm/mipi-dbi: Convert to shadow-plane helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, noralf@tronnes.org
References: <20221121104532.8301-1-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221121104532.8301-1-tzimmermann@suse.de>
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

Hello Thomas,

On 11/21/22 11:45, Thomas Zimmermann wrote:
> Convert the MIPI-DBI-based drivers to shadow-plane helpers. The
> drivers vmap/vunmap GEM buffer memory during the atomic commit.
> Shadow-plane helpers automate this process.
> 
> Patches 1 to 4 prepare the MIPI code for the change and simplify
> the restof the patchset.
> 
> Patches 5 to 7 rework the vmap code in the MIPI-DBI drivers and add
> shadow-plane helpers. Most of the affected drivers call MIPI-DBI
> helpers and get the update automatically. Only ili9225 and st7586
> require changes to their source code.
> 
> Patch 8 simplifies drm_dev_enter() and _exit(). It's not strictly
> needed, but streamlines the driver code and make sense overall.
> 
> Testing is welcome, as I don't have any hardware to test these
> changes myself.
> 
> Thomas Zimmermann (8):
>   drm/simple-kms: Remove drm_gem_simple_display_pipe_prepare_fb()
>   drm/ili9225: Call MIPI DBI mode_valid helper
>   drm/st7586: Call MIPI DBI mode_valid helper
>   drm/mipi-dbi: Initialize default driver functions with macro
>   drm/mipi-dbi: Prepare framebuffer copy operation in pipe-update
>     helpers
>   drm/mipi-dbi: Support shadow-plane state
>   drm/mipi-dbi: Use shadow-plane mappings
>   drm/mipi-dbi: Move drm_dev_{enter,exit}() out from fb_dirty functions
> 

Sorry for the delay. I've tested now this series with the st7735r driver
and everything seems to works correctly.

Tested-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

