Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EDF8BCB09
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 11:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CAA1129C8;
	Mon,  6 May 2024 09:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="epNI6DNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D87811228D;
 Mon,  6 May 2024 09:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714988817; x=1746524817; h=message-id:subject:from:to:date:
 content-transfer-encoding:mime-version;
 bh=GGgJQpIZ+oAMuM2wlgYudpVp0KJ1qtoSYsNYha6qyEo=;
 b=epNI6DNqHq5ROpa/1stn+vM6ma61N+znrE/xFbZ6Ca0xyFoIEN+upf/g
 VChTBXbPEYiw+zDiKl+JuNfQulfaDstYmhdMZMMe6yYNbR20qYoq/AMM0
 khRBddPDVw1UgNqUcUpnHXTctGO/3kya8l37pwLHpa4wt9//bRtIz2CqT
 10sns3B7MWbsIg1Gq7wwq5/cuME47JoWpadt3GB78Qzd0RBJc5wV59Smv
 DKZVwzAzkZY7QJpKRmV5IzUuykWP356jI1jS49/+j9gFoaBdEk/ZVfw3I
 /IA5+hneSShpJoylkhKlD4sWTeGMpyHyJKsvTTZrhny17A6n/tLYbJIdu A==;
X-CSE-ConnectionGUID: +4wwY4C0QniedOLZA30dzg==
X-CSE-MsgGUID: v52oBNuaRhGNcZAvsdSNCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10653560"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="10653560"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:46:56 -0700
X-CSE-ConnectionGUID: s/9su2GhRk6pbIR94WtGFg==
X-CSE-MsgGUID: t0w7dKsET+G8NY6Zr539VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28214843"
Received: from svandens-mobl.ger.corp.intel.com (HELO [10.251.209.134])
 ([10.251.209.134])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:46:55 -0700
Message-ID: <9f5f8b3b93b629c8530bbcce9567b51a320c5537.camel@linux.intel.com>
Subject: drm_exec changes for eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 christian.koenig@amd.com
Date: Mon, 06 May 2024 11:46:51 +0200
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

Hi Christian, Others.

In order to support exhaustive eviction there are some changes that I
think needs to be made to drm_exec:

1) Trylock support=C2=A0
(This is for ttm_bo_vm, ttm_buffer_object_init_reserved, and also for
the eviction path where I think we want to make a trylock pass before a
sleeping lock pass).
In essence this means we can't leave any contending lock unlocked until
the next sleeping lock, but rather need to relock it on
drm_exec_retry_on_contention(), meaning that that macro also gets
passed and returns an error code to handle -EINTR.

2) Snapshot unlock
After successfully obtaining backing store, we want to unlock all
evicted objects. So snapshot the drm_exec state when eviction begins,
and unlock everything down to the snapshot after successful backing
store allocation. Essentially the snapshot contains the number of
locked objects and a pointer to the prelocked object.

Any concerns?
Thanks,
Thomas

