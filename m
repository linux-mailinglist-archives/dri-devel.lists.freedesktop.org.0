Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4399800C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 10:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C188210E2CB;
	Thu, 10 Oct 2024 08:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSQnIDXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D9410E2CB;
 Thu, 10 Oct 2024 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728549365; x=1760085365;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Nu4V4rdQkj/etExAZDDXgmSW97mar0xJ3yyTz/OsU3M=;
 b=cSQnIDXYMwMNPz/4EMQoARR98KE084TOtyCo/OyLke+yejst0b17a/cI
 Ww8io3OxBLaiFYlSGCOZTQjqYSIhHuYRryphni8QGiHF+uc6OS6rh+Vg4
 jg4BsFxtRa0ihkZLmi8+TGklPWdvi8rwqbB6z43z9TBStl8Yr9v/WXZo5
 MjCnsKW9rH3LhBkCMfd8qR8LTDVHlYmuHw08f/S5wmdvnvfBQEZQ+NVsT
 LuElu63fRtC5XudduS+9XMYTsMW+IMgIjFlzdQSU6/HfjCEY29/KHWuDL
 5IKoGZOqyg4Qt9xMrVlCIURk5qRNtgcVpf649sz9gj339MsAkrZi0yEQx Q==;
X-CSE-ConnectionGUID: Qb51RIoHTeShFT50u/vUdw==
X-CSE-MsgGUID: 6PpkDaxgRCS1+/hjyAd3zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27366486"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="27366486"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 01:36:04 -0700
X-CSE-ConnectionGUID: t/Y2GDwWTQ6Y8q0gdwPfWA==
X-CSE-MsgGUID: 8UjZd63hSDybLOGpHzQ5yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="80523723"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.227])
 ([10.245.244.227])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 01:36:02 -0700
Message-ID: <97e9ec29a9b7b670bb15e12c45efec73fa0a1ff9.camel@linux.intel.com>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Simona Vetter
 <simona.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Date: Thu, 10 Oct 2024 10:35:50 +0200
In-Reply-To: <20241010160942.192caf60@canb.auug.org.au>
References: <20241010160942.192caf60@canb.auug.org.au>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Thu, 2024-10-10 at 16:09 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> include/drm/ttm/ttm_device.h:255: warning: Incorrect use of kernel-
> doc format:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @unev=
ictable Buffer objects which are pinned
> or swapped and as such
> include/drm/ttm/ttm_device.h:270: warning: Function parameter or
> struct member 'unevictable' not described in 'ttm_device'
>=20
> Introduced by commit
>=20
> =C2=A0 fc5d96670eb2 ("drm/ttm: Move swapped objects off the manager's LRU
> list")
>=20

Thanks. Will provide a fix asap.

/Thomas

