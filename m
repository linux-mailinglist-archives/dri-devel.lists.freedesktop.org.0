Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A56AAC7BD
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 16:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F55910E6A4;
	Tue,  6 May 2025 14:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hfiepgVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F8110E6A4
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 14:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746541284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ra8dT+u0znMisKaFww4zDPkxUuk3oLrk2DWOA7MbbUg=;
 b=hfiepgVx17D6jTK9WIdm50KBFjsVkDGpmS4mTLW90msnqbfutLsyUzCdpPa7bNKHZzxVB2
 s893VRbfTuX6cQ2gPBiQmtzsRykqpThlJvZB+c6c9EHBPFB6IB26K8eimmi2X/angTjNd/
 oVJns1/twe1a3pnxFeCz8w7zIX2K4QQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-C7rjoN0DP6OeCDKhkKXQCw-1; Tue, 06 May 2025 10:21:16 -0400
X-MC-Unique: C7rjoN0DP6OeCDKhkKXQCw-1
X-Mimecast-MFC-AGG-ID: C7rjoN0DP6OeCDKhkKXQCw_1746541274
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43cf44b66f7so32411915e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 07:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746541274; x=1747146074;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ra8dT+u0znMisKaFww4zDPkxUuk3oLrk2DWOA7MbbUg=;
 b=Ewfc1V8jNz4Wh6fooDAl7fPERG9oiPjHyXAdDWzRNmq+l2eVxpAVI3YeXmMILH/KNi
 KxoAXslpzwAAhWF5uY99OovzJCsiId7TmNqEJlxHvf/YpICwT4rospu5oSwI6eWslq8r
 LFBwa90are2m1eLvVkdrwi8BCF8s99wnhOcBHLmRkZs7Vo1DHKIozLzDDdz4ciymsrXw
 Z3x7yTKbqCp+Fizgazay7j2HgjaqGKFVFxHloo2Qgy/M7p2grRXqS8zk9tRhPq7fCgki
 Ei40tes4JHYSbCySAsdnJwXQpcgrMnsCZ63XEyHJzHN5c6bjuuLJmMSqlXJbXuXHQ9Jr
 VDag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSshvGuvDkOr062XWS+gjvg7X61jlzEw2USHD0+vfOpSUYJnjmsZ8Fj/pI9fDBRQQ2xWW3uQpBZCw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxbj0YWJs84XLefCD0Ukbif55GnszmAat7cj48CMTexUWQNRo85
 rBGGAGr13TPb3ymB5EtTaTf5cUkXY42xk7k4qSgvguY0Epvez60QejLBy/bVzE3CZFfHWZQQWGK
 QadmAN28XDcRX4jMSAtHmeKCjRbwP6WgNAjNB/7wK0H0a9OgPuLaq+m6WbEaRDJRkSQ==
X-Gm-Gg: ASbGncsWibj35jRew+zqKaH9t6uvb5+uYuBa/uW7kyx4JSoAKWNx/CDmBsMsRaNHHh0
 yVg2CRdLmLFpQELy60uYUIaj7Pcuc8QDfknqQRgCgrkomQ3HN6yPmKIlTHTjYs0jqMzfOzJ7h3y
 ajQ8s2bIZjcjj3Wgq8AUxBOP3inQu9ndHtnu9jdw4cDYoCFsYIAxbUUIaP3Sb0XhRiIWr/AW1k/
 Lw+xMLDe8TVJkjwlazA5ccE2BhFhAm8sKYKQr0hQcdx4NQ56wLbXF3v6prCKO6SlvCpb62k1IYP
 0ooJ39wr1utWkfGWFALuiOftOfm0Qv30sIB0bq+a5yUZiKAWZYs=
X-Received: by 2002:a05:600c:3e14:b0:43c:fceb:91a with SMTP id
 5b1f17b1804b1-441d0fccc42mr27860405e9.11.1746541274436; 
 Tue, 06 May 2025 07:21:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcl3pdRwGtR90YF92Wz2k29+8QkFp4HNoMWwAPK/gnK9MygK9LLY/Q0xnpACkC8ozFWRpQJg==
X-Received: by 2002:a05:600c:3e14:b0:43c:fceb:91a with SMTP id
 5b1f17b1804b1-441d0fccc42mr27860085e9.11.1746541274068; 
 Tue, 06 May 2025 07:21:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ef9e:3e6f:fd9c:5630?
 ([2a01:e0a:c:37e0:ef9e:3e6f:fd9c:5630])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b28732sm215496895e9.37.2025.05.06.07.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 07:21:13 -0700 (PDT)
Message-ID: <9876f066-d01d-41fb-ab6c-e474986dfec1@redhat.com>
Date: Tue, 6 May 2025 16:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add entries for drm_panic, drm_panic_qr_code
 and drm_log
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250506133143.156447-1-jfalempe@redhat.com>
 <87tt5xvob0.fsf@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87tt5xvob0.fsf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dMa6nQke7ZNRPJHDfi-vbXbzSSbf3fFVHCh9CkOcDM4_1746541274
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/05/2025 15:52, Jani Nikula wrote:
> On Tue, 06 May 2025, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> Add myself and Javier as maintainer for drm_panic, drm_panic_qr_code
>> and drm_log.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   MAINTAINERS | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 38df6b159a3b..df3abdcf1767 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8177,6 +8177,34 @@ F:	drivers/gpu/drm/drm_panel.c
>>   F:	drivers/gpu/drm/panel/
>>   F:	include/drm/drm_panel.h
>>   
>> +DRM PANIC
>> +M:	Jocelyn Falempe <jfalempe@redhat.com>
>> +M:	Javier Martinez Canillas <javierm@redhat.com>
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Supported
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:	drivers/gpu/drm/drm_draw.c
>> +F:	drivers/gpu/drm/drm_draw_internal.h
>> +F:	drivers/gpu/drm/drm_panic*.c
>> +F:	include/drm/drm_panic*
>> +
>> +DRM PANIC QR CODE
>> +M:	Jocelyn Falempe <jfalempe@redhat.com>
>> +M:	Javier Martinez Canillas <javierm@redhat.com>
>> +L:	dri-devel@lists.freedesktop.org
>> +L:	rust-for-linux@vger.kernel.org
>> +S:	Supported
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:	drivers/gpu/drm/drm_panic_qr.rs
>> +
>> +DRM LOG
>> +M:	Jocelyn Falempe <jfalempe@redhat.com>
>> +M:	Javier Martinez Canillas <javierm@redhat.com>
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Supported
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:	drivers/gpu/drm/clients/drm_log.c
>> +
> 
> MAINTAINERS is supposed to be sorted. See commit 80e62bc8487b
> ("MAINTAINERS: re-sort all entries and fields").

Sure, I will move the "DRM LOG" block just before "DRM PANEL DRIVERS"
The rest should be already sorted correctly.

Thanks,

-- 

Jocelyn
> 
> BR,
> Jani.
> 
> 
>>   DRM PRIVACY-SCREEN CLASS
>>   M:	Hans de Goede <hdegoede@redhat.com>
>>   L:	dri-devel@lists.freedesktop.org
>>
>> base-commit: 258aebf100540d36aba910f545d4d5ddf4ecaf0b
> 

