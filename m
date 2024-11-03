Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1539BA56D
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 13:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6137C10E004;
	Sun,  3 Nov 2024 12:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AX+I5GiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667A910E004;
 Sun,  3 Nov 2024 12:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730637498; x=1762173498;
 h=message-id:subject:from:to:cc:date:
 content-transfer-encoding:mime-version;
 bh=bU4fKySm1biDz5zmusm+2eXhSVGLV8JBn+X9xHaNk+w=;
 b=AX+I5GiQqm3FBHSKoVqVac1fUXRN+urW2yGffzKFuUKAcvyvKEBUGGjK
 2/7mFgBKUHb61+p3R8oYxWtwWczyt5r9DKps0fTR6YhCYNOAW4JFYBoAY
 q67buebNZtM5wU3eZAOICLqzKVzuUafRynZoxrcAsAvik0FjCuwQppG7n
 pOtewDmywvl4fdTB4mVPGbHr0ebf26cXWy397Lhc91/u7NTnLxXEvk22A
 n2a+6kyxLBGwgn6iGnlVOQmG+w2waZcLSqoa8t4JIGnAgU7K5d9LEj+cf
 SXtchZ2JGRcihUtm2A8MOQU7oUaO3f3SLNVFZvmGkuIcUIEH4Wy9XlC+h w==;
X-CSE-ConnectionGUID: /zfQCMYfSIumZFwqkXt6Zg==
X-CSE-MsgGUID: RXxI4iqSRTqu9HOYFoc3hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30519121"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30519121"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2024 04:38:15 -0800
X-CSE-ConnectionGUID: 8gvFAGFLRwmOFTXrDsBicA==
X-CSE-MsgGUID: tXaUNw4uQpiWR/VV5cYYXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; d="scan'208";a="88215514"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.3])
 ([10.245.246.3])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2024 04:38:14 -0800
Message-ID: <ce4c83dfa93e22487ed80e855318cd8f92a054f2.camel@linux.intel.com>
Subject: Merging the xe / ttm shrinker series?
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Sun, 03 Nov 2024 13:38:11 +0100
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

The TTM shrinker series is now at v12 with all patches R-B:d.

Ack to merge through drm-xe-next?

Thanks,
Thomas

