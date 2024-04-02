Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C94D895800
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 17:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0496010EA9C;
	Tue,  2 Apr 2024 15:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GY2ORIGd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF17610EA9C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 15:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712071168;
 bh=U8hrt2COlh1X8zQqKdj1binoX1xhmTI1QSOBv6cNndE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GY2ORIGdVU4Pt/orK+mi4O2Mfxy3wpYDxy/EEaWhVXds6QiAZrs2I2ugll5b7oLyo
 H2OIjW5w79UBgemHrXdAO+hta1mnE8dbdr2jWoFvFX7zqApDwH6pTR+jbsYfBPXnWD
 agjcLcfziOANptDPpg6072nuiNxUVEJENPevs4cQsSrHo+T+AGa1a8J8RdHu/euks0
 V079EPkQSAhK1zys/vTsHOxGFxU+mKb17bmMF+HDB0PL2nxi8BIhzMF29CJFTIlb6/
 drx80NBJvL7kQ5Lap2lraTpowTFCPD9pYgVTMKIAvLtI9IhpNpEhB2FnXzwYCMEXun
 f23CUA9JyicZA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 439C5378143B;
 Tue,  2 Apr 2024 15:19:27 +0000 (UTC)
Date: Tue, 2 Apr 2024 17:19:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, Grant Likely <grant.likely@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, error27@gmail.com
Subject: Re: [PATCH v3] drm/panthor: Fix couple of NULL vs IS_ERR() bugs
Message-ID: <20240402171925.41dce3a5@collabora.com>
In-Reply-To: <91e25b42-c3fa-4b69-ab8c-5d79610e757b@moroto.mountain>
References: <20240402141412.1707949-1-harshit.m.mogalapalli@oracle.com>
 <20240402163838.34003a10@collabora.com>
 <91e25b42-c3fa-4b69-ab8c-5d79610e757b@moroto.mountain>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

On Tue, 2 Apr 2024 17:44:18 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Tue, Apr 02, 2024 at 04:38:38PM +0200, Boris Brezillon wrote:
> > On Tue,  2 Apr 2024 07:14:11 -0700
> > Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com> wrote:
> >   
> > > Currently panthor_vm_get_heap_pool() returns both ERR_PTR() and
> > > NULL(when create is false and if there is no poool attached to the  
> > 
> >                                                ^ pool
> >   
> > > VM)
> > > 	- Change the function to return error pointers, when pool is
> > > 	  NULL return -ENOENT
> > > 	- Also handle the callers to check for IS_ERR() on failure.
> > > 
> > > Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")  
> > 
> > I would explain that the code was correct, but the documentation didn't
> > match the function behavior, otherwise it feels a bit weird to have a
> > Fixes tag here.  
> 
> The code wasn't correct, it returned a mix of error pointers and NULL.

AFAICT, this is allowed, otherwise why would we have IS_ERR_OR_NULL().
The fact smatch can't see through panthor_vm_get_heap_pool() and detect
that the return value is different for create=false/true doesn't mean
the code was wrong. I'm certainly not saying this is a good thing to
have a function that encodes the error case with two different kind of
return value, but I wouldn't qualify it as a bug either. What's
incorrect though, is the fact the documentation doesn't match the code.

> So it needs a Fixes tag.

I didn't say we should drop the Fixes tag, but the bug being fixed here
is a mismatch between the doc and the implementation, the code itself
was correct, and the behavior is actually unchanged with this patch
applied, it's just done in a less confusing way.

Regards,

Boris
