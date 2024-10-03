Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FAC98F81E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859CC10E25A;
	Thu,  3 Oct 2024 20:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QJ96LRpG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A98610E25A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 20:30:21 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53959a88668so1824925e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 13:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727987416; x=1728592216;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1KveEyJA6f8M/Ebmg+cvZ3aq6352Aa475xJFPESWp5U=;
 b=QJ96LRpGgu6260JL/lkNrKw5mYgaLIpLLDAXJyc1viGABzoKSOx9xni8nit8guuf5K
 bRdMtM/MIb+RDXjywP92VTS29h145pyqwADvwIBn2l/eKBZNWW8wA2t91X6qpQ7K04oR
 fRK+b9t399ghWE9nsRIBlcsKiOew05oO9OjwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727987416; x=1728592216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1KveEyJA6f8M/Ebmg+cvZ3aq6352Aa475xJFPESWp5U=;
 b=KrrTZ6FDuaN+GmVpVNJUBnlPRIuHzGC+xRYDo7bIwRp4z4v7SGVvawl4Ut+KD+zZ2Q
 35vysqFR2a1VyR6XipIfTqLzeT6zQwrWl5YVPFoQE4Jjco5HiPClEf4Gi17mim3gAwRh
 mVzKXe8qTLDn/sOMLe5FmfLt1wSeMRgjoDnGCSwwa7ZqO0ZN48J7cAephgpZ+3FByQ6b
 xULjPZ84EIdg269quwZqqXiccUmOmRGLL10XSLc3yqxZbIOy+NO/W28Dyae0xIRCq/DB
 aUlCieV2CvtvjSfB+x+2ZNHqF8UbY3W4S6p0uhM97txYEEbk1ztCz0nr9CuM3mN3dS6Q
 O4ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqGezf2gHiRubA2SRm+EJvYeauwpgq+f3HntpZudmVy2L0pjl/mrkmtB4ct9eQjUi9XOxpEIajbpw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwH2ic6GazqlhTiRdN5hUogrbSGII0REvkRdJ0grGnfEK0n4zV
 c5liD2h2R5qirHgFBrrBZMFKGPs+NPi4qEIgcRkFmk201hiZltyenrsxGmvI8/Tw2vsGzVOQQih
 Q/w==
X-Google-Smtp-Source: AGHT+IGgs9luTHsBf4H0RySpZ9UH5cWkXaL032W5C8u4H+w5gFBkMF2FNPcg+9Sl1JeDU1EvGIHAEg==
X-Received: by 2002:a05:6512:3ba6:b0:52c:d645:eda7 with SMTP id
 2adb3069b0e04-539ab87712emr383102e87.18.1727987416297; 
 Thu, 03 Oct 2024 13:30:16 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539a82ab2b9sm248807e87.276.2024.10.03.13.30.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 13:30:15 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53995380bb3so1780424e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 13:30:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU1c/9sdZ8riGgVRq5+KuR+MfJCLBZLlgXyrgvsaeCpamAbVcxPiF46LZUAA5hX2XBYKCapM7HkYSw=@lists.freedesktop.org
X-Received: by 2002:a05:6512:398b:b0:530:c239:6fad with SMTP id
 2adb3069b0e04-539ab6d8fb5mr464943e87.0.1727987414575; Thu, 03 Oct 2024
 13:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240926092931.3870342-1-treapking@chromium.org>
 <20240926092931.3870342-3-treapking@chromium.org>
In-Reply-To: <20240926092931.3870342-3-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Oct 2024 13:29:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTwjOwezAuD0_yFz01YyKBVPPTc=2bys5N+nrYJH91vQ@mail.gmail.com>
Message-ID: <CAD=FV=XTwjOwezAuD0_yFz01YyKBVPPTc=2bys5N+nrYJH91vQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: it6505: Drop EDID cache on bridge
 power off
To: Pin-yen Lin <treapking@chromium.org>
Cc: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Thu, Sep 26, 2024 at 2:29=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> The bridge might miss the display change events when it's powered off.
> This happens when a user changes the external monitor when the system
> is suspended and the embedded controller doesn't not wake AP up.
>
> It's also observed that one DP-to-HDMI bridge doesn't work correctly
> when there is no EDID read after it is powered on.
>
> Drop the cache to force an EDID read after system resume to fix this.
>
> Fixes: 11feaef69d0c ("drm/bridge: it6505: Add caching for EDID")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ---
>
> Changes in v2:
> - Collect review tags
>
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 ++
>  1 file changed, 2 insertions(+)

Like with patch #1, meant to push to drm-misc-fixes but ended up on
drm-misc-next. Yell if this is a problem, but I think it should be OK.

[2/2] drm/bridge: it6505: Drop EDID cache on bridge power off
      commit: 574c558ddb68591c9a4b7a95e45e935ab22c0fc6

-Doug
