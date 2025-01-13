Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB68A0B1A1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E667E10E5CC;
	Mon, 13 Jan 2025 08:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PjQBeDlL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8FF10E5B8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:48:37 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so4908104e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 00:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736758055; x=1737362855; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IbA7N28Us7Vr+7VJn+xTT4k5t5lfn0IEvogilmiRnfA=;
 b=PjQBeDlLOwJEpslqKpk0qF9VKsUD82Y/7By7kqD7NoLookG0OrEKwenDJ3dZG3cAKc
 IqQV2v9WdgLdy5c+lcPf+mSr0XzlluiAK+AZHBIr/0NGSqv8JGK47oB0F+UGI7LobCo3
 GEqIZH32g+2c2yEDNflRvqxZWyxUiFYkbsXHH6pje66+8w53W7IU7CDEuplaFgWgt0lp
 SV+XEHArB2REM52hOI7r6bBkxvecGMIBudO+gMSYCmbtHComfT+Bhx42jN9hCOCiHv1R
 IQvMPILUu+W2YlBXYoZLaGfKXwRnqnON/J0GBvDSlImR/tuY56Q0oaCvBF72SqTVd5OO
 2T0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736758055; x=1737362855;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IbA7N28Us7Vr+7VJn+xTT4k5t5lfn0IEvogilmiRnfA=;
 b=TQqCCt1dp8wHqGCMGdqCb7Lxt869GUP7mQv7hQ1r/naMAUIX8DIs6F/J1hRbQwxJ6i
 sapZHx/wbZW2+0XKF8yKNLv/ew3gxA7tfD9WmQDaou4sjDUoB4l+G6+cYJ0vi2qDHqYe
 4g+zi1TZ7EZeSNMyI+jl2+vMijv89rKW/mjF40rvY3VZGsHecddohJ8Q8KI9MUWw5Obg
 bVu3oJQu4bLhB0eJC3Kb8WryX2ojFQ/Fo0Rh/JENhO+jmLo+TwrFp7Vn47vXoZh1hL4S
 aRaybqD/q3ZQgx1ZI0JFp2RLS+JeKBJazECu123ic3e1AAwnG8HXSFNYEEmOdqv2Ka/D
 hjvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJE7m6so2j63mz7MKiIgD/AP6oQUR6oB28zAf+jnaT6TsOi8wDEw31GCz57OMyYVCH/HkCxZB1MTw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQBjLa8lN5rFgChnXQNy2L2RCex2iK0qjLP/apPdwOEpoHS+U/
 PBYNSP8m5YBDMTCVRsQcHi/1hFX8kNpdydAdgspLeRrfB00xiO9QaYNz0nAN74o=
X-Gm-Gg: ASbGncuniGAhgThe7kf3UU+FDnV1h7mIqymOkshpitVrwqXdzadgF0eCssqk/YwtPO6
 vH5hEwrxa1vxYwSs0UjTiK+MTeh2hmUQuhsDSL3XBwkmSTFMizBk/sLQlg5qbGBD1xCuKo3Qeyf
 PHOF6cJDf4AWUIQSeGOm+n6a3Gd/2WzM2gNGH+Z6vOjYZGr7Yb+MRVq/FKiiXQDhzX3xYFNm5Ob
 QTmbZX6aIA4jimhN3fNyuh2gH9S9kDRS8ZMbgHjHArAIS8MAB3jvsWXTKs+qPe0lMlnZOl3jGVp
 T0tGa6uTGksjWRzkvfVWwwJaX+SHZNGtBezD
X-Google-Smtp-Source: AGHT+IECnRlWJYygMd3OjI6hYNyjvQCPtRVHR3YG5DLTJEoxW1qbQ3tX1+uH0zp6a8djtx9mw2QjYA==
X-Received: by 2002:a05:6512:3d19:b0:540:20c5:f847 with SMTP id
 2adb3069b0e04-5428c2df79bmr5063496e87.22.1736758055509; 
 Mon, 13 Jan 2025 00:47:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428becb15dsm1251610e87.238.2025.01.13.00.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 00:47:34 -0800 (PST)
Date: Mon, 13 Jan 2025 10:47:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 0/6] drm: enforce rules for
 drm_atomic_helper_check_modeset()
