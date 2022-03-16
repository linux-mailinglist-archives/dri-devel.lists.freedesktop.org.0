Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B970C4DAEE9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 12:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD3010E5F2;
	Wed, 16 Mar 2022 11:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E80310E5F2;
 Wed, 16 Mar 2022 11:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647430229; x=1678966229;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:to:message-id:date;
 bh=Adp9w9b76Ii+ehALuXwcmGFCRsSseMApnQaZH6ib+K0=;
 b=RjpD69PReO6kqmQ+hnQl7elYzG5J9dCJyq5Kt4pJ1nCtW3NqtvSJR5+/
 G5AkauxpR+KIYoFXoWy1Uu/nvDzsUE3bYKThimOCJvzmCeyFzuSznawvu
 /cF9pN2sZgTgfkcIRPkk6+LC/EtKW4AV3MuKg2blrOIKNDHC5GNMhfqVQ
 Y7krWkV4dxyukWAn/wmF2gkBwSmkKvi5JjHtihNulTPSmWBx52mKWAXTG
 RuagQ548GuZ8RJWuFBfPRc3zZ/fL8PtQiBIsSzp23Wr/M6KoWUiR+GHG9
 fvq64SzsMJIwfy6nUyNFlTCeBRqJxG5U9Ggb0p4mvDv+wmUZfOlOzPEvt Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="237162397"
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; d="scan'208";a="237162397"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 04:30:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; d="scan'208";a="557395758"
Received: from kuczynsk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.218])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 04:30:26 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <025a284f-a1fc-3f7a-12eb-d5a4029e3393@linux.intel.com>
References: <20220310051853.30440-1-matthew.s.atwood@intel.com>
 <16c7053b-1773-f1d8-ae7d-904d418b869b@linux.intel.com>
 <20220312041624.GA18367@msatwood-mobl>
 <025a284f-a1fc-3f7a-12eb-d5a4029e3393@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/uapi: Add
 DRM_I915_QUERY_GEOMETRY_SUBSLICES
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <164743022445.17926.1196760616425825011@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 16 Mar 2022 13:30:24 +0200
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

Quoting Tvrtko Ursulin (2022-03-14 17:35:17)
>=20
> On 12/03/2022 04:16, Matt Atwood wrote:
> > On Thu, Mar 10, 2022 at 12:26:12PM +0000, Tvrtko Ursulin wrote:
> >>
> >> On 10/03/2022 05:18, Matt Atwood wrote:
> >>> Newer platforms have DSS that aren't necessarily available for both
> >>> geometry and compute, two queries will need to exist. This introduces
> >>> the first, when passing a valid engine class and engine instance in t=
he
> >>> flags returns a topology describing geometry.
> >>>
> >>> v2: fix white space errors
> >>>
> >>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> >>> Cc: Matt Roper <matthew.d.roper@intel.com>
> >>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >>> UMD (mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests=
/14143
> >>> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>

<SNIP>

> >>> @@ -2714,6 +2715,9 @@ struct drm_i915_query_item {
> >>>      *      - DRM_I915_QUERY_PERF_CONFIG_LIST
> >>>      *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> >>>      *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
> >>> +    *
> >>> +    * When query_id =3D=3D DRM_I915_QUERY_GEOMETRY_SUBSLICES must ha=
ve bits 0:7 set
> >>> +    * as a valid engine class, and bits 8:15 must have a valid engin=
e instance.
> >>
> >> Alternatively, all other uapi uses struct i915_engine_class_instance to
> >> address engines which uses u16:u16.
> >>
> >> How ugly it is to stuff a struct into u32 flags is the question... But=
 you
> >> could at least use u16:u16 for consistency. Unless you wanted to leave=
 some
> >> bits free for the future?
> > Originally when I wrote this I was wanting to leave space in case it was
> > ever needed. I'm not particularly for or against keeping the space now.
>=20
> Yes, shrug... Neither I can't guess if we are ever likely to hit a=20
> problem by having fewer bits for class:instance here compared to other=20
> uapi, or if stuffing struct i915_engine_class_instance into flags would=20
> just be too ugly. I mean there is option to define a new struct and not=20
> use flags at all but that's probably to complicated for what it is.
>=20
> Anyone else with an opinion? Consistency or should be fine even like it i=
s?

Stuffing a full i915_engine_class_instance was definitely intended when
putting it into the flags was suggested.

If that is hit with a complication, the next proposed alternative was a
new struct. That's why the query interface was made easily extensible,
after all...

Regards, Joonas
