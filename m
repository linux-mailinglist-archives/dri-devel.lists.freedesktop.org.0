Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0DE97C96B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 14:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CBE10E2A7;
	Thu, 19 Sep 2024 12:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sd3v5FLH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C0510E2A7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 12:43:29 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-536748c7e9aso1045856e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 05:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726749808; x=1727354608; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7Ol6M4YW6MVWejR+WIYDhh5wiJhWpDjSsx72sgUAcK4=;
 b=Sd3v5FLHKl/TY/08igTE1RmDFpEZzECbWyQwkWlLbRdEQDuSLodEyLehb6J3kggozq
 Mqmgk58DUGx52wVnw4225iF0gjmJ6ndqC+U0VC7Ygbck9yjs/GfIjx2gE64GFRDqXY6W
 hI47mT9fkc6tO2ytbOKG0P8IeETOBCwvIpNBCydJgwdgGCkleJJPZbUmhK4NZ/SQwxlw
 eyPai6LTBwG5gADmueEYu6K0HwmVTMr2OqzHR7jmvSeBZso3Khm1IIayr4g7vL6pnMHf
 KAkB3weJQ8Xrxy1NpnF4qaDBiVtunDGSEjOSQHqZE6UALOahd8qEH1A/ee71cyiFSvqZ
 I5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726749808; x=1727354608;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Ol6M4YW6MVWejR+WIYDhh5wiJhWpDjSsx72sgUAcK4=;
 b=UG4WYSQeUmJ2x6dg8hy+eRrRBizCkderTTwsjrh7UjupElu1THQR8nY9+AfI1t99WU
 hKYmUmkBZKbgiLpLH0vYjgaUXq+YjciYIhn73dK4Qel64Au+Z3xOrummc3Y5my9idAvf
 eBjnz7q8oQZ3lrE9ovOPBI47PAOKp5DQSQgMnu4vXmf2ZrIfKZxrTZLJ+kIPaRgUta6b
 YySeOursxpd88Ld1krqm/cXc5mLPgU87NNLXCwSbSP+9BdHLOdtXF4lX0XT86osVpe25
 pvVv3VdNvNX3lkvNiQpULxPtWiz5EeMKvKtFyMgimTVVdWjshlrBYQLSHHPtBVNTB6pR
 fEmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9pfAIqhRnSRGxxkLMPKsiEhm7MLqCLAEi3xTi2M11aDj3Os6nW+scxhkW9pWD/IXk49+r+ol/h2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoJyk6cwXKLZ2+ST8zjiHO/KrwOA3Au9b+tgscvP2dTIfS0p1F
 OyW/SQS5lIb118f1gE2ydilpk1Mr5kGlRP0rUy99osq4xkjKUZVPfIX9Nc37wG0=
X-Google-Smtp-Source: AGHT+IFmYmkHZIlfBdyrUfWUWF0Rb5yOfzU8RJXviBKDf8FPfm95Kao56gTHoM4nSmmg/s5Gb0ipWg==
X-Received: by 2002:a05:6512:a91:b0:52e:74d5:89ae with SMTP id
 2adb3069b0e04-53678feb07bmr15159766e87.39.1726749807733; 
 Thu, 19 Sep 2024 05:43:27 -0700 (PDT)
Received: from aspen.lan ([83.68.141.146]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb5dd02sm6079646a12.41.2024.09.19.05.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 05:43:26 -0700 (PDT)
Date: Thu, 19 Sep 2024 14:43:23 +0200
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Paul Kocialkowski <contact@paulk.fr>,
 =?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-fbdev@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4 6/8] backlight: led-backlight: add devlink to supplier
 LEDs
Message-ID: <20240919124323.GB28725@aspen.lan>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
 <20240917-hotplug-drm-bridge-v4-6-bc4dfee61be6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917-hotplug-drm-bridge-v4-6-bc4dfee61be6@bootlin.com>
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

On Tue, Sep 17, 2024 at 10:53:10AM +0200, Luca Ceresoli wrote:
> led-backlight is a consumer of one or multiple LED class devices, but no
> devlink is created for such supplier-producer relationship. One consequence
> is that removal ordered is not correctly enforced.
>
> Issues happen for example with the following sections in a device tree
> overlay:
>
>     // An LED driver chip
>     pca9632@62 {
>         compatible = "nxp,pca9632";
>         reg = <0x62>;
>
> 	// ...
>
>         addon_led_pwm: led-pwm@3 {
>             reg = <3>;
>             label = "addon:led:pwm";
>         };
>     };
>
>     backlight-addon {
>         compatible = "led-backlight";
>         leds = <&addon_led_pwm>;
>         brightness-levels = <255>;
>         default-brightness-level = <255>;
>     };
>
> On removal of the above overlay, the LED driver can be removed before the
> backlight device, resulting in:
>
>     Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
>     ...
>     Call trace:
>      led_put+0xe0/0x140
>      devm_led_release+0x6c/0x98

This looks like the object became invalid whilst we were holding a reference
to it. Is that reasonable? Put another way, is using devlink here fixing a
bug or merely hiding one?


Daniel.
