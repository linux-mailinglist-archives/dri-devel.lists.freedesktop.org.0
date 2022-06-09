Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E42544D20
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 15:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E7D11ACDB;
	Thu,  9 Jun 2022 13:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09BE11ACDB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654780166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YvqBaJiGfX1T417kIImjOKR48qiEEVykLNesHAckSZY=;
 b=E50B2crTbc5cdE3BwSP+aXwU8PXdbR70e+K6mZsEDYhKV/BoY46GP5VFddrs7wwi+RSQZz
 PHqajL3z6P/Q9bysB0dfTrsRtsAYfqWExZC/08y2bZY7bvox/q5u2wtOnD59Uuygl4+cq8
 zGH5tX9f7u4kBAFYTgDQC7cbuNcHiiI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-T8BKs5-cNQC5vCk1C0oZQg-1; Thu, 09 Jun 2022 09:09:25 -0400
X-MC-Unique: T8BKs5-cNQC5vCk1C0oZQg-1
Received: by mail-wr1-f71.google.com with SMTP id
 u18-20020adfb212000000b0021855847651so1981365wra.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 06:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YvqBaJiGfX1T417kIImjOKR48qiEEVykLNesHAckSZY=;
 b=gUAt8PO2XJAIBDs7V89YIdYWZrFO5g94I0kuEKyVl3EzD8eWbj+g5v9mS50W9oEuTA
 RsstjoeTN0z8bHVexE3XQNIw1X2NpGi1ybMupXQdD1eGrIIMEF6sv894G6nFT+9OTF1O
 eHU3u9LzuGsJHtPc0NEb8X/S9O5Mr0CBgHEHNs4sKh+N3+iLiR8wB2G/rSmVM7SkWPsW
 HsnhzoMHUJekIE0lLMaaVC12NjLRFj171g3TuA0i+V2+FGhH84ncuZdCxbFFNQkUXfG+
 xTgRGOGiVDW9MgSY4IG1vEgcZVbv4kC96E6t3Z4VmuQHdUZlmueU5Y7ZsrrHOHF3GZrv
 NgEA==
X-Gm-Message-State: AOAM533BPP2Zgh6J6XtffKsdfqYSjQeMv3rdScIcjBPdSecw1SBFxMgL
 11c/OGNfR+8mZSc253n1nQ9Rx8dYRaMyM3Q8hOlPuJM7F9b5ZBjKFOD9D95UXFlw3TjZxilIENc
 zfiTRSFiIOKRc152kYjTHWpgt42eg
X-Received: by 2002:a05:600c:3790:b0:39c:62b9:b164 with SMTP id
 o16-20020a05600c379000b0039c62b9b164mr3381326wmr.0.1654780164677; 
 Thu, 09 Jun 2022 06:09:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrhK5vyVIzRvXIFObj7ytHYOOJVKUaK8OXVv1RaQsuCCkGIUIxQDKVKJG+0BMPAs7taMRiJQ==
X-Received: by 2002:a05:600c:3790:b0:39c:62b9:b164 with SMTP id
 o16-20020a05600c379000b0039c62b9b164mr3381293wmr.0.1654780164468; 
 Thu, 09 Jun 2022 06:09:24 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q17-20020adff951000000b002103bd9c5acsm24415031wrr.105.2022.06.09.06.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 06:09:24 -0700 (PDT)
Message-ID: <69d8ad0e-efc6-f37d-9aa7-d06f8de16a6a@redhat.com>
Date: Thu, 9 Jun 2022 15:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 5/5] fbdev: Make registered_fb[] private to fbmem.c
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220607182338.344270-1-javierm@redhat.com>
 <20220607182338.344270-6-javierm@redhat.com>
 <3ebac271-1276-8132-6175-ca95a26cfcbb@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <3ebac271-1276-8132-6175-ca95a26cfcbb@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 kvm@vger.kernel.org, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jon Nettleton <jon.nettleton@gmail.com>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Jens Frederich <jfrederich@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
 Matthew Wilcox <willy@infradead.org>, Laszlo Ersek <lersek@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 6/9/22 13:49, Thomas Zimmermann wrote:
> Hi Javier
> 
> Am 07.06.22 um 20:23 schrieb Javier Martinez Canillas:
>> From: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> Well except when the olpc dcon fbdev driver is enabled, that thing
>> digs around in there in rather unfixable ways.
> 
> There is fb_client_register() to set up a 'client' on top of an fbdev. 
> The client would then get messages about modesetting, blanks, removals, 
> etc. But you'd probably need an OLPC to convert dcon, and the mechanism 
> itself is somewhat unloved these days.
> 
> Your patch complicates the fbdev code AFAICT. So I'd either drop it or, 
> even better, build a nicer interface for dcon.
> 
> The dcon driver appears to look only at the first entry. Maybe add 
> fb_info_get_by_index() and fb_info_put() and export those. They would be 
> trivial wrappers somewhere in fbmem.c:
> 
> #if IS_ENABLED(CONFIG_FB_OLPC_DCON)
> struct fb_info *fb_info_get_by_index(unsigned int index)
> {
> 	return get_fb_info(index);
> }
> EXPORT_SYMBOL()
> void fb_info_put(struct fb_info *fb_info)
> {
> 	put_fb_info(fb_info);
> }
> EXPORT_SYMBOL()
> #endif
> 
> In dcon itself, using the new interfaces will actually acquire a 
> reference to keep the display alive. The code at [1] could be replaced. 
> And a call to fb_info_put() needs to go into dcon_remove(). [2]
> 

Thanks for your suggestions, that makes sense to me. I'll drop this
patch from the set and post as a follow-up a different approach as
you suggested.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

