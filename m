Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CF969E662
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 18:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF31510E8BB;
	Tue, 21 Feb 2023 17:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926B710E8BB;
 Tue, 21 Feb 2023 17:54:07 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-17235c8dab9so2555823fac.7; 
 Tue, 21 Feb 2023 09:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VMKhHmrd8lVSmliqVHExAgWorD/pXxkRRPzGvtF73wg=;
 b=REEtn8PXtknW4y+6JwJtS9B4rLCRy5IdlJX8uMlYtB7FFFedOYzYTq/GgUwVy/bb7q
 tM+1bwi/KgXmj/U4wkmFwrh6jpMQdVPSRCv1rQHKfu36P3M1/eOa38cAFmGo2HS0gDxt
 TKgY4e2BnldR8TUtEEiyg55EEfDITdss4jIDSPFiJcBrU2AC/GKCR8JIMYvXjk2wBjk/
 7hxcQLhU2Xnv3iOBkrK+cgRDzcopZztIJRh1q+Oly9r6yLK1vJjxaEqjnLA4EjvayWxf
 zE23qNdSulwFR02SScgR9bvPvO/GTTzCEH8IrC6tm7VZgw1o0F/Rd3oae0/EgGp6KWwT
 HfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VMKhHmrd8lVSmliqVHExAgWorD/pXxkRRPzGvtF73wg=;
 b=WsppRuUsMF8hj7ChvbGJkduEAaV2pNhpSxRxrNqSeXC33+zHpJvdCK3ZWJp3xqJM6a
 qstWo6oKwhE+dLrPYBhZLi85pK2h0J2DwjDwMExFCvNUMm/LrkF7b5Si+WWU0KTT1is2
 J2A7sgJnwGVDIGrF4oM23+fGdmYBm1oZMoh2rAItTfJdNAC8FmzGZstwgGrLPpM1t/Wl
 3O2DGfzi8r03JPvYizkftxuVaEpybzpEOqvYG/Uevmfr+8w9o7HDYxDsX2+3eSh/DEU3
 cNr57Y5P078jQZcgcqu/etgmevZBEkjlA8PSch6NZO1jUPNzgSwIM7vDGqTHSAopSpyK
 KmMA==
X-Gm-Message-State: AO0yUKW1cJ5/7QrcY7G+Rd7YeHXLlqNWpIZYELnRFfYj76LtvXQ8tmN/
 0EpBB5G0e/byRVjt2tg0Z+o6BAmUP00JM0mzR9o=
X-Google-Smtp-Source: AK7set+Z+oPJUCqI/EoSMrVRlg+YMtuXgiK4i/ekz/43uKn112T5GqKqwizp2tik7ddFnI7qZP5oOWulwO0SuN2evZ4=
X-Received: by 2002:a05:6870:32d4:b0:16e:5e5a:49da with SMTP id
 r20-20020a05687032d400b0016e5e5a49damr1496718oac.58.1677002046702; Tue, 21
 Feb 2023 09:54:06 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <cdd5f892-49b9-1e22-4dc1-95a8a733c453@amd.com>
In-Reply-To: <cdd5f892-49b9-1e22-4dc1-95a8a733c453@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Feb 2023 09:53:56 -0800
Message-ID: <CAF6AEGuMn3FywPkEtfJ7oZ16A0Bk2aiaRvj4si4od1d3wzXkPw@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
To: Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 8:48 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> On 2023-02-20 11:14, Rob Clark wrote:
> > On Mon, Feb 20, 2023 at 12:53 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >>
> >> On Sat, 18 Feb 2023 13:15:49 -0800
> >> Rob Clark <robdclark@gmail.com> wrote:
> >>
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urgent
> >>> wait (as opposed to a "housekeeping" wait to know when to cleanup after
> >>> some work has completed).  Usermode components of GPU driver stacks
> >>> often poll() on fence fd's to know when it is safe to do things like
> >>> free or reuse a buffer, but they can also poll() on a fence fd when
> >>> waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI flag
> >>> lets the kernel differentiate these two cases.
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>
> >> Hi,
> >>
> >> where would the UAPI documentation of this go?
> >> It seems to be missing.
> >
> > Good question, I am not sure.  The poll() man page has a description,
> > but my usage doesn't fit that _exactly_ (but OTOH the description is a
> > bit vague).
> >
> >> If a Wayland compositor is polling application fences to know which
> >> client buffer to use in its rendering, should the compositor poll with
> >> PRI or not? If a compositor polls with PRI, then all fences from all
> >> applications would always be PRI. Would that be harmful somehow or
> >> would it be beneficial?
> >
> > I think a compositor would rather use the deadline ioctl and then poll
> > without PRI.  Otherwise you are giving an urgency signal to the fence
> > signaller which might not necessarily be needed.
> >
> > The places where I expect PRI to be useful is more in mesa (things
> > like glFinish(), readpix, and other similar sorts of blocking APIs)
> Hi,
>
> Hmm, but then user-space could do the opposite, namely, submit work as usual--never
> using the SET_DEADLINE ioctl, and then at the end, poll using (E)POLLPRI. That seems
> like a possible usage pattern, unintended--maybe, but possible. Do we want to discourage
> this? Wouldn't SET_DEADLINE be enough? I mean, one can call SET_DEADLINE with the current
> time, and then wouldn't that be equivalent to (E)POLLPRI?

Yeah, (E)POLLPRI isn't strictly needed if we have SET_DEADLINE.  It is
slightly more convenient if you want an immediate deadline (single
syscall instead of two), but not strictly needed.  OTOH it piggy-backs
on existing UABI.

BR,
-R
