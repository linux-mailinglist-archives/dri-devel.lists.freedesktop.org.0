Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FD47BD860
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 12:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158B210E0F6;
	Mon,  9 Oct 2023 10:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E1710E0F6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 10:18:37 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50585357903so5743204e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 03:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696846716; x=1697451516; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KzjqhcxTplk/fjWtjjswcwgpKZ+f2AVwpc+PUpIKpZs=;
 b=pwPPz9ySvq3ZaaPz+f8Wg0ugCD0ibbTCIRJemsXie98HIxbWARD2Vz8eq1GZZzYyrU
 IBgtKSto+MmPyT5qzqyl/TiuuWebcAw7brgrkT9KX9iCw++gYHXc5Z/XIeth5re5qqs3
 8qJqy1Q19Ij5AV2edIXoLIm5Rqckf68kQ+ox956bvVfuCSN9IuSk+hZj0xUewFQ+CRBH
 yboN+DwZjvGNYFQwaYHXOCqBDuCwfr+wrw/g4Yt6ECswNLoOSM3171OWSeJ13M3ukkg+
 IVs6T42owYArfGVhZIqbZLavZg9CaMT3Lb65kJdsmcXJp4JB+Odwrqz7DZYFno2qDz45
 N46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696846716; x=1697451516;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KzjqhcxTplk/fjWtjjswcwgpKZ+f2AVwpc+PUpIKpZs=;
 b=ffMan12e14TsuUUdA80fHBcH0ovGYnjsd6RDwRG61kOubaG+1b221wFWrxvLOd/rms
 lsW3WRBNhQ5oR0iXsQjaFcD/++iT0jcl3rA7Xn1Gm59WIodYooxDyfsg7lIISIBZS2m+
 vdoc61w5NlM8agnlJlSRTPWLxOojx1IBiofdPNryLTkdxtaHbAqaWoNGDlHa5c8MOVjq
 /+VBcT726X1Iflly/uBshZP5hkBNAdN8xVmEdHSKV4jnqeWd7+mVDZqEIOzE9qJIowlU
 IZqeENdOsFFDjZZSL552mi8ZiywzQFHBs8WN4dLgggE/rx6O/a2ObB1oCQGjIpK19lQF
 U5Iw==
X-Gm-Message-State: AOJu0Yx8PsJRE0QMeqdgXELKuAy0CuLyNSpEoPuexxNF9Pg9qgwWYP97
 DyXLnEoo1IPBTYFHWOp9JkeixQ==
X-Google-Smtp-Source: AGHT+IGY9WKDt7ALyy/qcEMDEosc8dNznZ/T5vS8ZD92++froNBAqLNU25PJBwaTdb63LswVmU9kIQ==
X-Received: by 2002:a05:6512:250c:b0:503:8fa:da21 with SMTP id
 be12-20020a056512250c00b0050308fada21mr16362091lfb.43.1696846715809; 
 Mon, 09 Oct 2023 03:18:35 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a7bcb93000000b003fe61c33df5sm13038355wmi.3.2023.10.09.03.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 03:18:35 -0700 (PDT)
Date: Mon, 9 Oct 2023 11:18:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v4] backlight: pwm_bl: Disable PWM on shutdown, suspend
 and remove
Message-ID: <20231009101833.GB223751@aspen.lan>
References: <20231009093223.227286-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231009093223.227286-1-u.kleine-koenig@pengutronix.de>
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
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 09, 2023 at 11:32:23AM +0200, Uwe Kleine-König wrote:
> Since commit 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only once
> per backlight toggle") calling pwm_backlight_power_off() doesn't disable
> the PWM any more. However this is necessary to suspend because PWM
> drivers usually refuse to suspend if they are still enabled.
>
> Also adapt shutdown and remove callbacks to disable the PWM for similar
> reasons.
>
> Fixes: 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only once per backlight toggle")
> Reported-by: Aisheng Dong <aisheng.dong@nxp.com>
> Tested-by: Aisheng Dong <aisheng.dong@nxp.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
