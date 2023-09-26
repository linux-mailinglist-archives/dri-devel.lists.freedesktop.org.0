Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708C77AEB16
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 13:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660CE10E3A3;
	Tue, 26 Sep 2023 11:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785FF10E3A3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 11:11:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3226b8de467so7066072f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 04:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695726700; x=1696331500; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u/MLMSmJRNmBGSS9dRqNvrvgUZYmB0L9NSn0EiK9+Hs=;
 b=uE3oXbmGhAMMqyUDCgbiM4vHLVKQkWwS+dfqJm0/RlKPJZvzy77/izvkn1YYIQLzZx
 voR0lENoLCpqLcZNEr/nZBCwqRll785JzdQBIMR/ELgvOK2Cm9G3uelk0yTlX1ayEUvs
 zqRgsqZwcUtM00xDNg07BBtqdQjvJw/4JFlTtO2BX6ecHgIF/gPNlUYfTrfX7BKK0aLq
 WO8Jxm9OgLVHRWOljrFofcxQ6/W437e/SEEdnB1Gmnb63k2GBjV0sBu5q5vt2IJOKDUK
 6lgecY1vgJXizeQB1qGXfXME0iJYW+f+ZNFBHM11kgg7DQV9/33JWTupq8u3Bk3dQU+J
 COww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695726700; x=1696331500;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u/MLMSmJRNmBGSS9dRqNvrvgUZYmB0L9NSn0EiK9+Hs=;
 b=wUCVShAGoghvKbdZCbMDSmkZozf5n66kwt+169kddHx9rV0FdcFLyC4uUkIA553aTw
 8Oe2WcLWkTFYmDFOgsi21mYHIDTJNBxZiPeShLJjtSnEsOtuwmtgegM8m65SnlnXzkaI
 i6XlG9y7290l2OVgO6mdrvvIsmxV6AK76ltQWXY1EMuIul5KTRJ9l5AR31ECHrKCo61A
 v6Tbij/xDyu6A5H/qLm+dVbYrU7rpVV9j+eqkRrNxlywfbHemoS1MPVixACMSbmQAw3w
 Q9YeKbKTKSqzY/rbRRaZ2Om1NeIBVur4zKtEQ2sPKR+CzekF9F+rFl0ORRUNrkufqZzB
 zSpQ==
X-Gm-Message-State: AOJu0YyBVtC56Ntdlf3goZHS8JdoecjqjkiaNzLSMgHKJ+8klznDQTgL
 3ipNxIO1kTEHvBmXWDoLwsYGTA==
X-Google-Smtp-Source: AGHT+IGgmiei3dmVPVwM/+kLjJAqZ4Dui7T/b864294DUFjV9lzha2Kyb8LLBEIC7UGG1WF/w42vgQ==
X-Received: by 2002:adf:9d85:0:b0:323:37af:c7c7 with SMTP id
 p5-20020adf9d85000000b0032337afc7c7mr1177540wre.69.1695726699756; 
 Tue, 26 Sep 2023 04:11:39 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b0031c5b380291sm14405871wrs.110.2023.09.26.04.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 04:11:39 -0700 (PDT)
Date: Tue, 26 Sep 2023 12:11:37 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] backlight: pwm_bl: Disable PWM on shutdown and suspend
Message-ID: <20230926111137.GA4356@aspen.lan>
References: <20230926084612.2074692-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926084612.2074692-1-u.kleine-koenig@pengutronix.de>
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
Cc: Aisheng Dong <aisheng.dong@nxp.com>, linux-pwm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 dri-devel@lists.freedesktop.org, Aisheng Dong <asheng.dong@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 10:46:12AM +0200, Uwe Kleine-König wrote:
> Since commit 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only once
> per backlight toggle") calling pwm_backlight_power_off() doesn't disable
> the PWM any more. However this is necessary to suspend because PWM
> drivers usually refuse to suspend if they are still enabled.
>
> Also adapt shutdown to disable the PWM for similar reasons.
>
> Fixes: 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only once per backlight toggle")
> Reported-by: Aisheng Dong <aisheng.dong@nxp.com>
> Tested-by: Aisheng Dong <asheng.dong@nxp.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Changes proposed look good (and the comment about badly designed boards
going to HiZ state we super helpful).

Only thing from my is why there is no attempt to disable the PWM
from the .remove_new() callback.


Daniel.
