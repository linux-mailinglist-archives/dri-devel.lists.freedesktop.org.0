Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7267F5B55B7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 10:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E9810E0C7;
	Mon, 12 Sep 2022 08:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0681910E0C7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662970109; x=1694506109;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=s7Jug/OnMCFhyd1q5xTwD79VDV4Ia8xhw4W5pOzqF7Q=;
 b=MEQ3TLzhtGQqdzXYsWqlKQN6v/HSr6ZXa+EqgMZF6JhqI93PqNdMegbg
 bHFtC1tvf3MoTovSMSXr9bhAz2nQwRbJL78FZEU+En2FibAlzT7X9pjCp
 yxFXhZchY68EXuY+Q2r9v/irFkMxvl84mrbBYhU2nOgZ6ukP0GWGzWoVv
 nZbEAHNnGTqr42ycjWKRJzxiYbf8sAWOCd1h3Xyf99ydgjb12VG8QkxRA
 eY3o8rGrfftXLgEazNz56LkULMkbweS9VETTqgJk4aT2tu7zYZKJMAy+G
 pcdybe7kn4KYlHidbTeLsBz9CI4vbIbIqNgeSBj6BlQfmup+SRzV4xn2X Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="277544365"
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="277544365"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 01:08:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="646358310"
Received: from abijaz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.58.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 01:08:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hamza Mahfooz <someguy@effective-light.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: it6505: use drm_debug_enabled() in
 it6505_debug_print()
In-Reply-To: <20220910224816.15058-1-someguy@effective-light.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220910224816.15058-1-someguy@effective-light.com>
Date: Mon, 12 Sep 2022 11:08:19 +0300
Message-ID: <875yht6mmk.fsf@intel.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Allen Chen <allen.chen@ite.com.tw>,
 Hamza Mahfooz <someguy@effective-light.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, Hermes Wu <hermes.wu@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 10 Sep 2022, Hamza Mahfooz <someguy@effective-light.com> wrote:
> As made mention of in commit 9f0ac028410f ("drm/print: rename drm_debug
> to __drm_debug to discourage use"), we shouldn't explicitly refer to
> __drm_debug in this context. So, use drm_debug_enabled() instead.
>
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 4b673c4792d7..875f87c576cb 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -554,7 +554,7 @@ static void it6505_debug_print(struct it6505 *it6505, unsigned int reg,
>  	struct device *dev = &it6505->client->dev;
>  	int val;
>  
> -	if (likely(!(__drm_debug & DRM_UT_DRIVER)))
> +	if (!drm_debug_enabled(DRM_UT_DRIVER))
>  		return;
>  
>  	val = it6505_read(it6505, reg);

-- 
Jani Nikula, Intel Open Source Graphics Center
