Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A931247F8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 14:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6BA6E03F;
	Wed, 18 Dec 2019 13:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC906E03F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 13:22:20 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIDMFsL096324;
 Wed, 18 Dec 2019 07:22:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576675335;
 bh=g2N3tqufFKre+wsapn6A4JgouAqdm+Ul0mWFfXhiV2M=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Cum1EPgNEZKPZTelzS/OlQbV+lTs+z9a6Z1vCjUEguiyEb6R9wRfObUHXbMOSutRp
 O17d30m5P51rKmKt1ZrJNri+xSfVcutYyGSedBDilQ0U+KXXa/GDCZXNXGKPsBHOrs
 3Qo8J0my2vtxiEF8WXvnYGGP3Xw/AZVX+a4g8ebo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIDMFli004397;
 Wed, 18 Dec 2019 07:22:15 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 18
 Dec 2019 07:22:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 18 Dec 2019 07:22:14 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIDMCga113596;
 Wed, 18 Dec 2019 07:22:13 -0600
Subject: Re: [PATCH v3 36/50] drm/omap: Switch the HDMI and VENC outputs to
 drm_bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-37-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <79804166-0d6b-719c-c348-19b1524fe0ba@ti.com>
Date: Wed, 18 Dec 2019 15:22:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191210225750.15709-37-laurent.pinchart@ideasonboard.com>
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
> The TPD12S015, OPA362 and analog and HDMI connectors are now supported
> by DRM bridge drivers, and the omapdrm HDMI and VENC outputs can be
> handled through the drm_bridge API. Switch the outputs to drm_bridge by
> making the next bridge mandatory and removing the related
> omapdrm-specific display drivers.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/gpu/drm/omapdrm/displays/Kconfig      |  22 --
>   drivers/gpu/drm/omapdrm/displays/Makefile     |   4 -
>   .../omapdrm/displays/connector-analog-tv.c    |  97 --------
>   .../gpu/drm/omapdrm/displays/connector-hdmi.c | 183 ---------------
>   .../gpu/drm/omapdrm/displays/encoder-opa362.c | 137 -----------
>   .../drm/omapdrm/displays/encoder-tpd12s015.c  | 217 ------------------
>   drivers/gpu/drm/omapdrm/dss/hdmi4.c           |   4 +-
>   drivers/gpu/drm/omapdrm/dss/hdmi5.c           |   4 +-
>   .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   |   5 -
>   drivers/gpu/drm/omapdrm/dss/output.c          |   5 +
>   drivers/gpu/drm/omapdrm/dss/venc.c            |   4 +-
>   11 files changed, 11 insertions(+), 671 deletions(-)
>   delete mode 100644 drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c
>   delete mode 100644 drivers/gpu/drm/omapdrm/displays/connector-hdmi.c
>   delete mode 100644 drivers/gpu/drm/omapdrm/displays/encoder-opa362.c
>   delete mode 100644 drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c

I think it would be good to also change the omap2plus_defconfig in the same commit, to keep 
everything working.

Other than that:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
