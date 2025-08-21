Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5BB2F7C9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C540010E963;
	Thu, 21 Aug 2025 12:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CndxvURl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805A110E305;
 Thu, 21 Aug 2025 12:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755778915;
 bh=uP1N1902khxh6xGxbKqeAltpkKMdvPiQyeNvSgMbdpg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CndxvURl8YRl4ufGEM+GjYWLpYiY8hZ4yNeYQxANE//lzFpjLeQ5xBGiG8px8nN/j
 f1Z3jVy2MRt/k+6O3ravflwR7nc/UWJRrl/Dr+i4+YUU32FLiKFnAbY7LM6w43OANL
 l0UW9s8IqcV7aHW6BxrqtfnOkCi7n2w5i58kK5gx8UxwoM5yGezybxh51r6Z32cu/v
 Cnc2Bp+sTTIpk2i592uNy2AMrdbiF9xfFNN/WdFySQ1cgGQqWJLtzeyUHHd/r4keq7
 CVbTEt+VPJjNWucyQ6MN6Rl0AZ0htZS1726XzxLERF5D2TJmrWUzZbM6Aghwf0IIkl
 4hvHtF7HUB7FQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 548D317E110D;
 Thu, 21 Aug 2025 14:21:54 +0200 (CEST)
Date: Thu, 21 Aug 2025 14:21:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Adrian Larumbe <adrian.larumbe@collabora.com>
Cc: Caterina Shablia <caterina.shablia@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v4 5/7] drm/gpuvm: Add a flags field to
 drm_gpuvm_map_req/drm_gpuva_op_map
Message-ID: <20250821142150.48250375@fedora>
In-Reply-To: <rquyd5sq4y6dhnnbqcmnorvhzvui6kbpysol6idinuwajlmawn@awv2uqosdacl>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <20250707170442.1437009-6-caterina.shablia@collabora.com>
 <rquyd5sq4y6dhnnbqcmnorvhzvui6kbpysol6idinuwajlmawn@awv2uqosdacl>
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

On Tue, 22 Jul 2025 20:21:25 +0100
Adrian Larumbe <adrian.larumbe@collabora.com> wrote:

> >  /**
> > @@ -1074,6 +1079,9 @@ struct drm_gpuvm_map_req {
> >  		/** @offset: offset in the GEM */
> >  		u64 offset;
> >  	} gem;
> > +
> > +	/** @flags: combination of DRM_GPUVA_ flags describing the mapping properties. */
> > +	enum drm_gpuva_flags flags;  
> 
> Wouldn't this be better expressed as a u32 combination of enum drm_gpuva_flags flags?
> Calling it 'flags' makes me feel like any OR'd combination of enum values would be possible.

I agree, but it's how other flags field are defined in gpuvm so I went
for the same definition to keep things consistent. Luckily (or
unfortunately, depending on where you place yourself), C is pretty lax
about what can be assigned to an enum type.
