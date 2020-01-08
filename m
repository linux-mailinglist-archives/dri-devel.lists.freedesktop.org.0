Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F1C13478B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 17:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137C388161;
	Wed,  8 Jan 2020 16:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0541C88161
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 16:18:31 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008GIPrI043113;
 Wed, 8 Jan 2020 10:18:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578500305;
 bh=IPNoriE5Ifxbl+JvBH+GwGiXCzj2PCyX80up/L46dYs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=iTsCRjKy6ybXHNfKUMaw27KNbV0b0l/WpePQFQiP9HSQSXCyi+RnIJWoMjvz8eQnz
 M4muXfj/GP6WCSe705n7AwxwyNV/QhdGt4Kg8JMT5+ukQrAHyTuE9pH8Eu65bUO8nW
 sGboQObtxR2rhp4VcFf2mZbIk41c5do5qKI5Jf2A=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 008GIOkQ100956
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 8 Jan 2020 10:18:25 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 10:18:23 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 10:18:23 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008GILY8030471;
 Wed, 8 Jan 2020 10:18:22 -0600
Subject: Re: [PATCH v4 05/51] drm/bridge: Extend bridge API to disable
 connector creation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
 <20191219104522.9379-6-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <115b7f72-3d46-0257-75a0-e5af51da7234@ti.com>
Date: Wed, 8 Jan 2020 18:18:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219104522.9379-6-laurent.pinchart@ideasonboard.com>
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

On 19/12/2019 12:44, Laurent Pinchart wrote:
> Most bridge drivers create a DRM connector to model the connector at the
> output of the bridge. This model is historical and has worked pretty
> well so far, but causes several issues:
> 
> - It prevents supporting more complex display pipelines where DRM
> connector operations are split over multiple components. For instance a
> pipeline with a bridge connected to the DDC signals to read EDID data,
> and another one connected to the HPD signal to detect connection and
> disconnection, will not be possible to support through this model.
> 
> - It requires every bridge driver to implement similar connector
> handling code, resulting in code duplication.
> 
> - It assumes that a bridge will either be wired to a connector or to
> another bridge, but doesn't support bridges that can be used in both
> positions very well (although there is some ad-hoc support for this in
> the analogix_dp bridge driver).
> 
> In order to solve these issues, ownership of the connector should be
> moved to the display controller driver (where it can be implemented
> using helpers provided by the core).
> 
> Extend the bridge API to allow disabling connector creation in bridge
> drivers as a first step towards the new model. The new flags argument to
> the bridge .attach() operation allows instructing the bridge driver to
> skip creating a connector. Unconditionally set the new flags argument to
> 0 for now to keep the existing behaviour, and modify all existing bridge
> drivers to return an error when connector creation is not requested as
> they don't support this feature yet.
> 
> The change is based on the following semantic patch, with manual review
> and edits.
> 
> @ rule1 @
> identifier funcs;
> identifier fn;
> @@
>   struct drm_bridge_funcs funcs = {
>   	...,
>   	.attach = fn
>   };
> 
> @ depends on rule1 @
> identifier rule1.fn;
> identifier bridge;
> statement S, S1;
> @@
>   int fn(
>   	struct drm_bridge *bridge
> +	, enum drm_bridge_attach_flags flags
>   )
>   {
>   	... when != S
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +		DRM_ERROR("Fix bridge driver to make connector optional!");
> +		return -EINVAL;
> +	}
> +
>   	S1
>   	...
>   }
> 
> @ depends on rule1 @
> identifier rule1.fn;
> identifier bridge, flags;
> expression E1, E2, E3;
> @@
>   int fn(
>   	struct drm_bridge *bridge,
>   	enum drm_bridge_attach_flags flags
>   ) {
>   <...
>   drm_bridge_attach(E1, E2, E3
> +	, flags
>   )
>   ...>
>   }
> 
> @@
> expression E1, E2, E3;
> @@
>   drm_bridge_attach(E1, E2, E3
> +	, 0
>   )
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
