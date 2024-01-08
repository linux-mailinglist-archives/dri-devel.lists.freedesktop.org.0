Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B3A827273
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 16:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AED10E11D;
	Mon,  8 Jan 2024 15:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC0810E11D;
 Mon,  8 Jan 2024 15:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704726786; x=1736262786;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:from:to:subject:cc:message-id:date;
 bh=GIBzYyQbp8IoOguC+xTcrIimi48jpCm5JMA61zYFVCk=;
 b=lSP5/l8jwJT9Uh+VC7ibR5kwoAWmlfpsI6XuoVAx7jocp9yL+PXajJYL
 UYolpXR04lWS+RDRrYiSwpURK9/Q7zSGLR+JDcj7wdYzPY3fG03FyU/PG
 0NQbue9OA+VrjSRPjDh+sjgdpslnYuFxvzumWDzPV+19lJkXIKjqlkqZM
 RnlPFLNFQ5e9p+mTY04vn/Lo8Igr2gS9B10ruY01Qib0bOHl9mZ17on5Y
 D6JvjWkx6+q2fH27uBPY1DKrinJaIRVROui7JRR8K4vnZBPbwVln3Frcw
 B2/AOukUW7gxSNFM8fKf2Ts0HfGtsWLKzoVwQq4SjE000jzg/gvDMpfdw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="395076097"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="395076097"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 07:13:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="781439953"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="781439953"
Received: from leim-mobl1.ccr.corp.intel.com (HELO localhost) ([10.246.33.45])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 07:13:03 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <73f0a8e9-3fd6-45a9-a084-b5308900ca8f@linux.intel.com>
References: <20240104143558.193694-1-andi.shyti@linux.intel.com>
 <20240104143558.193694-2-andi.shyti@linux.intel.com>
 <98e56d3e-ebf0-42b9-928b-0dcc4303658c@linux.intel.com>
 <ZZchsRQ5Kc-x9dlk@ashyti-mobl2.lan>
 <73f0a8e9-3fd6-45a9-a084-b5308900ca8f@linux.intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/i915/gt: Support fixed CCS mode
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <170472678023.31232.8020112065054338164@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 08 Jan 2024 17:13:00 +0200
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2024-01-05 12:39:31)
>=20
> On 04/01/2024 21:23, Andi Shyti wrote:

<SNIP>

> >>> +void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> >>> +{
> >>> +   mutex_lock(&gt->ccs.mutex);
> >>> +   __intel_gt_apply_ccs_mode(gt);
> >>> +   mutex_unlock(&gt->ccs.mutex);
> >>> +}
> >>> +
> >>> +void intel_gt_init_ccs_mode(struct intel_gt *gt)
> >>> +{
> >>> +   mutex_init(&gt->ccs.mutex);
> >>> +   gt->ccs.mode =3D 1;
> >>
> >> What is '1'? And this question carries over to the sysfs interface in =
the
> >> following patch - who will use it and where it is documented how to us=
e it?
> >=20
> > The value '1' is explained in the comment above[1] and in the
>=20
> Do you mean this is mode '1':
>=20
>   * With 1 engine (ccs0):
>   *   slice 0, 1, 2, 3: ccs0
>=20
> ?
>=20
> But I don't see where it says what do different modes mean on different=20
> SKU configurations.
>=20
> It also does not say what should the num_slices sysfs file be used for.
>=20
> Does "mode N" mean "assign each command streamer N compute slices"? Or=20
> "assign each compute slice N command streamers"?
>=20
> I wonder if we should add something user friendly into=20
> Documentation/ABI/*/sysfs-... Joonas your thoughts?

We definitely should always properly document all sysfs additions, just
seems like we less frequently remember to do so. So yeah, this should be
documented just like other uAPI.

I also like the idea of not exposing the the file at all if the value
can't be modified.

The ccs_mode is just supposed to allow user to select how many CCS
engines they want to expose, and always make an even split of slices
between them, nothing more nothing less.

Regards, Joonas
