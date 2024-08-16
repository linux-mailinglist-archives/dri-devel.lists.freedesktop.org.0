Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6987595465E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 12:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D1E10E5E8;
	Fri, 16 Aug 2024 10:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFlwX1i2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4DE10E5E8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 10:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723802492; x=1755338492;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=cuTvqTcNYYV6+/B052FrMZNGFChyKV1fnhkezBluVSY=;
 b=lFlwX1i2InxGDsKXVqJ4PdKK3XzB03YkmouXNYhzQPqkQCWL/KX3or1U
 GI+44dhcKPIYnx+kSTz/VP1ipoSBxHkx4j3P/qSMZf6h9CT/EP+CsERmv
 K1d+Wbys9vkKqxF25utpwj0+QA6utA+RxinB52o/B72Z9LeSYrAyfiYYF
 Wcca4Hpu1MT38NrTbcD1OlIDoI6pvNMWBDeQbGBsxboUikQ1S6OXNhzuA
 GxF5G0A71LJZJH5bvjK5HeLmUjpy9C0dFPY8AgOwK6lrs7S7DSKublxea
 4Js3KSUwRmlfNjp85QXWaBLmpSrgNkc31ODByDn2hJxZHQ583ZSY4llUB A==;
X-CSE-ConnectionGUID: tl0qO2OuTvuQXQL1Ed7C4Q==
X-CSE-MsgGUID: Yulf2mAsQtOb+xKoAuhO2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21728518"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="21728518"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 03:01:32 -0700
X-CSE-ConnectionGUID: 63KhC3YiS3mYiTrRd03k+Q==
X-CSE-MsgGUID: AWEz/iCZQk6nJOMgaTitcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="64037148"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.232])
 ([10.245.245.232])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 03:01:31 -0700
Message-ID: <7d5a0e399310f7cde43df9e47b7d09f12518bff1.camel@linux.intel.com>
Subject: Re: Switch reference counting to GEM instead of TTM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org
Date: Fri, 16 Aug 2024 12:01:28 +0200
In-Reply-To: <20240716123519.1884-1-christian.koenig@amd.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
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

On Tue, 2024-07-16 at 14:35 +0200, Christian K=C3=B6nig wrote:
> Hello everyone,
>=20
> to make use of drm_exec it is necessary to have TTM drivers actually
> use
> the GEM reference count instead of the TTM one.
>=20
> This patch set is a start to do that. It switches all uses of
> ttm_bo_get/put to the GEM counterpart and then makes ttm_bo_get
> private
> to TTM.

For xe
Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


>=20
> Netx step is to completely remove the TTM refcounting.

This is probably going to be a bit complicated, and in particular IMO
we must ensure that the refcount resurrection doesn't leak to the gem
refcount and annotate the driver callbacks that might get called with
deleted (gem refcount 0) objects.

/Thomas


>=20
> Please review and/or comment.
>=20
> Cheers,
> Christian.
>=20
>=20

