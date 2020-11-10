Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB782AD1F8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 10:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217C189718;
	Tue, 10 Nov 2020 09:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518D189718
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 09:02:16 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AA92AMX103183;
 Tue, 10 Nov 2020 03:02:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604998930;
 bh=nocpfYYsYcHgrBneM/W9fOlYlDGGqLl6ysqyImDnKZc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=RkuFwHLaOFy0xA6lc+8XTlfIa3OBDWaDBI17P2xAeoTbvlzXAjnUazTgXE07PraLJ
 BqMMEL3pSE/gUhM1JhMyazD3AxGbvjQ+VPF9W4cXcqeVz7zc+whfXCNtFs1EhRf3SY
 +YkO84mtKbtkKB0lO9d/BkxdCoaDS4Lz5Fngq4Ok=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AA92Aux103899
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 03:02:10 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 03:02:10 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 03:02:10 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AA928fD111509;
 Tue, 10 Nov 2020 03:02:09 -0600
Subject: Re: [PATCH v2 0/6] drm/tidss: Use new connector model for tidss
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20201109170601.21557-1-nikhil.nd@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <090c939b-5da9-4625-b126-78dcd477cf2d@ti.com>
Date: Tue, 10 Nov 2020 11:02:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109170601.21557-1-nikhil.nd@ti.com>
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yuti Amonkar <yamonkar@cadence.com>, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikhil,

On 09/11/2020 19:05, Nikhil Devshatwar wrote:
> This series moves the tidss to using new connectoe model, where the 
> SoC driver (tidss) creates the connector and all the bridges are 
> attached with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR
> 
> Since the bridges do not create the connector, the bus format and
> bus_flag is set after the format negotiation.
> Support format negotiations in the tfp410 and mhdp bridge drivers
> as a first step before moving the connector model.
> 
> Nikhil Devshatwar (6):
>   drm: bridge: Propagate the bus flags from bridge->timings
>   drm/bridge: tfp410: Support format negotiation hooks
>   drm/bridge: mhdp8546: Add minimal format negotiation
>   drm/tidss: Set bus_format correctly from bridge/connector
>   drm/tidss: Move to newer connector model
>   drm/bridge: cdns-mhdp8546: Fix the interrupt enable/disable
> 
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 32 ++++++++++++++++--
>  drivers/gpu/drm/bridge/ti-tfp410.c            | 33 +++++++++++++++++++
>  drivers/gpu/drm/drm_bridge.c                  |  8 +++++
>  drivers/gpu/drm/tidss/tidss_drv.h             |  3 ++
>  drivers/gpu/drm/tidss/tidss_encoder.c         | 22 ++++++++-----
>  drivers/gpu/drm/tidss/tidss_kms.c             | 19 ++++++++++-
>  6 files changed, 106 insertions(+), 11 deletions(-)
> 

Please add a change log when sending new versions of a series.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
