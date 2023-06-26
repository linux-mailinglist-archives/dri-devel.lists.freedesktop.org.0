Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CF173D8C0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 09:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D69310E0F4;
	Mon, 26 Jun 2023 07:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8249410E0F4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 07:47:18 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2746C6607113;
 Mon, 26 Jun 2023 08:47:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687765635;
 bh=CeM5Hepu+zd1pOfUnqYqgigeKhykcYtCEUEeBxBlcO4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FuaLt5h3+wbrOiBJGy6gmTS1dCPmTURQ7IBSHQFddyabAwyIqXtcpDzlkSdnTsvW+
 kL8BAvWp5KzQQodvSwwKtpNWECROMCCnnAo3cby/aNoqqYrMluZBcpiJj+tajEtkF3
 uW0a6DE21k9vI4tuKC0ffNSSCXqMTr7F5/5JDuz0y8IIGEsGhxZJoe7IZT4drhXu23
 jhGdNFVvOvBYrf1sp5iSVHa/7a7r8B5vG7/GpSMAl44Tj805CSTTMGsUquALaUGcBk
 j8aolON9vhc0u18gieZRctBKpKkbPi1hyFVNdGPXMcalxn6mSuZYsqpAVdjVKWUcf9
 fNQPB4WdKg8zw==
Date: Mon, 26 Jun 2023 09:47:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v3] drm/sched: Call drm_sched_fence_set_parent() from
 drm_sched_fence_scheduled()
Message-ID: <20230626094712.2030d137@collabora.com>
In-Reply-To: <50612c38-6a53-c1ae-5c0f-9f3f74833db8@amd.com>
References: <20230623075204.382350-1-boris.brezillon@collabora.com>
 <20230623100317.0f3fb434@collabora.com>
 <50612c38-6a53-c1ae-5c0f-9f3f74833db8@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Jun 2023 14:37:57 -0400
Luben Tuikov <luben.tuikov@amd.com> wrote:

> On 2023-06-23 04:03, Boris Brezillon wrote:
> > On Fri, 23 Jun 2023 09:52:04 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >   
> >> Drivers that can delegate waits to the firmware/GPU pass the scheduled
> >> fence to drm_sched_job_add_dependency(), and issue wait commands to
> >> the firmware/GPU at job submission time. For this to be possible, they
> >> need all their 'native' dependencies to have a valid parent since this
> >> is where the actual HW fence information are encoded.
> >>
> >> In drm_sched_main(), we currently call drm_sched_fence_set_parent()
> >> after drm_sched_fence_scheduled(), leaving a short period of time
> >> during which the job depending on this fence can be submitted.
> >>
> >> Since setting parent and signaling the fence are two things that are
> >> kinda related (you can't have a parent if the job hasn't been scheduled),
> >> it probably makes sense to pass the parent fence to
> >> drm_sched_fence_scheduled() and let it call drm_sched_fence_set_parent()
> >> before it signals the scheduled fence.
> >>
> >> Here is a detailed description of the race we are fixing here:
> >>
> >> Thread A				Thread B
> >>
> >> - calls drm_sched_fence_scheduled()
> >> - signals s_fence->scheduled which
> >>   wakes up thread B
> >>
> >> 					- entity dep signaled, checking
> >> 					  the next dep
> >> 					- no more deps waiting
> >> 					- entity is picked for job
> >> 					  submission by drm_gpu_scheduler
> >> 					- run_job() is called
> >> 					- run_job() tries to
> >> 					  collect native fence info from
> >> 					  s_fence->parent, but it's
> >> 					  NULL =>
> >> 					  BOOM, we can't do our native
> >> 					  wait
> >>
> >> - calls drm_sched_fence_set_parent()
> >>
> >> v2:
> >> * Fix commit message
> >>
> >> v3:
> >> * Add a detailed description of the race to the commit message
> >> * Add Luben's R-b
> >>  
> > 
> > FYI, I didn't put a Fixes tag because the various moves/modifications
> > that happened on this file will make it hard to backport anyway, and no
> > one complained about it so far. But if we want to have one, it would
> > probably be:
> > 
> > Fixes: 754ce0fa55c4 ("drm/amd: add parent for sched fence")
> >   
> 
> I agree with your assessment--the race fix doesn't seem to be pointing to
> or introduced by one particular change. Plus that fixes change is from 2016...
> So, we're good to go as is.

Queued to drm-misc-fixes.

