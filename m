Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFB2C5EE76
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 19:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C59110E26F;
	Fri, 14 Nov 2025 18:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="arM0DeMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F5810E26F;
 Fri, 14 Nov 2025 18:43:44 +0000 (UTC)
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de
 [217.229.151.199]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 983CA2FC0055;
 Fri, 14 Nov 2025 19:43:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1763145822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIh2yxRQ6myZOupH3MgrEF6f57VtS9hajQqNYl8br/0=;
 b=arM0DeMjR4Pa23wxqYQ/czrRnMyTd8G97pRqUlcd1nYHX7DaGbj5OxGL6nmKNQj9+ZmPTj
 bFxTUip51zrk2hcLEoyd3ihwCHgeGobPvx2r3AdyaNs2v/LfMwC6Zsn0D2uHSReCTOtBwy
 kw+EJ96EhoJzWvnrtFzOHMqXnzBcQ68=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <2531c69c-2b56-40db-8344-62a4613b2641@tuxedocomputers.com>
Date: Fri, 14 Nov 2025 19:43:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/i915/display: Add quirk to force backlight type
 on some TUXEDO devices
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250411171756.142777-1-wse@tuxedocomputers.com>
 <20250411171756.142777-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20250411171756.142777-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Am 11.04.25 um 17:55 schrieb Werner Sembach:
> <snip>
> -	switch (display->params.enable_dpcd_backlight) {
> +	enable_dpcd_backlight = display->params.enable_dpcd_backlight;
> +	if (enable_dpcd_backlight == INTEL_DP_AUX_BACKLIGHT_AUTO &&
> +	    intel_has_quirk(display, QUIRK_AUO_12701_21229_ENABLE_DPCD_BACKLIGHT)) {
> +		pnl_id = drm_edid_get_panel_id(panel->fixed_edid);
> +		if (pnl_id == drm_edid_encode_panel_id('A', 'U', 'O', 0x319d) ||
> +		    pnl_id == drm_edid_encode_panel_id('A', 'U', 'O', 0x52ed))

So I looked into this patch again to build a v2 and found "static const struct 
intel_dpcd_quirk intel_dpcd_quirks[]" in 
drivers/gpu/drm/i915/display/intel_quirks.c which sounds like it can select 
quirks based on panels, making this pnl_id check obsolete.

But I now wasted half a day trying to find out how I can get the SINK_OUI and 
SINK_DEVICE_ID out of a device.

Is there some way to read that from sysfs or debugfs?

> <snip>
