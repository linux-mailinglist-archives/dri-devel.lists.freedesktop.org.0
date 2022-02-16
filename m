Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73CC4B7D78
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85F810E60E;
	Wed, 16 Feb 2022 02:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAAB10E60D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 02:26:22 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 d134-20020a4a528c000000b00319244f4b04so897985oob.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 18:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7BR1l6XFZ325W/fTS1Iwv6NfRMJK9vX4L6V6SwCI0wE=;
 b=iNfOoboSPQY0xx/g5HNfNm5DFNXAD1PIAGiZXi8QKrtU+wiD4Um+Fb4HFiRtEDAWM8
 iF0Y8iyrPr8IEvjgLPPoHeiOp0oLN5aRs/c6aWAyeUwmQ0OYF6c76HXOQchvAKocpMM/
 CKg37Vq3gWktBZPRw1CK2cmLzJZmjir6uNr0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7BR1l6XFZ325W/fTS1Iwv6NfRMJK9vX4L6V6SwCI0wE=;
 b=5OBYH/WNO5cff3mdIziv2H17YHEwx5CQcvbkOBoZbQw9U62Ubbuijsi+roOizzmpTq
 HHj6+BmudTDqV1ZMxf1BZPlEEem2IsB2f3KFvNTyzzQIIMqQZuJf2UNYCvbEyEjaqhIR
 PX083x4BFNPIXtyIxBoh0VzbmG8/nqZrk+8AKgp2MWbvbtHPUbuTouI/HrUxzRcOs7Mz
 LwUN5ephO50TmjuEe4Avfy9dIxLYUUZw2cWDwjqWtP8EavpsRd09n+RnavpFLo9k/SH6
 8WFoir3ZQ2yFbGwp30qmrO5aDGz4hXZ5KW7O/EHiE561TZ3cy20iBtmhGa7ee7gOpFXH
 QvUg==
X-Gm-Message-State: AOAM5306J/3xqJQlvhrmmk4zohCIE6Pzlvn/pmVDrsY4kTjhOJMGcTMy
 fdXK3csW1/SkFwywIV8DNo3MZ6auv1peRJ9tEb499w==
X-Google-Smtp-Source: ABdhPJzKrEq9Wnux2sFV/6iNTo2G3nGrxvVpzAQBZk2YsT+qr7Mn8LoHUl823zFOqdCk7jrYIz2NGtSrvCYuat44Sc4=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr293109oao.8.1644978381692; Tue, 15 Feb
 2022 18:26:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:26:21 -0800
MIME-Version: 1.0
In-Reply-To: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
References: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:26:21 -0800
Message-ID: <CAE-0n52GOrRgPQUeP8t_yFNRK1B43AhxBKQgC0MyHr6L2txyng@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: populate intf_audio_select() base on hardware
 capability
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-11 15:23:42)
> intf_audio_select() callback function use to configure
> HDMI_DP_CORE_SELECT to decide audio output routes to HDMI or DP
> interface. HDMI is obsoleted at newer chipset. To keep supporting
> legacy hdmi application, intf_audio_select call back function have
> to be populated base on hardware chip capability where legacy
> chipsets have has_audio_select flag set to true.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
