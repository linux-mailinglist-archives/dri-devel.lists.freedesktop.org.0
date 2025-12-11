Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4948ECB721C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 21:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906ED10E069;
	Thu, 11 Dec 2025 20:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="OBeTBpVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0264D10E069
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 20:16:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765484150; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=n8JN/cQD+ZDxR7e0vEcnmw+OoG0B1OWfYMQomIxkuqh3LIqsYrDeAvy92Fp3Gxrph5muti8av56YAbtrQ8jQIa0/iLJ/pma0tSiR/FL2rO6VdU7wQ2TQ/s0lA7rYN4ceql5xdhailmTU9FXoeD1uxHXOFOqZ1Z5cqPh/HV+R2pI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765484150;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FtV52pEpZTOsw5iM7zwEC77GwPIreWMX9hf9Bu98lY8=; 
 b=WXvjk7jPfLXPgDbZyGrX3BZtQcygfxxy+I/OrPxBFNrAZSH0sEBxk4Bs+icmv7BDW+AMi/wtXXTgQPACi/X0Y9tWt5rKgIS61SHOJhU82NzkX+TTHxtTOTVi10zLVqNFeSuemgOOp078nfVvKAnVpX33c/Vrtmv2yNV6di+TNI8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765484150; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=FtV52pEpZTOsw5iM7zwEC77GwPIreWMX9hf9Bu98lY8=;
 b=OBeTBpVWdTJQ7VV4IwKpbXH27L54a7lYh6DnqdgpvtFJhEOJ+Xj3hkSMzxPsSibG
 uFt1bcAk3aBmaChAmreoopk5f2z+pSLi7nBIkBWmuqE/ZvvkXA/eBS01vkjBUXUEPJp
 dF5R9yHJSLIW7fkj+5Dqava5PXLqkT+BfWKq7gMA=
Received: by mx.zohomail.com with SMTPS id 1765484148729613.6340809912248;
 Thu, 11 Dec 2025 12:15:48 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/3] drm/panthor: Add tracepoint for hardware
 utilisation changes
Date: Thu, 11 Dec 2025 21:15:43 +0100
Message-ID: <2740907.taCxCBeP46@workhorse>
In-Reply-To: <6e261518-6b91-4790-8f95-b36f0435fb81@arm.com>
References: <20251211-panthor-tracepoints-v3-0-924c9d356a5c@collabora.com>
 <20251211-panthor-tracepoints-v3-2-924c9d356a5c@collabora.com>
 <6e261518-6b91-4790-8f95-b36f0435fb81@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Thursday, 11 December 2025 20:37:09 Central European Standard Time Karunika Choo wrote:
> On 11/12/2025 16:15, Nicolas Frattaroli wrote:
> > Mali GPUs have three registers that indicate which parts of the hardware
> > are powered at any moment. These take the form of bitmaps. In the case
> > of SHADER_READY for example, a high bit indicates that the shader core
> > corresponding to that bit index is powered on. These bitmaps aren't
> > solely contiguous bits, as it's common to have holes in the sequence of
> > shader core indices, and the actual set of which cores are present is
> > defined by the "shader present" register.
> > 
> > When the GPU finishes a power state transition, it fires a
> > GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> > received, the _READY registers will contain new interesting data. During
> > power transitions, the GPU_IRQ_POWER_CHANGED interrupt will fire, and
> > the registers will likewise contain potentially changed data.
> > 
> > This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
> > which is something related to Mali v14+'s power control logic. The
> > _READY registers and corresponding interrupts are already available in
> > v9 and onwards.
> > 
> > Expose the data as a tracepoint to userspace. This allows users to debug
> > various scenarios and gather interesting information, such as: knowing
> > how much hardware is lit up at any given time, correlating graphics
> > corruption with a specific powered shader core, measuring when hardware
> > is allowed to go to a powered off state again, and so on.
> > 
> > The registration/unregistration functions for the tracepoint go through
> > a wrapper in panthor_hw.c, so that v14+ can implement the same
> > tracepoint by adding its hardware specific IRQ on/off callbacks to the
> > panthor_hw.ops member.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_gpu.c   | 38 ++++++++++++++++++--
> >  drivers/gpu/drm/panthor/panthor_gpu.h   |  2 ++
> >  drivers/gpu/drm/panthor/panthor_hw.c    | 62 +++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_hw.h    |  8 +++++
> >  drivers/gpu/drm/panthor/panthor_trace.h | 59 +++++++++++++++++++++++++++++++
> >  5 files changed, 167 insertions(+), 2 deletions(-)
> > 
> > [...]
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
> > new file mode 100644
> > index 000000000000..2b59d7f156b6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panthor/panthor_trace.h
> > @@ -0,0 +1,59 @@
> > +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> > +/* Copyright 2025 Collabora ltd. */
> > +
> > +#undef TRACE_SYSTEM
> > +#define TRACE_SYSTEM panthor
> > +
> > +#if !defined(__PANTHOR_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
> > +#define __PANTHOR_TRACE_H__
> > +
> > +#include <linux/tracepoint.h>
> > +#include <linux/types.h>
> > +
> > +int panthor_hw_power_status_register(void);
> > +void panthor_hw_power_status_unregister(void);
> 
> Hello, not sure if I'm missing something but, would doing
> 
>     #include "panthor_hw.h" 
> 
> address the need to redeclare panthor_hw_power_status_* in this file?
> The change looks good otherwise.

It would, but only in that it now pulls in a whole bunch of header
definitions that the trace header does not want or need, all for
two function prototypes. Since the function signature of the reg/unreg
functions are fixed aside from the name, I don't see any harm in
this particular instance of duplicating it.

Similarly, panthor_hw.c probably doesn't want the special magic
tracepoint stuff from panthor_trace.h, but it does need to implement
those two functions, so it needs to have a prototype somewhere.

Maybe someone else has stronger opinions on this, I'm fine with
including panthor_hw.h as well (it's what I had it do originally
as well), but I suspect many more experienced kernel devs are
wary of overeager header inclusions, because it leads to really
slow compilation quite quickly.

Kind regards,
Nicolas Frattaroli

> 
> Reviewed-by: Karunika Choo <karunika.choo@arm.com>
> 
> > [...]




