Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3F87A787
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 13:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A408510F7B0;
	Wed, 13 Mar 2024 12:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Stp5tyqv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FE810F7AD;
 Wed, 13 Mar 2024 12:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710332801; x=1741868801;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TTlQOuJdC70Gvg7qaRmERl0qheIF7H471k3JoFKrFT0=;
 b=Stp5tyqv4ZggJQCVZ7GBzJgFR4BsO7zqD7+tbQcCIG1HBU4QiegpYwNK
 a6XDg0oDe26W84fRmEj7EMVCz5ajxZIeLkdiGyAjS/Ze3cY2y/9xFJGzA
 K5MaVpS2Tm3JB3uONlCZVFpzYEE6PqG/HqJId19vwRfPu0h8/Dt//bbY4
 9QwJL2nN4J76OWZvCjOGGL+SGojT51AEPa9WA1OQ3tarpfE0a/jnEr121
 17z3hhEE0HUQQLHZXaRoHgTCO2qR1drHh3Ja35SufaHDK5UZ5VtPmdJ1e
 aQ+plopNt9e6QuaMedc8qVISgQCJhoCIMn0CIEHfIjaNzDXpt0EVOTfF3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5215334"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="5215334"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 05:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="12321263"
Received: from janlundk-mobl.ger.corp.intel.com (HELO [10.249.254.162])
 ([10.249.254.162])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 05:26:38 -0700
Message-ID: <0ad9e6cd1225d45fdc4e4339429537e1857c0c4b.camel@linux.intel.com>
Subject: Re: [PATCH v4 0/4] TTM unlockable restartable LRU list iteration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Somalapuram, Amaranath" <asomalap@amd.com>, 
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Date: Wed, 13 Mar 2024 13:26:36 +0100
In-Reply-To: <cb473e3de479d55cb3cfb2cc0b8ce6ecfd8d5b0c.camel@linux.intel.com>
References: <20240306070125.27071-1-thomas.hellstrom@linux.intel.com>
 <13884e7d-f18c-f7a6-97d7-eb57f2bd2100@amd.com>
 <cb473e3de479d55cb3cfb2cc0b8ce6ecfd8d5b0c.camel@linux.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

Hi!

On Mon, 2024-03-11 at 14:07 +0100, Thomas Hellstr=C3=B6m wrote:
> On Fri, 2024-03-08 at 13:13 +0530, Somalapuram, Amaranath wrote:
> > Patches are tested on AMD platform.
> > Repeated stress test on Unigine Heaven, memory full (VRAM + GTT +
> > system=20
> > SWAP), then free.
> > No errors/warning in kernel log.
> > Any suggestion specific tests?
>=20
> We are testing locally against Intel Xe CI and Intel i915 CI which
> should give rather good coverage. If there are some amdgpu tests that
> exercise eviction / swapping also with a lot of local objects (Vulkan
> apps?) that would be great.
>=20
> Thanks,
> Thomas
>=20

Any updates on this?

FWIW, For patch 3, IMO after looking a bit at other solutions, IMO this
is the preferred solution mostly because it is self-contained. In
particular if we allow drivers to iterate over the LRU lists with this
interface, most likely if we add semantics like "You must block any
bulk lru bumping if unlocking the lru_lock" That becomes pretty nasty
and will most likely end up incorrect. It might well be that we've
traversed well into a bulk move lru sublist before we try to unlock.

/Thomas



