Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD686EE353
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 15:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF1310E2B4;
	Tue, 25 Apr 2023 13:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C434710E2C4;
 Tue, 25 Apr 2023 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682430125; x=1713966125;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:cc:to:subject:from:message-id:date;
 bh=Tj87/CbwXEIb9fRU10hsAP1unR5QKaQWkDyvu33wf7E=;
 b=RcrjKt6O3Ysdp9OGpDZhnhghq+7txU86axTyPvs18EtLEuE3zhhhcIUo
 nj186G7CUs5kkLbYQkTM8fHSFxvDfBQ3ledE1oA9Nir+84AUJ2yR1pz0v
 hV6ssi2wVkWbRxSjtPJ+Xkhu9vxgG9lU5TXT7FPCBlBNXUA1iUyPSwneS
 iDZGWiGN7+rEwU76S3jKJzfyjFrHLgEhYGX2B9jmhJy0hgjFfWNxQnh/8
 JlHTZdxzHDi5YQ22iwsEz9Ap8z9F7F59ZVUOj3sd31eW5yrhMIBIiRMc6
 RRoacSKM27GoOeC4hGSato79BGcKNoehupDIIR0RVkQbtv2GwoW1fdB1b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="344239900"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="344239900"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 06:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="1023140333"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="1023140333"
Received: from pkawa-mobl.ger.corp.intel.com (HELO localhost) ([10.252.16.73])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 06:41:57 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <168235638024.392286.14697291321034695564@jljusten-skl>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-9-fei.yang@intel.com>
 <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
 <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
 <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168211012988.392286.16107510619704913123@jljusten-skl>
 <BYAPR11MB2567F03AD43D7E2DE2628D5D9A669@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168232538771.392286.3227368099155268955@jljusten-skl>
 <5d0e2cf4-a487-1a1e-dae9-4fbe8c2fe649@linux.intel.com>
 <168235638024.392286.14697291321034695564@jljusten-skl>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Yang,
 Fei" <fei.yang@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: IOCTL feature detection (Was: Re: [Intel-gfx] [PATCH 8/8] drm/i915:
 Allow user to set cache at BO creation)
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <168243011485.13318.1376529380245430200@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Tue, 25 Apr 2023 16:41:54 +0300
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Intel-gfx@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(+ Faith and Daniel as they have been involved in previous discussions)

Quoting Jordan Justen (2023-04-24 20:13:00)
> On 2023-04-24 02:08:43, Tvrtko Ursulin wrote:
> >=20
> > Being able to "list" supported extensions sounds like a reasonable
> > principle, albeit a departure from the design direction to date.
> > Which means there are probably no quick solutions. Also, AFAIU, only
> > PXP context create is the problematic one, right? Everything else is
> > pretty much instant or delayed allocation so super cheap to probe by
> > attempting to use.
> >=20
> > If I got that right and given this series is about
> > drm_i915_gem_create_ext I don't think this side discussion should be
> > blocking it.
>=20
> This still leaves the issue of no reasonable detection mechanism for
> the extension.

I remember this exact discussion being repeated at least a few times in
the past 5 years. Previously the conclusion was always that detection by
trying to use the extension leads to least amount of uAPI surface. There
is also no concern of having mismatch in backporting of the query and the
functionality patches.

Why exactly do you think it is more reasonable to do the following?

check_if_extension_query_is_supported();
<check retval>
check_if_extension_xyz_is_supported();
<check retval>

VS

create_[context,buffer,whatever]_with_extension();
<check errno>
destroy_[context,buffer,whatever]();

For contexts and buffers there's no overhead, and we're keeping the uAPI
surface smaller (less bugs, less validation effort). Additionally we
support checking combinations of extensions A, B and C without extra
effort.

If we're not returning enough clear errnos, then that is something to
make sure we do.

Regards, Joonas

> If the discussion gets too complicated, then can we add
> a GET_PARAM for the SET_PAT extension? I'm hoping we could either come
> up with something better reasonably quickly, or i915/Xe can add a new
> param for each new extensions until a better approach is available.
>=20
> > Furthermore the PXP context create story is even more complicated,
> > in a way that it is not just about querying whether the extension is
> > supported, but the expensive check is something more complicated.
> >=20
> > Going back to implementation details for this proposed new feature,
> > one alternative to query could be something like:
> >=20
> >    drm_i915_gem_create_ext.flags |=3D I915_GEM_CREATE_EXT_FLAG_PROBE_EX=
TENSIONS;
> >=20
> > That would be somewhat more light weight to implement that the
> > i915_query route. And it appears it would work for all ioctls which
> > support extensions apart for i915_context_param_engines.
>=20
> This seems little better than the "try it, and if it works then it's
> supported".
>=20
> I'm not suggesting that userspace should be able to check that
> scenario x+y+z will work, but more a list of extensions that
> conceivably could work. Normally this should just a matter of the
> kernel unconditionally adding the newly implemented extension to the
> list returned in the query call.
>=20
> If a GET_PARAM can be made for the PXP case, then it seems like a
> query item returning CONTEXT_CREATE extensions could conditionally
> omit that extension just as easily as implementing the proposed new
> GET_PARAM.
>=20
> -Jordan
