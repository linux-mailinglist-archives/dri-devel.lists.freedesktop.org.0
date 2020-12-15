Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C950C2DAA98
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED1089F99;
	Tue, 15 Dec 2020 10:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3417289F99
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:05:47 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFA5VYU128248;
 Tue, 15 Dec 2020 04:05:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608026731;
 bh=+gNaPZgU13a6hnGA3NX7SdIT0byXyoDAmCTH1TOO0+o=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=aGs9xIJTo7/nIPfPrguuFi6DfPmh/kjwfXXGu2r41Bs/2RIX8iRC3FUwm+8GUYrk2
 ejm2Ftl5pO6yCWuevs6qoiujqpW0H1qWqhQeFEOVjXA0rsZctDnGWyrW11QES3LNY7
 b0bF8Ehfr6ndX5vbp3eoXB0+dBQoFzncuAkJNpeI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFA5Vh1065663
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Dec 2020 04:05:31 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:05:30 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:05:31 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFA5SIO104178;
 Tue, 15 Dec 2020 04:05:29 -0600
Subject: Re: [PATCH v5 29/29] drm/omap: dsi: allow DSI commands to be sent
 early
To: Sebastian Reichel <sre@kernel.org>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-30-tomi.valkeinen@ti.com>
 <20201214171703.aljagq444etuzdnx@earth.universe>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <02df0576-e9c9-7b20-4473-ca460a3e3857@ti.com>
Date: Tue, 15 Dec 2020 12:05:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214171703.aljagq444etuzdnx@earth.universe>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

On 14/12/2020 19:17, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Dec 08, 2020 at 02:28:55PM +0200, Tomi Valkeinen wrote:
>> Panel drivers can send DSI commands in panel's prepare(), which happens
>> before the bridge's enable() is called. The OMAP DSI driver currently
>> only sets up the DSI interface at bridge's enable(), so prepare() cannot
>> be used to send DSI commands.
>>
>> This patch fixes the issue by making it possible to enable the DSI
>> interface any time a command is about to be sent. Disabling the
>> interface is be done via delayed work.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Would be nice to include the information why locking is ok from your
> reply mails to the patch description. It was helpful for reviewing
> the patch :)

Thanks for the reviews! I've made the changes you suggested.

I'll do some testing on top of the latest drm-misc-next, and send the whole series once more, so 
that I'm able to dim apply it.

I'm planning to push this to drm-misc-next tomorrow.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
