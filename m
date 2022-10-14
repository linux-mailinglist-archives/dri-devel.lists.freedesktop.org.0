Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDE35FE966
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 09:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E116610E9C1;
	Fri, 14 Oct 2022 07:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6FD10E9C1;
 Fri, 14 Oct 2022 07:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665732061; x=1697268061;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=DhIOoQF13/vbJT1z/eaztGoo+tuUabLIcz/gKjxoCCk=;
 b=ENtBeXQl8Ub1I5JkYXyWVMU/wL0n++yFydZ03jxHam6EENtQm2xLftoh
 VmD0j6OsakTJrNDVskbw/SAaVbFNoEtG+iwDu3vkSihcVy9e8A8PXMq3G
 4uhDO8wEnfY4y7XOumPHTlaBa/88NLK5RakIA7GkLTTw7FJZoX/6yYeVR
 TAGDGZSi50JgTY7ncTXPNxG0uHdbwzoxOM9jwFzRStPxWOuTPUZuhz+SN
 3zgwLyVP4wHGdK9sjw8pSpIEA/yb+hMaCSH2QemmoczfMyCGr/yvfFGDf
 6//LaLIrs6fEcOXvJN31HblySz3+RTl5I/jCIzxTRme/JgKtX4ab/Ns/l Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="305295634"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="305295634"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 00:21:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="696207645"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="696207645"
Received: from juanandr-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.209.41.210])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 00:20:59 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221004114915.221708-2-matthew.auld@intel.com>
References: <20221004114915.221708-1-matthew.auld@intel.com>
 <20221004114915.221708-2-matthew.auld@intel.com>
Subject: Re: [PATCH v3 2/2] drm/i915/uapi: expose GTT alignment
From: Jordan Justen <jordan.l.justen@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 14 Oct 2022 00:20:52 -0700
Message-ID: <166573205234.1044993.5297661838478296333@jljusten-skl.local>
User-Agent: alot/0.10
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
Cc: Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Yang A Shi <yang.a.shi@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, dri-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Jordan Justen <jordan.l.justen@intel.com>

On 2022-10-04 04:49:15, Matthew Auld wrote:
> On some platforms we potentially have different alignment restrictions
> depending on the memory type. We also now have different alignment
> restrictions for the same region across different kernel versions.
> Extend the region query to return the minimum required GTT alignment.
>=20
> Testcase: igt@gem_create@create-ext-placement-alignment
> Testcase: igt@i915_query@query-regions-sanity-check
> Suggested-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Yang A Shi <yang.a.shi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_query.c |  1 +
>  include/uapi/drm/i915_drm.h       | 29 +++++++++++++++++++++++++++--
>  2 files changed, 28 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i91=
5_query.c
> index 6ec9c9fb7b0d..111377f210ed 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -498,6 +498,7 @@ static int query_memregion_info(struct drm_i915_priva=
te *i915,
>                 info.region.memory_class =3D mr->type;
>                 info.region.memory_instance =3D mr->instance;
>                 info.probed_size =3D mr->total;
> +               info.gtt_alignment =3D mr->min_page_size;
> =20
>                 if (mr->type =3D=3D INTEL_MEMORY_LOCAL)
>                         info.probed_cpu_visible_size =3D mr->io_size;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 08d69e36fb66..2e613109356b 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3346,8 +3346,33 @@ struct drm_i915_memory_region_info {
>         /** @region: The class:instance pair encoding */
>         struct drm_i915_gem_memory_class_instance region;
> =20
> -       /** @rsvd0: MBZ */
> -       __u32 rsvd0;
> +       union {
> +               /** @rsvd0: MBZ */
> +               __u32 rsvd0;
> +               /**
> +                * @gtt_alignment:
> +                *
> +                * The minimum required GTT alignment for this type of me=
mory.
> +                * When allocating a GTT address it must be aligned to th=
is
> +                * value or larger. On some platforms the kernel might op=
t to
> +                * using 64K pages for I915_MEMORY_CLASS_DEVICE, where 64=
K GTT
> +                * pages can then be used if we also use 64K GTT alignmen=
t.
> +                *
> +                * NOTE: If this is zero then this must be an older
> +                * kernel which lacks support for this field.
> +                *
> +                * Side note: For larger objects (especially for
> +                * I915_MEMORY_CLASS_DEVICE), like 2M+ in size, userspace=
 should
> +                * consider potentially bumping the GTT alignment to say =
2M,
> +                * which could potentially increase the likelihood of the=
 kernel
> +                * being able to utilise 2M GTT pages underneath, if the =
layout
> +                * of the physical pages allows it.  On some configuratio=
ns we
> +                * can then also use a more efficient page-table layout, =
if we
> +                * can't use the more desirable 2M GTT page, so long as w=
e know
> +                * that the entire page-table will be used by this object.
> +                */
> +               __u32 gtt_alignment;
> +       };
> =20
>         /**
>          * @probed_size: Memory probed by the driver
> --=20
> 2.37.3
>
