Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33A4A80E69
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 16:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039D310E073;
	Tue,  8 Apr 2025 14:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="YtQ6Wfbm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C0D10E6D8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 14:38:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744123106; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UIJbpd3Je7VE/22JP22ATgzhOov58v+4+9Xft0BsfcsOcXhziDc9W6mComkTRMjPw9kXV6BY2T9g7uDaWc4wlhl10fkyIhYQaBl1Zu/U+k4q1GT8KINu0B9qOLH/BpFzpdmMBVgUejkkFVbdTlS/9CN4jCqX+prHHcGzNDFSTYI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744123106;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=B8NT4vlOQRlx6/HGXEefSUCFtwKkqSEbEk6F1ZBggQQ=; 
 b=TKDC6HeEqVQ+Ngwxe7LuD8BpgIxXEqgLuqSzkruawGqWwql4f3KMVGVhCZHNdvzeLY63c4AcXwKmf5QwQRxWQVOHKNtXgX6X19ioMbqaJm5W82EdIgSnv1YEpCzXk7tyZ1XjeINFaBWB8SwaI93rzX4dFDTrauLkKULBtHjfnJY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744123106; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=B8NT4vlOQRlx6/HGXEefSUCFtwKkqSEbEk6F1ZBggQQ=;
 b=YtQ6Wfbm9jLxE5EO3hTtVtwEoM8tAzdJ6oMhIWwhgQc0EjX76aKfdlzN5wpJnQv3
 IcW96YBC6tTKulDc6OL8hYVrBpovzubUHZVqqay5SxXZlvyAbKaaeaoKW9vANqYbdAc
 LxoQjQMRx/YVqnIgtNKFx+Ci3jCYOIC6HOf3KWYk=
Received: by mx.zohomail.com with SMTPS id 1744123103481976.8695522962561;
 Tue, 8 Apr 2025 07:38:23 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:38:18 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <k5pf4wkpaeuahdg5vasxo226jppjxtndkswoi2g72eezecttic@vrdnyjxbqont>
References: <20250402115432.1469703-1-adrian.larumbe@collabora.com>
 <20250402115432.1469703-5-adrian.larumbe@collabora.com>
 <20250402145804.5cf07f5e@collabora.com>
 <s66dyt32ukr37p24zjgbatm6sk5lzw5ujx2n7p2pr2ixrq3jf4@byemjauyp2mv>
 <20250408154755.0d45b54b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408154755.0d45b54b@collabora.com>
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

On 08.04.2025 15:47, Boris Brezillon wrote:
On Tue, 8 Apr 2025 14:38:44 +0100
Adrián Larumbe <adrian.larumbe@collabora.com> wrote:

> > > > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > > > index 44d027e6d664..2fc87be9b700 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > > > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > > > @@ -2,6 +2,7 @@
> > > >  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> > > >  /* Copyright 2023 Collabora ltd. */
> > > >
> > > > +#include <linux/cleanup.h>
> > > >  #include <linux/dma-buf.h>
> > > >  #include <linux/dma-mapping.h>
> > > >  #include <linux/err.h>
> > > > @@ -10,14 +11,65 @@
> > > >  #include <drm/panthor_drm.h>
> > > >
> > > >  #include "panthor_device.h"
> > > > +#include "panthor_fw.h"
> > > >  #include "panthor_gem.h"
> > > >  #include "panthor_mmu.h"
> > > >
> > > > +#ifdef CONFIG_DEBUG_FS
> > > > +static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo, u32 type_mask)
> > > > +{
> > > > +	INIT_LIST_HEAD(&bo->debugfs.node);
> > >
> > > This should be called when the GEM object is created, otherwise the
> > > list_empty() test done in panthor_gem_debugfs_bo_rm() will only work if
> > > panthor_gem_debugfs_bo_add() is called, and depending on when this
> > > happens, or whether it happens at all, the error path will do a NULL
> > > deref.
> >
> > I'll be moving panthor_gem_debugfs_bo_add() back into panthor_gem_create_object() and
> > inline panthor_gem_debugfs_bo_init() into it.
>
> You mean moving the panthor_gem_debugfs_bo_add() call to
> panthor_gem_create_object(), not inlining its content, right?

Yes, inlining panthor_gem_debugfs_bo_init() into panthor_gem_debugfs_bo_add() and moving
panthor_gem_debugfs_bo_add() into panthor_gem_create_object().

> > > > +	} else {
> > > > +		bo->debugfs.creator.tgid = 0;
> > > > +		snprintf(bo->debugfs.creator.process_name,
> > > > +			 sizeof(bo->debugfs.creator.process_name),
> > > > +			 "kernel");
> > > > +	}
> > > > +
> > > > +	bo->debugfs.bo_mask = type_mask;
> > >
> > > Why not do that directly in panthor_gem_debugfs_bo_add()? The only bits
> > > that might be useful to do early is the INIT_LIST_HEAD(), and I think
> > > it can be inlined in panthor_gem_create_object().
> >
> > I'll be doing in this in the next revision, but because I've no access to the BO
> > type mask from inside Panthor's drm_driver::gem_create_object() binding, then
> > I'll have to assign the mask right after the object has been created.
> >
> > I think this means there might be a short window after the object's been added to
> > the DebugFS GEMs list in which it could be shown with the kernel mask field still
> > set to 0, but I guess that's not too important either.
>
> I think it's okay, as long as you don't crash when printing partially
> initialized objects. Another solution would be to have a flag encoding
> when the obj is initialized, so you can skip objects that don't have
> this flag set yet.

I think what I'll do is set the mask to a poison value, maybe 0xFF, and only when
it's overwritten with a legitimate value, display the object in the DebugFS GEMS file.

Adrian Larumbe
