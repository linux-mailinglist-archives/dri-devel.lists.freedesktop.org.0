Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6F9B2F729
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD5B10E949;
	Thu, 21 Aug 2025 11:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OtMwwDtm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC7F10E00B;
 Thu, 21 Aug 2025 11:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755777206;
 bh=gj8Ewp98g6KH3AuYkRIp4/z6BIYMV5RScmMuaTBfZz0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OtMwwDtmwa/O7ggrird2cGFI/hroLbmib4VzTSaghb7/uOklbpvCSFe9mZZoGodol
 7NYNjM26c0+wW/QA95kR/E6UCcsSpc5wcVo90h5eEXfV9nKxlSEyuarkJw+5jIEOU4
 ugO/IkuZjikRGQsSnH+MiASOer3itiHp2tsSVYiCWsjkZXTQd960IYyen1pEYg137H
 aBi9t7TDJUNqSHuPrhu0mIGBArA9MD1h7M79wC0HyvCkG2vjFu5bBxpuJEtIb1Mssd
 brpaYAQPly2x+LErjxR16y0mXIXd7rZG9nRoledFXM9guZnoyiZML7x1DidHwZjJ0Z
 VkBIHzzD9MLPA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8EBAB17E127B;
 Thu, 21 Aug 2025 13:53:25 +0200 (CEST)
Date: Thu, 21 Aug 2025 13:53:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Caterina Shablia" <caterina.shablia@collabora.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Binns"
 <frank.binns@imgtec.com>, "Matt Coster" <matt.coster@imgtec.com>, "Karol
 Herbst" <kherbst@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Steven
 Price" <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <asahi@lists.linux.dev>, "Asahi Lina"
 <lina@asahilina.net>
Subject: Re: [PATCH v4 3/7] drm/gpuvm: Pass map arguments through a struct
Message-ID: <20250821135320.670f2409@fedora>
In-Reply-To: <DB61N61AKIJ3.FG7GUJBG386P@kernel.org>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <20250707170442.1437009-4-caterina.shablia@collabora.com>
 <DB61N61AKIJ3.FG7GUJBG386P@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Mon, 07 Jul 2025 20:44:49 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Mon Jul 7, 2025 at 7:04 PM CEST, Caterina Shablia wrote:
> > +/**
> > + * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_ops_create]()
> > + */
> > +struct drm_gpuvm_map_req {
> > +	/** @va: virtual address related fields */
> > +	struct {
> > +		/** @va.addr: start of the virtual address range to map to */
> > +		u64 addr;
> > +
> > +		/** @va.size: size of the virtual address range to map to */
> > +		u64 range;
> > +	} va;
> > +
> > +	/** @gem: GEM related fields */
> > +	struct {
> > +		/**
> > +		 * @obj: GEM object to map.
> > +		 *
> > +		 * Can be NULL if the virtual range is not backed by a GEM object.
> > +		 */
> > +		struct drm_gem_object *obj;
> > +
> > +		/** @offset: offset in the GEM */
> > +		u64 offset;
> > +	} gem;
> > +};  
> 
> Can't we just use struct drm_gpuva_op_map instead? The structure is identical
> and represents exactly what we want, a map operation.

Sure, we can do that. The only reason I didn't is because I thought it
was preferable to distinguish a map request from the sub-operation it
might be split into (the latter being described by drm_gpuva_op_map).

> 
> Let's use that instead of redefining an identical structure.
> 
> With that,
> 
> 	Acked-by: Danilo Krummrich <dakr@kernel.org>

