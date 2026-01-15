Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026AED24FAD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 15:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C635210E0AD;
	Thu, 15 Jan 2026 14:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="namPdomt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E17610E0AD
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 14:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768487782;
 bh=Ct6qKhbCJUEkHn3gx+fIG8nx6b/6TrJ9/3Kzzl8TGmk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=namPdomtR/87cpIuSuvhjhwU4QynDSbXHiAJOHrmrewiBY5U0Bo4bTYOshlK1Fk0o
 TD5SHTpQ6qY6srDwN9a1PLYLTMLSIwExGGD+RcmV3r8XwEAW1Wo2RXRLTSAaewyMoo
 RA3Hj4RX7bOKvCaowW1B9e5R1HBxNNuYOfveJssePU5SCgJliH1nxGHYtR73pBWBdw
 KKKmsY2C2ZoVBdjNrD2KwjISAdjYCxg9Os/ukmrgPFj3PAW4ZgPum36bI/a8+pH8iA
 wqIhpvUgR9OqoMH0gjjhJN/0tSEd5MVq7O4oEt2CGB64UXl68giFp63pAICreTNS1Y
 VrSI4dpEBxV3w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 14F1E17E10F8;
 Thu, 15 Jan 2026 15:36:22 +0100 (CET)
Date: Thu, 15 Jan 2026 15:36:17 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean
 Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P
 Oommen <akhilpo@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Chris Diamand <chris.diamand@arm.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>,
 kernel@collabora.com, nd@arm.com
Subject: Re: [PATCH v1 9/9] drm/panthor: Add a GEM shrinker
Message-ID: <20260115153617.6f6e72cc@fedora>
In-Reply-To: <b92d0548-25ed-4530-99cc-6b8a9fbe70b3@arm.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-10-boris.brezillon@collabora.com>
 <b92d0548-25ed-4530-99cc-6b8a9fbe70b3@arm.com>
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

On Thu, 15 Jan 2026 13:56:42 +0000
Akash Goel <akash.goel@arm.com> wrote:


> > +static unsigned long
> > +panthor_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
> > +{
> > +	struct panthor_device *ptdev = shrinker->private_data;
> > +	unsigned long count;
> > +
> > +	/* We currently don't have a flag to tell when the content of a
> > +	 * BO can be discarded.
> > +	 */
> > +	if (!can_swap())
> > +		return 0;
> > +
> > +	count = ptdev->reclaim.unused.count;
> > +	count += ptdev->reclaim.mmapped.count;
> > +
> > +	if (can_block(sc))
> > +		count += ptdev->reclaim.gpu_mapped_count;
> > +  
> 
> Should we do like this
> 
> 	return count ? count : SHRINK_EMPTY;
> 
> 
> Other drivers are also doing the same
> 
> https://elixir.bootlin.com/linux/v6.18.4/source/drivers/gpu/drm/xe/xe_shrinker.c#L156 
> 
> 
> https://elixir.bootlin.com/linux/v6.18.4/source/drivers/gpu/drm/ttm/ttm_pool.c#L1160
> 
> https://elixir.bootlin.com/linux/v6.18.4/source/mm/vmalloc.c#L5245
> 
> It might matter if CONFIG_MEMCG is set.

Absolutely. I'll fix that in v2.

> 
> > +	return count;
> > +}

> >   /**
> > @@ -678,6 +689,16 @@ int panthor_vm_active(struct panthor_vm *vm)
> >   	if (refcount_inc_not_zero(&vm->as.active_cnt))
> >   		goto out_dev_exit;
> >   
> > +	/* As soon as active is called, we place the VM as the end of the VM LRU.  
> 
> 
> Please replace 'as the end' with 'at the end'.

Will do.
