Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE8467D540
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB42710E0B4;
	Thu, 26 Jan 2023 19:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5122210E0B4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674760737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0fMObdQvzZWrd2jmea2KvQ+KMA1oa3ru9SdLqtXyBe4=;
 b=Omo4xkbqPn1+n0D3oJ12fWSiDn0VvL8AP9aRkX1YRf8Ff1VQlrcqf/8uGPuKmWjuWBuFZX
 BKnJGl7D1p/PYDqhwqInHEwxZ1dSfTfaFVwHVwjAvuq9yvfd0O+sIL/pb6Zu/uwCV4OG9z
 QAzd09faj3UnazO6XqNpgDYPEX5Qilc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-542-A2NTBVfdNbyFhlfmgDXtfg-1; Thu, 26 Jan 2023 14:18:55 -0500
X-MC-Unique: A2NTBVfdNbyFhlfmgDXtfg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j35-20020a05600c1c2300b003dc31f701afso6649wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0fMObdQvzZWrd2jmea2KvQ+KMA1oa3ru9SdLqtXyBe4=;
 b=IL3EjCN0diGcCzaE8n6c3cldaiNrMqpEji3XcDq3V2iT36LujauEdL9cxQn3CNfWHQ
 S5/TX+QtsgC4XBa0eQnV2lRRsDHoVNz8RSa47kFAK90y8vik3XiIFkcz0IQttSTQI47T
 BHgTH8q1i3tcsMpLcNpf5Oy/+LCTORLviVjyhMBtCzHxaFGXKOdol+82UcQgvEyD1EEK
 fpV0P2XtVWTdXJJIo33pLl+S0dyvBqymDtbZ3VAd/ypBxModpqPG5j5h/NjpJucxjCSP
 8QpqX1ZUJtAb9i7JLkjuC7S/528KrrfOA+E0JvtNN4Dd7YGKxAtm8orBa730mPnEMNsQ
 Pfzg==
X-Gm-Message-State: AO0yUKV+DLe1QVVgx8qBc7s8AVfO+4IUgz/5Vjv96ATi/I4ks3mg+b1J
 +SAuEpokpqQZl41oJxiVFgtghvJa55vv/KnsHbufjFJRN36CRixII3EzG7Wg5HvwCOSZ166uk5h
 DbAvm5MN4bgxSpws9oLi87C5ORNV2
X-Received: by 2002:adf:a50f:0:b0:2bf:bf36:1604 with SMTP id
 i15-20020adfa50f000000b002bfbf361604mr5661515wrb.35.1674760734857; 
 Thu, 26 Jan 2023 11:18:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+3EpQgIqyXltSXk5BrveJaffTWXPBze3LY8R7Ub/MqZC5yKZ6KN5yJVNbyyTeFoEed+5tLUQ==
X-Received: by 2002:adf:a50f:0:b0:2bf:bf36:1604 with SMTP id
 i15-20020adfa50f000000b002bfbf361604mr5661504wrb.35.1674760734631; 
 Thu, 26 Jan 2023 11:18:54 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p2-20020a5d4582000000b002b6bcc0b64dsm2065409wrq.4.2023.01.26.11.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 11:18:54 -0800 (PST)
Message-ID: <d7286bc1-32bb-ac70-113d-04c3a56519bb@redhat.com>
Date: Thu, 26 Jan 2023 20:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/ssd130x: Init display before the SSD130X_DISPLAY_ON
 command
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20230125184230.3343206-1-javierm@redhat.com>
 <82ad8c89-9d6a-ffa8-e2ad-7b53ac27cafb@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <82ad8c89-9d6a-ffa8-e2ad-7b53ac27cafb@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/25/23 20:56, Thomas Zimmermann wrote:
> 
> 
> Am 25.01.23 um 19:42 schrieb Javier Martinez Canillas:
>> Commit 622113b9f11f ("drm/ssd130x: Replace simple display helpers with the
>> atomic helpers") changed the driver to just use the atomic helpers instead
>> of the simple KMS abstraction layer.
>>
>> But the commit also made a subtle change on the display power sequence and
>> initialization order, by moving the ssd130x_power_on() call to the encoder
>> .atomic_enable handler and the ssd130x_init() call to CRTC .reset handler.
>>
>> Before this change, both ssd130x_power_on() and ssd130x_init() were called
>> in the simple display pipeline .enable handler, so the display was already
>> initialized by the time the SSD130X_DISPLAY_ON command was sent.
>>
>> For some reasons, it only made the ssd130x SPI driver to fail but the I2C
>> was still working. That is the reason why the bug was not noticed before.
>>
>> To revert to the old driver behavior, move the ssd130x_init() call to the
>> encoder .atomic_enable as well. Besides fixing the panel not being turned
>> on when using SPI, it also gets rid of the custom CRTC .reset callback.
>>
>> Fixes: 622113b9f11f ("drm/ssd130x: Replace simple display helpers with the atomic helpers")
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 

Applied this to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

