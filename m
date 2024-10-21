Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980369A67BA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0421110E1E4;
	Mon, 21 Oct 2024 12:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BnKX6ZcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B7510E1E4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:15:36 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso67298591fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729512935; x=1730117735; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ixvYPjSjHOI3A6bs62BEm+orBMViEbYtWgKUxWp9vmA=;
 b=BnKX6ZcIGBtWE4atihBDVcsq45ofE4JDcjRBHAO2Juzndb/3TZ8rT/mz6ZC2jaenpw
 YCIl3I6f+mSp3wpBE8F23cELeRITIINtXd7FNfTJgTReXE2iBzp+7EdJRffs5lL7kKAh
 pBwKH7W7GYeuCeFx6xiudkpmYkipb3ncO7eHmTBqs94yjfO9d89BC0uDsaFU+zT/lzjS
 OxkQeSQ90X5O3UXmnL6YN4cQVV20WtdxcrjMw0i0uoRjUDlC3xKSyZdyDe7s2tbTp0bQ
 etxLR/Z/Z1H+3i8X+fv8YKHUs64Z8sB4a6PH0Ds2PropppCm/x/hvgx3JMhNNh5kiJU0
 ly1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729512935; x=1730117735;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ixvYPjSjHOI3A6bs62BEm+orBMViEbYtWgKUxWp9vmA=;
 b=g9DC7u58tEXWuG2VgRYHoDsQTVbsGGVMHef++51DlH5BAdq3EJOQHg9b6RVxrc+H5/
 4UykwCH/yEOhzQqpUXwPZLTrEwO21OMRze4Hh/s+UPq+RXqnZGw7b9TWF63EEAPMUaPR
 sJCR/IG/m5LPkK0abGyopiMqFlXnPAAvx9KDaudQ10kSrY04N356nBjLMapcGY2REWLH
 FyNaHlK2z7UoVjPx2wGmofOfFl0x0cAXwAwjYybPXEzNBfpi8FnYhr4h0vY7kfo7H8Py
 5JSaMLxpKZgMGx3oYo+lgviWvD52o6B1/S0EWZN05MEchBADbTpr283D17ywlploJv94
 Emiw==
X-Gm-Message-State: AOJu0Yx8cubNKlwNmO7ofiUHDqUqIhD1Mvax78Q6oqhsqew5FE2zW0rl
 Jt3F0z6du+Zs8gIl28yCXNGUJKSrhm1CckhRG0kXrnayrzAjDfQjpKJeLo+IiqE=
X-Google-Smtp-Source: AGHT+IEkcKoatMCDEuy5jqS04CW2sFmKYlfJWSMdE2NyRaxseViNDhyaFOJIPHQ/mBlzZ4JfzX+iAA==
X-Received: by 2002:a05:651c:2124:b0:2fa:d7ea:a219 with SMTP id
 38308e7fff4ca-2fb8320f101mr78774851fa.37.1729512934612; 
 Mon, 21 Oct 2024 05:15:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb9ad60d95sm4785161fa.33.2024.10.21.05.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:15:33 -0700 (PDT)
Date: Mon, 21 Oct 2024 15:15:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, 
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 06/15] drm: of: Add
 drm_of_lvds_get_dual_link_pixel_order_sink()
Message-ID: <zaraulehid255ij3hs7hazd463ye4l5ju6sguoos243kda6552@lztoq22vzqyk>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-7-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021064446.263619-7-victor.liu@nxp.com>
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

On Mon, Oct 21, 2024 at 02:44:37PM +0800, Liu Ying wrote:
> drm_of_lvds_get_dual_link_pixel_order() gets LVDS dual-link source pixel
> order.  Similar to it, add it's counterpart function
> drm_of_lvds_get_dual_link_pixel_order_sink() to get LVDS dual-link sink
> pixel order.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * New patch.  (Dmitry)
> 
>  drivers/gpu/drm/drm_of.c | 76 ++++++++++++++++++++++++++++++++++------
>  include/drm/drm_of.h     |  9 +++++
>  2 files changed, 74 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
