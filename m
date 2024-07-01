Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ADB91EAEB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 00:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6910A10E105;
	Mon,  1 Jul 2024 22:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Yow9xmoe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEB010E02C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 22:43:36 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-74840cb804dso989217a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 15:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719873816; x=1720478616;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6kb3VE7l9Ll62GtOzGVar50YYVzbrCt7/ngwYHtcsHo=;
 b=Yow9xmoeQfFLFPrdZrnivHerCRUC5MdFVVRkvllMI4BJHgV8NiSxzr8H4wen05a0OO
 UospSThdpRR4Oy1CfmmEID4OpuviclhlfCgu8Zqf6AEdVLjnVUWcurzzLEAHtQvKsHv1
 xFNV0R5tknbrFA86lbuvAQPaY9ODJj1KueZvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719873816; x=1720478616;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6kb3VE7l9Ll62GtOzGVar50YYVzbrCt7/ngwYHtcsHo=;
 b=by/TT6beL/CcafMVkMAWww1JfQ28K0PDkw5a9oB/8QURN7GibeE7CUQT73DDVXRydO
 HA6cfeDwbvKg8APGSUo3arFlJtLDJ1327dLlThumqZcfm/0R1krGGAbKDCK+4+1FQZGl
 XFr2Mnb+4momxYo9HLlXmHS4GjC3GafLoYjDeZ5rpOA8b1TBILgvSiFF81MRO0vi8dbE
 YqeECj+Kzk7wIeKCgeP9rxBdxcTRmTY88Whr//MfHPvf6jYKSQwRCBeDrxeg3jP+2V1e
 zqHyCKrvPUyTi1wwbKKRHHuqGKFh+gxw6uN9JlapbxZADHB6Mqr8g/DMLlVMRFttht20
 duOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV80ScLuWBq5EGWnRHuFe6rjd1IxW5JSI4VS4mPIGPnWo8+qckSGEUwjHqQwBHGgZXt5ZkACqd6/AoL7TaSOKVmah4xjyQctOjhhWYxDway
X-Gm-Message-State: AOJu0YwYYcI7c5Mwm8FxoRrqfkGLjhVMgmeCsO1CUqaWrWY3WJ12eFhe
 ha7lhuRMw8VOpiRuLAhKG6OQSiRXF376dtJQ7teoNJz3K2SCUeKGHlfE1/wfEg==
X-Google-Smtp-Source: AGHT+IG8lD9cDd11H++aroIVkoft7tDoeKQX/8vKZUC8nw8VhaUkuLmwwKKVsyRwrDHew5HBbMnK+Q==
X-Received: by 2002:a05:6a20:729b:b0:1be:e966:b326 with SMTP id
 adf61e73a8af0-1bef60ef542mr10554590637.11.1719873815822; 
 Mon, 01 Jul 2024 15:43:35 -0700 (PDT)
Received: from [10.211.41.59] ([66.170.99.2]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70804893e4bsm7065609b3a.184.2024.07.01.15.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 15:43:35 -0700 (PDT)
Message-ID: <8ca5b424-0e26-40bb-8258-d8d8729c8ad5@broadcom.com>
Date: Mon, 1 Jul 2024 15:43:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Fix various buffer mapping/import issues
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com
References: <20240628200729.754669-1-zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20240628200729.754669-1-zack.rusin@broadcom.com>
Content-Type: text/plain; charset=UTF-8
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

On 6/28/24 13:07, Zack Rusin wrote:
> This small series fixes all known prime/dumb_buffer/buffer dirty
> tracking issues. Fixing of dumb-buffers turned out to be a lot more
> complex than I wanted it to be. There's not much that can be done
> there because the driver has to support old userspace (our Xorg driver
> expects those to not be gem buffers and special cases a bunch of
> functionality) and new userspace (which expects the handles to be
> gem buffers, at least to issue GEM_CLOSE).
> 
> The third patch deals with it by making the objects returned from
> dumb-buffers both (raw buffers and surfaces referenced by the same
> handle), which always works and doesn't require any changes in userspace.
> 
> This fixes the known KDE (KWin's) buffer rendering issues.
> 
> v2: Fix compute_crc in the second patch, as spotted by Martin
> 
> Zack Rusin (4):
>   drm/vmwgfx: Fix a deadlock in dma buf fence polling
>   drm/vmwgfx: Make sure the screen surface is ref counted
>   drm/vmwgfx: Fix handling of dumb buffers
>   drm/vmwgfx: Add basic support for external buffers
> 
>  drivers/gpu/drm/vmwgfx/vmw_surface_cache.h |  10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 127 +++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h         |  15 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  40 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c      |  26 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c        |  62 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        | 453 +++++++--------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h        |  17 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c        |  14 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_prime.c      |  32 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   |  27 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  33 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       | 145 +++----
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    | 277 ++++++++++++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c       |  40 +-
>  15 files changed, 788 insertions(+), 530 deletions(-)
> 


For the series - LGTM!

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

Thanks,

Maaz Mombasawala <maaz.mombasawala@broadcom.com>
