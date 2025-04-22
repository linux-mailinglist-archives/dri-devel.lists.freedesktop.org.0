Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2BDA96065
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 10:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6682010E516;
	Tue, 22 Apr 2025 08:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jKY8Iapx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDC810E516
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 08:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745309018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KOK06Gy+USdFFUjUhlRbDrQoZuj04eP9w8IDxAKpvDk=;
 b=jKY8Iapx3SRFnaFHJaNpB4itDV0W3GH7i4TklFo3sckSTHLOs0JYd0SXdhUSx4sQiaimuy
 V4sa5IPIa3ftS7oXgVK6irWVt/KYIxdSa7ACw/3e+sY2zcYF1OfikFVSinaCqoCRbbPiqc
 iJ5ow4OkAFVEQlV89j0FjKJEu/ePtDA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-I79zj4WeNS-KzwutxxIcEA-1; Tue, 22 Apr 2025 04:03:36 -0400
X-MC-Unique: I79zj4WeNS-KzwutxxIcEA-1
X-Mimecast-MFC-AGG-ID: I79zj4WeNS-KzwutxxIcEA_1745309015
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3912fc9861cso1078576f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 01:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745309015; x=1745913815;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KOK06Gy+USdFFUjUhlRbDrQoZuj04eP9w8IDxAKpvDk=;
 b=QsySZYOlUT/DfvQgHZ1LuYSgZvUkTsqg0zJauueYvJHFKFdyQOz2m87iLf7S7304sW
 2n8Pj6FF4rjZlVfLKkjik4vBPzMOVdYg9GuWaHY54YvZrVoZOL3s9txKfgbP+QbWmJVz
 Rz2Tt5d6bTuQPurey2PifGb9FHVmJiCbYdlogz2rEJt1Bz0OsiJ8Snz5rg283JwcrnR3
 I448Bbkp4JF219Ja1lfdCi4IEhXxceLURm48+gJ6QTHvbAfV6Ol+0QsJ0FnK7YKwd9mq
 iTXqt8Vjr1cJUGpZ59YXp2DAz6VhTFH1wWftpOoCUYrwi6sK1Ye7LEYTqEvIiXvs4tyC
 j/Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEy3s39zdXpYM1qc7wGo32s1oTCD8TOlukVqeat/KWjEM2hg865dHtAo6pFzzBj08MaFEuqmhYkvQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVWeUU5171ysZgGkg2eLJeFhtVbSh0fe8VDlm1b2XgT9ufPaFu
 reYSjgJo4IDrl35F9jeMS4KpK7tEPrhRbH3hMuF/2AgMcV81gG7BSuvFPBMYr+gOUODxgqEm7dc
 0PgQBFE6p2IRVPSJeeXPxpay0B520yMVe4B3xWKFoJFD/3/7eFaQDDAa891utpgTzPg==
X-Gm-Gg: ASbGnctuGmnZKmYCZRASq80EIYkn+HkVRe1B6UFg1usT+L8/PEPV45NLUnw+fncSpb7
 4uS6nj47iy2q8aINu8llnjakK3fnmiQ2gtdt4c6i66pzKzITB7EIvo/dGLGOecqTQ50uRGJJeei
 CbMIJK9FRPpX/GvoEIoF0z7NiCTxl10Iun6jhqxTo5F2ZUBK4emA5q87dTQGmGWUL2QBgSQo8wo
 dEzPTqzutjdaqOJ2Vr4Fen9+Am3sIWHqY0CISTPmHog3QYfKtjHXSAAsbKbOG8nnkySre2lKMaX
 TXHNUwJigqHII6JopkBQp9PIwX0H9xoqmKOYEujuC09iwFrGiT8=
X-Received: by 2002:a05:6000:1acb:b0:39e:cbf2:e23f with SMTP id
 ffacd0b85a97d-39efb949514mr12348680f8f.0.1745309015363; 
 Tue, 22 Apr 2025 01:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+QyOm/Vu2YE4p69xcQvAMQItgNodGSQLc0uE5uT6jNKC/u0jIIwsbmq+1mCMLdKIAUP3k4A==
X-Received: by 2002:a05:6000:1acb:b0:39e:cbf2:e23f with SMTP id
 ffacd0b85a97d-39efb949514mr12348638f8f.0.1745309014968; 
 Tue, 22 Apr 2025 01:03:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5a9ed9sm166802545e9.3.2025.04.22.01.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 01:03:34 -0700 (PDT)
Message-ID: <e18bccaa-bc73-4d7d-a708-688284b1d15f@redhat.com>
Date: Tue, 22 Apr 2025 10:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250418165059.560503-1-jfalempe@redhat.com>
 <CANiq72neXsmmYQXQOYxndFWkyp1NKa=x3skekZZJOVE-wMZeuQ@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72neXsmmYQXQOYxndFWkyp1NKa=x3skekZZJOVE-wMZeuQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BJPkx1BW0k2Bm3LkBEpGhdYOn0U87FMpNt4j01b1NuQ_1745309015
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2025 20:18, Miguel Ojeda wrote:
> On Fri, Apr 18, 2025 at 6:51 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
> 
> Thanks for fixing that -- some tags for your consideration:
> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/
> Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")

Thanks I will add those tags before pushing to drm-misc-next.

-- 

Jocelyn

> 
> Cheers,
> Miguel
> 

