Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDFA832C65
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 16:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F24410E9EE;
	Fri, 19 Jan 2024 15:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2215710E9EE;
 Fri, 19 Jan 2024 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705678378; x=1737214378;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=tiTCLZdE7/4H/DrlHiQr4Vw9YkS6KE2dSeru1JD0jCA=;
 b=You5Y24iE1o5mcNZQB8Sumlox0OQUMMELtHJcPie0U2/psg7IBxjqijY
 4dtFQazijyrZYfOz1wcXEOf6TXgE3tkWaKyMPeo/qzTbuqbV89ar/w91i
 lj+jOcWPHyLJq5Ykdn08IX3G8UPzcbE1gfDVj1hqqMoPC7E5lNRi1qz4+
 jNeelXzLLNk7Ynpv5ILoJxaQjOZ3dDZ40bQgNFE8OxzIIiI5hOzYlQvUz
 1C+iUa6+b0yayn0zSunGjFIGWbH+yl+Mmz2KNIFS0Zop3srKLCWbYmJsx
 CUT+rPP+xJafWfd2JkVtoGhygcUvB2q+5tuTTsTclP4eP1/CF68FA9691 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14290669"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="14290669"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 07:32:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="1116267651"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="1116267651"
Received: from vstill-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.223])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 07:32:55 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/exec, drm/gpuvm: Prefer u32 over uint32_t
In-Reply-To: <vmyrgwkw7zi5f234cfhl6mzkphrpmsxvb7rpruv7xbc5wjkx4d@jkxky5kmd5c2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240119090557.6360-1-thomas.hellstrom@linux.intel.com>
 <vmyrgwkw7zi5f234cfhl6mzkphrpmsxvb7rpruv7xbc5wjkx4d@jkxky5kmd5c2>
Date: Fri, 19 Jan 2024 17:32:52 +0200
Message-ID: <8734utpcd7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Fri, Jan 19, 2024 at 10:05:57AM +0100, Thomas Hellstr=C3=B6m wrote:
>>The relatively recently introduced drm/exec utility was using uint32_t
>>in its interface, which was then also carried over to drm/gpuvm.
>>
>>Prefer u32 in new code and update drm/exec and drm/gpuvm accordingly.
>>
>>Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>Cc: Danilo Krummrich <dakr@redhat.com>
>>Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>>---
>> drivers/gpu/drm/drm_exec.c | 2 +-
>> include/drm/drm_exec.h     | 4 ++--
>> include/drm/drm_gpuvm.h    | 2 +-
>> 3 files changed, 4 insertions(+), 4 deletions(-)
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> I was surprised we have quite a few places using the c99 types rather
> than kernel types.
>
> $ git grep -ce uint[0-9][0-9]_t drivers/gpu/drm/*.c
> drivers/gpu/drm/drm_atomic.c:1
> drivers/gpu/drm/drm_atomic_helper.c:7
> drivers/gpu/drm/drm_atomic_state_helper.c:1
> drivers/gpu/drm/drm_atomic_uapi.c:17
> drivers/gpu/drm/drm_color_mgmt.c:4
> drivers/gpu/drm/drm_connector.c:6
> drivers/gpu/drm/drm_crtc.c:3
> drivers/gpu/drm/drm_damage_helper.c:2
> drivers/gpu/drm/drm_debugfs_crc.c:1
> drivers/gpu/drm/drm_exec.c:1
> drivers/gpu/drm/drm_fb_helper.c:10
> drivers/gpu/drm/drm_format_helper.c:6
> drivers/gpu/drm/drm_fourcc.c:6
> drivers/gpu/drm/drm_framebuffer.c:5
> drivers/gpu/drm/drm_gem.c:1
> drivers/gpu/drm/drm_gem_dma_helper.c:1
> drivers/gpu/drm/drm_gem_shmem_helper.c:1
> drivers/gpu/drm/drm_gem_ttm_helper.c:1
> drivers/gpu/drm/drm_gem_vram_helper.c:5
> drivers/gpu/drm/drm_lease.c:6
> drivers/gpu/drm/drm_mipi_dbi.c:3
> drivers/gpu/drm/drm_mode_config.c:4
> drivers/gpu/drm/drm_mode_object.c:20
> drivers/gpu/drm/drm_modeset_helper.c:1
> drivers/gpu/drm/drm_modeset_lock.c:1
> drivers/gpu/drm/drm_of.c:3
> drivers/gpu/drm/drm_plane.c:35
> drivers/gpu/drm/drm_plane_helper.c:2
> drivers/gpu/drm/drm_prime.c:9
> drivers/gpu/drm/drm_probe_helper.c:3
> drivers/gpu/drm/drm_property.c:11
> drivers/gpu/drm/drm_simple_kms_helper.c:4
> drivers/gpu/drm/drm_syncobj.c:26
>
> but maybe not worth the churn for what is already there for a long time?

Personally, I think the one time churn is worth it to unify and keep the
codebase in kernel types only. This is basically what we did in i915
years ago, and new c99 types don't really even creep in because there
are zero examples around. It's natural to follow the style around you
instead of mixing.

BR,
Jani.


--=20
Jani Nikula, Intel
