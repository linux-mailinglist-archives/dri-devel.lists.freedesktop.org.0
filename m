Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2C27BF9F5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 13:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0503310E1DF;
	Tue, 10 Oct 2023 11:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620DC10E075
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 11:41:33 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-406532c49dcso14544555e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 04:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1696938092; x=1697542892; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=P82aE7KWL887ic1Co4y1/2QcPcXZ/cg/z9YhXgPh0vM=;
 b=jBT9XJ3xSMSyOJJuo/4xn6Jq2hpU1CdiLtOW+nfHGbc8wmZBC/L9Vtw0usdP7PXDsL
 6qGVL6pH3wgnWh43g2Hzls9bMaOW2SvAwBS8CbvGhNutk0ywQ8JreiCItcoRvV0h3n6P
 pX5zXDxO9uk8k5LUlLDR341IkVZ7eFGIR1c7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696938092; x=1697542892;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P82aE7KWL887ic1Co4y1/2QcPcXZ/cg/z9YhXgPh0vM=;
 b=gbic1TLsJlYv3+GoiePGdX9g71w/4dkCrKWww5UvAxqdfdfo+tk2tVfGfpko2Pxnes
 cWt6eN4UCFhQzc7uAaBMFT/AgF7M00wk4a9ISSdmaUtRvuqzWWDMaQmzhAGe6gUpVx4p
 TJrJYG2JGLhkBSNF0zSOe754yhrqAFvCUm+3fyM9mrKNFdzPHe6Ch60ePru8vfph4JQo
 xPWw+we8AaTWeZ21PpqbXn5/zNPW5HVUBoTu1Nk1xvn96/ym6GOUmbQWzhOQXLeyYzo6
 pgp615QgEuAfEuLSb05tGs0PtLZ8DArA/hnVn1ZuFfjUHOgyGo4EEq30Z5D6DU0GKwZH
 CvtQ==
X-Gm-Message-State: AOJu0Yy3t4SEQqpymWJW16uUFsv+RCj1/XAtsS3mIBdiCIcy5XpKozqb
 e1adP0MymSglxq1A8wQf4Ts0xw==
X-Google-Smtp-Source: AGHT+IG30Nh0NorW20vOn1LyjzjTqfhoCwFyUDC2tPl0NrEP0BiNkz+RW34/CV9t0nqc/Nb2g4eF7Q==
X-Received: by 2002:a05:600c:1d03:b0:404:7606:a871 with SMTP id
 l3-20020a05600c1d0300b004047606a871mr15860437wms.2.1696938091417; 
 Tue, 10 Oct 2023 04:41:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 y19-20020a05600c20d300b004075b3ce03asm367882wmm.6.2023.10.10.04.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 04:41:30 -0700 (PDT)
Date: Tue, 10 Oct 2023 13:41:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Message-ID: <ZSU4aGnYsqUvz1ry@phenom.ffwll.local>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
 <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
 <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
 <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
 <9f9b50fa-8bad-4e96-ac60-21c48f473fc6@amd.com>
 <ZSPv1iAwJMgnsDu3@intel.com>
 <dc0c733e-df75-42f8-a920-cca8eebfa0dc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc0c733e-df75-42f8-a920-cca8eebfa0dc@amd.com>
X-Operating-System: Linux phenom 6.5.0-1-amd64 
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
Cc: Ray Strode <halfline@gmail.com>, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, mdaenzer@redhat.com,
 alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 09, 2023 at 02:36:17PM +0200, Christian König wrote:
