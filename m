Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC2F8C973C
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 00:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C19010E1F2;
	Sun, 19 May 2024 22:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NIOrUV5h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0352D10E1F2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 22:26:08 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52192578b95so4284024e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 15:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716157567; x=1716762367; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z/u++8bFOJXJXg3s1d2RW1md24+mQv56EN7QzDG+NR8=;
 b=NIOrUV5h3Ldm+f2pCQR+Kf5xL92qeeVGm6Bzwv3UhhsbJncy++f51DIQA1NzH/8KSD
 YvAup7DG1njFM7wMbC/xuLe2PlQDpgBTX+AMnca/ul/UU7fNZIodPOvNBwKTcthsiw7m
 YiBiCjh9469YzJSK9LHNDM4+kdNDEM0Ax277oepRc8qDkTv+rgDUY7DEBxFfaHZd63YQ
 6EXYdM2WzczwbI6vdP5E0qw9dLtKugvFL9CpVCBslgW9sxOx7Wod2xw7x2bdbBMa8w3b
 SlIMg8DToPEHRx9KvVgATvaZS5yaPWyvcC2sHNqrYKc9jFpDOlXnNwdAGf15HSf+oakZ
 yugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716157567; x=1716762367;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z/u++8bFOJXJXg3s1d2RW1md24+mQv56EN7QzDG+NR8=;
 b=wgr36E3cLpZvl4imhTIoB+FV6Bf6UAFPUoRskH671YWUruMnjqyu3einI6dp5qfWJ7
 orSC8RrQRgh64H2UmlqxIDIbMyXKuCs68Pcwuc0tRDJ8IMDXi0P1ovuRJosDhrtJ+OWI
 uxnbqUX7Lp/ip2U4jhgGxp70mMgIZUZlPOxhWzHFYaCE/BD6+PCi0SVifLnbpkSYenxw
 9Z/fDAIJ45BryRfvGUhHZog4j5WuycR1jMxFE4361GoKWLkZImJFDtFuwQblE1NdMpXB
 N3GQ1H6/H7T5oj9hB7+DF/K0z2TvjSoUbV9J5UcGPwhN+o8wimELYikFg0yKXEOdmsGv
 1vIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO23iekkrSgiO1XDUJ5cSIqCmqZ6+qpVFx0F9jJQt0zhrgbBIlxkiyHgZUMEct4RcE8KjwXy6fCVh0+eHDond1ix+jQF3HMlo/+G8PqsoG
X-Gm-Message-State: AOJu0YztqcL8DoG9KRadvfwR4aJlX7L1Y5nT/Ls0abGFTG3qBOW0DJ8e
 usfwF1XODfVmw+kL1jbnrmjZWwUiOix7K6F6/SFsAM5i+Xl+e166K0j0XJGBCZk=
X-Google-Smtp-Source: AGHT+IGQia4SqEUkbwCkX709KmSNyhDWioQI0WkTu6egjizDz5WsQ+KjK82NteBuNryfZ5+wqhg5hA==
X-Received: by 2002:a19:914e:0:b0:51e:543c:a45d with SMTP id
 2adb3069b0e04-5220fb6afd8mr16210701e87.20.1716157566952; 
 Sun, 19 May 2024 15:26:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d3418sm4047465e87.152.2024.05.19.15.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 15:26:06 -0700 (PDT)
Date: Mon, 20 May 2024 01:26:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] drm/panel: boe-tv101wum-nl6: If prepare fails,
 disable GPIO before regulators
Message-ID: <mge77nka7mh3nslbaoxpecnbmukv2z2rjk4rqpqo4r6nxo2733@nrhdblvxajuk>
References: <20240517213712.3135166-1-dianders@chromium.org>
 <20240517143643.2.Ieac346cd0f1606948ba39ceea06b55359fe972b6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517143643.2.Ieac346cd0f1606948ba39ceea06b55359fe972b6@changeid>
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

On Fri, May 17, 2024 at 02:36:37PM -0700, Douglas Anderson wrote:
> The enable GPIO should clearly be set low before turning off
> regulators. That matches both the inverse order that things were
> enabled and also the order in unprepare().
> 
> Fixes: a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
