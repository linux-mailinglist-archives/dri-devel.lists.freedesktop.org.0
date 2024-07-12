Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A5A92FC4B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 16:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC8810E115;
	Fri, 12 Jul 2024 14:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HkQjljxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497C210E115
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 14:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720793504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2DwS+N+WpDe9hXUlwXatDaB5K36zULgGVjjk0aits0=;
 b=HkQjljxlILzTzV1aj+mMzoq99YUaImdsbkQj5kio7EJKjoJu1moa6thlhUZw6ARtpFljpm
 K37lKQDd5fQkMQ4p1bUUzeA4RJNz9vVieSGSlgA80oi/UGUzDFuLKQZosvebsgWdYp/VHK
 TAyvSPCBZi/LxcNRpcxUQtAfUgfcLQM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-Y-EGJb3CMMqj28uYI3N8ZQ-1; Fri, 12 Jul 2024 10:11:42 -0400
X-MC-Unique: Y-EGJb3CMMqj28uYI3N8ZQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-367a058fa21so1144424f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 07:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720793502; x=1721398302;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o2DwS+N+WpDe9hXUlwXatDaB5K36zULgGVjjk0aits0=;
 b=lU0GrwfdEXs5OpP75PrLF8UyA5//3gCsAL5WhMAVj3TsOAx/mPXERnwTazDb+o4nZc
 YJTkYdL7KLwtgtIfbuBoBxMiXdj9vaoQHPxq3o0uRnPMDR+vgMWHMfNVhR2OvSSP5KTF
 skqv4eOZYKEuVDTzC3Pjezz8do+Lo3hZoIRAb6nfLHv9gMUE2MuCYuLIXDd2aPyjOEJW
 zyXxPzDlaOIeqDbkyk3p95sa/0QgmFxNo/ei5jEMqr4AAboeWs2YosBH5QybjHe5KLUR
 28VE9xeFnN9eYlYHd/GblRQevgOfiQoHjw056KShTS+dVMAuvZj0cDDNc8S5N6sUFr+r
 gZyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzjhaE2ORCmaozuLocJsnUEHkbfO3oGd5rKsP5zqfR7r2oT3FNrJEYde7halOL4oHSh68wyV2T7ppiwtp2t8R06n22VP/Qj3v1ry3DUVdr
X-Gm-Message-State: AOJu0YxUrTiqmuXVM1E/7y70SCPbbfG9YoxHPkbBqiD2A16pt91tvBbx
 t/kduepgmhvNq+b7s9FXAK9Yu1rzqc3nGAjd3eGZ5zCDtJWjtTiTU8Mbx+bVdlF/mNK/qEDb8kZ
 ciwHhBV6TvrULgj8tiHI4mSBmBYxYs5dtLDRrKPLa3mVlIgdmYdOe/RP9tg0vgP1L6A==
X-Received: by 2002:adf:f8d2:0:b0:367:40eb:a3c3 with SMTP id
 ffacd0b85a97d-36804fec57emr1911290f8f.34.1720793501789; 
 Fri, 12 Jul 2024 07:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf3U4d9gFM4veykTOQEiy8D2ryeNYD+ff/pVMiWh3YGrTu6bLAg3UO2081Jf+2o1pI3Alwgw==
X-Received: by 2002:adf:f8d2:0:b0:367:40eb:a3c3 with SMTP id
 ffacd0b85a97d-36804fec57emr1911266f8f.34.1720793501451; 
 Fri, 12 Jul 2024 07:11:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7e187sm10376600f8f.21.2024.07.12.07.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 07:11:40 -0700 (PDT)
Message-ID: <a24ea2d7-9f48-412c-9a40-9624f6c4f9d9@redhat.com>
Date: Fri, 12 Jul 2024 16:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
To: Kees Cook <kees@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <2d886ba5-950b-4dff-81ea-8748d7d67c55@redhat.com>
 <277007E3-48FA-482C-9EE0-FA28F470D6C4@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <277007E3-48FA-482C-9EE0-FA28F470D6C4@kernel.org>
X-Mimecast-Spam-Score: 0
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



On 12/07/2024 15:34, Kees Cook wrote:
> 
> 
> On July 12, 2024 2:59:30 AM PDT, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> Gentle ping, I need reviews from powerpc, usermod linux, mtd, pstore and hyperv, to be able to push it in the drm-misc tree.
> 
> Oops, I thought I'd Acked already!
> 
> Acked-by: Kees Cook <kees@kernel.org>
> 
> And, yeah, as mpe said, you're all good to take this via drm-misc.

Thanks a lot. If there is no objection I will push it to drm-misc mid 
next week. I may have all required acks by then.
> 
> Thanks!
> 
> -Kees
> 
> 

Best regards,

-- 

Jocelyn

