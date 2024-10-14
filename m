Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A444799C174
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9E410E3A2;
	Mon, 14 Oct 2024 07:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hhUdbXkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A5F10E3A2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:35:08 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539f84907caso551267e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 00:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728891307; x=1729496107; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RXd9IRsJ/Q2GAEkeQwvXUDlljQikHHqovvpnz4Mnaes=;
 b=hhUdbXkXCcxPlevUtudn9Foz0MGMo9LPXqkqUtisEcZdxE+Em2WY2PiobAYcFjKR1p
 k2+1avnXjO63J/SGv908TkO3N2iRVAvX3l1tBvsbrlZyXGeJCenwkCFzlobaNkpHD3Zh
 hT5RCCHB1nlBumLmy9Rqrju6w6aQbFz52HAKnlcX0HDZmLI9aku7MqyaKNUJNJ5tx23r
 dh0tv5XUQxeLvmjFlmEvy23eUzejw01yLUM6EFtQDDocf5Iab0LluknYQF3vYBtd6nws
 5wSDBo9OV1i+aqVeDpZYxO/zSphg7af6xvCKtpMIVvP1YIJTnHBV9HHvX3BHt/1Xm3gr
 ZVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728891307; x=1729496107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXd9IRsJ/Q2GAEkeQwvXUDlljQikHHqovvpnz4Mnaes=;
 b=LZqxXAZ0hgbHAPooCUeXytavSCHF9naTwVKwdnvWI02t7eqAb3RYSl/FrVfcdpF+RQ
 D2GhcmYzGreTWaZg1rQGb5b9UuXfoKGO8aBaM/4Aotahf8lnt6N+xY0KEElpJt0UMIKr
 BijoBtVJ4K/VfIwQuboRUStCzAIN6ErQEkCxwYVzt2Psy1LzOppyLw5d9pya5do1F9UK
 854drfj1uhkkl9TGII2ypunEgSk/qKPxlUqYB9gSvvrs2FbaYpFY10h4Bw9c1JIGVab1
 MnkdsPo77fUvRa2oTtJ8pLAbAKf12A9tzf+gkbMNg2siHVxZjXk5VLvLKDqCyEuBNZJl
 wujQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUECFzNEwNdRvGkiZX+FGDbLtwQOKVFTEI6kqqZAdvSBq0cVsMt8nD1vq0dWY7j8Ot2QFM2hAw33Ko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDEBhubNyMVSPMys1iaRpbVLUqjDWIUtuPYu++0CDentrrYUV6
 /bQx1gT6/j/GMh6rwdXQojVyVrX7/pEZQnTaRwU3Ktv/B6a3YFXc+UMnPZipQow=
X-Google-Smtp-Source: AGHT+IFG5mAcJza7yiles85LfH/G0lB/xgU5IoFW9zjQX8bagRJinxpczK+JtOryP0YxXrBGl1BZ1Q==
X-Received: by 2002:a05:6512:3c95:b0:539:d0c4:5b2c with SMTP id
 2adb3069b0e04-539da595273mr4520019e87.51.1728891306540; 
 Mon, 14 Oct 2024 00:35:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539e48c1807sm953064e87.237.2024.10.14.00.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 00:35:05 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:35:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: u.kleine-koenig@baylibre.com, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Mehdi Djait <mehdi.djait@bootlin.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, 
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v10 0/2] Add driver for Sharp Memory LCD
Message-ID: <hfpq35cxext6vd7shppa4ovtszywzqkc5gqo3t7p77uldasxts@gyfrypofijmd>
References: <20241008030341.329241-1-lanzano.alex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008030341.329241-1-lanzano.alex@gmail.com>
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

On Mon, Oct 07, 2024 at 11:03:09PM -0400, Alex Lanzano wrote:
> This patch series add support for the monochrome Sharp Memory LCD
> panels. This series is based off of the work done by Mehdi Djait.
> 
> References:
> https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
> https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf
> 
> Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> ---
> Changes in v10:
> - Address comments from from Uwe
>     - Replaced -EINVAL with PTR_ERR
>     - Error check pwm_apply_might_sleep function
>     - Remove redundant error message

Let's wait for an Ack from Uwe's side. If there are no further issues,
the series seems to be ready.

-- 
With best wishes
Dmitry
