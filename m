Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 974549FE5DF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 13:35:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062ED10E4B7;
	Mon, 30 Dec 2024 12:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D6k9wh+T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DA510E4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 12:35:45 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so114785211fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 04:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735562084; x=1736166884; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YjXNF8u6gFmP3bof4Qnz0c0Cqvunc1cPgbGWTZ/EO4s=;
 b=D6k9wh+TeqDEp22uXfDCWlUiBEH/ek+if2xRl9YSQfg6qg0srZGlZrw9eWihoZ8S1b
 /PGy8C2kqW4D3bALSsLmb2nyX5NsYSWsktah+DVWFyWP9bhHSU+AH55dma/Pwg/9i+60
 dn3csisIM2/gD051lqCdz7sXLjgALj2KCCWbqU0eHVIFn8siM1Wl2vI5e/ehTmGCPhV8
 U/cE0uh46uHFTBz82/I1yzSP3BquSXr6zYvWpr3mCANItCYm8aQJjuvEKsOrDTqMKZj5
 AidV1KT6kc4PpB4pDrcFgYCQpCOywQ7GuvC2sEOjNT1BGSNZInnjQseVo+P1KdizTYsL
 Nz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735562084; x=1736166884;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjXNF8u6gFmP3bof4Qnz0c0Cqvunc1cPgbGWTZ/EO4s=;
 b=rEofzs/WqSLRw/8Xc7yNJGFt2N256kXSmM+h4YVCrs2Of1gqwOxKRYGeu3wonyoUdK
 gD74QjtHLL2m4qE+Mz6qUIcLL6QGjQSJnbmVwzx+Z59JW8oG7YzBWT6F2Mt2C4X/ddgk
 cCHOWWZuAItSGYLAN6Ec+5nGpBtp099bNVKIWWj4bFJHSZfloyfFhK/FYK5Q2myB4aTC
 BaiVe+SSxwda5/XEp2YWNwZxH4ymqlwo3FmZeXWlgSw65wXIgKCVz6KlAledUEz43Qov
 t/GzB+I4hVtx2bVC9VDE67af6pPW+4iUh4hkSujntX2Fc80vLls/tfVkZmOkkKvHZYMp
 1vJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXyLl+P/Tl1x6J76l9eoVya3vvodU3j0Xx1okb7AmX5mj2Dkorb5TiQjSkGqAIUtljw4UfgOrYhK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy85IAmS4DdR+1/HbE/XjuwgSFPt9LEw3isCn3l8RfmgCOUC+N5
 FMHP4Li4FWHe44iiFcqxqJyhi8kjFiSfBgz7PD2L1DuU1s7E3qvKO8UY7ZeLgR8=
X-Gm-Gg: ASbGncs1mNxhuttd6a413Hq9CspxiKbf3XeqBM+wQWgHR4DUh/r/Injh8jAZxkNB7Km
 6BWNSk61Td/Zxa9dH0EczAKwz+pUY8uFYRxO6isBvQ0in/X+C2UOPHd54W2YgRiAo+lphAnrK9E
 YNpU+nV/odxoMDYNKiLqZsvZeYenm0EqJFYE7ZWMDE0lYOmQlbsYFponf53UoUoSpf2RW9o09ze
 x/0aGKzRRdEV0KagpUgQatt0rvrdi+poKTo2YDH7/iO/NfC+ms4HymCoq8E+Q10K6ItgmFtU5DV
 g1cGwBqPL5LKqqm4tD3Xtm/SwkrsvMcUf8YL
X-Google-Smtp-Source: AGHT+IGALgVEuR6VwAjmraqK3t5VKz84isdY66XsU2c6gkzu6ybhJpLRqnsbX8hjceGwE1pfjHVNsQ==
X-Received: by 2002:a2e:a69f:0:b0:300:377d:2c36 with SMTP id
 38308e7fff4ca-30468630934mr83167351fa.40.1735562082309; 
 Mon, 30 Dec 2024 04:34:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bbdesm34304741fa.44.2024.12.30.04.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 04:34:41 -0800 (PST)
Date: Mon, 30 Dec 2024 14:34:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 06/17] phy: phy-rockchip-samsung-hdptx: Add the
 '_MASK' suffix to all registers
Message-ID: <3dgfsscqpvlqzajjeav6oneeyae2tpc46av7hadgon5uwqibg5@ubziqwztp62m>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-7-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-7-damon.ding@rock-chips.com>
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

On Thu, Dec 26, 2024 at 02:33:02PM +0800, Damon Ding wrote:
> Adding the '_MASK' suffix to all registers ensures consistency in the
> naming convention for register macros throughout the file.

Nit: usually it would be "Add the '_MASK' suffix [...] in order to
ensure consistency [...]".

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
