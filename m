Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D302D9AA7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 16:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91A46E210;
	Mon, 14 Dec 2020 15:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 5562 seconds by postgrey-1.36 at gabe;
 Mon, 14 Dec 2020 15:16:12 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5786E210
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 15:16:11 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BEDgPtN002909; Mon, 14 Dec 2020 14:43:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=TVpwQug2MEJ0SxWMex2eJhvt/IulQmsAXk3Vw6N0ro8=;
 b=0iJbcajq1hibERnA4wbymAhIfI/T2cA4UJFnDYTGUXuoH4XuMxYKI9wE+oIx7VEIC5az
 fbsoudc5wxWM05O7YA74HYZP7hGSkw82jSKjNUE2FTqzPalAlLDO1NWjhr727Vs9m70y
 Hsx4X7oEog2i4zHb/tz0rem0GQXccZ9fn/YlkE6Zm2t/KDaMLPLde7yOx9vPCj2QcG+m
 cPuwTrRHaUjrVAwUxtM2KLRsrwwt25DRPu955H8cTvfUsIdUsvHJOlHBdufBr3+svK/G
 yAOOkEZWkTUpcELb6KhLK5Z2mUBLSdB9hEnNZN3Rz8g+p1tYyV9wLfTAb6mFT523PF7t Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cpxjkc0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 14:43:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A641710002A;
 Mon, 14 Dec 2020 14:43:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C5BE279AF9;
 Mon, 14 Dec 2020 14:43:06 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 14 Dec
 2020 14:43:06 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Mon, 14 Dec 2020 14:43:06 +0100
From: Philippe CORNU <philippe.cornu@st.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 1/2] drm: automatic legacy gamma support
Thread-Topic: [PATCH v4 1/2] drm: automatic legacy gamma support
Thread-Index: AQHWz7LPCp/qhzT7HU6VI1o8CUv9eKn2jekA
Date: Mon, 14 Dec 2020 13:43:05 +0000
Message-ID: <8f1ba8f5-1b49-db8f-3503-f482c8bd443a@st.com>
References: <20201211114237.213288-1-tomi.valkeinen@ti.com>
 <20201211114237.213288-2-tomi.valkeinen@ti.com>
In-Reply-To: <20201211114237.213288-2-tomi.valkeinen@ti.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <BC82AAD9139ECE4C8A7FF20F85CB2594@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-14_05:2020-12-11,
 2020-12-14 signatures=0
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
Cc: Paul
 Cercueil <paul@crapouillou.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>,
 Sandy Huang <hjc@rock-chips.com>, Yannick FERTRE <yannick.fertre@st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,


On 12/11/20 12:42 PM, Tomi Valkeinen wrote:
> To support legacy gamma ioctls the drivers need to set
> drm_crtc_funcs.gamma_set either to a custom implementation or to
> drm_atomic_helper_legacy_gamma_set. Most of the atomic drivers do the
> latter.
> 
> We can simplify this by making the core handle it automatically.
> 
> Move the drm_atomic_helper_legacy_gamma_set() functionality into
> drm_color_mgmt.c to make drm_mode_gamma_set_ioctl() use
> drm_crtc_funcs.gamma_set if set or GAMMA_LUT property if not.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 -
>   .../gpu/drm/arm/display/komeda/komeda_crtc.c  |   1 -
>   drivers/gpu/drm/arm/malidp_crtc.c             |   1 -
>   drivers/gpu/drm/armada/armada_crtc.c          |   1 -
>   drivers/gpu/drm/ast/ast_mode.c                |   1 -
>   .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |   1 -
>   drivers/gpu/drm/drm_atomic_helper.c           |  70 -----------
>   drivers/gpu/drm/drm_color_mgmt.c              | 111 ++++++++++++++++--
>   drivers/gpu/drm/i915/display/intel_display.c  |   1 -
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   2 -
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   1 -
>   drivers/gpu/drm/nouveau/dispnv50/head.c       |   2 -
>   drivers/gpu/drm/omapdrm/omap_crtc.c           |   1 -
>   drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |   1 -
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |   1 -
>   drivers/gpu/drm/stm/ltdc.c                    |   1 -

For the stm part,
Reviewed-by: Philippe Cornu <philippe.cornu@st.com>

Thank you
Philippe :-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
