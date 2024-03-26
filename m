Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD2C88C86E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 17:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D3210E222;
	Tue, 26 Mar 2024 16:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MH+77m/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1AA10E222
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 16:03:27 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id
 af79cd13be357-789db18e24eso371816485a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 09:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711469006; x=1712073806;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/W6aqq99DQNeE6Hy7b4PvjAgdtFfco4Dhwzml8Tueag=;
 b=MH+77m/CwD1DkOJQ9KatbnmH5UZqZ29d5waaHf8323nnT3FfalDx0zi5qKD6H09w95
 2jKYzrumqERyVjmSQVexkFIj1D5/otoDNNbU1PBcSQ94XJXyIPPUB26FC2t6QV5Ix9Xu
 HLwG41szq39vnH8GaJ23Q0bHywGHqYpmO19c0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711469006; x=1712073806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/W6aqq99DQNeE6Hy7b4PvjAgdtFfco4Dhwzml8Tueag=;
 b=jE7hkOxGt33/etBZVaYEC8EaZW4Szw2UL5cQACWn/QPNJt0tKJc8S76886ATAMGtrw
 YA2vIexd//QeywLAa+huNhXLW3zBCVdbKfyjq6vcCVPMYIUyNl02SHSx52tPqtRA8huz
 7EqTW9Jhln+XYOpvNfIuq38pvo7nEw5iL8E6lpWBQMlRO8pfYtFPDHeeDaJqyjgglCby
 v/bevh1zoHjSvDdH943Nd2Kjl8BNFHvyyFSEs2NNqyhKfo8+JYDP6iQDt5akarpKRTPB
 O0DQM0u7lul6NvZhputT83EqZQuAJ599mFLbmracYKJsGHCaS25GaBomxo3UHzsyKfgM
 hZcQ==
X-Gm-Message-State: AOJu0YwbTr7D0255Oy0SQfWuMCadGFX+azN6izFEnTxM2k+uySRE/2XN
 wgaKyTL24d5E+ivi0hEn7nGGRRjU8DYJGGM0E2Eqm9JT93OCKmPTsPPn/NotKi0RBif5J4qQOJg
 tqw==
X-Google-Smtp-Source: AGHT+IH2M0tg2qGwlqoqULdkRWMYiaAGvGD86Rcno1iAZPYQYde5VZUGeYtib78Nrs42upFeHIov8A==
X-Received: by 2002:a05:620a:5705:b0:78a:3f06:1db7 with SMTP id
 wi5-20020a05620a570500b0078a3f061db7mr1420027qkn.52.1711469005960; 
 Tue, 26 Mar 2024 09:03:25 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 e10-20020a05620a12ca00b007885e3275e9sm3084420qkl.132.2024.03.26.09.03.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 09:03:25 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-42ee0c326e8so241441cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 09:03:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4c89:b0:431:6352:80fb with SMTP id
 ez9-20020a05622a4c8900b00431635280fbmr253080qtb.16.1711469005170; Tue, 26 Mar
 2024 09:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240319135836.v2.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
 <CAA8EJpoCu5+KPJEeCSRLCgSQmTNxNsVCfP=9e4mtFaqADuuKBg@mail.gmail.com>
In-Reply-To: <CAA8EJpoCu5+KPJEeCSRLCgSQmTNxNsVCfP=9e4mtFaqADuuKBg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 26 Mar 2024 09:03:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4YGNUBRs2yTuEHKswsZs8TQdF8huRhCvtuvqc0R=P+Q@mail.gmail.com>
Message-ID: <CAD=FV=V4YGNUBRs2yTuEHKswsZs8TQdF8huRhCvtuvqc0R=P+Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: Clarify that wait_hpd_asserted() is not
 optional for panels
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Imre Deak <imre.deak@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Mar 19, 2024 at 3:45=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 19 Mar 2024 at 22:58, Douglas Anderson <dianders@chromium.org> wr=
ote:
> >
> > In response to my patch removing the "wait for HPD" logic at the
> > beginning of the MSM DP transfer() callback [1], we had some debate
> > about what the "This is an optional function" meant in the
> > documentation of the wait_hpd_asserted() callback. Let's clarify.
> >
> > As talked about in the MSM DP patch [1], before wait_hpd_asserted()
> > was introduced there was no great way for panel drivers to wait for
> > HPD in the case that the "built-in" HPD signal was used. Panel drivers
> > could only wait for HPD if a GPIO was used. At the time, we ended up
> > just saying that if we were using the "built-in" HPD signal that DP
> > AUX controllers needed to wait for HPD themselves at the beginning of
> > their transfer() callback. The fact that the wait for HPD at the
> > beginning of transfer() was awkward/problematic was the whole reason
> > wait_hpd_asserted() was added.
> >
> > Let's make it obvious that if a DP AUX controller implements
> > wait_hpd_asserted() that they don't need a loop waiting for HPD at the
> > start of their transfer() function. We'll still allow DP controllers
> > to work the old way but mark it as deprecated.
> >
> > [1] https://lore.kernel.org/r/20240315143621.v2.3.I535606f6d4f7e3e5588b=
b75c55996f61980183cd@changeid
> >
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I would consider changing the docs to say that implementing
> > wait_hpd_asserted() is actually _required_ for any DP controllers that
> > want to support eDP panels parented on the DP AUX bus. The issue is
> > that one DP controller (tegra/dpaux.c, found by looking for those that
> > include display/drm_dp_aux_bus.h) does populate the DP AUX bus but
> > doesn't implement wait_hpd_asserted(). I'm actually not sure how/if
> > this work on tegra since I also don't see any delay loop for HPD in
> > tegra's transfer() callback. For now, I've left wait_hpd_asserted() as
> > optional and described the old/deprecated way things used to work
> > before wait_hpd_asserted().
> >
> > Changes in v2:
> > - Make it clear that panels don't need to call if HPD is a GPIO.
> >
> >  include/drm/display/drm_dp_helper.h | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I don't think this is controversial and I've been involved / written
most of the code for eDP panel interactions, so I think I can land
this myself with Dmitry and Abhinav's review (thanks!). If someone
later comes back with additional thoughts I'm happy to update things
more.

Pushed to drm-misc-next:

6376eb8b9115 drm/dp: Clarify that wait_hpd_asserted() is not optional for p=
anels
