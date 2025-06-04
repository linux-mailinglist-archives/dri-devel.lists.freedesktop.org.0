Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922EBACDE4C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 14:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE4F10E68F;
	Wed,  4 Jun 2025 12:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPHmtb7S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5474D10E68F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749041516; x=1780577516;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6DsbJp3huQy2CaTfbfR0iFAPFfUmFh8cI/ypYNf0QLM=;
 b=BPHmtb7Sar2stI48Cto7l7e13FLo5W3o5xqXPrYfUfrwY2KlfLFV70t7
 1zQxUJfHSkekmkBed89xFgmGUoyH5BFajR/wa1V0k7yfNuIOPZP22JjLD
 u1HfcKPNkj6+M+qApscDOUAgLGgeOEIemLl4AegKmiZlsJnOr48S5rf+8
 /x6OmfT+y1zEaE93UkY2NFBZkusqE33QKDhQEeS6FmeYMJO71vbx/gRfX
 HKxGpIXM0GxCAiAmAE6G/7G6z++JfBOv9dGNZl95M1QGY4RW7cE3Pju3C
 edHqb3bIrIoYqP2vdjysImrKS+ONsmC6h2Ti79uYxoKRtkTHguW2pMqZn A==;
X-CSE-ConnectionGUID: 0pUECXpoTSO6MiRuTH9KUw==
X-CSE-MsgGUID: 5o+5x7yvSyahDfdzBVEwbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51265017"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="51265017"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 05:51:56 -0700
X-CSE-ConnectionGUID: QffnyYzYSLeykVg1A7rVNQ==
X-CSE-MsgGUID: SnEBvwtpQSq+xiFL8jzcsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145140884"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.121])
 ([10.245.245.121])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 05:51:53 -0700
Message-ID: <6b3a37712330ec4b17968075f71296717db54046.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/ttm: Fix compile error when CONFIG_SHMEM is not set
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Matthew Wilcox	
 <willy@infradead.org>, linux-mm@kvack.org, Andrew Morton	
 <akpm@linux-foundation.org>, Christian Koenig <christian.koenig@amd.com>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost	 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Date: Wed, 04 Jun 2025 14:51:49 +0200
In-Reply-To: <20250604085121.324be8c1@gandalf.local.home>
References: <20250604085121.324be8c1@gandalf.local.home>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Wed, 2025-06-04 at 08:51 -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
>=20
> When CONFIG_SHMEM is not set, the following compiler error occurs:
>=20
> ld: vmlinux.o: in function `ttm_backup_backup_page':
> (.text+0x10363bc): undefined reference to `shmem_writeout'
> make[3]: ***
> [/work/build/trace/nobackup/linux.git/scripts/Makefile.vmlinux:91:
> vmlinux.unstripped] Error 1
> make[2]: *** [/work/build/trace/nobackup/linux.git/Makefile:1241:
> vmlinux] Error 2
> make[1]: *** [/work/build/trace/nobackup/linux.git/Makefile:248:
> __sub-make] Error 2
> make[1]: Leaving directory '/work/build/nobackup/tracetest'
> make: *** [Makefile:248: __sub-make] Error 2
>=20
> This is due to the replacement of writepage and calling
> swap_writeout()
> and shmem_writeout() directly. The issue is that when CONFIG_SHMEM is
> not
> defined, shmem_writeout() is also not defined.
>=20
> The function ttm_backup_backup_page() called mapping->a_ops-
> >writepage()
> which was then changed to call shmem_writeout() directly.
>=20
> Even before commit 84798514db50 ("mm: Remove swap_writepage() and
> shmem_writepage()"), it didn't make sense to call anything other than
> shmem_writeout() as the ttm_backup deals only with shmem folios.
>=20
> Have DRM_TTM config option select SHMEM to guarantee that
> shmem_writeout()
> is available.
>=20
> Link:
> https://lore.kernel.org/all/20250602170500.48713a2b@gandalf.local.home/
>=20
> Suggested-by: Hugh Dickins <hughd@google.com>
> Fixes: 84798514db50 ("mm: Remove swap_writepage() and
> shmem_writepage()")
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
> Changes since v1:
> https://lore.kernel.org/all/20250602170500.48713a2b@gandalf.local.home/
>=20
> - Instead of adding a shmem_writeout() stub, just make CONFIG_DRM_TTM
> =C2=A0 select CONFIG_SHMEM (Hugh Dickins)
>=20
> =C2=A0drivers/gpu/drm/Kconfig | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f094797f3b2b..ded28c71d89c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -188,6 +188,7 @@ source "drivers/gpu/drm/display/Kconfig"
> =C2=A0config DRM_TTM
> =C2=A0	tristate
> =C2=A0	depends on DRM && MMU
> +	select SHMEM
> =C2=A0	help
> =C2=A0	=C2=A0 GPU memory management subsystem for devices with multiple
> =C2=A0	=C2=A0 GPU memory types. Will be enabled automatically if a
> device driver

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Thanks,
Thomas


