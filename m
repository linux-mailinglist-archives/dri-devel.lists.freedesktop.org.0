Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFF6B7E766
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FA310E653;
	Wed, 17 Sep 2025 10:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zi8IElgX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C2710E653
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758104550; x=1789640550;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:to:date:message-id;
 bh=ay3PFbZZ27790jMyb89EhK9xTl69Rab8VGpRvpMbTz8=;
 b=Zi8IElgXe5lQ61uMQjZbETZAaTALr2rMCJW77zIlcSBYYW6c8H3fqwV7
 ySeef9DYpFIHoJzLgyz2A0Ks80nIJU55cbzXWbMVsFYFkeEcAcjrP/4Sw
 HDtT4bNYMm6N3YUoFVHdfWx59IOvmhAZcGI5JHXCk5BL8FGHPmbtPGO+T
 huoLNr8/0SojNwfj+ABFcUcbUv5kxnwyC94JYhd55MRIfUspzZC+DaTKE
 nyHTl9AiR9i/6T3ElM68qw17ggJAJ5ed/8MudUV2l9J+ulu4CHnhgVJYL
 hme0FscBIhTFBNxXPazJuUoCa9utNKZBavcn30K+sEU1e4VXLQOt8FdEV w==;
X-CSE-ConnectionGUID: VMagR9jXSfe8bHYD/jBWjg==
X-CSE-MsgGUID: 8770F6K7SSCPYpMwPcxvyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71828530"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="71828530"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 03:22:29 -0700
X-CSE-ConnectionGUID: LDKjugivQdyjuQGx+57C+g==
X-CSE-MsgGUID: uMluRhDeSaOG+YgwjYbL5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="179207964"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.20])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 03:22:27 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <201ca522-a719-44af-950b-50c82758a3c0@amd.com>
References: <20250909144311.1927-1-christian.koenig@amd.com>
 <60ec3476-d141-4900-b87c-5135da6cfdd6@amd.com>
 <76698330f118d2747becab6615f4bfb5caf9e094.camel@linux.intel.com>
 <201ca522-a719-44af-950b-50c82758a3c0@amd.com>
Subject: Re: [PATCH] drm/ttm: rename ttm_bo_put to _fini v3
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 matthew.brost@intel.com
Date: Wed, 17 Sep 2025 13:22:23 +0300
Message-ID: <175810454351.27873.16918913539491692530@jlahtine-mobl>
User-Agent: alot/0.12.dev7+g16b50e5f
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

Quoting Christian K=C3=B6nig (2025-09-16 16:38:18)
> On 11.09.25 19:20, Thomas Hellstr=C3=B6m wrote:
> > Hi, Christian,
> >=20
> > On Thu, 2025-09-11 at 12:56 +0200, Christian K=C3=B6nig wrote:
> >> Gentle ping. Thomas can I get an ack on this?
> >>
> >=20
> > Sorry for the delay. When I initially saw it i decide to give it some
> > time for CI but now I can't find it there.
> >=20
> > Anyway, for the xe driver
> > Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >=20
> > The i915 driver maintainers probably want to ack this separately for
> > the i915 driver.
>=20
> @People on CC can I get an ack to merge this through drm-misc-next?

Sure,

Acked-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

Regards, Joonas
