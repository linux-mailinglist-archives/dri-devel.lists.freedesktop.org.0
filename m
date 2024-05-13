Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD698C3FFA
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 13:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7440710E6B8;
	Mon, 13 May 2024 11:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PzEUJz1k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B82410E6BE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 11:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715600456;
 bh=wFeeGBKMQyo1GYou2gpNI7W2VooPrBRLPiuADwJNk3c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PzEUJz1kXHe0Cxj06PvOXvQ4r4x3H8uXyK8/HvGm9C+xqNKjePNnozNv7OHhVwwbk
 /o97EafmR8eKJDi8mAmQ7OcrTYTjFHtvdrtRw/sVzVHn8rnDTlcawLNsYmoOjXcXrv
 fJoabcv5cnHWYPWuJc36UItZE22uuOSxJ8OsSiOkDrpHAO75odTIsCi0kaJ1g8FX/R
 McR1M+QRJdIgn/AhRIH4KAA+Dqx8k7ide68jcSMnEsbdYoTJrd+j5gkDByKzPdymSS
 z25fbX2ZjQn2X+LZBNgLUsP/Rnf5os2gSPU2GgO6VFpFBqyXLc6bUeHrNEu3QItym3
 UuLYwxxYMLFMg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 67DA1378212E;
 Mon, 13 May 2024 11:40:56 +0000 (UTC)
Date: Mon, 13 May 2024 13:40:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 0/4] drm/panthor: More reset fixes
Message-ID: <20240513134055.4a448383@collabora.com>
In-Reply-To: <20240502183813.1612017-1-boris.brezillon@collabora.com>
References: <20240502183813.1612017-1-boris.brezillon@collabora.com>
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

On Thu,  2 May 2024 20:38:08 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
> This is a collection of fixes for bugs found while chasing an
> unrecoverable fault leading to a device unplug (because of some
> other bugs that was introduced in my local dev branch).
> 
> The first patch makes sure we immediately reset the GPU on an
> unrecoverable fault, and following patches are fixing various
> NULL/invalid pointer derefs caused by use-after-free situations
> following a device unplug.
> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (4):
>   drm/panthor: Force an immediate reset on unrecoverable faults
>   drm/panthor: Keep a ref to the VM at the panthor_kernel_bo level
>   drm/panthor: Reset the FW VM to NULL on unplug
>   drm/panthor: Call panthor_sched_post_reset() even if the reset failed

Queued to drm-misc-next-fixes.

> 
>  drivers/gpu/drm/panthor/panthor_device.c |  8 ++---
>  drivers/gpu/drm/panthor/panthor_device.h |  1 +
>  drivers/gpu/drm/panthor/panthor_fw.c     |  5 +--
>  drivers/gpu/drm/panthor/panthor_gem.c    |  8 +++--
>  drivers/gpu/drm/panthor/panthor_gem.h    |  8 +++--
>  drivers/gpu/drm/panthor/panthor_heap.c   |  8 ++---
>  drivers/gpu/drm/panthor/panthor_sched.c  | 40 +++++++++++++++++-------
>  drivers/gpu/drm/panthor/panthor_sched.h  |  2 +-
>  8 files changed, 51 insertions(+), 29 deletions(-)
> 

