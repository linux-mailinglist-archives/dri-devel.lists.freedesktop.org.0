Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55386729D37
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 16:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEF010E6B8;
	Fri,  9 Jun 2023 14:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F6010E6B8;
 Fri,  9 Jun 2023 14:46:57 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1a28817f7d8so774961fac.3; 
 Fri, 09 Jun 2023 07:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686322016; x=1688914016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdbxKBVcBVIgPeSRn3sb4Td/Dc7pVhPTKzbSHfxRLUA=;
 b=DNZbTLKQPliTfstgbHegNTkVrvFD9wIBWPaL0NFQ1I88MwmBHg+WCO8HWfwtfhFxyL
 qEk9VSMgQ9RCxCAGS83dDGAZiL/6nIGajfqph3NEHHw19OXDeTiSGCrss3O+kph8FksO
 fTgGXiJczEcbuxO0RZ6qBbRq48gTUE9+lau9EdAjDv3V5K0UJ5HHmMCx1jQfGVcMB8L5
 zmbiA+p1jw8kUuAONkOiEzq1acvq1zXWawi4lnVpEw5rfOYYfqlzCTJAysfhnE1gQr1I
 5pWoUZ0a8zXSRpgiRvydhFnUrGeKL464wjAC6XibCEi0I/d816J/dTFSWrjoMG/0nYF2
 9HMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686322016; x=1688914016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sdbxKBVcBVIgPeSRn3sb4Td/Dc7pVhPTKzbSHfxRLUA=;
 b=SZfRF50Im9kglZErQ0AngvjcsVcR1Nug05IX7iArMskViwtAE0vUQwGJrcJC80cJUu
 b+Z5PIB1iwr36ucWmoifQ5bJhUj5s8GCImfU6oNnV2xnsmiVXdm9myi8hvc2ZflSEcwn
 Soxwu5CzQoOKOiUBDxup1O+sX4aKpqOfNQ0ILq+UG3jFV0pOvE94yY78DL6LbEicC3hb
 VC17rY9yeCj3WLxMTSOQgamEsU5qxLyT1CzVBvkze/waMhkUPEuCp/RfKceAPI8dAISM
 tMm0Qh1bWvLVCSFtbI1rEQPT3JNmubBRP3lPJHmDeoD/DB+voYtsXNuFJvnlk6oFLwWp
 sHbg==
X-Gm-Message-State: AC+VfDyBFxpprE66AjxNnVhNivEdMtwsCdfH51vC+c9VyTomdKNi2PHY
 puqFFi9HaJdnw7Kog3wekIwegzUNhDvvyCyJiCI=
X-Google-Smtp-Source: ACHHUZ7J0l5veq+z1PgJ9eZh7SJrvdCaZgEm8srFRcMOKIil0mLDwk3fE22sVm0Zt9XOct9JtmMlMOwq65yRGatpAtk=
X-Received: by 2002:a05:6870:42c6:b0:19e:e96a:4cb9 with SMTP id
 z6-20020a05687042c600b0019ee96a4cb9mr1272834oah.23.1686322015525; Fri, 09 Jun
 2023 07:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <ZBGNmXwQoW330Wr8@hovoldconsulting.com>
 <ZIHh95IeOPBTvB00@hovoldconsulting.com>
 <CAF6AEGv3y3C6nAq7nrkgbv5-9-tVgj+BtY1yU+fXXFFm_N7fcQ@mail.gmail.com>
 <ZILEBPQgqr1HomUQ@hovoldconsulting.com>
In-Reply-To: <ZILEBPQgqr1HomUQ@hovoldconsulting.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 9 Jun 2023 07:46:44 -0700
Message-ID: <CAF6AEGsHFpGEiOLxEqzxG2VU+i+h0uVQTHcpfD4sbk0GWN2+Vg@mail.gmail.com>
Subject: Re: Adreno devfreq lockdep splat with 6.3-rc2
To: Johan Hovold <johan@kernel.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 8, 2023 at 11:17=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Thu, Jun 08, 2023 at 02:17:45PM -0700, Rob Clark wrote:
> > On Thu, Jun 8, 2023 at 7:12=E2=80=AFAM Johan Hovold <johan@kernel.org> =
wrote:
>
> > > Have you had a chance to look at this regression yet? It prevents us
> > > from using lockdep on the X13s as it is disabled as soon as we start
> > > the GPU.
> >
> > Hmm, curious what is different between x13s and sc7180/sc7280 things?
>
> It seems like lockdep needs to hit the tear down path in order to
> detect the circular lock dependency. Perhaps you don't hit that on your
> sc7180/sc7280?
>
> It is due to the fact that the panel is looked up way too late so that
> bind fails unless the panel driver is already loaded when the msm drm
> driver probes.

Oh, this seems likely

> Manually loading the panel driver before msm makes the splat go away.
>
> > Or did lockdep recently get more clever (or more annotation)?
>
> I think this is indeed a new problem related to some of the devfreq work
> you did in 6.3-rc1 (e.g. fadcc3ab1302 ("drm/msm/gpu: Bypass PM QoS
> constraint for idle clamp")).
>
> > I did spend some time a while back trying to bring some sense to
> > devfreq/pm-qos/icc locking:
> > https://patchwork.freedesktop.org/series/115028/
> >
> > but haven't had time to revisit that for a while
>
> That's the series I link to below, but IIRC it did not look directly
> applicable to the splat I see on X13s (e.g. does not involve
> fs_reclaim).

Ahh, right, sorry I've not had time to do more than glance at the
thread.. and yeah, that one is mostly just trying to solve the reclaim
problem by moving allocations out from under the big-pm-qos-lock.

As far as fadcc3ab1302 ("drm/msm/gpu: Bypass PM QoS constraint for
idle clamp"), it should be just taking the lock that
dev_pm_qos_update_request() would have indirectly, although I guess
without some intervening lock?  We can't really avoid taking the
devfreq lock, I don't think.  But I'd have to spend time I don't have
right now digging into it..

BR,
-R

> > > On Wed, Mar 15, 2023 at 10:19:21AM +0100, Johan Hovold wrote:
> > > >
> > > > Since 6.3-rc2 (or possibly -rc1), I'm now seeing the below
> > > > devfreq-related lockdep splat.
> > > >
> > > > I noticed that you posted a fix for something similar here:
> > > >
> > > >       https://lore.kernel.org/r/20230312204150.1353517-9-robdclark@=
gmail.com
> > > >
> > > > but that particular patch makes no difference.
> > > >
> > > > From skimming the calltraces below and qos/devfreq related changes =
in
> > > > 6.3-rc1 it seems like this could be related to:
> > > >
> > > >       fadcc3ab1302 ("drm/msm/gpu: Bypass PM QoS constraint for idle=
 clamp")
>
> Johan
