Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F7BB74B5
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 17:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFD110E948;
	Fri,  3 Oct 2025 15:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WgnHF2AM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DF510E93D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 15:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759504514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfo/6tGmvIxa8VbfOOXLsx8Rp2oR2UqVT/QEdSKhdQY=;
 b=WgnHF2AMWsPNrLY1940eoVt2/7OjColZwsnuzyC0Ql8uFWY4WrnpAqeQM0oy0AuB9cXiTH
 /a0jYkAu7MYKZ9q1REK6fDqUayziLVm3NOLA0fDAw5ouWYM9MQf3++w1PrufMgALuM9tv2
 RRayJqPYDwITw0pOqyu+/0JWtOpBnQg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-vVlVz6b-OmuH1dneuGjjxw-1; Fri, 03 Oct 2025 11:15:12 -0400
X-MC-Unique: vVlVz6b-OmuH1dneuGjjxw-1
X-Mimecast-MFC-AGG-ID: vVlVz6b-OmuH1dneuGjjxw_1759504511
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3f4fbdf144dso1047333f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 08:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759504511; x=1760109311;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tfo/6tGmvIxa8VbfOOXLsx8Rp2oR2UqVT/QEdSKhdQY=;
 b=VSEf2+qHcPnPZhFbH49+HAMjczB4VACjQHCEBtIlQxsSylbYRBfO4i68PM8at9I2WD
 tv9wruRrgsJOhMNoxBajK7cpnekFFXCN4U6vwKZe94dlOF3SLgU97WR2/SdibyL8zowp
 CxfnCQ6jz7B31X/f/fdxJvOa9qKCxxvII5QnEXJf1smZuD3j4jSb9B4fhkZIMbgTQ43z
 fDTDzmVloUgl01m8n+cellzNMkA8zEvOF0r+/dfV/UVqgGpspA1pnN7kzYHxELCFTOwL
 r4oWZGg+sIb0SUyQAYdukGNYogL8CGKZTql9VIUt6BaFUHUAjTkip3pGouUCmh13NjS1
 vAWQ==
X-Gm-Message-State: AOJu0YynhMdvoZdlqPEBFxVVBm5EGp5y9EEH3Il8KdPg1rZUoyKlnWgh
 L+4DTdFDLcGbOPLn2KfWxj2KgRgTs9XYhU+Z4K9Q1gI6PySnLf3tx0tUN2pqkxCP+h957v/Yh+u
 LESFsEiWOFXglT8aGwN72OHAuDDwQzXR5ImAzOrYySfEHPfLB5aOmdqcz5uRVupfVyPj/hg==
X-Gm-Gg: ASbGnctMEdifpjb5uAy04mSyViBB2vo49V0n3VTpf1f8jBZPvfG+WqSlX61Uiv2em+C
 IWOVn9c6Ut+kqVaqdSKTtMChfZtS1rKk8dflEbCoDS7wqHefIisgv8+ifhoKWpBOi4tcV1RBLt8
 4CCJ2I9tSPrGS2Rv/MqAYYnOZRS8VylF4KBlrJJ1P/LmQ/RsnhDs/9sW3ajk/rqNagrxOmKVMaf
 DwMEP7Zs+kFLc3Yc1mm5l/rPHsyRdPFiNU+i8mc1a1WOXlkz5JQMk8GKxS7lIzaBSW4xhE4xf6b
 hD1s//906juUdrGdNNJhN+TA6Er1sQ7S+15ogLffxZR23IJipvRPYKOgZ9FxyRunETqxVsbMgw2
 R3DobiLPLhg==
X-Received: by 2002:a05:6000:2c11:b0:3ec:d7c4:25b6 with SMTP id
 ffacd0b85a97d-4256713ff18mr2417445f8f.27.1759504511182; 
 Fri, 03 Oct 2025 08:15:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtcnJtekHtQnXXJ9a+FzvQt/8qV7u7ycDIkPqz1URBrVhUei9CSCYg8V6xT96qeWh50+z2Jw==
X-Received: by 2002:a05:6000:2c11:b0:3ec:d7c4:25b6 with SMTP id
 ffacd0b85a97d-4256713ff18mr2417418f8f.27.1759504510819; 
 Fri, 03 Oct 2025 08:15:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a4161bsm143036495e9.16.2025.10.03.08.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 08:15:10 -0700 (PDT)
Message-ID: <7a6eba4c-0d24-47c2-92ad-f63116d45a69@redhat.com>
Date: Fri, 3 Oct 2025 17:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/draw: fix color truncation in drm_draw_fill24
To: Francesco Valla <francesco@valla.it>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251003-drm_draw_fill24_fix-v1-1-8fb7c1c2a893@valla.it>
 <70cbbf88-7c1e-44f4-8091-ee76944d2f6b@redhat.com>
 <3881844.vuYhMxLoTh@fedora-2.fritz.box>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <3881844.vuYhMxLoTh@fedora-2.fritz.box>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GV31-ZJxaqBXFgMUk2-6FDMJDWLXQ4H2qmhxELV0-sk_1759504511
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

On 10/3/25 16:41, Francesco Valla wrote:
> Hi Jocelyn,
> 
> On Friday, 3 October 2025 at 14:48:03 Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> On 10/3/25 12:33, Francesco Valla wrote:
>>> The color parameter passed to drm_draw_fill24() was truncated to 16
>>> bits, leading to an incorrect color drawn to the target iosys_map.
>>> Fix this behavior, widening the parameter to 32 bits.
>>>
>> Oh, you're right, my mistake.
>> Did you find this by using a 24bit hardware, or by looking at the code?
>>
>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>>
>> Best regards,
>>
> 
> I am working on a graphical splash DRM client (which I hope I'll be
> able to post soon) and testing it on a Beagleplay - which is
> RG24-capable - I started to see a strange behavior with non-black
> colors. After some investigation I found the cuplrit, and strangely
> enough it wasn't me this time.

Thanks, I was wondering if this 24bit code would see a real usage, so it 
looks like this is still a thing in 2025.

Best regards,

-- 

Jocelyn

> 
> Best regards,
> 
> Francesco
> 
> 
> 
> 
> 
> 


