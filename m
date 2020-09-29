Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED5627C17E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 11:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFD689153;
	Tue, 29 Sep 2020 09:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C8989153
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:43:00 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08T9gvQu044858;
 Tue, 29 Sep 2020 04:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601372577;
 bh=7X6UOy9Ljly4fw9I4SvFvDA2/4fvwOIdv5KF83tV5Pk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=vUnlZ4Wci9u0p9RHc3Krzw5SwvfyO4ZA2atk5/mq038lkjEs2296BQxP7PPqsD471
 QMLPDdFqw1RrooGK9zy/9vn0dmkP8OKA3H/LNwQjZcn6FmZ6x5/e5O5iGxB40FYskv
 Duv281Q9S6X7gV45u4zHD3nQhNQcoaf3hSSNEPMU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08T9gvR3127411;
 Tue, 29 Sep 2020 04:42:57 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 29
 Sep 2020 04:42:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 29 Sep 2020 04:42:57 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08T9gtoU077268;
 Tue, 29 Sep 2020 04:42:56 -0500
Subject: Re: [PATCH v2 2/2] drm/tilcdc: Remove tilcdc_crtc_max_width(), use
 private data
To: Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1600618063.git.jsarha@ti.com>
 <e0ba675fa03acf01a3cb19f108b80a02531b5e9f.1600618063.git.jsarha@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2627db5b-61f1-ec2e-1ae5-6b0c2cf7f319@ti.com>
Date: Tue, 29 Sep 2020 12:42:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e0ba675fa03acf01a3cb19f108b80a02531b5e9f.1600618063.git.jsarha@ti.com>
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
Cc: laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/09/2020 19:59, Jyri Sarha wrote:
> We already have a private data member for maximum display width so
> let's use it and get rid of the redundant tilcdc_crtc_max_width().
> 
> The LCDC version probing is moved to before reading the device tree
> properties so that the version information is available when private
> data maximum width is initialized, if "max-width" property is not
> found.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 16 +-----------
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c  | 38 +++++++++++++++-------------
>  drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  7 ++---
>  3 files changed, 26 insertions(+), 35 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