Message-ID: <kwain2xevvf35wxf5xyes4jdpfk6mdblhjg7cwc64t3tedbrxm@cegm7ixqaasq>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <e1a1fc68-cb8d-4fb0-879f-a84e679f6b2b@suse.de>
 <t7ga7l7hi5y634hc6sklp6mzae3jfqs66nkalviojrzrgez3kf@b4h4ue6fdj7j>
 <29dcf748-c571-4c91-92b7-481be5a43ff5@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29dcf748-c571-4c91-92b7-481be5a43ff5@suse.de>
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

On Fri, Jan 10, 2025 at 02:30:55PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 10.01.25 um 00:57 schrieb Dmitry Baryshkov:
> > On Thu, Jan 09, 2025 at 02:53:16PM +0100, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > 
> > > Am 22.12.24 um 06:00 schrieb Dmitry Baryshkov:
> > > > As pointed out by Simona, the drm_atomic_helper_check_modeset() and
> > > > drm_atomic_helper_check() require the former function is rerun if the
> > > > driver's callbacks modify crtc_state->mode_changed. MSM is one of the
> > > > drivers which failed to follow this requirement.
> > > I'm concerned about the implications of this series. How does a driver
> > > upgrade from simple pageflip to full modeset if necessary? The solution in
> > > msm appears to be to run the related test before drm_atomic_helper_check().
> > > (Right?)
> > > 
> > > My corner case is in mgag200, which has to reprogram the PLL if the color
> > > mode changes. So it sets mode_changed to true in the primary plane's
> > > atomic_check. [1] This works in practice because the plane checks run before
> > > the CRTC checks. So the CRTC code will do the correct thing. Reprogramming
> > > the PLL means to disable the display at some point. So it comes down to a
> > > full modeset.
> > > 
> > > You mention that drm_atomic_helper_check() needs to rerun if mode_changed
> > > flips. Would it be possible to implement this instead within the helper?
> > I think this should be a driver's decision. For MSM it was easier to
> > move the mode_changed changes and to isolate that before calling into
> > the drm_atomic_helper_check_modeset() code. Other drivers might prefer
> > to rerun the helper.
> 
> Is it legal to do something like
> 
> int atomic_check(state)
> {
>   ret = drm_atomic_helper_check(state)
>   if (state->dirty_needs_modeset)
>     ret = drm_atomic_helper_check(state)
>   return ret;
> }
> 
> within the driver ? It appears that the atomic helpers warn then.

No, it is legal if I understand it correctly. The warning comes up if
the dirty_needs_modeset is set after the driver returns from its
atomic_check() callback, see drm_atomic_check_only() patched in the
second patch.

> 
> Best regards
> Thomas
> 
> > 
> > > Best regards
> > > Thomas
> > > 
> > > [1] https://elixir.bootlin.com/linux/v6.12/source/drivers/gpu/drm/mgag200/mgag200_mode.c#L493
> > > 
> > > > As suggested by Simona, implement generic code to verify that the
> > > > drivers abide to those requirement and rework MSM driver to follow that
> > > > restrictions.
> > > > 
> > > > There are no dependencies between core and MSM parts, so they can go
> > > > separately via corresponding trees.
> > > > 
> > > > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > > Link: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > > Dmitry Baryshkov (6):
> > > >         drm/atomic-helper: document drm_atomic_helper_check() restrictions
> > > >         drm/atomic: prepare to check that drivers follow restrictions for needs_modeset
> > > >         drm/msm/dpu: don't use active in atomic_check()
> > > >         drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
> > > >         drm/msm/dpu: simplify dpu_encoder_get_topology() interface
> > > >         drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()
> > > > 
> > > >    drivers/gpu/drm/drm_atomic.c                |  3 +
> > > >    drivers/gpu/drm/drm_atomic_helper.c         | 86 ++++++++++++++++++++++++++---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 --
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 82 +++++++++++++++++----------
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++
> > > >    drivers/gpu/drm/msm/msm_atomic.c            | 13 ++++-
> > > >    drivers/gpu/drm/msm/msm_kms.h               |  7 +++
> > > >    include/drm/drm_atomic.h                    | 10 ++++
> > > >    9 files changed, 192 insertions(+), 43 deletions(-)
> > > > ---
> > > > base-commit: b72747fdde637ebf52e181671bf6f41cd773b3e1
> > > > change-id: 20241222-drm-dirty-modeset-88079bd27ae6
> > > > 
> > > > Best regards,
> > > -- 
> > > --
> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Frankenstrasse 146, 90461 Nuernberg, Germany
> > > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> > > HRB 36809 (AG Nuernberg)
> > > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
With best wishes
Dmitry
