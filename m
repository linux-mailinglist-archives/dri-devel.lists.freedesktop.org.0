Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B32AF6327CA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 16:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE9810E2F1;
	Mon, 21 Nov 2022 15:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617DC10E2F1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669044185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mw0cs2rCkQMwH8vhjDJRquEqKsbLjXgVYS1r99oFz0I=;
 b=c8cIw73K0dcwlEFDXtrbcC0lpiPtKeeg3m41mPBGUEVQIu5dQlv/50msohE5g2Vtv1WtZd
 QIjQsct1mhgCRUZcoLes0xbLpIjHa7qeAy3iXaBQZ9te3p8bvmBGuhtt6yYDwalnt3lW5+
 9MeJ3r8LOv669kEi2HkwdfzW8GfhqBM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-304-XsoHlxprOwuM4x5QMgfo-Q-1; Mon, 21 Nov 2022 10:22:58 -0500
X-MC-Unique: XsoHlxprOwuM4x5QMgfo-Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 r23-20020adfa157000000b00241bcae980cso2739823wrr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mw0cs2rCkQMwH8vhjDJRquEqKsbLjXgVYS1r99oFz0I=;
 b=xhYUonUaTONG7N8z9bY+GK2weh67+ri2mEuQxf65Hdbyewzm3oRYDNpD51+BKS5KtR
 WvW8Y2Sv2LG3fZGi1pAN0c4X3NLfVe6+tG8KKsOAKQyW59l8tz9zsDMFaaBxY71eFMIa
 KwVf1UYdu9a8rIDifYs7j7j3l8EPPkLZd/t2g7WAHk17G89V5UXzr1/DrUubapd9jWkM
 Z1oxPdTzHlYVADuOam3vWgvWY/urqVzIMP3LJukrVorh8yke3fPO4NPvCLORh/Lve8mX
 r/RI1ei/hgAb3gpEpVSv1UO3qt85sfrF19xprK3ou0EqUVrM26MKv8Nh4cck9RBUfqMg
 sE3w==
X-Gm-Message-State: ANoB5pnD4iorqlpCir5wTF8cru/3Gq21SkExoXTP7T4ufiC041d5rbtX
 vke+XxjBXv5nVy7tg+4iReKbLNJjwkE+IN6kKC25JyQo1xd8e68C4ZfE2PoRH89ShYxLjd/2u2k
 q7G6KI+36caqTmUcLaLCrJcUNjGzB
X-Received: by 2002:a05:6000:1f10:b0:241:b92f:1753 with SMTP id
 bv16-20020a0560001f1000b00241b92f1753mr3964187wrb.81.1669044177287; 
 Mon, 21 Nov 2022 07:22:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Ex73ItNmKFoqNMHn9iA2J0jCnbJwzEwf7OIkOK6UwaLLLi4CVbzzWLUpL3X/1m8EwpvsfaA==
X-Received: by 2002:a05:6000:1f10:b0:241:b92f:1753 with SMTP id
 bv16-20020a0560001f1000b00241b92f1753mr3964166wrb.81.1669044177050; 
 Mon, 21 Nov 2022 07:22:57 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v3-20020a1cf703000000b003cf774c31a0sm17168636wmh.16.2022.11.21.07.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 07:22:56 -0800 (PST)
Message-ID: <70769953-f6c0-d8de-ad1c-887cc53e6d0d@redhat.com>
Date: Mon, 21 Nov 2022 16:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 0/8] drm/mipi-dbi: Convert to shadow-plane helpers
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com
References: <20221121104532.8301-1-tzimmermann@suse.de>
 <86f5b25d-55cc-c759-d9ec-b086d7f05698@tronnes.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <86f5b25d-55cc-c759-d9ec-b086d7f05698@tronnes.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/21/22 13:27, Noralf Trønnes wrote:
> 
> 
> Den 21.11.2022 11.45, skrev Thomas Zimmermann:
>> Convert the MIPI-DBI-based drivers to shadow-plane helpers. The
>> drivers vmap/vunmap GEM buffer memory during the atomic commit.
>> Shadow-plane helpers automate this process.
>>
>> Patches 1 to 4 prepare the MIPI code for the change and simplify
>> the restof the patchset.
>>
>> Patches 5 to 7 rework the vmap code in the MIPI-DBI drivers and add
>> shadow-plane helpers. Most of the affected drivers call MIPI-DBI
>> helpers and get the update automatically. Only ili9225 and st7586
>> require changes to their source code.
>>
>> Patch 8 simplifies drm_dev_enter() and _exit(). It's not strictly
>> needed, but streamlines the driver code and make sense overall.
>>
>> Testing is welcome, as I don't have any hardware to test these
>> changes myself.
>>
> 
> I can do a test this weekend.
>

I've a ST7735 display so I can also give it a test this weekend.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