> Am 09.10.23 um 14:19 schrieb Ville Syrjälä:
> > On Mon, Oct 09, 2023 at 08:42:24AM +0200, Christian König wrote:
> > > Am 06.10.23 um 20:48 schrieb Ray Strode:
> > > > Hi,
> > > > 
> > > > On Fri, Oct 6, 2023 at 3:12 AM Christian König <christian.koenig@amd.com> wrote:
> > > > > When the operation busy waits then that *should* get accounted to the
> > > > > CPU time of the current process. When the operation sleeps and waits for
> > > > > some interrupt for example it should not get accounted.
> > > > > What you suggest is to put the parts of the operation which busy wait
> > > > > into a background task and then sleep for that task to complete. This is
> > > > > not a solution to the problem, but just hides it.
> > > > Actually, I think we both probably agree that there shouldn't be long
> > > > busy waits in the context of the current process. After all, we both
> > > > agree what the AMD DC driver code is doing is wrong.
> > > > 
> > > > To be clear, my take is, if driver code is running in process context
> > > > and needs to wait for periods of time on the order of or in excess of
> > > > a typical process time slice it should be sleeping during the waiting.
> > > > If the operation is at a point where it can be cancelled without side
> > > > effects, the sleeping should be INTERRUPTIBLE. If it's past the point
> > > > of no return, sleeping should be UNINTERRUPTIBLE. At no point, in my
> > > > opinion, should kernel code busy block a typical process for dozens of
> > > > milliseconds while keeping the process RUNNING. I don't think this is
> > > > a controversial take.
> > > Exactly that's what I completely disagree on.
> > > 
> > > When the driver is burning CPU cycles on behalves of a process then
> > > those CPU cycles should be accounted to the process causing this.
> > > 
> > > That the driver should probably improve it's behavior is a different issue.
> > > 
> > > > Actually, I think (maybe?) you might even agree with that, but you're
> > > > also saying: user space processes aren't special here. While it's not
> > > > okay to busy block them, it's also not okay to busy block on the
> > > > system unbound workqueue either. If that's your sentiment, I don't
> > > > disagree with it.
> > > No, it's absolutely ok to busy block them it's just not nice to do so.
> > > 
> > > As Daniel pointed out this behavior is not incorrect at all. The DRM
> > > subsystem doesn't make any guarantee that drmModeAtomicCommit() will not
> > > burn CPU cycles.
> > > 
> > > > So I think we both agree the busy waiting is a problem, but maybe we
> > > > disagree on the best place for the problem to manifest when it
> > > > happens.
> > > > 
> > > > One thought re the DC code is regardless of where the code is running,
> > > > the scheduler is going to forcefully preempt it at some point right?
> > > > Any writereg/udelay(1)/readreg loop is going to get disrupted by a
> > > > much bigger than 1us delay by the kernel if the loop goes on long
> > > > enough. I'm not wrong about that? if that's true, the code might as
> > > > well switch out the udelay(1) for a usleep(1) and call it a day (well
> > > > modulo the fact I think it can be called from an interrupt handler; at
> > > > least "git grep" says there's a link_set_dpms_off in
> > > > link_dp_irq_handler.c)
> > > > 
> > > > > Stuff like that is not a valid justification for the change. Ville
> > > > > changes on the other hand tried to prevent lock contention which is a
> > > > > valid goal here.
> > > > Okay so let's land his patchset! (assuming it's ready to go in).
> > > > Ville, is that something you'd want to resend for review?
> > > Well, while Ville patch has at least some justification I would still
> > > strongly object to move the work into a background thread to prevent
> > > userspace from being accounted for the work it causes.
> > Aren't most wayland compositors using nonblocking commits anyway?
> > If so they would already be bypassing proper CPU time accounting.
> > Not saying we shouldn't try to fix that, but just pointing out that
> > it already is an issue with nonblocking commits.
> 
> That's a rather good argument, but for async operations background work is
> simply a necessity because you otherwise can't implement them.

Yeah I don't think we can use "we need to properly account" stuff to
reject this, because we don't. Also we already do fail with inheriting the
priority properly, so another nail in the "kms is best effort".

> The key point here is that the patch puts the work into the background just
> to avoid that it is accounted to the thread issuing it, and that in turn is
> not valid as far as I can see.

Yeah it's that aspect I'm really worried about, because we essentially
start to support some gurantees that a) most drivers can't uphold without
a huge amount of work, some of the DC state recomputations are _really_
expensive b) without actually making the semantics clear, it's just
duct-tape.

Yes compositors want to run kms in real-time, and yes that results in fun
if you try to strictly account for cpu time spent. Especially if your
policy is to just nuke the real time thread instead of demoting it to
SCHED_NORMAL for a time.

I think if we want more than hacks here we need to answer two questions:
- which parts of the kms api are real time
- what exactly do we guarantee with that

And that answer probably needs to include things like the real time thread
workers for cursor and other nonblocking commits.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
