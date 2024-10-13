Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC27099BCC1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 01:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9521710E255;
	Sun, 13 Oct 2024 23:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z7o66zVy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4756B10E255
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 23:36:26 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2facf48157dso36077241fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 16:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728862584; x=1729467384; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gtsIDsXd14fK/gP7UyoWpxQjzyKDGOWRk0Y+VS/K1j8=;
 b=Z7o66zVypAoBxCaNZD2agzH+yGosiE6ZPycpmxRnV4rTKwbBn+mJjGgXGD+YE7H1Y2
 6+Gb/BV4CucCXK+AB6ikPMr/Q9m7/oXnfJlCjCglV68pwySDEkpwYyDafHv3zgcxWn4E
 7y681LNH5Ih+TlDOMq37aR48HtXasG9yU7jfzGytTir55c+BG/NBiDYgtnqY2/hyKnl9
 hz4RrAvGQil/FmVmxDxwp7nvXfj2l0POiEjRrYQxmcIuw6XBRfk5+8A2N/jBwQMtUQ5M
 OvlszaiPox9hDmG8kRML6ODG38MI177bF95/JamI7fal2PJx8F3bUJXOvP0vQF7DsbFu
 5hzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728862584; x=1729467384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gtsIDsXd14fK/gP7UyoWpxQjzyKDGOWRk0Y+VS/K1j8=;
 b=kiRr+z/20Y03zWEL7SwybpH/DM2N7e4U8cqNeJPZwRfE9Pl85hWmJlYoRcdARePUPp
 U9azDBoaKS6Tg2xwJZdgHmyilSvPeO9oPlHxyMjK6pCzqUuvgeLa4B27Rw4QM//KM/0V
 t4ghrsu8Wdn0rDgUyTD+N1jObQunzTD1ALLQGTxGQizymBPKZ/coqo9L1tyfyFfTyfvf
 zRq1AQixPQgOvI06bQIkTNfQg138X0XpPQwJVkkKCJkIwrcYTpsJM+nm/SKFwL0mqHMS
 Xms4B3dThHA569O7gLu3iz9/2Vu5TzjslKLn2eUB4njCmKV6DFkeKD2t1QulHwrAr7Cy
 H5Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL9XoXu3grqb8rbydhHh4G9Gq2EH6txPeOMlM8JsbgzHzBgfd5bxNBoijkOXWm1480ThcqKdHd8HE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFiiAHtfLKgC6K/g9fBHOkI7jf9P2izclclWcBAFYwRzgMmdc+
 8EcBtkeHF5SLaYBWwpuliA9hnGpSR3CUcoKecZ3Q56Ei4cvJYAsnCPXSWycbPNI=
X-Google-Smtp-Source: AGHT+IHFwXgR5icPxsw2kqPcp+dhlQDcfwPu1bgHs8JR0lE4su8aTVs0S0kQ1stHQt0GuBsK4gz6+Q==
X-Received: by 2002:a05:6512:3b9c:b0:530:aa3f:7889 with SMTP id
 2adb3069b0e04-539da57f62fmr3626492e87.56.1728862584125; 
 Sun, 13 Oct 2024 16:36:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539f1bb45ccsm363614e87.273.2024.10.13.16.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 16:36:22 -0700 (PDT)
Date: Mon, 14 Oct 2024 02:36:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@mainlining.org
Subject: Re: [PATCH 2/2] drm/panel: Add Samsung AMS581VF01 panel driver
Message-ID: <gdan5zalxmcvtobhizxefemfevn3qkqiflwcmfdhw3v5fwdlex@ozfpn3ejaeub>
References: <20241013212402.15624-1-danila@jiaxyga.com>
 <20241013212402.15624-3-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013212402.15624-3-danila@jiaxyga.com>
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

On Mon, Oct 14, 2024 at 12:24:02AM +0300, Danila Tikhonov wrote:
> Add the driver for Samsung AMS581VF01 SOFEF01-based 5.81" FHD Plus CMD
> mode OLED panel support found in Google Pixel 4a (sm7150-google-sunfish)
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-samsung-ams581vf01.c  | 283 ++++++++++++++++++
>  3 files changed, 293 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams581vf01.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
