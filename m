Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB9BAC90B5
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 15:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1220E10E842;
	Fri, 30 May 2025 13:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXjWD1rH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF5210E7F0;
 Fri, 30 May 2025 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748613293; x=1780149293;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RBaCZTQdhPMgKEXPyAzhYmB8NNmpV2BzO5s7RSPQP6w=;
 b=LXjWD1rHeaUHAi3YJL+wKTgwY/gmNyEy7h3fVlmd5fKiaLhgrr0Q4hlf
 8X0Jned2E2S4ID3HJIfmZDR5w+Q9jSJwU1iUT6sKXym6Vz/qwQ/z3Fhaw
 ODyLyaSl/cA7NU9OZFnn17ybRLW+6/AzdMmr6LA2oDxxS/56OR+bY3pjS
 BnlzvJU4G5v9yUIvklrSF4P+aADBT4bS5a/oehpgFD2cS4Oj2pzrq6mMm
 q8llnHUDg2pTrvJOfDncxXfrt+sanscJVVx8SfqLEeZjuSfENcGzpG3UB
 encNDH+vIu0LG55fc2c3okdxJFaU8GgmS9WpPZNJx2fXPnBEUYsv7avyo w==;
X-CSE-ConnectionGUID: wJJaVUjsR7qLGXQOBtxhXQ==
X-CSE-MsgGUID: /PBV74rXTla31MewBq59LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="62050974"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="62050974"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:54:53 -0700
X-CSE-ConnectionGUID: r+GLEQFPR2aQqJOf5YKfPg==
X-CSE-MsgGUID: jWWBS004RTSMRYYJ7+KDhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="149027757"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:54:47 -0700
Date: Fri, 30 May 2025 16:54:44 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>,
 Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 05/10] mtd: intel-dg: align 64bit read and write
Message-ID: <aDm4pAqHUhI-kY2i@black.fi.intel.com>
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
 <20250528135115.2512429-6-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528135115.2512429-6-alexander.usyskin@intel.com>
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

On Wed, May 28, 2025 at 04:51:10PM +0300, Alexander Usyskin wrote:
> GSC NVM controller HW errors on quad access overlapping 1K border.
> Align 64bit read and write to avoid readq/writeq over 1K border.
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
