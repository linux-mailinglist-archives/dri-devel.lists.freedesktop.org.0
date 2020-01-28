Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEA714B370
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 12:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E186EDD7;
	Tue, 28 Jan 2020 11:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF36A6EDD7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 11:20:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00SBJtNt109837;
 Tue, 28 Jan 2020 05:19:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1580210395;
 bh=swVa5c4u6qLCUKUsqKbEyQEnF/t26KSVtxcZXBxbYUA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qyJReMxGtqsze1upjDTRFQU9gA/lg2v28wUghnFPU2LA/PzBLIYt5NI4mZzC39TqS
 EZxNu5SJDm/foKr6dv5zB2vvsd7hmG7kYMcWneGJngTCJh8YSwV8BfQZC32njDeQbG
 tFXz+t/pNspsz1T3J05I/Kg216i6LrWyUDE5rZz8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00SBJt69032356
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 Jan 2020 05:19:55 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 28
 Jan 2020 05:19:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 28 Jan 2020 05:19:54 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00SBJrNj017786;
 Tue, 28 Jan 2020 05:19:53 -0600
Subject: Re: [PATCH v5 17/52] drm: Add helper to create a connector for a
 chain of bridges
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
 <20200124035445.1830-18-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a3e8855c-ebb2-b72b-0e16-8f34a45df5a3@ti.com>
Date: Tue, 28 Jan 2020 13:19:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200124035445.1830-18-laurent.pinchart@ideasonboard.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 24/01/2020 05:54, Laurent Pinchart wrote:

> +struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> +						struct drm_encoder *encoder)
> +{
> +	struct drm_bridge_connector *bridge_connector;
> +	struct drm_connector *connector;
> +	struct i2c_adapter *ddc = NULL;
> +	struct drm_bridge *bridge;
> +	int connector_type;
> +
> +	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
> +	if (!bridge_connector)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bridge_connector->encoder = encoder;
> +
> +	/*
> +	 * TODO: Handle doublescan_allowed, stereo_allowed and
> +	 * ycbcr_420_allowed.
> +	 */
> +	connector = &bridge_connector->base;
> +	connector->interlace_allowed = true;
> +
> +	/*
> +	 * Initialise connector status handling. First locate the furthest
> +	 * bridges in the pipeline that support HPD and output detection. Then
> +	 * initialise the connector polling mode, using HPD if available and
> +	 * falling back to polling if supported. If neither HPD nor output
> +	 * detection are available, we don't support hotplug detection at all.
> +	 */
> +	connector_type = DRM_MODE_CONNECTOR_Unknown;
> +	drm_for_each_bridge_in_chain(encoder, bridge) {
> +		if (bridge->interlace_allowed)
> +			connector->interlace_allowed = false;

This doesn't work on Beagle-xM's venc output.

The above test should be !bridge->interlace_allowed.

But that doesn't solve it fully. We have VENC and display-connector as bridges in the beagle's VENC 
output path. Only VENC is marked as interlace_allowed.

Setting "conn->bridge.interlace_allowed = true;" in display_connector_probe got the VENC output 
working. But what's the correct fix here? set interlace_allowed based on connector type?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
