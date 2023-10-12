Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8138C7C6EF6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 15:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AA110E4DC;
	Thu, 12 Oct 2023 13:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24E710E4DC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 13:15:05 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9ba041d7930so31251566b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 06:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1697116504; x=1697721304; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Yt4vMxdhc5OiS38raoXweqMb1s/YLyfC9lsMx2p9myQ=;
 b=Eq5rveCyycrADm7AhLbTJgejjo0SfLDVZElR+VSeMTFMxHfhTduT+8VgRtEyDYmBbJ
 CANCJyr3uXTa4o0SERba+7Nw8wJrsLce8znWTI68TPST8QVGAULGKqKAt2YjRq8pxCK0
 d2FTeIOn3oltuGXoit40agYy9m0Vy+d81Jwfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697116504; x=1697721304;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yt4vMxdhc5OiS38raoXweqMb1s/YLyfC9lsMx2p9myQ=;
 b=QLCiGGSrNrtYVLJ9momoSNt3j8wmljOlKMgwqSQaIigCvBT3IQKCZzAHmtqIWe854v
 9xQtFMPHJuSn/V5CVKACGEZur6a84j3lfKmGauPymvG/3uWjFOXCX3XrGwi1wxJcMzuN
 VPz/+nrrPCLRidEjNTdFRhe3+3hFQXOpkMwpIub0OVa9Pc724KXjQtha2e/iuAfkF2rk
 ZY/uWOvU4Z+ntprIeM3ohpd5f23ZlYIYGIxAgobptFgn+BPKA3AzkFxrKc3pFK6AFuHc
 Qjd5N8PTRUTKCkYzg6wr7kAs1WS7j3eSGnJHjGPJWY4y5X6wf6+dlmS1OhnoZiNlKeCI
 RYvw==
X-Gm-Message-State: AOJu0YyfmHMd9ju/Dsc8X1kMZyV6X5uV8ee5Z+4NZKl4lQZqjqw7Yh8a
 OdYW6ELL/EYNLzAMXN4r30r7Yw==
X-Google-Smtp-Source: AGHT+IG1wzY++o5tjLk6V/f5yQyOkJd2nDhrUvnp9sslLy1xRLXgeWc9DgSOIu1gb5dgIYqodHnzlg==
X-Received: by 2002:a17:906:100c:b0:9ae:6da8:181c with SMTP id
 12-20020a170906100c00b009ae6da8181cmr18888342ejm.7.1697116503968; 
 Thu, 12 Oct 2023 06:15:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a170906481300b009b9720a85e5sm11049401ejq.38.2023.10.12.06.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 06:15:02 -0700 (PDT)
Date: Thu, 12 Oct 2023 15:15:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH drm-misc-next 2/3] drm/gpuva_mgr: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <ZSfxVFe-cm70xM5s@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Dave Airlie <airlied@gmail.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Danilo Krummrich <dakr@redhat.com>, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 faith.ekstrand@collabora.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <ZO9Zq2RhbX8EeHrn@pollux>
 <736b6b6d-9e04-a27d-7d60-0c45d696b304@shipmail.org>
 <ZPB26A0/oLHTmyqk@cassiopeiae>
 <a8f28d62-daec-927a-a33d-5be3eec6a1ed@shipmail.org>
 <ZPDk/lao1JlBNGoJ@cassiopeiae>
 <8a8253ae-0b85-df90-b480-64eeebfafc6d@shipmail.org>
 <CAPM=9tz3o-m+8VJJ6hxWhykat0kpp1UE7dBJE3X91aHHo1Y2VA@mail.gmail.com>
 <76963abd-77a1-4bbd-9537-7b230e648a90@amd.com>
 <CAPM=9twSHGRoSoXxG+hz1T8iBX2VgPFvFsNCDnK_nHW9WJYBtw@mail.gmail.com>
 <1333e15b-f229-460a-8965-01ff3e778a4d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1333e15b-f229-460a-8965-01ff3e778a4d@amd.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 linux-kernel@vger.kernel.org, Liam.Howlett@oracle.com,
 boris.brezillon@collabora.com, Danilo Krummrich <dakr@redhat.com>,
 donald.robson@imgtec.com, faith.ekstrand@collabora.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 02:35:15PM +0200, Christian König wrote:
> Am 12.10.23 um 12:33 schrieb Dave Airlie:
> > On Wed, 11 Oct 2023 at 17:07, Christian König <christian.koenig@amd.com> wrote:
> > > Am 10.10.23 um 22:23 schrieb Dave Airlie:
> > > > > I think we're then optimizing for different scenarios. Our compute
> > > > > driver will use mostly external objects only, and if shared, I don't
> > > > > forsee them bound to many VMs. What saves us currently here is that in
> > > > > compute mode we only really traverse the extobj list after a preempt
> > > > > fence wait, or when a vm is using a new context for the first time. So
> > > > > vm's extobj list is pretty large. Each bo's vma list will typically be
> > > > > pretty small.
> > > > Can I ask why we are optimising for this userspace, this seems
> > > > incredibly broken.
> > > > 
> > > > We've has this sort of problem in the past with Intel letting the tail
> > > > wag the horse, does anyone remember optimising relocations for a
> > > > userspace that didn't actually need to use relocations?
> > > > 
> > > > We need to ask why this userspace is doing this, can we get some
> > > > pointers to it? compute driver should have no reason to use mostly
> > > > external objects, the OpenCL and level0 APIs should be good enough to
> > > > figure this out.
> > > Well that is pretty normal use case, AMD works the same way.
> > > 
> > > In a multi GPU compute stack you have mostly all the data shared between
> > > different hardware devices.
> > > 
> > > As I said before looking at just the Vulcan use case is not a good idea
> > > at all.
> > > 
> > It's okay, I don't think anyone is doing that, some of the these
> > use-cases are buried in server land and you guys don't communicate
> > them very well.
> 
> Yeah, well everybody is trying very hard to get away from those approaches
> :)
> 
> But so far there hasn't been any breakthrough.
> 
> > 
> > multi-gpu compute would I'd hope be moving towards HMM/SVM type
> > solutions though?
> 
> Unfortunately not in the foreseeable future. HMM seems more and more like a
> dead end, at least for AMD.
> 
> AMD still has hardware support in all of their MI* products, but for Navi
> the features necessary for implementing HMM have been dropped. And it looks
> more and more like their are not going to come back.
> 
> Additional to that from the software side Felix summarized it in the HMM
> peer2peer discussion thread recently quite well. A buffer object based
> approach is not only simpler to handle, but also performant vise multiple
> magnitudes faster.

This matches what I'm hearing from all over. Turns out that handling page
faults in full generality in a compute/accel device (not just gpu) is just
too damn hard. At least for anyone who isn't nvidia. Usually time bound
preemption guarantees are the first to go, followed right after by a long
list of more fixed function hardware blocks that outright can't cope with
page faults.

There's so many corner cases where it breaks down that I feel like device
driver allocated memory of one flavor or another will stick around for a
very long time.

This isn't even counting the software challenges.
-Sima

> > I'm also not into looking at use-cases that used to be important but
> > might not as important going forward.
> 
> Well multimedia applications and OpenGL are still around, but it's not the
> main focus any more.
> 
> Christian.
> 
> > 
> > Dave.
> > 
> > 
> > > Christian.
> > > 
> > > > Dave.
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
