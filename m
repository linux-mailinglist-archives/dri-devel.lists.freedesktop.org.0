Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C65AB89536
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 13:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1213D10E992;
	Fri, 19 Sep 2025 11:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqgIVWip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C8F10E992;
 Fri, 19 Sep 2025 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758282965; x=1789818965;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=oJL6BydqAsXdSD5uUGw6W1UrKZ6AlNxW7Yv9epfjMuY=;
 b=YqgIVWipzjBtsqEgnMgGsRN3Bu4BTmnXx6ldC2Wul8JBgGNGorYtGMFh
 9YU8r0gYuJ0md4JCdI/jbjZg1fc+Q2HsuNKU2leBsG0Ae8KlAq0qOPZtR
 LTMOXOhQvBgniUW6xJwgGPf6UumLw6H77hKrvfkR7Spn03dbL5ar4Oc8z
 xdw9ZZJYTF5GGP9CzZz7/cEw3e9jnVsKVAkfan/8j4P/xOLkewx/K2M0l
 Y0PkANNhE/u+uoayb2d+L3AU3W8ah+hULX9HcMFdIQRbelC8fUfQI318l
 baIx7tj8RjQJdPcscSB4SmJhZeOVKpveFblb2r7Z6tx04fSXAEYZc08iw A==;
X-CSE-ConnectionGUID: mxLPkPKHSF6lWg7VHTEL4A==
X-CSE-MsgGUID: H4WJw6/cQNK8knKNqow4YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60575635"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60575635"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 04:56:04 -0700
X-CSE-ConnectionGUID: u3rtH7j6TNGn6k4wSGOQeg==
X-CSE-MsgGUID: 6GTMmxc3QwWZcfPJlICvfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="175748556"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.222])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 04:56:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, uma.shankar@intel.com
Subject: Re: [PATCH 00/10]  Introduce drm sharpness property
In-Reply-To: <20250807092841.3169436-1-nemesa.garg@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250807092841.3169436-1-nemesa.garg@intel.com>
Date: Fri, 19 Sep 2025 14:55:59 +0300
Message-ID: <0f35ace53cf269b68fb3adc425680aac8cf10fb6@intel.com>
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

On Thu, 07 Aug 2025, Nemesa Garg <nemesa.garg@intel.com> wrote:
>       Many a times images are blurred or upscaled content is also not as
> crisp as original rendered image. Traditional sharpening techniques often
> apply a uniform level of enhancement across entire image, which sometimes
> result in over-sharpening of some areas and potential loss of natural det=
ails.=20

I was planning on merging this, but AFAICT this is the newest
submission. Basically the CI results are 1=C2=BD months old, and I'd prefer
newer.

Also need to figure out which route to merge, drm-misc or drm-intel.

BR,
Jani.


--=20
Jani Nikula, Intel
