Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49978C8D33
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 22:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E039310E00F;
	Fri, 17 May 2024 20:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ur9I/fdO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745BA10E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 20:12:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7209161E2A;
 Fri, 17 May 2024 20:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D93C32782;
 Fri, 17 May 2024 20:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715976744;
 bh=S8uwpeLZ+ub2Pr8pjfgM4+SSbXbFNBtJ2z2gFUGvxh8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ur9I/fdOwlQftj39+BLRaZvYz/EKKieyZqNSdOFkj1wv6eHn3qYhFQwVO8VNg0fy1
 K7nLW4pt6Upyaz9lVmzGI0pELPdiicDSf8kcjqWvvJFX22MqEEtIUmSSj+VuLAXdb5
 /h3dY/0lQlMb8FQOd9fYA2Dd73Q+sCLsyTTyNxUXSm4PhzG6/jG49d9OMVsI60dQsz
 5/8/mexdS6A2hqg0GrR5lQojsRfpYbnssOcP6//KL2G9fk+BvQsODdxddqjaHzGmbM
 NFKhiUmkAwDb3rjvZaitpuhY9ST5/AuU47sYn+Eoft18j+q2SqMMJEMzOxZQmd6rXO
 xchTC4RlyUytQ==
Date: Fri, 17 May 2024 13:12:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Airlie
 <airlied@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter
 <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v3 0/2] Fix Kernel CI issues
Message-ID: <20240517131222.2f147cf9@kernel.org>
In-Reply-To: <2002d2b4-ab0c-4c35-9693-c2b82054262c@ideasonboard.com>
References: <20240426-dp-live-fmt-fix-v3-0-e904b5ae51d7@amd.com>
 <2a14d8ff-a8f5-4ebe-9f0e-a5554b417f0c@ideasonboard.com>
 <20240503162733.GA4136865@thelio-3990X>
 <2002d2b4-ab0c-4c35-9693-c2b82054262c@ideasonboard.com>
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

On Fri, 3 May 2024 20:25:49 +0300 Tomi Valkeinen wrote:
> > I think the second patch also needs to go to drm-misc-next-fixes? The
> > clang warning fixed by it has returned in next-20240503 because it
> > appears that for-linux-next was switch from drm-misc-next to
> > drm-misc-next-fixes, as I see for-linux-next was pointing to commit
> > 235e60653f8d ("drm/debugfs: Drop conditionals around of_node pointers")
> > on drm-misc-next in next-20240502 but it is now pointing to commit
> > be3f3042391d ("drm: zynqmp_dpsub: Always register bridge") on
> > drm-misc-next-fixes in next-20240503.  
> 
> Oh. Hmm, did I just hit the feature-freeze point with the fixes...
> 
> Now I'm unsure where I should push these (if anywhere), as they already 
> are in drm-misc-next.
> 
> DRM Misc maintainers, can you give me a hint? =)

This is now breaking allmodconfig build of Linus's tree.
Could you please get it fixed ASAP?
