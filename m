Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5448E88036B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 18:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CA010E1D6;
	Tue, 19 Mar 2024 17:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Wday5cL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9974210E004
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 17:27:38 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-60a15449303so59331057b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710869257; x=1711474057; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m3LUxRWYnP2OsrqcQiSZ4h3vPEbmfkyWm4/8PP80DFo=;
 b=Wday5cL6VUiVpzyqua8bQ2UOjW3snCz+Oax/1i7TGaq/wHif2ifveE3kRb2VwQGwDy
 V2W9W/GmVpJdaOHCx6gKH4xixvl/t1rVAlw6lSh1uFqDvoA5K3w8qUNhaFackViNo0ZP
 Fyjg7xFlHSSnIpuYyk9O4aT7m+1pKxSiicWXVcSa1szQQSqqH5jSQerVsytxfD9TfxWS
 wo01s7v/4FeGO98hJxIjA5wy8PAcULg8VPW7BsGIFh4uVbOB7RTzEzryUmEad1mzCzbb
 DwOBg4lpu9IXWt3UgboDRXe/TM51TH6WSMZ4hEiY7EeoWhAI2rscwTbf5O1HE5WFcVEn
 M+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710869257; x=1711474057;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m3LUxRWYnP2OsrqcQiSZ4h3vPEbmfkyWm4/8PP80DFo=;
 b=gkBoc2PcDZm6rwJI/V8VXhUK5TKREGeDN+kPZ1kMpos9DhJ+zrG3r7dZetdokB/5Y9
 kfDsfOgdxI9gF3BA5JezBZxihGOgmQH2J3r+09qY7rn1AcBydYlxO+meleNGgy/cU8ES
 gkEnaPZIjPxaH67oR93keH/OvAZ+vCd+Uxybv6ejiR+VOcoQoeEX3bxvCg7Qk4UAbEnU
 8EM7K7SrFlGGtn3pcgw3HUJ28PjosVlQWKHwSfPe3s2OtOsPeEM8BLU+azSsZ5d4lX0M
 pHxqh3K2FaUtQTpSfsA4uyIfickfBC6JiPBqSXOFBuMk20G0kmt0Eou5AYveDFGbTARe
 yWhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPBgNoOcRHsQyenZzBQjHAjAwQEHkisbdUZXn13GsqBTTdkvxbFfLf0gq8m7MTpSNnNlCYcBE1ybrjDaGt8lyonkyrD+CABZ6pb+BVZLJm
X-Gm-Message-State: AOJu0YwncIN0KV7dHR9Sc0jHdqpYxPkb2aMpb91geTfrfBwODuyYvKiR
 E7U3Sj82B8jimKRpdGoxJqlkfWStxoln1LCkX0WJq5B2vwkeYSQ1g/yQmwm1kpcDU4cXG3OFmr8
 yjziBpji39iWOruHbvvjanCwLkBO7juwy/oQdJA==
X-Google-Smtp-Source: AGHT+IHirHQZ7pR8BGQ/5ZhsBCIs44cPOvTf+0zulojL7cSeRMY1zSrD1OShWWxzk2nxLI0kUfdWALR/K7oeCrxZF5I=
X-Received: by 2002:a81:6f05:0:b0:610:d431:9408 with SMTP id
 k5-20020a816f05000000b00610d4319408mr5599507ywc.42.1710869257519; Tue, 19 Mar
 2024 10:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid>
 <e2319b19-d999-24e7-48fa-bbc19bbfbeea@quicinc.com>
 <CAA8EJppau--vt3RLkH96K0SF2x-QGWz+5U8tErvLFDvz-GQN4Q@mail.gmail.com>
 <d04711c1-6df0-f988-9227-2161f4109dd1@quicinc.com>
In-Reply-To: <d04711c1-6df0-f988-9227-2161f4109dd1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 19:27:25 +0200
Message-ID: <CAA8EJppcuftv4hfKkZeaXCDQJ4Z5+8-P99wHc9X8WgYJbk6CjA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/dp: Delete the old 500 ms wait for eDP HPD
 in aux transfer
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Johan Hovold <johan@kernel.org>
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

