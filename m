Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81939641CB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCAD10E17D;
	Thu, 29 Aug 2024 10:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yf3S51tG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E7610E17D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724927461; x=1756463461;
 h=message-id:subject:from:to:cc:date:
 content-transfer-encoding:mime-version;
 bh=M5Z7EBoRJtaAshKdkZRXoHUmfigIuOdWkWqwgaWJ8UE=;
 b=Yf3S51tGDUHKhYEKImBIvxtGqSfO+prjlXQhBHYqbFVgGBrlR6s0b0fk
 yTWkz4W42oGjTpRBG/9aVnlVNvk2dXrhW2hAxQpt/RMqof+6+3klO91I/
 rNJpxU3aiGVZwd3PcVeacKrdI6nWLcIGvu8cBt2+guk1AZse9GKZAW3xB
 e0vaUn9I9eGdSEBi1pNvwC3YAmfduml3qsfzFUn3Lvnj3VMoJ3MFBSJXp
 cD5m1gHqbiUAYq4h/q6u0wSprYM2rXswESYYM9i5QQzBg7AYtfOZGWhW1
 dl+1nFI3H6H+RTiWJjK3GB1cyNoB53VlB3+G/HLktmyHVdvt4wr4ELUCy A==;
X-CSE-ConnectionGUID: nhxMnqR2QB6H5yxOWgPNtg==
X-CSE-MsgGUID: q7qec74cQDuP3/ftzN5hnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23309911"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="23309911"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 03:31:01 -0700
X-CSE-ConnectionGUID: YT7xdkmMR0+OpR+ysR8idQ==
X-CSE-MsgGUID: G1UxtzTKQaeGQI/jxEv5sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="68357199"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.245.46])
 ([10.245.245.46])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 03:31:00 -0700
Message-ID: <3f972c4bc236cb5b960ff02a33309f9cbea6cba5.camel@linux.intel.com>
Subject: TTM pinning and LRU lists
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: christian =?ISO-8859-1?Q?k=F6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Date: Thu, 29 Aug 2024 12:30:57 +0200
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

Hi, Christian,

I noticed that calling ttm_bo_pin() doesn't seem to move the resource
to the pinned list, but keeping it on its manager's LRU.

Is it the driver's responsibility to call ttm_bo_move_to_lru_tail() to
move it to the pinned list after pinning?

/Thomas

