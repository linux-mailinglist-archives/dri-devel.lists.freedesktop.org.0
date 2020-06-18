Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1535C1FF41C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 16:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A5F6E445;
	Thu, 18 Jun 2020 14:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F4F6E445
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 14:02:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05IE1odN057693;
 Thu, 18 Jun 2020 09:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1592488910;
 bh=wir69zAcyKWSlv4lyUGDzvqaaD4Wlm9E/EKiwGbnSFw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MnsBvcK/lJvYiGR/722JkmtUnFbr0RPb/Z3yIZKnImuHlpxJrXCNblp7/CkYa2Zz6
 TnrmwKwDGKjUa8/PsRecHcTEXve07/NL7LxUxV8tV32EINnIEmj9rlLEY1aLmOKHg2
 DmHJUS7xRHJfqaPNuetOp/FDqhYBUpK1tICAdNYQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05IE1oi1041392
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 18 Jun 2020 09:01:50 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 18
 Jun 2020 09:01:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 18 Jun 2020 09:01:50 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05IE1mwI029034;
 Thu, 18 Jun 2020 09:01:49 -0500
Subject: Re: [PATCH v2] drm/omap: force runtime PM suspend on system suspend
To: Tony Lindgren <tony@atomide.com>
References: <20200618095153.611071-1-tomi.valkeinen@ti.com>
 <20200618131608.GC43721@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <b351785a-5be4-edd2-2907-c9b091cbb481@ti.com>
Date: Thu, 18 Jun 2020 17:01:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618131608.GC43721@atomide.com>
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
Cc: Grygorii Strashko <grygorii.strashko@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/06/2020 16:16, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [200618 09:53]:
>> Use SET_LATE_SYSTEM_SLEEP_PM_OPS in DSS submodules to force runtime PM
>> suspend and resume.
>>
>> We use suspend late version so that omapdrm's system suspend callback is
>> called first, as that will disable all the display outputs after which
>> it's safe to force DSS into suspend.
> 
> This looks like a nice way of doing it, would be good to have as a
> regression fix for the -rc cycle:
> 
> Acked-by: Tony Lindgren <tony@atomide.com>

Thanks. Did you get the full suspend working? I still can't resume, unless I use pm_test to avoid 
the full suspend. So I'm still not sure if things really work.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
