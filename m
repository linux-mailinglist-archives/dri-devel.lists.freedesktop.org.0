Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9A18C738D
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 11:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B3310E033;
	Thu, 16 May 2024 09:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B+Srm9BF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C370510E033
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715850888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JBxeryWPfBVD++JUygHdXmOw5xa/3cbkfQlX1iZhB5A=;
 b=B+Srm9BFt89UwKdFqwKZfSeN9pea0VMFrSTacU7pd0yXY+e9Kvt6xJrs5Wz7yM/Zi/Z1JU
 0yJyYBBgnb0J0nb49xRCVxenam1JaJ5Ie5h3KJ9lQYUMfv2fmL0Uqog77/JERoACTI/CwN
 GA0L3J1lCs5HSKPjqMgj0Kp6t3H/ThM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-NvAC2yxUMS2gXJpkJ8iKoQ-1; Thu, 16 May 2024 05:14:46 -0400
X-MC-Unique: NvAC2yxUMS2gXJpkJ8iKoQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5236c5cec7dso2750508e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 02:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715850885; x=1716455685;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JBxeryWPfBVD++JUygHdXmOw5xa/3cbkfQlX1iZhB5A=;
 b=fFbk9WyRsPaz1t5NqnSezmFQgxgv3YJnRxMDZtfv/6Mi8r+ziU32wGMIypEGFx0ZU1
 ZWYQudSqNIhCvjZlyIOMoEOPvQ+sQ9C9HDbpXNXv90ndnOrCor1bDLgJUPSL3HzvzeFF
 fAC3OPJp8dilcVSQz4hebg3G9SxScNxJ9YlD8JdP62vsx47tRk52qd/QWSIr2uVfD7Tm
 742iWPmfmJiOHlwpdYQ+UzPzgwkN3cWaIsIvpOS3MIsqc+RNmLEtgCrLfRwREdxGGWtv
 bYql1DoyVh/sP7CIL1hwYGM2sYaB1l5MBh/8dQAHtc9SO8nBuisU359F6dopkT/TJ/zh
 TO3Q==
X-Gm-Message-State: AOJu0YwqKdZXbQdWpToE/Qq2ePEnMt6YS2jd+ucbqFS+BVpNtIZlIQax
 z/qWZyLfbCfNZ7qQwn5MWwxQj8Mq/2zXiVMahyEQKMc46l7tPvGe8uU3xtaN13qySYYpekrx3MR
 zq9vNpIjcYmS8zXlYSwnYpC6lkUboPM+I5dq1OXvIde1OumZS9tDp2SzARHiM8lOhDg==
X-Received: by 2002:a05:6512:3d8d:b0:51d:9ae:87e with SMTP id
 2adb3069b0e04-5221016b565mr20999297e87.46.1715850885348; 
 Thu, 16 May 2024 02:14:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+nh4yoxe6tGMU4L8FLnOz2vKWDDuqTouCpAuxfG4Hv8aKDcVkWd1yEDXKwfISJJHs7B9ZbA==
X-Received: by 2002:a05:6512:3d8d:b0:51d:9ae:87e with SMTP id
 2adb3069b0e04-5221016b565mr20999268e87.46.1715850884908; 
 Thu, 16 May 2024 02:14:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbfecsm18435580f8f.105.2024.05.16.02.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 02:14:44 -0700 (PDT)
Message-ID: <586b7d06-10ed-407e-9c2d-70be2655462e@redhat.com>
Date: Thu, 16 May 2024 11:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] drm/mgag200: Refactor DDC code
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240513125620.6337-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240513125620.6337-1-tzimmermann@suse.de>
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

Thanks for this refactor of mgag200.

for the whole series:

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

On 13/05/2024 14:51, Thomas Zimmermann wrote:
> Clean up a the driver's DDC code, make it simpler, more robust, and
> mostly self contained. The patches in this patchset have previously
> been sent as part of rev 1 of [1].
> 
> Patches 1 and 2 fix long-standing problems in the DDC code.
> 
> Patches 3 to 9 refactor the DDC code. The code then keeps its data
> structures internal, acquires locks automatically and is much more
> readable overall.
> 
> Patch 10 replaces driver code with an equivalent helper.
> 
> Tested on various Matrox hardware.
> 
> [1] https://patchwork.freedesktop.org/series/131977/
> 
> Thomas Zimmermann (10):
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
> 
>   drivers/gpu/drm/mgag200/Makefile          |   2 +-
>   drivers/gpu/drm/mgag200/mgag200_ddc.c     | 179 ++++++++++++++++++++++
>   drivers/gpu/drm/mgag200/mgag200_ddc.h     |  11 ++
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |  18 +--
>   drivers/gpu/drm/mgag200/mgag200_g200.c    |  11 +-
>   drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  11 +-
>   drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  11 +-
>   drivers/gpu/drm/mgag200/mgag200_g200er.c  |  11 +-
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  11 +-
>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  11 +-
>   drivers/gpu/drm/mgag200/mgag200_g200se.c  |  11 +-
>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  11 +-
>   drivers/gpu/drm/mgag200/mgag200_i2c.c     | 129 ----------------
>   drivers/gpu/drm/mgag200/mgag200_mode.c    |  27 +---
>   14 files changed, 241 insertions(+), 213 deletions(-)
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_ddc.c
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_ddc.h
>   delete mode 100644 drivers/gpu/drm/mgag200/mgag200_i2c.c
> 

