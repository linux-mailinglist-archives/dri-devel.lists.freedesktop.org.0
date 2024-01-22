Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2637783775C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 00:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E351B10F0F0;
	Mon, 22 Jan 2024 23:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEEC10F0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 23:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705964670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7c3FgscPu0lXJFm3GTXyVD6XcnpcGhNdTIze30CTggI=;
 b=IYIW5mbwSJvbUMCs8CISYmr7DNTOFVMZo/vzl/JF6Z9zwMM0mf0J9dlF2Y8p8UprnvO7UY
 dOs5nf+9/qmFVVVSogT11D4T1AdIGlrn9UG+3sb59WWgDabWnCm9IwxS6jpGCeoO8Bfh6f
 2P/iLMwW+p3Jx7QzrACRKPPCxBIY8sI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-3sNp94_2P1m95CgdN1tUuQ-1; Mon, 22 Jan 2024 18:04:26 -0500
X-MC-Unique: 3sNp94_2P1m95CgdN1tUuQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40e49906305so15684245e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705964665; x=1706569465;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7c3FgscPu0lXJFm3GTXyVD6XcnpcGhNdTIze30CTggI=;
 b=kE/wE+FXJ1r1xKaZe57MTifnFEX699fdm/L2cV4mpRQEwnaHqktd+UZxCmpNYqst9E
 QpIeoJebEDRZQFXhVKAHdEkvYD4TVug+76N4sRYAiWgxcf65p0W3vP3ooGFzl4r7gH/6
 BCpFSSGHkDWTOqvGSxHmrboBbyMHGHpa46ABXbe1TNwsmorjBPIvcc3iEvTWBVOspY4M
 tVnUx1mF5kgnN00Js+UKu6aeC9SxM5IeGf6XfAYV1JUJyGqYhYLjL7DVs7WTcmJs/kV6
 1SDR9/dDTtojdMgRZY6QVEmYrcqaT8oLlu2EMrzHeWXE3lBRC9ppM4SIRzzHP+dzbdUw
 xhuw==
X-Gm-Message-State: AOJu0YyEQHLKrrGITffkFNWTmrMuCqIrBrsLakStuatXiXTdhlPO2n65
 k1c6xfe17QyFgBm2L4XhpmIWnwpLUzJmQ34ICJtEQHJ257sqg3cHvRJOboWAkOmbCuoeTY02gIA
 FZVBTkUYQlrqLMEX1/0GrXfGvcLfX4QsbPsGb0crPUaJ2Roz6SmKhgZ2yRq/fOiWXmQ==
X-Received: by 2002:a05:600c:19d0:b0:40e:47f5:c74e with SMTP id
 u16-20020a05600c19d000b0040e47f5c74emr2213225wmq.23.1705964665578; 
 Mon, 22 Jan 2024 15:04:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8352cOmaMtQLEHn07VgcDYdo9jNcXTeLbFnRyNs5Xa66msABsScIDJEFKORTq82yXMRla/w==
X-Received: by 2002:a05:600c:19d0:b0:40e:47f5:c74e with SMTP id
 u16-20020a05600c19d000b0040e47f5c74emr2213221wmq.23.1705964665204; 
 Mon, 22 Jan 2024 15:04:25 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b0040d7b340e07sm40645479wmq.45.2024.01.22.15.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 15:04:24 -0800 (PST)
Message-ID: <bdc7e401-a676-4040-9138-8dc5cf35bd05@redhat.com>
Date: Tue, 23 Jan 2024 00:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau/fifo/gk104: remove redundant variable
 ret
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Colin Ian King <colin.i.king@gmail.com>
References: <20240116111609.2258675-1-colin.i.king@gmail.com>
 <aafe669f-b322-4f22-a48e-564e3eb3447f@moroto.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <aafe669f-b322-4f22-a48e-564e3eb3447f@moroto.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Daniel Vetter <daniel@ffwll.ch>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/16/24 13:31, Dan Carpenter wrote:
> On Tue, Jan 16, 2024 at 11:16:09AM +0000, Colin Ian King wrote:
>> The variable ret is being assigned a value but it isn't being
>> read afterwards. The assignment is redundant and so ret can be
>> removed.
>>
>> Cleans up clang scan build warning:
>> warning: Although the value stored to 'ret' is used in the enclosing
>> expression, the value is never actually read from 'ret'
>> [deadcode.DeadStores]
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>> ---
>>   drivers/gpu/drm/nouveau/nvif/fifo.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
>> index a463289962b2..e96de14ce87e 100644
>> --- a/drivers/gpu/drm/nouveau/nvif/fifo.c
>> +++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
>> @@ -73,9 +73,9 @@ u64
>>   nvif_fifo_runlist(struct nvif_device *device, u64 engine)
>>   {
>>   	u64 runm = 0;
>> -	int ret, i;
>> +	int i;
>>   
>> -	if ((ret = nvif_fifo_runlists(device)))
>> +	if (nvif_fifo_runlists(device))
>>   		return runm;
> 
> Could we return a literal zero here?  Otherwise, I'm surprised this
> doesn't trigger a static checker warning.

Why do you think so? Conditionally, runm is used later on as well. I don't
think the checker should complain about keeping the value single source.

If you agree, want to offer your RB?

- Danilo

> 
> regards,
> dan carpenter
> 

