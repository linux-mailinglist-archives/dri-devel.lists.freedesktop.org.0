Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB027AE6D3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 09:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC0D10E0BB;
	Tue, 26 Sep 2023 07:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3822710E0BB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 07:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695713319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ls6PSsHdBNdEQ1rIvM2+ND0qd/WCmo++L5VQ5y9lhhE=;
 b=FD5OXJqhi53S3pqr0ATAb05+eLxdHTuCUBe8iIz48Re0NeYorKI6KwleBPCP7WHByzrCLM
 HZdloTzpAdE9UhjzJfFmv+sy7HLdfnKVLNh/EzykSUFElrqtOPhJZ5zzn1jUGYvoPac/MQ
 MXj2Pwei/hwKU8cMCT4Izbs1EMR6ntw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-ou-nARaHMlq5d7cdlCRM6Q-1; Tue, 26 Sep 2023 03:28:37 -0400
X-MC-Unique: ou-nARaHMlq5d7cdlCRM6Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fbdf341934so75031585e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 00:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695713316; x=1696318116;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ls6PSsHdBNdEQ1rIvM2+ND0qd/WCmo++L5VQ5y9lhhE=;
 b=G9akUlqCJE7yzZsFI3SONaKmph9yWLpg5PT8wsr2GHMc6A2hVMDUZoamM166fTuaqN
 joOShfFdv4viicnkTtiB7sOw83nBBpqyC2W9D/gGrLN6MalvpxbgJXmZ+QlU1FCGoYL4
 9JFgD91dBzDsqkY8OR3rMiQxDOoAZ3No5LJeRc4nP46dW8g5A473ApeguLraVTfhXfTL
 c/A7wNof0p9tGSJm0FClmTB09UCmP+hNWNv7x8PNBfkwwyoK0cV41o+zTezmdzz3QVyq
 BTqONu0ZYaagMo2tJplwGu4OhF9Krc+oMR5O/aHKDQrvMU52y/zNSSma00eWv3JkoPvD
 it5Q==
X-Gm-Message-State: AOJu0YyNy66QpYAXtxEn7Kt4JpsE/9XpK6FbKd/xv2dJC56SwJ4YEUUD
 Q+MjljhabCR5ND2YVPtjyjMBPlvgjbZ+EZpXtjoFRgDaQm9s/8HwvvbxlrxQ5Wueg3jw/mBjlI+
 9Vt2w3eOJW0sv57CcI54Y9uFWWhSq
X-Received: by 2002:a05:600c:b52:b0:405:48ba:9c with SMTP id
 k18-20020a05600c0b5200b0040548ba009cmr7519296wmr.16.1695713316675; 
 Tue, 26 Sep 2023 00:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFE86vzq+bye/YH1Hs8wN2S2E/nc3imZzVLa1ilBnTpn71+loADM1Ii0GOiQ3GywpdH/Eflw==
X-Received: by 2002:a05:600c:b52:b0:405:48ba:9c with SMTP id
 k18-20020a05600c0b5200b0040548ba009cmr7519278wmr.16.1695713316317; 
 Tue, 26 Sep 2023 00:28:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c00c900b003fff96bb62csm14200274wmm.16.2023.09.26.00.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 00:28:35 -0700 (PDT)
Message-ID: <17b62961-6ed5-08cc-5881-4af109d09c33@redhat.com>
Date: Tue, 26 Sep 2023 09:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/5] drm: Reuse temporary memory for format conversion
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
References: <20230920142535.19321-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230920142535.19321-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/09/2023 16:24, Thomas Zimmermann wrote:
> DRM's format-conversion helpers require temporary memory. Pass the
> buffer from the caller and keep it allocated over several calls. Allow
> the caller to preallocate the buffer memory.
> 
> The motivation for this patchset is the recent work on a DRM panic
> handler. The panic handler requires format conversion to display an
> error to the screen. But allocating memory during kernel panics is
> fragile. The changes in this patchset enable the DRM panic handler to
> preallocate buffer storage before the panic occurs.
> 
> As an additonal benefit, drivers can now keep the temporary storage
> across multiple display updates. Avoiding memory allocation reduces
> the CPU overhead of the format helpers.
> 
> Patch 1 adds struct drm_xfrm_buf, a simple interface to pass around
> the buffer storage. Patch 2 moves the memory management from the format
> helpers into their callers. Drivers release the temporary storage at
> the end of their display-update functions.
> 
> Patches 3 to 8 update three drivers to keep the allocated memory for
> all of a device's lifetime. Managed cleanup releases the buffer as part
> of releaseing the device. As additional benefit, buffer allocation now
> happens in atomic_check helpers. The driver thus detects OOM errors
> before the display update begins.

Thanks for the patches.
I'm still experimenting with drm_panic, and it's not clear if it will 
use that or not yet.
But it's already useful for other drivers, avoiding alloc/free for each 
frame, is a good thing.


Best regards,

-- 

Jocelyn


> 
> Tested with simpledrm.
> 
> v2:
> 	* reserve storage during probing in the drivers
> 
> Thomas Zimmermann (5):
>    drm/format-helper: Add struct drm_xfrm_buf to cache format conversion
>    drm/format-helper: Pass xfrm buffer to format-conversion helpers
>    drm/simpledrm: Store xfrm buffer in device instance
>    drm/ofdrm: Store xfrm buffer in device instance
>    drm/ssd130x: Store xfrm buffer in device instance
> 
>   drivers/gpu/drm/drm_format_helper.c           | 204 +++++++++++++-----
>   drivers/gpu/drm/drm_mipi_dbi.c                |   7 +-
>   drivers/gpu/drm/gud/gud_pipe.c                |  21 +-
>   drivers/gpu/drm/solomon/ssd130x.c             |  16 +-
>   drivers/gpu/drm/solomon/ssd130x.h             |   3 +
>   .../gpu/drm/tests/drm_format_helper_test.c    |  33 +--
>   drivers/gpu/drm/tiny/cirrus.c                 |   5 +-
>   drivers/gpu/drm/tiny/ofdrm.c                  |  11 +-
>   drivers/gpu/drm/tiny/repaper.c                |   5 +-
>   drivers/gpu/drm/tiny/simpledrm.c              |  11 +-
>   drivers/gpu/drm/tiny/st7586.c                 |   5 +-
>   include/drm/drm_format_helper.h               |  74 +++++--
>   12 files changed, 300 insertions(+), 95 deletions(-)
> 

