Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD31F40BB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 18:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C8F6E2D8;
	Tue,  9 Jun 2020 16:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AAB6E2D3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 16:26:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 059GQZ4C068584;
 Tue, 9 Jun 2020 11:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591719995;
 bh=C8sPUlGONxVbpyNqfYRGAFBhf0pSte5pmYk9Vx3HihA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MWvE2R+cJ7WRwJ8/Vrw57ZZgCjcvdwgLIhY83pqpoOW5osiRitE7+J63PBHc2vk4s
 2bnDSVHjs60AEVSF1vP0GvrRVK7A2/qXkwEGw8hajSO1oe5cn45z9W1CG14JMFR9gF
 Ov+gJu6GCf7pgLnr1nIvRSnWWc68obAbfQwkpPxs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 059GQZgv018836
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Jun 2020 11:26:35 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Jun
 2020 11:26:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Jun 2020 11:26:34 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059GQXc5025402;
 Tue, 9 Jun 2020 11:26:34 -0500
Subject: Re: [PATCH] drm/omap: force runtime PM suspend on system suspend
To: Tony Lindgren <tony@atomide.com>
References: <20200609103220.753969-1-tomi.valkeinen@ti.com>
 <20200609151232.GR43721@atomide.com>
 <ea8f7a47-3d84-de98-e6e5-ecd7357b1f58@ti.com>
 <20200609161044.GS43721@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <fc4e7d29-b170-8863-3bfb-9159196421f4@ti.com>
Date: Tue, 9 Jun 2020 19:26:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609161044.GS43721@atomide.com>
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

On 09/06/2020 19:10, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [200609 15:38]:
>> On 09/06/2020 18:12, Tony Lindgren wrote:
>>> * Tomi Valkeinen <tomi.valkeinen@ti.com> [200609 10:33]:
>>>> Use suspend_late and resume_early callbacks in DSS submodules to force
>>>> runtime PM suspend and resume.
>>>>
>>>> We use suspend_late callback so that omapdrm's system suspend callback
>>>> is called first, as that will disable all the display outputs after
>>>> which it's safe to force DSS into suspend.
>>>
>>> I think we can avoid the pm_runtime_force use if we have omapdrm
>>> implement both .suspend and .suspend_late. In that case suspend would
>>> only disable the display outputs, then suspend_late would take care
>>> of switching off the lights and release the last PM runtime count
>>> after the children are done suspending.
>>
>> I'm not sure how that can be done cleanly. omapdrm doesn't really see the
>> DSS submodules. And even if it does, how can it "release the last PM runtime
>> count"? With pm_runtime_force_suspend for each? That would be almost the
>> same as this patch.
> 
> Well there should not be anything special needed for the children,
> it should all happen automatically for us.
> 
> I'm just wondering if this can be all done without the need for
> all the boilerplate code and adding suspend_late :)
> 
>> Also, if omapdrm can do the above, it could do it in the .suspend, after
>> disabling the display outputs. I don't think there's need for suspend_late
>> then.
> 
> Yeah so it seems. Can we just diconnect the display outputs
> in .prepare somewhere? Or is that the wrong place to do it?

Hmm, yes, perhaps... If omapdrm uses .prepare to disable all the outputs. Then DSS submodules could 
use UNIVERSAL_DEV_PM_OPS() and have the same functions for system and runtime suspend.

Although that has the problem that if the DSS is already runtime suspended when system suspend 
happens, the PM does not wake DSS up, and thus the suspend callbacks will crash if they access 
registers. So they need some extra logic there.

I'll see tomorrow if I can come up with something like that.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
