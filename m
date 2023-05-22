Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D6970CA9B
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B103710E370;
	Mon, 22 May 2023 20:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18EF10E370
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:15:32 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-64d5b4c400fso2396095b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684786532; x=1687378532;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qUSVdvb79gbFeSBJR73SGjUk4u7N4upLsGKBG6cFJho=;
 b=d11p2MvCaOb9DoRlM6AqC75l9/TUamQDOrS4u48NcKgH9GH6J4JPrMKK18a8tUR/LU
 iYPejOwfb9QSEG/SUBcp0ItD07IbC5SLO/puDtWsARfYOpbtRDOshBvSPAvq3U97snGU
 Rl/nd1M85ilGLAVKdf7X5MSSGgcMUqX1gysQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684786532; x=1687378532;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qUSVdvb79gbFeSBJR73SGjUk4u7N4upLsGKBG6cFJho=;
 b=lDIGPICLS4eEIqewV6L9BVVLvJ0Dy+x0aI6bT6dQxbQ0JHWHuZ8n3xgk8Q4gtfvjdc
 GNwrhXwdU8WTpj5o/7ai7tTMLeKxpmS2pXNJFv1w5208PdX7RCmR8y9/OrRv84hapTDb
 Y0VJpz41K/MTG/jrhNoAGD+1gDU2se8ikejdibliLq4M7PnsQ2lnkWfcAc2WBauTq2lg
 I2GC1qXlzgmq9/cfhmBobA96dLxZtxYe3BU8RXRsVtE3kinNLCsTL4bdMvst4pYQeABB
 lZj8Rd7Bvpnq803jjLidZk4z8KZ1U5WPVSkWv9b2zLrIGZwuiDnUSpNs9Me/98zDqdb7
 Y6Uw==
X-Gm-Message-State: AC+VfDxvwq3//PwmAx8xKku6BxqW5Zse5cSv+dFw+Es757b8WuPwZL6g
 ihXOvtlF2iTCjryYycvw3x2VJw==
X-Google-Smtp-Source: ACHHUZ4VR/bDiX3LTGczRv0D8hkVMKl4vQGKQDUaV1gV6VAWekr1r6jnhzrZ2egrciE2eQESOZ5R/A==
X-Received: by 2002:a05:6a00:2282:b0:63f:18ae:1d5f with SMTP id
 f2-20020a056a00228200b0063f18ae1d5fmr16955940pfe.29.1684786532020; 
 Mon, 22 May 2023 13:15:32 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 m8-20020aa78a08000000b0063ba9108c5csm4585207pfa.149.2023.05.22.13.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:15:31 -0700 (PDT)
Date: Mon, 22 May 2023 13:15:30 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Replace all non-returning strlcpy
 with strscpy
Message-ID: <202305221315.8E1A18B4A@keescook>
References: <20230522155210.2336690-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522155210.2336690-1-azeemshaikh38@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Guillaume BRUN <the.cheaterman@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-hardening@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 03:52:10PM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
