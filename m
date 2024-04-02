Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDF68950EC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1270C10EAF9;
	Tue,  2 Apr 2024 10:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nh/0gcdl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2FF10F419
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:52:47 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4161d73d876so1729265e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 03:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712055166; x=1712659966; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1YTxvmjRmcfQlUlxr5z5vqfrDT+DzwsPEc5WOijGjCk=;
 b=nh/0gcdlJF3JIuj8nNync66VNn1PTp28ddcx2dDWyOyI/HcRWmI0UvIrM+dVgupSuD
 7Cc36b7h0BqTXnoVxqPivIyURY6GIk8uH+s/rCdwSm9RjXvIUGSu8C296MWqr8Z4ksBr
 j5PuhfYQKLF1ddQOu/H1fEDX8r9Rr9PI4USbgXo/8FWv4naCXCh+yiDsLLceA3Gl1qAp
 cXF32piwBj+sBlWJn0ymu+0Tq4gJsG3yYWZQuRGX7D+I8RsSmmIcRpX8/TX4HCpxNnfU
 SDOx9seOQH+hxKkX9Xk2NC9Rq9iyDWpeU//26tvK01tHLgvdxY4Of2jVlWFmjPj5xhpO
 dPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712055166; x=1712659966;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1YTxvmjRmcfQlUlxr5z5vqfrDT+DzwsPEc5WOijGjCk=;
 b=HRQXharQwAhSbvnvPOULHbUxG7aunhrk4RHtoxi3RZ86WWpFjnnVbML630Iw7iw4ap
 r+VMs1xVvqAtHHx7j/NNhfJ0hTbMg+yfLM3sXHs7iVdOp++QzVZ3Uj/lpRRbG+yCpDeW
 JuAfULrUVhc1A9lhGhsMcj5+vEO2990Pn2vQskpo3rJQXv6C4MMI8V3W/hfV5VIQI2Wy
 NBRtnDbjELKJHVWSD/xf0gUgfwqZrvTfNcj3x8j2FTjzDa5DSajgPr5hD0iYgGAY60XY
 kZV7vkrzXUBKIzMXzJbx/vAodg0dcZzowUXl8NLXyaJwfmWDGoQEpdsFk+eDsV/zXhG7
 h9Cw==
X-Gm-Message-State: AOJu0YxYzBvbHcEJu3S6hrxOL7RAYA9i5lzDFg1ibCLkU0YHArp9JlpN
 8Luh68e7tEmJnlVOUGPguQGleA9m2RFgQqnpJup6KaJG2r1Tmew2iL59awo0zn4=
X-Google-Smtp-Source: AGHT+IECFFC2QpBeFxWbttS37ljtNH1Md/XKAYuE3SMOGvLg9paIl3bsTuA0JUInIDn5SAMDlrEOBQ==
X-Received: by 2002:a05:600c:2983:b0:414:56ec:22e7 with SMTP id
 r3-20020a05600c298300b0041456ec22e7mr9343996wmd.21.1712055165953; 
 Tue, 02 Apr 2024 03:52:45 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 fs11-20020a05600c3f8b00b004146dd6bfe2sm17450520wmb.47.2024.04.02.03.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 03:52:45 -0700 (PDT)
Date: Tue, 2 Apr 2024 11:52:43 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Patrick Gansterer <paroga@paroga.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 2/2] backlight: Add new lm3509 backlight driver
Message-ID: <20240402105243.GA25200@aspen.lan>
References: <20240330145931.729116-1-paroga@paroga.com>
 <20240330145931.729116-3-paroga@paroga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240330145931.729116-3-paroga@paroga.com>
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

On Sat, Mar 30, 2024 at 03:59:25PM +0100, Patrick Gansterer wrote:
> This is a general driver for LM3509 backlight chip of TI.
> LM3509 is High Efficiency Boost for White LEDs and/or OLED Displays with
> Dual Current Sinks. This driver supports OLED/White LED select, brightness
> control and sub/main control.
> The datasheet can be found at http://www.ti.com/product/lm3509.
>
> Signed-off-by: Patrick Gansterer <paroga@paroga.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
