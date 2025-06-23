Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFB7AE3835
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 10:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB11B10E1D1;
	Mon, 23 Jun 2025 08:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gFrhyEAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5858910E1D1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750666677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2optOidOvuh7QFbVIaP7zX4TDef2ae6cy4KvRW9fls=;
 b=gFrhyEAWqyufkSFsDNZE3lBj5LG2IscfCKCR/PaVuT5LFOpA9E9T7yImDRkQt9KWtkKbS8
 Cx20MiSMUuV/VX1Fj0nRGgzJYno7dyTkSBjEj/9Ccnys7zMtrdmxk+9s2y66AoUb5aZrWQ
 mqy/aAjTnP8myHtZ9DF4hWiCz6dfetQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-ACZ9DvojOD6gzRtQFPLOBQ-1; Mon, 23 Jun 2025 04:17:55 -0400
X-MC-Unique: ACZ9DvojOD6gzRtQFPLOBQ-1
X-Mimecast-MFC-AGG-ID: ACZ9DvojOD6gzRtQFPLOBQ_1750666675
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-60724177a1fso3539816a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 01:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750666675; x=1751271475;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N2optOidOvuh7QFbVIaP7zX4TDef2ae6cy4KvRW9fls=;
 b=qnPnRMyNbDs88mg4qDlt0FBh12tDWq31yVWobgw7RjuW1LMvoM2VZbSpCqqQatUvQz
 yFmQBOXZy26D1o5WiIKXM2g9wf8eYnMFCDzwjBMfTbRCsnkALF2QN3i9g+kTBMpdo7r8
 zHNsyJD/sC5n+WyAExJ0PkRyaKb6bJiARlONY0/+WDsof3PFztID+FBAJk10L/lf0zZX
 r6U9KBKTx4/60TU6SdTT1LUj8EsDqpjTldL0VOqNqXP2N2qqK7BECzdMX581w6y4/CM4
 aX2Sm6hpKs3h2zu7RIAYyGii84fPaiOrFTy7Bv/LseUjVBpi+fZ729n1CW/a35Eu5as+
 Jegg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvNGZ8mh9xzlQ2/FKBLGjOhDoMseOzxhdgX2nr3azvvTI2k3cEKc1fMq2j+BBdKpYYgMcZJgy4VcY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAyCdgaTxLU0cagaApdet1txTaSznAy0DCuzZj/t6ienShIzow
 pcpflRruOnGGz1siT40tqbczKUF8LF30AXSdx45oOyQeZ7du5vJ5WCdKUWWgA5CxdhLXUAFyuiE
 jdivxZ2KldwdcfMPk1Ii5YuO2mtLq8TVCMBxMWvCwnxXYwJY9P6c1R+LB/sTguV3y5uoZIg==
X-Gm-Gg: ASbGncvgQizT6PNo08rKwxEJIDLTU6OT4If/ND/dLjqMR8dqkMyUg0F7KZQA23ZyBkP
 venJR8txxSQ/qy1X/4T094gIwZzf2ePAIEH9wYK3SEcWw5eYCY+HZ7AUjHJbdpKHpcfLd5Q9ZPj
 /iAeAtSHyZjPdN8JvIrIP1exMo+BuRRRfCJAoynaOxpzhzUOtf+VZenO3IuCjcHOdee8OcWDF74
 6pq23mbeOa2LxP12Kxmz324zW1+zRsdIm3wdTcqtrXpkW+zwqllmY0cS3MIkQ6+IpXexH3b2yPH
 cn0976znWy1b3STxvSBHzIFO2w==
X-Received: by 2002:a05:6402:44cb:b0:60b:8603:2ff8 with SMTP id
 4fb4d7f45d1cf-60b86033002mr6272824a12.15.1750666674665; 
 Mon, 23 Jun 2025 01:17:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNNF8jZCqYgheFCScBSFPj8i52Q5VHppO0D3a8RZj2iDP7EeavHZjc6mZHpik98x9jOB3QBQ==
X-Received: by 2002:a05:6402:44cb:b0:60b:8603:2ff8 with SMTP id
 4fb4d7f45d1cf-60b86033002mr6272816a12.15.1750666674268; 
 Mon, 23 Jun 2025 01:17:54 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60a18514500sm5761336a12.5.2025.06.23.01.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 01:17:53 -0700 (PDT)
Message-ID: <bc831f09-08d2-41d6-b552-ede43f8f2be2@redhat.com>
Date: Mon, 23 Jun 2025 10:17:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Add interconnent support for simpledrm/simplefb
To: Luca Weiss <luca.weiss@fairphone.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M_8mmQf3Ag93MOmSlGOLC5kG9llYpg9wg9yPrrs2pZ8_1750666675
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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

Hi,

On 23-Jun-25 08:44, Luca Weiss wrote:
> Some devices might require keeping an interconnect path alive so that
> the framebuffer continues working. Add support for that by setting the
> bandwidth requirements appropriately for all provided interconnect
> paths.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v2:
> - Sort the headers before adding the new interconnect header, in
>   separate commits.
> - Use the correct #if guards for new interconnect code
> - Pick up tags
> - Link to v1: https://lore.kernel.org/r/20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

for the series.

Regards,

Hans


> 
> ---
> Luca Weiss (5):
>       dt-bindings: display: simple-framebuffer: Add interconnects property
>       drm/sysfb: simpledrm: Sort headers correctly
>       drm/sysfb: simpledrm: Add support for interconnect paths
>       fbdev/simplefb: Sort headers correctly
>       fbdev/simplefb: Add support for interconnect paths
> 
>  .../bindings/display/simple-framebuffer.yaml       |  3 +
>  drivers/gpu/drm/sysfb/simpledrm.c                  | 85 ++++++++++++++++++++-
>  drivers/video/fbdev/simplefb.c                     | 89 +++++++++++++++++++++-
>  3 files changed, 173 insertions(+), 4 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250617-simple-drm-fb-icc-89461c559913
> 
> Best regards,

