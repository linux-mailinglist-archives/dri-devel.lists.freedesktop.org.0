Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E079D122B02
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 13:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25306E9BB;
	Tue, 17 Dec 2019 12:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDBD6E9BB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 12:13:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHCD2as111587;
 Tue, 17 Dec 2019 06:13:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576584782;
 bh=C6wjnEYwARPDQQZrr98wLf7N6pvIGzeCg9Pd9LSs4tc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=JHVRIpzvqljT5PFWJQk/aKZhPhMnjF/gj1VGaQaL87TpoA0Du/DK/Ssv3Qi5q0TxG
 Rqpf1GQS/dnXdb+thN3Q+1If5zkxeWNjtYp9bjo63921va9UMIdC8XbFbfDyTEAlZo
 XJEkXTIgItJZRHCB25DHTnCHdeh3FSg2ihVH/Fj0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHCD2mu082886
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Dec 2019 06:13:02 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 06:13:01 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 06:13:01 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHCCxPX034426;
 Tue, 17 Dec 2019 06:13:00 -0600
Subject: Re: [PATCH v3 05/50] drm/bridge: Extend bridge API to disable
 connector creation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-6-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2a52470e-4663-ae58-aece-a91469ce6b5d@ti.com>
Date: Tue, 17 Dec 2019 14:12:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191210225750.15709-6-laurent.pinchart@ideasonboard.com>
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
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return -EINVAL;
> +

Should there be a dev_err or such here? This should only happen when your setting up a new board, 
and you try to use a bridge that doesn't support no-connector-mode yet, right?

I hit this when trying out AM4 EVM with SiI9022 driver. It wasn't too difficult to pinpoint where 
the failure happens, but an error would have made it immediately obvious.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
