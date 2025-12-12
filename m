Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAF9CB875E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 10:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C983F10E06D;
	Fri, 12 Dec 2025 09:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NGHARHsB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8990210E06D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765531767;
 bh=Zg3R/6d1Qyh1Q4V47/g5mFcxsZ6WTr7JABh4hPnSJEA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NGHARHsBvtXY+7Kpjzk3pplqlKE+Vzx7mx8nYwtBUQ4bdwZgocyx2ovHv/SIOODVp
 EtxhSrOnIoDEXf/RQKl2dUt2RmfP6LRHIURj9Ykq3nivdWcZ6Z/59q+6krf17nwtYt
 GjSmqgODenSvL/3l4q+Uqs/18MUE+XAOrbWlJEH6CKtktpjx11eJextGQ7Ug/NO8sy
 bbKQFSl3A0AbvowQUHXggw3klsv3NcUc77aSntBDl/7hsbb//SZ0+d4+bOMnhFWuRw
 czQREZIGjSAjzSElCzG37JqSIBueDYLRAQW189xQVYOueV1u9ekwMILi0Hc3z4tOJ1
 aSi9t10S7n3Sg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5396217E0451;
 Fri, 12 Dec 2025 10:29:27 +0100 (CET)
Date: Fri, 12 Dec 2025 10:29:21 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chia-I Wu
 <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/3] drm/panthor: Add tracepoint for hardware
 utilisation changes
Message-ID: <20251212102921.350c7e34@fedora>
In-Reply-To: <2740907.taCxCBeP46@workhorse>
References: <20251211-panthor-tracepoints-v3-0-924c9d356a5c@collabora.com>
 <20251211-panthor-tracepoints-v3-2-924c9d356a5c@collabora.com>
 <6e261518-6b91-4790-8f95-b36f0435fb81@arm.com>
 <2740907.taCxCBeP46@workhorse>
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

On Thu, 11 Dec 2025 21:15:43 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> On Thursday, 11 December 2025 20:37:09 Central European Standard Time Karunika Choo wrote:
> > On 11/12/2025 16:15, Nicolas Frattaroli wrote:  
> > > Mali GPUs have three registers that indicate which parts of the hardware
> > > are powered at any moment. These take the form of bitmaps. In the case
> > > of SHADER_READY for example, a high bit indicates that the shader core
> > > corresponding to that bit index is powered on. These bitmaps aren't
> > > solely contiguous bits, as it's common to have holes in the sequence of
> > > shader core indices, and the actual set of which cores are present is
> > > defined by the "shader present" register.
> > > 
> > > When the GPU finishes a power state transition, it fires a
> > > GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> > > received, the _READY registers will contain new interesting data. During
> > > power transitions, the GPU_IRQ_POWER_CHANGED interrupt will fire, and
> > > the registers will likewise contain potentially changed data.
> > > 
> > > This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
> > > which is something related to Mali v14+'s power control logic. The
> > > _READY registers and corresponding interrupts are already available in
> > > v9 and onwards.
> > > 
> > > Expose the data as a tracepoint to userspace. This allows users to debug
> > > various scenarios and gather interesting information, such as: knowing
> > > how much hardware is lit up at any given time, correlating graphics
> > > corruption with a specific powered shader core, measuring when hardware
> > > is allowed to go to a powered off state again, and so on.
> > > 
> > > The registration/unregistration functions for the tracepoint go through
> > > a wrapper in panthor_hw.c, so that v14+ can implement the same
> > > tracepoint by adding its hardware specific IRQ on/off callbacks to the
> > > panthor_hw.ops member.
> > > 
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  drivers/gpu/drm/panthor/panthor_gpu.c   | 38 ++++++++++++++++++--
> > >  drivers/gpu/drm/panthor/panthor_gpu.h   |  2 ++
> > >  drivers/gpu/drm/panthor/panthor_hw.c    | 62 +++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/panthor/panthor_hw.h    |  8 +++++
> > >  drivers/gpu/drm/panthor/panthor_trace.h | 59 +++++++++++++++++++++++++++++++
> > >  5 files changed, 167 insertions(+), 2 deletions(-)
> > > 
> > > [...]
> > >
> > > diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
> > > new file mode 100644
> > > index 000000000000..2b59d7f156b6
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/panthor/panthor_trace.h
> > > @@ -0,0 +1,59 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> > > +/* Copyright 2025 Collabora ltd. */
> > > +
> > > +#undef TRACE_SYSTEM
> > > +#define TRACE_SYSTEM panthor
> > > +
> > > +#if !defined(__PANTHOR_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
> > > +#define __PANTHOR_TRACE_H__
> > > +
> > > +#include <linux/tracepoint.h>
> > > +#include <linux/types.h>
> > > +
> > > +int panthor_hw_power_status_register(void);
> > > +void panthor_hw_power_status_unregister(void);  
> > 
> > Hello, not sure if I'm missing something but, would doing
> > 
> >     #include "panthor_hw.h" 
> > 
> > address the need to redeclare panthor_hw_power_status_* in this file?
> > The change looks good otherwise.  
> 
> It would, but only in that it now pulls in a whole bunch of header
> definitions that the trace header does not want or need, all for
> two function prototypes. Since the function signature of the reg/unreg
> functions are fixed aside from the name, I don't see any harm in
> this particular instance of duplicating it.
> 
> Similarly, panthor_hw.c probably doesn't want the special magic
> tracepoint stuff from panthor_trace.h, but it does need to implement
> those two functions, so it needs to have a prototype somewhere.
> 
> Maybe someone else has stronger opinions on this, I'm fine with
> including panthor_hw.h as well (it's what I had it do originally
> as well), but I suspect many more experienced kernel devs are
> wary of overeager header inclusions, because it leads to really
> slow compilation quite quickly.

In general I agree that including only headers you really need is a
good practice (to improve compilation time), but that's also an extra
maintenance burden when things are declared in multiple places, so I'd
go for the panthor_hw.h inclusion here, I think.
