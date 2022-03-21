Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400444E2A44
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 15:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DFA10E337;
	Mon, 21 Mar 2022 14:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00ACB10E361
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 14:15:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q8so9529162wrc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3LGCCJx6wAjQY2VttL5q4VtJQ3mq5u0TMgNggjX0a1g=;
 b=GHzhEIPbeZiX9JufZAlC0WrQxeA7yPxZG9Z05ioMPOtVUdWhhcYcCSXxTNX0vtkFX9
 llgW0swP3cht3EeVaODCxO1SKOAPT5sAM9xuPbdZ6EjYJ5R4IdxVmYfy1gZkJ4IKtZTy
 yVMxbZuTwfM7i9wrArqDPmf5t5/LkAEbg5OW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3LGCCJx6wAjQY2VttL5q4VtJQ3mq5u0TMgNggjX0a1g=;
 b=XFoSI5IDTV4fPYKsUxx0eotl+dPHJ+ijd1KYO2Mme9vtyipOlJf8kMNCQQViWm/q7v
 3jpkghyTRHB1dTYK88Qp3IXzEAIUz03BZdRLWH1NRHCLopEYXqauQQnuAEeFxUuhPY2h
 iJCU/83tRY1rYlzgDQajDih+8HC9G2Ty1qlS3umrxW4yJ9VeMa4sxBUzVrIN8HHmzGUA
 kGCFz0JfNMTsgJDxafbfOAFCE9wffO8se1a3mFa461v/C6P8ZPP5Tl7JH5LqJehIxgkg
 fZEicDvpME59ejcRDVJvywDQ8hghze0xXaxrthfvq8Kt2hxNFdvemqvu329ItIBTwH0U
 xvZg==
X-Gm-Message-State: AOAM5304p1X0tD+1qfs56WWitNQQIeLFNWXU/OIFVY5xXLxiBpYiDEJd
 hOyF7br6P6u4SgJYYRZ+yc1YblG6jI40/biP
X-Google-Smtp-Source: ABdhPJwfS5a0DvVbMY2xlo3RDr89udt1Kv5Op6mlPpfyf+TzQI1P5aO1ryS7sJOJkPr3S4UfOHopzQ==
X-Received: by 2002:adf:f343:0:b0:203:ee8e:7585 with SMTP id
 e3-20020adff343000000b00203ee8e7585mr15658680wrp.107.1647872128324; 
 Mon, 21 Mar 2022 07:15:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a7bcb84000000b00389efb7a5b4sm13768934wmi.17.2022.03.21.07.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 07:15:27 -0700 (PDT)
Date: Mon, 21 Mar 2022 15:15:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Message-ID: <YjiIfVuzMeOiUVtU@phenom.ffwll.local>
References: <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
 <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
 <YjNvYmcuDKiIneDx@phenom.ffwll.local>
 <CAF6AEGvuMfKtf_aweai6y4oHghArE95uhR2X0f9h_9w4Bk_6VQ@mail.gmail.com>
 <19a67000-d1e5-0582-c6de-07d9988b1735@amd.com>
 <CAF6AEGvDjw6zq3yiorhOc+vp2US+Jso9tF74=8gyJMTm=K5FVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvDjw6zq3yiorhOc+vp2US+Jso9tF74=8gyJMTm=K5FVQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 18, 2022 at 08:12:54AM -0700, Rob Clark wrote:
> On Fri, Mar 18, 2022 at 12:42 AM Christian König
> <christian.koenig@amd.com> wrote:
> >
> > Am 17.03.22 um 18:31 schrieb Rob Clark:
> > > On Thu, Mar 17, 2022 at 10:27 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >> [SNIP]
> > >>> (At some point, I'd like to use scheduler for the replay, and actually
> > >>> use drm_sched_stop()/etc.. but last time I looked there were still
> > >>> some sched bugs in that area which prevented me from deleting a bunch
> > >>> of code ;-))
> > >> Not sure about your hw, but at least on intel replaying tends to just
> > >> result in follow-on fun. And that holds even more so the more complex a
> > >> workload is. This is why vk just dies immediately and does not try to
> > >> replay anything, offloading it to the app. Same with arb robusteness.
> > >> Afaik it's really only media and classic gl which insist that the driver
> > >> stack somehow recover.
> > > At least for us, each submit must be self-contained (ie. not rely on
> > > previous GPU hw state), so in practice replay works out pretty well.
> > > The worst case is subsequent submits from same process fail as well
> > > (if they depended on something that crashing submit failed to write
> > > back to memory.. but in that case they just crash as well and we move
> > > on to the next one.. the recent gens (a5xx+ at least) are pretty good
> > > about quickly detecting problems and giving us an error irq.
> >
> > Well I absolutely agree with Daniel.
> >
> > The whole replay thing AMD did in the scheduler is an absolutely mess
> > and should probably be killed with fire.
> >
> > I strongly recommend not to do the same mistake in other drivers.
> >
> > If you want to have some replay feature then please make it driver
> > specific and don't use anything from the infrastructure in the DRM
> > scheduler.
> 
> hmm, perhaps I was not clear, but I'm only talking about re-emitting
> jobs *following* the faulting one (which could be from other contexts,
> etc).. not trying to restart the faulting job.

You absolutely can drop jobs on the floor, this is what both anv and iris
expect. They use what we call non-recoverable context, meaning when any
gpu hang happens and the context is affect (whether as the guilty on, or
because it was a multi-engine reset and it was victimized) we kill it
entirely. No replaying, and any further execbuf ioctl fails with -EIO.

Userspace then gets to sort out the mess, which for vk is
VK_ERROR_DEVICE_LOST, for robust gl it's the same, and for non-robust gl
iris re-creates a pile of things.

Anything in-between _is_ dropped on the floor completely.

Also note that this is obviously uapi, if you have an userspace which
expect contexts to survive, then replaying makes some sense.

> You *absolutely* need to replay jobs following the faulting one, they
> could be from unrelated contexts/processes.  You can't just drop them
> on the floor.
> 
> Currently it is all driver specific, but I wanted to delete a lot of
> code and move to using scheduler to handle faults/timeouts (but
> blocked on that until [1] is resolved)

Yeah for the drivers where the uapi is "you can safely replay after a
hang, and you're supposed to", then sharing the code is ofc a good idea.

Just wanted to make it clear that this is only one of many uapi flavours
you can pick from, dropping it all on the floor is a perfectly legit
approach :-) And imo it's the more robust one, and also better fits with
latest apis like gl_arb_robustness or vk.

Cheers, Daniel


> 
> [1] https://patchwork.kernel.org/project/dri-devel/patch/1630457207-13107-2-git-send-email-Monk.Liu@amd.com/
> 
> BR,
> -R
> 
> > Thanks,
> > Christian.
> >
> > >
> > > BR,
> > > -R
> > >
> > >> And recovering from a mess in userspace is a lot simpler than trying to
> > >> pull of the same magic in the kernel. Plus it also helps with a few of the
> > >> dma_fence rules, which is a nice bonus.
> > >> -Daniel
> > >>
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
