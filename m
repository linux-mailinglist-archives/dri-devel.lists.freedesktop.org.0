Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BC0122B6C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 13:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EEC6E9C3;
	Tue, 17 Dec 2019 12:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC2089B78
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 12:25:35 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHCPSpQ090542;
 Tue, 17 Dec 2019 06:25:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576585528;
 bh=Z/R/pyRZuchnSwXz0Tfe9hsTD8at7dgkl1rixbHG+fE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QgMgD1BLAQTfgqQptMcpSwBYNlowylWvJHzOuDlwkU5aElTBX3/mYKLZyv1Jgi9ss
 I/vImNm0kiRf4V4tC1oqHDxQnzVyZXT9hZ79tt2f60AI6GJomzagYnx4xjG1IC9dHv
 NDYGBPIPyHz4YLC91bU6b2xqQcdvM+z2m3FZpZ3w=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHCPSda099057
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Dec 2019 06:25:28 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 06:25:27 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 06:25:26 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHCPPpB052376;
 Tue, 17 Dec 2019 06:25:25 -0600
Subject: Re: [PATCH v3 26/50] drm/omap: hdmi4: Rework EDID read to isolate
 data read
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-27-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <353701b5-203b-e864-25df-f37fd03d0005@ti.com>
Date: Tue, 17 Dec 2019 14:25:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191210225750.15709-27-laurent.pinchart@ideasonboard.com>
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
> In preparation of adding DRM bridge support to the hdmi4 encoder code,
> rework the EDID read to isolate data read.
> 
> The hdmi_read_edid() function is the main entry point. It performs all
> initialisation steps required prior to reading the EDID (such as
> ensuring the device is powered on), as well as corresponding cleanup
> steps afterwards. EDID read itself is handled by hdmi_read_edid_data()
> that calls the hdmi4_core_ddc_read() function to read individual blocks.
> 
> This new code architecture will allow reusing hdmi_read_edid() and
> hdmi4_core_ddc_read() for the drm_bridge EDID read implementation, while
> swapping out hdmi_read_edid_data() for the DRM drm_do_get_edid()
> function.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Expand commit message
> ---
>   drivers/gpu/drm/omapdrm/dss/hdmi4.c      | 94 +++++++++++++++---------
>   drivers/gpu/drm/omapdrm/dss/hdmi4_core.c | 59 +++------------
>   drivers/gpu/drm/omapdrm/dss/hdmi4_core.h |  4 +-
>   3 files changed, 73 insertions(+), 84 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
