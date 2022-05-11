Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5C4523B9F
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 19:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9281D11252F;
	Wed, 11 May 2022 17:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C95F11252F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 17:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652290482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i8Xj3Dw4/gCq/23hJZh6ANAQmyEIEWC62NCXFqWSvVM=;
 b=Ezxi5RRNDrPv5dcPyIG+2TzEMKcC5AyUyCGpkCu1fFnjkO0MoRfOFaiQhUSEJIOvJ6uok6
 ttMxE+esQlMDaTHRhtWH52dEVfjl9QCo8B26oIuUsANB07HMzi/0YQYxFwK82gYhLIbJEk
 yWmnzulrAjbBNBNVWt2CEc+tvxNxUYw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-f3yrUSG-OBShL8pYIKvYdQ-1; Wed, 11 May 2022 13:34:41 -0400
X-MC-Unique: f3yrUSG-OBShL8pYIKvYdQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 o11-20020adfca0b000000b0020adc114131so1105303wrh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 10:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i8Xj3Dw4/gCq/23hJZh6ANAQmyEIEWC62NCXFqWSvVM=;
 b=Y8MNIAta24AyfUxv8kjbKBAASuKqHElZoWLZhoaPKJOTyf/XJCZIvBi3GZ+mZprCFt
 dBcADsTeMBoR3Pa3LtkxTHEdqM+r5UFaJbaQ+qYAmTmUVPtb5e3ILjICq+P0dxobYt+X
 KFB0SMxUzv4p4Esul3ef+Tz6X193UiBHNwMnqd2HZk+yDxxJKWwiYJKG9xoUNBPQZfiF
 x8soBM1pLDe6MkgQP04ODJYgSEtcjRYISveImx2sXRZUFNckB1ssni0yEhPZKEkjscvt
 2Bq8YO5zZpTwfCvFdOw0MB1GBRKYTXvrbU5nGs0WjpWBjXE5QBkrrBci4W6ysZaqcLX7
 qMyA==
X-Gm-Message-State: AOAM531rpWOZ7SDuY5+zjSB3Tn0MHggGqMbNPG9h8pBYUWMUQS7aXYEs
 K2OHQqYAmKMhDJqxhIxMXSDaBG4iExoL6Dc/C3slHvapEMBwlrbDXzbOLCEe5bkUte4QLFFvgj9
 9DEdb8hufoApysXtPoX36bc2SfrRF
X-Received: by 2002:a05:6000:1d90:b0:20c:9efd:bd6b with SMTP id
 bk16-20020a0560001d9000b0020c9efdbd6bmr24725759wrb.605.1652290480060; 
 Wed, 11 May 2022 10:34:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMcxwINjwFHTGmrXrt5Rnjg0TtWgmfEnHBfAnBCyS2Fe9WQndQMx9qSymE6rAgB6QbCz2//w==
X-Received: by 2002:a05:6000:1d90:b0:20c:9efd:bd6b with SMTP id
 bk16-20020a0560001d9000b0020c9efdbd6bmr24725736wrb.605.1652290479835; 
 Wed, 11 May 2022 10:34:39 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g17-20020adfe411000000b0020c5253d91esm2156204wrm.106.2022.05.11.10.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 10:34:39 -0700 (PDT)
Message-ID: <48f164af-99d2-9e74-e307-003be0677384@redhat.com>
Date: Wed, 11 May 2022 19:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 7/7] fbdev: Make registered_fb[] private to fbmem.c
To: Guenter Roeck <linux@roeck-us.net>, Sam Ravnborg <sam@ravnborg.org>
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511113230.1252910-1-javierm@redhat.com> <YnvrxICnisXU6I1y@ravnborg.org>
 <8c84428c-2740-4046-74c9-298b854944d0@roeck-us.net>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <8c84428c-2740-4046-74c9-298b854944d0@roeck-us.net>
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
 kernel test robot <lkp@intel.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Jens Frederich <jfrederich@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Nettleton <jon.nettleton@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Guenter,

On 5/11/22 19:17, Guenter Roeck wrote:
> On 5/11/22 10:00, Sam Ravnborg wrote:

[snip]

>>>   struct fb_info *registered_fb[FB_MAX] __read_mostly;
>>> -EXPORT_SYMBOL(registered_fb);
>>> -
>>>   int num_registered_fb __read_mostly;
>>> +#if IS_ENABLED(CONFIG_FB_OLPC_DCON)
>>> +EXPORT_SYMBOL(registered_fb);
>>>   EXPORT_SYMBOL(num_registered_fb);
>>> +#endif
>>
>> It is stuff like this I refer to as "ugly" in the comment above.
>>
> 
> My "solution" for that kind of thing is to use a namespace,
> such as
> 
> EXPORT_SYMBOL_NS(registered_fb, FB_OLPC_DCON);
> EXPORT_SYMBOL_NS(num_registered_fb, FB_OLPC_DCON);
>

Using a namespace in this case is indeed a great idea I think.

I've used in the past to limit the export of a symbol for within a driver
that could be scattered across different compilations units, but it never
occurred to me using it to limit symbols exported by core code.
 
> and import it from the offending code. That avoids ifdefs
> while at the same time limiting the use of the symbols
> to the expected scope. Of course that could be abused but
> that abuse would be obvious.
>

Agreed. For the next revision, besides using an namespaced export symbol
as you suggested, I'll include a comment to make clear that it shouldn't
by any other driver and FB_OLPC_DCON fixed instead.


-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

