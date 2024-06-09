Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CA8901626
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 15:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EB310E04E;
	Sun,  9 Jun 2024 13:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZU4OPnOs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518BB10E04E
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 13:00:40 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-35f20e798e3so139067f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2024 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1717938039; x=1718542839; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ky3F7lrTtIDOfgJFvUgAjHSa1goIJaZDc94U4MqRHYw=;
 b=ZU4OPnOshgYL+XpduNbTEJg/L901ijiUFR3+lI7bioaGvEBSe6F+39Te4XJwDJm3Bt
 JTkb8V0TyspCWCFPZGbbXI4ffJOI8uu5nrlywOrHuRJ+dQSmYZ58vum7ZkqkYYvsuoOW
 M/Zxc4LX57R2NoxSRPS2oTlCcfDlfoDHSonv2lKG3oKSxVjOif3+SwIA52X9v2lXY+yc
 NTFeqqHCTZvNzGmLVLl9oSBv6kd8zLPXaVNV7osxTzeI0uAgGAJ9p1keVZ7dCf1axaqa
 a8wQXD+4pjm4+V/omvMjP0WEgy5xzt/GluPVi5gqTxjmpaVGII0rY4601UoQ08WszPHI
 umOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717938039; x=1718542839;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ky3F7lrTtIDOfgJFvUgAjHSa1goIJaZDc94U4MqRHYw=;
 b=pQBBLk7WMdYz3InJZngN0HmtjdbaOzbrHaoKwlXyKVsVEsgzfZwPO30kH5KgdgMAVZ
 w1/A/uUlpTT3gB0jehqK9EwEzEEgmokmHxW/NBadX7aV1ULECFWmbEDJwffG/lbTLQWy
 Rch6AoqjylhRUTvhun1thLuzvzW4ErpVFWLdkHCLhvWgFFzhzRw5LF9PvcR7IVeD2r0h
 NoEMZsFsB/0zASJbdOc/yVrO+0M8CjkaN/tRzAx1ZkLBWwHtGPqNUv369sg1Mk2/h9jh
 4o3WHCQQZe/DI/sL/7i9eXV+xonAjJNywAAIaPk9rCSiz4rwybrTTpN4ngVVYOfOF47t
 gtTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOAWZTYANrMyQOu59JdcCbZFUqdwh2Gtr1cWItxKEQpaAwIJGjGAm9RnfynsoE/KYUUzd2IE3iSyft8lUIzde6oh5JkmYsjzhWeO9TuO8i
X-Gm-Message-State: AOJu0YwOzBzJ2x7aig5zrN5JYV4Z1jpfpQC4QqbfNWWSjoqdGEBtmJh2
 0IaLKAjsPAyudyDhRuiGobmqdy2ONFy6W/DPYuKcJooOOtxSJVlHyTGdHoF0W28=
X-Google-Smtp-Source: AGHT+IGRsbqTVIFgZ6p18PEJuNiLJHAflv0f2yiem7/+NmsB7nGwV1Zbdr6NLv9+xKSWGMAW3A3S6A==
X-Received: by 2002:a05:6000:184d:b0:35f:209b:c10f with SMTP id
 ffacd0b85a97d-35f209bc1bdmr870170f8f.68.1717938038958; 
 Sun, 09 Jun 2024 06:00:38 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d66cf6sm8521473f8f.49.2024.06.09.06.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jun 2024 06:00:38 -0700 (PDT)
Message-ID: <8412fc44-d3c1-4283-aceb-7aa4b95606be@tuxon.dev>
Date: Sun, 9 Jun 2024 16:00:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/4] ARM: configs: at91: Enable LVDS serializer support
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 "dmitry . baryshkov @ linaro . org" <dmitry.baryshkov@linaro.org>,
 "andrzej . hajda @ intel . com" <andrzej.hajda@intel.com>,
 "neil . armstrong @ linaro . org" <neil.armstrong@linaro.org>,
 "rfoss @ kernel . org" <rfoss@kernel.org>,
 "Laurent . pinchart @ ideasonboard . com"
 <Laurent.pinchart@ideasonboard.com>, "jonas @ kwiboo . se"
 <jonas@kwiboo.se>, "jernej . skrabec @ gmail . com"
 <jernej.skrabec@gmail.com>, "maarten . lankhorst @ linux . intel . com"
 <maarten.lankhorst@linux.intel.com>,
 "mripard @ kernel . org" <mripard@kernel.org>,
 "tzimmermann @ suse . de" <tzimmermann@suse.de>,
 "airlied @ gmail . com" <airlied@gmail.com>,
 "daniel @ ffwll . ch" <daniel@ffwll.ch>,
 "robh+dt @ kernel . org" <robh+dt@kernel.org>,
 "krzysztof . kozlowski+dt @ linaro . org"
 <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt @ kernel . org" <conor+dt@kernel.org>,
 "linux @ armlinux . org . uk" <linux@armlinux.org.uk>,
 "Nicolas . Ferre @ microchip . com" <Nicolas.Ferre@microchip.com>,
 "alexandre . belloni @ bootlin . com" <alexandre.belloni@bootlin.com>,
 "Manikandan . M @ microchip . com" <Manikandan.M@microchip.com>,
 "arnd @ arndb . de" <arnd@arndb.de>,
 "geert+renesas @ glider . be" <geert+renesas@glider.be>,
 "Jason @ zx2c4 . com" <Jason@zx2c4.com>,
 "mpe @ ellerman . id . au" <mpe@ellerman.id.au>,
 "gerg @ linux-m68k . org" <gerg@linux-m68k.org>,
 "rdunlap @ infradead . org" <rdunlap@infradead.org>,
 "vbabka @ suse . cz" <vbabka@suse.cz>,
 "dri-devel @ lists . freedesktop . org" <dri-devel@lists.freedesktop.org>,
 "devicetree @ vger . kernel . org" <devicetree@vger.kernel.org>,
 "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
 "oe-kbuild-all @ lists . linux . dev" <oe-kbuild-all@lists.linux.dev>,
 "Hari . PrasathGE @ microchip . com" <Hari.PrasathGE@microchip.com>
References: <20240421011050.43265-1-dharma.b@microchip.com>
 <20240421011050.43265-5-dharma.b@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20240421011050.43265-5-dharma.b@microchip.com>
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



On 21.04.2024 04:10, Dharma Balasubiramani wrote:
> Enable LVDS serializer support for display pipeline.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Acked-by: Hari Prasath Gujulan Elango <hari.prasathge@microchip.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Applied to at91-defconfig, thanks!
