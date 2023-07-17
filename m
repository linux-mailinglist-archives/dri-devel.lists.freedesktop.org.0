Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C8D755E9F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62B010E20E;
	Mon, 17 Jul 2023 08:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D2C10E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:38:32 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742bso41530725e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689583108; x=1692175108;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z4o4TF/LxZly0vmrx76BwSM2BKqw0I4+/QaBjz9uTXs=;
 b=JaV92xVDUvovCm+5AOf7VXTT70biF1yo1d8ZNHDTZ7c8s8DJ7s8HFrJ51Pe9GuXZHs
 2+7R9LUaxFYqKXfjRy9R8w5Zzll+hJLQWKthxlNKNLLHExtWxu/kdoibRd4eNf/Dz9+m
 86KU/z0VcVrBZfGG8oKSLJ5gTp2hr6Q6fyHGxbQ9WYTzZZimI6hZsdKWkZ5A0T9RjqWb
 WBi0II2wYy1IYlg2w+X8qvt5GBKIASiTQVWK3KrrzU5d3KKyKDqBJAUomig/PhPUMH8R
 TZ8AJ6fE6eOxd/kPHP85EbY/JbZ/Zn7/RNOdMcEEdvAKFq3TwfVpdREMsxfzZEUIfLXF
 42dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689583108; x=1692175108;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z4o4TF/LxZly0vmrx76BwSM2BKqw0I4+/QaBjz9uTXs=;
 b=M570KqRaavkUZHKu98kMpVLwCVSrMbFKNyCq42GfDWpEDpFD5AlMtnJ0SmiBxtez7S
 3GTUWDLlHiG3YWY0ZcTDsHFntzZ3X9f6ThwsXfm9h8Q9w8kNXp8m8G4TTr4qnARwr2kN
 xO+EEjHaWzsdxUlkmAyx3TMDD2Hta9VxlGazST2ZuHiNFZCzey8TNK9Dpfy1BU8JeRs4
 mhhJlnXktpm3N5EuDfPhotgEZpudSW0QJQ09bSARxirebOgPwIzGDMewgQNMTN8G35S6
 ZQuIkMJTbBfFs2ikJwZ2rlnDVS6Gu9LS9Em10ng/6O+dNRcZFdksKtQvVtN+BOLN1I56
 VOsw==
X-Gm-Message-State: ABy/qLYYSYA7tzYnuubRRIdmZro22UU2bWPw7mekEAj+dT59uf2+fCpS
 3hjVAkTekLAP1aIykr+mG1sqUg==
X-Google-Smtp-Source: APBJJlGx68JBlekO0xvjwT7iigvCwI/s1FOxF/ffNTRgvDyXHyJIZnu+G2GKCpabCXWQUYGMJS6rNA==
X-Received: by 2002:a05:600c:21c8:b0:3fb:fef3:53f8 with SMTP id
 x8-20020a05600c21c800b003fbfef353f8mr9724649wmj.25.1689583108129; 
 Mon, 17 Jul 2023 01:38:28 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a05600c20d400b003f91e32b1ebsm7485189wmm.17.2023.07.17.01.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 01:38:27 -0700 (PDT)
Date: Mon, 17 Jul 2023 09:38:25 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH 1/2] backlight: lp855x: Initialize PWM state on first
 brightness change
Message-ID: <20230717083825.GA3448956@aspen.lan>
References: <20230714121440.7717-1-aweber.kernel@gmail.com>
 <20230714121440.7717-2-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714121440.7717-2-aweber.kernel@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 14, 2023 at 02:14:39PM +0200, Artur Weber wrote:
> As pointed out by Uwe Kleine-König[1], the changes introduced in
> commit c1ff7da03e16 ("video: backlight: lp855x: Get PWM for PWM mode
> during probe") caused the PWM state set up by the bootloader to be
> re-set when the driver is probed. This differs from the behavior from
> before that patch, where the PWM state would be initialized on the
> first brightness change.
>
> Fix this by moving the PWM state initialization into the PWM control
> function. Add a new variable, needs_pwm_init, to the device info struct
> to allow us to check whether we need the initialization, or whether it
> has already been done.
>
> [1] https://lore.kernel.org/lkml/20230614083953.e4kkweddjz7wztby@pengutronix.de/
>
> Fixes: c1ff7da03e16 ("video: backlight: lp855x: Get PWM for PWM mode during probe")
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
