Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5DA9BB525
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 13:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8339710E3F5;
	Mon,  4 Nov 2024 12:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ib97T/Ba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5F710E3F5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 12:55:29 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2e31af47681so3245525a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 04:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730724929; x=1731329729;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUT2MUhoOe9iu2p2kd8BI2aLF+LB/mKyYJdsiPsn1AE=;
 b=Ib97T/BanMo6P7rysVC4uDD2CWVbLah/bpuKtCcyhUBfmBvoVoGhj3y7j+oYx08yv8
 MiP3M/2bIUcVGjBnzlf2xw8kesI47lIlHxTUM4tApWS6vKBQjm0dAJEGYu9l9Wj2QxM3
 xIi5mVvyMxxn+0dBLCu/MUjvbvMCSYOUtbgS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730724929; x=1731329729;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FUT2MUhoOe9iu2p2kd8BI2aLF+LB/mKyYJdsiPsn1AE=;
 b=RUkkd+uEPWvbWtnjiwusxQyStILMAbD9YZHeXm533KEm/TOWJm4FUsMcQzHSlx3p78
 qF5mO0ekNND5YtniWXJVFdkermhwp0YUkFarHYa49/wHuYkCdveR6VEAAh7BbddN72Gf
 Yh/g8No8ZC4rs2TLLjOfVk2RVs+EQTJUTCR1Nyh07OTX0FmS2Eua7caIh9fPt1fERE5b
 SUSTKrUrV9U0MfzlmfVI2rJvMuVAJRxTmLMXIFIGjjCkNIOfMiCdSDrkEvuy1p3UvqqJ
 CGAOemh3Kr+3E3fNChpJgdrSwEXpSY2p+1scSTF6Hb9VieMmirIsXzv+fqZi3lLzLlLg
 Uh1A==
X-Gm-Message-State: AOJu0YwpjXFO96E2CYs5FK/dYnb4T8STy6BVcr8z9zUUutNUXWipBO1/
 YRV4GZsfYTBy53IaTYvOTbN7BZCOJqC6j6Ur3e2NaT6ciX5deKRdkA+uFNft9w==
X-Google-Smtp-Source: AGHT+IGw2My2dH4dIXYJt5UAfh9QheTuaxvz/yW07aa/c8zRoSfhpBhW/1Yv0E1txryL8w9UJYPxAg==
X-Received: by 2002:a17:90b:250a:b0:2e9:5e21:24f7 with SMTP id
 98e67ed59e1d1-2e95e21257cmr10927134a91.38.1730724929339; 
 Mon, 04 Nov 2024 04:55:29 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:f5f8:ffa1:d9e0:6eab])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e93daacb4dsm7534611a91.24.2024.11.04.04.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 04:55:28 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20241029095411.657616-1-wenst@chromium.org>
References: <20241029095411.657616-1-wenst@chromium.org>
Subject: Re: [PATCH] drm/bridge: it6505: Fix inverted reset polarity
Message-Id: <173072492636.262894.11094550143215575349.b4-ty@chromium.org>
Date: Mon, 04 Nov 2024 20:55:26 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Tue, 29 Oct 2024 17:54:10 +0800, Chen-Yu Tsai wrote:
> The IT6505 bridge chip has a active low reset line. Since it is a
> "reset" and not an "enable" line, the GPIO should be asserted to
> put it in reset and deasserted to bring it out of reset during
> the power on sequence.
> 
> The polarity was inverted when the driver was first introduced, likely
> because the device family that was targeted had an inverting level
> shifter on the reset line.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: it6505: Fix inverted reset polarity
      commit: c5f3f21728b069412e8072b8b1d0a3d9d3ab0265

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>

