Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACBBBECFD0
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 14:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A2B10E1E5;
	Sat, 18 Oct 2025 12:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QPg4OU6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9B810E1E5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 12:49:30 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so27453835e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 05:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760791769; x=1761396569; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BVsHNru5NLHi/zbAVLbblzv/GOgnRaHcf6YnsrPJO/0=;
 b=QPg4OU6xwecXzoQzR6dubxSKWO6QI8j4SnoBa5P7HZjlvnuEY45v1i6G3x/kTUWDLu
 deQNd7UztDvP/X5qUZrKjaNEYqIl9SZfPFEpNF99c/483zJETGokMhOKa5e+91mOcKQk
 caou9x6TuuGSaU5XWaC3dvMkWLRHVRLYAQdAFSLIn0z9D+ctevF7VQYWTMuTyfZWYylf
 +QsQdfYbF2wtKLhFhsXgGDSoXYaWMd1II+WRx/dvztj5UwqtLhUr8olBr4J8RzokPW3Q
 jPI4vIcJo/emylyIEkywt1lumRBaAry9zVr7rn5MPBhwN4Rb2ZFQpgNZOlWIhkZu41hT
 3oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760791769; x=1761396569;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BVsHNru5NLHi/zbAVLbblzv/GOgnRaHcf6YnsrPJO/0=;
 b=ujxy11+2jApAovBmTxjN3QalQw+t4DGoJfAuStUiWlwGQsu4FxLXwXBvOjdTLA9n/g
 EHt2oc7ULTOMrmAS5MBkTwA0pRlTS1/wNdtCsgdYvQnQAwufm52DJcn3rIgkQ1Eqn+H0
 GfFFhYJENMlHc9T6BZAe1qoeV/I9LayI2+r91/YZbpdytd/ojd4uWFji9Ls6bIXyjJJe
 0K+ja+x9V3izQexjUFmKVxJrZLU7GlM2MPArR24h45dfDnlgzFrlxTvUwvVlut6VSecO
 1AtcNkS8GHQqH033RFbTWufJ/rzLzxfMfVke2pc1M8SV2/9S+mi+AkbsrDPyncf8XvZ3
 ORbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX2N0dWMeS8Pzcv4wNjAOrIBpQaKsMn/1E5yUJabQRmL/ioYqhFwj/TcSaSqXWe6NSxjxBLLnxfO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS88FiicwzAcAEv/LfBzRdtqFzCDfrnyAna6shGDHirfh1q2Kl
 xIjm0XoMPP6gmWcjXnohfnNc7PKJ/FwMM3T+pl6GyS87DbOTLInPArqf
X-Gm-Gg: ASbGncuJJfpAS3Guc02FFYGyGtNKZDwSP5CmYVYCpCxhQhPOLugI1xpbTG/BYot/GWE
 dmM35w9i/jfgmCj1qNPZwwV4g/guirdB5D9KzszZrfJocEM9/j3rEytXoE/DVr0g+cd5g3r54ZX
 OXWC5PP2lR9cgKnhh98F8kaaga7ZzFLoz5CkR+ImeljhLm0Ll+OrjUdRYlo677F6AiNPq7j0Gfn
 qY+pkXhPqzJ0geKPGai3kuL0ZMEeB9jRlKwDiiqz0eGUPPomhlGEOXlC9+TOSiSAkeuZGB/aYLe
 SoCpYnNxJ376yOB0C+r+AzJ3kbfm5NRl5mcV7bPhfDRx7eL8WKxPXOBh0SISLqx9Q9gTJFvSuuO
 Fk0qUhjlbVyZjql/ADXL/+MkGmZvE3+licSWNgGzx4hc4K1vZ3zeEgJALTsfuQHG2xxqnLVZo3H
 ULlYYspMVZl09/UdJUe0Jhv7CrQdXq4dDdnrn/1GY2Jj54GnJqaiBQN5YGgAk=
