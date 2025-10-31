Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B83FC24F84
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 13:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE2210EB10;
	Fri, 31 Oct 2025 12:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEfmMu91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4373110E2D1;
 Fri, 31 Oct 2025 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761913315; x=1793449315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wtXa5N8ELzd9patOCL0wnoDyTlyEA9GUSpL7zpvZcPU=;
 b=eEfmMu916W5Gs8DFg7N8O3AM0wpAFlLvLVwdt5cY/NmHu4Kus0q5WXLV
 hg5zHp32SvSRNTv7w/hT8gIXObYiY4gdhxUxTbhDTud9fEgR5Pm0k7TRe
 +D11Ojq8p3PZ3OBw6f4qP4N2RVWxcL6az716sm+DuDV5HWOXsGzrGx/p3
 S6lkLPn+g99H0iEWsaogFjMQdksQCB7FH+G2R/jGy1NGx3qPLGPHebWAw
 lSIC24h+ANk5VpCvmCnv2fEiwZyGUTS/XxFqJVlwcB+/1C3Wvl8YRMGiM
 /UoKPHL+TVo6FbkFHZfbEuvR+F+zEqGNtm5U9SnWbzR+Hrf5wdds1VDCt Q==;
X-CSE-ConnectionGUID: K4XTfsyrTP6uggMRbH0/RQ==
X-CSE-MsgGUID: Nl9pagI1RCKJcUPGmeew/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63093299"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="63093299"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:21:55 -0700
X-CSE-ConnectionGUID: qS+WLt2gRGOfZ800ME/xww==
X-CSE-MsgGUID: QJvRNelDQ0e2QnMaAgfB+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186341117"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.53])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:21:53 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: =?UTF-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] drm/i915/gem: Fix NULL pointer dereference in
 eb_release_vmas()
Date: Fri, 31 Oct 2025 13:21:50 +0100
Message-ID: <24137698.6Emhk5qWAg@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251031105259.72927-2-krzysztof.niemiec@intel.com>
References: <20251031105259.72927-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Krzysztof,

On Friday, 31 October 2025 11:53:00 CET Krzysztof Niemiec wrote:
> Set eb->vma[i+1].vma to NULL to prevent eb_release_vmas() from
> processing unitialized data, leading to a potential NULL dereference.

At a first glance, shouldn't we rather initialize the whole table memory=20
before using it?

Thanks,
Janusz

>=20
> During the execution of eb_lookup_vmas(), the eb->vma array is
> successively filled up with struct eb_vma objects. This process includes
> calling eb_add_vma(), which might fail; however, even in the event of
> failure, eb->vma[i].vma is set for the currently processes buffer.
>=20
> If eb_add_vma() fails, eb_lookup_vmas() returns with an error, which
> prompts a call to eb_release_vmas() to clean up the mess. Since
> eb_lookup_vmas() might fail during processing any (possibly not first)
> buffer, eb_release_vmas() checks whether a buffer's vma is NULL to know
> which one has failed first. The NULL is set if the vma cannot be set or
> is invalid in some way, but during and after the eb_add_vma() call, it
> is set to a valid pointer for the currently processed eb_vma.
>=20
> This means that during the check in eb_release_vmas(), the buffer that
> failed eb_add_vma() (say, eb->vma[i]) is processed (and rightfully so,
> since the vma associated with it still needs cleanup), but eb->vma[i+1]
> is left completely uninitialized (since the loop was broken prematurely
> after failing on eb_add_vma() for eb->vma[i]). Therefore
> eb->vma[i+1].vma has junk in it, and if that junk is not NULL, that vma
> will be processed by eb_release_vmas(), leading to memory corruption.
>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062
>=20
> Reported-by: =EA=B9=80=EA=B0=95=EB=AF=BC <km.kim1503@gmail.com>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
> index 39c7c32e1e74..0f8f02e22c03 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -960,18 +960,27 @@ static int eb_lookup_vmas(struct i915_execbuffer *e=
b)
>  		}
> =20
>  		err =3D eb_add_vma(eb, &current_batch, i, vma);
> -		if (err)
> +		if (err) {
> +			if (i + 1 < eb->buffer_count) {
> +				/*
> +				 * Execbuffer code expects last vma entry to be NULL,
> +				 * since we already initialized this entry,
> +				 * set the next value to NULL or we mess up
> +				 * cleanup handling.
> +				 */
> +				eb->vma[i + 1].vma =3D NULL;
> +			}
> +
>  			return err;
> +		}
> =20
>  		if (i915_gem_object_is_userptr(vma->obj)) {
>  			err =3D i915_gem_object_userptr_submit_init(vma->obj);
>  			if (err) {
>  				if (i + 1 < eb->buffer_count) {
>  					/*
> -					 * Execbuffer code expects last vma entry to be NULL,
> -					 * since we already initialized this entry,
> -					 * set the next value to NULL or we mess up
> -					 * cleanup handling.
> +					 * Set the next vma to null, for the same
> +					 * reason as above.
>  					 */
>  					eb->vma[i + 1].vma =3D NULL;
>  				}
>=20




