Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ABD258665
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 05:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7C26E153;
	Tue,  1 Sep 2020 03:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830236E153;
 Tue,  1 Sep 2020 03:42:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w13so7912204wrk.5;
 Mon, 31 Aug 2020 20:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gEP+l6VmZ2AQhT9y6MxnJyCmEVijpcWpEhbN/rykvcE=;
 b=CWrOGraZ3/zNXixoJEwLA3hwBYU2PWVJEJ6ylxVJux52OFGXCCNEGTUhC6mkNsNKpA
 i1TXATaF9rTSGwMaVqrUu1Zz/Y1O9y1drCGCIQXqHRHg9tOaU+j7fvsU/CuvZxVlMMw5
 jVxSR6ue24PPOYOWBejC9MloKJqqT/iDlRnzo7+6cRlhm0s17nQW9Gh2F7FrU9ZfvUxp
 kAj8AgciZRjeU/IJPsUe/joigfP+Mc6xw8KC+pdmtDdlV3fkmAR0oIVELnk2GPlk1ru0
 iqtKfLijhcQEQ37e9PwlNuKupuMgl1u6xVjd2ZRO3vozd8LXzB4Mr45MwWeEmJ4j6Osg
 kkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gEP+l6VmZ2AQhT9y6MxnJyCmEVijpcWpEhbN/rykvcE=;
 b=L1KgbgJzJXL8sST3TRp5gthdm4J+NXwg4I9pVPKA7N8clQzOECUOeFtgcb4kSpo2Fd
 bIOUqFg5TX9hCaen94TB47XNlT13GqHV+lBDBaaxRODXNAyTqN5WoNTwwiqkl1KjIZlX
 LX8ySzMgKHZJoURRldL9oYWa4GLohPHaZ3WtOT3Q166RD04OD/fIsLf+OAlYV55w6+JK
 rRl4Wr0qZrPYIkrjwUPkOoLPFhniNvDM73En05wvqgE0Z89XvCGf5HRKcht/D5IyCFv0
 IjevzmG1s1L9JIUvMyQ7kk/kdCrsnrvf7goP2Y+6RmFERQ2rTXXwP0SckTcFw0cEKu5w
 +cMg==
X-Gm-Message-State: AOAM5328pK3MjEybBaqddFk1BMC1I22izKw86DmdF+HhE/E6DvY6dMOa
 DyeCyrF6pgyzLgFWAn5q51/VwUfnjh2s+IeBMgs=
X-Google-Smtp-Source: ABdhPJyAYV0Dm0qLaL1mXbuG+PPAW1SP8BjwTCx+mqZtIG0Clr3g+Jy+4HR4m6cw7nu44h9gRxaSIWDuskrjmVwm3j8=
X-Received: by 2002:adf:e6c7:: with SMTP id y7mr4030589wrm.147.1598931729990; 
 Mon, 31 Aug 2020 20:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-2-robdclark@gmail.com> <20200901023517.GA54956@uller>
In-Reply-To: <20200901023517.GA54956@uller>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 31 Aug 2020 20:42:57 -0700
Message-ID: <CAF6AEGsx5mmUCuNApP692L-rS3wEbn4UqJBXuSr-38MAcVfoBw@mail.gmail.com>
Subject: Re: [PATCH 01/19] drm/msm: remove dangling submitqueue references
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 7:35 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 14 Aug 02:40 UTC 2020, Rob Clark wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Currently it doesn't matter, since we free the ctx immediately.  But
> > when we start refcnt'ing the ctx, we don't want old dangling list
> > entries to hang around.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_submitqueue.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> > index a1d94be7883a..90c9d84e6155 100644
> > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > @@ -49,8 +49,10 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
> >        * No lock needed in close and there won't
> >        * be any more user ioctls coming our way
> >        */
> > -     list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node)
> > +     list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
> > +             list_del(&entry->node);
>
> If you refcount ctx, what does that do for the entries in the submit
> queue?
>
> "entry" here is kref'ed, but you're popping it off the list regardless
> of the put ends up freeing the object or not - which afaict would mean
> leaking the object.
>

What ends up happening is the submit has reference to submit-queue,
which has reference to the ctx.. the submitqueue could be alive still
pending in-flight submits (in a later patch), but dead from the PoV of
userspace interface.

We aren't relying (or at least aren't in the end, and I *think* I
didn't miss anything in the middle) relying on ctx->submitqueues list
to clean anything up in the end, just track what is still a valid
submitqueue from userspace PoV

BR,
-R

>
> On the other hand, with the current implementation an object with higher
> refcount with adjacent objects of single refcount would end up with
> dangling pointers after the put. So in itself this change seems like a
> net gain, but I'm wondering about the plan described in the commit
> message.
>
> Regards,
> Bjorn
>
> >               msm_submitqueue_put(entry);
> > +     }
> >  }
> >
> >  int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
> > --
> > 2.26.2
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
