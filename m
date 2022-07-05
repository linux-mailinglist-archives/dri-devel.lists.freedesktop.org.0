Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5256718B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 16:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2928113526;
	Tue,  5 Jul 2022 14:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F405F11349D;
 Tue,  5 Jul 2022 14:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657032704; x=1688568704;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+PpSVRj2jUt6eI/94GFPr4BZlJEnzrYHd2Zv7rgePWA=;
 b=Jq4LxY5TI5/Q1IWMPCs0TlZV8k2bXdq6E4AIJqzGQ3KjwkJCFDfO8F7r
 /vQ1+ItVuTIVDqxCJMdd0zrjY3y8IPeI/ZpokcjpkUJEohch50CbLoi6m
 RwvtBXNszLkmp8l31e55XGYNVFoa1ycFVaxRnfEHXMQqIJqpSKAdjgIAt
 spMFVb5Jbq2snq3CuZ7+GbkUGU2l+DCRlDVCIm1w5IwR7oJymXXFqiPkH
 XMdIE1CTcxqzBbkwsBwM8soUJjxXiisXYx1gycyvU8pN87xCn7nsKVWYi
 qlK5M74x8hfilmFa4Roib8NDB/xP17g1OVn4ebfNNK1tfuWYot3b92SXx A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="284485888"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="284485888"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 07:51:43 -0700
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="567643069"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.33.206])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 07:51:40 -0700
Date: Tue, 5 Jul 2022 16:51:37 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v2 7/7] drm/i915: Remove truncation warning for large
 objects
Message-ID: <20220705165137.09055506@maurocar-mobl2>
In-Reply-To: <20220705122455.3866745-8-gwan-gyeong.mun@intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
 <20220705122455.3866745-8-gwan-gyeong.mun@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, matthew.auld@intel.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  5 Jul 2022 15:24:55 +0300
Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:

> From: Chris Wilson <chris@chris-wilson.co.uk>
>=20
> Having addressed the issues surrounding incorrect types for local
> variables and potential integer truncation in using the scatterlist API,
> we have closed all the loop holes we had previously identified with
> dangerously large object creation. As such, we can eliminate the warning
> put in place to remind us to complete the review.
>=20
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Testcase: igt@gem_create@create-massive
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4991
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.h | 15 ---------------
>  1 file changed, 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index 31bb09dccf2f..4d614e4c1c4e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -20,25 +20,10 @@
> =20
>  enum intel_region_id;
> =20
> -/*
> - * XXX: There is a prevalence of the assumption that we fit the
> - * object's page count inside a 32bit _signed_ variable. Let's document
> - * this and catch if we ever need to fix it. In the meantime, if you do
> - * spot such a local variable, please consider fixing!
> - *
> - * We can check for invalidly typed locals with typecheck(), see for exa=
mple
> - * i915_gem_object_get_sg().
> - */
> -#define GEM_CHECK_SIZE_OVERFLOW(sz) \
> -	GEM_WARN_ON((sz) >> PAGE_SHIFT > INT_MAX)
> -
>  static inline bool i915_gem_object_size_2big(u64 size)
>  {
>  	struct drm_i915_gem_object *obj;
> =20
> -	if (GEM_CHECK_SIZE_OVERFLOW(size))
> -		return true;
> -
>  	if (overflows_type(size, obj->base.size))
>  		return true;
> =20