X-Google-Smtp-Source: AGHT+IHLLrG5j4m2n4PoPbuVmHZ69tvqUkFHujUfl3v7biPGdGGV8XmptNv3G0R/8+E6s3OfCTAULQ==
X-Received: by 2002:a05:600c:5026:b0:470:bcc4:b07c with SMTP id
 5b1f17b1804b1-47117925d38mr58012555e9.37.1760791768501; 
 Sat, 18 Oct 2025 05:49:28 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:2acd:89a8:83d9:4be5?
 ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710ca4931csm75020945e9.0.2025.10.18.05.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Oct 2025 05:49:28 -0700 (PDT)
Message-ID: <f3904ae1-bf1b-455f-b5ba-5d625b76222f@gmail.com>
Date: Sat, 18 Oct 2025 14:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/bridge: enforce drm_bridge_add() before
 drm_bridge_attach()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-0-92fb40d27704@bootlin.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-0-92fb40d27704@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 03/10/2025 à 10:59, Luca Ceresoli a écrit :
> This small series enforces that DRM bridges must be added before they are
> attached as discussed in [1].
> 
> This is part of the work towards removal of bridges from a still existing
> DRM pipeline without use-after-free. The grand plan was discussed in [0].
> Here's the work breakdown (➜ marks the current series):
> 
>   1. ➜ add refcounting to DRM bridges (struct drm_bridge)
>      (based on devm_drm_bridge_alloc() [0])
>      A. ✔ add new alloc API and refcounting (v6.16)
>      B. ✔ convert all bridge drivers to new API (v6.17)
>      C. ✔ kunit tests (v6.17)
>      D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
>           and warn on old allocation pattern (v6.17)
>      E. ➜ add get/put on drm_bridge accessors
>         1. ✔ drm_bridge_chain_get_first_bridge() + add a cleanup action
>              (drm-misc-next)
>         2. ✔ drm_bridge_get_prev_bridge() (drm-misc-next)
>         3. ✔ drm_bridge_get_next_bridge() (drm-misc-next)
>         4. ✔ drm_for_each_bridge_in_chain() (drm-misc-next)
>         5. ✔ drm_bridge_connector_init (drm-misc-next)
>         6. … protect encoder bridge chain with a mutex
>         7. of_drm_find_bridge
>         8. drm_of_find_panel_or_bridge, *_of_get_bridge
>         9. ➜ enforce drm_bridge_add before drm_bridge_attach
>      F. ✔ debugfs improvements
>         1. ✔ add top-level 'bridges' file (v6.16)
>         2. ✔ show refcount and list removed bridges (drm-misc-next)
>   2. … handle gracefully atomic updates during bridge removal
>   3. … DSI host-device driver interaction
>   4. ✔ removing the need for the "always-disconnected" connector
>   5. finish the hotplug bridge work, moving code to the core and potentially
>      removing the hotplug-bridge itself (this needs to be clarified as
>      points 1-3 are developed)
> 
> Series layout:
>   - patches 1-2: add missing drm_bridge_add() to the 2 drivers known for not
>                  calling it
>   - patch 3: document that drm_bridge_add() is required before attach
>   - patch 4: add a warning in drm_bridge_attach() is drm_bridge_add() was
>              not called
> 
> The added warning might reveal more non-compliant drivers, in that case
> they will be fixed as they are found.
> 
> [0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t
> [1] https://lore.kernel.org/all/20250709-sophisticated-loon-of-rain-6ccdd8@houat/
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Luca Ceresoli (4):
>        drm/sti: hda: add bridge before attaching
>        drm/sti: hdmi: add bridge before attaching
>        drm/bridge: document that adding a bridge is mandatory before attach
>        drm/bridge: add warning for bridges attached without being added
> 
>   drivers/gpu/drm/drm_bridge.c   | 6 ++++++
>   drivers/gpu/drm/sti/sti_hda.c  | 5 +++++
>   drivers/gpu/drm/sti/sti_hdmi.c | 2 ++
>   3 files changed, 13 insertions(+)
> ---
> base-commit: 0f2efbe6d8305b91c9b2c92ebaf8c24a614bc305
> change-id: 20251003-b4-drm-bridge-alloc-add-before-attach-ef312c0b8a8c
> 

If drm-misc maintainers agree I can merge the whole series.

Regards,
Raphaël> Best regards,

