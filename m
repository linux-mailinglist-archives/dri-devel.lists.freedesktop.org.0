Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8088D245B7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 13:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464A210E148;
	Thu, 15 Jan 2026 12:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HdPKe4Gg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522D710E148
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 12:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768478484;
 bh=gk6gdrRFihICcqK6DBzh5uTGHekZ8NOxYSV9AzVY6DA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HdPKe4GgK11VrhDRTM9UAUTeXOP/Qica+bUABrh48Rf2dGpbRLNUy9oTzENFNPyNS
 dQE/ph19QsyzxmW5WKL+/cIOObNzepPSdqMkXSy7GEG/VQqj+TbVFkpWNtJa6GJL59
 kJsaoanL7VQEP5BtzHeTOhrKyp+fiW4gIol0KsB5sibIppEd8VfZFRWiD66joPHsF+
 Hr0PXrthpiRMpzgA06XQKpaDxFV71MlsTvvbQ8PYyuNZsjxMLnmP6Z9ydyKNAX1a1a
 0bfg/BqCtF3yh4xyxBGtwFQpDePhvzdyXjR6sOqHcP+aQ22UPqZLC3j6oEn6LqWroK
 tbv6c6bCFmOew==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DE6F17E0E6C;
 Thu, 15 Jan 2026 13:01:24 +0100 (CET)
Date: Thu, 15 Jan 2026 13:01:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Akash Goel
 <akash.goel@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen
 <akhilpo@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Chris Diamand <chris.diamand@arm.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>,
 kernel@collabora.com
Subject: Re: [PATCH v1 9/9] drm/panthor: Add a GEM shrinker
Message-ID: <20260115130119.1be81c75@fedora>
In-Reply-To: <fe39739e-25fc-429d-ab4d-37c4fc387be4@arm.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-10-boris.brezillon@collabora.com>
 <2e446bc2-e3db-4c37-b05c-c46d5782321a@arm.com>
 <20260115115043.0814268e@fedora>
 <fe39739e-25fc-429d-ab4d-37c4fc387be4@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Jan 2026 11:24:49 +0000
Steven Price <steven.price@arm.com> wrote:

> On 15/01/2026 10:50, Boris Brezillon wrote:
> > Hi Steve,
> > 
> > On Wed, 14 Jan 2026 15:05:36 +0000
> > Steven Price <steven.price@arm.com> wrote:
> >   
> >> On 09/01/2026 13:08, Boris Brezillon wrote:  
> [...]
> >>> @@ -1250,10 +1637,42 @@ static struct drm_info_list panthor_gem_debugfs_list[] = {
> >>>  	{ "gems", panthor_gem_show_bos, 0, NULL },
> >>>  };
> >>>  
> >>> +static int shrink_get(void *data, u64 *val)
> >>> +{
> >>> +	struct panthor_device *ptdev =
> >>> +		container_of(data, struct panthor_device, base);
> >>> +
> >>> +	*val = ptdev->reclaim.nr_pages_reclaimed_on_last_scan;
> >>> +	return 0;
> >>> +}
> >>> +
> >>> +static int shrink_set(void *data, u64 val)
> >>> +{
> >>> +	struct panthor_device *ptdev =
> >>> +		container_of(data, struct panthor_device, base);
> >>> +	struct shrink_control sc = {
> >>> +		.gfp_mask = GFP_KERNEL,
> >>> +		.nr_to_scan = val,
> >>> +	};
> >>> +
> >>> +	fs_reclaim_acquire(GFP_KERNEL);
> >>> +	if (ptdev->reclaim.shrinker)
> >>> +		panthor_gem_shrinker_scan(ptdev->reclaim.shrinker, &sc);
> >>> +	fs_reclaim_release(GFP_KERNEL);
> >>> +
> >>> +	return 0;
> >>> +}    
> >>
> >> Do you have some test to drive this?  
> > 
> > Yes, I do [1].
> >   
> >> My immediate thought was that it
> >> would be nice (for manual testing at least) to printk the return value
> >> from panthor_gem_shrinker_scan(). But we probably wouldn't actually need
> >> nr_pages_reclaimed_on_last_scan if you could just read that from dmesg.
> >> But I can see integrating that into a test might not be ideal.  
> > 
> > I basically based the interface on the existing MSM one. Might not be
> > the best, but it was good enough for this initial testing.  
> 
> Ah well if we're matching MSM then that's probably a good justification.
> It just seemed a little odd throwing away the return value and then
> having to have a separate mechanism to get the number of pages reclaimed
> out. And given I'd just spotted a bug in the return value I thought I'd
> ask ;).

For that particular thing, I diverged from what MSM was doing, because
in some cases, SHRINK_STOP is returned even though pages were
reclaimed. I need to double-check the ->scan() semantics, I got that
wrong a few times already, and paged out everything about these tricky
corner cases already.

> >> I have to admit to being very unsure about all of this - I even resorted
> >> to asking AI, which I think has made me more confused ;)  
> > 
> > I think you're right that we shouldn't complain+fail if pin_count > 0
> > in the de-eviction path. As I said above, de-eviction for the CPU is not
> > the same as de-eviction for the GPU, so pages being present and pinned
> > doesn't mean we have nothing to do for the GPU mapping to be restored.
> > Maybe we should come with a better name for this function.  
> 
> Yes the AI was insisting that the problem was the GPU submission would
> fail. Sadly it was incredibly bad at actually explaining the issue.
> 
> So I agree it looks like it would be safe to remove the WARN_ON and keep
> going in the case of pin_count > 0. The (also confusingly named)
> "vm_bo_validate" will be called because the evicted flag is set which
> will get the BO mapped on the GPU again.
> 
> I'm all for better names, but I'm afraid I don't have any suggestions.

Alright, I'll stick to gem_swapin() then.
