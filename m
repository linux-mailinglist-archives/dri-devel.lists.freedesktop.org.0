Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC6A20435
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 07:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7193D10E333;
	Tue, 28 Jan 2025 06:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="KL5qjXvV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 527 seconds by postgrey-1.36 at gabe;
 Tue, 28 Jan 2025 06:06:31 UTC
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1118110E333
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 06:06:31 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50S5vN3Z1135210
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2025 23:57:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1738043843;
 bh=GRHN9naLj2rJ4nGo9FOnkbnTUItG3F+RSSngWidQHmY=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=KL5qjXvVeFA5RsI+3QLslXtRJ9ySUiNiCrr3XW62Ht1dUBj3nFdtmFls5vNSfCxmW
 OZMzvx0rchnxEHai+Ozt0ReU8xI02ybg/mrXBD2sGltDOw3Y8lUgmVgFkl2gJDU/94
 VrHHSzUHEDW4Y/tXLGdboyjQXu1a3PdTLJnmW0hc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50S5vNmf068607
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 Jan 2025 23:57:23 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Jan 2025 23:57:22 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Jan 2025 23:57:22 -0600
Received: from [10.24.68.181] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [10.24.68.181])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50S5vHMq045270;
 Mon, 27 Jan 2025 23:57:18 -0600
Message-ID: <59c66b9a-9ced-434e-8e6d-626a1fa70abf@ti.com>
Date: Tue, 28 Jan 2025 11:27:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm: bridge: cdns-mhdp8546: Fix possible null pointer
 dereference
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 <dri-devel@lists.freedesktop.org>, <sjakhade@cadence.com>,
 <mripard@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>
CC: <amishin@t-argos.ru>, <jani.nikula@intel.com>, <tzimmermann@suse.de>,
 <maarten.lankhorst@linux.intel.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <linux-kernel@vger.kernel.org>,
 <devarsht@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20250116111636.157641-1-j-choudhary@ti.com>
 <e76f94b9-b138-46e7-bb18-b33dd98c9abb@ideasonboard.com>
 <9431081.CDJkKcVGEf@steina-w>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <9431081.CDJkKcVGEf@steina-w>
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

Hello Tomi, Alexander,

On 24/01/25 13:38, Alexander Stein wrote:
> Hi,
> 
> Am Donnerstag, 23. Januar 2025, 17:20:34 CET schrieb Tomi Valkeinen:
>> Hi,
>>
>> On 16/01/2025 13:16, Jayesh Choudhary wrote:
>>> For the cases we have DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set,
>>
>> Any idea if any other platform than K3 is using this driver? tidss
>> supports DRM_BRIDGE_ATTACH_NO_CONNECTOR, so if K3 is the only user, we
>> could drop the legacy !DRM_BRIDGE_ATTACH_NO_CONNECTOR case. Which would
>> remove quite a bit of code, I think, and make the driver a bit more easy
>> to understand (although I think it could use a major cleanup...).
> 
> FYI: Not directly using it, but patch series [1] is at least touching
> this file.

I can't see any other platform using this.
No one uses compatible "cdns,mhdp8546" and only K3 devices uses the
wrapper compatible "ti,j721e-mhdp8546"
Let me post next RFC version with legacy !DRM_BRIDGE_ATTACH_NO_CONNECTOR
dropped.

And the mentioned series only touches mailbox access function to move
then to a common helper file. (So independent change)


> 
> Best regards,
> Alexander
> 
> [1] https://lore.kernel.org/all/cover.1734340233.git.Sandor.yu@nxp.com/
> 

Warm Regards,
Jayesh
