Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BB52A004F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255C16ED12;
	Fri, 30 Oct 2020 08:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20EF6ED12
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 08:48:35 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09U8fYuC114276;
 Fri, 30 Oct 2020 03:41:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604047294;
 bh=wYGicATp84soVO9OZKDCZJuGrwdPVbdb6gu0/OJ7Vgc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=q7rEr/qlDFYTvGj3Ug/5RYZ8gapYI63xNwt6N2EsLkGnOpgdR+FcWwi1FgGuJFwZI
 bK/wOE/qzVuyka6bXlXL2v8o+54YCG8aAPuzm74LJRYqJWGCeAoBNnOBEoMqaI2+xr
 76gstRfgljZtgLDx2EXx+ShMykMdzGC/g1D9k0gI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09U8fY6k034442
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Oct 2020 03:41:34 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 30
 Oct 2020 03:40:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 30 Oct 2020 03:40:48 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09U8elaU047546;
 Fri, 30 Oct 2020 03:40:47 -0500
Subject: Re: [PATCH 3/5] drm: bridge: Propagate the bus flags from
 bridge->timings
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-4-nikhil.nd@ti.com>
 <fd65aa92-bc89-2420-bbc1-e131db1f6c25@ti.com>
 <20201028143453.njt3lak542wwx6jb@NiksLab>
 <20201029224817.GH15024@pendragon.ideasonboard.com>
 <dfb643a6-cb73-c915-21ff-387faa177c94@ti.com>
 <20201030090815.7133637b@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <def32047-de38-d50f-8fd9-31e4dcfe56b9@ti.com>
Date: Fri, 30 Oct 2020 10:40:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030090815.7133637b@collabora.com>
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
Cc: Swapnil Jakhade <sjakhade@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

On 30/10/2020 10:08, Boris Brezillon wrote:
> The "propagate output flags" and soon to be added "use
> timing->input_flags if present" logic should only be used as a fallback
> for bridges that do not support dynamic bus format/flags negotiation
> IMHO. Ideally we'd want to convert all bridges to do this dynamic bus
> format/flags negotiation and get rid of timings->input_bus_flags once
> this is done, but that's likely to take time. So, if your driver
> implements the ->atomic_check() hook and needs specific input flags,
> I'd recommend setting the input flags there instead of specifying it
> through timings->input_bus_flags.

What is bus flags negotiation? Don't we have negotiation only for bus formats? Bus flags are just
set, and the previous bridge in the chain has to use those flags.

Or do you just refer to setting the bus flags dynamically in atomic_check, versus static in
input_bus_flags?

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
