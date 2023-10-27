Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A127D8F7F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 09:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659F910E93F;
	Fri, 27 Oct 2023 07:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF7010E93F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 07:16:46 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0929A66071F1;
 Fri, 27 Oct 2023 08:16:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698391004;
 bh=cpBdTYW8vHHYaVRuft26NXdFNW0X6taMn5s0dkeghr0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XV7EOtiCj+jXbWgQuAIqK7tQkPkfD/wcbgCuaGN+A4N81pwivLmkZhO6vt9Tg84zX
 2Yb1tlz9FrK+wkyGh8LvxUcsfBudWa5zaC8ECo5K3o2wofveD5wttcfhExd5b1St2p
 59DC/fdsVtTAc5f35vV1Pz+/sPSjUTxUTPEZ0+UKURX7SFS5aYo5e9XwqTH6AU5ki+
 nQkxA6S8RU+OltsBSOxS7rP5FKiwO+NVMYTipi0o0yR8ng7u8FnB9WwHuiaSg6BN9p
 R8O+BGcUKxaUTeIf+su1bh+w7gZ3eC2K0p6zlueCx8nmwaW8kgkyGAl+4fKsFSAQsj
 hSWlF8uXZ9b4A==
Date: Fri, 27 Oct 2023 09:16:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v2] drm/sched: implement dynamic job-flow
 control
Message-ID: <20231027091640.50d68251@collabora.com>
In-Reply-To: <ZTb6azSfTV+LRGYu@pollux>
References: <20231009223554.11846-1-dakr@redhat.com>
 <20231010094151.4c116058@collabora.com> <ZTb6azSfTV+LRGYu@pollux>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

On Tue, 24 Oct 2023 00:57:47 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> > > +
> > > +	/**
> > > +	 * @update_job_credits: Called once the scheduler is considering this
> > > +	 * job for execution.
> > > +	 *
> > > +	 * Drivers may use this to update the job's submission credits, which is
> > > +	 * useful to e.g. deduct the number of native fences which have been
> > > +	 * signaled meanwhile.
> > > +	 *
> > > +	 * The callback must either return the new number of submission credits
> > > +	 * for the given job, or zero if no update is required.  
> > 
> > Any reason for having this special zero-means-no-update case? I mean,
> > drivers could just return sched_job->submission_credits if nothing
> > changed, and that would simplify the semantics IMHO. Another option, if  
> 
> I think I just did this because I thought it's a clever way to get rid of the
> need to deal with zero-sized jobs, which do not make much sense. In
> drm_sched_job_init() passing a zero job size defaults to one, which I think is
> reasonable. Doing the same thing here is more likely to hide a bug. However, the
> same is probably true for 'zero means no update' though. Maybe we should just
> WARN() in such a case.
> 
> > we want to avoid the sched_job->submission_credits assignment when
> > nothing changes would be to make it a void function and let it update
> > the sched_job->submission_credits directly.  
> 
> Sure, that's an option as well. However, I'd probably prefer the new job size to
> be the return value. Having to sanity check job->submission_credits afterwards
> isn't that nice either.

Uh, sorry for the late reply, I see you've sent a v3 already :-/. I keep
thinking it'd be simpler to make this a void function that updates
s_job->submission_credits directly. I also don't see the problem with
doing a sanity check on job->submission_credits. I mean, if the driver
is doing something silly, you can't do much to prevent it anyway,
except warn the user that something wrong has happened. If you want to

	WARN_ON(job->submission_credits == 0 ||
		job->submission_credits > job_old_submission_credits);

that's fine. But none of this sanity checking has to do with the
function prototype/semantics, and I'm still not comfortable with this 0
=> no-change. If there's no change, we should just leave
job->submission_credits unchanged (or return job->submission_credits)
instead of inventing a new special case.

Regards,

Boris
