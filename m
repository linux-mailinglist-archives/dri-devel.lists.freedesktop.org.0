Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE626ABED2D
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 09:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1087910E6A1;
	Wed, 21 May 2025 07:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="fI5627m6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD30410E6A1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 07:36:31 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54L7aIND1454795;
 Wed, 21 May 2025 02:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1747812978;
 bh=mMuYCSbFg37yvjOCyQwER8gGsGSyFNBjSLw5eTl4nmA=;
 h=Date:Subject:From:To:CC:References:In-Reply-To;
 b=fI5627m6om4QOgSGS0XOwjje5HkkhfDpo7if4VBiQhefTzB8qSK7J9Qn6laooOCoO
 d1pLaYyu/BdNrNDO9OZtWh8DafdGP1+Fd+t2olQLpUYhSVhPExuq3hrhN1pXae2n5J
 PmDMoigOWgXOplkUj7OGlZR68x+T2ws78Lhj7Jjg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54L7aHWq2559326
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 21 May 2025 02:36:17 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 May 2025 02:36:17 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 May 2025 02:36:17 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [10.24.72.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54L7aB7B070860;
 Wed, 21 May 2025 02:36:12 -0500
Message-ID: <acb55d37-8231-4f81-92ae-039d84717d71@ti.com>
Date: Wed, 21 May 2025 13:06:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm: bridge: cdns-mhdp8546: Fix possible null pointer
 dereference
From: Jayesh Choudhary <j-choudhary@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>,
 <dri-devel@lists.freedesktop.org>, <sjakhade@cadence.com>,
 <mripard@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>
CC: <amishin@t-argos.ru>, <jani.nikula@intel.com>, <tzimmermann@suse.de>,
 <maarten.lankhorst@linux.intel.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <linux-kernel@vger.kernel.org>,
 <devarsht@ti.com>
References: <20250116111636.157641-1-j-choudhary@ti.com>
 <e76f94b9-b138-46e7-bb18-b33dd98c9abb@ideasonboard.com>
 <9431081.CDJkKcVGEf@steina-w> <59c66b9a-9ced-434e-8e6d-626a1fa70abf@ti.com>
Content-Language: en-US
In-Reply-To: <59c66b9a-9ced-434e-8e6d-626a1fa70abf@ti.com>
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

Hello Tomi,

On 28/01/25 11:27, Jayesh Choudhary wrote:
> Hello Tomi, Alexander,
> 
> On 24/01/25 13:38, Alexander Stein wrote:
>> Hi,
>>
>> Am Donnerstag, 23. Januar 2025, 17:20:34 CET schrieb Tomi Valkeinen:
>>> Hi,
>>>
>>> On 16/01/2025 13:16, Jayesh Choudhary wrote:
>>>> For the cases we have DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set,
>>>
>>> Any idea if any other platform than K3 is using this driver? tidss
>>> supports DRM_BRIDGE_ATTACH_NO_CONNECTOR, so if K3 is the only user, we
>>> could drop the legacy !DRM_BRIDGE_ATTACH_NO_CONNECTOR case. Which would
>>> remove quite a bit of code, I think, and make the driver a bit more easy
>>> to understand (although I think it could use a major cleanup...).
>>

I cannot access the atomic state in this worker thread so I cannot reach
the connector using drm_atomic_get_new_connector_for_encoder.
I can't find any other way to do this. So I am rolling v2 for RFC while
addressing your other comments and fixing it in a different manner.
Please let me know if that is acceptable.

v2: https://lore.kernel.org/all/20250521073237.366463-1-j-choudhary@ti.com/

Warm Regards,
Jayesh



>> FYI: Not directly using it, but patch series [1] is at least touching
>> this file.
> 
> I can't see any other platform using this.
> No one uses compatible "cdns,mhdp8546" and only K3 devices uses the
> wrapper compatible "ti,j721e-mhdp8546"
> Let me post next RFC version with legacy !DRM_BRIDGE_ATTACH_NO_CONNECTOR
> dropped.
> 
> And the mentioned series only touches mailbox access function to move
> then to a common helper file. (So independent change)
> 
> 
>>
>> Best regards,
>> Alexander
>>
>> [1] https://lore.kernel.org/all/cover.1734340233.git.Sandor.yu@nxp.com/
>>
> 
> Warm Regards,
> Jayesh
