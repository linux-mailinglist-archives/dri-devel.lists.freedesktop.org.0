Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB1854C302
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 10:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F0610E157;
	Wed, 15 Jun 2022 08:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD80B10E157
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 08:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655280056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnrMbjgNcDqCWYHeSmpb3Q6cl+llDkZGACL0rTPbh7s=;
 b=cX9HFV+p8PXh2Tx4D82KKaxq3n1bc5Tmty4cF1F/fC6X4IPdzpJU7RJbyNkNHppxcfO+3J
 t1tn4J47UQmOwduZFdv1OO1yg/Sg54/vJDqHFGHPaPpUjNi+3ccKBYPB2UA5kRgWZitO38
 o958unALE7/qzZDkcg5Ro5GyVoeX558=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-VENQB8WqONWZnAuXEYFbLg-1; Wed, 15 Jun 2022 04:00:55 -0400
X-MC-Unique: VENQB8WqONWZnAuXEYFbLg-1
Received: by mail-wr1-f70.google.com with SMTP id
 e9-20020a5d5949000000b00216ffb6df18so1594905wri.14
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 01:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RnrMbjgNcDqCWYHeSmpb3Q6cl+llDkZGACL0rTPbh7s=;
 b=2qKVAwwdmyKdT4JBvR2mOagV0HSdRJPyzCTEAG3zd5KPC3wDeEa7cwNr/1ockwGPjU
 cc8tbOp5dr/b2ZXk7WpzJWcl1uYLyiDFVSOx1JRV4wK+hRXu7YGKzNGUXjZBr4G7ysNa
 4ebHVlHjcAJk9g0rOCh634kFI7EfZgQM2h+78CLdDGvsopxfAWGxGi01lC/tSCZ4OnqB
 fFKzyTukogMOtSy4vYFb6TQEqxDVNkh8lZGFdbRmlTcJmS8hi97sQb8Dr/bpQigURZPU
 RqvhMVLBHeqtcrKmEFGtVUIb3+Vn0NMbEhIiTz3hhY1CcuXOEaPbRU05vcXe69UPv6ln
 huYQ==
X-Gm-Message-State: AOAM531LYy70oBkjKfuqzpFaWg1On9orn89lthqkeKl+/YbZnOe54e3V
 QeiAbTwEmY31wnpGzPlwpWHJs8z64ibPoQbyNg8HIPABC89RTJtFh4NkC+5ySEIcBtm7wG/hH9P
 zQFn4QrH3RvqEIsQHCEDh++UisVyZ
X-Received: by 2002:a05:600c:4ca7:b0:39c:422a:fc6f with SMTP id
 g39-20020a05600c4ca700b0039c422afc6fmr8563048wmp.55.1655280054387; 
 Wed, 15 Jun 2022 01:00:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkYlSP1gcqXg6FAOm50g20F/AB0QiVpB5Mvb7BXb9ZTYc7EVgsc8wBPn/k3pvXWWo+nXWEug==
X-Received: by 2002:a05:600c:4ca7:b0:39c:422a:fc6f with SMTP id
 g39-20020a05600c4ca700b0039c422afc6fmr8563025wmp.55.1655280054194; 
 Wed, 15 Jun 2022 01:00:54 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w15-20020a1cf60f000000b0039747cf8354sm1481496wmc.39.2022.06.15.01.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 01:00:53 -0700 (PDT)
Message-ID: <1c1f7dcc-7122-a3e2-1a39-79f1671371c3@redhat.com>
Date: Wed, 15 Jun 2022 10:00:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/arm/hdlcd: Take over EFI framebuffer properly
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Robin Murphy <robin.murphy@arm.com>, liviu.dudau@arm.com
References: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
 <3d6303d4-4569-7078-76e1-0f7c46d9556c@suse.de>
 <54a8a681-3a96-22cb-846d-9e406f10bab7@arm.com>
 <8693a65a-6866-3ec5-d2e1-d7fd132f7dab@suse.de>
 <a8350570-0ed5-dc91-c4a4-76931dec0c1d@redhat.com>
 <0b6426ec-b436-29b4-43d8-cf6449b3a202@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <0b6426ec-b436-29b4-43d8-cf6449b3a202@suse.de>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/15/22 09:53, Thomas Zimmermann wrote:
> 
> 
> Am 15.06.22 um 09:50 schrieb Javier Martinez Canillas:
> [...]
>>> Historically, most drivers call this function very early. But for error
>>> recovery it would be better to do it as late as possible.  Ideally,
>>> drivers would first initialize their DRM software state, then kickout
>>> the generic driver, and finally take over hardware. But that would
>>> require a careful review of each driver. :/
>>>
>>
>> We got bug reports on Fedora about regressions caused by the fact that some
>> programs made the (wrong) assumption that /dev/dri/card0 would be the "main"
>> display and just hard-coded that path.
> 
> Shh! Don't tell anyone.
>

:)

What I tried to say is that deciding where to kick out the firmware-provided
framebuffer isn't trivial and would just land the patch as is. At some point
we should probably agree on the best place and audit all the drivers to make
sure that are doing it properly. 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

