Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1EFA72F44
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 12:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E653610E8A9;
	Thu, 27 Mar 2025 11:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUqobeij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A0910E8A9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 11:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743074976; x=1774610976;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9HuarsgoMG/guK6o8AfIcXFqtxc+mN2FeomW5hGlTss=;
 b=AUqobeijtqG+C07tXtAKzFxN/XYfu4mDcdBmfLbdYdjQgpgG0y+mU+G4
 PfWRsltLlL/HrIS751wGsadt7wrTjyflYmrAsyENqffe+as5DuSBnlhiK
 7u4d/8I1nKC+xfWHcVnfh93kRFA/Aq8KqnAhDkTBHrxxVD0b0bfarl5AR
 8rn/wZcU6mzA/oKt6GkTckldjc7QRiVARM47k2HRnIU2cTjRX1jLJCv++
 okASdYj2Uw76kc1Cd1NCfjVHY01hh/84IkYlOAvUGalk3Rs/mAtkP7MZT
 rtTDCFUyEkiUznRSaddqtggGZCTmm7ynFdw9e06Le72PTURak1TeHOZcu A==;
X-CSE-ConnectionGUID: NsGkaaa3SY2aqH1mvzF3vg==
X-CSE-MsgGUID: FTIzihwgQHaQebnQ1bNSHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44319426"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="44319426"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 04:29:36 -0700
X-CSE-ConnectionGUID: 21ef6H9kTniF2BLnMDS/pw==
X-CSE-MsgGUID: EIzD34+lQHqR1Uu7gyHNOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="130176379"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 04:29:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu
 <yuq825@gmail.com>, Steven Price <steven.price@arm.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v20 05/10] drm/shmem-helper: Refactor locked/unlocked
 functions
In-Reply-To: <87friy67e1.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <20250322212608.40511-6-dmitry.osipenko@collabora.com>
 <87iknu67hd.fsf@intel.com> <87friy67e1.fsf@intel.com>
Date: Thu, 27 Mar 2025 13:29:27 +0200
Message-ID: <87bjtm67ag.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 27 Mar 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 27 Mar 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Sun, 23 Mar 2025, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>> Add locked and remove unlocked postfixes from drm-shmem function names,
>>> making names consistent with the drm/gem core code.
>>
>> This breaks the build for drivers/accel/ivpu/ivpu_gem.c.
>>
>> Please enable CONFIG_DRM_ACCEL_IVPU=m and fix the fallout.
>
> Ditto for CONFIG_DRM_ACCEL_AMDXDNA=m.

Ah, saw the fixes from Boris [1], sorry for the noise.

[1] https://lore.kernel.org/r/20250327104300.1982058-1-boris.brezillon@collabora.com


-- 
Jani Nikula, Intel
