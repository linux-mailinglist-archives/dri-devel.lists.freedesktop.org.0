Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB98303827
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CE46E45D;
	Tue, 26 Jan 2021 08:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4026E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 20:28:42 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id p18so9700531pgm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 12:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=YsfVmxDu5i68FdHZXdW8/k9FA/2TTh363mxFr7C7TK0=;
 b=ZGu20RKhKxE4PexNqACzZtv1RksHxEWqBczX5GDLh1PsMLN8NX5SDS6WThQcgrZIqT
 53IidItS5fYcc50usgIPbbtvQzp84SNPJutEKlWFKTpXb30RL/LLBJjm7iUYvT5PlBf+
 MJVTiBTlBWzrzK6IBfiPgD+cerHIO0rxpdVhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=YsfVmxDu5i68FdHZXdW8/k9FA/2TTh363mxFr7C7TK0=;
 b=NaHOiqagaMsEUsD7QU6tANnMkpmszqs/E2hRePg+PrcLdxLFrnoYuecf8C3uNqOQ2Z
 b/6m7nH307t5sqfSkv74L7Uc3cdoTJs0A7iEslh7LBlhxemC2W1+IFtKkHdhl7xHBwrY
 kWs/t/6cvGC8Ir+ZE0g/XJxasV27N1cJMYIXxf1ZiRNSS88BF9pt5xc5SGuFhNTAbCK0
 +8B4XyLRmXKFUkh2pME9woAi19pWfRtWuRPxoglRqoU/Qvfl8ExKDuc/FiEQBp8pr9jo
 +QwIlOUu/qlSnIKnFjb09nzMKPugy1fTXCTTMzcHWf52VY8Ov600NtVJ3+6cdYpH5eo0
 xP3Q==
X-Gm-Message-State: AOAM531OQ0jPuz39H8Hsccm539E68u2qKzaqEi0Gi3255At3NXcx2mvR
 etAq8wnEIAkQ4ySTDXbwzYsvhA==
X-Google-Smtp-Source: ABdhPJyIhPoV2HHtfOFLPgRgtaa/aJaGbkRA7/2bGmeo8ltPc0Py+x0xMd4shudIUsH4tPOQ5j1KJg==
X-Received: by 2002:a62:1c97:0:b029:1ae:6d94:75c6 with SMTP id
 c145-20020a621c970000b02901ae6d9475c6mr1940373pfc.34.1611606522222; 
 Mon, 25 Jan 2021 12:28:42 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:1066:b437:97cd:2278])
 by smtp.gmail.com with ESMTPSA id w20sm19101934pga.90.2021.01.25.12.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 12:28:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20210115144345.v2.3.I6916959daa7c5c915e889442268d23338de17923@changeid>
References: <20210115224420.1635017-1-dianders@chromium.org>
 <20210115144345.v2.3.I6916959daa7c5c915e889442268d23338de17923@changeid>
Subject: Re: [PATCH v2 3/5] drm/panel-simple: Retry if we timeout waiting for
 HPD
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 25 Jan 2021 12:28:39 -0800
Message-ID: <161160651990.76967.1833069919954122114@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2021-01-15 14:44:18)
> On an Innolux N116BCA panel that I have in front of me, sometimes HPD
> simply doesn't assert no matter how long you wait for it. As per the
> very wise advice of The IT Crowd ("Have you tried turning it off and
> on again?") it appears that power cycling is enough to kick this panel
> back into a sane state.
> 
> From tests on this panel, it appears that leaving it powered off for a
> while stimulates the problem. Adding a 6 second sleep at the start of
> panel_simple_prepare_once() makes it happen fairly reliably and, with
> this delay, I saw up to 3 retries needed sometimes. Without the 6
> second sleep, however, the panel came up much more reliably the first
> time or after only 1 retry.
> 
> While it's unknown what the problems are with this panel (and probably
> the hardware should be debugged), adding a few retries to the power on
> routine doesn't seem insane. Even if this panel's problems are
> attributed to the fact that it's pre-production and/or can be fixed,
> retries clearly can help in some cases and really don't hurt.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> @@ -440,6 +441,31 @@ static int panel_simple_prepare(struct drm_panel *panel)
>         return err;
>  }
>  
> +/*
> + * Some panels simply don't always come up and need to be power cycled to
> + * work properly.  We'll allow for a handful of retries.
> + */
> +#define MAX_PANEL_PREPARE_TRIES                5

Is this define used anywhere else? Feels like it would be better to
inline the constant and move the comment above the loop, but I guess
this is OK too.

> +
> +static int panel_simple_prepare(struct drm_panel *panel)
> +{
> +       int ret;
> +       int try;
> +
> +       for (try = 0; try < MAX_PANEL_PREPARE_TRIES; try++) {
> +               ret = panel_simple_prepare_once(panel);
> +               if (ret != -ETIMEDOUT)
> +                       break;
> +       }
> +
> +       if (ret == -ETIMEDOUT)
> +               dev_err(panel->dev, "Prepare timeout after %d tries\n", try);
> +       else if (try)
> +               dev_warn(panel->dev, "Prepare needed %d retries\n", try);
> +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
