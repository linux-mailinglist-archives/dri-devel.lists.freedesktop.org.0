Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A3F9D24BB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 12:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A323310E07F;
	Tue, 19 Nov 2024 11:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0EdLihQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FA310E07F;
 Tue, 19 Nov 2024 11:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732015374; x=1763551374;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fWM50YqGQcRMfqh99kDCRD2d2opNowdCpkVd3bxB/z8=;
 b=I0EdLihQMp04SPJMVX9dCXjPsNtgTRxMB+p+P4Y10fIGQU1pkeFFXJ9/
 LywJUx0ru3r6uC2+bTM1viX/J2WWGJaqs+U0KqRpj344/lXOnq9GmOVO1
 /wLUkvBwATGsGWLEOe6xdep/AV8vGq16ODG29bUDrgo/BzAfqsF1cy/55
 Rgy7/RJQjOytLWHXTIxmCQiu5HPc3Y4DM5ySIrKbt4RDBTRZsD9j7S+Rk
 Ia2tLYIAO3AKNicrb3qA9Y12MmyO1XGnuEbyT9B/UO5FXDn0KnmhhVE2b
 xtejPce021MOm77su2QlSTbmb1t+trrlmmqndDOUrQVQLrbgRZHGC1T26 w==;
X-CSE-ConnectionGUID: 7+Z8fIk7SeCZrvdGD9+uSQ==
X-CSE-MsgGUID: 2PP3g/ooQU6DYWsDuIYS7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35779216"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="35779216"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:22:54 -0800
X-CSE-ConnectionGUID: n3mqu/NWTwaHcqFi/zIW6w==
X-CSE-MsgGUID: oA/Vg8a+QtOF507HvQ7MHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89101153"
Received: from smoticic-mobl.ger.corp.intel.com (HELO [10.245.246.223])
 ([10.245.246.223])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:22:52 -0800
Message-ID: <c0ba86c43497626c329a7c4ee9cf1ebc96279519.camel@linux.intel.com>
Subject: Re: Merging the xe / ttm shrinker series?
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 12:22:49 +0100
In-Reply-To: <ce4c83dfa93e22487ed80e855318cd8f92a054f2.camel@linux.intel.com>
References: <ce4c83dfa93e22487ed80e855318cd8f92a054f2.camel@linux.intel.com>
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

Hi, Christian,

On Sun, 2024-11-03 at 13:38 +0100, Thomas Hellstr=C3=B6m wrote:
> Hi, Christian,
>=20
> The TTM shrinker series is now at v12 with all patches R-B:d.
>=20
> Ack to merge through drm-xe-next?
>=20
> Thanks,
> Thomas
>=20

Gentle ping on this,
The requested change of the ttm_backup interface done and MBrost has
extended his R-B.

Thanks,
Thomas

