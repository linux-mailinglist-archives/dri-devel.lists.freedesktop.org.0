Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD296AF0C25
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 09:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3F610E150;
	Wed,  2 Jul 2025 07:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="V6eZ2a4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCC810E150
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 07:02:09 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 562720IJ3152169;
 Wed, 2 Jul 2025 02:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1751439720;
 bh=A2wXrmDke3p+QXRizztlyqnvE+p5UjA/nG4aNT6tDQ4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=V6eZ2a4qR1vOVxBAXUu80A2BGmGtWtFOR8Y7opO5PbqGQs0X/Dk504TRehQWXi3JN
 4VUuT4v1gWpJmuKLMs4BTObHo9vocoJc60gIL0Iy5YDgOwCnmCcnDsE+q41CyzVS6H
 1cZwcS9CV01PvZx1m04BfdUQqfyAli9x5dYJlCIk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56271xwu617113
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 2 Jul 2025 02:01:59 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 2
 Jul 2025 02:01:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 2 Jul 2025 02:01:59 -0500
Received: from [172.24.227.166] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.166])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56271tp82975926;
 Wed, 2 Jul 2025 02:01:56 -0500
Message-ID: <71b4bd21-573e-4b48-a57f-6496e97d2eff@ti.com>
Date: Wed, 2 Jul 2025 12:31:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Decouple max_pclk check from constant display feats
To: Devarsh Thakkar <devarsht@ti.com>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <tomi.valkeinen@ideasonboard.com>, <mwalle@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>
References: <20250701095541.190422-1-j-choudhary@ti.com>
 <a0489fea-8c06-4c89-a530-8be691f4705d@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <a0489fea-8c06-4c89-a530-8be691f4705d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Devarsh,

On 01/07/25 19:00, Devarsh Thakkar wrote:
> On 01/07/25 15:25, Jayesh Choudhary wrote:
>> In an effort to make the existing compatibles more usable, we are
>> removing the max_pclk_khz form dispc_features structure and doing the
>> correspondig checks using "curr_max_pclk[]".
>>
>> Changes are fully backwards compatible.
>>
>> After integration of OLDI support[0], we need additional patches in
>> oldi to identify the VP that has OLDI. We have to do this since
>> OLDI driver owns the VP clock (its serial clock) and we cannot perform
>> clock operations on those VP clock from tidss driver. This issue was
>> also reported upstream when DSI fixes[1] had some clock related calls
>> in tidss driver. When "clk_round_rate()" is called, ideally it should
>> have gone to "sci_clk_determine_rate()" to query DM but it doesn't since
>> clock is owned by OLDI not tidss.
>>
> 
> As series is fixing above issue (abnormal behaviour while calling 
> clk_round_rate from tidss for VP clock being used by OLDI), can we add 
> "Fixes tag" for the patches?


This seems like a preemptive fix. So I was not sure what to add.

If it should be added then which commit?
7246e0929945 ("drm/tidss: Add OLDI bridge support") ?

Warm Regards,
Jayesh

> 
> Regards
> Devarsh
