Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7F28877E8
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 11:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF0710E526;
	Sat, 23 Mar 2024 10:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OmR1oxSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986ED10E526
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 10:19:06 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a4715d4c2cbso350168066b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711189145; x=1711793945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jsWVUzTZjb8sGoPxm2j46t2rbn6viTMSYqvI2Re5TR4=;
 b=OmR1oxSUfCrTw4/CYJiez5bcTFE+tblfyLj5jF8wk1dVgN49TQuwc3XYqdKOzce3JY
 JZyo4wOS9okllfSDTq64J6LEQf8a5NJgt4klc1olKvKOoG52Q4rsNfaCe/etIy07PXOJ
 o3oCTw6eRg/oNcY7fp56wV5PVfPn9WGbWjZ/Ol9rL6aKyWbS2gN0tXqhP7iR2YQFsFBn
 SlARWt1K1LgYSoGp6FEIKHaSf9Buej1jbnOW3hQqVwysVhe8ERDEL78kE4A1jIUrXpYH
 /TWxlNyJKVqJbxUqweHhYl7P5In6mD+QmwGogFQSDj+v3mRljtEOID8nMe4fl5JN7hyM
 wdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711189145; x=1711793945;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jsWVUzTZjb8sGoPxm2j46t2rbn6viTMSYqvI2Re5TR4=;
 b=K7B60iWGg6vB3m4MNfAp9BbWvsc7xPBL4/BeyKZzPIletZWbRY4VD4c5ij9O6bEBUM
 kgzRBnsexavj2RL3sw9v7BaRKn2e5fCi4FdeuG2srX5bEpEIuKEDnEIwOBTD/vRqeNGz
 ySy0Y7218Q7+zqzkL7fx3SHFoRUIwApLsdS9Yt9jD4OZw0+6QQQKh3bvZXIGlK//q4UH
 Tx3ghc3rmaF1Ri8wwL5BGr94q4gm9Kl7793pLJxQkaH8NFtvG6BysfHxNCaClh/Pxo3w
 8T116yAMVoS/BQZaZFYsTFKP+y3FfpOJIHB60dPGRwuofJGl9oduflJLh4Cmf1kJTTXK
 fzMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlhPSvhL+nDM/bZzSoYhc3bbQZyjF6pA+UH7KzjMmNO3X6zHyHPN9qFY2xLRqMGZ6LMm6u2gcx4M3zs8eH7Wk6g4Ym4v8hs8odN4kOMmMy
X-Gm-Message-State: AOJu0YweJpWS18KUKKs2Cn714D/VAi1RcvSU6uM+78RxwNDC6AwwYR9B
 JbRIfWIN3e8GONCpE5I+bS1FPWKh6T/i9VvyVjfEjNT6ZI3TukfVi71jA4MRRAY=
X-Google-Smtp-Source: AGHT+IGQslGoKM0t42VsynDcdmkNlrLvqjsHEB56Do9omRsijDvuZnkqdoR90hWKpBnqiuSFScyYMQ==
X-Received: by 2002:a17:906:6bc3:b0:a45:ab61:7a47 with SMTP id
 t3-20020a1709066bc300b00a45ab617a47mr1315089ejs.16.1711189144821; 
 Sat, 23 Mar 2024 03:19:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
 by smtp.gmail.com with ESMTPSA id
 le13-20020a170906ae0d00b00a47464a6ee4sm369968ejb.173.2024.03.23.03.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Mar 2024 03:19:04 -0700 (PDT)
Message-ID: <13fcafd7-2e10-485e-bd39-acf67288f07b@linaro.org>
Date: Sat, 23 Mar 2024 11:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Setting live video input format for ZynqMP DPSUB
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
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

On 21/03/2024 21:43, Anatoliy Klymenko wrote:
> Implement live video input format setting for ZynqMP DPSUB.
> 
> ZynqMP DPSUB can operate in 2 modes: DMA-based and live.
> 
> In the live mode, DPSUB receives a live video signal from FPGA-based CRTC.
> DPSUB acts as a DRM encoder bridge in such a scenario. To properly tune
> into the incoming video signal, DPSUB should be programmed with the proper
> media bus format. This patch series addresses this task.
> 
> Patch 1/9: Set the DPSUB layer mode of operation prior to enabling the
> layer. Allows to use layer operational mode before its enablement.
> 
> Patch 2/9: Update some IP register defines.
> 
> Patch 3/9: Factor out some code into a helper function.
> 
> Patch 4/9: Announce supported input media bus formats via
> drm_bridge_funcs.atomic_get_input_bus_fmts callback.
> 
> Patch 5/9: Minimize usage of a global flag. Minor improvement.
> 
> Patch 6/9: Program DPSUB live video input format based on selected bus
> config in the new atomic bridge state.
> 
> Patch 7/9: New optional CRTC atomic helper proposal that will allow CRTC
> to participate in DRM bridge chain format negotiation and impose format
> restrictions. Incorporate this callback into the DRM bridge format
> negotiation process.
> 
> Patch 8/9: DT bindings documentation for Video Timing Controller and Test
> Pattern Generator IPs.
> 
> Patch 9/9: Reference FPGA CRTC driver based on AMD/Xilinx Test Pattern
> Generator (TPG) IP. Add driver for the AMD/Xilinx Video Timing Controller
> (VTC), which supplements TPG.

None of the last users of your API can be merged, therefore this API
should be considered as without users. We do not add API which does not
have any in-tree users.

Best regards,
Krzysztof

