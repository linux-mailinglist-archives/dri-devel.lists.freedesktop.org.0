Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10F084FC51
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 19:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580AC10FA46;
	Fri,  9 Feb 2024 18:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Hd7FBvwr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8AE10FA47
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 18:52:06 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51160d4ca59so155612e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 10:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707504724; x=1708109524; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hVDL4Y4chRQ0ke/Q0YKtotMeeLMSO2VdgB7U7pXepJA=;
 b=Hd7FBvwryRsG//JVpu4VuEMDY9gwf33JctKQG9Az2UDzvo3QxBM8OIWYyXvaywAWjy
 /rOmyK8en18ogAUHtg2HaXzuTDeLK6Itk1GoB1nKvQO9BBoV8NUZzffm4CzpRCGnAn5p
 UUI8uuZpaTEZiRjQaoulz/Gy4hDmBf/N+9kQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707504724; x=1708109524;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hVDL4Y4chRQ0ke/Q0YKtotMeeLMSO2VdgB7U7pXepJA=;
 b=R4MFy9ei1xqYXBCZn6edgEz8NL9Ukmklyv5fKRkQ7AKRnK0DfuSml3Lqj021llODJZ
 CUzqMkCx7oE8hYQdztKTv7P3ASzxnX6UQqfHjaQ0QE4Ovj39DcaOVcSe72NYrbOSfuvy
 PcOewPPxm/vn/3bEjyobttDpKKGwbRn+dPqweM5lYDsyOcMPErN4GFrYhrUI6wrqdSmP
 aynF1oNKEZ6po+DlqZxZrV4hMrS9xFWamBB5vkVdRRa77/7axrqKLxe/U1QhaT/0cq8/
 l2N6VZLKBlR66B/auNWSrY6lKc+rRuFVCpX65AZMLZDSxGJLATYvsF+/1uxK2Dr8g0GT
 Vnag==
X-Gm-Message-State: AOJu0YwHBk0J64Ia3tnjxKXY2x8ssVdtlZ/W2PjF6iRWbeu2uw/42fuf
 HrwKPw7eh/70W3SFhEnhVjGPg/QpDi3UdY5f+4Rsonfec1cw711znOj/cCR9xiQ=
X-Google-Smtp-Source: AGHT+IHSThTUGnn3UqrOHE1PbDd138iJT6mX3YpuYGEImiPsRJ9yOxyChBx8y6f5ZCAwcc7zhyc12Q==
X-Received: by 2002:a05:6512:3c81:b0:511:5778:c5d9 with SMTP id
 h1-20020a0565123c8100b005115778c5d9mr1793415lfv.3.1707504724081; 
 Fri, 09 Feb 2024 10:52:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVQqfgSNVFs8gOldqrMJ89N+y5frDxIeEyvT2W2togX6f10Krry1LYHDvWrsxNOX2M0BbAurbdw4bS3DtiFDPbkvmKKMwYZPx1ygQgbHAqIvUgyCplQKLt15iL/KuvriNDAcD5PaGM2e3K0/Q4IMJtgrjTZza1bLWz3un1qsSrpGn8=
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c204f00b0041044e130bfsm1366450wmg.33.2024.02.09.10.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 10:52:03 -0800 (PST)
Date: Fri, 9 Feb 2024 19:52:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] nouveau: offload fence uevents work to workqueue
Message-ID: <ZcZ0UXfbKYNhhBiC@phenom.ffwll.local>
References: <20240129015053.1687418-1-airlied@gmail.com>
 <133266ac-7239-4233-a19d-cdc7563d401c@redhat.com>
 <CAPM=9tyc3zWRhm4xSnnHprU-v7prdZ2fkkLDEfjC_t_2wM-8Kg@mail.gmail.com>
 <3d967763-8f8f-4451-9927-33395e1b4d70@redhat.com>
 <ZcI8GScBEJ0SsuA5@phenom.ffwll.local>
 <a2174cc2-ea65-4bcf-a112-f60f26b7213c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2174cc2-ea65-4bcf-a112-f60f26b7213c@redhat.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Fri, Feb 09, 2024 at 06:41:32PM +0100, Danilo Krummrich wrote:
