Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39065485C0E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 00:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02D089C9A;
	Wed,  5 Jan 2022 23:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035AB89C97
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 23:06:46 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id be32so1163002oib.11
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 15:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=lU9azqMMeh6DbnZbcl2lSC5dKYwkqe50hupc+vf9d2A=;
 b=Z9FbV6j7G6xEZbBAvkwVyHKg5BQt5GXvM0+SeRVFiYv6O2H9oIk4aB0sqpDVrsPbiH
 ypCSlfEsuA1No8hWDK464tQClc9ZqdceuvmvlX6LwjBNeSHUhvWTknpTJyCoO1TTvOtN
 gAnMT1s1Pwz7ZjXMu+PARjQiTN0MHm17V1YjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=lU9azqMMeh6DbnZbcl2lSC5dKYwkqe50hupc+vf9d2A=;
 b=Icosoapkt649uc9brNczXkwIf0uKjpTzp9GdOm0r7k6xVFicJ4VVIFMqP6z9EusOv9
 ViCkMsElKCh0o4F0ZZBrePhD1gNRZTNO17BrNpa9EdTcUAAPTlZ1dUnmiAIb/GWiFPC8
 Xwahrp44NbB1cyHNdy7CokVqba4nabLDV9TuQjp4cre7sksH7doQrXprdHnElF9TvBuK
 ITy1HP/r3Bjlo6LRvWTuEpwbV8RGXpEpy06tOI7CPzTglAncfH9niJ/jhrKeqjGp4OcM
 Mwuq3D1UA3y0D6eAUPO7/AlJTKZku8DW0Dt2TO/M9nr+7WjgqPNOur94Gkn/fDEVpbct
 amkQ==
X-Gm-Message-State: AOAM530BczxTSDRN7RLJYm/4tQAM0x9cBnukM9K51gY9ntEG8/B2qiJJ
 qhEEy/1k6HfPT8LOrIfiobLn4HWzVtJjOO+LC39P+A==
X-Google-Smtp-Source: ABdhPJzAcJpvSF5lMXKo34QRJSTgW30u7+pLOgzDBuej/puQhjouq1bVASLz+ltH62MKR1xkor5WM7U9YV0dxZ5iFqU=
X-Received: by 2002:aca:a953:: with SMTP id s80mr4308576oie.164.1641424005319; 
 Wed, 05 Jan 2022 15:06:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 15:06:44 -0800
MIME-Version: 1.0
In-Reply-To: <dc2d6f535379dd38a5e3f9ba502f1f2b3d1f56b7.1640201523.git.christophe.jaillet@wanadoo.fr>
References: <dc2d6f535379dd38a5e3f9ba502f1f2b3d1f56b7.1640201523.git.christophe.jaillet@wanadoo.fr>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 15:06:44 -0800
Message-ID: <CAE-0n53Rcs+BGgwFy-yB2zT+s=WoK94cZJ6yHYE_od=6K6zbzg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Simplify dp_debug_init() and dp_debug_get()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, airlied@linux.ie, 
 bjorn.andersson@linaro.org, daniel@ffwll.ch, quic_abhinavk@quicinc.com, 
 robdclark@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Christophe JAILLET (2021-12-22 11:33:47)
> dp_debug_init() always returns 0. So, make it a void function and simplify
> the only caller accordingly.
>
> While at it remove a useless 'rc' initialization in dp_debug_get()
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
