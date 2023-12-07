Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 085398085C2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 11:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3888C10E851;
	Thu,  7 Dec 2023 10:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E7110E851
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 10:49:29 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BB05F6607377;
 Thu,  7 Dec 2023 10:49:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701946167;
 bh=WMgxcY+Ad8Ay1UmvLM58fhzx0evqIafBB4uqsxbBc+Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lIFHdK3WQWsRotxSVYf3ltjOsvgf3PHMRgao02C/5YQqiajf2TptRJNofXBaFRHRi
 Jxxim99nk3jDIufvHBKj0NENKxuaUAbSV5ETmwrixBXaaHC5TOunKKfml58wNV1nqI
 zIEIIzOc7bqR6zqUPtpbLnasR8UpwE4kQJWWTJtwYF3l+vFr5GvTOZV9Mo7aKnLRGm
 33Negi0AhRajPVYMlx3fI6qgkBSw+/yCpL2Hq9e+skkxFjlgoi+m2NTXOL2ckRWOrH
 e39yHaX+u3g43NIFYhPbtuqGJ4uZZ7k8lcJ+LtBDRXsnDZ/Z4o+KLJLbxW+CJBNRcb
 enp3YYUtJD8Jg==
Date: Thu, 7 Dec 2023 11:49:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 03/14] drm/panthor: Add the device logical block
Message-ID: <20231207114922.18378164@collabora.com>
In-Reply-To: <1b957ca4-71cf-42fd-ac81-1920592b952d@arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-4-boris.brezillon@collabora.com>
 <4d813208-39fe-4387-8415-4b0c17df42a4@arm.com>
 <20231207091243.7ce56a6e@collabora.com>
 <20231207095635.435d3e77@collabora.com>
 <1b957ca4-71cf-42fd-ac81-1920592b952d@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Matt Coster <matt.coster@imgtec.com>,
 =?UTF-8?B?Q2w=?= =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Dec 2023 10:23:55 +0000
Steven Price <steven.price@arm.com> wrote:

> On 07/12/2023 08:56, Boris Brezillon wrote:
> > On Thu, 7 Dec 2023 09:12:43 +0100
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >   
> >> On Wed, 6 Dec 2023 16:55:42 +0000
> >> Steven Price <steven.price@arm.com> wrote:
> >>  
> >>> On 04/12/2023 17:32, Boris Brezillon wrote:    
> >>>> The panthor driver is designed in a modular way, where each logical
> >>>> block is dealing with a specific HW-block or software feature. In order
> >>>> for those blocks to communicate with each other, we need a central
> >>>> panthor_device collecting all the blocks, and exposing some common
> >>>> features, like interrupt handling, power management, reset, ...
> >>>>
> >>>> This what this panthor_device logical block is about.
> >>>>
> >>>> v3:
> >>>> - Add acks for the MIT+GPL2 relicensing
> >>>> - Fix 32-bit support
> >>>> - Shorten the sections protected by panthor_device::pm::mmio_lock to fix
> >>>>   lock ordering issues.
> >>>> - Rename panthor_device::pm::lock into panthor_device::pm::mmio_lock to
> >>>>   better reflect what this lock is protecting
> >>>> - Use dev_err_probe()
> >>>> - Make sure we call drm_dev_exit() when something fails half-way in
> >>>>   panthor_device_reset_work()
> >>>> - Replace CSF_GPU_LATEST_FLUSH_ID_DEFAULT with a constant '1' and a
> >>>>   comment to explain. Also remove setting the dummy flush ID on suspend.
> >>>> - Remove drm_WARN_ON() in panthor_exception_name()
> >>>> - Check pirq->suspended in panthor_xxx_irq_raw_handler()
> >>>>
> >>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>>> Signed-off-by: Steven Price <steven.price@arm.com>
> >>>> Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
> >>>> Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,Linaro
> >>>> Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 relicensing,Collabora      
> >>>
> >>> We still have the "FIXME: this is racy"    
> >>
> >> Yeah, I still didn't find a proper solution for that.  
> > 
> > This [1] should fix the race condition in the unplug path.
> > 
> > [1]https://gitlab.freedesktop.org/panfrost/linux/-/commit/b79b28069e524ae7fea22a9a158b870eab2d5f9a  
> 
> Looks like it should do the job. I'm surprised that we're the only ones
> to face this though.

Most drivers just have one path where they call drm_dev_unplug():
the device removal callback, which is only called once per device. The
only exception where I see more than one occurrence are the amdgpu
and powervr drivers. I guess amdgpu has some tricks to serialize
_unplug operations, and powervr is probably buggy as you pointed out.

> 
> Looking at the new imagination driver it appears there's a similar problem:
> 
> pvr_device_lost() uses a boolean 'lost' to track multiple calls but that
> boolean isn't protected by any specific lock (AFAICT). Indeed
> pvr_device_lost() calls drm_dev_unplug() while in a drm_dev_enter()
> critical section (see pvr_mmu_flush_exec()). If I'm not mistaken that's
> the same problem we discussed and isn't allowed?

It is, indeed. That means there's a deadlock when pvr_device_lost() is
called from the MMU code. And I guess the race condition with
concurrent pvr_device_lost() callers exists too (unless I missed
something, and calls to pvr_device_lost() are serialized with another
lock).

> drm_dev_unplug() will
> synchronise on the SRCU that drm_dev_enter() is holding.
> 
> +CC: Frank, Donald, Matt from Imagination.
> 
> Steve
> 

