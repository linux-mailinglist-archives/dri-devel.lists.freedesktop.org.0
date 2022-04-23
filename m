Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F037A50C542
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 02:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3919F10E27C;
	Sat, 23 Apr 2022 00:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5440E10E1EB
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 00:02:34 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 k29-20020a056830243d00b006040caa0988so6565735ots.6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 17:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qPSkwD/MU+Iqo4BRfa/Ls4gx2geTEC9xNtBW72fotns=;
 b=SGhKHlx9rgmGuT6KRjWdwmxQ6DjMyJuzfLXLaIeYVZ5TcfYbaSKVqoxVTgfk6REXcQ
 TlgPEGIZWLwT8DG8S96iFRwCNg7xVZDKb+MzzlNcrntMSloJCzacD5SpwspomRzFRT3g
 wgr86qCSKfNxzHpd40okIrwxExUC0sZieWPdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qPSkwD/MU+Iqo4BRfa/Ls4gx2geTEC9xNtBW72fotns=;
 b=Ne2yfDYI8N0M8RaHU1ZNIvuOexpCh+XGddQXpVaKtmNhIFW7b891nrrhjLjdWo5czp
 d17BYzlaPc8i3ZXgTJ0FREa64JO0d9FwJeiaZjlsDKHuzju4t9M4a00g9LOQMs1vOhq+
 hVtY+sP2DZHxyeGqOo3Y0vac5vZ+/HfFMahqfIuh1mHkjjNTuaWRTi/k79mbt7aDIoHT
 J6telXdaWjjhPh1KEspBfJP5Qi79hhDlxqZnJZeuc/dzdVmXAEkJ5w+x4Iai0DFxHFki
 /FDuGlf3JBQC8gFRUYfSYuL/edfDoGG8plDFeoIYHeGRZuG1FB3CHtLxGMEftd/kISaE
 FlpA==
X-Gm-Message-State: AOAM5312NJBCR2StGOkdO4laPks3m+sFjQMrNTL2Jp4Sdpv2+POvSzOC
 E0SUjF3JoGfZcG+qu8RUl86x17arvl7F1W6hWKpeNw==
X-Google-Smtp-Source: ABdhPJyCu1JPsTB5cEHaf/m5kBgPEh7iMzqGhHYkxVcYy1y6WXjtp50N6Ta3Ouu7RPsVdOORKVJbQT5IgWz1UxpYpbM=
X-Received: by 2002:a9d:20a1:0:b0:5e8:d2b6:f63f with SMTP id
 x30-20020a9d20a1000000b005e8d2b6f63fmr2689805ota.159.1650672153625; Fri, 22
 Apr 2022 17:02:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Apr 2022 17:02:33 -0700
MIME-Version: 1.0
In-Reply-To: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
References: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 22 Apr 2022 17:02:33 -0700
Message-ID: <CAE-0n502Jc57jKDL5d3QbZBZrtAiuU+vj33BXxB3sb7EScTgHA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: move add fail safe mode to
 dp_connector_get_mode()
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-22 16:45:23)
> Current DP driver implementation has adding safe mode done at
> dp_hpd_plug_handle() which is expected to be executed under event
> thread context.
>
> However there is possible circular locking happen (see blow stack trace)
> after edp driver call dp_hpd_plug_handle() from dp_bridge_enable() which
> is executed under drm_thread context.
>
> To break this circular locking, this patch have safe mode added at
> dp_connector_get_mode() which is executed under drm thread context.
> Therefore no lock acquired required for &dev->mode_config.mutex while
> adding fail safe mode since it has been hold by drm thread already.

Reported-by: Douglas Anderson <dianders@chromium.org>
Fixes: 8b2c181e3dcf ("drm/msm/dp: add fail safe mode outside of
event_mutex context")
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
