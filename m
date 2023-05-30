Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4381271713E
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 01:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593F910E438;
	Tue, 30 May 2023 23:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2020910E437
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 23:06:14 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64d3bc502ddso5907333b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 16:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685487973; x=1688079973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zao+usj1MFnHO0lPVaYxKTWIh4Wrl1XUDw1PK7J3fWM=;
 b=JxW2OPW0HQsH3SYq6o+okCUEhDYhLDsnK1IuCG7HA6xFymgskDPQOJb3fsdobb+33b
 OytwBRj9myGzf6KufZCXuq8v1N449uBhWYJDYZr/WDjiEjkffVePnp2koTcOUJletBb3
 V+wiOOW5qxMjHFzU+yLJCZPoAi1X2q/uS84gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685487973; x=1688079973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zao+usj1MFnHO0lPVaYxKTWIh4Wrl1XUDw1PK7J3fWM=;
 b=aHcbMXOxnplzjVjytV86udm+b4YFBA1pQuzgbhXx5zF4CqrzfXU69GCtuQHrtP93Pe
 n+YfXMCmjPJq4uxvYkTnSDzrngJz2BXRJ/l+7mj87nDgk1kUoGgfBiWz6fHoPwB2djHG
 2bIeKk4a5o7kY6O3FCkGKsdZlINJ7+lJMKGvLCWwVLTdmmIj6o96vxMdlrjRUQk8EUm/
 7htYRUPRi/zbdLhbFnImZLcFkqiRi4KsJ4pGaXwX/v4lVRRwIvg5xy+S+V0f/woIUVu2
 IOXbpGGvXpIP2jWihgGWJnpLtht0on3l/WKwXS0T9Qau4rxFPZYvJ2d4M2tilUoCYSZ/
 071Q==
X-Gm-Message-State: AC+VfDwpY7go+sxIaVALTOrEHiDsMXKaov+29acucAxcTov3oeHkprOv
 uXiRR+n/r2qxZKh7J8vVUSDmtg==
X-Google-Smtp-Source: ACHHUZ5D1+tV1+lvxmaVwvByCrU2SFfVv0srtnoQzi2H74dwcr6jd0JM1qdxaJAJFzqXVqgoNVS1HA==
X-Received: by 2002:a05:6a00:150f:b0:642:fbed:2808 with SMTP id
 q15-20020a056a00150f00b00642fbed2808mr5705307pfu.25.1685487973579; 
 Tue, 30 May 2023 16:06:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 d4-20020aa78144000000b0064d7221529asm2162683pfn.32.2023.05.30.16.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 16:06:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: heiko@sntech.de,
	azeemshaikh38@gmail.com,
	hjc@rock-chips.com
Subject: Re: [PATCH] drm/rockchip: Replace all non-returning strlcpy with
 strscpy
Date: Tue, 30 May 2023 16:06:04 -0700
Message-Id: <168548796306.1350188.1085117815557149174.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522155149.2336620-1-azeemshaikh38@gmail.com>
References: <20230522155149.2336620-1-azeemshaikh38@gmail.com>
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
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 May 2023 15:51:49 +0000, Azeem Shaikh wrote:
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

[1/1] drm/rockchip: Replace all non-returning strlcpy with strscpy
      https://git.kernel.org/kees/c/3bc490653e12

-- 
Kees Cook

