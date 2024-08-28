Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B53962D79
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 18:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3809F10E591;
	Wed, 28 Aug 2024 16:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bQ+1AmwQ";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="Sd6YXOG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 541 seconds by postgrey-1.36 at gabe;
 Wed, 28 Aug 2024 16:16:10 UTC
Received: from a7-48.smtp-out.eu-west-1.amazonses.com
 (a7-48.smtp-out.eu-west-1.amazonses.com [54.240.7.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B9110E58D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 16:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724861228;
 h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=jaQtBzhvqpQ+AdklH/JAEu9gW+B7JU7gDvFQVhfpR1w=;
 b=bQ+1AmwQCWldMS1bQui7FtNS/qU5eIh5C+1VfdUR0IuBkUiWc6UAKgR/6PWf2mOW
 Ir+cxw0zxq07DjbwpgTI7VwFhd3x0S3X5JgRnj+7fDM4RYcqp5ubKkryypDSvVM6RIJ
 dcOKNEVMarDeMsBlKhxqRwfNvhiV3bolZd1rSArQqG/GG+KgknTjaI/73DTXmanmqQC
 nzbBbyiuDOjbSi0mDIHruZI7luv6JoD7tKri5BMxXU0KiymMFbpp9cPeaK+y5GfpcVN
 8oxqAo5qHG8tWdGp64NRCxPv0cLrGtEend+O2xE/vWM5xg7Er5VSGGhj7sgmP9vgorE
 h7DEPCUu9g==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724861228;
 h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=jaQtBzhvqpQ+AdklH/JAEu9gW+B7JU7gDvFQVhfpR1w=;
 b=Sd6YXOG0h85aIrx0cbRnACY6AFMc5zOtDr2UMosmZbLjOBJzW+p+Cwkn9On0tk2v
 SsddPXInjQDKfIcmIS+5ul3v5yRcuELaulBhcCXhaV7Pg5sGM0rQ7sBn4pjwTlM80s4
 6yI0wFnE8llDw6vhNozqWQwyJDv4hrc6pIMlz9zQ=
Date: Wed, 28 Aug 2024 16:07:07 +0000
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mihail Atanassov <mihail.atanassov@arm.com>
Cc: Mary Guillemard <mary.guillemard@collabora.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 kernel@collabora.com, Christopher Healy <healych@amazon.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 nd@arm.com
Subject: Re: [PATCH] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
Message-ID: <0102019199bda302-994c7da8-9e5a-4a2e-8e2a-6ef5f354ed59-000000@eu-west-1.amazonses.com>
In-Reply-To: <c38324e4-055f-44b5-beb4-6b3e6b860e69@arm.com>
References: <20240807153553.142325-2-mary.guillemard@collabora.com>
 <327a3440-8d01-4787-83be-a00fbbe0b593@arm.com>
 <20240828140929.5c602436@collabora.com>
 <c38324e4-055f-44b5-beb4-6b3e6b860e69@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.28-54.240.7.48
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

On Wed, 28 Aug 2024 14:22:51 +0100
Mihail Atanassov <mihail.atanassov@arm.com> wrote:

> Hi Boris,
> 
> On 28/08/2024 13:09, Boris Brezillon wrote:
> > Hi Mihail,
> > 
> > On Thu, 8 Aug 2024 12:41:05 +0300
> > Mihail Atanassov <mihail.atanassov@arm.com> wrote:
> >   
> >>>
> >>> +/** + * struct drm_panthor_timestamp_info - Timestamp information +
> >>> * + * Structure grouping all queryable information relating to the
> >>> GPU timestamp. + */ +struct drm_panthor_timestamp_info { +	/**
> >>> @timestamp_frequency: The frequency of the timestamp timer. */ +
> >>> __u64 timestamp_frequency; + +	/** @current_timestamp: The current
> >>> timestamp. */ +	__u64 current_timestamp;  
> >>
> >> As it stands, this query has nothing to do with the actual GPU so
> >> doesn't really belong here.
> >>
> >> It'd be more valuable, and can maybe give better calibration results
> >> than querying the system timestamp separately in userspace, if you
> >> reported all of:
> >>    * the system timer value
> >>    * the system timer frequency
> >>    * the GPU timer value
> >>    * the GPU timer frequency (because it _could_ be different in some
> >> systems)  
> > 
> > Duh, I wish this wasn't the case and all SoC vendors went for the
> > arch-timer which guarantees the consistency of the timestamp on the GPU
> > and CPU. But let's say this is a case we need to support, wouldn't it
> > be more useful to do the CPU/GPU calibration kernel side (basically at
> > init/resume time) and then expose the formula describing the
> > relationship between those 2 things:
> > 
> > CPU_time = GPU_time * GPU_to_CPU_mul / GPU_to_CPU_div +
> > 	   GPU_to_CPU_offset;
> >   
> 
> TIMESTAMP_OFFSET should indeed be set by the kernel (on resume). But I 
> don't think we need to post M/D+offset to userspace. The 2 Frequencies + 
> the scalar offset are the raw sources, and userspace can work back from 
> there.

Sure. No matter how you express the relationship, my point was, if the
calibration is supposed to happen in the kernel at resume time,
returning both the CPU/GPU time in DEV_QUERY_TIMESTAMP to make sure the
sampling is close enough that they actually represent the same
timestamp might not be needed, because you can easily convert from one
domain to the other.
