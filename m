Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38168C9734
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 00:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EDE10E19F;
	Sun, 19 May 2024 22:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EK3CNw1w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D88910E19F
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 22:15:21 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5238b5c080cso4580609e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 15:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716156919; x=1716761719; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uNZy7sIdE/z1TlxALr7ub8QrN1KQgxipVOeDnJjogOg=;
 b=EK3CNw1wM+9BnXC/m2JJMdBfQvLC52vIBfL6wNT8aFvHwll51nPxz+Hm/3HsIe1xx4
 xdado2bPZWdd5Ger8qXTkMV5Jdify6XEfqF76ta5I/TbQvAzYiwJj7uHP8bqnKlks0iu
 QA7Q5TShJuWARX5iLcQBVD8w15ejUVIyguD99TGtRUyffPO2V4OYkz79gywokP4VMF8r
 25KhpDSoySLScUK69FLpWorex5p/SjvrvcQmy6VxPe1FuDazsegFSeK1kO4PGbh2XTWn
 D7HnOEnSopgU7VRm5EKZJg60MGY3kW6WJzx7fUQ3tavWDRXFYyMGoIyMtDApfIwC3tYY
 +kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716156919; x=1716761719;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uNZy7sIdE/z1TlxALr7ub8QrN1KQgxipVOeDnJjogOg=;
 b=p85MUuQR1mM4repoxzYyBeC4F/tPPkSmpEgnJLRgeqqQUY1hbaYoOn++ZeXaBTVfWK
 DIQXc3F+h3yAOyRs9cp17BxEtEdN88wpEUjdLc+mKr+sBwkm3MuFweKWiqcAHqsfQpoT
 w3CWlFNCHMWNVVe8VcmCIYCPQYxG7l7qJGXGNltr92WQ3Q+fonKEZU5XNjijshRqqU+K
 FVNPONTJtO+J8x1aLm6EwGSnlKNiReAellgaYryLYPrZo7k00Be1DQVa7OnXtGUilxIt
 rlaP1A012VsdJVO4yklX9zXNmEyay6Nabj8ZqSQKPfecyXBGP1EdEZ0r/fmuPwqC7wEs
 Ib6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWI3dQrRCcCEy+3+8Cc/6u7vcSdzxP7Hk+oTSr1Nhmf8Gyezzcm+0GMsTtcmv+lNyYvrB6TyTnwCOvYMyBIAXCcW0m0qG3IwM3V7a2XFnp
X-Gm-Message-State: AOJu0Yy4kV5HIVqsdjUT4BArqkc35VUV4jNyA3ANcbviDpsygb8/msWD
 EWKp86umoyZaWLKDWmpp5Tqjg6iYkE1k1l5FkimiGmKOmalUcbORwG6UuSpElTg=
X-Google-Smtp-Source: AGHT+IEyH/3C1D8FUQmIyRnndhRQ+yB7Ivz2S3I92VUPNHqwIS586UKcVrPcgtF1Kcad2UcVYVNqGw==
X-Received: by 2002:a05:6512:3188:b0:523:ab19:954b with SMTP id
 2adb3069b0e04-523ab19962bmr10070712e87.17.1716156919240; 
 Sun, 19 May 2024 15:15:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d2b8esm4068246e87.247.2024.05.19.15.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 15:15:18 -0700 (PDT)
Date: Mon, 20 May 2024 01:15:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux@treblig.org
Cc: liviu.dudau@arm.com, mripard@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/komeda: remove unused struct 'gamma_curve_segment'
Message-ID: <f7xuppybgsxxfcc3eugi75fgmvdtehan5rngu5cynqnc6ortns@vixp6c2au5fg>
References: <20240516133724.251750-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516133724.251750-1-linux@treblig.org>
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

On Thu, May 16, 2024 at 02:37:24PM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'gamma_curve_segment' looks like it has never been used.
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
