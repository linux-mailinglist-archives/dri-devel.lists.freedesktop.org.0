Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B5B5933DB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 19:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA5BCEAE8;
	Mon, 15 Aug 2022 17:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A81DCEA67
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 17:08:17 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 z22-20020a056830129600b0063711f456ceso5842258otp.7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 10:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:from:to:cc;
 bh=w5mvqeDCehc7GaKrA3r1nsUFJqaSzpg+13M7sA6ODP4=;
 b=EXo9TqZYcqeI62mYaP39HnHFE1Jgu2Gp4yw1YH7g4irL+MqYlSooTegqxrGX/1fPdS
 i7LTVrfmDVZjkoYfavZW6Z5yTUIjGmyuJuTYhLnaTSHQ1Bj0oFKEAXVOWBn2QmHIhso5
 TbJZq75FEa02PtPcpEJJB/M1x7jEHhwEKyvBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
 :cc; bh=w5mvqeDCehc7GaKrA3r1nsUFJqaSzpg+13M7sA6ODP4=;
 b=YAF3/p1GCA+5jNPGdz70kngjzmZJV+tO76dxZ4I58a61lrfXtlGCJeM4umZ8X5uIgH
 NWiLIHKk+ckdMaUsKMs/mBJRD954uwEtb/Sz1jWVtAJ1bLFGyLaMc8xWJLW5PXWuIhH0
 DaIuYO51Fs8oArVPTIu6ep1wkgwXF/E6BCBGjFPwFrehHiH+Z2TvZzwbSKLcuYyx9stq
 IPaUDFEHB2uuO7kda9MC/jEFGba2Hoe2ub5fWFonXYxgG40pX2M3w8g1Obbkfehq6khC
 HcLrEgVzEpDhOJ9aWe1sAOm9+Fc4q3PEgkG/UoC4VGB3wALoMPV5HX2Q4VgB8urCguK/
 f41A==
X-Gm-Message-State: ACgBeo38TY6gp5lyOFnseHCEiTFqNyCCmwdzOS+OWpbqueuADCxy9ot4
 1jszqTZh0Jq4cG3Vjlo/cTJEaI1Z++P/EQPoqImsmQ==
X-Google-Smtp-Source: AA6agR49gUW9vuHC0Dzoy8S1A7T61B09e5tua3NyVPTV7sd0acqlwzykUCsQVgv29H+kCTLbcY+y6r4riaOarGM+ysQ=
X-Received: by 2002:a9d:738c:0:b0:638:9962:8cb6 with SMTP id
 j12-20020a9d738c000000b0063899628cb6mr2917548otk.73.1660583296069; Mon, 15
 Aug 2022 10:08:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Aug 2022 12:08:15 -0500
MIME-Version: 1.0
In-Reply-To: <1e792f49-febf-43bf-d828-8ecf99cbeba3@quicinc.com>
References: <1660159551-13828-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n533SUb3Bg=pR8Fhwo-M5qLWiti4nzLR-rSGVAsrXgEYNQ@mail.gmail.com>
 <dbda8bce-2890-e5e3-4052-073a52eb06a6@quicinc.com>
 <CAE-0n51NyrP8CikcK_3wj4EEsurmmSZ4RY3pLhJJmkY2_8wNZw@mail.gmail.com>
 <0641a116-5b58-4305-bf2d-f53dcb747276@quicinc.com>
 <1e792f49-febf-43bf-d828-8ecf99cbeba3@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 15 Aug 2022 12:08:15 -0500
Message-ID: <CAE-0n50QXiJs=k78Tmd7om28MgWChypwC8LPRzF2jx_qB5+0FQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: check hpd_state before push idle pattern
 at dp_bridge_disable()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 agross@kernel.org, airlied@linux.ie, bjorn.andersson@linaro.org, 
 daniel@ffwll.ch, dianders@chromium.org, dmitry.baryshkov@linaro.org, 
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-08-11 08:20:01)
>
> On 8/10/2022 6:00 PM, Abhinav Kumar wrote:
> >
> > Even then, you do have a valid point. DRM framework should not have
> > caused the disable path to happen without an enable.
> >
> > I went through the stack mentioned in the issue.
> >
> > Lets see this part of the stack:
> >
> > dp_ctrl_push_idle+0x40/0x88
> > =C2=A0dp_bridge_disable+0x24/0x30
> > =C2=A0drm_atomic_bridge_chain_disable+0x90/0xbc
> > =C2=A0drm_atomic_helper_commit_modeset_disables+0x198/0x444
> > =C2=A0msm_atomic_commit_tail+0x1d0/0x374
> >
> > In drm_atomic_helper_commit_modeset_disables(), we call
> > disable_outputs().
> >
> > AFAICT, this is the only place which has a protection to not call the
> > disable() flow if it was not enabled here:
> >
> > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/=
drm_atomic_helper.c#L1063
> >
> >
> > But that function is only checking crtc_state->active. Thats set by
> > the usermode:
> >
> > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/=
drm_atomic_uapi.c#L407
> >
> >
> > Now, if usermode sets that to true and then crashed it can bypass this
> > check and we will crash in the location kuogee is trying to fix.

That seems bad, no? We don't want userspace to be able to crash and then
be able to call the disable path when enable never succeeded.

> >
> > From the issue mentioned in
> > https://gitlab.freedesktop.org/drm/msm/-/issues/17, the reporter did
> > mention the usermode crashed.
> >
> > So this is my tentative analysis of whats happening here.
> >
> > Ideally yes, we should have been protected by the location mentioned
> > above in disable_outputs() but looks to me due to the above hypothesis
> > its getting bypassed.

Can you fix the problem there? Not fixing it means that every driver out
there has to develop the same "fix", when it could be fixed in the core
one time.

Ideally drivers are simple. They configure the hardware for what the
function pointer is asking for. State management and things like that
should be pushed into the core framework so that we don't have to
duplicate that multiple times.

> >
> > Thanks
> >
> > Abhinav
> >
> >
> Ii sound likes that there is a hole either at user space or drm.
>
> But that should not cause dp_bridge_disable() at dp driver to crash.

Agreed.

>
> Therefore it is properly to check hdp_state condition at
> dp_bridge_disable() to prevent it from crashing.
>

Disagree. Userspace shouldn't be able to get drm into a wedged state.
