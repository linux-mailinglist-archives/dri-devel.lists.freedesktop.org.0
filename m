Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B747DA464
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 02:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF3210EA88;
	Sat, 28 Oct 2023 00:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C794D10EA89
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 00:37:59 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5a877e0f0d8so32781357b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 17:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698453479; x=1699058279; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DmV04Dp8n+rjqqag6HgSNHHH01v3B7yQX+cBFsCk30Q=;
 b=YWPFM34hjQy9CI3mwhoLpnmHjA/rzj+ENs3zbHl1S+IQdCcsb1omkKtsNBp4UgsaQT
 DL+rkqc6+BNl+/ZDWr3u2Q2rj/6hqcCQx0umQfEILjXS+3Vpksnjlg4lXSCL4AcAa/Cu
 xBxRo0tsVqEIVX3k3Lzd4ZpoIdT3UlbmuMJf2JHhJDKmnD4b0l+exxZfONdDMlcjxGhv
 dVh93nflvqbnyE/2AhUVaIa8CwxN3uucZJhCOyyRZZm8FzqejCnYMAncRz++IjWzKp18
 7HIt3qzF2uQSEYQtr4cHNjN8ELMcuntRNsHvyt6nYh4juT6dhrhNEEzaE9bUJuHeVsLV
 B4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698453479; x=1699058279;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DmV04Dp8n+rjqqag6HgSNHHH01v3B7yQX+cBFsCk30Q=;
 b=Zzi699yUVF8O+QWmqA5Cv/74mo+3m+03qQZXlPgbw/LWk9gt099cWa08NaKY5ihQIl
 aTbDh5L4hP7YE557cXgP6CjlqGYzZTaxmjolcrdua1j0DcWdITaJMkRGsjIZWqVh+UIu
 YqGrkgGThFqJiHW52jfBOQRENgTLxFWa0bJ7XAA2/yHRQQW113l9cnG/NvE5QVhjFEmU
 wXF83v4LOzPR/B9iWGEp+Y2Qvubvv1y3Wb6nFe6tS8sx2mrkn4uZ1ot4wpDjIZj+MaqS
 t/aZWoP4CzuLlhLppgTbr8F7exsqfRixmjf6mrlgoL8i5vEmhqHDih2DyurvjdPphRZL
 0eRw==
X-Gm-Message-State: AOJu0Yx7atqd04M36Ui8EEX/gzgQH5gMbyIkskHa3O6nCw5tbBCbyshL
 bewLvUDNlguhhpTKm+8Jk4iM4x5BS3SKqFAnt4nhSw==
X-Google-Smtp-Source: AGHT+IE29XUeiiTmE/KmVbh4xF/1yO3eBtK3ViC6hAlTaHc1uavtyLD/MOuUAuFFiGdzA1p4cT87alBlLCasJvYcxRk=
X-Received: by 2002:a81:4328:0:b0:5a7:d8c8:aa17 with SMTP id
 q40-20020a814328000000b005a7d8c8aa17mr8366769ywa.13.1698453478747; Fri, 27
 Oct 2023 17:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
 <20231025092711.851168-2-dmitry.baryshkov@linaro.org>
 <37b52c67-7abb-d607-dc46-1cde33606997@quicinc.com>
In-Reply-To: <37b52c67-7abb-d607-dc46-1cde33606997@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 28 Oct 2023 03:37:47 +0300
Message-ID: <CAA8EJpqMXMU__zKU+_4rwjyg0kEB1HvRhUviRBwKnbjABS_xQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dp: don't touch DP subconnector property
 in eDP case
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 28 Oct 2023 at 00:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/25/2023 2:23 AM, Dmitry Baryshkov wrote:
> > From: Abel Vesa <abel.vesa@linaro.org>
> >
> > In case of the eDP connection there is no subconnetor and as such no
> > subconnector property. Put drm_dp_set_subconnector_property() calls
> > under the !is_edp condition.
> >
> > Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-----
> >   1 file changed, 10 insertions(+), 5 deletions(-)
> >
>
> We still need to unify the calls to drm_dp_set_subconnector_property()
> for the hpd connect/disconnect places preferably in
> dp_display_send_hpd_notification().
>
> That way, we would have had to make this change only in one location.

Good point, I'd like to take another look at the HPD handling in the
DP driver after we land the pending pm_runtime changes. As a part of
that I'll check the drm_dp_set_subconnector_property() calls.

> If you want to pursue that as a separate patch, I am fine as well.
>
> Hence,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry
