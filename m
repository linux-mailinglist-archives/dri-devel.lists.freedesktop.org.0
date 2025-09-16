Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976E4B5A574
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 00:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA8D10E80D;
	Tue, 16 Sep 2025 22:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PGCd5C/c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0954A10E80D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 22:03:47 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b0787fdb137so901063666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758060225; x=1758665025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=o0Ob/UE4RTVxiwS8RzGBBRyiZqvn0MV4NxGM4WOAL0E=;
 b=PGCd5C/cMm9fB8ScQzjAk2lNKD4nXTi4Ahhj0Pm6EfcY/573eoQLqrwVPJjVfgPhHV
 wfCVT0hsvc5xv+ZujdhyGQiIuMOhQBTPJ+hYHkgO8USMi41tx/zLD0QEVQeSBLYSUhlK
 GgoOeyS6Q9ILu/0QbOJ8nIguBZIUkgMaJGB8IZKEhh/qLn/YExVrV7eiMkqwdDORIENL
 HNRKWZx8jotDdkqIiZ7VlDmjdJ7BcOEwPK9bGESblxIpNE34O+/2agQ4l7ipZuWfh8cS
 B/g/fDuw3Xh7h8kBAs0mYP5GPQXZ9S/ZdGFI4CGL0/ZA3uS6pz7qyCMcRmWxCPYNvc4M
 6+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758060225; x=1758665025;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o0Ob/UE4RTVxiwS8RzGBBRyiZqvn0MV4NxGM4WOAL0E=;
 b=RCyAUhAqdSNKzqXzYuRmZzIWg83jWtiPDqbJ0aaBk73XcwQ5U+ShP0D1EV7kB/jIoK
 IoIWNRxhg4+Qo/qJku6NqL3S3EFaepXG0fA0OUDpnmCUfTUv8io4U54qNwCVEq+AUKD0
 eHXc4ssjifK8SYQPvjFVIQp+fTOarryfcX7D42AtkAk01W/Tz+NqF1h2nJrzPWqHteZT
 v/pp9KMi9Rp09tq5uI70oG3Yv7gPQ+r7SYx/7k8DQd5bRaOgVKGldiOflUj/HRBzP0qN
 qnR6OHYuXUbBdVsSyRkAjKyiE9cbzveZyH6XHYWwTjG6AD1QidBcQepqeRqRmiugB8wW
 r2ng==
X-Gm-Message-State: AOJu0YxynNEKVqtAf515BqS3wfS0rP1MNpsB4MdCm8gpM6UA4utNJwwz
 u6wkkdL+HcXiRxqIufoeBrx9WSEDYl21usuNUgLy03iC8V6QsK7fHG81
X-Gm-Gg: ASbGnctPKmpYYjYit2tHxxncNxOqS1hjCJTvC+bdQHVuAEugeHe9Go3cSLHcdsgOi9c
 YfvNkv9Ig7E/dFM3rdLKta/di+plukHDlrp7sFjryuVQjkke70epOu+Z0x6GlMZGxahQZtRqAHH
 7pExr0SNtdDgVLsqY2W32Js0nDbCW74ahTspnOte4H++l0GSfysVbsoxM/aMvgnOpeOj3CeM4N4
 68yETG1S+0G/G9YT1mozHzwqTElTrtkT403Cly4ODDeq5V/0RY7EjjsBr6srvET8i35cVa7EtvA
 L5VZvepVXmLhJjcjvbNCsNPKrzS8/Xnd2fbLUWgGTnYfqHAlWiTjHy1BtI06lvK6BK24dmhlFj7
 gfxJKLQu9bN8LHWt7br6oPcnuEI525+vWfIfbGz4NZatt+nk8ugK7hz5y+SXVVCCKPyKz
X-Google-Smtp-Source: AGHT+IEQodNvL7Edth6QjxYHTIysPZRAz+uUM7UuZtp4kejKP8E79m/qDu+L/TqlV6RUd269kcVcYg==
X-Received: by 2002:a17:907:9713:b0:b04:8358:26fa with SMTP id
 a640c23a62f3a-b1bc02f66ecmr1410466b.33.1758060225245; 
 Tue, 16 Sep 2025 15:03:45 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da43esm1237094866b.14.2025.09.16.15.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 15:03:44 -0700 (PDT)
Message-ID: <235312e0-b912-4e10-874a-e6364131aaee@gmail.com>
Date: Wed, 17 Sep 2025 00:03:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] STi device-tree display subsystem rework
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
Content-Language: en-US, fr
In-Reply-To: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
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



Le 17/07/2025 à 21:15, Raphael Gallais-Pou a écrit :
> This serie aims to rework the display-subsystem node, which was
> previously included directly within the SoC node.  This was wrong
> because it is an abstraction and describes how IPs behave together, not
> what the hardware is.  Instead, extract display-subsystem outside of the
> SoC node, and let IPs describe their connections.  Doing so helps the
> readability, and eases the understanding of the hardware.
> 
> Several nodes have been renamed to stick to the generic names defined in
> the device-tree specification.
> 
> This series depends on another sent a few days ago.  It is not critical
> though, since not having it only triggers warnings when building
> deprecated device-trees.  Please see link below.
> 
> Link: https://lore.kernel.org/lkml/20250714-sti-rework-v2-0-f4274920858b@gmail.com
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
> Raphael Gallais-Pou (4):
>        drm/sti: check dma_set_coherent_mask return value
>        drm/sti: make use of drm_of_component_probe
>        ARM: dts: sti: extract display subsystem out of soc
>        ARM: dts: sti: remove useless cells fields
> 
Hi,

@Patrice
Would you agree to make the device-tree patches go through drm-misc 
instead of your tree ? So that the breaking change lands in -next in the 
same time as the driver changes.

I will send another series to convert display subsystem bindings to DT 
schema as soon as the series is merged.

@Alain
Do you prefer to merge it yourself or you rather let me do it ?

Best regards,
Raphaël>   arch/arm/boot/dts/st/stih410.dtsi | 316 
++++++++++++++++++++++----------------
>   drivers/gpu/drm/sti/sti_drv.c     |  18 +--
>   2 files changed, 192 insertions(+), 142 deletions(-)
> ---
> base-commit: b9a572f471993d3e8bf874fcb57f331d66650440
> change-id: 20250401-sti-rework-b009551a362c
> 
> Best regards,