> On 2/6/24 15:03, Daniel Vetter wrote:
> > On Mon, Feb 05, 2024 at 11:00:04PM +0100, Danilo Krummrich wrote:
> > > On 2/5/24 22:08, Dave Airlie wrote:
> > > > On Tue, 6 Feb 2024 at 02:22, Danilo Krummrich <dakr@redhat.com> wrote:
> > > > > 
> > > > > On 1/29/24 02:50, Dave Airlie wrote:
> > > > > > From: Dave Airlie <airlied@redhat.com>
> > > > > > 
> > > > > > This should break the deadlock between the fctx lock and the irq lock.
> > > > > > 
> > > > > > This offloads the processing off the work from the irq into a workqueue.
> > > > > > 
> > > > > > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > > > > 
> > > > > Nouveau's scheduler uses a dedicated wq, hence from this perspective it's
> > > > > safe deferring fence signalling to the kernel global wq. However, I wonder
> > > > > if we could create deadlocks by building dependency chains into other
> > > > > drivers / kernel code that, by chance, makes use of the kernel global wq as
> > > > > well.
> > > > > 
> > > > > Admittedly, even if, it's gonna be extremely unlikely given that
> > > > > WQ_MAX_ACTIVE == 512. But maybe it'd be safer to use a dedicated wq.
> > > > > 
> > > > > Also, do we need to CC stable?
> > > > 
> > > > I pushed this to Linus at the end of last week, since the hangs in 6.7
> > > > take out the complete system and I wanted it in stable.
> > > > 
> > > > It might be safer to use a dedicated wq, is the concern someone is
> > > > waiting on a fence in a workqueue somewhere else so we will never
> > > > signal it?
> > > 
> > > Yes, if some other work is waiting for this fence (or something else in the same
> > > dependency chain) to signal it can prevent executing the work signaling this fence,
> > > in case both are scheduled on the same wq. As mentioned, with the kernel global wq
> > > this would be rather unlikely to lead to an actual stall with WQ_MAX_ACTIVE == 512,
> > > but formally the race condition exists. I guess a malicious attacker could try to
> > > intentionally push jobs directly or indirectly depending on this fence to a driver
> > > which queues them up on a scheduler using the kernel global wq.
> > 
> > I think if you add dma_fence_signalling annotations (aside, there's some
> > patch from iirc Thomas Hellstrom to improve them and cut down on some
> > false positives, but I lost track) then I think you won't get any splats
> > because the wq subsystem assumes that WC_MAX_ACTIVE is close enough to
> > infinity to not matter.
> 
> As mentioned, for the kernel global wq it's 512. (Intentionally) feeding the kernel
> with enough jobs to to provoke a deadlock doesn't seem impossible to me.
> 
> I think it'd be safer to just establish not to use the kernel global wq for executing
> work in the fence signalling critical path.
> 
> We could also run into similar problems with a dedicated wq, e.g. when drivers share
> a wq between drm_gpu_scheduler instances (see [1]), however, I'm not sure we can catch
> that with lockdep.

I think if you want to fix it perfectly you'd need to set the max number
of wq to the number of engines (or for dynamic/fw scheduled engines to the
number of context) you have. Or whatever limit to the number of parallel
timelines there is.

I guess this would need a new wq function to update? drm/sched code could
be able to set that for drivers, so drivers cannot get this wrong.

If we don't do something like that then I'm not sure there's really much
benefit - instead of carefully timing 512 dma_fence on the global wq you
just need to create a pile of context (at least on intel's guc that's
absolutely no issue) and then careful time them.

I still feel like we have bigger fish to fry ... But might be worth the
effort to at least make the parallel timeline limit a lot more explicit?

Cheers, Sima

> 
> [1] https://elixir.bootlin.com/linux/v6.8-rc3/source/drivers/gpu/drm/nouveau/nouveau_drm.c#L313
> 
> > 
> > I'm not sure we should care differently, but I guess it'd be good to
> > annotate it all in case the wq subsystem's idea of how much such deadlocks
> > are real changes.
> > 
> > Also Teo is on a mission to get rid of all the global wq flushes, so there
> > should also be no source of deadlocks from that kind of cross-driver
> > dependency. Or at least shouldn't be in the future, I'm not sure it all
> > landed.
> > -Sima
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
