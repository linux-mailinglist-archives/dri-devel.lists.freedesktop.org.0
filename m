Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD9885A0B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 14:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B309D10E10A;
	Thu, 21 Mar 2024 13:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XhcP6i1J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD4410E10A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 13:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711028263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJn7im7DzH34Bv0RRUin/XoqVqMdfUe9vTIWi8h57hk=;
 b=XhcP6i1Jlc4Rr4OJ042kgcYMPF4q2b25gYhHpY9mDfdeL07RPGtiEZ6yYs28IZ67iKtu4a
 1GcqLgA8/48rjYJBpbKGcCM3mq8kUa4v7V86pS/XLmWpgb4s4AIz1xF+VCfSOxo4vREdZe
 JpYiV+skCVs26FwYpZwexrOf+oq5e+Q=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-e3w6ctgbN3m3eIryKnkyiQ-1; Thu, 21 Mar 2024 09:37:41 -0400
X-MC-Unique: e3w6ctgbN3m3eIryKnkyiQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2d59d0b6856so8775321fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 06:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711028260; x=1711633060;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VJn7im7DzH34Bv0RRUin/XoqVqMdfUe9vTIWi8h57hk=;
 b=S/9PmcGdQn1hXg5BgZ10FUP/fWhUzyzYJ/gvhvzNjRN62vI3PhVUYJjl39h6j+62d4
 INHA/10xbwLSrHxvXS4VN+wiQQt3qDz8kTFnj1BDwG+2hRMkMjPtjbUYA4vVq+vYKDrf
 W3yEMfmsNKiyVO7NovAfDducBCuGqiqviTDYcgzmqoTh0H4uuLsUKeFND3vQUvDK+VK8
 BWuSJeIWR5nQ6jHN+sxS6mWyKSEEUpXpUJUHc80gLrZKDAvWaTqo5jR0pBoN9nm12bKn
 UvjSLJ/No0xRDw3V1C//09GVD60/VsRIsK4DPPfaLKKfyWFoQd+x/9rjfzL6nK4F8sjn
 nrxA==
X-Gm-Message-State: AOJu0YxEnir4PLYg9VmiJl8lPKLYYpZLQPMKnbVnxNHDRncF7kymvUby
 d1yaQjAT+ZjMKbuFoTZ0GRSXnSzkguPM8x5xCpIs7IxllMwk/mL5q482vzIplHJOehkXs21GR2l
 N1wEEYdse3+fM8uPBe2X3vcyPSgZThoxwjr+yh/ZuPbGuhqrYD67SzmSpYWFTOHodyQ==
X-Received: by 2002:a2e:904e:0:b0:2d4:3635:b52d with SMTP id
 n14-20020a2e904e000000b002d43635b52dmr6303989ljg.0.1711028260358; 
 Thu, 21 Mar 2024 06:37:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5l7cGk+nmw+/TDlX1nMgc+pXogRMu0SKBUJbIaRl2iWcD3fUKxhTGlnP9o9m2kkWmz4UvZA==
X-Received: by 2002:a2e:904e:0:b0:2d4:3635:b52d with SMTP id
 n14-20020a2e904e000000b002d43635b52dmr6303981ljg.0.1711028259946; 
 Thu, 21 Mar 2024 06:37:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c138b00b00414610d9223sm5642012wmf.14.2024.03.21.06.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 06:37:39 -0700 (PDT)
Message-ID: <56b612aa-79f5-4d7d-8813-2f7111108927@redhat.com>
Date: Thu, 21 Mar 2024 14:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/13] drm/ast: Detect connector status for VGA and
 SIL164
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240320093738.6341-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240320093738.6341-1-tzimmermann@suse.de>
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

Hi,

Thanks for those patches, that's really a good enhancement to the ast 
driver, and fits well with the BMC virtual connector.


I've reviewed the whole series, and it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

On 20/03/2024 10:34, Thomas Zimmermann wrote:
> Detect the status of the VGA or SIL164 conenctor by polling the DDC
> channel. Update the status at runtime and flip the BMC status as well.
> 
> Patches 1 adds a missing include statement that will be required to
> make later patches compile.
> 
> Patches 2 and 3 simplify the VGA and SIL164 connectors, such that no
> additional data structure is required. These patches have been reviewed
> before as part of the series at [1].
> 
> Patches 4 to 10 improve the I2C code that is used to retrieve the
> monitor's EDID data. It's now fully managed, it acquires the necessary
> lock automatically and it is called DDC, which better represents its
> purpose than I2C.
> 
> Patches 11 to 13 finally implement polling. Patch 11 updates ast's
> EDID code to be up-to-date. The helper drm_connector_get_modes() reads
> the EDID via DDC and updates the property. No driver code is required.
> Patch 12 uses a similar pattern to detect the presence of the monitor
> and sets the connector status accordingly. As polling also needs to be
> cleaned up, patch 13 adds the necessary helpers to do so.
> 
> Tested on AST2500 hardware and BMC output. The BMC connector now also
> flips its status correctly at runtime.
> 
> [1] https://patchwork.freedesktop.org/series/104547/
> 
> v5:
> - share implementation in drm_connector_helper_detect_ctx() (Maxime)
> - test for DDC presence with drm_probe_ddc() (Maxime, Jani)
> - perform managed cleanup of poll thread
> 
> Thomas Zimmermann (13):
>    drm/ast: Include <linux/of.h> where necessary
>    drm/ast: Fail probing if DDC channel could not be initialized
>    drm/ast: Remove struct ast_{vga,sil165}_connector
>    drm/ast: Allocate instance of struct ast_i2c_chan with managed helpers
>    drm/ast: Move DDC code to ast_ddc.{c,h}
>    drm/ast: Rename struct ast_i2c_chan to struct ast_ddc
>    drm/ast: Pass AST device to ast_ddc_create()
>    drm/ast: Store AST device in struct ast_ddc
>    drm/ast: Rename struct i2c_algo_bit_data callbacks and their
>      parameters
>    drm/ast: Acquire I/O-register lock in DDC code
>    drm/ast: Use drm_connector_helper_get_modes()
>    drm/ast: Implement polling for VGA and SIL164 connectors
>    drm/ast: Automatically clean up poll helper
> 
>   drivers/gpu/drm/ast/Makefile                 |  10 +-
>   drivers/gpu/drm/ast/{ast_i2c.c => ast_ddc.c} | 120 +++++++++------
>   drivers/gpu/drm/ast/ast_ddc.h                |  20 +++
>   drivers/gpu/drm/ast/ast_drv.c                |   1 +
>   drivers/gpu/drm/ast/ast_drv.h                |  39 +----
>   drivers/gpu/drm/ast/ast_main.c               |   1 +
>   drivers/gpu/drm/ast/ast_mode.c               | 147 +++++--------------
>   drivers/gpu/drm/drm_probe_helper.c           |  56 +++++++
>   include/drm/drm_probe_helper.h               |   5 +
>   9 files changed, 206 insertions(+), 193 deletions(-)
>   rename drivers/gpu/drm/ast/{ast_i2c.c => ast_ddc.c} (54%)
>   create mode 100644 drivers/gpu/drm/ast/ast_ddc.h
> 

