Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F467DD122
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB7C10E53D;
	Tue, 31 Oct 2023 16:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0ECE10E53D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:03:23 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39VG31fm016531;
 Tue, 31 Oct 2023 11:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1698768181;
 bh=d6XCKoIX+3E3TBFJdEYzPt7lI+PEkS1xWwCznuSQDKE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=UFmdfjm6Gj8t/1emNUaYxJZf+UCy8IWYrgPnG8RGmVweNfVz/xUs0XLlknY4mFw5z
 7cdEccnOoYSimkxg/hJRybPeZhc+XuxHPR/mJs2018VQ4Pwq0yJTmAaufWR0GJTd0w
 wDPYySna7tM1Hdv56IEJxr1DcQ6zNG9yIS+v+7/E=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39VG31an079771
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 31 Oct 2023 11:03:01 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 31
 Oct 2023 11:03:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 31 Oct 2023 11:03:01 -0500
Received: from [10.249.132.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39VG2p9X103201;
 Tue, 31 Oct 2023 11:02:52 -0500
Message-ID: <a3985aca-c5a9-c0e9-f30d-79ba0196e094@ti.com>
Date: Tue, 31 Oct 2023 21:32:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] drm/bridge: tc358767: Fix link properties discovery
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jan Kiszka
 <jan.kiszka@siemens.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231031-tc358767-v1-0-392081ad9f4b@ideasonboard.com>
 <20231031-tc358767-v1-2-392081ad9f4b@ideasonboard.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20231031-tc358767-v1-2-392081ad9f4b@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 31-Oct-23 18:56, Tomi Valkeinen wrote:
> When a display controller driver uses DRM_BRIDGE_ATTACH_NO_CONNECTOR,
> tc358767 will behave properly and skip the creation of the connector.
> 
> However, tc_get_display_props(), which is used to find out about the DP
> monitor and link, is only called from two places: .atomic_enable() and
> tc_connector_get_modes(). The latter is only used when tc358767 creates
> its own connector, i.e. when DRM_BRIDGE_ATTACH_NO_CONNECTOR is _not_
> set.
> 
> Thus, the driver never finds out the link properties before get_edid()
> is called. With num_lanes of 0 and link_rate of 0 there are not many
> valid modes...
> 
> Fix this by adding tc_connector_get_modes() call at the beginning of
> get_edid(), so that we have up to date information before looking at the
> modes.
> 
> Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
> Closes: https://lore.kernel.org/all/24282420-b4dd-45b3-bb1c-fc37fe4a8205@siemens.com/
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---

Thank you, Tomi, for quickly debugging this!

Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>

Regards
Aradhya

>  drivers/gpu/drm/bridge/tc358767.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 0affcefdeb1c..137a9f5e3cad 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1579,6 +1579,13 @@ static struct edid *tc_get_edid(struct drm_bridge *bridge,
>  				struct drm_connector *connector)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
> +	int ret;
> +
> +	ret = tc_get_display_props(tc);
> +	if (ret < 0) {
> +		dev_err(tc->dev, "failed to read display props: %d\n", ret);
> +		return 0;
> +	}
>  
>  	return drm_get_edid(connector, &tc->aux.ddc);
>  }
> 

