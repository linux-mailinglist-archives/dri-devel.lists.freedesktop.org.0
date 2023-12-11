Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DF880DF3A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 00:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F2510E521;
	Mon, 11 Dec 2023 23:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64E410E521;
 Mon, 11 Dec 2023 23:05:00 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1f6433bc1eso753094166b.1; 
 Mon, 11 Dec 2023 15:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702335899; x=1702940699; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jQYYFfWpf7CH1ngpQ1NcqsuXdIAKOgOrjyMZygJ2rc=;
 b=TjLYJ7OaQs3CP+v1xtncMcnP1chfICO08FDIzmXiJApi8ARHEPF7wib0Itq/HLckex
 P3hqCLFPNNE/P4+TUTh0nbB0vgM41mIaX/W2j3bg41e6XcFDxWzTP95RRrdLISHdWXTj
 BTYTZe/qw1959FlSvcuuYgdIRFJRWu+VavTCvvYyNAv/dhcmENkPJnsaqevcMpVoahDi
 CKqXmpOr5QS5Ps6KKm11rN45qoNbu4Cd/74gzcAwOcyY4xpygrwlhhfBgdtY3wEOmvnr
 hOdpoDOBGTtc19w2NUdQ3GVnWx3d0ITMjIYEyYpwZ/ytBWtCd4daJAr+vJlFomRMgLo5
 yr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702335899; x=1702940699;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3jQYYFfWpf7CH1ngpQ1NcqsuXdIAKOgOrjyMZygJ2rc=;
 b=k4KZhtKQsMglx0biRooE2MeIgQN9NqGuq0IRcVIE0kvel4tXwVRwoyJINyrtGgNEur
 8M3Veatlx9IA1ACroQ28o1qOej7Ef1ASjit6Zc2nHGrcwpbuu/w7DIOStj1/cEK0E2Gt
 tknM0skenyQPcMrFrsliFQfI9LqfUuF7LNDUvyB1h+VOW+VecNTszlh0vKvaGQLzmYel
 TgqNcbU6K8DaOVct8kIoTbwjOWE6Z/4FxbSN2W5LTRqWtJMo6WHZvKLZmgSF0k59XBMo
 PtZ/H3rcaJRCNkvdFkqWkNLCvnJ43jaBKpFp6F55R5RmUL/3nWM7Fodgr4ZxA5eSN4rN
 tmIQ==
X-Gm-Message-State: AOJu0YzFP56o++TEr+uXG0Dw0CguJgKvNehErtwiNYTjCK9D1vl/OQoj
 S8SRk0ljcHDQeCu7YMvFutG1y9Mw45eXrIxTWwAV8vXj
X-Google-Smtp-Source: AGHT+IGv1cLz0t866ueXVHy5ghVNbgQJzgAl2BxW5r/d50wmAbeYk9+UMuBO56nOEw9vyXo96C9trllOkQcn66jNQj8=
X-Received: by 2002:a17:907:a087:b0:a1f:6ec8:2f6f with SMTP id
 hu7-20020a170907a08700b00a1f6ec82f6fmr5419382ejc.28.1702335898650; Mon, 11
 Dec 2023 15:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20231211182000.218088-1-robdclark@gmail.com>
 <lcsqjcqwvmhys3tzrznyqhlmk3p4wbv2rcu77tecbsioscxbal@3s4qeztkktx5>
In-Reply-To: <lcsqjcqwvmhys3tzrznyqhlmk3p4wbv2rcu77tecbsioscxbal@3s4qeztkktx5>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 11 Dec 2023 15:04:46 -0800
Message-ID: <CAF6AEGtrA=ay_xT17HrLaecKUnMkUKrDn7DHS=_tibsDR8WRbA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Ratelimit framedone timeout msgs
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 2:09=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-12-11 10:19:55, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > When we start getting these, we get a *lot*.  So ratelimit it to not
> > flood dmesg.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >
> > dpu should probably stop rolling it's own trace macros, but that would
> > be a larger cleanup.
>
> That would be lovely, use is currently all over the place.
>
> Should this patch also ratelimit the corresponding:
>
>         [drm:dpu_encoder_phys_cmd_prepare_for_kickoff] *ERROR* failed wai=
t_for_idle: id:31 ret:-110 pp:0
>
> On CMD-mode panels?

Probably it should for consistency.  But I think you normally wouldn't
get this error at 60Hz with a cmd mode panel, so probably ok to make
it ratelimited for cmd mode later.

BR,
-R

> Note that this is a prime example of using DRM_ERROR over DPU_ERROR*, res=
ulting
> in unnecessary divergence (and un-readability) between error messages and=
 the
> code (DPU_DEBUG_CMDENC, which has a corresponding DPU_ERROR variant, is a=
lso
> used within that function...)
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 ++++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     | 1 +
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 82538844614b..7c22235d0eba 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -39,6 +39,9 @@
> >  #define DPU_ERROR_ENC(e, fmt, ...) DPU_ERROR("enc%d " fmt,\
> >               (e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
> >
> > +#define DPU_ERROR_ENC_RATELIMITED(e, fmt, ...) DPU_ERROR_RATELIMITED("=
enc%d " fmt,\
> > +             (e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
> > +
> >  /*
> >   * Two to anticipate panels that can do cmd/vid dynamic switching
> >   * plan is to create all possible physical encoder types, and switch b=
etween
> > @@ -2339,7 +2342,7 @@ static void dpu_encoder_frame_done_timeout(struct=
 timer_list *t)
> >               return;
> >       }
> >
> > -     DPU_ERROR_ENC(dpu_enc, "frame done timeout\n");
> > +     DPU_ERROR_ENC_RATELIMITED(dpu_enc, "frame done timeout\n");
> >
> >       event =3D DPU_ENCODER_FRAME_EVENT_ERROR;
> >       trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_kms.h
> > index b6f53ca6e962..f5473d4dea92 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -51,6 +51,7 @@
> >       } while (0)
> >
> >  #define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
> > +#define DPU_ERROR_RATELIMITED(fmt, ...) pr_err_ratelimited("[dpu error=
]" fmt, ##__VA_ARGS__)
> >
> >  /**
> >   * ktime_compare_safe - compare two ktime structures
> > --
> > 2.43.0
> >
