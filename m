Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABD63B1ED5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 18:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC0389DCF;
	Wed, 23 Jun 2021 16:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20E489DCF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 16:40:32 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id t40so3974462oiw.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bO3c0b9bzbqPxvGmERe0nw3g2m3wyHb0ArYewc22GjQ=;
 b=DfoDoZ1ATLOkPaoJJP1Y7Recb/hAUT58sys4flMjVyoDcCCj6MIPWobP35k276tjun
 m2Qpp8n2WyNNmg/DWg2tEVkuWg3wJfRFrJmDb0y/OcQc1esqZFUFmqCp9UW6J7brOidk
 rX+bwu4KzBcJZkU37RV+ZYYNZwZZ69NurIxxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bO3c0b9bzbqPxvGmERe0nw3g2m3wyHb0ArYewc22GjQ=;
 b=hcmgvSv7xNz0hmDs2CZ6Hgc4xmq4pvyz96neFQIUE6KLEolj/K5oTLxrCXGJrLE8k5
 mzC4awEPYSnNzqWpq6IZKFf0OYsyOTIDArXRKUFAPL8V50QnB//C1UY2iRNhG0v0Ci6W
 gZ2//goZqPwMRgaSK683GYqU0aXlaCAZeIYwItNogY2w/BYlS6GtrXepiiDOO/ONjLxT
 DOZnwMBiEVSh+/3Adws8jheZ5Jr00qtezahiX40FQv8zg76/iv/pLx8tBGOfzuM2lOIj
 XFTeax8LxJBKkjgCpCGy7CUd9xIkoTNmj8s9T2ZmBCRZIlalFQ5f/X/vuaUEzZEfJmY6
 NoTA==
X-Gm-Message-State: AOAM533KNcEf8mrFVnHV5uK7IGoVxD3/GmED6oXhAwLyf3wN7QKzl32D
 Jo8ci9CsbwysGMmYknhLRy7oi30dE/BDV0DDEjIYmA==
X-Google-Smtp-Source: ABdhPJyoNgJIYOchT7dS33bxVfM9JG6GsPV457EI4PNXGKki7TlM99Ox1QmJPsnohK7Glr2xGWwmZXGSfqBa/K0/ATQ=
X-Received: by 2002:a54:4889:: with SMTP id r9mr3836956oic.101.1624466431860; 
 Wed, 23 Jun 2021 09:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210621193644.105627-1-thomas.hellstrom@linux.intel.com>
 <20210621193644.105627-2-thomas.hellstrom@linux.intel.com>
 <YNNOoqnFOWw1Xgrf@phenom.ffwll.local>
 <0415be07-452e-d7de-ecfa-9c0f80ad5fee@linux.intel.com>
In-Reply-To: <0415be07-452e-d7de-ecfa-9c0f80ad5fee@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 23 Jun 2021 18:40:20 +0200
Message-ID: <CAKMK7uGnyGSqXjuMFid4vFkgQMhjRDt+1HdoLTsE3aSqp6A4Yw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v6 1/3] drm/i915: Update object placement
 flags to be mutable
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 5:38 PM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Thanks for reviewing, Daniel.
>
> On 6/23/21 5:09 PM, Daniel Vetter wrote:
> >
> >>
> >> +    unsigned int mem_flags:2;
> > Is the entire bitfield array all protected by dma_resv_lock? If not I'd
> > just go with a full field, avoids headaches and all that.
> >
> > Also kerneldoc for this would be really sweet. Means some work to get i=
t
> > going,
>
> Yeah, late documentation review comments after v9 ought to be forbidden ;=
)

Well I think we should have locking and all that documented from the
start maybe :-P

But yeah I know it's a bit late, so totally fine if that's done as a
follow up on top. But for new stuff or revised stuff we need to start
somewhere, and "maybe later when we have time" just never cuts it ...

>
> > but somewhere we need to stop hacking together undocumented ad-hoc
> > locking schemes :-/
>
> Hmm, this was intended to replace the change of and access of object ops
> *without* the lock held and with proper asserts added in the accessors,
> so it was not really intended to be an ad-hoc locking scheme, It's
> simply placement related things are updated under the lock.

Yeah this was more meant as a general comment. E.g. in struct i915_vma
we now have the situation that we have 2 overlapping locking schemes,
and it's almost impossible to figure out which is infect for which
pieces. I'd like to avoid that if at all possible.

> I'll update the code and resend.

Thanks, Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
