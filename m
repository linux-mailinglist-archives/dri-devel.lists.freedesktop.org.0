Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44929C6A2B3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 16:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A263F10E134;
	Tue, 18 Nov 2025 15:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYm68Ve8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F7F10E134;
 Tue, 18 Nov 2025 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763478017; x=1795014017;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Zz9YWiBTLV0B0EhGOFmhpjfs0b4houvXiVpjgI8aT8E=;
 b=iYm68Ve8ss4wC2TSYebQprhGPBvTzYVytlP4c3G+c0rZSCCBd44sBoYk
 5Am26V79UyxHGSyhTr0ROdmCXyLmZQPaUubb5bt8X60OxEPfCqooM0xCT
 RhXR1NjXHEq8x9MZsn1TXwpdVhMvT6kiA7PQlv7raDuamxPif5s1tjepB
 70SOpKiW1utneWF9xEHejVDVTlm4CZwuP547w0rnQgJxYowLc691cH7WE
 SB0DXXHnbWO8uWKlwsl6bltqQwmIM9Aa9nAp+9Wx/PzpQ1fndydgGayGq
 CyoXkcaBdrud2h1ZskH+ld0r9L44Tz+5ZYgK3CYkeDRAgGMhSiprYwga1 Q==;
X-CSE-ConnectionGUID: qp3YSb7ZRimDuh7qNyRkmg==
X-CSE-MsgGUID: Nct0W3ONS9GPPuqYfFmaVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="88151655"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="88151655"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 07:00:16 -0800
X-CSE-ConnectionGUID: srJjTBFPTNCsvAFsGMnVzg==
X-CSE-MsgGUID: fGCuAn9pSpC8wbsDghrqMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190931473"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [10.245.245.166])
 ([10.245.245.166])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 07:00:12 -0800
Message-ID: <471b61ae7b130ea05b509a5fb0b7f3a4de59531a.camel@linux.intel.com>
Subject: Re: [PATCH v2 02/20] drm/ttm: rework pipelined eviction fence handling
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Huang Rui <ray.huang@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, Sumit
 Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
Date: Tue, 18 Nov 2025 16:00:10 +0100
In-Reply-To: <20251113160632.5889-3-pierre-eric.pelloux-prayer@amd.com>
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-3-pierre-eric.pelloux-prayer@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

Hi, Pierre-Eric

On Thu, 2025-11-13 at 17:05 +0100, Pierre-Eric Pelloux-Prayer wrote:
> Until now ttm stored a single pipelined eviction fence which means
> drivers had to use a single entity for these evictions.
>=20
> To lift this requirement, this commit allows up to 8 entities to
> be used.
>=20
> Ideally a dma_resv object would have been used as a container of
> the eviction fences, but the locking rules makes it complex.
> dma_resv all have the same ww_class, which means "Attempting to
> lock more mutexes after ww_acquire_done." is an error.
>=20
> One alternative considered was to introduced a 2nd ww_class for
> specific resv to hold a single "transient" lock (=3D the resv lock
> would only be held for a short period, without taking any other
> locks).

Wouldn't it be possible to use lockdep_set_class_and_name() to modify
the resv lock class for these particular resv objects after they are
allocated? Reusing the resv code certainly sounds attractive.

Thanks,
Thomas

