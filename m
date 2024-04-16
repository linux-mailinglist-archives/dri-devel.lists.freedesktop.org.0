Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172A18A6017
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 03:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701AA112923;
	Tue, 16 Apr 2024 01:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W3WmV5qX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C54112923
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 01:18:21 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-518a3e0d2ecso4329339e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 18:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713230299; x=1713835099; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VYYp2/ymyynKr4E4UaWvwoSlif1IqUuPBOarTvfMGUY=;
 b=W3WmV5qX9I3qNbkL+IBsJDqimPUJAt09ui4W4buWcg+86jFJzwPsHOqBFtCM46KV6O
 PQdGuWkP1dOHN8OFI4RqwdYK+/gf+dwUE02PH2RJkhb/zM6iljB0OqhpTKGwYfvlF7Nc
 MDPTK0x7LPWYQJxQTwKEcMpxKVwwI9EB44TrS5Lerdxl8prIhtWzZhCQ9hhW/TAQmL/i
 0g4AJBKZdF/j2FcrTu205ycJ3+NChHTfERbODfprg3p3oWccmeToAxQDXdcfblDc49Cj
 MnnfYPYbXu3ldLVfmqE7IeqGO0rNqVklCiLw2bHnDe4H7Yqen9FbjoImTpGNhmNE1d8J
 2IkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713230299; x=1713835099;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VYYp2/ymyynKr4E4UaWvwoSlif1IqUuPBOarTvfMGUY=;
 b=FpK6yTdHhi/Kvalw9zMdwdP2m4BjDjy3Xv2XoYuqqTvZx1Dh4pRpaRcEirtDg8k39G
 2ZBvwiXuwy6dBvDT0Zz3NNswSOrx7jyr+P+Et37y09ZYs2JIS2ZE3weYix1qbf5VNDTM
 eDJqwkrBjpsAX5MbMp1lHgRnbwUm7kpR2XEjAwYIJZdHHM3KkZTteUtd7+KvIvN2RTcv
 hSNV0LhMDOLGIVWP3XrNr+W5DPejXj2xYj7LIICJko3hWD1L/tJLL9r6PxhSpmmLUUGL
 ZM/OtVBvCN9MS6qGBb9MCR6Ssi61q7bxI7R0hg1kxkBiq7RRYjX6j8KaPmR8jJvdcheO
 83Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5UeDSV6M+68pVEIZkIwa+SXs8vPtUHqBOHMuEs5QMBUggbou6PSKkuDmrM4iEN4upzQtcvWHOxjpuHTqiYrDs6CIbTOSnHv3Zu5X+Bwpl
X-Gm-Message-State: AOJu0Yy9xmFXgJXDSA/MoXnp3/iycIi44/Dw0CZJ1HWo2GFH8D+5c+Vm
 HiCCdoPVaitMgBNsxPNuioYNFISGjmTyaLW4CMzdkQZEwWMT7MEWtol0FrDjWVY=
X-Google-Smtp-Source: AGHT+IGtZaxlgwAHmZ/z2k0KkTHsoUAQLBPMNvduRQSASeruObRUVt30aWE4VNZTKGFu/1BexV9HMg==
X-Received: by 2002:ac2:538c:0:b0:515:9c73:e29a with SMTP id
 g12-20020ac2538c000000b005159c73e29amr8603965lfh.66.1713230299475; 
 Mon, 15 Apr 2024 18:18:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a056512304f00b00518e1e77eb2sm493616lfb.179.2024.04.15.18.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 18:18:19 -0700 (PDT)
Date: Tue, 16 Apr 2024 04:18:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 owen <qwt9588@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Marek Vasut <marex@denx.de>, 
 Adrien Grassein <adrien.grassein@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Bjorn Andersson <andersson@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Christopher Vollo <chris@renewoutreach.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 4/9] drm/bridge: lt9611: Don't log an error when DSI
 host can't be found
Message-ID: <gcq33bcaindlrllyhjdcmfvn4irmr5onisekajdxji43rsrpt5@g5cbavz5xfcs>
References: <20240415-anx7625-defer-log-no-dsi-host-v3-0-619a28148e5c@collabora.com>
 <20240415-anx7625-defer-log-no-dsi-host-v3-4-619a28148e5c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240415-anx7625-defer-log-no-dsi-host-v3-4-619a28148e5c@collabora.com>
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

On Mon, Apr 15, 2024 at 05:49:32PM -0400, Nícolas F. R. A. Prado wrote:
> Given that failing to find a DSI host causes the driver to defer probe,
> make use of dev_err_probe() to log the reason. This makes the defer
> probe reason available and avoids alerting userspace about something
> that is not necessarily an error.
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
