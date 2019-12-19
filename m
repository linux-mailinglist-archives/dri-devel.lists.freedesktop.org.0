Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0167C125D81
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 10:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253FA6EAE4;
	Thu, 19 Dec 2019 09:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402FE6EAE5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 09:21:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJ9L65O013213;
 Thu, 19 Dec 2019 03:21:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576747266;
 bh=pKinLKdsXOgfv0VviIgvjbL67ZVF2HiAzR7LqJOOAjE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=X33KEBMV7JBDFHSM1/EZ5pJNRwLJ8SQoZgpv4hjJFnXRwdQKk8T2vb4tfJAnNJSZy
 02/gHq6MFbaQZ6E5+oqJN2/xv94YcyWrKelSLpxkFKrF4XZIVTqsSVW+spAN6xbQPW
 cbAif3BDNSrcFQnmIU5wXlDnKVEBLnCUE8CucZxY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJ9L5j7077255
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Dec 2019 03:21:06 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 03:21:05 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 03:21:05 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJ9L3dq072093;
 Thu, 19 Dec 2019 03:21:04 -0600
Subject: Re: [PATCH v3 45/50] drm/omap: dpi: Register a drm_bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-46-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <8f7e454b-4d63-37cf-ef83-77e23e90e07d@ti.com>
Date: Thu, 19 Dec 2019 11:21:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191210225750.15709-46-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/12/2019 00:57, Laurent Pinchart wrote:
> In order to integrate with a chain of drm_bridge, the internal DPI
> output has to expose its operations through the drm_bridge API.
> Register a bridge at initialisation time to do so and remove the
> omap_dss_device operations that are now unused.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Unregister bridge if port initialisation fails
> ---
>   drivers/gpu/drm/omapdrm/dss/dpi.c | 197 ++++++++++++++++++------------
>   1 file changed, 119 insertions(+), 78 deletions(-)

I don't think DPI is really a bridge, as it's really just direct output from the DISPC (level 
shifted). But that probably doesn't matter, and bridge is a good way to manage the DPI output.

> +static void dpi_bridge_mode_set(struct drm_bridge *bridge,
> +				 const struct drm_display_mode *mode,
> +				 const struct drm_display_mode *adjusted_mode)
> +{
> +	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
> +
> +	mutex_lock(&dpi->lock);
> +	dpi->pixelclock = adjusted_mode->clock * 1000;
> +	mutex_unlock(&dpi->lock);
> +}

What's the lock protecting? Why do we lock here, but not e.g. in mode_fixup?

Do we ever get drm_bridge_funcs calls from multiple threads at the same time? Is there a difference 
between having a single DPI output, or multiple DPI outputs (i.e. can two different DPI outputs get 
calls simultaneously?).

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
