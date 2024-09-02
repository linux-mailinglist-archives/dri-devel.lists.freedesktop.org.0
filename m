Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36AF9685BB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 13:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4879C10E293;
	Mon,  2 Sep 2024 11:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="L6SizFjR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA7010E293
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 11:07:27 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42bbbff40bbso25254905e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725275246; x=1725880046; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8H1B0WFoCbQP6wHAvLVstY2pWaETt2evPEPaAOw4T9w=;
 b=L6SizFjRi2bp0WM/ZgNjz/0yDEd3xHetbkgTu9Xpd6sADQLuYmsfMG7AfuSUbShCuI
 MnIbmLVu1HQlqKrrRYQEjbHsz6f2nTOTwIn/6lxP6NaEgILDR8cGJvw0xHFOk5EkYxLX
 J8b6Gk8COkm6lM6FqV9EKTyyOxu6ZGdjjNVFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725275246; x=1725880046;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8H1B0WFoCbQP6wHAvLVstY2pWaETt2evPEPaAOw4T9w=;
 b=bCscIIF+dq4chUgfmePLcXAUWcU/X04ZXMPIb3q6c++6qPL8rKGltNCKDzB6BQr6mi
 WTXW14u6xqN4H+3kJ7Mv13gBqYiNnVtegAamrk/IWl8mjEqsA9W7ujSmCnWRRnbJLCIc
 gEBmO3q2B/FppOPh0hCdxnUtWyzpRzNyndUu8kFZf02JAAwIm8w317TdYbHkSCl9T5xh
 BZrLLOURBrM6GFXSxGGQqrydX1ZujuKbiwzlwYtu6+KIj9hrAXCb+2AFuFhD5T+Lildw
 yxUqWOLZgsjWi61IlPvTyoMIY/GCCjduE0G3cSkMb6fRPIyEJZgvY6VL8BJiNJWKYgqp
 tVhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEx1XU6f2oJPzcpIDtb2rjlNJtwyH+xJTFl1A04M0URfS2KoUbK17p692it3TD3/gieQX/EXXdCl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0i4OE+5RqWwem76cectwSnmLIkQl4Gz4DsqmmjDUyAdOeu+Jo
 r5suaIFT1MS+Mey3WfhJyKKEsXr7JkOxV1iAHT+Bf8twigfsTHAhwviA2/3Ig6Y=
X-Google-Smtp-Source: AGHT+IFe9aYlj4SobSE6MDk0EW8XIQ+qgTPZ//jqnYexViZl167JZsTQ9gF9oGPdTrT/fU21lt+Stg==
X-Received: by 2002:a05:600c:1d25:b0:428:1fa1:7b92 with SMTP id
 5b1f17b1804b1-42bbb2166e4mr66206725e9.19.1725275245920; 
 Mon, 02 Sep 2024 04:07:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df92f1sm134774455e9.25.2024.09.02.04.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 04:07:25 -0700 (PDT)
Date: Mon, 2 Sep 2024 13:07:23 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
Message-ID: <ZtWca-cpqUsE8WTZ@phenom.ffwll.local>
References: <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <ZscDox5KoiNHXxne@phenom.ffwll.local>
 <3afe3ab2-4a58-49a9-acd7-c989980c68f2@amd.com>
 <Zs4EPT1DR7OrE5X-@phenom.ffwll.local>
 <Zs4Ss8LJ-n9NbBcb@phenom.ffwll.local>
 <c890ecbf-e7eb-479d-bb54-807edd1f66e6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c890ecbf-e7eb-479d-bb54-807edd1f66e6@amd.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Wed, Aug 28, 2024 at 02:20:34PM +0200, Christian König wrote:
> Am 27.08.24 um 19:53 schrieb Daniel Vetter:
> > On Tue, Aug 27, 2024 at 06:52:13PM +0200, Daniel Vetter wrote:
> > > On Thu, Aug 22, 2024 at 03:19:29PM +0200, Christian König wrote:
> > > > Completely agree that this is complicated, but I still don't see the need
> > > > for it.
> > > > 
> > > > Drivers just need to use pm_runtime_get_if_in_use() inside the shrinker and
> > > > postpone all hw activity until resume.
> > > Not good enough, at least long term I think. Also postponing hw activity
> > > to resume doesn't solve the deadlock issue, if you still need to grab ttm
> > > locks on resume.
> > Pondered this specific aspect some more, and I think you still have a race
> > here (even if you avoid the deadlock): If the condiditional rpm_get call
> > fails there's no guarantee that the device will suspend/resume and clean
> > up the GART mapping.
> 
> Well I think we have a major disconnect here. When the device is powered
> down there is no GART mapping to clean up any more.
> 
> In other words GART is a table in local memory (VRAM) when the device is
> powered down this table is completely destroyed. Any BO which was mapped
> inside this table is now not mapped any more.
> 
> So when the shrinker wants to evict a BO which is marked as mapped to GART
> and the device is powered down we just skip the GART unmapping part because
> that has already implicitly happened during power down.
> 
> Before mapping any BO into the GART again we power the GPU up through the
> runtime PM calls. And while powering it up again the GART is restored.

My point is that you can't tell whether the device will power down or not,
you can only tell whether there's a chance it might be powering down and
so you can't get at the rpm reference without deadlock issues.

> > The race gets a bit smaller if you use
> > pm_runtime_get_if_active(), but even then you might catch it right when
> > resume almost finished.
> 
> What race are you talking about?
> 
> The worst thing which could happen is that we restore a GART entry which
> isn't needed any more, but that is pretty much irrelevant since we only
> clear them to avoid some hw bugs.

The race I'm seeing is where you thought the GART entry is not issue,
tossed an object, but the device didn't suspend, so might still use it.

I guess if we're clearly separating the sw allocation of the TTM_TT with
the physical entries in the GART that should all work, but feels a bit
tricky. The race I've seen is essentially these two getting out of sync.

So maybe it was me who's stuck.

What I wonder is whether it works in practice, since on the restore side
you need to get some locks to figure out which gart mappings exist and
need restoring. And that's the same locks as the shrinker needs to figure
out whether it might need to reap a gart mapping.

Or do you just copy the gart entries over and restore them exactly as-is,
so that there's no shared locks?

> > That means we'll have ttm bo hanging around with GART allocations/mappings
> > which aren't actually valid anymore (since they might escape the cleanup
> > upon resume due to the race). That doesn't feel like a solid design
> > either.
> 
> I'm most likely missing something, but I'm really scratching my head where
> you see a problem here.

I guess one issue is that at least traditionally, igfx drivers have nested
runtime pm within dma_resv lock. And dgpu drivers the other way round.
Which is a bit awkward if you're trying for common code.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
