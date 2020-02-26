Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E4F16FEC8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 13:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C396B89D44;
	Wed, 26 Feb 2020 12:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C7689D44
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 12:21:10 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QCKmbi123963;
 Wed, 26 Feb 2020 06:20:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582719648;
 bh=qlL4/NrEVczHiHEVcaPdYRtPNX+h7wkHeQ1TLgT5TlY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=j+TULsTvk2t2CfX6AltqpL5mwQzkeg3k+r+vOsXM7q/HkoPsMMJ0VaVyRbbyozWLr
 CNoFZVsEwmjETPvFRLdELVsemIb/IG7TNdGDmy8iEbMjRXTg/6L+NLLbKgNK7h8VYC
 HX4ZT7J3SsEYeWxZfnFPb46rb7wenCuPP8PAeXM4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01QCKmYM089759
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Feb 2020 06:20:48 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 06:20:48 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 06:20:48 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01QCKkej041497;
 Wed, 26 Feb 2020 06:20:46 -0600
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
To: Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200225001011.GF37466@atomide.com>
 <20200225022822.wh7omykthv7skojy@earth.universe>
 <20200225154237.GH37466@atomide.com>
 <20200225230124.fkt35ihyjnokb2ng@earth.universe>
 <20200225230937.GL37466@atomide.com>
 <20200225235243.dr2apisbxzugj34u@earth.universe>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <fb8d5060-251d-a4b2-6250-2a4f10e1bb9a@ti.com>
Date: Wed, 26 Feb 2020 14:20:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225235243.dr2apisbxzugj34u@earth.universe>
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/02/2020 01:52, Sebastian Reichel wrote:

> Well for now let's get Laurent's and my series forward. I think
> the next step would be to get rid of omap_encoder by moving the
> encoder init into the DSS output code. Technically we are already
> merging omapdrm and omapdss, e.g. omap_connector is gone from
> omapdrm after the series.

After Laurent's series (now pushed) and this one, we can turn omapdrm into a single module, as it's 
supposed to be.

I don't see a point in trying to change DSS internal encoders into separate modules, as they're all 
under DSS, and at times connected in ways which are not easily represented with generic APIs. In 
theory it should be possible, but I don't see any real benefit in such work.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
