Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940939A56E4
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 23:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B150710E0CD;
	Sun, 20 Oct 2024 21:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yxs411y4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B36410E0CD
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 21:00:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43168d9c6c9so15975925e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 14:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729458039; x=1730062839; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=AfaZsxjx1eEbQ4aXtXLbm+xDM8h/VV7tjIdpqTOLbyU=;
 b=Yxs411y4X5fLIA+K2vnsREJgAEPVAAzLWSZwYeaZ1QaWEkZyC8Oc4L9Pm8GTC2tqpe
 Oj0xm+9zF/2/KclhuML3THaJyqbFydpXKW7uGgcaaUmfNP/Crus6jYKQQvaORG4X77aa
 cqvQ5cHfqZPHU4kb3bBsS+aRI8errWXxhwyBtqRFMfUNP/iMFGbtcW4wJWj7A55APTrB
 IMrfFyVZVepcG50ceo9sRWANhSQH0UcFtAOAAztMjRlcE3a+K3iFlRiccSX5jAKi8Jom
 gQNlVs2ztvyNeD+zh9/lxkjBQVrGYMMi8HjrhbEVlaPPS1rbVyZ/TMUP50/rsE9DyrGo
 FzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729458039; x=1730062839;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AfaZsxjx1eEbQ4aXtXLbm+xDM8h/VV7tjIdpqTOLbyU=;
 b=Sy4SSDRg97w4bAE9OoAWQJcHmivNKCZp69faLz4mlKNAR7aDGMP59zsFKv3GKM68+D
 seWEYYxVrfcXFGYOjcuMDYHTCG9SNd1uHkDqHWleHZgoLzJYHkegbNqZCNjT/svtNihe
 lTG9xGtchTdxw/bcQ5ED34y6+CyPmJeNSEdNxhzEOUliMd+jmMdwWPYF/JX0TE4ixI4S
 a1jIo1Iar05PU5K4DPUMNjzGMCCeFh4va1j+ln7v2sgH81Zc7QGBgQjDVE8DglMq2fkM
 Gzjyh229QAn/lR3Qz78/MwbNTmRm9U5JzFZx2NDfxRUb2tdOYGychsnn2M9BMkvUckyE
 Z1sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7B0+iqPQyRu1Iu1J+og5en05bf7N7AnGAaXaeg2zty5TiByKxlPnSI3TISIlwg1ZdgCuIEubSi+g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYayTN3PeLm3dKM7MvRgXDU9G33hjhNFSLs5hEsZSQbvVDfdx3
 KDXjGfw5UwxNCye+kJ1oB2cKAi17k/TMyKW03dsPzfKjcRzEdXsr
X-Google-Smtp-Source: AGHT+IG2FgclGyKasPn5avTRhxnlRqd1sHe7RqYoIW1G0MUwADKCXVnNI0Dp/1yCXyjuGFnX5Mt0xA==
X-Received: by 2002:adf:eacb:0:b0:37d:4e56:9a2a with SMTP id
 ffacd0b85a97d-37eb47694ccmr5663303f8f.40.1729458038598; 
 Sun, 20 Oct 2024 14:00:38 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a0e7:4900:69cf:703d:64c1:c14e?
 (dynamic-2a02-3100-a0e7-4900-69cf-703d-64c1-c14e.310.pool.telefonica.de.
 [2a02:3100:a0e7:4900:69cf:703d:64c1:c14e])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c725d1sm1250809a12.84.2024.10.20.14.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Oct 2024 14:00:38 -0700 (PDT)
Message-ID: <b8cf17b4-54db-4439-a8f6-43b6c5d91ae8@gmail.com>
Date: Sun, 20 Oct 2024 23:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm: Series with core improvements/refactorings
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
 <vpzkrywd4fysjtiqtd64hbe2oscb4vr3dimj6vwp4lvp5ghykf@6r2fq7dx5ha2>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <vpzkrywd4fysjtiqtd64hbe2oscb4vr3dimj6vwp4lvp5ghykf@6r2fq7dx5ha2>
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

On 19.10.2024 17:18, Dmitry Baryshkov wrote:
> On Sun, Sep 08, 2024 at 02:04:45PM +0200, Heiner Kallweit wrote:
>> Series with DRM core improvements/refactorings.
>>
>> Heiner Kallweit (6):
>>   drm/sysfs: Remove version attribute
>>   drm/sysfs: Drop unused drm_class_device_(un)register
>>   drm: Refactor drm_core_init error path
>>   drm: Change drm_class from pointer to const struct class
>>   drm: Add __init annotations
>>   drm/sysfs: Remove device type drm_minor
>>
>>  drivers/accel/drm_accel.c                |  2 +-
>>  drivers/gpu/drm/drm_cache.c              |  2 +-
>>  drivers/gpu/drm/drm_connector.c          |  2 +-
>>  drivers/gpu/drm/drm_drv.c                | 18 +++--
>>  drivers/gpu/drm/drm_internal.h           |  2 +-
>>  drivers/gpu/drm/drm_panic.c              |  4 +-
>>  drivers/gpu/drm/drm_privacy_screen.c     |  2 +-
>>  drivers/gpu/drm/drm_privacy_screen_x86.c |  2 +-
>>  drivers/gpu/drm/drm_sysfs.c              | 89 +++++-------------------
>>  include/drm/drm_sysfs.h                  |  3 -
>>  10 files changed, 39 insertions(+), 87 deletions(-)
> 
> Heiner, any chance of a respin? I think most of the cleanups were good,
> needing just minor polishing.
> 
In the last weeks I was working on networking, and now started to rework
the series. I think I can submit a v2 the week after.
