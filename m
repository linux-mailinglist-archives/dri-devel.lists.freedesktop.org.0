Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B8BB2FDFC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 17:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556EE10E9DA;
	Thu, 21 Aug 2025 15:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pgMcV0Sa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C964910E9C3;
 Thu, 21 Aug 2025 15:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755789323;
 bh=Q6X/pDQCrW8V5E526AsgaNDv1ZMZazNafyiDPfLqCnw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pgMcV0Sawp8POxaZoCb/t4273+4RBY2gGdJer9gi1oNiZLgBjvP7OmkHEO9yrMtZ2
 brBsWuS5D7QXgL5DJniS1Esdwy1J+Yb63NgqFOSPsIxBSefgWziipwR7/TJjccop0N
 3DUJoQ4yA6uC0w6MVseX7TV6pLv0ZMZYyxbaIGKKG1715Fjq+BCRb3aInTS/GiZMOd
 H8N6BvdJSRkBZ7fJDdzTyg1qlkuedTsk7VE6F1w1Ol4DQIDY1xj1wOs1JAz43zCEFW
 uZp+TbzagsgmorkwdSxd2FonOnPuxTVcNILzj4DI/HvsMlhhO11I9p04QHkeopX8s0
 r8j6bQHXJDGuw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DB2517E01F5;
 Thu, 21 Aug 2025 17:15:22 +0200 (CEST)
Date: Thu, 21 Aug 2025 17:15:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Caterina Shablia <caterina.shablia@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, asahi@lists.linux.dev, Asahi Lina
 <lina@asahilina.net>
Subject: Re: [PATCH v4 1/7] drm/panthor: Add support for atomic page table
 updates
Message-ID: <20250821171519.7224f470@fedora>
In-Reply-To: <9445754d-28d2-4c95-a2f8-b850032b99d1@arm.com>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <d4a6208b-a4a4-451f-9799-7b9f5fb20c37@arm.com>
 <2813151.QOukoFCf94@xps> <2434159.cojqenx9y0@xps>
 <0108b3cd-dfdd-4e4c-a2d8-157458e26f77@arm.com>
 <20250821135127.2827abfb@fedora>
 <9445754d-28d2-4c95-a2f8-b850032b99d1@arm.com>
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

On Thu, 21 Aug 2025 16:02:09 +0100
Steven Price <steven.price@arm.com> wrote:

> On 21/08/2025 12:51, Boris Brezillon wrote:
> > On Wed, 16 Jul 2025 16:43:24 +0100
> > Steven Price <steven.price@arm.com> wrote:  
> [...]
> >> Although in general I'm a bit wary of relying on the whole lock region
> >> feature - previous GPUs have an errata. But maybe I'm being over
> >> cautious there.  
> > 
> > We're heavily relying on it already to allow updates of the VM while
> > the GPU is executing stuff. If that's problematic on v10+, I'd rather
> > know early :D.  
> 
> I think I'm just scarred by my experiences over a decade ago... ;)
> 
> I'm not aware of any issues with the modern[1] GPUs. The issue used to
> be that the lock region could get accidentally unlocked by a cache flush
> from another source - specifically the cache flush on job start flag.
> 
> It's also not a major issue if you keep the page tables consistent, the
> lock region in theory allows a region to be in an inconsistent state -
> but generally there's no need for that. AFAIK we mostly keep the tables
> consistent anyway.

Right, it's not a problem until we introduce sparse binding support, at
which point atomicity becomes important, and given remapping is not a
thing the io-pagetable layer provides (remap has to be unmap+map), I
need to rely on region locking to make it work, or we'll have to eat the
fault-but-not-really-because-its-being-remapped overhead/complexity.
Honestly, I'd rather rely on region locking if it's working, because
it's far simpler ;-).
