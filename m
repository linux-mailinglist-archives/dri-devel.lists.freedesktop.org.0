Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF5A97E326
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 22:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FE410E22D;
	Sun, 22 Sep 2024 20:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bbLKpBDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB0D10E049
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 20:15:41 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-535be093a43so4430548e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727036139; x=1727640939; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eJsTZ+fGWzXXDKSrSngpUpGtXjiwp5GwNrKRxzMEJb4=;
 b=bbLKpBDcLCcIr8PKp5IAYG0Kn/5eRJGRjkTwJyRq8Bd6LKBiWLoH/CE3h2+ptBsWB1
 dgWOrwlPe0UTwjxkCkVV8r7xUX8aqD3NjAcGqdBDisshwwXAjo9DqGcDIxiBQVwPmhYW
 Punl+ofrPd11IsDGxmAq4kuy0P4M66Vu108E8emOXnfGX62zU3lhY1MYnJvmuwREb8Au
 B2mSfu+FWT24FED/918tu5JWpGe5ev0R1zzPduaT8L6wyOf8ht+op660WpK77n8sBw/b
 GndWGclwTyImm6jTXLrh+jCdBY1sF0gbmzzmAOzVGY4A+k8OMljE2upfbXjGfuoME17l
 7bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727036139; x=1727640939;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJsTZ+fGWzXXDKSrSngpUpGtXjiwp5GwNrKRxzMEJb4=;
 b=idI4KLA+M9nyhXhPozae+Bf4VYywRZtphJASL/Eh9U29AEAdRN3mEwiOrMvcioGRTL
 ljBwDrP0seX8ahR5rS8+BHBWHP0LvqLEF54zOtPdKrYE3macgNWSFLh6/CqZY89f6H4o
 vZ516OMYGcx9fg6zg+SaOCmhkKMj1fqA2ZhLIv8dwwMiv6zLGZBosgF46IZf+idX1q5L
 HyGXDnasYFincVvl0A+wW5/xlH6qAC3axO+Jvx/tw+NV8fgzfKq7DXgUFgcp5lJhh2Tp
 RuZ2EVAjb20605jDEIY6ImSqqz6rBPtpj3H+dxgP6M1Ko4i0ZltsLC822qRFN9YNzLL6
 UTJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8vlwKAEOCJZTZ1OOkkAqI8qo7LDMZZe5r+/MhufjUDVS2a8V17qZeo8ftRxwITq5q1Jpo2NI7XJc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzb/FxX0s+yxLixn6vP17UlDdzmQvHXlN5vMdYEMsgELE8eHrDZ
 IpUfoq0HFOC4mXXk8F/Fzl625lt36X8y9KlA7xBB3W/X2OZlOfhhGRPLJog0AKE=
X-Google-Smtp-Source: AGHT+IE8Z3bqAVsYlxzrsQyZTx1dyP/WVnF//ZUsQidajA2RmozHRC+rqTFmK7pyFw1iTwYRorOusw==
X-Received: by 2002:a05:6512:1092:b0:533:4689:973c with SMTP id
 2adb3069b0e04-536ac2e5127mr4824141e87.23.1727036138691; 
 Sun, 22 Sep 2024 13:15:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870a89d7sm3083383e87.239.2024.09.22.13.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 13:15:37 -0700 (PDT)
Date: Sun, 22 Sep 2024 23:15:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND 1/2] drm: fsl-dcu: Use dev_err_probe
Message-ID: <42xybemeaf7ob7a57tbeqjmuhriu7f3eplopkozhizim6ldbm4@japyd7wvmsal>
References: <20240904115135.1843274-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904115135.1843274-1-alexander.stein@ew.tq-group.com>
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

On Wed, Sep 04, 2024 at 01:51:34PM GMT, Alexander Stein wrote:
> fsl_dcu_drm_modeset_init can return -EPROBE_DEFER, so use dev_err_probe
> to remove an invalid error message and add it to deferral description.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
-- 
With best wishes
Dmitry
