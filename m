Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFEE8B1DD1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 11:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B90D10FE01;
	Thu, 25 Apr 2024 09:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J40FCe9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D4510FE02
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714036978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AxVOqCleBMDIW/ByJ67k7KAL9izw4KY+nAlh60+o9Hs=;
 b=J40FCe9v8+aM0Z8vQy4AZckjjPs5xfo86C7a6Bn9oyY7xtcRQ1BLpYWryz8wIAOHECLRjb
 mZ0+biKNCp4gBEadXrTHJvLA9k/rk9MtX31ZS0FTx8yBFKt/iDlfOnA8dh3ztBhRWklk8c
 zoqMezFtqpJR+dWsuSnN76sAGup2NqM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-q5tciiR0OEi2_th0NTocvw-1; Thu, 25 Apr 2024 05:22:56 -0400
X-MC-Unique: q5tciiR0OEi2_th0NTocvw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-34b0eb748f9so474953f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 02:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714036975; x=1714641775;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AxVOqCleBMDIW/ByJ67k7KAL9izw4KY+nAlh60+o9Hs=;
 b=IBCdUi0/avJyTDEB5s+TQAXTLdwFzJdGdCI+qVXuhguJqRDNbQx6uYxDsR0KQMq+PK
 gsjH/x0jeklwq/OSClHtn1iWJC/SlZCZfdYzwtPc8KEiYasBmEPTjjHkUMYgCGYtwsez
 uI/QRuwyx2raZHBhsCDNTLS0ThOWBftgybV4JYResJL1ZjIbXnHm15bgszOMOg6YI2+g
 zEGcCyyAS9K0AIldPvUof4pVntUAoc+Z7Bh/mZv5W8YTv5eLwt0djQtdBGXryccEfc+c
 7YdejJKU59YfYMGtLg9fL9IcjnhBqxfOAPurconAE/t2gEURvLrna8oyc0ISLeSFAnzW
 i4xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhJKGIAssD63bRHWdCXehwtQdMp2I29uFOvprsDjlNIdYmVhyOC40LBeviG2htQMiOFXq0ocZGHftZe9+Pa9oW2BvlXA3ax4UjkBgsaHZH
X-Gm-Message-State: AOJu0Ywt5uwrR9xnNH+FVOtAdL3lOgS8RLF8RuV4mDrngnqa5vMRS+d+
 hDPQo53oZUiXw280onb6uVMiYkAHKbqzOaXY1uxuoVtNtOuR+TUi4CoKL2XiYTv1rEOtXFPA9bz
 sIhno9FbK5S18tYZBPV8lOmL/7tDAOJcuDYz+sl6rv/e6Xx9dblZfMwoTJBll/aH6vw==
X-Received: by 2002:a05:600c:a47:b0:41b:4d5d:9687 with SMTP id
 c7-20020a05600c0a4700b0041b4d5d9687mr783439wmq.24.1714036975235; 
 Thu, 25 Apr 2024 02:22:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZx2CGKayPSYRJJU36QaH68kn0admzBOk1wBPDIGabrTkFGgP7cte5hNSk7Msg+eAtqgaAGg==
X-Received: by 2002:a05:600c:a47:b0:41b:4d5d:9687 with SMTP id
 c7-20020a05600c0a4700b0041b4d5d9687mr783420wmq.24.1714036974803; 
 Thu, 25 Apr 2024 02:22:54 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e6-20020a05600c4e4600b0041b43e301e8sm1716682wmq.42.2024.04.25.02.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 02:22:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Steven Price <steven.price@arm.com>, Andy Yan <andyshrk@163.com>,
 boris.brezillon@collabora.com
Cc: daniel@ffwll.ch, airlied@gmail.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Andy Yan
 <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/panthor: Add defer probe for firmware load
In-Reply-To: <54e4a174-dea7-4588-b8a6-0310c210ffce@arm.com>
References: <20240413114938.740631-1-andyshrk@163.com>
 <54e4a174-dea7-4588-b8a6-0310c210ffce@arm.com>
Date: Thu, 25 Apr 2024 11:22:53 +0200
Message-ID: <87frv9zthu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Steven Price <steven.price@arm.com> writes:

Hello Steven,

> On 13/04/2024 12:49, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>> 
>> The firmware in the rootfs will not be accessible until we
>> are in the SYSTEM_RUNNING state, so return EPROBE_DEFER until
>> that point.
>> This let the driver can load firmware when it is builtin.
>
> The usual solution is that the firmware should be placed in the
> initrd/initramfs if the module is included there (or built-in). The same
> issue was brought up regarding the powervr driver:
>
> https://lore.kernel.org/dri-devel/20240109120604.603700-1-javierm@redhat.com/T/
>
> I'm not sure if that ever actually reached a conclusion though. The
> question was deferred to Greg KH but I didn't see Greg actually getting
> involved in the thread.
>

Correct, there was not conclusion reached in that thread.

>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>> ---
>> 
>>  drivers/gpu/drm/panthor/panthor_fw.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
>> index 33c87a59834e..25e375f8333c 100644
>> --- a/drivers/gpu/drm/panthor/panthor_fw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
>> @@ -1336,8 +1336,17 @@ int panthor_fw_init(struct panthor_device *ptdev)
>>  	}
>>  
>>  	ret = panthor_fw_load(ptdev);
>> -	if (ret)
>> +	if (ret) {
>> +		/*
>> +		 * The firmware in the rootfs will not be accessible until we
>> +		 * are in the SYSTEM_RUNNING state, so return EPROBE_DEFER until
>> +		 * that point.
>> +		 */
>> +		if (system_state < SYSTEM_RUNNING)
>
> This should really only be in the case where ret == -ENOENT - any other
> error and the firmware is apparently present but broken in some way, so
> there's no point deferring.
>
> I also suspect we'd need some change in panthor_fw_load() to quieten
> error messages if we're going to defer on this, in which case it might
> make more sense to move this logic into that function.
>

In the thread you referenced I suggested to add that logic in request_firmware()
(or add a new request_firmware_defer() helper function) that changes the request
firmare behaviour to return -EPROBE_DEFER instead of -ENOENT.

Since as you mentioned, this isn't specific to panthor and an issue that I also
faced with the powervr driver.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

