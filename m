Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586839298B5
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 17:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1AF10E03C;
	Sun,  7 Jul 2024 15:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqpmhQne";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D1A10E03C
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2024 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720367360; x=1751903360;
 h=message-id:subject:from:to:cc:date:
 content-transfer-encoding:mime-version;
 bh=UiydbORaCjHV/d/rR0lEJrnxm7WC/WJsu89IazQgpa0=;
 b=DqpmhQne7lqVVn94ITSyb+0AFZwsmvYprZql8KX1unt1z//PjynEqD1L
 A1lVGpbGRq7ErOEAINY1/66ReYZhMywtcXhvHbhFI5rxIavdwoJu6DtCU
 o2pfMYRbgB7VXBMiPfYbEJ74dDgKx8LC8fxZQZvoueaIEzo4r9Lb6PpOM
 za0uGNf39VfsFzwfOFDZZ0y6aYMQ92chxzgz6PrBsfJ6OZ+ce5JgP3OMq
 nKFcW8JSF4DtJKsq7R3RPH30w63g9q7bajPEqnLOxLZi9Iob0QWHg71XE
 0Ee/BB3C8UrZVCZm4sMdHDwTPFfsIgNs8XbL5YTZ9ZR46XQt07S+YvbHk Q==;
X-CSE-ConnectionGUID: Gr23hfUgRfu2QDJBjUv4nA==
X-CSE-MsgGUID: mS+5RCuqTaSc9r647o41Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17289574"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; d="scan'208";a="17289574"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 08:49:20 -0700
X-CSE-ConnectionGUID: kunKODbMRw6nKtfmgppVFw==
X-CSE-MsgGUID: Zyr6IRGGRe6usdbSCBMMhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; d="scan'208";a="51716097"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO [10.245.245.235])
 ([10.245.245.235])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 08:49:18 -0700
Message-ID: <0db8246a59e67c8e740110c6cfdd8339bec97f32.camel@linux.intel.com>
Subject: The TTM LRU-walk cherry-pick series
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org
Date: Sun, 07 Jul 2024 17:49:16 +0200
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

Christian, Matthew,

I think I addressed all review comments and a couple of anticipated
ones (s/long/s64/) in the swapout- and eviction patches.

I'm heading off on vacation today, (4 weeks) so if something becomes
urgent in-between feel free to pick up, modify and merge.=20

Regarding the drm_exec trylock functionality I'm for as much as
possible that it should look like any other locking primitive trylock.
i.e. no additional tricks needed.

Thanks,
Thomas


