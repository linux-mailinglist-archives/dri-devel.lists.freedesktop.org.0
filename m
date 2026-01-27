Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG0BEJbPeGmNtQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:45:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 653A895F07
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00B810E588;
	Tue, 27 Jan 2026 14:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0aFPsLv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325F610E588
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769525138; x=1801061138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e1sWwSv80OatEESHNX0DybuhSsd7eY41H0DFmX4oGeo=;
 b=b0aFPsLvasahFv0P+yfMS8BXfDoQ40MFoJ+L8H7Ef3P7ymAI5FzViqRh
 Oyz04i9094dbyg2SMAcFgkl5I3Gj08Ci7QCgOFVJ7GaoK1rfdm5hfKITQ
 1vQm0rWvCNR1CdXvmFffq5x6LG1Nu4/6JzWfmGYTNpEvj86oKOQdYulax
 s8IZAiNe3AWHvpFORfmihfkDCzJuFAsSp7S7qTGf4leAH5vow7fX78zFx
 oFFucxwyeGPmvfcuc3gxYIfh+AxRYQpkOhXAaKWzZReGLx5bu1dgcQRlZ
 OCkpGVk5SrAt/yD4O4VpGWSLhZyed0fxQJndjVys+KldoNL1VoRd8ADiA g==;
X-CSE-ConnectionGUID: DUqy6W7LQiarkVxBCv4q1w==
X-CSE-MsgGUID: AWqdUn0QRSK0CPoiPSlIIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69920670"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="69920670"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 06:45:37 -0800
X-CSE-ConnectionGUID: J6ERCFuqSGG9Zp1yKjVwXg==
X-CSE-MsgGUID: 4JRLfM6FRGK/0g5JZKD6kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="230944425"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2026 06:45:34 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id D20FC98; Tue, 27 Jan 2026 15:45:32 +0100 (CET)
Date: Tue, 27 Jan 2026 15:45:32 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>
Subject: Re: [PATCH v5 4/4] drm/rockchip: vop2: Support setting custom
 background color
Message-ID: <aXjPjNWl3oVOVYxV@black.igk.intel.com>
References: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
 <20260127-rk3588-bgcolor-v5-4-b25aa8613211@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-rk3588-bgcolor-v5-4-b25aa8613211@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,cknow-tech.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cristian.ciocaltea@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:diederik@cknow-tech.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 653A895F07
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:45:36AM +0200, Cristian Ciocaltea wrote:
> The Rockchip VOP2 display controller allows configuring the background
> color of each video output port.
> 
> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
> which defaults to solid black, make use of it when programming the
> hardware.
> 
> Note the maximum precision allowed by the display controller is 10bpc,
> while the alpha component is not supported, hence ignored.

...

> +	/*
> +	 * Background color is programmed with 10 bits of precision.
> +	 * Since performance is more important than accuracy here,
> +	 * do *not* make use of the DRM_ARGB64_GET*_BPC() helpers.
> +	 */
> +	val = FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED, DRM_ARGB64_GETR(bgcolor) >> 6);
> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN, DRM_ARGB64_GETG(bgcolor) >> 6);
> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE, DRM_ARGB64_GETB(bgcolor) >> 6);

There is FIELD_MODIFY() for a few cycles already.
But here it probably makes no much difference.

...

> +	seq_printf(s, "\tbackground color (10bpc): r=0x%x g=0x%x b=0x%x\n",
> +		   DRM_ARGB64_GETR(cstate->background_color) >> 6,
> +		   DRM_ARGB64_GETG(cstate->background_color) >> 6,
> +		   DRM_ARGB64_GETB(cstate->background_color) >> 6);

Probably you want to have the alternative to the DRM_ARGB64_GETx() macros which
incorporates a right-shift. But it all in regard to DRM style and preferences.

-- 
With Best Regards,
Andy Shevchenko


