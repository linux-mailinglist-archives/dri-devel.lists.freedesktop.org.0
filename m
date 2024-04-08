Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0927289BD61
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 12:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26434112427;
	Mon,  8 Apr 2024 10:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RyypQ+/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B739B112425
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 10:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712572616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UEuaFAKd6SJyY02mGd3rdGzayUCZrJ0Um5mQfFRWUaA=;
 b=RyypQ+/PVIHXi9A6sZ4giL6BwX7N5ePTbQ92s1XhcB+uE2GvBB3rQIwllPeu5CxsxR6I34
 i55xC+E0eHPHiUmxdqEVpB7v8FioUv5F154QYEGpw1eHMOXEN7D9cKq2miX+0ygIGEgCOh
 9R8IKH76zjIAOL04fp3c9NhwuBmmN3Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-7RfetguwMIGC9Zukyy2wBg-1; Mon, 08 Apr 2024 06:36:53 -0400
X-MC-Unique: 7RfetguwMIGC9Zukyy2wBg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-345aa380e51so539732f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 03:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712572612; x=1713177412;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UEuaFAKd6SJyY02mGd3rdGzayUCZrJ0Um5mQfFRWUaA=;
 b=bVs06Tc6yj9ANFXPTLZtL5oS6LItUYJlHF+Tw6YSJz9iFJszRDeB85zf6dU0Gpfymi
 2hkN+xZxFLGD6jHMom6YyzmwdX/La2T+wAyTHVR1bU6dWr1ezX9VUdCelzNTgYF4Y51P
 mwziOsv8If402Z6kjFLjSJf6AZvSjDGqFBKCKKQn7nXlf4lQgW6tNOUjyOhvY8zPD/Sw
 0llNT5d/wAFMhSBuEIyQ1Mn6KZvAQ3STnKSzy0fssy6ICMEbpWX2f4xfKQ08fENm7e1D
 b2snokZ3ONfjCy+lPwchUVFzeBRJgZbOY+RSutxutil1FMmP0fEYirFMmKlFrEsm0wic
 SXZQ==
X-Gm-Message-State: AOJu0Yy6h70w3CMnNKVjEkPXkjlFxrwYUtv1MQ8OFglqm+uPbxFMtZyG
 VXUM/V81KgCXy2wYihgwz2Z27QKF2hZGEb12iiSVadCFn5pyK8LWTDYM/wiUpEDuEqaIbDf4L6U
 hv6LbVtPpz8khXQhbJ/E+HWPExW5oK8cE2RDPlGVVmZmcdLb3nIo4TitWJ//1UcEl/g==
X-Received: by 2002:a5d:6890:0:b0:343:94a8:8edc with SMTP id
 h16-20020a5d6890000000b0034394a88edcmr5677715wru.56.1712572611883; 
 Mon, 08 Apr 2024 03:36:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5fSBVKl1JetjGSsG7BngvKrrjN0N+i2bSLl098pXKBi+QxkReGFRfWMwOQ/XRU5WekgZBgg==
X-Received: by 2002:a5d:6890:0:b0:343:94a8:8edc with SMTP id
 h16-20020a5d6890000000b0034394a88edcmr5677700wru.56.1712572611454; 
 Mon, 08 Apr 2024 03:36:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:f101:edd0:5929:7a40?
 ([2a01:e0a:d5:a000:f101:edd0:5929:7a40])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a5d4284000000b0033e7603987dsm8706453wrq.12.2024.04.08.03.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 03:36:51 -0700 (PDT)
Message-ID: <f88584ae-b1c0-4542-9171-93f1760b65ad@redhat.com>
Date: Mon, 8 Apr 2024 12:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] drm/mgag200: Detect connector status
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240403093114.22163-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240403093114.22163-1-tzimmermann@suse.de>
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

Hi Thomas,

I've tested this series on my Dell T310, and it works well, when I 
plug/unplug the VGA screen, it's reflected in /sys/class/drm/.../status

I've also tested it remotely on a Dell R640, which doesn't have a VGA 
monitor connected.

After the patch, on the iDrac console, I only get a green screen saying:

"Out of Range
Reason: Video Capture Failure
Detected Resolution: 0x768
Detected Color Depth-1bpp"

and the file:
/sys/class/drm/card0-VGA-1/modes
is empty

Before the patch, the driver reports VGA as connected, and modes 
contains 1024x768 and others.

I think we may need to add a virtual connector for BMC, like I've done 
for AST ?
So that when no VGA monitor is available, you can still choose an 
appropriate resolution.

Best regards,

-- 

Jocelyn



On 03/04/2024 11:24, Thomas Zimmermann wrote:
> Detect the connector status by polling the DDC. Update the status at
> runtime. Clean up a the driver's DDC code in the process.
> 
> Patches 1 and 2 fix long-standing problems in the DDC code.
> 
> Patches 3 to 9 refactor the DDC code. The code then keeps its data
> structures internal, acquires locks automatically and it much more
> readable overall.
> 
> With patches 10 and 11, mgag200 makes use of existing helpers for
> reading and probing the DDC. It then correctly updates the status
> and EDID at runtime.
> 
> Tested on various Matrox hardware.
> 
> Thomas Zimmermann (11):
>    drm/mgag200: Set DDC timeout in milliseconds
>    drm/mgag200: Bind I2C lifetime to DRM device
>    drm/mgag200: Store pointer to struct mga_device in struct mga_i2c_chan
>    drm/mgag200: Allocate instance of struct mga_i2c_chan dynamically
>    drm/mgag200: Inline mgag200_i2c_init()
>    drm/mgag200: Replace struct mga_i2c_chan with struct mgag200_ddc
>    drm/mgag200: Rename mgag200_i2c.c to mgag200_ddc.c
>    drm/mgag200: Rename struct i2c_algo_bit_data callbacks
>    drm/mgag200: Acquire I/O-register lock in DDC code
>    drm/mgag200: Use drm_connector_helper_get_modes()
>    drm/mgag200: Set .detect_ctx() and enable connector polling
> 
>   drivers/gpu/drm/mgag200/Makefile          |   2 +-
>   drivers/gpu/drm/mgag200/mgag200_ddc.c     | 179 ++++++++++++++++++++++
>   drivers/gpu/drm/mgag200/mgag200_ddc.h     |  11 ++
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |  19 +--
>   drivers/gpu/drm/mgag200/mgag200_g200.c    |  15 +-
>   drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  15 +-
>   drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  15 +-
>   drivers/gpu/drm/mgag200/mgag200_g200er.c  |  15 +-
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  15 +-
>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  15 +-
>   drivers/gpu/drm/mgag200/mgag200_g200se.c  |  15 +-
>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  15 +-
>   drivers/gpu/drm/mgag200/mgag200_i2c.c     | 129 ----------------
>   drivers/gpu/drm/mgag200/mgag200_mode.c    |  27 +---
>   14 files changed, 274 insertions(+), 213 deletions(-)
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_ddc.c
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_ddc.h
>   delete mode 100644 drivers/gpu/drm/mgag200/mgag200_i2c.c
> 

