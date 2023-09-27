Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 495E37B035C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 13:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015E310E4EE;
	Wed, 27 Sep 2023 11:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17C010E4E8;
 Wed, 27 Sep 2023 11:54:46 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C5EB866072F8;
 Wed, 27 Sep 2023 12:54:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695815685;
 bh=YN94tjzgqFxb4LwqW2tC1IGyFOsl0EecJ6Oc0vYkFE8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XLVIY+EPrBWlG1n705Pb1H3C+G4t0Np5e3N0nFpqcLGctkG5nOP4z3lJTNu2DfoOV
 fnxm32+IOF+XUBppnS80Fsd7ev1208H9l6nrCk3ExtOfdqlBbi5vkTo2UhCQESHc+U
 2O8dnWFOzytxvNgXQ8ZL+EU9WrfL5ZikDKkrpx1728bkVXP+qhCyCiylh4yfC+dAZ+
 bW5+9EzU913T94JbEccktD/uhb3eqWt2vMKoFu+LdwZ/q9rmzSbjHJMB5FaWLnBRGj
 PYn6Vbu45MnTlwaQW9wiyFva/InRVJlZ3Izx58B0umYpXP1TC4VGEgaRLjtkytvAg/
 5/dXqgOfnlG4A==
Date: Wed, 27 Sep 2023 13:54:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next 1/3] drm/sched: implement dynamic job flow
 control
Message-ID: <20230927135441.064795f0@collabora.com>
In-Reply-To: <a050bc34-d98e-3d75-8c79-447dc7c913a1@redhat.com>
References: <20230924224555.15595-1-dakr@redhat.com>
 <312983ee-ba4c-477e-8846-072c815df862@amd.com>
 <12f19494-7fd0-055f-4135-e17581398eb5@redhat.com>
 <20230927092514.04776822@collabora.com>
 <a050bc34-d98e-3d75-8c79-447dc7c913a1@redhat.com>
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
Cc: matthew.brost@intel.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Sep 2023 13:45:37 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> On 9/27/23 09:25, Boris Brezillon wrote:
> > On Wed, 27 Sep 2023 02:13:59 +0200
> > Danilo Krummrich <dakr@redhat.com> wrote:
> >   
> >> On 9/26/23 22:43, Luben Tuikov wrote:  
> >>> Hi,
> >>>
> >>> On 2023-09-24 18:43, Danilo Krummrich wrote:  
> >>>> Currently, job flow control is implemented simply by limiting the amount
> >>>> of jobs in flight. Therefore, a scheduler is initialized with a
> >>>> submission limit that corresponds to a certain amount of jobs.  
> >>>
> >>> "certain"? How about this instead:
> >>> " ... that corresponds to the number of jobs which can be sent
> >>>     to the hardware."?
> >>>      
> >>>>
> >>>> This implies that for each job drivers need to account for the maximum  
> >>>                                   ^,
> >>> Please add a comma after "job".
> >>>      
> >>>> job size possible in order to not overflow the ring buffer.  
> >>>
> >>> Well, different hardware designs would implement this differently.
> >>> Ideally, you only want pointers into the ring buffer, and then
> >>> the hardware consumes as much as it can. But this is a moot point
> >>> and it's always a good idea to have a "job size" hint from the client.
> >>> So this is a good patch.
> >>>
> >>> Ideally, you want to say that the hardware needs to be able to
> >>> accommodate the number of jobs which can fit in the hardware
> >>> queue times the largest job. This is a waste of resources
> >>> however, and it is better to give a hint as to the size of a job,
> >>> by the client. If the hardware can peek and understand dependencies,
> >>> on top of knowing the "size of the job", it can be an extremely
> >>> efficient scheduler.
> >>>      
> >>>>
> >>>> However, there are drivers, such as Nouveau, where the job size has a
> >>>> rather large range. For such drivers it can easily happen that job
> >>>> submissions not even filling the ring by 1% can block subsequent
> >>>> submissions, which, in the worst case, can lead to the ring run dry.
> >>>>
> >>>> In order to overcome this issue, allow for tracking the actual job size
> >>>> instead of the amount job jobs. Therefore, add a field to track a job's  
> >>>
> >>> "the amount job jobs." --> "the number of jobs."  
> >>
> >> Yeah, I somehow manage to always get this wrong, which I guess you noticed
> >> below already.
> >>
> >> That's all good points below - gonna address them.
> >>
> >> Did you see Boris' response regarding a separate callback in order to fetch
> >> the job's submission units dynamically? Since this is needed by PowerVR, I'd
> >> like to include this in V2. What's your take on that?
> >>
> >> My only concern with that would be that if I got what Boris was saying
> >> correctly calling
> >>
> >> WARN_ON(s_job->submission_units > sched->submission_limit);
> >>
> >> from drm_sched_can_queue() wouldn't work anymore, since this could indeed happen
> >> temporarily. I think this was also Christian's concern.  
> > 
> > Actually, I think that's fine to account for the max job size in the
> > first check, we're unlikely to have so many native fence waits that our
> > job can't fit in an empty ring buffer.
> >   
> 
> But it can happen, right? Hence, we can't have this check, do we?
> 

I theory, yes, in practice, given the size of the ring buffers, and the
size of a fence wait command, I guess we can refuse to queue a job (at
the driver level) if the maximum job size (static + maximum dynamic
part of the job) doesn't fit in the ring buffer. I that ever becomes a
problem, we can revisit it at that point.
