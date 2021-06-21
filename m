Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CD33AEBD0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 16:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7BF6E1A4;
	Mon, 21 Jun 2021 14:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408F06E1A4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:55:28 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DBB841F41CB7;
 Mon, 21 Jun 2021 15:55:26 +0100 (BST)
Date: Mon, 21 Jun 2021 16:55:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 04/12] drm/panfrost: Expose exception types to userspace
Message-ID: <20210621165524.57f10780@collabora.com>
In-Reply-To: <76fe9527-fecd-2271-02a6-60c9b99ab4c2@arm.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
 <20210621133907.1683899-5-boris.brezillon@collabora.com>
 <76fe9527-fecd-2271-02a6-60c9b99ab4c2@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Jun 2021 15:49:14 +0100
Steven Price <steven.price@arm.com> wrote:

> On 21/06/2021 14:38, Boris Brezillon wrote:
> > Job headers contain an exception type field which might be read and
> > converted to a human readable string by tracing tools. Let's expose
> > the exception type as an enum so we share the same definition.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  include/uapi/drm/panfrost_drm.h | 65 +++++++++++++++++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> > 
> > diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> > index 061e700dd06c..9a05d57d0118 100644
> > --- a/include/uapi/drm/panfrost_drm.h
> > +++ b/include/uapi/drm/panfrost_drm.h
> > @@ -224,6 +224,71 @@ struct drm_panfrost_madvise {
> >  	__u32 retained;       /* out, whether backing store still exists */
> >  };
> >  
> > +/* The exception types */
> > +
> > +enum drm_panfrost_exception_type {
> > +	DRM_PANFROST_EXCEPTION_OK = 0x00,
> > +	DRM_PANFROST_EXCEPTION_DONE = 0x01,  
> 
> Any reason to miss INTERRUPTED? Although I don't think you'll ever see it.

Oops, that one is marked 'reserved' on Bifrost. I'll add it.

> 
> > +	DRM_PANFROST_EXCEPTION_STOPPED = 0x03,
> > +	DRM_PANFROST_EXCEPTION_TERMINATED = 0x04,
> > +	DRM_PANFROST_EXCEPTION_KABOOM = 0x05,
> > +	DRM_PANFROST_EXCEPTION_EUREKA = 0x06,  
> 
> Interestingly KABOOM/EUREKA are missing from panfrost_exception_name()

Addressed in patch 8.

> 
> > +	DRM_PANFROST_EXCEPTION_ACTIVE = 0x08,
> > +	DRM_PANFROST_EXCEPTION_JOB_CONFIG_FAULT = 0x40,
> > +	DRM_PANFROST_EXCEPTION_JOB_POWER_FAULT = 0x41,
> > +	DRM_PANFROST_EXCEPTION_JOB_READ_FAULT = 0x42,
> > +	DRM_PANFROST_EXCEPTION_JOB_WRITE_FAULT = 0x43,
> > +	DRM_PANFROST_EXCEPTION_JOB_AFFINITY_FAULT = 0x44,
> > +	DRM_PANFROST_EXCEPTION_JOB_BUS_FAULT = 0x48,
> > +	DRM_PANFROST_EXCEPTION_INSTR_INVALID_PC = 0x50,
> > +	DRM_PANFROST_EXCEPTION_INSTR_INVALID_ENC = 0x51,  
> 
> 0x52: INSTR_TYPE_MISMATCH
> 0x53: INSTR_OPERAND_FAULT
> 0x54: INSTR_TLS_FAULT
> 
> > +	DRM_PANFROST_EXCEPTION_INSTR_BARRIER_FAULT = 0x55,  
> 
> 0x56: INSTR_ALIGN_FAULT
> 
> By the looks of it this is probably the Bifrost list and missing those
> codes which are Midgard only, whereas panfrost_exception_name() looks
> like it's missing some Bifrost status codes.

Yep, I'll add the missing ones.

> 
> Given this is UAPI there is some argument for missing e.g. INTERRUPTED
> (I'm not sure it was ever actually implemented in hardware and the term
> INTERRUPTED might be reused in future), but it seems a bit wrong just to
> have Bifrost values here.

Definitely, I just didn't notice Midgard and Bifrost had different set
of exceptions.

> 
> Steve
> 
> > +	DRM_PANFROST_EXCEPTION_DATA_INVALID_FAULT = 0x58,
> > +	DRM_PANFROST_EXCEPTION_TILE_RANGE_FAULT = 0x59,
> > +	DRM_PANFROST_EXCEPTION_ADDR_RANGE_FAULT = 0x5a,
> > +	DRM_PANFROST_EXCEPTION_IMPRECISE_FAULT = 0x5b,
> > +	DRM_PANFROST_EXCEPTION_OOM = 0x60,
> > +	DRM_PANFROST_EXCEPTION_UNKNOWN = 0x7f,
> > +	DRM_PANFROST_EXCEPTION_DELAYED_BUS_FAULT = 0x80,
> > +	DRM_PANFROST_EXCEPTION_GPU_SHAREABILITY_FAULT = 0x88,
> > +	DRM_PANFROST_EXCEPTION_SYS_SHAREABILITY_FAULT = 0x89,
> > +	DRM_PANFROST_EXCEPTION_GPU_CACHEABILITY_FAULT = 0x8a,
> > +	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_0 = 0xc0,
> > +	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_1 = 0xc1,
> > +	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_2 = 0xc2,
> > +	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_3 = 0xc3,
> > +	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_4 = 0xc4,
> > +	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_IDENTITY = 0xc7,
> > +	DRM_PANFROST_EXCEPTION_PERM_FAULT_0 = 0xc8,
> > +	DRM_PANFROST_EXCEPTION_PERM_FAULT_1 = 0xc9,
> > +	DRM_PANFROST_EXCEPTION_PERM_FAULT_2 = 0xca,
> > +	DRM_PANFROST_EXCEPTION_PERM_FAULT_3 = 0xcb,
> > +	DRM_PANFROST_EXCEPTION_TRANSTAB_BUS_FAULT_0 = 0xd0,
> > +	DRM_PANFROST_EXCEPTION_TRANSTAB_BUS_FAULT_1 = 0xd1,
> > +	DRM_PANFROST_EXCEPTION_TRANSTAB_BUS_FAULT_2 = 0xd2,
> > +	DRM_PANFROST_EXCEPTION_TRANSTAB_BUS_FAULT_3 = 0xd3,
> > +	DRM_PANFROST_EXCEPTION_ACCESS_FLAG_0 = 0xd8,
> > +	DRM_PANFROST_EXCEPTION_ACCESS_FLAG_1 = 0xd9,
> > +	DRM_PANFROST_EXCEPTION_ACCESS_FLAG_2 = 0xda,
> > +	DRM_PANFROST_EXCEPTION_ACCESS_FLAG_3 = 0xdb,
> > +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_IN0 = 0xe0,
> > +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_IN1 = 0xe1,
> > +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_IN2 = 0xe2,
> > +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_IN3 = 0xe3,
> > +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_OUT0 = 0xe4,
> > +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_OUT1 = 0xe5,
> > +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_OUT2 = 0xe6,
> > +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_OUT3 = 0xe7,
> > +	DRM_PANFROST_EXCEPTION_MEM_ATTR_FAULT_0 = 0xe8,
> > +	DRM_PANFROST_EXCEPTION_MEM_ATTR_FAULT_1 = 0xe9,
> > +	DRM_PANFROST_EXCEPTION_MEM_ATTR_FAULT_2 = 0xea,
> > +	DRM_PANFROST_EXCEPTION_MEM_ATTR_FAULT_3 = 0xeb,
> > +	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_0 = 0xec,
> > +	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_1 = 0xed,
> > +	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_2 = 0xee,
> > +	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_3 = 0xef,
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> >   
> 

