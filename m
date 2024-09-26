Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194B2987835
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 19:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20DD10EBB0;
	Thu, 26 Sep 2024 17:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="b3v1/F+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F7910EBB0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 17:15:53 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5365cf5de24so1710880e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 10:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727370950; x=1727975750;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Z9QXJ2eIFePE4Q+M3ttCNU/wCNcB/FJYMIBgdLUyTg=;
 b=b3v1/F+nmeZhFXKvuExHvbBtu45HNiCI9AYARIQzQ+KEu534mqB0RQlBEGDTcENlTX
 AmX80YWIwyLQ0aSymS7sc+T3BTQY2jRbv9qSDre1DAjpY+ZtcAqEOAgPwAhLZTHfkT2u
 OIIbbrBTtc+lQ2DkJjmtn5nE+8zOCtXtPuvL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727370950; x=1727975750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Z9QXJ2eIFePE4Q+M3ttCNU/wCNcB/FJYMIBgdLUyTg=;
 b=km2swAhXeUbgv8UDh8QwAiGdwA6XLUD15bX7sMRuGXHZpkAwOF51j6m/xCfpACQOdg
 1/8SXNTeG3u59r4/xM2Bpru+E6QEuqSfiU0Bfj8LBVGXqxyvMear1FIrpwR4BKO8kuf/
 2ine5vOqJ6f2k08BQOpDMpzgg9i9UKj51Uk+wTaYiYq3RLT6BBNLOEFmrZQ4aS6P/Fsn
 orv87RtTg9HcX8M46Q2Jk8lOkUcIgyuzsubijlWY6uR/fIk9ebiLoFXRMNP1rGjMWW5m
 1/CjYzTI4NoRDourpN8J0yvFcApA2qz8fkFnZfFdiVJnZCDo3jkzoOxSK9Yd358fSZ94
 HQuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlJrMedEziim5svqV4+q9by5bch6VTM1U49doJfylPjh9YsE4uRg5Yj0dOGvp30X5csL1MvZ1yvng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUJX81ZCHHuxCmGWV/dRlQ9ACOft64BHOMH2rhZHBLgIyE3Gj1
 Bqj78BNkXlAcUT/SFNqGNo7SjH6lzMf38JVvPA8WrjgflUelZFPfsR4qwnO1tiayasPvv4Hgh5A
 +Gw==
X-Google-Smtp-Source: AGHT+IH39hSHYUxemL4gwe8LS7dJIjpJGQulJ0gA5eqPJoKSfkeoeE7m+FlyBE5BI0CjRiYdb7w3Bw==
X-Received: by 2002:a05:6512:1092:b0:536:562c:a864 with SMTP id
 2adb3069b0e04-5389fc47fb8mr274582e87.31.1727370949717; 
 Thu, 26 Sep 2024 10:15:49 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a044091dsm13972e87.243.2024.09.26.10.15.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 10:15:48 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f759b87f83so15233491fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 10:15:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU/WkWaorJfvOOxYRDgbsU9hHgcjugHOuyMqhKJ6sFIEkTOovYqd9P9JQcXjluyRdpWNPnj9qch7dk=@lists.freedesktop.org
X-Received: by 2002:a05:651c:2220:b0:2ef:2bb4:45d with SMTP id
 38308e7fff4ca-2f9d3e38033mr3647841fa.9.1727370947964; Thu, 26 Sep 2024
 10:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240926092931.3870342-1-treapking@chromium.org>
 <20240926092931.3870342-2-treapking@chromium.org>
In-Reply-To: <20240926092931.3870342-2-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Sep 2024 10:15:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V5Yf1shF2eKCYOxu=x48cScTh8WXkcm4Xvr1qJnSn1Kg@mail.gmail.com>
Message-ID: <CAD=FV=V5Yf1shF2eKCYOxu=x48cScTh8WXkcm4Xvr1qJnSn1Kg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: anx7625: Drop EDID cache on bridge
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
> Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP=
")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I don't think it needs a re-spin, but for future reference you're
always supposed to move your own Signed-off-by to the bottom whenever
you "touch" a patch. Thus yours should be below Dmitry's tag.

In any case,

Reviewed-by: Douglas Anderson <dianders@chromium.org>

If these haven't been applied and there's no other feedback at the end
of next week I'll plan to apply both this and the next patch to
drm-misc-fixes.


-Doug
