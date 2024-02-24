Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D99862517
	for <lists+dri-devel@lfdr.de>; Sat, 24 Feb 2024 13:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0455A10E165;
	Sat, 24 Feb 2024 12:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="SKFQbY1z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB23810E17C
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Feb 2024 12:52:15 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-512e39226efso2343729e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Feb 2024 04:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1708779134; x=1709383934; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xI5sCcxvIw+wCH0k/MFKMsnG/9USCpJCifLHFTbuCDA=;
 b=SKFQbY1zeOVab5ySKfY3EQwVYi8Myzn933GpAlF/E5GFgVcQ98cu3rvwh8y7hP0rlg
 ER3EWWjl+HIbQIdtU9z/mYZo+CbeYiQvR27mUQ8l+ZC6PGQ9jt9hCCZQ42rGjZxjAMSu
 dwAac2f2Pk2HydcamMWZhkDwqj0/f4Pjb4A3GeP8tcsrQg3n/nLKwIA4h9qblnpDx7D+
 NpKqXvGlc6a7LnkQSfFO/lMvWkn8+dTSSOywOkIAcjRiVTLhqxq3Ytvoi14Ql76PDkQI
 p4m/R/BpcVSeULiqeT582cB8hXvJJwbfZWCBCcrAThGdeqVZf4PzRXtdb/71hjLWq9gQ
 2dRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708779134; x=1709383934;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xI5sCcxvIw+wCH0k/MFKMsnG/9USCpJCifLHFTbuCDA=;
 b=WJvhs86wtZHIlA+Pv+U2ullN232KIdeSn+amkAUZx3Gd7BgXTkzwb4ygS5JTcPb08L
 FU18YTeVp0Gm8f1EPPz+2Pnq+HGZ6gYDC0J64m+SvQtdTmnRWzeJOJRt63NbIKOq94TG
 X5JeztetlrDkoBKkzTHIBYAro99bOhg4DtTqsZmG27J9/Q8AX9bL2L6ydRhIMX5TJ8e3
 XHOLquCAHQ2aQpUDl+tA2p2gOqH0pa8pROPLAlpFCbYr8+L6RmkCokf4rfzVq1kVuxQZ
 FKxB9JCkHaXShdIr6gA654wBvr9tHXDhNf1vE7DehQAXwjd9DgxUezUxaV/n11FLKXEt
 Irtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTg0dIqTmn8BUJYI0zDP6KBlb3qC0OMXEQOujpghXA42dEsdJfFT/I2HxV7e+t6QEi0J/yxONjb92AlovGwWXmqJ0gRfoAbKJY0Z/vrYEZ
X-Gm-Message-State: AOJu0Yzr7KX5GoqCsXuFR3/cT7gYY9CnCcXA5lg6eJxvKlG46NTRfYfi
 zOlNA/I6ZkWSK6UWROyWfUFPN5iYdmBSdG4MsEChu8qFUu0SKXlotkkbGe/vJMA=
X-Google-Smtp-Source: AGHT+IGvClWG427ReM6uDzldJ1NsnDu1SHQoKbXcHviUsK2l0V7b81cRm9OVaIDAvJAINZBAsFBQFQ==
X-Received: by 2002:a19:6545:0:b0:512:bdd3:150d with SMTP id
 c5-20020a196545000000b00512bdd3150dmr1384907lfj.52.1708779133698; 
 Sat, 24 Feb 2024 04:52:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.99])
 by smtp.gmail.com with ESMTPSA id
 nb18-20020a1709071c9200b00a3e45a18a5asm564678ejc.61.2024.02.24.04.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Feb 2024 04:52:13 -0800 (PST)
Message-ID: <b5d9b028-4a1e-4bbd-9572-290b0042afdc@tuxon.dev>
Date: Sat, 24 Feb 2024 14:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] Add support for XLCDC to sam9x7 SoC family.
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 bbrezillon@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Hari.PrasathGE@microchip.com, Balamanikandan.Gunasundar@microchip.com,
 Durai.ManickamKR@microchip.com, Nayabbasha.Sayed@microchip.com,
 Dharma.B@microchip.com, Varshini.Rajendran@microchip.com,
 Balakrishnan.S@microchip.com, Charan.Pedumuru@microchip.com
References: <20240221053531.12701-1-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240221053531.12701-1-manikandan.m@microchip.com>
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

Hi, Manikandan,

On 21.02.2024 07:35, Manikandan Muralidharan wrote:
> This patch series aims to add support for XLCDC IP of sam9x7 SoC family
> to the DRM subsystem.XLCDC IP has additional registers and new
> configuration bits compared to the existing register set of HLCDC IP.
> The new compatible string "microchip,sam9x75-xlcdc" is defined for sam9x75
> variant of the sam9x7 SoC family.The is_xlcdc flag under driver data and
> IP specific driver ops helps to differentiate the XLCDC and existing HLCDC
> code within the same driver.
> 
> changes in v8:
> * Re-arrange the patch set to prepare and update the current HLCDC
> code base with the new LCDC IP based driver ops and then add support
> for XLCDC code changes.
> * Fix Cosmetic issues.
> 
> changes in v7:
> * LCDC IP driver ops functions are declared static and its 
> declaration are removed.
> 
> changes in v6:
> * Fixed Cosmetic defects.
> * Added comments for readability.
> 
> changes in v5:
> * return value of regmap_read_poll_timeout is checked in failure
> case.
> * HLCDC and XLCDC specific driver functions are now invoked
> using its IP specific driver ops w/o the need of checking is_xlcdc flag.
> * Removed empty spaces and blank lines.
> 
> changes in v4:
> * fixed kernel warnings reported by kernel test robot.
> 
> changes in v3:
> * Removed de-referencing the value of is_xlcdc flag multiple times in
> a single function.
> * Removed cpu_relax() call when using regmap_read_poll_timeout.
> * Updated xfactor and yfactor equations using shift operators
> * Defined CSC co-efficients in an array for code readability.
> 
> changes in v2:
> * Change the driver compatible name from "microchip,sam9x7-xlcdc" to
> "microchip,sam9x75-xlcdc".
> * Move is_xlcdc flag to driver data.
> * Remove unsed Macro definitions.
> * Add co-developed-bys tags
> * Replace regmap_read() with regmap_read_poll_timeout() call
> * Split code into two helpers for code readablitity.
> ---
> 
> Durai Manickam KR (1):
>   drm: atmel-hlcdc: Define XLCDC specific registers
> 
> Manikandan Muralidharan (6):
>   drm: atmel-hlcdc: add driver ops to differentiate HLCDC and XLCDC IP
>   drm: atmel_hlcdc: Add support for XLCDC using IP specific driver ops
>   drm: atmel-hlcdc: add DPI mode support for XLCDC
>   drm: atmel-hlcdc: add vertical and horizontal scaling support for
>     XLCDC
>   drm: atmel-hlcdc: add support for DSI output formats
>   drm: atmel-hlcdc: add LCD controller layer definition for sam9x75
> 

Only minor comments from me (check individual patches). W/ or w/o those
addressed you can add:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

