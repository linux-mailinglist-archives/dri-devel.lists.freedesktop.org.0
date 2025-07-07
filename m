Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B8FAFBB07
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 20:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0797610E29F;
	Mon,  7 Jul 2025 18:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cfNPh7c9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6954B10E0F4;
 Mon,  7 Jul 2025 18:44:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 22EB1A542A3;
 Mon,  7 Jul 2025 18:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC67C4CEF8;
 Mon,  7 Jul 2025 18:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751913895;
 bh=IEs4sSynAoScWDVRSCa0ozaZpBNNh2MVii6T5gbzRTk=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=cfNPh7c9YgEHCn2RNd3HvFOYnaxMXXqwoTkbnAJn2FrL5v4RnpLcP8Itb6ghE2DE5
 57lZEWlCnDngTsy4sM97ghVKBgcRKosVRrAg60UE5KQ0iZfzg2GENU7/bRYicgOQV3
 SCJFHJY+qYyRmO6xKJPxLBLZTxnxucTEVPCsb2BwtDPOBPz8TeydcRAjWdMtk8rQLr
 QWzSqoSvNMSdymEiEuei7PJtUTcuL3M9VReqmrQs+ZHmYM2xhNLB5DmLY2hyEopvWQ
 A+ox+XQqcJK5xp/91eTFzcIr9hEA0ml0TvMrY1T8tKlWVOtvkDD67Jh4AVm8Bvf8PO
 zvEliEp+cqPew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 20:44:49 +0200
Message-Id: <DB61N61AKIJ3.FG7GUJBG386P@kernel.org>
Subject: Re: [PATCH v4 3/7] drm/gpuvm: Pass map arguments through a struct
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank
 Binns" <frank.binns@imgtec.com>, "Matt Coster" <matt.coster@imgtec.com>,
 "Karol Herbst" <kherbst@redhat.com>, "Lyude Paul" <lyude@redhat.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>, "Steven Price"
 <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <asahi@lists.linux.dev>, "Asahi Lina"
 <lina@asahilina.net>
To: "Caterina Shablia" <caterina.shablia@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <20250707170442.1437009-4-caterina.shablia@collabora.com>
In-Reply-To: <20250707170442.1437009-4-caterina.shablia@collabora.com>
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

On Mon Jul 7, 2025 at 7:04 PM CEST, Caterina Shablia wrote:
> +/**
> + * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_ops_=
create]()
> + */
> +struct drm_gpuvm_map_req {
> +	/** @va: virtual address related fields */
> +	struct {
> +		/** @va.addr: start of the virtual address range to map to */
> +		u64 addr;
> +
> +		/** @va.size: size of the virtual address range to map to */
> +		u64 range;
> +	} va;
> +
> +	/** @gem: GEM related fields */
> +	struct {
> +		/**
> +		 * @obj: GEM object to map.
> +		 *
> +		 * Can be NULL if the virtual range is not backed by a GEM object.
> +		 */
> +		struct drm_gem_object *obj;
> +
> +		/** @offset: offset in the GEM */
> +		u64 offset;
> +	} gem;
> +};

Can't we just use struct drm_gpuva_op_map instead? The structure is identic=
al
and represents exactly what we want, a map operation.

Let's use that instead of redefining an identical structure.

With that,

	Acked-by: Danilo Krummrich <dakr@kernel.org>
