Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CAB7D9E27
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603B610EA10;
	Fri, 27 Oct 2023 16:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE5210EA10
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 16:41:49 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D00E56607323;
 Fri, 27 Oct 2023 17:41:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698424908;
 bh=P25vIC4Jmsa+/+Zny338mcD8gopPQmErUVkYqQQqo54=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bLZHldPhuO1SWfWuMRNQggv8Bl6sdvou/aVJLtcswAgWOfpf4JdQH+APpttVal6jB
 3yPhX4fHbcwxhrMwOT8eDsZAs1riDAOMRjjsU6NJlW+oLNmclQpdCjFq4xrEeEztrj
 dEZwYiopI9PXaO5Ikj1CdVMX5XThg0wZieN60KJ9sApe29Mpo+t2uE5AMze+f9WPaJ
 o4lk7H9cgjoTzvvvVgQL8pKpTE+RO6QtfTsQyG4OANS8pN6HXtYR8fpdK1BJt5ev2i
 eScgi71C5fHJQYHJD3qzq08mMiKVNajVTyM5tzhsb2mA0D5aZRFacdj1vik2wRSr6K
 CktTbBXSMWS7Q==
Date: Fri, 27 Oct 2023 18:41:43 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Luben Tuikov <ltuikov89@gmail.com>
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Message-ID: <20231027184143.4427edb8@collabora.com>
In-Reply-To: <a9215c37-61cd-4fbc-9f80-217daacd96bd@gmail.com>
References: <20231026161431.5934-1-dakr@redhat.com>
 <20231027102516.0e4b00ef@collabora.com>
 <a9215c37-61cd-4fbc-9f80-217daacd96bd@gmail.com>
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
 Danilo Krummrich <dakr@redhat.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Oct 2023 10:32:52 -0400
Luben Tuikov <ltuikov89@gmail.com> wrote:

> On 2023-10-27 04:25, Boris Brezillon wrote:
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
> >>   - fixed up influence on scheduling fairness due to consideration of a job's
> >>     size
> >>     - If we reach a ready entity in drm_sched_select_entity() but can't actually
> >>       queue a job from it due to size limitations, just give up and go to sleep
> >>       until woken up due to a pending job finishing, rather than continue to try
> >>       other entities.
> >>   - added a callback to dynamically update a job's credits (Boris)  
> > 
> > This callback seems controversial. I'd suggest dropping it, so the
> > patch can be merged.  
> 
> Sorry, why is it controversial? (I did read back-and-forth above, but it wasn't clear
> why it is /controversial/.)

That's a question for Christian, I guess. I didn't quite get what he
was worried about, other than this hook introducing a new way for
drivers to screw things up by returning funky/invalid credits (which we
can report with WARN_ON()s). But let's be honest, there's probably a
hundred different ways (if not more) drivers can shoot themselves in the
foot with drm_sched already...

> 
> I believe only drivers are privy to changes in the credit availability as their
> firmware and hardware executes new jobs and finishes others, and so this "update"
> here is essential--leaving it only to prepare_job() wouldn't quite fulfill the vision
> of why the credit mechanism introduced by this patch in the first place.

I kinda agree with you, even if I wouldn't so pessimistic as to how
useful this patch would be without the ->update_job_credits() hook
(it already makes the situation a lot better for Nouveau and probably
other drivers too).
