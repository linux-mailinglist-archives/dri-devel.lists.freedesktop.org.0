Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AAC2810EB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 13:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D755A6E929;
	Fri,  2 Oct 2020 11:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C296E929
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 11:05:53 +0000 (UTC)
IronPort-SDR: Eno97nTB1alg5ANi00qMsJj4v15i0FY27zIU/FR07b0HWJA30TggAQf2SmaKNTs99tOsVd8ooj
 YLZesb8YMzUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="224579211"
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; d="scan'208";a="224579211"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 04:05:50 -0700
IronPort-SDR: QxNZ2X+JL+y0DoAQRWUbBFRyiidnIV2PWCnd36xj8LCNCcIwk1QTSzujYdAY3hmkdypBK6bMIa
 e+bKX4WRG1gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; d="scan'208";a="313473301"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 02 Oct 2020 04:05:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 02 Oct 2020 14:05:44 +0300
Date: Fri, 2 Oct 2020 14:05:44 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201002110544.GB6112@intel.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
 <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
 <CAKMK7uEd853irzdBMCcaNEMAeOZKVFcFpgNtcYrgQkmHxdT3-w@mail.gmail.com>
 <20201002105256.GA6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201002105256.GA6112@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tim Murray <timmurray@google.com>,
 Tejun Heo <tj@kernel.org>, Qais Yousef <qais.yousef@arm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 02, 2020 at 01:52:56PM +0300, Ville Syrj=E4l=E4 wrote:
> On Thu, Oct 01, 2020 at 05:25:55PM +0200, Daniel Vetter wrote:
> > On Thu, Oct 1, 2020 at 5:15 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Thu, Oct 1, 2020 at 12:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Wed, Sep 30, 2020 at 11:16 PM Rob Clark <robdclark@gmail.com> wr=
ote:
> > > > >
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > The android userspace treats the display pipeline as a realtime p=
roblem.
> > > > > And arguably, if your goal is to not miss frame deadlines (ie. vb=
lank),
> > > > > it is.  (See https://lwn.net/Articles/809545/ for the best explai=
nation
> > > > > that I found.)
> > > > >
> > > > > But this presents a problem with using workqueues for non-blocking
> > > > > atomic commit_work(), because the SCHED_FIFO userspace thread(s) =
can
> > > > > preempt the worker.  Which is not really the outcome you want.. o=
nce
> > > > > the required fences are scheduled, you want to push the atomic co=
mmit
> > > > > down to hw ASAP.
> > > > >
> > > > > But the decision of whether commit_work should be RT or not really
> > > > > depends on what userspace is doing.  For a pure CFS userspace dis=
play
> > > > > pipeline, commit_work() should remain SCHED_NORMAL.
> > > > >
> > > > > To handle this, convert non-blocking commit_work() to use per-CRTC
> > > > > kthread workers, instead of system_unbound_wq.  Per-CRTC workers =
are
> > > > > used to avoid serializing commits when userspace is using a per-C=
RTC
> > > > > update loop.  And the last patch exposes the task id to userspace=
 as
> > > > > a CRTC property, so that userspace can adjust the priority and sc=
hed
> > > > > policy to fit it's needs.
> > > > >
> > > > >
> > > > > v2: Drop client cap and in-kernel setting of priority/policy in
> > > > >     favor of exposing the kworker tid to userspace so that user-
> > > > >     space can set priority/policy.
> > > >
> > > > Yeah I think this looks more reasonable. Still a bit irky interface,
> > > > so I'd like to get some kworker/rt ack on this. Other opens:
> > > > - needs userspace, the usual drill
> > >
> > > fwiw, right now the userspace is "modetest + chrt".. *probably* the
> > > userspace will become a standalone helper or daemon, mostly because
> > > the chrome gpu-process sandbox does not allow setting SCHED_FIFO.  I'm
> > > still entertaining the possibility of switching between rt and cfs
> > > depending on what is in the foreground (ie. only do rt for android
> > > apps).
> > >
> > > > - we need this also for vblank workers, otherwise this wont work for
> > > > drivers needing those because of another priority inversion.
> > >
> > > I have a thought on that, see below..
> > =

> > Hm, not seeing anything about vblank worker below?
> > =

> > > > - we probably want some indication of whether this actually does
> > > > something useful, not all drivers use atomic commit helpers. Not su=
re
> > > > how to do that.
> > >
> > > I'm leaning towards converting the other drivers over to use the
> > > per-crtc kwork, and then dropping the 'commit_work` from atomic state.
> > > I can add a patch to that, but figured I could postpone that churn
> > > until there is some by-in on this whole idea.
> > =

> > i915 has its own commit code, it's not even using the current commit
> > helpers (nor the commit_work). Not sure how much other fun there is.
> =

> I don't think we want per-crtc threads for this in i915. Seems
> to me easier to guarantee atomicity across multiple crtcs if
> we just commit them from the same thread.

Oh, and we may have to commit things in a very specific order
to guarantee the hw doesn't fall over, so yeah definitely per-crtc
thread is a no go.

I don't even understand the serialization argument. If the commits
are truly independent then why isn't the unbound wq enough to avoid
the serialization? It should just spin up a new thread for each commit
no?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
