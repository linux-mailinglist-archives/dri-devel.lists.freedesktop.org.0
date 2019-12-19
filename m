Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E55125C8F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 09:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EA46EAD7;
	Thu, 19 Dec 2019 08:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2016EAD7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 08:26:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJ8PsXU086830;
 Thu, 19 Dec 2019 02:25:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576743954;
 bh=5KDIJ42i31T6WMH1sYBRk6YC7D/eGr7gTpL+S0kfvSI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uC92ASO1WeSw8crMC8f/t66ux202+Pa+/06T3dFdhEPTe3oxsUJjTvwjaJYqS7tAd
 Nt8uSc4tlNwbRsHKEYKNP297zMcBfuqBQLUaToRXPDgjOPNNXtBVQKEkM6YWgoZoT7
 PAprJxs5ZI+yZL7F1CnL7G3kAuZagCXFPgVFhJmA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJ8Ps3k089836
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Dec 2019 02:25:54 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 02:25:53 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 02:25:54 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJ8Pqjn110882;
 Thu, 19 Dec 2019 02:25:52 -0600
Subject: Re: [PATCH v3 37/50] drm/omap: Remove HPD, detect and EDID omapdss
 operations
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-38-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <33a6ec08-2447-942e-7848-608a1a0cd1e9@ti.com>
Date: Thu, 19 Dec 2019 10:25:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191210225750.15709-38-laurent.pinchart@ideasonboard.com>
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
> Due to the removal of several omapdrm display drivers, the omapdss HPD,
> detected and EDID operations are not used anymore. Remove them and all
> related code.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/gpu/drm/omapdrm/dss/hdmi4.c      |  61 --------
>   drivers/gpu/drm/omapdrm/dss/hdmi5.c      |  46 ------
>   drivers/gpu/drm/omapdrm/dss/omapdss.h    |  25 +--
>   drivers/gpu/drm/omapdrm/omap_connector.c | 190 +++--------------------
>   drivers/gpu/drm/omapdrm/omap_connector.h |   2 -
>   drivers/gpu/drm/omapdrm/omap_drv.c       |   8 +-
>   6 files changed, 22 insertions(+), 310 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
