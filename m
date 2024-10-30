Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B26D9B6817
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 16:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C2910E7C2;
	Wed, 30 Oct 2024 15:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WXysF9kH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B40D10E7C2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 15:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730302899;
 bh=j4aKNK30k3bNGkdz8JxIdcxsvmPZK+xK1WVstI8bKlk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WXysF9kHDyC6/mxxxqeP7yImgYoVKAEYfSF+kqL2ftO/FyyOvslw+9jRWftJa9uRI
 2URa3+sEDYOPFLzsRUSyFqvG4D+pxkGhm5WdGPCveuRD97X3BoNwv90rUWQyi9Wq5E
 HdLFQmYlgwJH4XMF6dsgWKvCTnEleFl8VDWNnq+PKFQL1DkAjRZmw+b3AeVPpym9y5
 NHOm4sPuilAhMCTIGUlki4imYW6KHS6d4Gv9d5FDf1uIqure0IH+ycaE1mL69QdSlh
 PV4bLz2+u30CUJFlKPWNqROZCXu64XLd4M7gj7Xdl1qlw6rDzyKjgTJvmpwOPjSEjn
 h1vBIgO6OC2Kg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1450717E3664;
 Wed, 30 Oct 2024 16:41:39 +0100 (CET)
Date: Wed, 30 Oct 2024 16:41:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v3 0/3] drm/panthor: Fix group state reporting
Message-ID: <20241030164135.7ee8029b@collabora.com>
In-Reply-To: <20241029152912.270346-1-boris.brezillon@collabora.com>
References: <20241029152912.270346-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Tue, 29 Oct 2024 16:29:09 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
> What initially started as a simple fix to avoid queueing jobs to a group
> that can't be scheduled has turned into a series of three patches
> improving the group state reporting. Two of them are actual fixes, the
> last one is an improvement to properly report innocence/guiltiness of
> a group when a group becomes unusable. With this new
> GROUP_STATE_INNOCENT, we can distinguish between
> GL_INNOCENT_CONTEXT_RESET and GL_GUILT_CONTEXT_RESET (see this mesa
> MR for more details [1]).
> 
> Regards,
> 
> Boris
> 
> [1]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31868
> 
> Boris Brezillon (3):
>   drm/panthor: Fail job creation when the group is dead
>   drm/panthor: Report group as timedout when we fail to properly suspend

First two patches are queued to drm-misc-fixes.

>   drm/panthor: Report innocent group kill

I'll send a v4 of the third one and wait for a backmerge of Linus' tree
in drm-misc-next before applying.

> 
>  drivers/gpu/drm/panthor/panthor_drv.c   |  2 +-
>  drivers/gpu/drm/panthor/panthor_sched.c | 38 ++++++++++++++++++++++---
>  include/uapi/drm/panthor_drm.h          |  9 ++++++
>  3 files changed, 44 insertions(+), 5 deletions(-)
> 

