Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BA89248A2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 21:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056C210E67D;
	Tue,  2 Jul 2024 19:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="HL6IuNUq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D772110E67B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 19:54:04 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7066c799382so3953303b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 12:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719950044; x=1720554844;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WKspYi5W/ZdswDO7XlK4270UE9lyALCffo6kcOXsMuM=;
 b=HL6IuNUqAi7Ku0MduXO/5mCNCidLCXmJJ62RIajhNd6jMmZQ3+HabJtALvhNn7F9K1
 UHcEcBCZrrXBdNvj4yWWmjWz76rXXJ2F2E6JqyXsbxYHhqlh0szShE9cyoX6The+Fgsm
 LBVZwvTyuPtt0HqDcrWaO2Bwx6gM+N5JDb5Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719950044; x=1720554844;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WKspYi5W/ZdswDO7XlK4270UE9lyALCffo6kcOXsMuM=;
 b=sDm4XAkkFFoV8BbgPAertRzpmi0HTbAaXIUCNLEZQSMaKfHY0k2GsdIKpsBZFUnJEX
 +8KX5Q378D4EXSObL9gBLmJ1qlXPmSeYhamaV86fMHFrxnLCi0vmH/+2rryct/fZtMuQ
 u+LZ9EvoKaSJdv8JRjonmhkzf0v26R+noAbaMqgHzIOAdfd+uSJYW7Kni40uabJSFCp/
 JiCHhBUXfAJWJY9Rct6rkoh0nC1j6IVlzwMx19WqtSKHCzMF72FoceqDBdka/4/bqhmw
 wqGIT6+TTvuAHpUUZscs76MbB9xWiOESl/AdqylhUEJn5PfNU1XcTPl5t8hki+OVGyQ0
 +kGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMQJfxFoZgXQe602vjvOsZZa8U2W8jXITJ//nmvaMsbt9g3l3lyQrQNtKrFTblldtCDTHZRq+krQjXadc1JEXeZ2v2R/IaAd03WYtEIIoz
X-Gm-Message-State: AOJu0YzcyET++vSHKeGVz1xKl4pcR681zHS9gYfwP6Z9yrdLu8/+kOYx
 +i0MfrlXkxSeLMSpas7oKO4b7opEBFaC3OiUgPNrmx3c36Zi/H/OrLNz6TEnIQ==
X-Google-Smtp-Source: AGHT+IGr/ywyT1fL7IAiEfXuWrCa+C4TqGVSeEaEa1XLC/EhciWvQBg4NvyGFbfPDSRrWFyUziw1Gw==
X-Received: by 2002:a05:6a00:2e93:b0:707:f9eb:34fc with SMTP id
 d2e1a72fcca58-70aaaf39f9amr11851669b3a.29.1719950043989; 
 Tue, 02 Jul 2024 12:54:03 -0700 (PDT)
Received: from [10.211.41.59] ([66.170.99.2]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7080246e1d9sm8951553b3a.71.2024.07.02.12.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 12:54:03 -0700 (PDT)
Message-ID: <340cb22d-464d-42d3-aebd-fe97878323b9@broadcom.com>
Date: Tue, 2 Jul 2024 12:54:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Fix various buffer mapping/import issues
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com
References: <20240702021254.1610188-1-zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20240702021254.1610188-1-zack.rusin@broadcom.com>
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

On 7/1/24 19:11, Zack Rusin wrote:
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
> v3: Simplify the first change which fixes the deadlock in the dma-buf
> fence polling
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
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c      |  17 +-
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
>  15 files changed, 775 insertions(+), 534 deletions(-)
> 

For the series - LGTM!

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

Thanks,

Maaz Mombasawala <maaz.mombasawala@broadcom.com>
