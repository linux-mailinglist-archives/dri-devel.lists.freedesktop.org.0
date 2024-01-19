Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633F2832E0C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 18:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00C210EA49;
	Fri, 19 Jan 2024 17:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCF110EA44
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705684850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gc7id4buHweFuwoWqko/ALuAWJCfbVmESvjPiJkIOCM=;
 b=AF5HuReT+D81QaeSQIN7BSwemEJO0409Zc0nL9DeRg/M2S2htV8b/1/41HbP1RSPrtY3X/
 DYvZzT4fzmARV0HBDeGUc0CQbUagaWzU3woofN9mSBZxSPYJcLjmtI/ALiRWT1OgAXlLAC
 PWhu76ipvy4BdBU0w2IKhYgJdJLiFH8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-gIm5VrFBPs-LI7opdTzkzw-1; Fri, 19 Jan 2024 12:20:46 -0500
X-MC-Unique: gIm5VrFBPs-LI7opdTzkzw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-337d7158aa7so489042f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 09:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705684846; x=1706289646;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gc7id4buHweFuwoWqko/ALuAWJCfbVmESvjPiJkIOCM=;
 b=mdfjjYJBkLpM6CxIcik8jdnaBRnAfwfeCTHV7o3Ys7PMJW82qOYHZqAGbSiJjQ1v/6
 UiHnhCPHjL6r3rFIqSzVeLot+iC2UnciyLglYSCcrzFKdGLZ83zoWCsNrqbC0+tkTMQn
 fMgsDCyZMpiyzWClF/FMNcrIKzaqSwvqmgbkd8kPmAVBN5uvhrWl7z203LszOi1+Dv+k
 IAXPvobr7lzfR/JnM6aeaUBkqA5FejLBL6IpBnWAqG+ejiJkutL2R0drLjEZPa28E42/
 i8F9eAQoG86eLkWU3crOx3YuENXBDZXVg/aaJlZdTJS67qYv3rBfBVyoKCOnJ/M8GOHM
 x8Qg==
X-Gm-Message-State: AOJu0YxLnlad5gCtq0GQyCh0/q3DmBatM2eI0KUULHDeBUtUXFRFiC+f
 IUNd+nOkFmiGKUsmCiKwDk+dJfm6WDODGFQCtOuYwtaJFZO+wqBv2ybHtezF2kHwz4CE9z2UvHP
 ynsFgi80kEa0yfeSzSjci+6kv6oLPuETSTgzGfl2inxoq16wckhBG91q5PUROqq2bpw==
X-Received: by 2002:adf:e9c1:0:b0:337:629c:9b3e with SMTP id
 l1-20020adfe9c1000000b00337629c9b3emr16375wrn.193.1705684845898; 
 Fri, 19 Jan 2024 09:20:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3JOpqmrzFFFbKjopBTIjoqQvAQR79pVeVtI1xUItLPtVenWgZi+XK/X63b2xDKtgoqiJArg==
X-Received: by 2002:adf:e9c1:0:b0:337:629c:9b3e with SMTP id
 l1-20020adfe9c1000000b00337629c9b3emr16365wrn.193.1705684845562; 
 Fri, 19 Jan 2024 09:20:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 p12-20020adfce0c000000b0033865f08f2asm2179897wrn.34.2024.01.19.09.20.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 09:20:44 -0800 (PST)
Message-ID: <f8b81eaa-5a7f-447e-ad57-7a04be6f289b@redhat.com>
Date: Fri, 19 Jan 2024 18:20:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] drm/panic: Add a drm panic handler
To: Daniel Vetter <daniel@ffwll.ch>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-3-jfalempe@redhat.com>
 <ZaFDvaOgjM_nGOKz@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZaFDvaOgjM_nGOKz@phenom.ffwll.local>
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com, mripard@kernel.org,
 gpiccoli@igalia.com, noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/01/2024 14:50, Daniel Vetter wrote:
> On Thu, Jan 04, 2024 at 05:00:46PM +0100, Jocelyn Falempe wrote:
>> +/**
>> + * drm_panic_init() - Initialize drm-panic subsystem
>> + *
>> + * register the panic notifier
>> + */
>> +void drm_panic_init(void)
>> +{
>> +	atomic_notifier_chain_register(&panic_notifier_list,
>> +				       &drm_panic_notifier);
> 
> Ok I've found another one after checking core panic code. This is the
> wrong hook, we want to be a sttruct kmsg_dumper and use
> kmsg_dump_register. And again once for each drm_panic_device so that we
> can rely on core locking, as I've explained in the other reply.
> 
> Also because it trashes buffers from userspace I think by default we want
> to only dump on panic, so KMS_DUMP_PANIC.
> -Sima


I've tested this change and I don't think kmsg_dumper is the right callback.
At least with panic_notifier, you get one line on why the panic occurs. 
With kmsg_dumper you get the whole kmsg buffer, but I don't want to 
throw that at the user. And it's not possible to extract just the panic 
reason from the log.
I think the debug information should go in a QRCode, so you can actually 
report the crash somewhere, and copy/paste the backtrace and other info 
to the bug. I've a PoC for that, but I prefer to have the main drm_panic 
merged before working further on this.

Anyway it's pretty easy to change from one to the other, since the API 
are quite similar. So if we need the complete kmsg log someday, it 
should be easy to switch.

Best regards,

-- 

Jocelyn

