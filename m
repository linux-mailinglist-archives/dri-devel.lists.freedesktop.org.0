Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4308C9B44
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 12:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDDB10E467;
	Mon, 20 May 2024 10:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="heIlTYju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A461D10E4FE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:29:13 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5206a5854adso2763661e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 03:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716200951; x=1716805751; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=p5BgnpxvIdvwCUBBX92qJk66NJ04cMwQMD5QktP8CYA=;
 b=heIlTYju9lc627lII1h33tkaIhJ7hrJp+6UXAXokI7f4zYCE6zI2uvulJbYxXl42RI
 a9v/v57hx30CcxoGabtuQVywxqR/1IGgl+CYPp7Z54+nO/z7UVXGTr74poBteeWWYGDE
 fjpV+T4MU0MkI6iL9AhEFlgV+FuZgEKRLz2kaXiLtpP7PisMV7+HWMro+MoCC/mLnHXY
 THN2V3jgpF+40WRlg+4HJzTbiXt11L0yqQDn+fK/2sHZDFMWMOZb/eyc6JiY6ZCi85H4
 L19c+CK3ELuw2xApWkzNa1eetZ148vTNHU68JfDnp3C7KVJ7LsbaVJnQVS5r4Uf4+ZD+
 AdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716200951; x=1716805751;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p5BgnpxvIdvwCUBBX92qJk66NJ04cMwQMD5QktP8CYA=;
 b=fhQTfcbyxWy3dybolG9ubjuk/RSRUE14uOYSCShabYeMmgg1SDL4H3VH90Pr14ZrS2
 b3C5lkPtXhDukwLFJqJpxpA+iM9IXnSpeaz59xlARlAr98MzatcxA6Hg4EWUMi1Harp7
 Fz/lqvjTd47E81cducIfGXtFgb/GnJD8UTn87s5HwlrO8i7TbDD7L5ruKgCQLXTvQmlC
 AxUZ1tyW+ReajugcRRKtfnLAUTryIrlkRLCAxCq2KXYz9qq9DIDtNkRCI6/KkPsBHibb
 4ltIVh5NB5s+asE9sAjoBU2ggyv6sA5KmNPb4tsdNUyRsDn8jzEH0DCROVd08pNFMQik
 0+Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFYzfdUtZOWxLiTNeq5RIpgbhzAcHEy5ce7JDQ6CBdN604kVt3tbUGYOmHhE9r/lIn7QbrWxGunERHx3CCrPRGiJmeJwpKyFysfppFKX5q
X-Gm-Message-State: AOJu0Yx0cgKlAsuBL68ra9agQnTfvYi2zt+YHkF7jlPdX6OUrRGMn8gy
 vsdOM1FP6dboKteTuHkn3I6aAFXyxwT7q9y2qDotiTsuxrcv0BCSVAOG+XkpBt4=
X-Google-Smtp-Source: AGHT+IHbw7vdPZW/Q/3B127sO5ThFAPWGOkk69KJmFFZ4bAg3sJj0kVFt4UGPkQjZh5b3l81NcjHxw==
X-Received: by 2002:a05:6512:459:b0:516:d0e3:9275 with SMTP id
 2adb3069b0e04-5220fc735e5mr16898943e87.11.1716200951305; 
 Mon, 20 May 2024 03:29:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d33dfsm4221651e87.139.2024.05.20.03.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 03:29:10 -0700 (PDT)
Date: Mon, 20 May 2024 13:29:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, 
 Caleb Connolly <caleb@connolly.tech>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panel: lg-sw43408: Fix an error handling path in
 sw43408_probe()
Message-ID: <e7dvsrbaaltfqncnlxh7fp27ffkaeylpsih45lzfsawz3vdqih@btzvr72epgrp>
References: <b8dfafaf1516b33dfc21e9ad27e31fe2a5820a5c.1716197626.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8dfafaf1516b33dfc21e9ad27e31fe2a5820a5c.1716197626.git.christophe.jaillet@wanadoo.fr>
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

On Mon, May 20, 2024 at 11:34:31AM +0200, Christophe JAILLET wrote:
> If mipi_dsi_attach() fails, we must undo the drm_panel_add() call hidden in
> sw43408_add(), as already done in the remove function.
> 
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
