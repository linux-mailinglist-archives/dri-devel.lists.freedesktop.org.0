Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E8D28709E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 10:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB37A6E40C;
	Thu,  8 Oct 2020 08:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB3A6E40C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 08:24:16 +0000 (UTC)
IronPort-SDR: w8Qg3FTTAl2laICZ+Ujgs8eycYNVLHH2FljjysMdFLUpFYyc0x4Terx12O5vOwlOZSbc1SX6Lb
 I8HtaDRKcj/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="164512003"
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; d="scan'208";a="164512003"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2020 01:24:15 -0700
IronPort-SDR: G8xnXCtgmC4/g92wR5jrFHt00I7i4yvQ0gk9IdWr6pN7aCGoCsMdT9y8QfQn1lTPmYjg8MYjLA
 m+dm9gB/9iAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; d="scan'208";a="297875033"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 08 Oct 2020 01:24:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 08 Oct 2020 11:24:11 +0300
Date: Thu, 8 Oct 2020 11:24:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201008082411.GE6112@intel.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
 <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
 <CAKMK7uEd853irzdBMCcaNEMAeOZKVFcFpgNtcYrgQkmHxdT3-w@mail.gmail.com>
 <20201002105256.GA6112@intel.com> <20201002110544.GB6112@intel.com>
 <CAF6AEGv+UnZJoBj_ELRVr4sQeMs52vAgyw2g+wtabLPBrYDKvw@mail.gmail.com>
 <20201005121524.GI6112@intel.com>
 <CAF6AEGtgTb-1YQpL4CV2A=CQxkSxjn-FxDybrzSitTDSmCY_GA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtgTb-1YQpL4CV2A=CQxkSxjn-FxDybrzSitTDSmCY_GA@mail.gmail.com>
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
 open list <linux-kernel@vger.kernel.org>, Tim Murray <timmurray@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>,
 Qais Yousef <qais.yousef@arm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 07, 2020 at 09:44:09AM -0700, Rob Clark wrote:
> On Mon, Oct 5, 2020 at 5:15 AM Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Fri, Oct 02, 2020 at 10:55:52AM -0700, Rob Clark wrote:
> > > On Fri, Oct 2, 2020 at 4:05 AM Ville Syrj=E4l=E4
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Fri, Oct 02, 2020 at 01:52:56PM +0300, Ville Syrj=E4l=E4 wrote:
> > > > > On Thu, Oct 01, 2020 at 05:25:55PM +0200, Daniel Vetter wrote:
> > > > > > On Thu, Oct 1, 2020 at 5:15 PM Rob Clark <robdclark@gmail.com> =
wrote:
> > > > > > >
> > > > > > > I'm leaning towards converting the other drivers over to use =
the
> > > > > > > per-crtc kwork, and then dropping the 'commit_work` from atom=
ic state.
> > > > > > > I can add a patch to that, but figured I could postpone that =
churn
> > > > > > > until there is some by-in on this whole idea.
> > > > > >
> > > > > > i915 has its own commit code, it's not even using the current c=
ommit
> > > > > > helpers (nor the commit_work). Not sure how much other fun ther=
e is.
> > > > >
> > > > > I don't think we want per-crtc threads for this in i915. Seems
> > > > > to me easier to guarantee atomicity across multiple crtcs if
> > > > > we just commit them from the same thread.
> > > >
> > > > Oh, and we may have to commit things in a very specific order
> > > > to guarantee the hw doesn't fall over, so yeah definitely per-crtc
> > > > thread is a no go.
> > >
> > > If I'm understanding the i915 code, this is only the case for modeset
> > > commits?  I suppose we could achieve the same result by just deciding
> > > to pick the kthread of the first CRTC for modeset commits.  I'm not
> > > really so much concerned about parallelism for modeset.
> >
> > I'm not entirely happy about the random differences between modesets
> > and other commits. Ideally we wouldn't need any.
> >
> > Anyways, even if we ignore modesets we still have the issue with
> > atomicity guarantees across multiple crtcs. So I think we still
> > don't want per-crtc threads, rather it should be thread for each
> > commit.
> =

> I don't really see any other way to solve the priority inversion other
> than per-CRTC kthreads.

What's the problem with just something like a dedicated commit
thread pool?

> I've been thinking about it a bit more, and
> my conclusion is:
> =

> (1) There isn't really any use for the N+1'th commit to start running
> before the kthread_work for the N'th commit completes, so I don't mind
> losing the unbound aspect of the workqueue approach
> (2) For cases where there does need to be serialization between
> commits on different CRTCs, since there is a per-CRTC kthread, you
> could achieve this with locking
> =

> Since i915 isn't using the atomic helpers here, I suppose it is an
> option for i915 to just continue doing what it is doing.
> =

> And I could ofc just stop using the atomic commit helper and do the
> kthreads thing in msm. But my first preference would be that the
> commit helper does generally the right thing.
> =

> BR,
> -R

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
