Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECD0BFABEE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 10:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F4E10E6EB;
	Wed, 22 Oct 2025 08:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="M/g36IG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB5610E6EB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 08:01:47 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-33292adb180so6510191a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1761120107; x=1761724907;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Czcihnqa+RdFrhOYT/oFUcxYUUGz6vVNGz6e5p2QTY=;
 b=M/g36IG0VOu8YykTgpTUj8+Rsit6BP6TKG0rusNGqu422iO7XxaP5ZgOulAWiBBk3G
 hvfe07lZNxwDhkJ+ArTIC6h/4YVFh07J7UxsJfMYa52G7mAAxWJyUADnD0LTSULGTdD8
 f79DN7ffjRN7uQdVoOqqLD0/3uBHBf77QrLJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761120107; x=1761724907;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Czcihnqa+RdFrhOYT/oFUcxYUUGz6vVNGz6e5p2QTY=;
 b=dFxrGKBi+orGGRpQw9JYnDuU6urIvrKXDH0Yiu8y/lE5gZPugT31ztSR3wKzkWfw3g
 JfdOUq09qPyFgj+ZmD8fXG8QzdguKXQqwb4VTmj6pFRaKXt/TEqBCzwbJqMzg2XD7ylM
 fIuw2StIaZFVjacAZ3xnpnHpZh3gf+alMUVVI+arX4DMFrpPHqZi8V5bdx0Fd1eu7p3R
 jjEdU9dh3Cj9A7pt+muCcjMVYsLXGc1dU+ll7su5ZGaXgJEyBtd4isCk6CntPXPzj3P3
 KrkleKP/yXwm5ANkBgIq720rds1winz+PcyeNdYhonO3q/9Du6u4q/WEtyPKtxdXJhkQ
 Pp5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuFmE0khc1o5/wFe/8yvwLlAl3tizZ1nsXAVcaK3c8IL8FlI+5mKGxnHqBLOC/xFhCIGZsRmDAfpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJRL4cCMV/bdOZ2QSGI5+wNrD6/sZQ7o4l21/i9EHfpV2v/nw8
 tk0I0Dny8CrSNLukxecEWeGOLXah2Mh3ZT/wWMU4Ku/OML2qjchNs/kWmVsNvJ17hQ==
X-Gm-Gg: ASbGnct1SOV6crvbUAN8tLTC5EQFGIZTHYNGIlkS8jOhCtzMal7hFIIDNA/on6ipQMY
 bDNTnl/GpJhpSy9BAKK9DZERnmh7kxh3Y/oNyIz3ygk4qSrzAYrgi2sRARAWfWlhionEAvFz5x3
 xPdUhwx7aJjEhFENrcwas/lMttN8YJDr55rDuBaNdsZaZJ01KYuz1UXrluGnYOYzP3qDyC/bkXD
 lbGJQVX7bEqOIVhVSW9olAh1q0uNAEePkCjY060oC4UeMRs2jJCoUrjZS8Gnnv0KNPJlxcofHdI
 RY92HaXSMajgXqRWX+oOqUkS+zXt54UVoeI2jPdvPRV/Q3oW0nmeTfnz3Z2pm0DV6MMcmtePefN
 w3RmMpy5A+BJD86AXY/HhSPuPS8Dfb4yLmvrAAA5yWQ/Y7907qQOGxivxefth2hfUNRXnKrYI71
 NmBw+aVc8QYiwLmNkM7rE3l4Ym6y6BQ+N1ijxihhTuafvhKrDG+cPs
X-Google-Smtp-Source: AGHT+IEt15ezmGTqR4A8CJGFXTvCgrS4gO8P9rtkeOmGm46bHNcAFHWrZsKB4y1EeUubGMyQT47cig==
X-Received: by 2002:a17:90b:1dcb:b0:33b:b033:d7e5 with SMTP id
 98e67ed59e1d1-33bcf9186f0mr29084769a91.35.1761120106936; 
 Wed, 22 Oct 2025 01:01:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2a00:79e0:201d:8:5534:56e9:528e:f9b4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33e223dfaacsm1771401a91.10.2025.10.22.01.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 01:01:46 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
X-Google-Original-From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251020045603.2573544-1-wens@kernel.org>
References: <20251020045603.2573544-1-wens@kernel.org>
Subject: Re: [PATCH resend] MAINTAINERS: Update Chen-Yu's email address
Message-Id: <176112010476.488381.11368848750305962943.b4-ty@kernel.org>
Date: Wed, 22 Oct 2025 16:01:44 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Mon, 20 Oct 2025 12:56:02 +0800, Chen-Yu Tsai wrote:
> The email forwarder I'm using has run into severe problems with Gmail
> lately. Switch over to my kernel.org address for kernel development.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Update Chen-Yu's email address
      commit: caa2f6ee91d4e2dab39b30de34d2c74b6f45d0a3

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

