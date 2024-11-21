Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50E49D507B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 17:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B6310E9C2;
	Thu, 21 Nov 2024 16:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0aV5HjJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC29F10E9BA;
 Thu, 21 Nov 2024 16:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732205296; x=1763741296;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IuNLOepcZzKBl1y1PZDmcoyW0nQNcEYdzLOths1U10U=;
 b=G0aV5HjJnwtU5ekNmdfp9IoTQS+j7+pkGJlPTte/+RSZj49CwCG40tX2
 4dvOQfdxpNVXUuMVNSYbFX8D5TpXBD57zwHuUwXgTHc9L/FTKcme6ZhN1
 d/+Le9AhPf/hyxeWvoyEnyjGN+lszcNWs5zY+SoFaLrGfLdWmrKCFAKz+
 JQmFcAq6syYZ7ADZDp+uxaEQU0qiqicfTn/zRugJJc/eZqFW1kIR55xtr
 TRbe2+yip+DYbYcIY/jKR3+TJhjx0xom4HfjPMoRO1ZgWFJuE5tKPhag3
 GcDSEa3Hc55lssogKPYilgxkFwuzevnehTPc1uw2rdmpLux8c45t7ibAW A==;
X-CSE-ConnectionGUID: rDmt4YK6QI62vh7enWtP+Q==
X-CSE-MsgGUID: anQNXvvJRjKBo+xL2XxhlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32381726"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32381726"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 08:08:16 -0800
X-CSE-ConnectionGUID: zEJ/SI3cTB+93wD+FXjgFQ==
X-CSE-MsgGUID: p6+qbxVSR0G76MPSbbebdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="113572119"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.104])
 ([10.245.246.104])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 08:08:14 -0800
Message-ID: <385bd7d8ebddac691f69ec85e7bb3898986ae68d.camel@linux.intel.com>
Subject: Re: Merging the xe / ttm shrinker series?
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Thu, 21 Nov 2024 17:08:10 +0100
In-Reply-To: <f1c9230a-d0b8-4322-b7be-09afdfe938db@amd.com>
References: <ce4c83dfa93e22487ed80e855318cd8f92a054f2.camel@linux.intel.com>
 <c0ba86c43497626c329a7c4ee9cf1ebc96279519.camel@linux.intel.com>
 <f1c9230a-d0b8-4322-b7be-09afdfe938db@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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

On Tue, 2024-11-19 at 14:04 +0100, Christian K=C3=B6nig wrote:
> Am 19.11.24 um 12:22 schrieb Thomas Hellstr=C3=B6m:
> > Hi, Christian,
> >=20
> > On Sun, 2024-11-03 at 13:38 +0100, Thomas Hellstr=C3=B6m wrote:
> > > Hi, Christian,
> > >=20
> > > The TTM shrinker series is now at v12 with all patches R-B:d.
> > >=20
> > > Ack to merge through drm-xe-next?
> > >=20
> > > Thanks,
> > > Thomas
> > >=20
> > Gentle ping on this,
> > The requested change of the ttm_backup interface done and MBrost
> > has
> > extended his R-B.
>=20
> Yeah and you guys keep pushing stuff on my TODO list additionally to
> the=20
> stuff the AMD guys are pushing for.

Yes, I think perhaps we need to communicate priorities from Intel's
side so that things with high priority doesn't get stalled, although
feedback is valuable also on work that is for "when time allows". Do
you see a way we can make reviews on dma-buf, drm_exec, TTM scale a bit
better?

>=20
> Give me a few more days, it looked mostly good. I just couldn't wrap
> my=20
> head around splitting the huge pages so far.

That's fine, although moving forward I think we need a way to relax the
merge criterion at least for TTM to have the review process scale a bit
better. Could we perhaps work towards adding reviewers to TTM
MAINTAINERS so that an R-B from a reviewer is sufficient unless there
are unresolved concerns from your or another maintainer?

Thanks,
Thomas


>=20
> Regards,
> Christian.
>=20
> >=20
> > Thanks,
> > Thomas
> >=20
>=20

