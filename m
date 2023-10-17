Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302D27CC2BB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 14:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC2D10E2DC;
	Tue, 17 Oct 2023 12:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F88410E2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 12:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697544899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLslovx+N7L3zdpZneCHpqNvyLuPeVsMbXSiknOBvcQ=;
 b=aGiWpX3Qm7i1pFafLAv5W/ZdqlADeEcBQl1AntP8lhOL8//rE6AqsFkoKEaCjJ9inll09A
 LnmANnJ3TepuUz5I9IWAwXwO254HgvrF1dge/VXrq8J/WSpvqnZE4x0jNYGfmV/Vj0VhtF
 tqxezFikWxZEZwdtjG6DS31xGtS16CM=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-Szx0r-U5N4eoi1_9P3TPfg-1; Tue, 17 Oct 2023 08:14:53 -0400
X-MC-Unique: Szx0r-U5N4eoi1_9P3TPfg-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2c50c873604so36062621fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 05:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697544891; x=1698149691;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fLslovx+N7L3zdpZneCHpqNvyLuPeVsMbXSiknOBvcQ=;
 b=ohJ58InLOzDnlBxn8aFLuP/a2bc3CgyaVKkxmeVM72TKooZ6zhKUm/jkvW1gXcScsZ
 3mTFf0Lf4snAiKKURGdgQx3N2WjXIQX5I8i5Og6p1tMyD7ZDWg6anV7pS0V0GePXgnDh
 HwCmSeJeY/fUrdNOg6oQu8Frv81U4TGvvvjfOW/T0aipVxBnlS+7ZCyIOYg6bBJfZBp4
 zZmsCKEh44RwnIyuO8JFCKngH7RIEaPOfGCZ0Du2nXaEVz0P4+fD8YKM9bJZI8nv/aZ2
 yW3qHQtzdCAoecI87sFplX8UKyROoHwUOaP0Shv5qMLgLBtPuS22JObvNAqylaIOe8xp
 bPZg==
X-Gm-Message-State: AOJu0YyKSEZA86CFTvl8ydwm+9NYJoiD5lqJ4yAidT9nEi++ZY/caA1z
 xu8bk4GbxFMn85p7tJgDLoS6FgmRl6hbkghJIhBkAdeLJU6YeRGqIYyOjdu5z6puE8GD0UH/lkx
 RHTeQlm2z/diIXSlh+7PthQfBrJSM
X-Received: by 2002:a2e:be8d:0:b0:2c5:ee7:b322 with SMTP id
 a13-20020a2ebe8d000000b002c50ee7b322mr2101452ljr.18.1697544891664; 
 Tue, 17 Oct 2023 05:14:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWLRjL6l6PXYbraXE3Iir1JoY0E2eF21fggd0kib67SFCq6uMYHtDqJqK/m4mmTjsLPAUcTg==
X-Received: by 2002:a2e:be8d:0:b0:2c5:ee7:b322 with SMTP id
 a13-20020a2ebe8d000000b002c50ee7b322mr2101439ljr.18.1697544891359; 
 Tue, 17 Oct 2023 05:14:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c469100b00401e32b25adsm1768920wmo.4.2023.10.17.05.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 05:14:50 -0700 (PDT)
Message-ID: <caf653f3-d8af-4c27-af42-7847dc3adb21@redhat.com>
Date: Tue, 17 Oct 2023 14:14:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] drm/ast: Align VGA register names with documentation
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231017083653.10063-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20231017083653.10063-1-tzimmermann@suse.de>
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

On 17/10/2023 10:31, Thomas Zimmermann wrote:
> Update the names of ast's VGA registers to follow the documentation
> and put all constants into a separate header. The update make the
> driver source code more grep-able. No functional changes.

I think the previous name is more meaningful than the one from the 
documentation. But I agree it's better to match the documentation.

For the whole series:

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn


> 
> Thomas Zimmermann (12):
>    drm/ast: Rename AST_IO_AR_PORT_WRITE to AST_IO_VGAARI_W
>    drm/ast: Rename AST_IO_MISC_PORT_WRITE to AST_IO_VGAMR_W
>    drm/ast: Rename AST_IO_VGA_ENABLE_PORT to AST_IO_VGAER
>    drm/ast: Rename AST_IO_SEQ_PORT to AST_IO_VGASRI
>    drm/ast: Rename AST_IO_DAC_INDEX_READ to AST_IO_VGADRR
>    drm/ast: Rename AST_IO_DAC_INDEX_WRITE to AST_IO_VGADWR
>    drm/ast: Rename AST_IO_DAC_DATA to AST_IO_VGAPDR
>    drm/ast: Rename AST_IO_GR_PORT to AST_IO_VGAGRI
>    drm/ast: Rename AST_IO_CRTC_PORT to AST_IO_VGACRI
>    drm/ast: Rename AST_IO_INPUT_STATUS1_READ to AST_IO_VGAIR1_R
>    drm/ast: Rename AST_IO_MISC_PORT_READ to AST_IO_VGAMR_R
>    drm/ast: Move register constants to ast_reg.h
> 
>   drivers/gpu/drm/ast/ast_dp.c    |  70 +++++------
>   drivers/gpu/drm/ast/ast_dp501.c |  38 +++---
>   drivers/gpu/drm/ast/ast_drv.h   |  83 +------------
>   drivers/gpu/drm/ast/ast_i2c.c   |  20 ++--
>   drivers/gpu/drm/ast/ast_main.c  |  24 ++--
>   drivers/gpu/drm/ast/ast_mm.c    |   4 +-
>   drivers/gpu/drm/ast/ast_mode.c  | 200 ++++++++++++++++----------------
>   drivers/gpu/drm/ast/ast_post.c  |  26 ++---
>   drivers/gpu/drm/ast/ast_reg.h   |  99 ++++++++++++++++
>   9 files changed, 292 insertions(+), 272 deletions(-)
>   create mode 100644 drivers/gpu/drm/ast/ast_reg.h
> 

