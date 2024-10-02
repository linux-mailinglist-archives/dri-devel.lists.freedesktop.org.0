Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4286498D3CE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 14:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886EC10E727;
	Wed,  2 Oct 2024 12:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXszBatN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E509B10E716;
 Wed,  2 Oct 2024 12:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727873813; x=1759409813;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0I11X9emZQo37lnyzQ+iCYA4tB6yNL654d8yshltWLs=;
 b=MXszBatNN/RZA9YJrx9N7D2GxQfXRe0LKrGb2nYTAz1qea1a1t6iFbw8
 4jclByk1P/Ahjry2OtsGVgVu7pc0abrWJ2UTH/+U8gDuBa0PeZOn9FK4V
 q/Sw48Q4ZJFI7ulFOZkW1c7dGzk79HZ9KcCZAU7tPmdo/SzmGvBwtzNh3
 jkjq1P/p8LVEnLXNBa9hhiFIPYwi9hVzCkPyG2Sufn6plZS9oaS1455eU
 dN+cEJVLYB6QAAs9bmrYWIjU41BwZ+YpLkeXHZcJI+4FcYV4iVtbGpyDa
 OZ0aQC8j9zJcNZgnK3GvSSb683g2D8Zx+Yg5BO9INKV/O4443hD38XPax Q==;
X-CSE-ConnectionGUID: qyk2mmAARyyl4Ys4pPI+wg==
X-CSE-MsgGUID: xaMugOUiSoWQNs3quLVD8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="44557640"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="44557640"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 05:56:52 -0700
X-CSE-ConnectionGUID: XaPsADQJS7iYyeYRwrqKSw==
X-CSE-MsgGUID: qNqMKC0TRrC47yVzKYUmiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74228247"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 05:56:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Zack
 Rusin <zack.rusin@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Sui Jingfeng <suijingfeng@loongson.cn>, Matthew Brost
 <matthew.brost@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/2] drm/ttm: Change ttm_device_init to use a struct
 instead of multiple bools
In-Reply-To: <20241002122422.287276-2-thomas.hellstrom@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241002122422.287276-1-thomas.hellstrom@linux.intel.com>
 <20241002122422.287276-2-thomas.hellstrom@linux.intel.com>
Date: Wed, 02 Oct 2024 15:56:44 +0300
Message-ID: <874j5uu0hf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 02 Oct 2024, Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m> wrote:
> The ttm_device_init funcition uses multiple bool arguments. That means
> readability in the caller becomes poor, and all callers need to change if
> yet another bool is added.
>
> Instead use a struct with multiple single-bit flags. This addresses both
> problems. Prefer it over using defines or enums with explicit bit shifts,
> since converting to and from these bit values uses logical operations or
> tests which are implicit with the struct usage, and ofc type-checking.
>
> This is in preparation of adding yet another bool flag parameter to the
> function.

Funny, the other day Ville and I were throwing ideas around, and we
talked about something like this to implement keyword arguments in C. :)

Cheers,
Jani.


--=20
Jani Nikula, Intel
