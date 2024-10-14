Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2573399C98A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 13:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8512E10E445;
	Mon, 14 Oct 2024 11:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lYtZsv7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0CF10E445
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 11:55:42 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539f2b95775so1117728e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 04:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728906941; x=1729511741; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T/oxXTAg0PlYJqkRYS1FLak4rA2aWJDGdiaDrP2NuKQ=;
 b=lYtZsv7auukeg7iQYcuApmK3+9IQWKngXUM4Yop2MmAasnLU+D/bSRP9daXJV+cb1E
 Yy1bOUbXa91ldczdY0kyxGrUvO4uPer6LjXhE7cn5ehUjoSRIng2Zwud2UIYBl3g5gOx
 YXptwIoZdaVTX5BC7qNf+VejWSweBxOlMU/pB2NeyBo6huCA/6AMmEZY0zY4Lh93oGFO
 3I+3QJQVVI0AmYqKzwmT+iQXh9FNSBVRrk/8OjjqGQmYEmExvPFkRodCdF9MPdLxCMk8
 W0hvrO2c1S738skaE+kEYnfnxSHmtolsS6s7Ms1KlrOQBwJK2EL4fnLp7w60SAOZqqfk
 849w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728906941; x=1729511741;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T/oxXTAg0PlYJqkRYS1FLak4rA2aWJDGdiaDrP2NuKQ=;
 b=ZyYrXy39MGx9TELwGUNTP2yr52kB/xfw33VUgO5Ip2Ctw62jdgiGVHDEUe1rrpWs7q
 FRj/kxcN3+5cSpv96h/Qzv+AfH0mIhFRFBukfWnv3zhNe01nZW+s3eGaUhLoWVkus/el
 xJmqJugUawKlrWpSTvPBHz0br7qkAeOm3XFy4F1QhfSckvzkkTlLvvezGHN7SLQjY+Po
 WotT5k9Vd97Z2GR5zG1KrWJvSTliiewwGH8hhLKucZ+0SFLPEHfwy2Kd+H4ppOxFWn95
 wUKx8l+2jWwPv9jdfvtATiV5JpkkBKBDQF8omdHGc7uNOPxAyPQ/758/OzodbKrNiNot
 Gw2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW55aChITrlQyIIjGGSFpvAshm1II79PCzfjTPXJvHVdVtyDXYwOtEjx6CV7u55Y7GfBGcCs6RCc28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzclrqBMB1igFXLu+CKK1tmySOutYJHKr6allY4EXoPMGZ9snGN
 /Sp+3NruhS8Gj18bM4ZByP8TdmCXPiLExXbP2qrxUlF3JHKJBwJ8Iab5BoLf7Wc=
X-Google-Smtp-Source: AGHT+IH8rPkujKntCd/jKdFy7EZluu4nWyB6i94v8ZAP9Vh+vAG8UNERp3kK/+VzRBL9Ts67/Mhryg==
X-Received: by 2002:a05:6512:2202:b0:533:4620:ebec with SMTP id
 2adb3069b0e04-539e54d7713mr3536430e87.3.1728906940999; 
 Mon, 14 Oct 2024 04:55:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539fa326de4sm211972e87.55.2024.10.14.04.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 04:55:39 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:55:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 07/10] drm/bridge: it6505: fix HDCP CTS KSV list read
 with UNIGRAF DPR-100.
Message-ID: <s25g54atrkqjv6pfhege6eekd5fkx2orxwddevkotpoaphrldc@57mf46ksd4fo>
References: <20241001064346.32269-1-Hermes.Wu@ite.com.tw>
 <20241001064346.32269-3-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001064346.32269-3-Hermes.Wu@ite.com.tw>
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

On Tue, Oct 01, 2024 at 02:43:44PM +0800, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When running the HDCP CTS test with UNIGRAF DPR-100.
> KSV list must be read from DP_AUX_HDCP_KSV_FIFO in an AUX request, and can not separate with multiple read requests.
> 
> The AUX operation command "CMD_AUX_GET_KSV_LIST" reads the KSV list with AUX FIFO and is able to read DP_AUX_HDCP_KSV_FIFO in an AUX request.
> 
> Add it6505_get_ksvlist() which uses CMD_AUX_GET_KSV_LIST operation to read the KSV list.

Please keep the commit message wrapped at 72-75 chars.

> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 48 +++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
