Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6801986C41
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 08:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C94510EA91;
	Thu, 26 Sep 2024 06:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MWXRrT0L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F43710EA91
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:06:20 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53659867cbdso876700e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 23:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727330778; x=1727935578; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ejo1TRuFJ2zM9Fu+guQtsRLwGHHMWPxLCk8lrAvCsoI=;
 b=MWXRrT0L0mBx5xkyqeW/vJHIS3Zdda42xkATETM3aWbl36AS2nbY8NEBpnYM7ONsci
 mEjAs9sP6jiQQmEyV9yp1ZJjJyKWY1AThblitU1h/rEy8L+hPw3tVVMzYNnNfVgBFnqA
 m1du0TjF536FRTkNG3TiJrltZ47qOATqYYnaGWOPrMEpTN+rzh1b7hg2cwHG2Hpk3BvS
 xXvLehksofvfU/bAkzwZbWVkHvw8YQfMlLq6v0r1jPn6LQYZvALT/Qoh2MW69fds9j3Q
 QhBccuJaJmVj426XfZAPIbRb5KJcq4fPeaSXI84luVJcBl6fDJm/HazeP2lMjC8aDIdT
 55Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727330778; x=1727935578;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ejo1TRuFJ2zM9Fu+guQtsRLwGHHMWPxLCk8lrAvCsoI=;
 b=NTSNkEPySr2BIVpIlPrfe/pogz2Vmd4le8HUcgjO9nMKxIS+wb5kkJu/s3xwypPcTa
 1K+H2DH/EOsYW31arahbEXlcjzggRavQYzmtePG3KQiDBT5fvrCgaIzZE8vonhSX62+U
 UTOi5REAbs1hFpmvObdJr5uIYE93o3j6F4EMxjA64/jkfbLWKfn9ndlldunzEr9PGh8M
 Fgh+kABRWBBphYPOUL7hlthaog9hKPkLCNviQiIU1/l746cEFwuxObu84bAPhilKoQ1i
 e1YnM5JyzbAwNjUkv1eGHfm3yPbZOchsl54Vr5O7poHC/2tQ3bvi1BIxrNEQz2DjkFtZ
 FLHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJWHejO2oZePVgo9DVhN6IXgHulNDuRr6Wyuosd+nW16UXVp4kQhRtt0Ruwuns2yxQ7shtFWADBQg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyki16QHUuDbUtz47YZhGQ3EY8pWL5ngzzLvkjjpMCqujNpHKyC
 EACLpcJ+SgI8q+OQ86vhuKHtxaXWJsAczVVHaTM7AtSD2tpugSPdEQxDc9Xtr68=
X-Google-Smtp-Source: AGHT+IFOV7/5WVFoAHKdj7fBib+/U8cBJf7swI2iHaZNBkQr5Rln2X5XyYoZbmW1ZI+0/YVf2hkDEg==
X-Received: by 2002:a05:6512:31c3:b0:535:6925:7a82 with SMTP id
 2adb3069b0e04-5387755cf04mr4552703e87.41.1727330778114; 
 Wed, 25 Sep 2024 23:06:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e0642sm708396e87.27.2024.09.25.23.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 23:06:17 -0700 (PDT)
Date: Thu, 26 Sep 2024 09:06:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm: fsl-dcu: Use dev_err_probe
Message-ID: <unc3udwrwhzjluulpxjqwsgylvoadwmjrabmskglyvof4i55g3@5jmjk4oketo6>
References: <20240926055552.1632448-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926055552.1632448-1-alexander.stein@ew.tq-group.com>
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

On Thu, Sep 26, 2024 at 07:55:50AM GMT, Alexander Stein wrote:
> fsl_dcu_drm_modeset_init can return -EPROBE_DEFER, so use dev_err_probe
> to remove an invalid error message and add it to deferral description.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * None
> 
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
