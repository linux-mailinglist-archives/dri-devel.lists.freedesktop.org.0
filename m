Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F5E8C9745
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 00:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D849510E24B;
	Sun, 19 May 2024 22:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EuJwXeWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3CD10E2BA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 22:26:59 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52327368e59so4133192e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 15:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716157618; x=1716762418; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kntjofAjVrPtjfwG/3VjdEX2fgrp/tTQedXHTLXviaU=;
 b=EuJwXeWyfoxOP90xQzVziZu0ORlv9vI2P4brkVwonN8rOFqvaa0+2q5duAjAXT1HOL
 w8zfyzLKodemN4fwrVr5JbKBBuSVwHLzOry2pKDwNuyN/pZ0EsOFkjp6XkWC5iK19rCU
 klKpdKbpC8Gr1lGYF7W+jqF0NfdvqIIpRtBqrp90napOzQW5EwBmmsQeDFTIEb5So7c4
 SEF9KsoZjue6LpnvIOGWYREYiRnz1tz1UcRZuR/gpJb4IdyUVkqPB4k/MlikiRX5qiJC
 AhUCcuwJJ/GsDhjoIc0wMObFGf9+/PJGickrFTWmbQOyynnAhCJB2g9mdNGvQlGJecxq
 mgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716157618; x=1716762418;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kntjofAjVrPtjfwG/3VjdEX2fgrp/tTQedXHTLXviaU=;
 b=qa7ZT9DrpQlaf9E/7iRoWFmmf5J7T/qOTaLaWUDAmCwdjxYOwYkdcCdkDk3Cdzgahf
 D3yjMmkTG7hsCrmNV5Lo28Y1J94MT4N+C+AID0hFbIaTKD6RlsPXyVYQWeResQQ4kWPe
 EnmPMcIYJLH1qXpbm8ODiqm5DupJDJX1Wzifw2UzFoX+8w0QXm3p3BptKmcOM1hkblUn
 3hvP4LOf4a2sE7UTg+ZaIOKXBR4brHruL6paJ/m+ZinBi7NNm2eYQ+Y72TL0PVKlISUD
 e2hIlxjD+H2FyX0AbFw6ZxaCeba6M2QV55I0nqTLx31R0fSzSSMlD4RX/3bRPEwrfmWj
 TcOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2Om+6VWInyMfdMfj4+pGsJxUvnYAdo2xLD/TmdiDK/nOEXRResmC8ybUfBNS1IKOhG/q0lEQ8i/+bV73MOkTaarFJMAmfkbqOyxmygkps
X-Gm-Message-State: AOJu0YzxqNcmm5xTThehUxb8I9kiqz+hGb66kDwvZr7faRsrVGakJRY/
 p50pmzPj0y5xha6VUdKe7sMA2/l/d1lsfyXyaoYpGVxeGNAPgp5h5+/mxGpowC8=
X-Google-Smtp-Source: AGHT+IHSVkTQw6fC/AOFOdi2o1xjmtHUhk0iYyMSoh6STTi619bhD/w7bGvnjRDe3wCN8cIvVh7axg==
X-Received: by 2002:a05:6512:3683:b0:524:34ad:ba77 with SMTP id
 2adb3069b0e04-52434adbaf2mr1252703e87.12.1716157617932; 
 Sun, 19 May 2024 15:26:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52399b5065esm1717187e87.38.2024.05.19.15.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 15:26:57 -0700 (PDT)
Date: Mon, 20 May 2024 01:26:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] drm/panel: ilitek-ili9882t: If prepare fails,
 disable GPIO before regulators
Message-ID: <6zzgvutlhm6wg6y3rj6fgcbiwl4rxy4wbjsocxezirhtafw24y@kakchlwtlybg>
References: <20240517213712.3135166-1-dianders@chromium.org>
 <20240517143643.4.Ieb0179065847972a0f13e9a8574a80a5f65f3338@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517143643.4.Ieb0179065847972a0f13e9a8574a80a5f65f3338@changeid>
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

On Fri, May 17, 2024 at 02:36:39PM -0700, Douglas Anderson wrote:
> The enable GPIO should clearly be set low before turning off
> regulators. That matches both the inverse order that things were
> enabled and also the order in unprepare().
> 
> Fixes: e2450d32e5fb ("drm/panel: ili9882t: Break out as separate driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
