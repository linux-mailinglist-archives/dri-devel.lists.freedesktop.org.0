Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BB66F53B6
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 10:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7B910E20E;
	Wed,  3 May 2023 08:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0120B10E20F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 08:52:51 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so48719285e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 01:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683103970; x=1685695970;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bgZG6p8PNZ6MATQQt6+bk7YMAD3dFVDJrGkYCew0g4I=;
 b=w2RS2+8sxdUDA/qFtitCK0siba+4RRLmTowVPqcV+GjUVJx5/otLasDXC56j+5vux7
 rjT2NEa8Y614Ao93r6l0ikGfPsAxLldVkXm8oJvqXXh+LIYk7AFsmAtp4lkN15ReX2xG
 fwvTO6j4hgdH6q6+/hNgYHkg8cQU85IfQurGV8FbJWQxOvHS8HByDNLWldP5zvr9RxzS
 Bxyrp8gDX+X5VxdOISt1R6BDtrNWGXwpbJ9dQFoVWc/+GjeQrT7MxLF0b9oAv1jB1lhB
 4K2yAmO81g2+GAOraz/SDDS0hAXjASqOlfV1FnqOx+ojuNA/vFfkRp30pGaFaAgYb0U+
 7E/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683103970; x=1685695970;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bgZG6p8PNZ6MATQQt6+bk7YMAD3dFVDJrGkYCew0g4I=;
 b=X/GPbBDH4NTuiQN1feulH3q1r4qnggMFV/7ipnguGjo/qNuNTKEBEf2saavettxpUB
 cJLP7DB56Y0tKZj8gjhNDf2OtTxIzd/fjYzl0AYI14OpMWAm/dHkP8LfHmvwabTSp5A1
 YHMryemLxMD5LAU56pkcHxWcyN6HbOmgA38g3Z0ZoXNYXpEY5Lb8pqyF6/gZ/9YEES3L
 8IrLAu8ZaXGZI7durNJYU6RY+sXfhUFXFIzCeBLitIHokwmX8EnF99PnQm4TTWNVzmVg
 cu3+koH9tzmIBv5DawiUCS+4Jo0T0vpfoWVaRZY33I+YK8P0t3tkiVwt9sQ9YtZVa3dw
 Exbg==
X-Gm-Message-State: AC+VfDztGtDbJYgdXuQAMCoCNCmmuMZfTTOQFQ+ln/hzmZZoDE+BygCP
 1TUijTy2qaAOMjsUbM6VmKxIew==
X-Google-Smtp-Source: ACHHUZ7IuHqLkguJmyEjKv+a7FMneToE2XeOnN/XjtYZacKF42HAUzTus3XG0kc34KAQnMEqu9sFug==
X-Received: by 2002:a5d:4841:0:b0:2fa:ce3:9a0 with SMTP id
 n1-20020a5d4841000000b002fa0ce309a0mr13462825wrs.36.1683103969920; 
 Wed, 03 May 2023 01:52:49 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 w12-20020a5d680c000000b0030630120e56sm6526300wru.57.2023.05.03.01.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 01:52:48 -0700 (PDT)
Date: Wed, 3 May 2023 11:52:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/imx/lcdc: fix a NULL vs IS_ERR() bug in probe
Message-ID: <2834501b-636c-423f-8d13-7a1a35fd3810@kili.mountain>
References: <d0a1fc55-3ef6-444e-b3ef-fdc937d8d57a@kili.mountain>
 <20230322091604.3zgzogskrtn3evur@pengutronix.de>
 <875y9wg6fz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875y9wg6fz.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Dan Carpenter <error27@gmail.com>, Marian Cichy <m.cichy@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 15, 2023 at 11:51:28PM +0200, Javier Martinez Canillas wrote:
> Uwe Kleine-König <u.kleine-koenig@pengutronix.de> writes:
> 
> > On Wed, Mar 22, 2023 at 12:06:55PM +0300, Dan Carpenter wrote:
> >> The devm_drm_dev_alloc() function returns error pointers.  It never
> >> returns NULL.  Fix the check.
> >> 
> >> Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
> >> Signed-off-by: Dan Carpenter <error27@gmail.com>
> >
> > Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> >
> 
> Pushed to drm-misc (drm-misc-next). Thanks!
> 

This still hasn't hit linux-next (although the latest linux-next is
from last Friday, Apr 28, so maybe it will soon?)

regards,
dan carpenter

