Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28123E04AB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 17:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84DD6EAC0;
	Wed,  4 Aug 2021 15:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9158C6EAC1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 15:46:51 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m12so2741638wru.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=J49YuwjHy2NOI3/UOq5v3ZkPSTtuAE8eHm0+63f8mt0=;
 b=KKCQHWgX85/6DkpOCs44CvbaGognlL5uAllvJp6ktA0cfVBb2a0VLnwQKQFEPMJSGt
 IjipCXmpd3p/rMnJU3NKfgXJYiI9so2/XFXEJe0cMMXp5zNxiUTtF1sDuts9Tiehmw9Y
 QvzEEfotIqIv3605wLYfTmRJgR2g55rCpxkxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=J49YuwjHy2NOI3/UOq5v3ZkPSTtuAE8eHm0+63f8mt0=;
 b=sxKJGcP/rplviTCj2RwpdkXZF1LV5o3yTflk43pvWu25waa2kCBzDKZR9WsyHPI+b/
 KOyjgp9DO3fTMigs1fTdkI9pGS/9e3/fKAnOE5k2eRvLPgt07SJ8NPAspVJqIC6oiqwG
 DoKFqppdQz2MlgOB/2vzRZ/rmDuPoK80s/Stg0yO428M4a5AodWV/8WE9B1YXx1caHSY
 YZNS+PctBTGtTd80MO9vQ3/k3HIfKSLeAgDuB5Osf4CjxgkOd0cdR/KHOyOToa5mapD/
 3X4vlSAv6FcBTDlFPbamm6RprCGrwpZk2AJUl2sNsZdHe0bo+0HFhrgq0JLr2AYlul19
 pyYg==
X-Gm-Message-State: AOAM530hRCxT6Dv5AChzEp45q4dpLe3nohAvZVIugjLwM/C+mr4w6rRc
 C+UNbZeRkOKSu/xw+9Ev05R+IQ==
X-Google-Smtp-Source: ABdhPJzFNOQREtlSZqHizztAPtbXsy+1Xtqkjpp3JnfkEup7uznIjBJWXvQVSfLGYMfdqxnxjiISOg==
X-Received: by 2002:a5d:59ab:: with SMTP id p11mr30422wrr.238.1628092009803;
 Wed, 04 Aug 2021 08:46:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p15sm2638112wmi.29.2021.08.04.08.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 08:46:48 -0700 (PDT)
Date: Wed, 4 Aug 2021 17:46:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zhenneng Li <lizhenneng@kylinos.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/radeon: Update pitch for page flip
Message-ID: <YQq2YAi4w79JNO4H@phenom.ffwll.local>
Mail-Followup-To: Alex Deucher <alexdeucher@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zhenneng Li <lizhenneng@kylinos.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20210802074310.1526526-1-lizhenneng@kylinos.cn>
 <e6e77cfb-4e6b-c30e-ae7c-ac84b82c9a75@amd.com>
 <YQetXMaASz/F2EyS@phenom.ffwll.local>
 <CADnq5_PDtEn1y5HJBRHXw8o11LVwSRDKNtQgZtN5u0CW5ZspnQ@mail.gmail.com>
 <6a34fcc3-0aa3-85ff-21c4-86b9b5a48fd5@daenzer.net>
 <CADnq5_MJ=m2_VvzCQ7wJaFx2=OfFfLpoJtc_Ofb+a-v3eujtXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_MJ=m2_VvzCQ7wJaFx2=OfFfLpoJtc_Ofb+a-v3eujtXg@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Tue, Aug 03, 2021 at 10:49:39AM -0400, Alex Deucher wrote:
> On Tue, Aug 3, 2021 at 4:34 AM Michel Dänzer <michel@daenzer.net> wrote:
> >
> > On 2021-08-02 4:51 p.m., Alex Deucher wrote:
> > > On Mon, Aug 2, 2021 at 4:31 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >>
> > >> On Mon, Aug 02, 2021 at 10:12:47AM +0200, Christian König wrote:
> > >>> Am 02.08.21 um 09:43 schrieb Zhenneng Li:
> > >>>> When primary bo is updated, crtc's pitch may
> > >>>> have not been updated, this will lead to show
> > >>>> disorder content when user changes display mode,
> > >>>> we update crtc's pitch in page flip to avoid
> > >>>> this bug.
> > >>>> This refers to amdgpu's pageflip.
> > >>>
> > >>> Alex is the expert to ask about that code, but I'm not sure if that is
> > >>> really correct for the old hardware.
> > >>>
> > >>> As far as I know the crtc's pitch should not change during a page flip, but
> > >>> only during a full mode set.
> > >>>
> > >>> So could you elaborate a bit more how you trigger this?
> > >>
> > >> legacy page_flip ioctl only verifies that the fb->format stays the same.
> > >> It doesn't check anything else (afair never has), this is all up to
> > >> drivers to verify.
> > >>
> > >> Personally I'd say add a check to reject this, since testing this and
> > >> making sure it really works everywhere is probably a bit much on this old
> > >> hw.
> > >
> > > If just the pitch changed, that probably wouldn't be much of a
> > > problem, but if the pitch is changing, that probably implies other
> > > stuff has changed as well and we'll just be chasing changes.  I agree
> > > it would be best to just reject anything other than updating the
> > > scanout address.
> >
> > FWIW, that means page flipping cannot be used in some cases which work fine by changing the pitch, which can result in tearing: https://gitlab.freedesktop.org/xorg/xserver/-/issues/839 (which says the i915 driver handles this as well).
> >
> 
> Ok.  In that case, @Zhenneng can you update all of the pitch in all of
> the page_flip functions in radeon rather than just the evergreen one?

atomic drivers handle this fairly ok-ish, since we have a proper
atomic_check there.

For legacy kms I just wouldn't bother, too many corners to validate. But
also if you're bored, just do it :-)
-Daniel

> 
> Thanks,
> 
> Alex
> 
> 
> >
> > --
> > Earthling Michel Dänzer               |               https://redhat.com
> > Libre software enthusiast             |             Mesa and X developer

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