On Tue, 19 Mar 2024 at 19:13, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/18/2024 5:55 PM, Dmitry Baryshkov wrote:
> > On Tue, 19 Mar 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> +bjorn, johan as fyi for sc8280xp
> >>
> >> On 3/15/2024 2:36 PM, Douglas Anderson wrote:
> >>> Before the introduction of the wait_hpd_asserted() callback in commit
> >>> 841d742f094e ("drm/dp: Add wait_hpd_asserted() callback to struct
> >>> drm_dp_aux") the API between panel drivers and DP AUX bus drivers was
> >>> that it was up to the AUX bus driver to wait for HPD in the transfer()
> >>> function.
> >>>
> >>> Now wait_hpd_asserted() has been added. The two panel drivers that are
> >>> DP AUX endpoints use it. See commit 2327b13d6c47 ("drm/panel-edp: Take
> >>> advantage of wait_hpd_asserted() in struct drm_dp_aux") and commit
> >>> 3b5765df375c ("drm/panel: atna33xc20: Take advantage of
> >>> wait_hpd_asserted() in struct drm_dp_aux"). We've implemented
> >>> wait_hpd_asserted() in the MSM DP driver as of commit e2969ee30252
> >>> ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()"). There is
> >>> no longer any reason for long wait in the AUX transfer() function.
> >>> Remove it.
> >>>
> >>> NOTE: the wait_hpd_asserted() is listed as "optional". That means it's
> >>> optional for the DP AUX bus to implement. In the case of the MSM DP
> >>> driver we implement it so we can assume it will be called.
> >>>
> >>
> >> How do we enforce that for any new edp panels to be used with MSM, the
> >> panels should atleast invoke wait_hpd_asserted()?
> >>
> >> I agree that since MSM implements it, even though its listed as
> >> optional, we can drop this additional wait. So nothing wrong with this
> >> patch for current users including sc8280xp, sc7280 and sc7180.
> >>
> >> But, does there need to be some documentation that the edp panels not
> >> using the panel-edp framework should still invoke wait_hpd_asserted()?
> >>
> >> Since its marked as optional, what happens if the edp panel driver,
> >> skips calling wait_hpd_asserted()?
> >
> > It is optional for the DP AUX implementations, not for the panel to be called.
> >
>
> Yes, I understood that part, but is there anything from the panel side
> which mandates calling wait_hpd_asserted()?
>
> Is this documented somewhere for all edp panels to do:
>
> if (aux->wait_hpd_asserted)
>         aux->wait_hpd_asserted(aux, wait_us);

That's obviously not true, e.g. if panel-edp.c handled HPD signal via
the GPIO pin.

But the documentation explicitly says that the host will be powered up
automatically, but the caller must ensure that the panel is powered
on. `It's up to the caller of this code to make sure that the panel is
powered on if getting an error back is not OK.'

>
> >>
> >> Now, since the wait from MSM is removed, it has a potential to fail.
> >>
> >>> ALSO NOTE: the wait wasn't actually _hurting_ anything and wasn't even
> >>> causing long timeouts, but it's still nice to get rid of unneeded
> >>> code. Specificaly it's not truly needed because to handle other DP
> >>> drivers that can't power on as quickly (specifically parade-ps8640) we
> >>> already avoid DP AUX transfers for eDP panels that aren't powered
> >>> on. See commit 8df1ddb5bf11 ("drm/dp: Don't attempt AUX transfers when
> >>> eDP panels are not powered").
> >>>
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>> ---
> >>>
> >>> (no changes since v1)
> >>>
> >>>    drivers/gpu/drm/msm/dp/dp_aux.c | 17 -----------------
> >>>    1 file changed, 17 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> >>> index 75c51f3ee106..ecefd1922d6d 100644
> >>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> >>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> >>> @@ -313,23 +313,6 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
> >>>                goto exit;
> >>>        }
> >>>
> >>> -     /*
> >>> -      * For eDP it's important to give a reasonably long wait here for HPD
> >>> -      * to be asserted. This is because the panel driver may have _just_
> >>> -      * turned on the panel and then tried to do an AUX transfer. The panel
> >>> -      * driver has no way of knowing when the panel is ready, so it's up
> >>> -      * to us to wait. For DP we never get into this situation so let's
> >>> -      * avoid ever doing the extra long wait for DP.
> >>> -      */
> >>> -     if (aux->is_edp) {
> >>> -             ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog,
> >>> -                                                             500000);
> >>> -             if (ret) {
> >>> -                     DRM_DEBUG_DP("Panel not ready for aux transactions\n");
> >>> -                     goto exit;
> >>> -             }
> >>> -     }
> >>> -
> >>>        dp_aux_update_offset_and_segment(aux, msg);
> >>>        dp_aux_transfer_helper(aux, msg, true);
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
