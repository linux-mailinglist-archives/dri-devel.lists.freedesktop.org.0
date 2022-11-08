Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D467620FF2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF3A10E409;
	Tue,  8 Nov 2022 12:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609DE10E406
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667909411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPtawhqmqXfj2mpNWRNjAWZ7fU5jT0s4wH3yTOUlOgw=;
 b=KdLwEJsJxMi2y+y7nn+AktV2qtZcdFWhQsNnY7Bzp/gfnYdJz/U1E6DOpPezRu6fw37ljW
 JPmlj/I7pzuhsMkJMYKWMSMRxw86VkEBIv9ZaSffb6661+PKGzlukwh6ceg2XxBajrS7IW
 joJ1jJp9tP+B7tPbuOAs9SSOO5V/Xm4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-Ox_vyYnvNwmPvvPlEFGYGw-1; Tue, 08 Nov 2022 07:10:08 -0500
X-MC-Unique: Ox_vyYnvNwmPvvPlEFGYGw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso6852818wms.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 04:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nPtawhqmqXfj2mpNWRNjAWZ7fU5jT0s4wH3yTOUlOgw=;
 b=y1hAcQh2/oqlrMKPRh0vYL7XhH/6I/5rRpQZKCpTG2CHroC+kWeoNF3+IDDjlYK84a
 19CJNjjn/17OS71I4/B+hCu5Yu+XzIVr9QeEcZ/gVAPSYACsL3HmuvNkZUb79DhG8DYE
 WQAMu/383mUM3QthhQgOtJrChH2cJlPPO3rQxQqD9srg/E/IrD8VCYd94wMf9m9N3dIU
 pIfoeYkb64kLs/1ztPVWh7HDS5L27DWgcbr6kbZkmFgewJtmJsR60pD2/8lxb/R6yi9M
 ShWpjH5CnDLtjvAK71VdWr0sivz1PzALmlpq1AaXZKuK4s3QAX7zu9+zhi0R6NLNDzqk
 Nmww==
X-Gm-Message-State: ACrzQf1WxVjcwga0aPAmVCO0+cjMUzSYwLLpo+ZqbD6xNCW0W6FxoQ18
 yJMt3p9JKf0ih6Cd1dauT4i0AzX2Q3JPQbZfC4lMg53YwLqsn259m45laxyXry/qcwScoUOsUGh
 afIWrYvAK/9T2SDOkb+sQK2cWLTFN
X-Received: by 2002:a5d:5710:0:b0:236:cdd4:4cf4 with SMTP id
 a16-20020a5d5710000000b00236cdd44cf4mr30646108wrv.376.1667909407002; 
 Tue, 08 Nov 2022 04:10:07 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4RApXjGDTt/jdz0kGqC6lS7TKUY2rXqnZAIwOvgAqZS9nqNNO9mZ3afZ4zQz/hHDl4mOy1DQ==
X-Received: by 2002:a5d:5710:0:b0:236:cdd4:4cf4 with SMTP id
 a16-20020a5d5710000000b00236cdd44cf4mr30646096wrv.376.1667909406802; 
 Tue, 08 Nov 2022 04:10:06 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c2ccc00b003b47ff307e1sm11791541wmc.31.2022.11.08.04.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 04:10:06 -0800 (PST)
Message-ID: <7d0c25c3-8609-f8d1-b6ba-d9e6aaee9252@redhat.com>
Date: Tue, 8 Nov 2022 13:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] drm/atomic-helper: Add {begin,end}_fb_access to
 plane helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20221025101737.8874-1-tzimmermann@suse.de>
 <20221025101737.8874-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221025101737.8874-2-tzimmermann@suse.de>
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

On 10/25/22 12:17, Thomas Zimmermann wrote:> Add {begin,end}_fb_access helpers to run at the beginning and end of
> an atomic commit. The begin_fb_access helper aquires resources that

acquires

> are necessary to perform the atomic commit. It it similar to prepare_fb,
> except that the resources are to be released at the end of the commit.
> Resources acquired by prepare_fb are held until after the next pageflip.
> 
> The end_fb_access helper performs the corresponding resource cleanup.
> Atomic helpers call it with the new plane state. This is differnt from

different

> cleanup_fb, which releases resources of the old plane state.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

The change makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

