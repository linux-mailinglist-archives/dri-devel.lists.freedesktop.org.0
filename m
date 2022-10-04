Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C425F45CB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 16:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D03F10E5E7;
	Tue,  4 Oct 2022 14:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176E010E5E7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 14:41:19 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id 207so13757892ybn.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date;
 bh=z41duvCKMloCMs7/yS+eYyEb+WVImktYvIerwjQ5evI=;
 b=j6jR0OTmSljAbwsij5gsdUL+4ZFD75ZNHeSNzLJ6oPjvuO064edahqdHCjca2FVoNE
 BMIHxdhPWGZSeyUjkE1RHfGXRB1XY9mBdsQfsg8uEzypRG2oXvwJJoxkKG1IpkFp+9Vt
 GB2IpJ0heualwYLJrYc4+9+qsVEaYfxxVwtG4s6CPJMrVT3z67fuJVcjqBlA7iF/Tvmq
 169kZ+gBTNZftLrhpsg1ijx/7QF/AcuUd6OcGh1vUK0r5nE/7O6Z+j4DRK85NvpKEiM+
 r/M3ChmBXywKUVwIWfnXmH9FcDntC5jTRgrPSDSEn/mZh9kSoOL/A0e2vegGLeFvFokX
 5m6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=z41duvCKMloCMs7/yS+eYyEb+WVImktYvIerwjQ5evI=;
 b=ys6lQbFswrdn89mWMfet/b0toN/hIoWSE9jarJroYUt5zBA2PrAtY3eMi6fw+yrMPz
 SalAsF48dJMorgjMrG/LHUT/eJAMZ4ZMutNiNDM3auPhYpiQPuOHqYaMuZQlakSSD7DX
 jdttU6BY0hNEtBLysXv6m3TqpqhyCdKrLlEUUo0TYjKytY9wuj2teUieQ0FQHh05pcGD
 ok/9xJyhzJ85kSER5oLRFq71mdjGJ1WhzBgl0ejUwhDAlQegX7BV2405yKDWn5o78TUS
 fKFmuqthK9lN2ldnDRex8ek7NXP7/KUQo4R18mlCTcXz58UaAg58hwhkG40jPNDkjep8
 OeSg==
X-Gm-Message-State: ACrzQf19XyB+df61hkQsAlrR3oqtc6LfCluAofwjv5chnDurn9Y1y7rX
 Z+I/HUZBXVSVXHxzq4bAxANAKfJkCUCIaNhEGmCofQ==
X-Google-Smtp-Source: AMsMyM6iglxo2rnyStaDCkTZCnJHAIs8F74+vN9/msLvrF4RKqOOdLEukISP12dZ8dOsqZ63qavPJSynh+H9LBTCOZ4=
X-Received: by 2002:a25:2e4e:0:b0:6bc:ac92:a4df with SMTP id
 b14-20020a252e4e000000b006bcac92a4dfmr26652384ybn.153.1664894478194; Tue, 04
 Oct 2022 07:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-6-marijn.suijten@somainline.org>
 <20221001202313.fkdsv5ul4v6akhc3@SoMainline.org>
In-Reply-To: <20221001202313.fkdsv5ul4v6akhc3@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Oct 2022 17:41:07 +0300
Message-ID: <CAA8EJpricAKmrtqGJx_ngqyqCWjc2rbrOcsE5QaH5qKaHP7-2g@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/dsc: Prevent negative BPG offsets from shadowing
 adjacent bitfields
To: Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
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

On Sat, 1 Oct 2022 at 23:23, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2022-10-01 21:08:07, Marijn Suijten wrote:
> > msm's dsi_host specifies negative BPG offsets which fill the full 8 bits
> > of a char thanks to two's complement: this however results in those bits
> > bleeding into the next parameter when the field is only expected to
> > contain 6-bit wide values.
> > As a consequence random slices appear corrupted on-screen (tested on a
> > Sony Tama Akatsuki device with sdm845).
> >
> > Use AND operators to limit all values that constitute the RC Range
> > parameter fields to their expected size.
> >
> > Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >  drivers/gpu/drm/display/drm_dsc_helper.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> > index c869c6e51e2b..2e7ef242685d 100644
> > --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> > @@ -243,11 +243,11 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
> >        */
> >       for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> >               pps_payload->rc_range_parameters[i] =
> > -                     cpu_to_be16((dsc_cfg->rc_range_params[i].range_min_qp <<
> > +                     cpu_to_be16(((dsc_cfg->rc_range_params[i].range_min_qp & 0x1f) <<
> >                                    DSC_PPS_RC_RANGE_MINQP_SHIFT) |
> > -                                 (dsc_cfg->rc_range_params[i].range_max_qp <<
> > +                                 ((dsc_cfg->rc_range_params[i].range_max_qp & 0x1f) <<
> >                                    DSC_PPS_RC_RANGE_MAXQP_SHIFT) |
> > -                                 (dsc_cfg->rc_range_params[i].range_bpg_offset));
> > +                                 (dsc_cfg->rc_range_params[i].range_bpg_offset & 0x3f));
>
> Pre-empting the reviews: I was contemplating whether to use FIELD_PREP
> here, given that it's not yet used anywhere else in this file.  For that
> I'd remove the existing _SHIFT definitions and replace them with:
>
>         #define DSC_PPS_RC_RANGE_MINQP_MASK             GENMASK(15, 11)
>         #define DSC_PPS_RC_RANGE_MAXQP_MASK             GENMASK(10, 6)
>         #define DSC_PPS_RC_RANGE_BPG_OFFSET_MASK        GENMASK(5, 0)
>
> And turn this section of code into:
>
>         cpu_to_be16(FIELD_PREP(DSC_PPS_RC_RANGE_MINQP_MASK,
>                                dsc_cfg->rc_range_params[i].range_min_qp) |
>                     FIELD_PREP(DSC_PPS_RC_RANGE_MAXQP_MASK,
>                                dsc_cfg->rc_range_params[i].range_max_qp) |
>                     FIELD_PREP(DSC_PPS_RC_RANGE_BPG_OFFSET_MASK,
>                                dsc_cfg->rc_range_params[i].range_bpg_offset));
>
> Is that okay/recommended?

This is definitely easier to review. However if you do not want to use
FIELD_PREP, it would be better to split this into a series of `data |=
something` assignments terminated with the rc_range_parameters[i]
assignment.

>
> - Marijn
>
> >       }
> >
> >       /* PPS 88 */
> > --
> > 2.37.3
> >



-- 
With best wishes
Dmitry
