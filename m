Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C195055A3C7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995BE10F52D;
	Fri, 24 Jun 2022 21:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BC810F533
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 21:40:29 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 j2-20020a4ab1c2000000b00425813b407bso581027ooo.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 14:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=V4s/JUfjkiub/R9w8xaWqvcCDVW+IjEmSNuUoCJ04IM=;
 b=RD+L9LcFcUeiPzAjSaLBDphHX1XjrAsJM1T2vWIIPc8qr3eshODnL0CK2WHaWpKoNs
 f6hCqchzCWXSqzDmpJE7k3+D0hr/xr9H0SUGvaKqQG26h+bw4UBLD0d+vcwvTvBl1oYI
 UmugTVvAEDMBGC8WheR+i45ycPWqO48NFER9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=V4s/JUfjkiub/R9w8xaWqvcCDVW+IjEmSNuUoCJ04IM=;
 b=nn+/LVJNUG2O0PzioAOuwXamKjfI/TyErajZ3dgG2hOMMMxOO/DEKUyLShL3EGLzmu
 9/UuKL33Xccvqb1YNGtoMLtC2dqeYjl8gK7+2z7WxAoJ317dyBKa4qEyoq08GiHDeFFz
 jeBN2iHe0AtTqr7TETCvJV3EusGV4giGTFGLVHSh2deeSw1GN9priHi346GBp/EdpDhW
 G/4qu7SFpFvSgts2EcDpqG6Ug57WWPVI0P9A2osCesash2N6axhvnQx2kAhgXA3X020K
 m17mcMnl3bq1kGCnMxc8uj7xx0dJwZ4jWlu0yXEdz816H2BfaQolnJop+NPHyo8825EO
 66MA==
X-Gm-Message-State: AJIora8Mh3H/UjU+0oyVD34HirXeVji53HmFSpe+3Lst9VaS0jRyeuh0
 9uzi/CBQ7O4IegA1hBjgen5PGWGrF/e6ykGb2Ed8ng==
X-Google-Smtp-Source: AGRyM1sBd4jFsULRiqxpsKgfh5k0Q/liFWW1HCMnpjiiosrMFZoMEyqHrnbBTlaTslrPhPZ8930ucraQadTKRwAe2qM=
X-Received: by 2002:a4a:978d:0:b0:425:78aa:f546 with SMTP id
 w13-20020a4a978d000000b0042578aaf546mr542649ooi.1.1656106829235; Fri, 24 Jun
 2022 14:40:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 14:40:28 -0700
MIME-Version: 1.0
In-Reply-To: <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 24 Jun 2022 14:40:28 -0700
Message-ID: <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-24 14:17:50)
>
> On 6/24/2022 1:00 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-06-24 10:15:11)
> >> Current the index (dp->id) of DP descriptor table (scxxxx_dp_cfg[]) ar=
e tightly
> >> coupled with DP controller_id. This means DP use controller id 0 must =
be placed
> >> at first entry of DP descriptor table (scxxxx_dp_cfg[]). Otherwise the=
 internal
> >> INTF will mismatch controller_id. This will cause controller kickoff w=
rong
> >> interface timing engine and cause dpu_encoder_phys_vid_wait_for_commit=
_done
> >> vblank timeout error.
> >>
> >> This patch add controller_id field into struct msm_dp_desc to break th=
e tightly
> >> coupled relationship between index (dp->id) of DP descriptor table wit=
h DP
> >> controller_id.
> > Please no. This reverts the intention of commit bb3de286d992
> > ("drm/msm/dp: Support up to 3 DP controllers")
> >
> >      A new enum is introduced to document the connection between the
> >      instances referenced in the dpu_intf_cfg array and the controllers=
 in
> >      the DP driver and sc7180 is updated.
> >
> > It sounds like the intent of that commit failed to make a strong enough
> > connection. Now it needs to match the INTF number as well? I can't
> > really figure out what is actually wrong, because this patch undoes tha=
t
> > intentional tight coupling. Is the next patch the important part that
> > flips the order of the two interfaces?
>
> The commit bb3de286d992have two problems,
>
> 1)=C2=A0 The below sc7280_dp_cfg will not work, if eDP use
> MSM_DP_CONTROLLER_2 instead of=C2=A0 MSM_DP_CONTROLLER_1

Why would we use three indices for an soc that only has two indices
possible? This is not a real problem?

>
> since it have num_descs =3D2 but eDP is at index 2 (CONTROLLER_2) which
> never be reached.
>
> static const struct msm_dp_config sc7280_dp_cfg =3D {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .descs =3D (const struct msm_=
dp_desc[]) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 [MSM_DP_CONTROLLER_2] =3D { .io_start =3D 0x0aea0000,
> .connector_type =3D DRM_MODE_CONNECTOR_eDP, .wide_bus_en =3D true },
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 [MSM_DP_CONTROLLER_0] =3D { .io_start =3D 0x0ae90000,
> .connector_type =3D DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en =3D true=
 },
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_descs =3D 2,
> };
>
> 2)=C2=A0 DP always has index of 0 (dp->id =3D 0) and the first one to cal=
l
> msm_dp_modeset_init(). This make DP always place at head of bridge chain.

What does this mean? Are you talking about the list of bridges in drm
core, i.e. 'bridge_list'?

>
> At next patch eDP must be placed at head of bridge chain to fix eDP
> corruption issue. This is the purpose of this patch. I will revise the
> commit text.
>

Wouldn't that be "broken" again if we decided to change drm_bridge_add()
to add to the list head instead of list tail? Or if somehow
msm_dp_modeset_init() was called in a different order so that the DP
bridge was added before the eDP bridge?
