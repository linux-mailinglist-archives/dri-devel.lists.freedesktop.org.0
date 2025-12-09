Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB92DCAFFF6
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 14:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E389210E550;
	Tue,  9 Dec 2025 13:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="XZnd/Yh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4679510E54D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 13:01:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765285290; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TXpPjMPdlzxYb30AUQTMkKAEHcO8MfXO1uGLFI4tOzRUBw/+Mb+ixXwEjNRrjCoydUCJBFmePQB4eYtAo7iVneeqF59mxrHFnyLBnNAOedW3GpkOdxS99s4SfIl38kWZCdm354ydhu1aelHy3yhg5Y1BcXSbPd3jTW+GEeA6ruY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765285290;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Qh4/YHvKXSK/oR0+d3ijqX/3BsUjruszsnI/EQ6Ogzo=; 
 b=hTbBx/aRYGESsbmXCQ6KIS3ahKB9f0w9rI29gkbGY2tdvHxQeK5SqqJsqKDEVw/6AeezqyImFGhLY9M4trrczfTukC/+vPPr4SC2N0ETiQCuqPIcUQciorpcG1ODGezZ/4QVLUoWDr6sDfULJ+rLD38F/lljUijVnwYO8ojKZjg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765285290; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=Qh4/YHvKXSK/oR0+d3ijqX/3BsUjruszsnI/EQ6Ogzo=;
 b=XZnd/Yh3FPDS/q6uID89zbEE8ATqbx/fi6ZHpenjR3qbs8UsAg4CVAl2UppW1ojT
 oaccdwxZKW960IcW7MffVPVf61E4rYig/xhkt2TssdwzV80xFCEMBhHgsvacFCTW0mf
 5w7i4SOUF6L5C0aWgfEas5US3qTcJgCPFY8qjOAY=
Received: by mx.zohomail.com with SMTPS id 176528528860695.90540056208681;
 Tue, 9 Dec 2025 05:01:28 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/panthor: Add tracepoint for hardware utilisation
 changes
Date: Tue, 09 Dec 2025 14:01:23 +0100
Message-ID: <3726594.R56niFO833@workhorse>
In-Reply-To: <4363e055-c1f9-49c6-81dd-c2e5f8307310@arm.com>
References: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
 <20251203-panthor-tracepoints-v1-1-871c8917e084@collabora.com>
 <4363e055-c1f9-49c6-81dd-c2e5f8307310@arm.com>
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

On Monday, 8 December 2025 18:14:53 Central European Standard Time Karunika Choo wrote:
> On 03/12/2025 13:56, Nicolas Frattaroli wrote:
> > [... snip ...]
> > diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
> > new file mode 100644
> > index 000000000000..01013f81e68a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panthor/panthor_trace.h
> > @@ -0,0 +1,38 @@
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
> > +TRACE_EVENT(gpu_power_active,
> > +	TP_PROTO(u64 shader_bitmap, u64 tiler_bitmap, u64 l2_bitmap),
> 
> nit: if you want to add tracing can we also add the device name as
> well? Something like:
> 
>   TP_PROTO(struct device *dev, ...),
>   TP_ARGS(dev, ...),
>   TP_STRUCT__ENTRY(
>           __string(dev_name, dev_name(dev))
>           ...
>   ).
>   ...

This is a great idea, will do. Any specific reason to pass the
device in the tracepoint rather than a const char*?

> 
> This will help differentiate the device it is originating from in
> a multi GPU situation.

I'll try not to get too excited at the prospect of systems using
multiple Mali GPUs because I know the likeliest case this happens
on is Arm evaluation systems with a hard IP and a soft IP loaded to
the FPGA core. :)

Kind regards,
Nicolas Frattaroli

> 
> Kind regards,
> Karunika
> 
> > +	TP_ARGS(shader_bitmap, tiler_bitmap, l2_bitmap),
> > +	TP_STRUCT__entry(
> > +		__field(u64, shader_bitmap)
> > +		__field(u64, tiler_bitmap)
> > +		__field(u64, l2_bitmap)
> > +	),
> > +	TP_fast_assign(
> > +		__entry->shader_bitmap	= shader_bitmap;
> > +		__entry->tiler_bitmap	= tiler_bitmap;
> > +		__entry->l2_bitmap	= l2_bitmap;
> > +	),
> > +	TP_printk("shader_bitmap=0x%llx tiler_bitmap=0x%llx l2_bitmap=0x%llx",
> > +		  __entry->shader_bitmap, __entry->tiler_bitmap, __entry->l2_bitmap
> > +	)
> > +);
> > +
> > +#endif /* __PANTHOR_TRACE_H__ */
> > +
> > +#undef TRACE_INCLUDE_PATH
> > +#define TRACE_INCLUDE_PATH .
> > +#undef TRACE_INCLUDE_FILE
> > +#define TRACE_INCLUDE_FILE panthor_trace
> > +
> > +#include <trace/define_trace.h>
> > 
> 
> 
> 




