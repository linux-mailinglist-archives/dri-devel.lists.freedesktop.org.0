Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BF4AF6DBB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 10:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C829F10E182;
	Thu,  3 Jul 2025 08:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oRCon1P0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A5610E182;
 Thu,  3 Jul 2025 08:54:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 657525C5B83;
 Thu,  3 Jul 2025 08:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22672C4CEE3;
 Thu,  3 Jul 2025 08:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751532874;
 bh=KKCoa8ZEKyAgTGtUdYcs/H499nZ8jzQ5MZpVycHoq9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oRCon1P09cbpMGzSi5vN/6yKXcDJES1dbP2AyN9ML4KEblruP/GOKEQJmSkKJ6YOK
 8FtIN2niRou7npVNXu/yx4U+QX4or212BR4I35776XFmECGisC0buj2T6l0c6Ush5e
 sBPpOfBskTMEhkRvasza6mRZtO/vWjtcM6Gh+4G4jGHm02FudT0NV0DKJ+dV9XZp8P
 MvegoHfRJHJ1ccz6DnWNce70OARatl2E4N7w4ZZmr6PUaCwdLbs1w1JT4jUZh3faoY
 z8LneOSGnJDpkDmX3V60pQ4ldpFK0rOHE3rtnS1vlchmmeCFYldh8P25axPl1XTiZD
 J6zoHCKrWu9Jw==
Date: Thu, 3 Jul 2025 10:54:27 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Caterina Shablia <caterina.shablia@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Lyude Paul <lyude@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 3/7] drm/gpuvm: Pass map arguments through a struct
Message-ID: <aGZFQxVqKak1V9xk@pollux>
References: <20250702233621.12990-1-caterina.shablia@collabora.com>
 <20250702233621.12990-4-caterina.shablia@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702233621.12990-4-caterina.shablia@collabora.com>
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

On Wed, Jul 02, 2025 at 11:36:05PM +0000, Caterina Shablia wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),
> so, before we do that, let's pass arguments through a struct instead
> of changing each call site every time a new optional argument is added.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>

Can you please copy me in on all GPUVM patches, not only this one?

I looked at this patch series on lore [1], but for some reason it only shows the
first 4 patches.

Can you please resend?

[1] https://lore.kernel.org/all/20250702233621.12990-5-caterina.shablia@collabora.com/#t
