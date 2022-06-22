Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36309555276
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205DA1136BA;
	Wed, 22 Jun 2022 17:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DAF1136BA;
 Wed, 22 Jun 2022 17:33:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id o8so24439799wro.3;
 Wed, 22 Jun 2022 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bpaCjOapTAdRzLf+qPNGfdtVaNsXQvV0h/9qPiGYMOA=;
 b=ffkFg2lbSb3JovwNfGx8zubU8Dwr+HwSn1U+ippQGAK0MbFuUCFwMj6Q3zcjkVBMJX
 r06VQt8A5L7uBOALduThYx4AbJnjfy/uAvteehzEHk8XIS7JpWonwdwFDL+Pf91iF6FC
 lamNLMveY3aEeIXPeYL9cG3rYD2eb7DABBe4kG/H3Daa53Hg0KM6JkxXkHtiKQzqw4km
 IGReMEivIQV7k7sLscKNP858QT8xEhag4zRzqzl9R/lNA6wYBjS7fcfTIR48kRHzd2sW
 nz+ES14mNwxbUONGki81ysA8iLmMbqVDmy75WyzbjwMLziYaBRLe235vOWsU3gH4nn2m
 8b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bpaCjOapTAdRzLf+qPNGfdtVaNsXQvV0h/9qPiGYMOA=;
 b=tMjC41PkPPxg6JZ7T8Nb29PfRDEm8lv//kWiQXbQ8LBEL2rXAFr5RRcHrN1BEcn2c5
 OIjOB5oq4OAx+d2QEURPzkLx/320pZy1ri2KUK6PRpWIUh4C3PLa06KZbv+5ga7QTB9v
 BhHJCwphK8iVB9jCYMoJRH0DfLAcz0eJCPLe4lKRYjBff4x72AQqisSGQ5k6piEWlaDE
 pcBGdWkOFh5fcssTrNhEmI0OQSDbYTJ1fe5m3inoJ6bMFAxIRrBAiHejUU6LUsgRZZ71
 OFLthp0IOvuGkJKUx51ngQxSPL8Da2oP71nX8RT2swfz/AQauhD4lldM/szaFkrxmGX+
 AJzw==
X-Gm-Message-State: AJIora+WCnOnFJZbqWOajKOZwjt+safSwJ+BYnKoRrB7l7UaBPS66EZT
 BA5xG45YT8cSds3Z4nV+f43EaDYuuEZoV9LE+6w=
X-Google-Smtp-Source: AGRyM1uz4RIBAAr9I6m/BSWmy5hlU/Uode9MHQ3l9QxEYbOAEn1AyvqKX6/1vBCiFE69RkoEkU2Z+yxukKJ7svgM5ls=
X-Received: by 2002:adf:eb45:0:b0:21a:efae:4b9f with SMTP id
 u5-20020adfeb45000000b0021aefae4b9fmr4447308wrn.585.1655919225863; Wed, 22
 Jun 2022 10:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220622023855.2970913-1-swboyd@chromium.org>
 <b133b67f-0d99-af6b-94a5-d5ff4b5752f1@quicinc.com>
In-Reply-To: <b133b67f-0d99-af6b-94a5-d5ff4b5752f1@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 22 Jun 2022 10:33:33 -0700
Message-ID: <CAF6AEGuL0+3162jGb2YLsYoW-fmNsARuKcvE-+d5hRkCiicp4g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Increment vsync_cnt before waking up
 userspace
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
Cc: freedreno <freedreno@lists.freedesktop.org>, patches@lists.linux.dev,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Yacoub <markyacoub@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 10:24 AM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/21/2022 7:38 PM, Stephen Boyd wrote:
> > The 'vsync_cnt' is used to count the number of frames for a crtc.
> > Unfortunately, we increment the count after waking up userspace via
> > dpu_crtc_vblank_callback() calling drm_crtc_handle_vblank().
> > drm_crtc_handle_vblank() wakes up userspace processes that have called
> > drm_wait_vblank_ioctl(), and if that ioctl is expecting the count to
> > increase it won't.
> >
> > Increment the count before calling into the drm APIs so that we don't
> > have to worry about ordering the increment with anything else in drm.
> > This fixes a software video decode test that fails to see frame counts
> > increase on Trogdor boards.
> >
> > Cc: Mark Yacoub <markyacoub@chromium.org>
> > Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> > Fixes: 885455d6bf82 ("drm/msm: Change dpu_crtc_get_vblank_counter to use vsync count.")
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>
> This is right, we should increment before drm_crtc_handle_vblank() as
> that will query the vblank counter. This also matches what we do
> downstream, hence
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> One small nit though, shouldnt the fixes tag be
>
> 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

*Kinda*.. but the sw vblank counter wasn't used for reporting frame nr
to userspace until 885455d6bf82.  You could possibly list both,
perhaps, but 885455d6bf82 is the important one for folks backporting
to stable kernels to be aware of

BR,
-R

>
> This code has been this way since that commit itself.
>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 3a462e327e0e..a1b8c4592943 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1251,12 +1251,13 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
> >       DPU_ATRACE_BEGIN("encoder_vblank_callback");
> >       dpu_enc = to_dpu_encoder_virt(drm_enc);
> >
> > +     atomic_inc(&phy_enc->vsync_cnt);
> > +
> >       spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> >       if (dpu_enc->crtc)
> >               dpu_crtc_vblank_callback(dpu_enc->crtc);
> >       spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
> >
> > -     atomic_inc(&phy_enc->vsync_cnt);
> >       DPU_ATRACE_END("encoder_vblank_callback");
> >   }
> >
> >
> > base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
