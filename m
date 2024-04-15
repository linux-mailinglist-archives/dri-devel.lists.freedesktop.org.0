Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69DD8A4FD0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D562A112547;
	Mon, 15 Apr 2024 12:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eNwbWM/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63F5112547
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:54:51 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d895138d0eso24429851fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185690; x=1713790490; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=59f281dHkUN3AP2oLzzLuo3JgEJxzPeKM9+dan+z5jg=;
 b=eNwbWM/Z22h7tHYib1TmPRUMjOuBz9BjeZ1PrxMvrNN9uAUMgCVVeGIzMap2f5q6SJ
 BV9IZeqPLF2vdbLpZ37A9VSuTZSeXm9b26+0fjB50CI+10G6trc04v+6oM/poeUSL+P2
 d64u5klJiDRVib4voutFaeoT6BIBKuBfirydppWnnqL+6eCKR81x5qeF22i07whdzdA+
 PRm4Z75K5ufXHQZ1RNql80wndQT0bJhgLcMEu0HQZVs1wgsBV9v7uoswJjPmq6hazcW3
 HACkVAS7wlnKgZSgqGH77d0dAowo1ZnnELsbtjyA+YkEPpKbrtfZbsVYXNBRz+kjAkR/
 FMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185690; x=1713790490;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=59f281dHkUN3AP2oLzzLuo3JgEJxzPeKM9+dan+z5jg=;
 b=SKXfd0GLlQed1kPeXfv30JgCGkhmm9qsVSIhG5QmUtXtMDxeeAyV0w/h53S26vshwJ
 zx3ssPo1PC9KCU7IcVvXpjHleE8qq+LZ4EGMp8Ki87gy82iB2ctyOSxU5dghMFWgf76f
 byvOahUfyt+pm2IZBik24hx+sLugyLirH8qpJD05GixXiiV8oUW3gpV5lIgOsityPW9M
 5yyL92IqasIOudtcn/pvgYpYoYFUX9cHfH6m9imVnGlK718un3dpzYI82xvQst2oG9Ki
 qIKx6mp405ooadcQfVXiTGU5U7WJ2ogJ30VcnCyBFCTMv0JgeFFdBvAygFGjU85HtnyR
 DSdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxYizyyfk3Hxbib2erpouaVG1mRPTOBEXH1mIuy19ckOLMDYw14ALxEPqv+EWxobCrtO1HQIX1HY1iLEgoVNL/gLLhmCYz1A/tTMQOuYjy
X-Gm-Message-State: AOJu0Yx7/pvyRAqL7dvOH7Up7FmrWuind8jzT3/EgSu1Tzk6o+3FlEV9
 IdeuptG55Zf5NNUiOysvLH0mLjGMgFFsZegB0Sv6ZpvrPRwquy58Pz7bxyv55wk=
X-Google-Smtp-Source: AGHT+IFrtoNRAy8uJsV4JsI0aS0ZrMcXBvUk3IjrcXoc1WAmiqGm9I5p36WylWsaC96BOzcw3ftNXA==
X-Received: by 2002:a2e:97c5:0:b0:2d8:abb1:b311 with SMTP id
 m5-20020a2e97c5000000b002d8abb1b311mr5397736ljj.44.1713185689650; 
 Mon, 15 Apr 2024 05:54:49 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c19c600b004187ccbca8dsm941622wmq.42.2024.04.15.05.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:54:49 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:54:47 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 12/18] backlight: otm3225a: Constify lcd_ops
Message-ID: <20240415125447.GL222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-12-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-12-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:36:10PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
