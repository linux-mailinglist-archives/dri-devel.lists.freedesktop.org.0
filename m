Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01969898796
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 14:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F9C10F1E8;
	Thu,  4 Apr 2024 12:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ROzCKU8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E86A10F1E8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 12:30:24 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-516cdb21b34so744120e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 05:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712233822; x=1712838622; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X20l1OIbEglZq76t9YzipvH9/8wF8pWqOBX+VeO6mJ4=;
 b=ROzCKU8BA3r2wDnTacRHG4xB6ZTmR+VekQYvs1PNMUfUxmhPyyMrPhxUxuU5Rc1eHv
 ONM3yrNeHschdUbMVuWr7tZMCO9MtM/MdVD9F92W63zhLOmwe3wunrhR3etNJwxWSiMY
 e72vEDlCdrSJNAh/fsVoKx9IOAcBw4pWyO4XkVRGd/NP3zTgg9AgBkSzRvAkTCEZu9xY
 Xf/KD3EfyOxseWPpfjHPFiNkr4T3bbDC9YJre/ibXl5NXx6/R1TXWhh4/8o24y8J+kvb
 sqOvjZwKp+RN7mCjQArSx8/c27HYVI06bB4Hcyigmy+PMpWxNOt1DTut1jP9pwvNeYjs
 Nm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712233822; x=1712838622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X20l1OIbEglZq76t9YzipvH9/8wF8pWqOBX+VeO6mJ4=;
 b=qkHQHf5CfDp/Q/8GisBX5svw3uOZzd0SnuI8sP1TifYFC/r4gtwQhJ7GfT0+KiX5vL
 diFzI7zdMrX5y8eAUmu1NQOnPxg6DuOctsxRQLKTU8Gm0av1l2mHdahHlkUK5SGAbVi0
 aefqfYjFrRPLo1z2zMSw8Fe6mu4yZxpACb55gcR/v8lgLNgELplry8UJ3m8A/rbuo+jD
 kaeW/uWaVvFXompnrXtlrBgYtXQyRpol1IqgW0DapHiOrT/bGZ/AlqecwsPSaYDuQWY9
 mGYR+e30AU4FbzKAwe3JYBbJ51EWSInLpFTqHfcV4EB/AnUD4C7bqU/Ox+KedAZDaMOD
 i8wQ==
X-Gm-Message-State: AOJu0Yw/cymIQndwaS15SW5G6/5ra0OhxecLPnmtYwbQ1oZ8Ny6q5kvP
 rwSmxLUxs6YX16HAktD1P+iYM26MKHhRJr+GmJeTkAbO8FNanfZseMVMNc+azfJResk3/2bLKom
 h
X-Google-Smtp-Source: AGHT+IFUb5zsg1JnqPSDM6WCJg3DgMPy79GM9WkgadXKzQqBbfSPE4iFlNdz1Kc4Oxni4f8yZOheig==
X-Received: by 2002:a05:6512:3707:b0:516:a115:4a4d with SMTP id
 z7-20020a056512370700b00516a1154a4dmr1578665lfr.68.1712233822050; 
 Thu, 04 Apr 2024 05:30:22 -0700 (PDT)
Received: from eriador.lan (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300::227]) by smtp.gmail.com with ESMTPSA id
 b19-20020a056512071300b00515abab7697sm2286667lfs.55.2024.04.04.05.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 05:30:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Adam Ford <aford173@gmail.com>
Cc: aford@beaconembedded.com, laurent.pinchart@ideasonboard.com,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH V2 1/2] drm/bridge: adv7511: Allow IRQ to share
 GPIO pins
Date: Thu,  4 Apr 2024 15:30:19 +0300
Message-ID: <171223381119.1231870.1373781151741394452.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305004859.201085-1-aford173@gmail.com>
References: <20240305004859.201085-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 04 Mar 2024 18:48:57 -0600, Adam Ford wrote:
> The IRQ registration currently assumes that the GPIO is dedicated
> to it, but that may not necessarily be the case. If the board has
> another device sharing the GPIO, it won't be registered and the
> hot-plug detect fails to function.
> 
> Currently, the handler reads two registers and blindly
> assumes one of them caused the interrupt and returns IRQ_HANDLED
> unless there is an error. In order to properly do this, the IRQ
> handler needs to check if it needs to handle the IRQ and return
> IRQ_NONE if there is nothing to handle.  With the check added
> and the return code properly indicating whether or not it there
> was an IRQ, the IRQF_SHARED can be set to share a GPIO IRQ.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: adv7511: Allow IRQ to share GPIO pins
      commit: f3d9683346d6b1d6e24f57e954385995601594d4

Best regards,
-- 
With best wishes
Dmitry

