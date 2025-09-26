Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6C7BA2DD8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 09:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B2810E06F;
	Fri, 26 Sep 2025 07:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgoVwJRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C5F10E06F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758873477; x=1790409477;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wQX2+e06nx3AF2Bto4vUnWY1OLat3znhbrwGZTqgXuM=;
 b=CgoVwJRyA0rRzGRqwCR+Vlsqt5CZmPIwA6T4Zhd7mGr+QyNGHvF4z5mq
 dkE6x1vMJpVLGFSInzknYmbj86mYvRwwRobnqy5qv1l6x6v2u4c7eDear
 SEFNzP6CrlIq11CNtxYUYWEZxj32Enxo65VV5bnf7S6eaFzV2/XjpYqOj
 0WYHbIvA7qoDAtsuxS/BzGhe64Yiud7y0gAWMCK8p8UlEqes8j2uKZ95V
 QjFDlM8CqJoPer5hazrqkNlbrqSKh1BNCA7T+WpUSaZE9lagu6zNY58r1
 qFVMS4w17XresImxWrHMA9Zd5Sra50oNq8qLYQDrCAyKoo37G6Jbd4AXj w==;
X-CSE-ConnectionGUID: Nlz4dAbjRiqfztY5+1HkYQ==
X-CSE-MsgGUID: KGr5lxSnRB2DAG58a2nRow==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72565965"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="72565965"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:57:57 -0700
X-CSE-ConnectionGUID: LL22015qTLyX1DmBS8ZSSA==
X-CSE-MsgGUID: U+cJtfFwTqalWDZUNmwPgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="178309997"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.10])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:57:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, David Airlie
 <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/10] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
In-Reply-To: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
Date: Fri, 26 Sep 2025 10:57:49 +0300
Message-ID: <3006bc88689b2e04785cef6bd9cf4142ed123ee4@intel.com>
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

On Wed, 24 Sep 2025, Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
> Most of this patchset is boring mechanical conversion.

I suggest using the relatively new sized BIT_U32() and GENMASK_U32(), or
other sizes if your register sizes are different. You'll get better
compile time protection against mistakes, and sometimes the unsigned
long type of plain BIT() and GENMASK() can be annoying.

BR,
Jani.


>
> Noteworthy patches are 6 and 7 , those introduce handling of DSI mode flags
> and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
> should not have any adverse effect on existing hardware.
>
> Marek Vasut (10):
>   drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
>   drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
>   drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
>   drm/rcar-du: dsi: Clean up VCLKSET register macros
>   drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
>   drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
>   drm/rcar-du: dsi: Respect DSI mode flags
>   drm/rcar-du: dsi: Clean up handling of DRM mode flags
>   drm/rcar-du: dsi: Convert register bits to BIT() macro
>   drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
>
>  .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  89 +++--
>  .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 363 +++++++++---------
>  2 files changed, 232 insertions(+), 220 deletions(-)
>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org

-- 
Jani Nikula, Intel
