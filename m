Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F325B3E8574
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 23:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6E089C0A;
	Tue, 10 Aug 2021 21:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFCA89CAA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 21:35:55 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 z9-20020a9d62c90000b0290462f0ab0800so775981otk.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=+XhXVGH3fkIOnE1t2XNmliygvN33fb2RS+mFgm8hrtU=;
 b=nssXy17hVHdZO0veyfk+XdCrAZ190q+aijoQHy4Dd8jrwccS37npEBDWKfa3tVRsX/
 +Fl4rkROGtig5v474uHf01f0pMk20xiMuc0h1oIPnL+D2G1YT6fL3foT9JFhM9c//9dr
 RsidGeTpYH3eYySbmAdTb06F49h/EbOOXoBT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=+XhXVGH3fkIOnE1t2XNmliygvN33fb2RS+mFgm8hrtU=;
 b=TY7GC/WnJAb43fvfoEXQXgLTgH6FEH9SZnwjr0L0+DFIQzZErYPYSbPZ2TLQ1Aej5/
 SiwpXZCsy2vnTYHTIyqIGrFZOR/0CFVnTpo02g3DBUAcPyl1u4p4xdBBybcP3SbdyBc/
 4ZwuEIs/a9nWgKNtFytaAYjtIfx21jfo3W6hgsEo4vn5Xj/Vv7VrM51nGQuLTL4oTO9W
 Pu2GD/ei+BccBkuH8KkXqtaHHAq11Dm26XsCROKk7XYcR0xMbJJ/gKwZfzSKFmimB8y1
 nyz440FFP5LA29M3d4bPpM3Q350DuYzIAKTsely4BLF3ClHeK3lmG19/1+IsBu1v+dov
 t4Yw==
X-Gm-Message-State: AOAM530aFsZdWo1/jl6Gscb9rB612HpYgA+yTBvzXa67PRotS+vd577Z
 piGFrFzET85WbOVbPClK2mvy310cnRgNTFmptUazvg==
X-Google-Smtp-Source: ABdhPJyiH0XE2MMSHvDD3YnTgiPVuRbdk1llKiBAiTDs/gIGZngoYWW5dJsF6iglEkjwRPIOdlrPTB7kIDitYcTjbyY=
X-Received: by 2002:a05:6830:1490:: with SMTP id
 s16mr22748568otq.233.1628631355080; 
 Tue, 10 Aug 2021 14:35:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 14:35:54 -0700
MIME-Version: 1.0
In-Reply-To: <1628196295-7382-7-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
 <1628196295-7382-7-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 14:35:54 -0700
Message-ID: <CAE-0n52n6ypCLrA3mWHekh9Caq8rT5ngV2X5MWdGYA8DJQb92g@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/msm/dp: do not end dp link training until
 video is ready
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie, 
 daniel@ffwll.ch, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-08-05 13:44:55)
> Initialize both pre-emphasis and voltage swing level to 0 before
> start link training and do not end link training until video is
> ready to reduce the period between end of link training and video
> start to meet Link Layer CTS requirement.  Some dongle main link
> symbol may become unlocked again if host did not end link training
> soon enough after completion of link training 2. Host have to re
> train main link if loss of symbol locked detected before end link
> training so that the coming video stream can be transmitted to sink
> properly. This fixes Link Layer CTS cases 4.3.2.1, 4.3.2.2, 4.3.2.3
> and 4.3.2.4.
>
> Changes in v3:
> -- merge retrain link if loss of symbol locked happen into this patch
> -- replace dp_ctrl_loss_symbol_lock() with dp_ctrl_channel_eq_ok()
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
