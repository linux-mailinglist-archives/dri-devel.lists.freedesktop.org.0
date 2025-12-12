Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1CBCB8CBC
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 13:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428FA10E34E;
	Fri, 12 Dec 2025 12:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="QNq51kic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4673110E34E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 12:26:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765542393; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=G8h17r3MFXuguk9C9NUUxksDqnJYxsujnT3tdxjx8UnjcgDDUnmLyqJnqn2am+3cpgzUnwa/5ZZV4BgAEUDrkZ+Av/fqU3q58Ww0S0pGT9PpIXj2mhhhh/7Lkc77avfJIekUcFkJGrt2z83jjK7DYkPA2fZJSkRQSGfeXu7yoX8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765542393;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=SfGWoDsJ0Yd7bFiGdo1Gs3yiTCi0yPTB81uQ/TBPH28=; 
 b=Do+Eo9XhluFHiqny2e72lY6X9O1Nds7VDeSWq4AUtH5wHHTGbhQrNkjFP2m1Dr7DiifT0W+3jghRwhRjUhL4TzQI9qavX/XhCHsWvRo84cB4zMUoBYqDNeiItOupRm4cHbnumVd5pa1E/aIPBFyuESQyM0uVTDua1g0t2KmNQhg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765542393; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=SfGWoDsJ0Yd7bFiGdo1Gs3yiTCi0yPTB81uQ/TBPH28=;
 b=QNq51kicQsYvCvzUnK+Mrx14HeVW9CXtJ+sEgAGc+C9nNld/kKGBtEqHObJ4Oy/V
 d8Zegq+r3oOOtGRoJdCVljmjoKCg1AegVea5H1baxICf21EfJws5PHf46+Yc3YEIBlf
 8jHxbypGETFhh9TCkzmvaA5rMsxJOx1VvYJa3PBc=
Received: by mx.zohomail.com with SMTPS id 17655423922531014.6327964304528;
 Fri, 12 Dec 2025 04:26:32 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/3] drm/panthor: Add tracepoint for hardware
 utilisation changes
Date: Fri, 12 Dec 2025 13:26:26 +0100
Message-ID: <13630654.O9o76ZdvQC@workhorse>
In-Reply-To: <20251212102921.350c7e34@fedora>
References: <20251211-panthor-tracepoints-v3-0-924c9d356a5c@collabora.com>
 <2740907.taCxCBeP46@workhorse> <20251212102921.350c7e34@fedora>
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

On Friday, 12 December 2025 10:29:21 Central European Standard Time Boris Brezillon wrote:
> On Thu, 11 Dec 2025 21:15:43 +0100
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> 
> > On Thursday, 11 December 2025 20:37:09 Central European Standard Time Karunika Choo wrote:
> > > On 11/12/2025 16:15, Nicolas Frattaroli wrote:  
> > > > Mali GPUs have three registers that indicate which parts of the hardware
> > > > are powered at any moment. These take the form of bitmaps. In the case
> > > > of SHADER_READY for example, a high bit indicates that the shader core
> > > > corresponding to that bit index is powered on. These bitmaps aren't
> > > > solely contiguous bits, as it's common to have holes in the sequence of
> > > > shader core indices, and the actual set of which cores are present is
> > > > defined by the "shader present" register.
> > > > 
> > > > When the GPU finishes a power state transition, it fires a
> > > > GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> > > > received, the _READY registers will contain new interesting data. During
> > > > power transitions, the GPU_IRQ_POWER_CHANGED interrupt will fire, and
> > > > the registers will likewise contain potentially changed data.
> > > > 
> > > > This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
> > > > which is something related to Mali v14+'s power control logic. The
> > > > _READY registers and corresponding interrupts are already available in
> > > > v9 and onwards.
> > > > 
> > > > Expose the data as a tracepoint to userspace. This allows users to debug
> > > > various scenarios and gather interesting information, such as: knowing
> > > > how much hardware is lit up at any given time, correlating graphics
> > > > corruption with a specific powered shader core, measuring when hardware
> > > > is allowed to go to a powered off state again, and so on.
> > > > 
> > > > The registration/unregistration functions for the tracepoint go through
> > > > a wrapper in panthor_hw.c, so that v14+ can implement the same
> > > > tracepoint by adding its hardware specific IRQ on/off callbacks to the
> > > > panthor_hw.ops member.
> > > > 
> > > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > > ---
> > > >  drivers/gpu/drm/panthor/panthor_gpu.c   | 38 ++++++++++++++++++--
> > > >  drivers/gpu/drm/panthor/panthor_gpu.h   |  2 ++
> > > >  drivers/gpu/drm/panthor/panthor_hw.c    | 62 +++++++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/panthor/panthor_hw.h    |  8 +++++
> > > >  drivers/gpu/drm/panthor/panthor_trace.h | 59 +++++++++++++++++++++++++++++++
> > > >  5 files changed, 167 insertions(+), 2 deletions(-)
> > > > 
> > > > [...]
> > > >
> > > > diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
> > > > new file mode 100644
> > > > index 000000000000..2b59d7f156b6
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/panthor/panthor_trace.h
> > > > @@ -0,0 +1,59 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> > > > +/* Copyright 2025 Collabora ltd. */
> > > > +
> > > > +#undef TRACE_SYSTEM
> > > > +#define TRACE_SYSTEM panthor
> > > > +
> > > > +#if !defined(__PANTHOR_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
> > > > +#define __PANTHOR_TRACE_H__
> > > > +
> > > > +#include <linux/tracepoint.h>
> > > > +#include <linux/types.h>
> > > > +
> > > > +int panthor_hw_power_status_register(void);
> > > > +void panthor_hw_power_status_unregister(void);  
> > > 
> > > Hello, not sure if I'm missing something but, would doing
> > > 
> > >     #include "panthor_hw.h" 
> > > 
> > > address the need to redeclare panthor_hw_power_status_* in this file?
> > > The change looks good otherwise.  
> > 
> > It would, but only in that it now pulls in a whole bunch of header
> > definitions that the trace header does not want or need, all for
> > two function prototypes. Since the function signature of the reg/unreg
> > functions are fixed aside from the name, I don't see any harm in
> > this particular instance of duplicating it.
> > 
> > Similarly, panthor_hw.c probably doesn't want the special magic
> > tracepoint stuff from panthor_trace.h, but it does need to implement
> > those two functions, so it needs to have a prototype somewhere.
> > 
> > Maybe someone else has stronger opinions on this, I'm fine with
> > including panthor_hw.h as well (it's what I had it do originally
> > as well), but I suspect many more experienced kernel devs are
> > wary of overeager header inclusions, because it leads to really
> > slow compilation quite quickly.
> 
> In general I agree that including only headers you really need is a
> good practice (to improve compilation time), but that's also an extra
> maintenance burden when things are declared in multiple places, so I'd
> go for the panthor_hw.h inclusion here, I think.
> 

Alright, will do that in v4. Feel free to leave any more feedback
on anything in the series (e.g. the other tracepoint) so I don't
send too many tiny revisions.



