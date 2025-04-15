Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B947A89E99
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AD710E77F;
	Tue, 15 Apr 2025 12:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Vp2Pcyj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6D910E77F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 12:52:50 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so44931325e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 05:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744721569; x=1745326369;
 darn=lists.freedesktop.org; 
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QIpJFzBiRxBxNKge8gwRRjQC9Lg+LdbOBnR/KeoN2F4=;
 b=Vp2Pcyj17dhtTbVIdCiyW6a0+yJHiNKmdqGBzwEGulAGFODAlZQS5rzM8SuibJKaAH
 QkVf5rWT3WnbPHDzQ6Drrt2uddQY6Ef3X+QzHjXFMAbFOhIa5gXqqA27cl2BFmVgTiSt
 PkGNg2lv0fOH+jo+8/ZNUI6cpQ5hTPnrb/tXI9fGOkyYcR8Zm6BHlr8KSxORfwQSYWsv
 Ca+VS8oW40DwurEioxA9lR8GEbxssqhDpEyzuiAoD79sA4vOcVMo24XmxGcJPK4k0LGa
 OvDC7vpFdh47c5C0Yn3Pxs1iXTzEt1DDLK+dCpkL+S3DZojI6f2J/YdPM5muXh1CaVJd
 NvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744721569; x=1745326369;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QIpJFzBiRxBxNKge8gwRRjQC9Lg+LdbOBnR/KeoN2F4=;
 b=kYAeNN2YpWXGmgDJ4ts9YodboLBJrAI/kPkLBMUkXcT439ODUQeSfzYHibpAo0dycG
 yyh8/f+OKLQV0dQGUroOX0n4LCI+hILXRqI5iAi70rbdsgkTpgST00M+wo4BG39fEm9N
 vLaZM5W6Y4trF6271smBARaBy619Kr2UTFQzf2tBPbi1VRlz+ZjGjutUJlXhq4ZOGlwI
 lcLkNYHOLEnZRwVEYwJnIWv7zlMVsTPL6diVCSzAYxXRTPEf//3x1i4dOdeJxBwqrRkh
 uHT02PmHZQPoJytdx6kH9r1+JJjoi+B+r4MbZ7+MbDCirzuc8bX9LKZDpfIwhqAw1p5L
 av6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu1iS8/Th+HJO4GHS/ZOIV3+6xQmUL99YBnn8TJGbXWue8XjR/Ix2hZ9d1JZVz/501fxxTew24y00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJmyHOXLTG6KiasisPEshkzpSlDICjGZXv3BgFFaN4svQ3P8A2
 supV7obQp5/ZT6OYyFDqOojF6bhbKxd3CxaZI9XEORwwZri9yW0Q7QTNFSDKP9I=
X-Gm-Gg: ASbGncs92cZ86FqQZtnTRBTv6BRmbyOXdwu7A0yybmpFmI9EKaHJh0p/OJ0eHFQuoPa
 pmit9TNAYPJj5z3W+b1ASJFQvBbOr+M6mDw7q0L3IrPeyVdRTH+mIxgh1d2x3JddG+1Wdv0XQht
 IP4cuI2wUY9vSKaMQMLTnwYE/03iIu/EOKLsTQPuqg1SbYXaSTot0bOIS2UMJwwPtg4/ggE4sMv
 HtNtAEeDbbs4hULkcAw8EbOn6WkGmidHaIjy/zl37YPRK8MWUJ0k7nlzsOiq+B2ARPL600OJZNQ
 5h7X2uITfEQrN7epo5/F5bd5kofBavwIpugpMx0=
X-Google-Smtp-Source: AGHT+IE8ZFye7fKJN/Lmt/JH+cGrKzkQSrAfNM/hv/kW4P8wD6rvRDacsRLWQTapc+dkn5240h+uDg==
X-Received: by 2002:a05:6000:420a:b0:391:40b8:e890 with SMTP id
 ffacd0b85a97d-39ea51f5d65mr12661246f8f.22.1744721569233; 
 Tue, 15 Apr 2025 05:52:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:357f:4855:d5d:eccb])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39eae96e912sm14384664f8f.31.2025.04.15.05.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 05:52:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025021938-swan-facedown-e96a@gregkh> (Greg Kroah-Hartman's
 message of "Wed, 19 Feb 2025 15:20:48 +0100")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
 <2025021938-swan-facedown-e96a@gregkh>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Apr 2025 14:52:47 +0200
Message-ID: <1jecxtwpr4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed 19 Feb 2025 at 15:20, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
>> Add helper functions to create a device on the auxiliary bus.
>> 
>> This is meant for fairly simple usage of the auxiliary bus, to avoid having
>> the same code repeated in the different drivers.
>> 
>> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Hey Greg,

Do you need me to do something else on this topic ?

Cheers

-- 
Jerome
