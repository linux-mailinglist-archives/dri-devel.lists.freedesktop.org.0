Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DD81CAC3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 14:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D5310E10D;
	Fri, 22 Dec 2023 13:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC2910E104;
 Fri, 22 Dec 2023 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703251880; x=1734787880;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:from:cc:subject:to:message-id:date;
 bh=kfKcN7DcapWC6nIpbzL3rIBeZ1SlfO0Rfz0SixMUtBw=;
 b=CNUPNJDNMWe5f+mzOJ1Y/ISMkcSiS9mPSAGPb1o3r/f/uRir6Lm8Fo4w
 XVXbXcocTN5ZxxAvh+/v57HcTHygCv9Smo6B5l02FV/8MMrizUf+KMN3t
 tqh+cze++3zH2BDjwuka08QhGvp0naD7HpGNTgz5Lmun8mJuwaVyqJtfB
 HkKY+u2gMkcQSCXzmRQfWII2UCE00ujJ5xciI4Y3visEW7CQuo9mu9puc
 XCAFsARYk9yElCvdcwpTIfgfpKgiUxG+2HjYZE2a66IoXS/44oYAaNZx3
 7A1v6YUy2tdbXAs4ToLGuLQSJUCGKzivWWuszgmKMgVynxAwaNmw7Kf9S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="381098344"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="381098344"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 05:31:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="18717612"
Received: from monicade-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.12.58])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 05:31:18 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231221170825.356970-2-andi.shyti@linux.intel.com>
References: <20231221170825.356970-1-andi.shyti@linux.intel.com>
 <20231221170825.356970-2-andi.shyti@linux.intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/i915/gt: Support fixed CCS mode
To: Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <170325187487.40079.14463953486335186680@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Fri, 22 Dec 2023 15:31:14 +0200
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
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Andi Shyti (2023-12-21 19:08:22)
> The CCS mode involves assigning CCS engines to slices depending
> on the number of slices and the number of engines the user wishes
> to set.
>=20
> In this patch, the default CCS setting is established during the
> initial GT settings. It involves assigning only one CCS to all
> the slices.
>=20
> Based on a patch by Chris Wilson <chris.p.wilson@linux.intel.com>
> and Tejas Upadhyay <tejas.upadhyay@intel.com>.
>=20
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>

<SNIP>

> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -207,6 +207,26 @@ struct intel_gt {
>                                             [MAX_ENGINE_INSTANCE + 1];
>         enum intel_submission_method submission_method;
> =20
> +       /*
> +        * Track fixed mapping between CCS engines and compute slices.
> +        *
> +        * In order to w/a HW that has the inability to dynamically load
> +        * balance between CCS engines and EU in the compute slices, we h=
ave to
> +        * reconfigure a static mapping on the fly. We track the current =
CCS
> +        * configuration (determined by inspection of the user's engine
> +        * selection during execbuf) and compare it against the current
> +        * CCS_MODE (which maps CCS engines to compute slices).  If there=
 is
> +        * only a single engine selected, we can map it to all available
> +        * compute slices for maximal single task performance (fast/narro=
w). If
> +        * there are more then one engine selected, we have to reduce the
> +        * number of slices allocated to each engine (wide/slow), fairly
> +        * distributing the EU between the equivalent engines.
> +        */

This comment is outdated as we don't consider execbuf but the sysfs
configuration.

Regards, Joonas

> +       struct {
> +               struct mutex mutex;
> +               u32 mode;
> +       } ccs;
> +
>         /*
>          * Default address space (either GGTT or ppGTT depending on arch).
>          *
