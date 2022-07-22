Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0B757E1B5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 14:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621B618B957;
	Fri, 22 Jul 2022 12:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2317014B273
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 12:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658494570; x=1690030570;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9+dXXFg3dVNO+F5OFKMuAstg6hlbJQ2O+VxxMLytHfc=;
 b=fSVt9b/NqXyj2UpChIx+sVeTIEqlyW43u/6AzZ4hTKaQhLCHXkAI4iwV
 hWF/ogrctjY6RYl4bxpaBLrTpadjJ8wKtNQGFJUfYM23DlTC1tRjAp22P
 gx6ELeRhRsyGPes9OdhIZkt+DR+YStDziUuq4eakIQTnaadQpwA/VYEdu
 5RfIpLId72gQESbsSyIVpSXevx+cONmQJrDQg4OsZ44DIgO3wT+jTa0AM
 nF7y0GwwWyTEK1ghMM7aXcC/gxcincwFdGah3v8Zzb3UoFjBVoqghU3BG
 gMS0aPS4gb8JOqvI699sIQG+0bHsAAbDNs/h0zQO4qll/3AKLkrP186uY g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="267702380"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="267702380"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 05:56:08 -0700
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="574160416"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.22.123])
 ([10.213.22.123])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 05:56:05 -0700
Message-ID: <6bb802aa-20d1-eb19-6946-66b8978c3699@intel.com>
Date: Fri, 22 Jul 2022 14:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Use dev_err_probe() to avoid
 polluting the log
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220722074755.660258-1-javierm@redhat.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220722074755.660258-1-javierm@redhat.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Erico Nunes <ernunes@redhat.com>, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Enric Balletbo i Serra <eballetbo@redhat.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22.07.2022 09:47, Javier Martinez Canillas wrote:
> If devm_drm_of_get_bridge() can't find the connected bridge, it returns an
> ERR_PTR(-EPROBE_DEFER) to indicate that the probe should be deferred.
>
> But this path also prints an error message, which pollutes the kernel log
> since is printed on every probe deferral, i.e:
>
>    $ dmesg | grep "failed to create panel bridge" | wc -l
>    38
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 369bf72717f6..90bbabde1595 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1206,10 +1206,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>   	int ret;
>   
>   	pdata->next_bridge = devm_drm_of_get_bridge(pdata->dev, np, 1, 0);
> -	if (IS_ERR(pdata->next_bridge)) {
> -		DRM_ERROR("failed to create panel bridge\n");
> -		return PTR_ERR(pdata->next_bridge);
> -	}
> +	if (IS_ERR(pdata->next_bridge))
> +		return dev_err_probe(pdata->dev, PTR_ERR(pdata->next_bridge),
> +				     "failed to create panel bridge\n");
>   
>   	ti_sn_bridge_parse_lanes(pdata, np);
>   

