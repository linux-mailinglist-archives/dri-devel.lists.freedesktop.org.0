Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B012A822FD5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 15:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E813E10E319;
	Wed,  3 Jan 2024 14:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1063310E315;
 Wed,  3 Jan 2024 14:49:15 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2046b2cd2d3so6985721fac.0; 
 Wed, 03 Jan 2024 06:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704293354; x=1704898154; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufp4vRBdchU/yun+kCRIt0+8UCXvzfiwI6xueBPpbEo=;
 b=Ic1ecYaAS+WKhXoqCnSdAD8h2MVIfi8hQquVzaTg7qhAe4yum1Z9T3omwphCYkpLlR
 /k3H1fO/a00FHP+YYoFR2siosZVcitoxf7/kIn0S44LbvTyhi9RybaTy71m3P+UbKLyZ
 MDVwjRbgYKL82OUxzlEuiF1xFKdAfSvz7sOnNuhAvo/7yZ9YIhpCr/esaGoRUKFmmbod
 mR+Wq52WIUyvMA0BzAhpkRfMmO7DaViQPDNonrj7ImstgyVE4+HZIYLuuWG+gQUaBO/C
 fx54PNfoczPRP6bvtaskkt4N3bJSzgA5s8fGZYHAaZwiS+ZHf9eE3pJEM+mPNiTApTyf
 fokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704293354; x=1704898154;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufp4vRBdchU/yun+kCRIt0+8UCXvzfiwI6xueBPpbEo=;
 b=NROoCzk12Z0Q3qf9OPY0O/xrRryVWMsrfX9t6GyOBoHlK+TCymLGH6uQAO41oLTGF2
 FvYNjM2ZWqdZFoN5kAGcDKF74kViZdckcMI7Ccm9Kh7CYvZNKWmJMPpyNFf57JK3I0IG
 aQiM4jFfuYJZ2aF6U4J/Nc0X+X490rK6VhI60RZPUXV4IK4GgJWntqiLLpeBaxe5KfOI
 u5s+aNKoiTQgT9FPHyf/1qRhhgzGXCz8HhqJC2EuG57ABRy3cxBnr8crm7pKhnQtfd+n
 gRHV+SN2USBYoz2OSp9t4T5UDJSnNELcRWJ9RKo4Oc6DPed76ZJ7lXP4RdTYnqNrdosQ
 Q8kQ==
X-Gm-Message-State: AOJu0YzK/n6t4BRKShwaxjHtabcUyR4/BmTRTX2l49S8qp/aQ/GeqOiA
 xjHsjl7YLcPSLaEs0HP16KGq7N+E2crhJxyY0VGdD3Rp
X-Google-Smtp-Source: AGHT+IHSBZz2vMnviOtqfzzL8k/DYFyaP559afobIFqxIsn26VMxo6cpgS5jfL8RtysNy5czj+Ih+Xir/VELvwy3SSo=
X-Received: by 2002:a05:6870:c114:b0:1fb:205d:756b with SMTP id
 f20-20020a056870c11400b001fb205d756bmr27160386oad.19.1704293354292; Wed, 03
 Jan 2024 06:49:14 -0800 (PST)
MIME-Version: 1.0
References: <20231122221421.2944301-1-arnd@kernel.org>
 <536a5850-34af-4a7d-b65d-82147895ef04@infradead.org>
In-Reply-To: <536a5850-34af-4a7d-b65d-82147895ef04@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Jan 2024 09:49:03 -0500
Message-ID: <CADnq5_NN+gW5rRezagGr=uno0qSD1rAqMbtLtH-YWV9hGmhfPw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: avoid stringop-overflow warnings for
 dp_decide_lane_settings()
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Alan Liu <haoping.liu@amd.com>, Arnd Bergmann <arnd@kernel.org>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Michael Mityushkin <michael.mityushkin@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, dri-devel@lists.freedesktop.org,
 George Shen <george.shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Dec 25, 2023 at 5:30=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 11/22/23 14:13, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > gcc prints a warning about a possible array overflow for a couple of
> > callers of dp_decide_lane_settings() after commit 1b56c90018f0 ("Makefi=
le:
> > Enable -Wstringop-overflow globally"):
> >
> > drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_trainin=
g_fixed_vs_pe_retimer.c: In function 'dp_perform_fixed_vs_pe_training_seque=
nce_legacy':
> > drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_trainin=
g_fixed_vs_pe_retimer.c:426:25: error: 'dp_decide_lane_settings' accessing =
4 bytes in a region of size 1 [-Werror=3Dstringop-overflow=3D]
> >   426 |                         dp_decide_lane_settings(lt_settings, dp=
cd_lane_adjust,
> >       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
> >   427 |                                         lt_settings->hw_lane_se=
ttings, lt_settings->dpcd_lane_settings);
> >       |                                         ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_trainin=
g_fixed_vs_pe_retimer.c:426:25: note: referencing argument 4 of type 'union=
 dpcd_training_lane[4]'
> >
> > I'm not entirely sure what caused this, but changing the prototype to e=
xpect
> > a pointer instead of an array avoids the warnings.
> >
> > Fixes: 7727e7b60f82 ("drm/amd/display: Improve robustness of FIXED_VS l=
ink training at DP1 rates")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>
> Thanks.
>
> > ---
> >  .../gpu/drm/amd/display/dc/link/protocols/link_dp_training.c    | 2 +-
> >  .../gpu/drm/amd/display/dc/link/protocols/link_dp_training.h    | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_trai=
ning.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
> > index 90339c2dfd84..5a0b04518956 100644
> > --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
> > +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
> > @@ -807,7 +807,7 @@ void dp_decide_lane_settings(
> >               const struct link_training_settings *lt_settings,
> >               const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
> >               struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MA=
X],
> > -             union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP=
_MAX])
> > +             union dpcd_training_lane *dpcd_lane_settings)
> >  {
> >       uint32_t lane;
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_trai=
ning.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.h
> > index 7d027bac8255..851bd17317a0 100644
> > --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.h
> > +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.h
> > @@ -111,7 +111,7 @@ void dp_decide_lane_settings(
> >       const struct link_training_settings *lt_settings,
> >       const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
> >       struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
> > -     union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX]);
> > +     union dpcd_training_lane *dpcd_lane_settings);
> >
> >  enum dc_dp_training_pattern decide_cr_training_pattern(
> >               const struct dc_link_settings *link_settings);
>
> --
> #Randy
> https://people.kernel.org/tglx/notes-about-netiquette
> https://subspace.kernel.org/etiquette.html
