Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED07AFBF8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFDA10E22A;
	Wed, 27 Sep 2023 07:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7CF10E22A;
 Wed, 27 Sep 2023 07:25:19 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 783D06607324;
 Wed, 27 Sep 2023 08:25:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695799517;
 bh=2yW5Hh7PnukuPb/3yAYGBd0QgjRVoSWYzB4eyF4arlo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dtnSozCkldqRQ+SvdSFv4Ja9BUl8AzVNPbUYw3FDmAIM6GH/NOmSzjRoERLeYdcCH
 ZvKPQ2Dz+xbVdg5IF7P/DtkxhGGE4WvvYiIGRLQ2sWR2R2BYVzYaZaP4LlOrcByX/T
 OVr2fPdm/yskSQHObmlG86z/l9u3j7ukS/JHnGpdz5xRtrtfz892UYlZByNOrHgsoq
 bNyXuc7YJucxebTITcAeQLin9hp56gRpj1Qq3qRZLA6pEc4IO9xnVXnHefO0swxmK7
 t37F+s1jraTmOFvtzlRfqNXfxpnK8ZPRf4U/jb01pDxRUBmBsyiCWi8w8rfbUNxiKX
 Wc/NiKkM+u1yA==
Date: Wed, 27 Sep 2023 09:25:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next 1/3] drm/sched: implement dynamic job flow
 control
Message-ID: <20230927092514.04776822@collabora.com>
In-Reply-To: <12f19494-7fd0-055f-4135-e17581398eb5@redhat.com>
References: <20230924224555.15595-1-dakr@redhat.com>
 <312983ee-ba4c-477e-8846-072c815df862@amd.com>
 <12f19494-7fd0-055f-4135-e17581398eb5@redhat.com>
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

On Wed, 27 Sep 2023 02:13:59 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> On 9/26/23 22:43, Luben Tuikov wrote:
> > Hi,
> > 
> > On 2023-09-24 18:43, Danilo Krummrich wrote:  
> >> Currently, job flow control is implemented simply by limiting the amount
> >> of jobs in flight. Therefore, a scheduler is initialized with a
> >> submission limit that corresponds to a certain amount of jobs.  
> > 
> > "certain"? How about this instead:
> > " ... that corresponds to the number of jobs which can be sent
> >    to the hardware."?
> >   
> >>
> >> This implies that for each job drivers need to account for the maximum  
> >                                  ^,
> > Please add a comma after "job".
> >   
> >> job size possible in order to not overflow the ring buffer.  
> > 
> > Well, different hardware designs would implement this differently.
> > Ideally, you only want pointers into the ring buffer, and then
> > the hardware consumes as much as it can. But this is a moot point
> > and it's always a good idea to have a "job size" hint from the client.
> > So this is a good patch.
> > 
> > Ideally, you want to say that the hardware needs to be able to
> > accommodate the number of jobs which can fit in the hardware
> > queue times the largest job. This is a waste of resources
> > however, and it is better to give a hint as to the size of a job,
> > by the client. If the hardware can peek and understand dependencies,
> > on top of knowing the "size of the job", it can be an extremely
> > efficient scheduler.
> >   
> >>
> >> However, there are drivers, such as Nouveau, where the job size has a
> >> rather large range. For such drivers it can easily happen that job
> >> submissions not even filling the ring by 1% can block subsequent
> >> submissions, which, in the worst case, can lead to the ring run dry.
> >>
> >> In order to overcome this issue, allow for tracking the actual job size
> >> instead of the amount job jobs. Therefore, add a field to track a job's  
> > 
> > "the amount job jobs." --> "the number of jobs."  
> 
> Yeah, I somehow manage to always get this wrong, which I guess you noticed
> below already.
> 
> That's all good points below - gonna address them.
> 
> Did you see Boris' response regarding a separate callback in order to fetch
> the job's submission units dynamically? Since this is needed by PowerVR, I'd
> like to include this in V2. What's your take on that?
> 
> My only concern with that would be that if I got what Boris was saying
> correctly calling
> 
> WARN_ON(s_job->submission_units > sched->submission_limit);
> 
> from drm_sched_can_queue() wouldn't work anymore, since this could indeed happen
> temporarily. I think this was also Christian's concern.

Actually, I think that's fine to account for the max job size in the
first check, we're unlikely to have so many native fence waits that our
job can't fit in an empty ring buffer.
