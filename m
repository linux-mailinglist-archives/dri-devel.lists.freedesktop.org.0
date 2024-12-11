Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43E99EC9F9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 11:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0A310E1A2;
	Wed, 11 Dec 2024 10:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lkwIBqr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF8F10E1A2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733911816;
 bh=babC7tYWOb3c1EKzrIOvn4ou5ae6maJ4Ce2bZsVQg9c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lkwIBqr7dz4VyGrMNsPlO+bfnxVS06GoYrz/ok5KQ7XkQSAn0yuKSaaemKE+U7sjU
 NI6SWvfC14Q2D+bTfCP3hM+gz/mAuh3tdbyJaLWCUOeNcsMNIF2uiBHFVlXJjCbUul
 CjuqljpgrIjtLfCYHvDVa6ou2gtGwITJXnm4W18Wf6mfVWcYv+iLV/T2gkysdjH6u7
 vWpJ2/GTFai/VsSzkgLO9ZFyscTHzTtdXxPvBKFW4K8OmyhbbxVQRgJqrtCVPsOFCM
 Snkb01FnGFRB+sCaicLhslONQl1qblpMt9Q30lL+WZ8li9xySvDIhuyyI/iHUMLRQy
 F6ZeJZ8R6Oqag==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6BBD817E35F4;
 Wed, 11 Dec 2024 11:10:16 +0100 (CET)
Date: Wed, 11 Dec 2024 11:10:11 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 0/5] drm/panthor: Be robust against failures in the
 resume path
Message-ID: <20241211111011.22a24c64@collabora.com>
In-Reply-To: <20241211075419.2333731-1-boris.brezillon@collabora.com>
References: <20241211075419.2333731-1-boris.brezillon@collabora.com>
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

On Wed, 11 Dec 2024 08:54:14 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
> Here's a collection of patches improving robustness to failures in
> the device resume/suspend path. Those failures are pretty hard to
> reproduce (happens once in a while on a deqp-vk run), so I used a
> mechanism to fake them.
> 
> Faking a FW boot failure is kinda tricky though, which means the
> last patch has only been partially tested:
> - the fast reset path is well tested because that's the default on
>   a device suspend
> - the slow reset has been tested with a hack replacing fast resets
>   by slow resets
> - the fast -> slow reset fallback has been tested by faking boot
>   failures after a fast reset, but these are not real, which means
>   we can't really validate if the MCU recovers fine after a slow
>   reset
> 
> On the other hand, this implementation doesn't look like it could
> do more harm than the current one (the only difference is the
> extra GPU soft-reset that happens between the fast and slow FW
> boot).
> 
> Nothing major changed in v3. Each patch contains a changelog, if
> you're interested.
> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (5):
>   drm/panthor: Preserve the result returned by panthor_fw_resume()
>   drm/panthor: Be robust against runtime PM resume failures in the
>     suspend path
>   drm/panthor: Ignore devfreq_{suspend,resume}_device() failures
>   drm/panthor: Be robust against resume failures
>   drm/panthor: Fix the fast-reset logic

Queued to drm-misc-next.

> 
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 12 ++--
>  drivers/gpu/drm/panthor/panthor_devfreq.h |  4 +-
>  drivers/gpu/drm/panthor/panthor_device.c  | 68 ++++++++++-------------
>  drivers/gpu/drm/panthor/panthor_device.h  | 37 ++++++++++++
>  drivers/gpu/drm/panthor/panthor_drv.c     |  2 +-
>  drivers/gpu/drm/panthor/panthor_fw.c      | 68 +++++++----------------
>  drivers/gpu/drm/panthor/panthor_gpu.c     | 14 +++--
>  drivers/gpu/drm/panthor/panthor_mmu.c     |  3 +-
>  drivers/gpu/drm/panthor/panthor_sched.c   |  4 +-
>  9 files changed, 107 insertions(+), 105 deletions(-)
> 

