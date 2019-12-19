Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12587126116
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 12:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D456EB51;
	Thu, 19 Dec 2019 11:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461EE6EB51
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 11:41:56 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJBfoLU104245;
 Thu, 19 Dec 2019 05:41:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576755710;
 bh=wuP0ZWesLf5o8dVcHM9/GIf8LrZvjfCnulppjJekFR4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=zRwVTLJsCkKOOT5UORuMp/1UHJrfdagOeEG4dOuBfNNEhEnAL28XslWiyfs2m8I8I
 WouwXF8gKGwjyYqKNmUuBUqA1DJZi4yB4WoBttqsDqH2vXeDNPtVUpCuoVh5KTXxSq
 ZX27mupfLpPsAeIszh3NEGqecXvfZbrsLQmcknRE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJBfoe5112875;
 Thu, 19 Dec 2019 05:41:50 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 05:41:49 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 05:41:49 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJBfliP071667;
 Thu, 19 Dec 2019 05:41:48 -0600
Subject: Re: [PATCH v4 34/51] drm/omap: venc: Register a drm_bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
 <20191219104522.9379-35-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c7372ffc-d6f6-8696-6eab-9cfe16d75005@ti.com>
Date: Thu, 19 Dec 2019 13:41:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219104522.9379-35-laurent.pinchart@ideasonboard.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 19/12/2019 12:45, Laurent Pinchart wrote:
> In order to integrate with a chain of drm_bridge, the internal VENC
> encoder has to expose the mode valid, fixup and set, the enable and
> disable and the get modes operations through the drm_bridge API.
> Register a bridge at initialisation time to do so.
> 
> Most of those operations are removed from the omap_dss_device as they
> are now called through the drm_bridge API by the DRM atomic helpers. The
> only exception is the .get_modes() operation that is still invoked
> through the omap_dss_device-based pipeline.
> 
> For the time being make the next bridge in the chain optional as the
> VENC output is still based on omap_dss_device. The create_connector
> argument to the bridge attach function is also ignored for the same
> reason. This will be changed later when removing the related
> omapdrm-specific display drivers.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Something with venc is different than without your series.

I have beagleboard xm, with both DVI and s-video connected. With and without your series, kmsprint shows:

Connector 0 (45) DVI-D-1 (connected)
  Encoder 0 (44) TMDS
    Crtc 0 (47) 1920x1200 154.000 1920/48/32/80 1200/3/6/26 60 (59.95)
      Plane 0 (32) fb-id: 51 (crtcs: 0 1) 0,0 1920x1200 -> 0,0 1920x1200 (RX12 AR12 RG16 XR24 RG24 AR24 RA24 RX24)
        FB 51 1920x1200
Connector 1 (48) S-Video-1 (unknown)
  Encoder 1 (46) TMDS

Without your series:

# ./kmstest -c s-video
Connector 1/@48: S-Video-1
  Crtc 1/@49: 720x574i@50.00 13.500 720/12/64/68/- 574/5/5/41/- 50 (50.00) 0x1a 0x48
  Plane 0/@32: 0,0-720x574
    Fb 53 720x574-XR24
press enter to exit

and I have a picture on the display.

With your series:

# ./kmstest -c s-video
terminate called after throwing an instance of 'std::invalid_argument'
  what():  no modes available

To be honest, I'm not quite sure how an unknown-connection output should work (maybe kmstest doesn't handle it right), but the behavior is different.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
