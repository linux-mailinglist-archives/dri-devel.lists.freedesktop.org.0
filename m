Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253DA1ECFDA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 14:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D6F89BA1;
	Wed,  3 Jun 2020 12:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1331289BB0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 12:33:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 053CXlW0106513;
 Wed, 3 Jun 2020 07:33:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591187627;
 bh=M1WLgsB/SXIxgPgMCUsfddSCaUg3DosSo3K0GUtPR8k=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=XEMFGjwTtPlC2aXThydcOTlnENH3ZAIUrOvPwGB7xWpkvHHm3XMJqa0lvQwCbCJ/F
 LbFchZFF8h0TImyM/WdSZQHH+i0QBJVPRh/5KVDKbr/bVA/5n5rZvdCuLyTuxwDUck
 0KcquY5GMJNVdi46O9eFCoRth4rLgt9XqlKW2/N4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 053CXlqF115353
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Jun 2020 07:33:47 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 3 Jun
 2020 07:33:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 3 Jun 2020 07:33:47 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 053CXhNO005965;
 Wed, 3 Jun 2020 07:33:44 -0500
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
To: Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
Date: Wed, 3 Jun 2020 15:33:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200531193941.13179-2-tony@atomide.com>
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suman Anna <s-anna@ti.com>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tony,

On 31/05/2020 22:39, Tony Lindgren wrote:
> When booting without legacy platform data, we no longer have omap_device
> calling PM runtime suspend for us on suspend. This causes the driver
> context not be saved as we have no suspend and resume functions defined.
> 
> Let's fix the issue by switching over to use UNIVERSAL_DEV_PM_OPS as it
> will call the existing PM runtime suspend functions on suspend.

I don't think we can use UNIVERSAL_DEV_PM_OPS, as we can't disable DSS modules in any order, but 
things have to be shut down in orderly manner.

omapdrm hasn't relied on omap_device calling runtime suspend for us (I didn't know it does that). We 
have system suspend hooks in omap_drv.c:

SIMPLE_DEV_PM_OPS(omapdrm_pm_ops, omap_drm_suspend, omap_drm_resume)

omap_drm_suspend() is supposed to turn off the displays, which then cause dispc_runtime_put (and 
other runtime_puts) to be called, which result in dispc_runtime_suspend (and other runtime PM suspends).

So... For some reason that's no longer happening? I need to try to find a board with which 
suspend/resume works (without DSS)...

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
