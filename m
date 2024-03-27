Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B56D88DA86
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 10:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BFF10F150;
	Wed, 27 Mar 2024 09:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcdO/cJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0F910EF03;
 Wed, 27 Mar 2024 09:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711533160; x=1743069160;
 h=message-id:subject:from:to:cc:date:
 content-transfer-encoding:mime-version;
 bh=S3UXb6OoKbkRFSigXyEuRA8UON8Z0Ry43jFA2auJSbU=;
 b=LcdO/cJCNV4H7RR+iWa8BdKaVxlE+8UADHBivdySofBF1f0EQEGNa7Ls
 7wjSezQc+r+WlNX4lNMEsJI7seMkH2euB0fijn9QFYN7oTFJn1a4FKUCX
 EgWNqeo+HVyQ2mhusy/XZq4XZENZxnspoW1dUGZkRsQ6lX3QbH6SmeX17
 FwqSfxCQRV7RecwBdJzSFbOIU+l54ipQ8k4DPZzdzB/nNV6wPz34QznDU
 StRoAbhj1D051Ccui+hFWFoldI58EPqGeAwM+Xu+YODvXG+oOcAfr0q/T
 FV6wDRDjKb1wet0+phHv6EYC1t+luV3in5Ggk3dD9cjHBOInSnkDDPd1a w==;
X-CSE-ConnectionGUID: 4Me+n8ugTdSsbEVLTwHTrA==
X-CSE-MsgGUID: 8PMfDZmoQkKKgUol8+9rDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="9586855"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="9586855"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 02:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="47253714"
Received: from ktonsber-mobl1.ger.corp.intel.com (HELO [10.249.254.184])
 ([10.249.254.184])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 02:52:38 -0700
Message-ID: <bc4c7b5f19e6479a002ef69949918a45ca89ce69.camel@linux.intel.com>
Subject: Cross-device and cross-driver HMM support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, oak.zeng@intel.com, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Wed, 27 Mar 2024 10:52:35 +0100
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

With our SVM mirror work we'll soon start looking at HMM cross-device
support. The identified needs are

1) Instead of migrating foreign device memory to system when the
current device is faulting, leave it in place...
1a) for access using internal interconnect,
1b) for access using PCIE p2p (probably mostly as a reference)

2) Request a foreign device to migrate memory range a..b of a CPU
mm_struct to local shareable device memory on that foreign device.

and we plan to add an infrastructure for this. Probably this can be
done initially without too much (or any) changes to the hmm code
itself.

So the question is basically whether anybody is interested in a=C2=A0
drm-wide solution for this and in that case also whether anybody sees
the need for cross-driver support?

Otherwise any objections against us starting out with an xe driver
helper implementation that could be lifted to drm-level when needed?

Finally any suggestions or pointers to existing solutions for this?

Any comments / suggestions greatly appreciated.

Thanks,
Thomas

