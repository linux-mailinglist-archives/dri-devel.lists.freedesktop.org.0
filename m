Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11057B9C75
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 12:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6172A10E036;
	Thu,  5 Oct 2023 10:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8AD10E036
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696500994; x=1728036994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=r6Cl8ANG79IWFp5qAcxltFIbVvNw6LemVUlYcUdLr6Q=;
 b=hDkAY1RFXdmBgCNqx6v3wu4Rbzm3aeXM53Ofotzcos56i0yMZtT4si77
 /uZfyM4m4X074rLNiD0ze+aQ6NVmv4NHG2VN8QKBB/8OUr8YSUZCP3aQ8
 kcPQVInqEhtkpY69iu8ZLeHyAwcVPlMZl+6o59JBehgG4Q5AoGf6ercl5
 9eig6xXAbdAdnPOMc+VdvjyWGzxHQKi0nTKAxnPw32kB7gIAvyCXS9Tn1
 CGvNpOBx2hZ9Z8t9cQKKhZg/LwFcwL+0pKJOzrGbb1CtvK5mFqenbbso3
 KbCJRnxZup11mUITnby0Do47SOYzLsPF2nB4UZRgSw31zQA+nW7w9QNxn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="414428005"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="414428005"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 03:16:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751733038"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="751733038"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga002.jf.intel.com with SMTP; 05 Oct 2023 03:16:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 05 Oct 2023 13:16:27 +0300
Date: Thu, 5 Oct 2023 13:16:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Message-ID: <ZR6M-6q_yRc-j_fG@intel.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
X-Patchwork-Hint: comment
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
Cc: Ray Strode <rstrode@redhat.com>, Ray Strode <halfline@gmail.com>,
 daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 11:57:41AM +0200, Daniel Vetter wrote:
> On Tue, Sep 26, 2023 at 01:05:49PM -0400, Ray Strode wrote:
> > From: Ray Strode <rstrode@redhat.com>
> > 
> > A drm atomic commit can be quite slow on some hardware. It can lead
> > to a lengthy queue of commands that need to get processed and waited
> > on before control can go back to user space.
> > 
> > If user space is a real-time thread, that delay can have severe
> > consequences, leading to the process getting killed for exceeding
> > rlimits.
> > 
> > This commit addresses the problem by always running the slow part of
> > a commit on a workqueue, separated from the task initiating the
> > commit.
> > 
> > This change makes the nonblocking and blocking paths work in the same way,
> > and as a result allows the task to sleep and not use up its
> > RLIMIT_RTTIME allocation.
> > 
> > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2861
> > Signed-off-by: Ray Strode <rstrode@redhat.com>
> 
> So imo the trouble with this is that we suddenly start to make
> realtime/cpu usage guarantees in the atomic ioctl. That's a _huge_ uapi
> change, because even limited to the case of !ALLOW_MODESET we do best
> effort guarantees at best. And some drivers (again amd's dc) spend a ton
> of cpu time recomputing state even for pure plane changes without any crtc
> changes like dpms on/off (at least I remember some bug reports about
> that). And that state recomputation has to happen synchronously, because
> it always influences the ioctl errno return value.
> 
> My take is that you're papering over a performance problem here of the
> "the driver is too slow/wastes too much cpu time". We should fix the
> driver, if that's possible.
> 
> Another option would be if userspace drops realtime priorities for these
> known-slow operations. And right now _all_ kms operations are potentially
> cpu and real-time wasters, the entire uapi is best effort.
> 
> We can also try to change the atomic uapi to give some hard real-time
> guarantees so that running compositors as SCHED_RT is possible, but that
> - means a very serious stream of bugs to fix all over
> - therefore needs some very wide buy-in from drivers that they're willing
>   to make this guarantee
> - probably needs some really carefully carved out limitations, because
>   there's imo flat-out no way we'll make all atomic ioctl hard time limit
>   bound
> 
> Also, as König has pointed out, you can roll this duct-tape out in
> userspace by making the commit non-blocking and immediately waiting for
> the fences.
> 
> One thing I didn't see mention is that there's a very subtle uapi
> difference between non-blocking and blocking:
> - non-blocking is not allowed to get ahead of the previous commit, and
>   will return EBUSY in that case. See the comment in
>   drm_atomic_helper_commit()
> - blocking otoh will just block until any previous pending commit has
>   finished
> 
> Not taking that into account in your patch here breaks uapi because
> userspace will suddenly get EBUSY when they don't expect that.

The -EBUSY logic already checks whether the current commit is
non-blocking vs. blocking commit, so I don't see how there would
be any change in behaviour from simply stuffing the commit_tail
onto a workqueue, especially as the locks will be still held across
the flush.

In my earlier series [1] where I move the flush to happen after dropping
the locks there is a far more subtle issue because currently even
non-blocking commits can actually block due to the mutex. Changing
that might break something, so I preserved that behaviour explicitly.
Full explanation in the first patch there.

[1] https://patchwork.freedesktop.org/series/108668/

-- 
Ville Syrjälä
Intel
