Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C436F89D062
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 04:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3326F112A4B;
	Tue,  9 Apr 2024 02:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TfxLRoCY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAA2112A49;
 Tue,  9 Apr 2024 02:33:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 702DD61446;
 Tue,  9 Apr 2024 02:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6ECC433F1;
 Tue,  9 Apr 2024 02:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712629985;
 bh=kaZl5aohS6PHHFbY2k20Vr3WSpd8PK+x4cpaK0dNKmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TfxLRoCYZ6eJmGn+zCrqSrSkyt8vdVMAYrrgcWYfH859DTwiz0QbeOkUl2gd8W3wW
 tYfgW7Q4nSZAaIHPaNygIb543E+DdcPaBQWEAskTmSYqGzbSMD/tmjk9OSEZZCfn4n
 dDBQvkJ9RZU4L+R4pwcOegp16Xftx13uPA4ZK1/74W8iDNNzggQdMlzc09tn5Lp4ae
 Xw7doy/Cq5BvOhsacixw895GRwCODLpBSviiHmv1691KUlgEEfNeTholDarGPFuBee
 E5LCvi/ngmgTS16bEBVYBqU/pJYKTydYkHjfi4xa0VDHH3HPoDbNQhAWi+j69szgvs
 8srocdUR5vi7g==
Date: Mon, 8 Apr 2024 21:33:01 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_bjorande@quicinc.com, johan@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle()
 directly for external HPD
Message-ID: <covjipaso7bhgiifb62vdh24dpadr7kdypl2dleg7a2vc4jwjd@s4ci5xc6qpa3>
References: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
 <ale6wbwzkfagcg2q6glb4vsxu3pthhkk3tquv2ixlatbdryqvh@xscsq2h6emho>
 <01cb1c0d-a801-37f9-2f55-2bbd8d3a68b9@quicinc.com>
 <CAA8EJprzH0LiWNx9Udt6og3G063odY6ccvaAgsNS1r3zG8TmdA@mail.gmail.com>
 <905222ad-612a-3eaf-d966-23c89c99e1f0@quicinc.com>
 <CAA8EJpp6Lc7sc5fnKp+O8TYdaywiE+dZ=YJin351s=r5rxi+Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpp6Lc7sc5fnKp+O8TYdaywiE+dZ=YJin351s=r5rxi+Kw@mail.gmail.com>
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

On Tue, Apr 09, 2024 at 01:07:57AM +0300, Dmitry Baryshkov wrote:
> On Tue, 9 Apr 2024 at 00:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > On 4/8/2024 2:12 PM, Dmitry Baryshkov wrote:
> > > On Mon, 8 Apr 2024 at 22:43, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >> On 4/7/2024 11:48 AM, Bjorn Andersson wrote:
> > >>> On Fri, Apr 05, 2024 at 08:15:47PM -0700, Abhinav Kumar wrote:
> > >>>> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > >>> [..]
> > >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
[..]
> > >>
> > >> I will need sometime to address that use-case as I need to see if we can
> > >> handle that better and then drop the the DISCONNECT_PENDING state to
> > >> address this fully. But it needs more testing.
> > >>
> > >> But, we will need this patch anyway because without this we will not be
> > >> able to fix even the most regular and commonly seen case of basic
> > >> connect/disconnect receiving complementary events.
> > >
> > > Hmm, no. We need to drop the HPD state machine, not to patch it. Once
> > > the driver has proper detect() callback, there will be no
> > > complementary events. That is a proper way to fix the code, not these
> > > kinds of band-aids patches.
> > >
> >
> > I had discussed this part too :)
> >
> > I totally agree we should fix .detect()'s behavior to just match cable
> > connect/disconnect and not link_ready status.
> >
> > But that alone would not have fixed this issue. If HPD thread does not
> > get scheduled and plug_handle() was not executed, .detect() would have
> > still returned old status as we will update the cable status only in
> > plug_handle() / unplug_handle() to have a common API between internal
> > and external hpd execution.
> 
> I think there should be just hpd_notify, which if the HPD is up,
> attempts to read the DPCD. No need for separate plug/unplug_handle.
> The detect() can be as simple as !drm_dp_is_branch() || sink_count != 0.
> 

What is detect() supposed to return in the event that we have external
HPD handler? The link state? While the external HPD bridge would return
the HPD state?

If a driver only drives the link inbetween atomic_enable() and
atomic_disable() will the "connected state" then ever be reported as
"connected"? (I'm sure I'm still missing pieces of this puzzle).

Regards,
Bjorn
