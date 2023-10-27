Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3125C7D9E03
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D90110EA0B;
	Fri, 27 Oct 2023 16:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819F610EA0C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 16:32:03 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 93F406607323;
 Fri, 27 Oct 2023 17:32:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698424322;
 bh=cdST41zz4Xh7cdHsxvEEbk6c5k5UXnNOVUkeHyEAKjY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P3vWQcsRrCviL0oMUJmcK53bzDSKtPhCZ0M/VqOKWMZl+UP5peJ+Bha8ncbvUNz/w
 89TGVnmVl4rInQPWzFpGai/Er/93bUwynpxlj9gYSROMc+SaZ46eEvOTLz2qojh+yl
 2U9Paw7jmPF7dcDtuffefm1tMFUVI8qbJWOflIUvbh+J5XxlDoM9MrqPzaZTAlZB1q
 ZfN8bntBWol7ImsK0EpcRSeL7+JwAGnvM/yFwgkNGs91GkT5/28EtJD6h/HvAWzvto
 xjQkh6qQGTDaCxqto5Cl22hx3mKB6zUoDZRGKlpYLTBKiKHYEusans3OB1K39u6jck
 3OzE8Nwcv4qaA==
Date: Fri, 27 Oct 2023 18:31:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Message-ID: <20231027183158.2dc4cce4@collabora.com>
In-Reply-To: <8e117f9f-a01c-4242-8781-b2ed4969513b@redhat.com>
References: <20231026161431.5934-1-dakr@redhat.com>
 <20231027102516.0e4b00ef@collabora.com>
 <8e117f9f-a01c-4242-8781-b2ed4969513b@redhat.com>
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
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, luben.tuikov@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Oct 2023 16:23:24 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> On 10/27/23 10:25, Boris Brezillon wrote:
> > Hi Danilo,
> > 
> > On Thu, 26 Oct 2023 18:13:00 +0200
> > Danilo Krummrich <dakr@redhat.com> wrote:
> >   
> >> Currently, job flow control is implemented simply by limiting the number
> >> of jobs in flight. Therefore, a scheduler is initialized with a credit
> >> limit that corresponds to the number of jobs which can be sent to the
> >> hardware.
> >>
> >> This implies that for each job, drivers need to account for the maximum
> >> job size possible in order to not overflow the ring buffer.
> >>
> >> However, there are drivers, such as Nouveau, where the job size has a
> >> rather large range. For such drivers it can easily happen that job
> >> submissions not even filling the ring by 1% can block subsequent
> >> submissions, which, in the worst case, can lead to the ring run dry.
> >>
> >> In order to overcome this issue, allow for tracking the actual job size
> >> instead of the number of jobs. Therefore, add a field to track a job's
> >> credit count, which represents the number of credits a job contributes
> >> to the scheduler's credit limit.
> >>
> >> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> >> ---
> >> Changes in V2:
> >> ==============
> >>    - fixed up influence on scheduling fairness due to consideration of a job's
> >>      size
> >>      - If we reach a ready entity in drm_sched_select_entity() but can't actually
> >>        queue a job from it due to size limitations, just give up and go to sleep
> >>        until woken up due to a pending job finishing, rather than continue to try
> >>        other entities.
> >>    - added a callback to dynamically update a job's credits (Boris)  
> > 
> > This callback seems controversial. I'd suggest dropping it, so the
> > patch can be merged.  
> 
> I don't think we should drop it just for the sake of moving forward. If there are objections
> we'll discuss them. I've seen good reasons why the drivers you are working on require this,
> while, following the discussion, I have *not* seen any reasons to drop it. It helps simplifying
> driver code and doesn't introduce any complexity or overhead to existing drivers.

Up to you. I'm just saying, moving one step in the right direction is
better than being stuck, and it's not like adding this callback in a
follow-up patch is super complicated either. If you're confident that
we can get all parties to agree on keeping this hook, fine by me.
