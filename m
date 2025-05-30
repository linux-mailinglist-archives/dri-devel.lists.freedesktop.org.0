Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE838AC9060
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 15:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2383210E84D;
	Fri, 30 May 2025 13:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jZWgVwKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960AB10E85B;
 Fri, 30 May 2025 13:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748612293; x=1780148293;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=o9P7/wYQPmYQaKNuFq7NSX+ZmEYiCM91XW9864V4KnY=;
 b=jZWgVwKBI80nSG3tkUc5hcPtai+I5Jf4jLxGajHLzxWmYx0l/dllcYXr
 YAUWyqkbyYzRtIjd8jBLpqP4qhJS/KWOlqQlp4N8MjKyVWlD/SjhQJXtl
 4m44iGCh+yMCx0XUg5W/T2j5tZrSbGgfeSWwJPefITYheXKAeCFjaAs2d
 2t1XEN+Nf1ytZLu27BZcchz7K7dXZ1MBkjfCBJ5TNFNlsFJC0zFS7Lrfr
 Z3bqSJ0dXOID6ax6oBFPVY4zoyrvERCvufmzNYlBKxUMuabnSDEtfj2OZ
 05i5B3q4vz8DVqz7YqMRIv9U7W5Iak4XXPhjSB2f4Qzup6tN0305mbYKZ w==;
X-CSE-ConnectionGUID: JYK7m5qqRUWIO1Iy+mqBvg==
X-CSE-MsgGUID: ns6LD7BuTdKM4Mszn7CZjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68255158"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="68255158"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:38:12 -0700
X-CSE-ConnectionGUID: 7q9JNVmpQ92f3Tt4LHEuCw==
X-CSE-MsgGUID: 0qqq19ioSmGK5DnanuKaZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="174759679"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:38:07 -0700
Date: Fri, 30 May 2025 16:38:03 +0300
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
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomas Winkler <tomasw@gmail.com>
Subject: Re: [PATCH v11 02/10] mtd: intel-dg: implement region enumeration
Message-ID: <aDm0u4wXDCqO5rFK@black.fi.intel.com>
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
 <20250528135115.2512429-3-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528135115.2512429-3-alexander.usyskin@intel.com>
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

On Wed, May 28, 2025 at 04:51:07PM +0300, Alexander Usyskin wrote:
> In intel-dg, there is no access to the spi controller,
> the information is extracted from the descriptor region.
> 
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Co-developed-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
