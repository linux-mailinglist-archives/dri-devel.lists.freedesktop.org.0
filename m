Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2998D125DA3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 10:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F4F6EAE5;
	Thu, 19 Dec 2019 09:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D560A6EAE5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 09:27:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJ9ROe3046023;
 Thu, 19 Dec 2019 03:27:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576747644;
 bh=+k3wgg0v4z2kOxEjs5q43J+q/0wR8nGXEDMYNPy39cI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=fKl4BufAJoofvIE9xWG+3NstcHBjj/xFFqmSEsP7v1B6EgsOYdBEsePWQfaHT70fu
 1E7Omkk00ZxPFdUzh7NAzSAKiCQpB2QZehajY/uWp6LfDYVBt+n5TGJxkuKfbRBCtD
 r9VaO+0JNRE8TRNTnxdwzhC63meDUDqNv5bHN1AU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJ9RO9H087240
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Dec 2019 03:27:24 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 03:27:23 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 03:27:23 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJ9RLCj083745;
 Thu, 19 Dec 2019 03:27:21 -0600
Subject: Re: [PATCH v3 47/50] drm/omap: sdi: Register a drm_bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-48-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <7c748db2-ea49-3acf-34c6-c534c9f22772@ti.com>
Date: Thu, 19 Dec 2019 11:27:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191210225750.15709-48-laurent.pinchart@ideasonboard.com>
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
> In order to integrate with a chain of drm_bridge, the internal SDI
> output has to expose its operations through the drm_bridge API.
> Register a bridge at initialisation time to do so and remove the
> omap_dss_device operations that are now unused.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Remove unused omapdss_device_connector_type() function
> - Unregister bridge if port initialisation fails
> ---
>   drivers/gpu/drm/omapdrm/dss/base.c       |  23 ----
>   drivers/gpu/drm/omapdrm/dss/omapdss.h    |   1 -
>   drivers/gpu/drm/omapdrm/dss/sdi.c        | 168 +++++++++++++++--------
>   drivers/gpu/drm/omapdrm/omap_connector.c |  31 +----
>   4 files changed, 111 insertions(+), 112 deletions(-)

Do you have removal of the code in other files than sdi.c here in purpose? Can they be a separate 
patch after this?

Single comment below, but other than that (with the code together if needed, or in separate patches):

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>


> @@ -171,7 +144,7 @@ struct drm_connector *omap_connector_init(struct drm_device *dev,
>   	connector->doublescan_allowed = 0;
>   
>   	drm_connector_init(dev, connector, &omap_connector_funcs,
> -			   omap_connector_get_type(output));
> +			   DRM_MODE_CONNECTOR_DSI);

This is because DSI is the only legacy output left, and thus all omap_connectors are DSI connectors? 
Maybe a comment here to clarify.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
