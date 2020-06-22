Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE9F203B55
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 17:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25D26E851;
	Mon, 22 Jun 2020 15:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CB26E851
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:45:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g10so39308wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3pXTgzcjVOwvTxrnjgIPNbjQoMVzZLONAKcQJc4dpMU=;
 b=eCZjft2HDpve9Eo9DCGTC1GBUIUxUQB4BbyIfvl7mxQc7a+nGiuBW4O1chMuTz5Wmu
 23kFhzGclpK5sKnINBDx77tR3XQ2DjmfO5HcgGPthz2WeFTHIail8AncimbnA24bFs/5
 3Mtv6mSZ7KWixp75iMQCAeA2GgD0DZ75a21t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3pXTgzcjVOwvTxrnjgIPNbjQoMVzZLONAKcQJc4dpMU=;
 b=KH7nYLNcSqLsZa/jWbqHnKaTT0T64XswcNw1oOxXsU0aavgcVfHNvE1zOMqv2N2CtL
 3nrznenSIZI8EY6mx4jqo2FfmKXNyHCk973RVxlcfiKDB91Cm3YlzPukYFFc3Oi4lQq+
 IaY6swEGyMMQMGoKhBYl6T/4bvnoAy2KmYpfDImuAEV4J7G18aca28PvlAm1Fv8AtdhZ
 GV4SVn6JQgG5bIZlmk6T0GybRiopOLFa79BL/ZBg/fk9m1tkw5mBP/Y/+3nEHnAElkQi
 DOFqFfqzSIXJalQjzeoQHo6EEHZ+64zKNXtelybtvuYBepQ0e2NndcMdv1NudkWiqWmN
 8nMQ==
X-Gm-Message-State: AOAM533XT8MXVkBaCbjprfKkzTz6NpO31jIFxMT50jB157R+RdZ2T1Kx
 ucTxWAp6MkpYAfDaWjji6jM6cA==
X-Google-Smtp-Source: ABdhPJxwtp9f/mSns4DATYM0QPXSM6xAp/C11F+xFUSRhT+GCDKTeQfV4GCzZW24J0vrJiWg3VxjTQ==
X-Received: by 2002:a7b:cd06:: with SMTP id f6mr18978008wmj.8.1592840749368;
 Mon, 22 Jun 2020 08:45:49 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id z16sm9227540wrr.35.2020.06.22.08.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 08:45:48 -0700 (PDT)
Date: Mon, 22 Jun 2020 15:45:47 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v3] drm/mediatek: check plane visibility in atomic_update
Message-ID: <20200622154547.GA3503@chromium.org>
References: <20200622153106.112115-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622153106.112115-1-hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 11:31:06PM +0800, Hsin-Yi Wang wrote:
> Disable the plane if it's not visible. Otherwise mtk_ovl_layer_config()
> would proceed with invalid plane and we may see vblank timeout.
> 
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Change-Id: Id5341d60ddfffc88a38d9db0caa089b2d6a1d29c
> ---
> v3: Address comment
> v2: Add fixes tag
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 25 ++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 

+/- the Change-Id pointed out by Matthias:

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
