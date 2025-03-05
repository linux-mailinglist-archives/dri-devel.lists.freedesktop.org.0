Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EA6A4FF35
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 13:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293F410E293;
	Wed,  5 Mar 2025 12:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gxtn+5Go";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC25210E293;
 Wed,  5 Mar 2025 12:59:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F8415C6771;
 Wed,  5 Mar 2025 12:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724A7C4CEE2;
 Wed,  5 Mar 2025 12:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1741179571;
 bh=ydjrl0nn4CMEHtCBM5l94ZW9OOFOLfL9ZmqhrjUkLU8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gxtn+5GoabVjRIFGeo6k90yuhftoXIsgh8485THT0klS3lm3MELFOiTyn9puOh/Hh
 oZhEMXf8RNe1BicDJVNZ806+RUl3367La3PehMzeDn7q7wdk/VJdt2EdP3GZAUvF0N
 y1xvdNowyOrM4+rj7hiRFtGWLOsVtFgATFEZV1qs=
Date: Wed, 5 Mar 2025 13:59:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: jianqi.ren.cn@windriver.com
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 alexander.deucher@amd.com, daniel.wheeler@amd.com,
 mario.limonciello@amd.com, josip.pavic@amd.com,
 aurabindo.pillai@amd.com, sohaib.nadeem@amd.com,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 wayne.lin@amd.com, sashal@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 charlene.liu@amd.com, gabe.teeger@amd.com,
 amd-gfx@lists.freedesktop.org, Nicholas.Kazlauskas@amd.com
Subject: Re: [PATCH 6.1.y] drm/amd/display: fixed integer types and null
 check locations
Message-ID: <2025030548-spinal-breezy-ef8e@gregkh>
References: <20250227032633.4176866-1-jianqi.ren.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227032633.4176866-1-jianqi.ren.cn@windriver.com>
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

On Thu, Feb 27, 2025 at 11:26:33AM +0800, jianqi.ren.cn@windriver.com wrote:
> From: Sohaib Nadeem <sohaib.nadeem@amd.com>
> 
> [ Upstream commit 0484e05d048b66d01d1f3c1d2306010bb57d8738 ]
> 
> [why]:
> issues fixed:
> - comparison with wider integer type in loop condition which can cause
> infinite loops
> - pointer dereference before null check
> 
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: stable@vger.kernel.org
> Reviewed-by: Josip Pavic <josip.pavic@amd.com>
> Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Signed-off-by: Sohaib Nadeem <sohaib.nadeem@amd.com>
> Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> [ To fix CVE-2024-26767, delete changes made in drivers/gpu/drm/amd/display/dc/link/link_validation.c
>  for this file is deleted in linux-6.1 ]

It's not that the file is deleted, it is just not present yet, as it had
not shown up in the tree.

I've manually edited this changelog, please be more careful next time.
Also, no need to mention a CVE id, they don't mean anything here :)

thanks,

greg k-h
