Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586219C2B02
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 08:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9ABC10E23B;
	Sat,  9 Nov 2024 07:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IIqiRGdl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93DC10E23B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 07:28:44 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539f76a6f0dso3109598e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 23:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731137323; x=1731742123; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/M/bCY+jOqOzGq7l1q1iV1xHZ3InGaYe9yg94zWyinE=;
 b=IIqiRGdlm1LFE4vTaXz557tK+lrt+l4lQJHBGec+2pgnXXN6bONMjNBW27AtepMRXI
 6Mg59EgTvk95Rt4Z4BytBWDhstf5xCPxAjkEN0SeduFezZVYhI9UDZ0zXMfabJGsNptC
 9Lq8HRzoy/eC8t7MXAA0jJpKXY99J3z7adXUIS+BY93U5sa4ecpkxNhnERsDEgAlPUR7
 jKSWpFcknqjF7nsLmBj3p+jL4HNBd2k/w/gsEZFKNKUiUNm29AW1Op0pOqya8hzPpZxc
 AonXdzNXnxSmjEN9WE5XBAnOUGMzAPh0JAOuEyMr/y+MHt9wYPn8hZosQYOHFzGAEN/h
 dsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731137323; x=1731742123;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/M/bCY+jOqOzGq7l1q1iV1xHZ3InGaYe9yg94zWyinE=;
 b=kdSdWKqR8Nrpiwv/hHS2CSpZBg8IkvgXNVlGFsdmM9EIymVk7SF33AWMNtTu4uMkU2
 6xJ0sylbPwNpPmjOjO1kWZMpPnFQuz3WlP9asx9oDJsAKCKFbNEDGsS0nTsPFRqh/flF
 Q52F1cXUmJpCgTVB3dqesuyNw56YsAhv0s2fImfwtIFOkSbYMby5Ko8Vjsk3haMXnDRH
 vBCIBesRxSTTtEx5bv1+4o/E9+8Hw4+TZBcwWiT/0V4epotHp1JWZ49VVcZCkmevhtuk
 kPuyb7yaeUhyVyXDjP5StEQ1E0VvqsR+VXCKE54wm4AkyTM4l6kfhbXeaL7IVitEB5rs
 WMJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTC5F8lwujhPLt9yGWUj6VytpIbu8Hx3+0MjtpSjLPRbwTWETbGBOxC2GJh7XCk04kdBv6eoEWiV0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/qfzNtC0dRVNibiiOZvaTA5sOZY69BS8nw7At5wU5bi07lMvI
 2eI6aFkaTDgc9pREhB7K2oMb5M1oEtLwSXS24AGsk8Nww51aPv7nsu9c5dDhRig=
X-Google-Smtp-Source: AGHT+IGr74wZluvmUo8uII7mpyFPgo2pXGdkwS9etFnNLeaSzsXBX7H/XT76P4oRDe3My8eYZWyC9w==
X-Received: by 2002:a05:6512:6d6:b0:52e:7ef1:7c6e with SMTP id
 2adb3069b0e04-53d862c6caamr2461967e87.51.1731137322945; 
 Fri, 08 Nov 2024 23:28:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d82685752sm870611e87.81.2024.11.08.23.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 23:28:41 -0800 (PST)
Date: Sat, 9 Nov 2024 09:28:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/atomic-helper: improve CRTC
 enabled/connectors mismatch logging message
Message-ID: <3xocdauewfty4slp25prfuyqlhhij4s2rqlngapvei5hihnpuk@za7ispjiukst>
References: <20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com>
 <20241106-drm-small-improvements-v2-2-f6e2aef86719@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-drm-small-improvements-v2-2-f6e2aef86719@bootlin.com>
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

On Wed, Nov 06, 2024 at 11:48:25AM +0100, Luca Ceresoli wrote:
> This message reports a mismatch between new_crtc_state->enable and
> has_connectors, which should be either both true or both false. However it
> does not mention which one is true and which is false, which can be useful
> for debugging. Add the value of both avriables to the log message.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
