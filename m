Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47683717140
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 01:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721D510E43A;
	Tue, 30 May 2023 23:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD6510E438
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 23:06:15 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5304d0d1eddso2594914a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 16:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685487975; x=1688079975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XTDjzev2g/dFwqXAbBNLlrXlZTn+kHPstDE3zCS5cQY=;
 b=GUpfbl+sC9QIc+kIV56cwMaviZrBRnvqS3CIUdUd6vOC1zkRyJf4Ad8fOhD5VXs0Lf
 8eUIAPNzc6PnrKqn7mCyaAW81LriRxS7r48I6U0BXV0AaQIjsEdckuShmd32VTbQXR4J
 Hh96JXPWeuMwLpRkDOYsuLjQiUxaXAteiTWYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685487975; x=1688079975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XTDjzev2g/dFwqXAbBNLlrXlZTn+kHPstDE3zCS5cQY=;
 b=CQ6eNya/G8IYgP1V0gPbLo2ZsqqVfrAdnyTX+jcgBh2iyvQJgdXMAb4tKR/BSBQOKd
 rVoy7x4HZmj1HZmY/QIyaRt4T0Te7nIXZ6Q6HVTjR5CIzJs6K5lzm75rEbWh3glBQ4NF
 bq2NvS53OST0k2QCjRG2k16UdBxuE+D9EVKOR5wptRIUBm16RdT6AZQ3qGv0W06NbF4C
 uRVbGMruTza1hDs2N1eqZfADAtI9xuSUInNqCUiH9UyWmYAfvoPQxQIP8Xynppik7ffS
 iGxdQ79AadCSNJ/4TvbAqKYqEtC8Jhe9XB5wYF1LKHPCwpXU1WO0FBSNWHF+J8g176Xm
 DO4g==
X-Gm-Message-State: AC+VfDxi2ohCvr+zXyh9YdDLwM42boWTtLJN13jK9ZlLIteMRdQKWZvw
 sMQOP0rYmCbsVJ2Ari7tRgceAw==
X-Google-Smtp-Source: ACHHUZ7lVzzQbfe9FHzoVRjHe+lwb9YnUIYN/bR8MPHORNI3UhJpQCoHt959/WC7Eg62hE/pMm6l7Q==
X-Received: by 2002:a17:903:2449:b0:1b0:42c0:93b2 with SMTP id
 l9-20020a170903244900b001b042c093b2mr4463117pls.45.1685487975185; 
 Tue, 30 May 2023 16:06:15 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 x7-20020a170902ec8700b001ab1cdb41d6sm10800248plg.235.2023.05.30.16.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 16:06:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: azeemshaikh38@gmail.com, p.zabel@pengutronix.de, chunkuang.hu@kernel.org
Subject: Re: [PATCH] drm/mediatek: Replace all non-returning strlcpy with
 strscpy
Date: Tue, 30 May 2023 16:06:03 -0700
Message-Id: <168548796307.1350188.12826442108899002892.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522155306.2336889-1-azeemshaikh38@gmail.com>
References: <20230522155306.2336889-1-azeemshaikh38@gmail.com>
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 May 2023 15:53:06 +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] drm/mediatek: Replace all non-returning strlcpy with strscpy
      https://git.kernel.org/kees/c/99ae1670e488

-- 
Kees Cook

