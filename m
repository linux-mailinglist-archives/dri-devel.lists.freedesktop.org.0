Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B302BA2F424
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 17:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CD610E5C1;
	Mon, 10 Feb 2025 16:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="MOjZd7/I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA0810E5C1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 16:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1739206249;
 bh=D0YAwfECM7hsAaYa3THgFCmryazkCnO7IAFjqVzzPEQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MOjZd7/IHzjAFnKDqpP9JTGVsz74qR2RQALktwwQcDZPNDvSY3JIYzo3mGOpDS4At
 5mw7shGLL/rdhieR3Z1fDAJmkq+4tvAptUlP1wqabCmREaUexIKd5+e0/eC4EiNkDz
 mh7T1ob5CfXlLuD4fSK0Ctaq5dV/jCCq8SgE5vhw=
Date: Mon, 10 Feb 2025 17:50:48 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Qiang Yu <yuq825@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lima@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/5] drm: Constify 'struct bin_attribute'
Message-ID: <58d8838c-1b22-4d24-bdce-89cfa1ede1ed@t-8ch.de>
References: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
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

Hi,

On 2024-12-16 12:34:46+0100, Thomas Weißschuh wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.

Can anybody pick up these patches?
Except for lima they all have Acks.
In my opinion they should go through drm-misc.

Thanks,
Thomas

> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Thomas Weißschuh (5):
>       drm/sysfs: Constify 'struct bin_attribute'
>       drm/lima: Constify 'struct bin_attribute'
>       drm/i915: Constify 'struct bin_attribute'
>       drm/amdgpu: Constify 'struct bin_attribute'
>       drm/amd/display: Constify 'struct bin_attribute'
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c             |  6 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c                | 14 +++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c                | 13 ++++++-------
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  8 ++++----
>  drivers/gpu/drm/drm_sysfs.c                            | 10 +++++-----
>  drivers/gpu/drm/i915/i915_gpu_error.c                  |  8 ++++----
>  drivers/gpu/drm/i915/i915_sysfs.c                      | 12 ++++++------
>  drivers/gpu/drm/lima/lima_drv.c                        |  8 ++++----
>  8 files changed, 39 insertions(+), 40 deletions(-)
> ---
> base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
> change-id: 20241215-sysfs-const-bin_attr-drm-9bf7700da886
> 
> Best regards,
> -- 
> Thomas Weißschuh <linux@weissschuh.net>
> 
