Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3873B059E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 15:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0FA6E4FB;
	Tue, 22 Jun 2021 13:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2B86E4FB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 13:13:01 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ji1so28404933ejc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 06:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KGR/V7/heOm1ODCqsrRncyGJUsTeE85nFekDdwDYzNU=;
 b=EheAH1Cz1WWsjTIJcZUCqQ6Ot4TNrkNjDfoIBYrWNkD00KCYDP80HL5XgCSbDJzdnz
 oQVEBayaa2OEKDt2WjYl4Yh8Sw1vfH9X3oqNUJwNfbH74NSAPxBmQ/KFP2pqA0VTTIcB
 S/JNuhiCW9bdN5sU+VhHpgtSXVVzZbiDZRjJ5o450gZ+Lh0CiYplvaKvSlkKxLMvCag7
 k4Bsd6pxnnk1ruYYUNb3a5xxRnfmO9lVw+D5jFnWADHXZOIeA75Z2DBTd9dN+tbjKY0C
 TA0MC++LUw4SpzzKClLUl59U9adxmL4hjzaDAuogGS/pW/Yfcj8XaheI5zBYyPUkDkgm
 AsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KGR/V7/heOm1ODCqsrRncyGJUsTeE85nFekDdwDYzNU=;
 b=h3R39PROX85aHJ2k0XXvV1cVvK9PdVjyh9NKOBpzBtIVL+zg/atm8s5BBJ1GpzmWDz
 rkk2Jt5PY1TirWv9F+aLZuLAs1OBAmVtlD7uRbvz7cOX8iBzTlPFv/Tk709DvISi5coS
 NsoFes22SMnqxBRGilqYEzv/86ijDvmhKjqGS+dOFEaHNy6Lcck1WLO5zmN2rT8zvJk/
 8sQjJ2wOHcpf3UFKdtNUNB47FE8LTmsGv+KQYm6i6kCrOiqQI5BZFBjK1LzmtltbUir9
 4JpxNuBR/gLhX9cs7Rb57N8bTWbURNM4DXXjd3depKBkazSQyobCX6Dw4+SmM3d3YqM8
 6zIQ==
X-Gm-Message-State: AOAM532tc8OY3cXTomJwDLsL4QaYo3HTutuUw71XdM3pMCoTUMy9hunf
 2Mci8aarGdO7o2+AEk2oPwyNbw==
X-Google-Smtp-Source: ABdhPJw6hZRz3q9lseuwDw+f1EYETZvPbOGRNjWLhiZeL2HxdDKfmQqVaHA7GgYZfQZ19WzYcZfLLw==
X-Received: by 2002:a17:906:2bdb:: with SMTP id
 n27mr3987193ejg.312.1624367580615; 
 Tue, 22 Jun 2021 06:13:00 -0700 (PDT)
Received: from dell ([91.110.221.181])
 by smtp.gmail.com with ESMTPSA id o11sm2362659wmq.1.2021.06.22.06.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 06:12:59 -0700 (PDT)
Date: Tue, 22 Jun 2021 14:12:57 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 2/2] backlight: lm3630a: convert to atomic PWM API and
 check for errors
Message-ID: <YNHh2cdcyzLWSCkK@dell>
References: <20210621122148.116863-1-u.kleine-koenig@pengutronix.de>
 <20210621122148.116863-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210621122148.116863-3-u.kleine-koenig@pengutronix.de>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Jun 2021, Uwe Kleine-König wrote:

> The practical upside here is that this only needs a single API call to
> program the hardware which (depending on the underlaying hardware) can
> be more effective and prevents glitches.
> 
> Up to now the return value of the pwm functions was ignored. Fix this
> and propagate the error to the caller.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/video/backlight/lm3630a_bl.c | 42 +++++++++++++---------------
>  1 file changed, 19 insertions(+), 23 deletions(-)

Fixed the subject line and applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
