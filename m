Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988F018AE09
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7AD6E9A3;
	Thu, 19 Mar 2020 08:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A205A6E879
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 08:10:06 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id q9so4007477iod.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 01:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YXUayrHOPCJzF/6FJoY+BFEj3UMjmlbmnbZlPdkq6Po=;
 b=pgzbRt/reLTxd85HZ30lCVjELDNH9uycFJL3DJEFaKEB4p9NYustgyiOUAru6uWokT
 KI/F9LITN3XPzA7Hix1Bo5Kq1oH8I9u7saEJqACjSa8VP+P7nkpINUwi7jxAWD6K4CNJ
 vQOkhkvXrfBiMHt9EyVawr+UOjGLjnJ/9yMeKb6MDNXLm8i19ya5cJU+qY9xF99Omoas
 qBq1oi26LxtSVWRiI7FOXmaUq7KF+D/ioNFopm5Bs5ePKqM6mVJ1W9iVIrnwN5ojUTuU
 w3zqG/TXVPYrLW2zsd2Rg85DQ0lKTp1K09boKVZDyP6OAd882v6yqAvxx9/1dX90r1tf
 ijVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YXUayrHOPCJzF/6FJoY+BFEj3UMjmlbmnbZlPdkq6Po=;
 b=cWlR2Af1UAPiF5NQc8HZHA2ep+ixiHiCWDLFwcNnFpO+wf4n2eTUcm35RIWgkQ3IZe
 fWjo2H+lrGo7hru5MqL5yKWBciFsNRqPytq885Bf0B2dGzUQjxAZdd3vUkJzjMTlvXTM
 M0ndX79bGaxuiVKHySIdn0VsNVXevP7htlcVUhMIK04m36PJGiUrhPQeB4vMlQcMRW7X
 VCVZfUWYdwPJR1xvYmdssB0iNNmLFjHcuBSA6tshmtXpC3mp0p7oJHHhH/43de/j6ngx
 zG6QPdhjurOXoorDtNd+BnVKFw0lsmyEBUXWhnbrao/bpKUPWNKonOJsNarjK7CLtVn2
 5xHw==
X-Gm-Message-State: ANhLgQ1Mqv5Zx65pmro8obFok/HsQIh+EwJlbOykvrf18zG7ql/JXsUr
 eR9NYifx6aEOmQeABr7lSPmDcqxfYqi0Gj674kQ=
X-Google-Smtp-Source: ADFU+vtGaqToi+tepJgBsiJW6SjUf+4rCoDpemJXpl7GqXhJtz7305Sug3Xc0GMfFtuEBRvOt1afdJSJ/Ji7A3ARPyo=
X-Received: by 2002:a6b:c813:: with SMTP id y19mr2610596iof.125.1584519005895; 
 Wed, 18 Mar 2020 01:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <1584343103-13896-1-git-send-email-hqjagain@gmail.com>
 <20200317170243.GR2363188@phenom.ffwll.local>
 <CAJRQjofSWYR--4V_4zmp6K9WVtqShdzpGuH1VFBPvHpViGYH5g@mail.gmail.com>
 <CAKMK7uG8v7cYUwqTJTgYGfC8LEZtczTZ5a+Z4NcRnbFVBcG4Fw@mail.gmail.com>
In-Reply-To: <CAKMK7uG8v7cYUwqTJTgYGfC8LEZtczTZ5a+Z4NcRnbFVBcG4Fw@mail.gmail.com>
From: Qiujun Huang <hqjagain@gmail.com>
Date: Wed, 18 Mar 2020 16:09:55 +0800
Message-ID: <CAJRQjodZegs-9GE8ypkAiU2gC_x=tAYvOz-_dseOyiDvfMApUA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/lease: fix potential race in fill_object_idr
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Thu, 19 Mar 2020 08:08:58 +0000
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
Cc: Marco Elver <elver@google.com>, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 3:34 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Mar 17, 2020 at 11:33 PM Qiujun Huang <hqjagain@gmail.com> wrote:
> >
> > On Wed, Mar 18, 2020 at 1:02 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, Mar 16, 2020 at 03:18:23PM +0800, Qiujun Huang wrote:
> > > > We should hold idr_mutex for idr_alloc.
> > > >
> > > > Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> > >
> > > I've not seen the first version of this anywhere in my inbox, not sure
> > > where that got lost.
> > >
> > > Anyway, this seems like a false positive - I'm assuming this was caught
> > > with KCSAN. The commit message really should mention that.
> > >
> > > fill_object_idr creates the idr, which yes is only access later on under
> > > the idr_mutex. But here it's not yet visible to any other thread, and
> > > hence lockless access is safe and correct.
> >
> > Agree that.
>
> Do you know what the recommended annotation for kcsan false positives
> like this should be? Adding kcsan author Marco.

Actually it's not reported by kcsan. I found idr_alloc isn't safe for
parallel modifications,
and I didn't understand it's a exclusive path here.  :)

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
