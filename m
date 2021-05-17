Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04B83830D9
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3B26E98E;
	Mon, 17 May 2021 14:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE8E6E98B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:30:51 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h4so6611613wrt.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bn0DkeBsYaJwZh4jUph+rX28YVf4KO+vWTnm8d/m/gw=;
 b=iXR5Td7knYTsRZQt44jAG/raTZRs0SDl6CTecgAvBblfYL93MJHAdJDIBQxuz6yKho
 3I1eGwy1h0MrNPwxT+X+9TOOInqZdC9cghj3SV6dJ/iUF9N0HpQPnr0g8amtrsCuu/x1
 9Gl21DFgeKMg5wRcBgg+RFFuhIkcr9FaE6llE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bn0DkeBsYaJwZh4jUph+rX28YVf4KO+vWTnm8d/m/gw=;
 b=F600NC5TYtOT21b/KnJvqVRps21+B/gqwjnKZk8rUs/qsj4pPPrgPTOT2t70BRdz+O
 dikW4RV8R4aw1W1Pk6ms4BwfTCOpKaDPYo0SPOaS+85zuM43ltcn9+AwgbC1B4VIlBjc
 9tdCC/OIiUOfGRSR7Qx/2PXop1OlHNhPn4zY5FdeHUTnUqi77ePsJ5o5MsyKTl2nVqvh
 nFvC8LhPa3zV+wB9vukQd0HzRCmUfFyk7rXZ0nIoNth8W+hD1VNel7yvWZbdCkti2Klg
 cDxWRFBkQdyk5r2QLjpMmmpid1BvhqFidsMKQh5qCb/NXijaGkRQwQQ6SaDMoEovoX++
 btmg==
X-Gm-Message-State: AOAM531kAXuHy44jaqlNkKw2pqH00N6LY12b+bNPQyWOjN2YA8iT3Rmj
 buLp5F9ufOU0a5meCa92SLXHUmnob6sXgA==
X-Google-Smtp-Source: ABdhPJxATbKCSYWPgCvZextHXBIh7kcoToz/Tn5RwkXm3KZGU0ybaH1UxcNAkY8sbB4ASerXmUL5bQ==
X-Received: by 2002:adf:dc8a:: with SMTP id r10mr1401998wrj.199.1621261849821; 
 Mon, 17 May 2021 07:30:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z5sm17839984wrn.69.2021.05.17.07.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:30:49 -0700 (PDT)
Date: Mon, 17 May 2021 16:30:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 0/7] Per client engine busyness
Message-ID: <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
 <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
 <9144f63b-953d-2019-742d-6553e09f5b40@amd.com>
 <22e7d6ea-f2dd-26da-f264-b17aad25af95@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Nieto,
 David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 14, 2021 at 05:10:29PM +0200, Christian König wrote:
> Am 14.05.21 um 17:03 schrieb Tvrtko Ursulin:
> > 
> > On 14/05/2021 15:56, Christian König wrote:
> > > Am 14.05.21 um 16:47 schrieb Tvrtko Ursulin:
> > > > 
> > > > On 14/05/2021 14:53, Christian König wrote:
> > > > > > 
> > > > > > David also said that you considered sysfs but were wary
> > > > > > of exposing process info in there. To clarify, my patch
> > > > > > is not exposing sysfs entry per process, but one per
> > > > > > open drm fd.
> > > > > > 
> > > > > 
> > > > > Yes, we discussed this as well, but then rejected the approach.
> > > > > 
> > > > > To have useful information related to the open drm fd you
> > > > > need to related that to process(es) which have that file
> > > > > descriptor open. Just tracking who opened it first like DRM
> > > > > does is pretty useless on modern systems.
> > > > 
> > > > We do update the pid/name for fds passed over unix sockets.
> > > 
> > > Well I just double checked and that is not correct.
> > > 
> > > Could be that i915 has some special code for that, but on my laptop
> > > I only see the X server under the "clients" debugfs file.
> > 
> > Yes we have special code in i915 for this. Part of this series we are
> > discussing here.
> 
> Ah, yeah you should mention that. Could we please separate that into common
> code instead? Cause I really see that as a bug in the current handling
> independent of the discussion here.
> 
> As far as I know all IOCTLs go though some common place in DRM anyway.

Yeah, might be good to fix that confusion in debugfs. But since that's
non-uapi, I guess no one ever cared (enough).

> > > > > But an "lsof /dev/dri/renderD128" for example does exactly
> > > > > what top does as well, it iterates over /proc and sees which
> > > > > process has that file open.
> > > > 
> > > > Lsof is quite inefficient for this use case. It has to open
> > > > _all_ open files for _all_ processes on the system to find a
> > > > handful of ones which may have the DRM device open.
> > > 
> > > Completely agree.
> > > 
> > > The key point is you either need to have all references to an open
> > > fd, or at least track whoever last used that fd.
> > > 
> > > At least the last time I looked even the fs layer didn't know which
> > > fd is open by which process. So there wasn't really any alternative
> > > to the lsof approach.
> > 
> > I asked you about the use case you have in mind which you did not
> > answer. Otherwise I don't understand when do you need to walk all files.
> > What information you want to get?
> 
> Per fd debugging information, e.g. instead of the top use case you know
> which process you want to look at.
> 
> > 
> > For the use case of knowing which DRM file is using how much GPU time on
> > engine X we do not need to walk all open files either with my sysfs
> > approach or the proc approach from Chris. (In the former case we
> > optionally aggregate by PID at presentation time, and in the latter case
> > aggregation is implicit.)
> 
> I'm unsure if we should go with the sysfs, proc or some completely different
> approach.
> 
> In general it would be nice to have a way to find all the fd references for
> an open inode.

Yeah, but that maybe needs to be an ioctl or syscall or something on the
inode, that givey you a list of (procfd, fd_nr) pairs pointing back at all
open files? If this really is a real world problem, but given that
top/lsof and everyone else hasn't asked for it yet maybe it's not.

Also I replied in some other thread, I really like the fdinfo stuff, and I
think trying to somewhat standardized this across drivers would be neat.
Especially since i915 is going to adopt drm/scheduler for front-end
scheduling too, so at least some of this should be fairly easy to share.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
