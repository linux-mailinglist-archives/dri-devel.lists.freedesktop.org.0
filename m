Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1C941D702
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 11:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E99B6E3D0;
	Thu, 30 Sep 2021 09:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F956E3D0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=vRfZunOKTaL5x/MrqxLS8S7lYzU9lSbVDRCoWbuS4iw=; 
 b=VeKvhICZ5vN+Po+3scTkOgKRlqQeFO0F4qBoUKky9XGXeNKG8cGth4WEjUW+40H3039wMDWSyhr647zgb4ZEKcpoknmVN9v9mz/uRwKc2KACN0aYj4PgLRYC9NOachvkNiOQEXtqpDwSA9Tado6XzAGHoA3p28JsV9/kmCnEFZeFLlo9hXTZOdY9IiF9kbZ0TrfdiG0WvtKSE3wU8Ui/y0v0TvrRMXEd9F6RgZ/hZ6ngpPCRK+/JNIhiW/FFrbdGy2O9yH2OrV2ir0Kfk4qkxqhItq82un8YQxSByxMsiqGjTLOl9MCVlbkRXzkp6rCJD4kyoZBheMI7cfHAgozWfg==;
Received: from 182.48.165.83.dynamic.reverse-mundo-r.com ([83.165.48.182]
 helo=zeus) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mVsr1-0005QH-1s; Thu, 30 Sep 2021 11:59:51 +0200
Message-ID: <dd6ee6e4af29f6e1fb7b21e7743e8f26b069b2a1.camel@igalia.com>
Subject: Re: [PATCH v2 3/4] drm/v3d: add generic ioctl extension
From: Iago Toral <itoral@igalia.com>
To: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard
 <maxime@cerno.tech>,  Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, 30 Sep 2021 11:59:41 +0200
In-Reply-To: <20210930092241.hikxj2iseu2kzt5u@mail.igalia.com>
References: <cover.1632905676.git.mwen@igalia.com>
 <779e2cc57efd5fbc95f1267e7252de5f092045c5.1632905676.git.mwen@igalia.com>
 <d4d4762f1365f22b53677da2f77a5ac27e899a4c.camel@igalia.com>
 <20210930092241.hikxj2iseu2kzt5u@mail.igalia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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

On Thu, 2021-09-30 at 10:22 +0100, Melissa Wen wrote:
> > > 
> O 09/30, Iago Toral wrote:
> > On Wed, 2021-09-29 at 10:44 +0100, Melissa Wen wrote:
(...) 
> > >  /**
> > >   * struct drm_v3d_submit_cl - ioctl argument for submitting
> > > commands
> > > to the 3D
> > > @@ -135,12 +149,16 @@ struct drm_v3d_submit_cl {
> > >  	/* Number of BO handles passed in (size is that times 4). */
> > >  	__u32 bo_handle_count;
> > >  
> > > +	/* DRM_V3D_SUBMIT_* properties */
> > >  	__u32 flags;
> > >  
> > >  	/* ID of the perfmon to attach to this job. 0 means no perfmon.
> > > */
> > >  	__u32 perfmon_id;
> > >  
> > >  	__u32 pad;
> > > +
> > > +	/* Pointer to an array of ioctl extensions*/
> > > +	__u64 extensions;
> > >  };
> > >  
> > >  /**
> > > @@ -248,6 +266,12 @@ struct drm_v3d_submit_tfu {
> > >  	__u32 in_sync;
> > >  	/* Sync object to signal when the TFU job is done. */
> > >  	__u32 out_sync;
> > > +
> > > +	__u32 flags;
> > > +
> > > +	/* Pointer to an array of ioctl extensions*/
> > > +	__u64 extensions;
> > 
> > We want __u64 fields aligned to 64-bit so we should swap the
> > positions
> > of flags and extensions.
> 
> hmm.. not sure. before two arrays of 4 x _u32 elements, we have seven
> _u32 elements... this is why I counted a odd number of _u32 and put
> _u32
> flags before _u64 extensions... or is it working different for array
> types?
> 

Ah yes, I was confused by the patch format, but you're right.

> For the same reason, I think there is an unalignment issue on
> submit_csd that would need to change the current interface to solve
> (afaiu)... 
> 

Yes, that one is not aligned, but it is too late to fix now without
braking the interface. We have not seen any issues caused by that on
32-bit Raspbian though.

Iago

> > > +
> > >  };
> > >  
> > >  /* Submits a compute shader for dispatch.  This job will block
> > > on
> > > any
> > > @@ -276,6 +300,13 @@ struct drm_v3d_submit_csd {
> > >  
> > >  	/* ID of the perfmon to attach to this job. 0 means no perfmon.
> > > */
> > >  	__u32 perfmon_id;
> > > +
> > > +	/* Pointer to an array of ioctl extensions*/
> > > +	__u64 extensions;
> > > +
> > > +	__u32 flags;
> > > +
> > > +	__u32 pad;
> > >  };
> > >  
> > >  enum {

