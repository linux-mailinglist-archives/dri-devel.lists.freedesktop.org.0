Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E538F8FA3CC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 23:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3268310E062;
	Mon,  3 Jun 2024 21:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H0EaEUSY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D0410E3E5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 21:40:15 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so28015351fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 14:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717450813; x=1718055613; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3llFp6XU62QuqTiOvMfdzgxuqUgZrpZeZJw1lK9U1xg=;
 b=H0EaEUSYQYRfii6Gqis2urCf97m1XT5Me8si5MbuX8cyFXO8IWJ3dE2JobESCsGGUl
 jFuZGmF7jIohByeGwll39fnCw6351QNz9OB26Xnqx529WquEXXCB2/NThjTiYxfMoDUO
 IBTLFShwtaixM/MAQm5Avo2p7grEtVEogiTu4zs75/rug862lNMjjpjq55WjVjhx8nHh
 Ds14cMIyrnpK8LbwXesoglAVSiGFy+nIT4C73MO3X9pSGdX0JhCkOHHVDI11rDXL3y2X
 HLzkftMVnRwEOtQy5xvBAdDbny9eCiVHrW93BKdzScNqpxWwhHxPBzcLf1wNDyWu0vs4
 Akjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717450813; x=1718055613;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3llFp6XU62QuqTiOvMfdzgxuqUgZrpZeZJw1lK9U1xg=;
 b=iGAEX7d0GJjI9e+Ubwxyncrk/tHFfqDTDieuBbdvTbMA7aslqzqT3yGyqJLU4qexp5
 e9RRyS1DoyN6ZEobQfEkSI6uHMAnTjw7fsOtbmFvSPMuydORjFm3iPUM4zGlZ79h/DvC
 uVxR5UBObb10cxaNCDpUiRPkTWL1bcj6HvNMorwzntHSsC/NpWPfXD1B2Khka99Doj+q
 IYQfcnyavIsW0jyHBzliID5sHm7cAJFgvh0UP8wgBI23O+Smg0kDTqZRQ1OK+QHKyp17
 8dq+rAp8PK4k47CzXfg+iirMU+En3asdf9i0CTrRcIewvrEePsGZxsAjC3pySAm3K9Gy
 ewBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6s2mZAVDZrgHZGrb5N0YmLxnrCsOxOfms0z2HW0TNG7zCkqq1VpS3ZMclOQ/2yOxytfdC4vIhECIMwo7vj7cLpm+/EkFvjW8xjVnsugA/
X-Gm-Message-State: AOJu0YzNG9dh2FzGfgmCFKBLCRa+RB+ldzZtnOubDKD1W4L1/DG6KuwN
 gp8ZdGzxewd4ej6+ugZfGe0HpPQJyx4uvLQS37aCBlcptFAGIFmbFg1+DXrzKus=
X-Google-Smtp-Source: AGHT+IF8w25sByMAnhCrm0+slEMM4u8+QRDWCNHlVFFQ6GFKpbT4RCVbJBdiYhEi+BeqNtX5KbGNRQ==
X-Received: by 2002:a2e:9907:0:b0:2e5:685a:85b5 with SMTP id
 38308e7fff4ca-2ea950e7b63mr89166921fa.1.1717450813268; 
 Mon, 03 Jun 2024 14:40:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91cf107fsm13085771fa.122.2024.06.03.14.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 14:40:12 -0700 (PDT)
Date: Tue, 4 Jun 2024 00:40:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 7/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
Message-ID: <zxta54l7bny2buyc35bhhfh5pusujb5acs2bk4qt5yrzo4uwbb@jgvcuc54lzww>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
 <20240603-dpu-mode-config-width-v2-7-16af520575a6@linaro.org>
 <64c6e6a5-7ab2-cdf7-131a-7a1f79c48e0c@quicinc.com>
 <CAA8EJpp8WbXYTvtL0Xwxrn_eXsPfGTGz9bigtwHFjXunnM_cHg@mail.gmail.com>
 <37b56f66-4e71-51cc-a09d-fe4e1469f665@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37b56f66-4e71-51cc-a09d-fe4e1469f665@quicinc.com>
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

On Mon, Jun 03, 2024 at 02:24:27PM -0700, Abhinav Kumar wrote:
> 
> 
> On 6/3/2024 2:16 PM, Dmitry Baryshkov wrote:
> > On Mon, 3 Jun 2024 at 23:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 6/2/2024 2:39 PM, Dmitry Baryshkov wrote:
> > > > Check in _dpu_crtc_setup_lm_bounds() that CRTC width is not overflowing
> > > > LM requirements.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++++++++++---
> > > >    1 file changed, 12 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > index e3b1e5f55a92..c5e874a3656a 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > @@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
> > > >        _dpu_crtc_complete_flip(crtc);
> > > >    }
> > > > 
> > > > -static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> > > > +static int _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> > > >                struct drm_crtc_state *state)
> > > 
> > > Perhaps now we need to rename this to _dpu_crtc_setup_and_check_lm_bounds()?
> > 
> > Ack, I'll rename it.
> > 
> > > 
> > > Also, prior to this change, we never had a bounds check for each LM
> > > which we should have had . Does this qualify for a Fixes tag?
> > 
> > Probably no. We currently have a limit in the drm_mode_config, which
> > ensures that the CRTC isn't too wide.
> > 
> 
> The limit in drm_mode_config is to ensure we will not go beyond
> 2*max_mixer_width for the mode as we support only upto 2 LMs.
> 
> This check is making sure that even for the single LM, we do not go beyond
> the max_mixer_width which is valid imo.

For the case where 2*LM mode is not possible? Yes, it seems to be a
valid case. But in such case I'd prefer to rework this patch and pull it
to the top of the series. I'll take a look.

> 
> > > 
> > > With those two questions addressed,
> > > 
> > > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > >    {
> > > >        struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> > > >        struct drm_display_mode *adj_mode = &state->adjusted_mode;
> > > >        u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
> > > > +     struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> > > >        int i;
> > > > 
> > > >        for (i = 0; i < cstate->num_mixers; i++) {
> > > > @@ -727,7 +728,12 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> > > >                r->y2 = adj_mode->vdisplay;
> > > > 
> > > >                trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
> > > > +
> > > > +             if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
> > > > +                     return -E2BIG;
> > > >        }
> > > 
> > > > +
> > > > +     return 0;
> > > >    }
> > > > 
> > > >    static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
> > > > @@ -1195,8 +1201,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> > > >        if (crtc_state->active_changed)
> > > >                crtc_state->mode_changed = true;
> > > > 
> > > > -     if (cstate->num_mixers)
> > > > -             _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> > > > +     if (cstate->num_mixers) {
> > > > +             rc = _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> > > > +             if (rc)
> > > > +                     return rc;
> > > > +     }
> > > > 
> > > >        /* FIXME: move this to dpu_plane_atomic_check? */
> > > >        drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
> > > > 
> > 
> > 
> > 

-- 
With best wishes
Dmitry
