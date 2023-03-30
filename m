Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 792696D022A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785E610E1ED;
	Thu, 30 Mar 2023 10:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBFF10E1ED
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 10:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680173634; x=1711709634;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/a2NUyQvjACpQ05kbhWwDQBqs0dGUOck0k692foQm/k=;
 b=mAOz93YNKiWNJpOeAoU3WtcRSVfooLjSk2m7Pwjbxn8nYkq5etoK08K2
 8nTJrP5Ev+wzjP48UvVSnrkXMO+TODIoIzCNOFKZng+La1ADzoIgIxNrr
 M4F9wjLd8sV7C3/pZDtvGGCw38jBWeQnV52+T4mZDLHyWYQepLutxOgHo
 +vdgSJBJQuCxkkLzShVkVJ9mC/LiTlE6z3WovrnFwYCtmReUDjnyZK2aj
 m6Smhk2XY1rofY5jxg5FuilDr3K3hESmviWv4SNwq0g9GsdgaBrGtHPK/
 LDHNTVivEJn3iLBNX+N3UUptedGeWiTJzYof7pevht+pZvKmbvGg+pCNr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="329628470"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="329628470"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 03:53:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="1014392291"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="1014392291"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 03:53:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: David Gow <davidgow@google.com>, =?utf-8?Q?Lu=C3=ADs?= Mendes
 <luis.p.mendes@gmail.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Maarten
 Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mairacanal@riseup.net>, Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 1/2] drm: buddy_allocator: Fix buddy allocator init on
 32-bit systems
In-Reply-To: <20230329065532.2122295-1-davidgow@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230329065532.2122295-1-davidgow@google.com>
Date: Thu, 30 Mar 2023 13:53:47 +0300
Message-ID: <878rfe4iis.fsf@intel.com>
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
Cc: David Gow <davidgow@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Mar 2023, David Gow <davidgow@google.com> wrote:
> The drm buddy allocator tests were broken on 32-bit systems, as
> rounddown_pow_of_two() takes a long, and the buddy allocator handles
> 64-bit sizes even on 32-bit systems.
>
> This can be reproduced with the drm_buddy_allocator KUnit tests on i386:
> 	./tools/testing/kunit/kunit.py run --arch i386 \
> 	--kunitconfig ./drivers/gpu/drm/tests drm_buddy
>
> (It results in kernel BUG_ON() when too many blocks are created, due to
> the block size being too small.)
>
> This was independently uncovered (and fixed) by Lu=C3=ADs Mendes, whose p=
atch
> added a new u64 variant of rounddown_pow_of_two(). This version instead
> recalculates the size based on the order.
>
> Reported-by: Lu=C3=ADs Mendes <luis.p.mendes@gmail.com>
> Link: https://lore.kernel.org/lkml/CAEzXK1oghXAB_KpKpm=3D-CviDQbNaH0qfgYT=
SSjZgvvyj4U78AA@mail.gmail.com/T/
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>  drivers/gpu/drm/drm_buddy.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 3d1f50f481cf..7098f125b54a 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -146,8 +146,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u6=
4 chunk_size)
>  		unsigned int order;
>  		u64 root_size;
>=20=20
> -		root_size =3D rounddown_pow_of_two(size);
> -		order =3D ilog2(root_size) - ilog2(chunk_size);
> +		order =3D ilog2(size) - ilog2(chunk_size);
> +		root_size =3D chunk_size << order;

Just noticed near the beginning of the function there's also:

	if (!is_power_of_2(chunk_size))
		return -EINVAL;

which is also wrong for 32-bit.


BR,
Jani.


>=20=20
>  		root =3D drm_block_alloc(mm, NULL, order, offset);
>  		if (!root)

--=20
Jani Nikula, Intel Open Source Graphics Center
