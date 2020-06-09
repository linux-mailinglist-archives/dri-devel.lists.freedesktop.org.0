Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394DF1F3F84
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 17:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892D26E069;
	Tue,  9 Jun 2020 15:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88886E069
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 15:37:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 059FbDJB014151;
 Tue, 9 Jun 2020 10:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591717033;
 bh=Pr7gsZ+p5UzSlC+/SikTuxkm275d340dPhM8IU76YXs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Bg6hSDPKJ8dOX/xCxlHa/CTM3NWBwQY0Of0YUUNmH7xZ09zbM99OBXyhc4l/rmmuG
 8pwXxtv6F/wSX0vbq/RxdKIrIspZPns7lDyOZu9y/BYvtBNcEr+UKLIwQeDwwuYiEv
 hozvp+8SGqvzOIdwMaZxUuEoCka/zdF9oaulbioQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 059FbDoS009634
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Jun 2020 10:37:13 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Jun
 2020 10:37:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Jun 2020 10:37:13 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059FbCRw057633;
 Tue, 9 Jun 2020 10:37:12 -0500
Subject: Re: [PATCH] drm/omap: force runtime PM suspend on system suspend
To: Tony Lindgren <tony@atomide.com>
References: <20200609103220.753969-1-tomi.valkeinen@ti.com>
 <20200609151232.GR43721@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ea8f7a47-3d84-de98-e6e5-ecd7357b1f58@ti.com>
Date: Tue, 9 Jun 2020 18:37:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609151232.GR43721@atomide.com>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06/2020 18:12, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [200609 10:33]:
>> Use suspend_late and resume_early callbacks in DSS submodules to force
>> runtime PM suspend and resume.
>>
>> We use suspend_late callback so that omapdrm's system suspend callback
>> is called first, as that will disable all the display outputs after
>> which it's safe to force DSS into suspend.
> 
> I think we can avoid the pm_runtime_force use if we have omapdrm
> implement both .suspend and .suspend_late. In that case suspend would
> only disable the display outputs, then suspend_late would take care
> of switching off the lights and release the last PM runtime count
> after the children are done suspending.

I'm not sure how that can be done cleanly. omapdrm doesn't really see the DSS submodules. And even 
if it does, how can it "release the last PM runtime count"? With pm_runtime_force_suspend for each? 
That would be almost the same as this patch.

Also, if omapdrm can do the above, it could do it in the .suspend, after disabling the display 
outputs. I don't think there's need for suspend_late then.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
