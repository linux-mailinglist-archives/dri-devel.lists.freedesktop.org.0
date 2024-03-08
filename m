Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EB9876D45
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 23:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6164112C9D;
	Fri,  8 Mar 2024 22:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="bJQdwFqP";
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="bJQdwFqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2088.outbound.protection.outlook.com [40.107.6.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0822D10F35C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 21:27:20 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OqsSKmyY/ox7UWHJlWanyQc4lLgWRlR8dhToRJkbNHPghejmVyBZpSEWNAe/IKQZp6jERvTyjqQ6sKLvYW2lKt1GIJpoOUojLRF0iyaNKtFXBSYgjy4s37vN7Im4uO5cYqM07GI/sbr54y9RpfxIgpfaJcyq6GdnDA7mqO7ddTeHOjrNbTTArPBpL1c2YgPdiCYT0xRNtnuzbZT/gpctK9UOwyuCeHv6IsvXxjl3vec2Y6JNOTmEVcxbatKdyAYG3FL1omB7f7vokru4z0F9k4vsQ/w3v8bedz38JmnEBD76DKxzOW0WucN3CqliuAI5j2ll96MKAda63CZgd2K3Sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTuHn5TTitDcasHA+JVGDrG24DrMihr7ySGJPwQ6OtY=;
 b=G0ZqEV6kF8nieWp3Ops5UdGqwL1Fb7ABEDjTcX4C3HmtY//UlsfEKg7qP0One3YGAvrLB05bRS5j0MqzRFcHh7nHYvUjxOp/hsKCMDPnIm2Hmo/cxj8/On00YCWqbJ7kVyXtIeVrxOxvHiluZNdtivZskbf8aIjNGDwpIcMvPBsnjYC6WEfrBj8xhsNJwp9yRWjlRFEsMbB1ETpsHxXY4fZMXiPSQuQkaKpAJozLBqprB70qRON7lJAX66Hvm1ElkVoyIQoSBnA48p6r0Xgbb86DkwRqwY0W+vKm/8H5Pr8WiBGU2VgaEL0td0UoqMbaUmY1D8f1ki7h2lGclovTEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTuHn5TTitDcasHA+JVGDrG24DrMihr7ySGJPwQ6OtY=;
 b=bJQdwFqP6Ubsniq+/hMtjsOO31PsSU1mNc4juJh5uNIIVIlbuafmTODuD1dVeTRxKzLkGoBeOcU+aGignJ2GUcrbBC3x5GSolU15gR/Zqgre9O3eH07J2/rr+weiI690vdD8zVqjpgC1HNKFATl1rmBRBZcgD9gagGLoj3OkHy4=
Received: from AM0PR10CA0063.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::16)
 by DB9PR08MB7398.eurprd08.prod.outlook.com (2603:10a6:10:372::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 21:27:10 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:208:15:cafe::81) by AM0PR10CA0063.outlook.office365.com
 (2603:10a6:208:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Fri, 8 Mar 2024 21:27:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 21:27:10 +0000
Received: ("Tessian outbound 7b0d57313a48:v276");
 Fri, 08 Mar 2024 21:27:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 07709032526ce099
X-CR-MTA-TID: 64aa7808
Received: from a83050b00a3e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24F04963-97F7-4B9A-970C-1311746CC63E.1; 
 Fri, 08 Mar 2024 21:26:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a83050b00a3e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Mar 2024 21:26:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7ydbq3BMPK2Fm8nggUFNmbfis1aH8fd87v8fwKp/KN0A9B+ew7xSTjJ0JoXhJcdiBAzHnrjlo/s+sph3xeoy0NjKCTK3AoXNuC7jaananOkCRWsQRMr2hX0TiQco/+3uvxhwmao83w9fli90I0wLWM6qGvE4J9pwbTwqMB9eU6Kh457raS81WUtRP9c2Y/bs98wmU0RGLlmv8CrcQhUyfEe5LE05uAD8l/cyfitOWt4Q/Q7xEB+dngMv5GaPwyDnJIHSnt/Mr01T8FoMvE5P9m40A9UOhqNBbX+289renWvj94tvgUUt9TnwjS14W7/zUJFLI4Kxmou9P+Z8Y4l7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTuHn5TTitDcasHA+JVGDrG24DrMihr7ySGJPwQ6OtY=;
 b=l7OElDkwx9BQ7xcVZp0XhxRprC6Iu2VUaOUscHM/FEx5PchCPPhKvPCuzm4gqf0LiuBwV+oHCXM/mSfY0ChynQUAAR2AJ9pVflWC+UH0I0ykSZgYqe+I+27HaZoBlHDhW0i1XqsLu0FxbU54PeyLUdYvBbk5bATu/G8hgq+MDmk0V5bnWdk/7jG6wKgij6I1y7Hzz6ZJaPZFBYKXrVJ2t+WXhOqk0khHFX0PkohBuU7YHcHvIBkgwmRYVa8Qq8i7WlJr4zk3oJV0PjLlGd6J5wr2yLj9FqBA0K2xvsXQYUX38WCTBVNNPh3uYMbyzHOgod1+NuhIt5W2+4kD2+ogIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTuHn5TTitDcasHA+JVGDrG24DrMihr7ySGJPwQ6OtY=;
 b=bJQdwFqP6Ubsniq+/hMtjsOO31PsSU1mNc4juJh5uNIIVIlbuafmTODuD1dVeTRxKzLkGoBeOcU+aGignJ2GUcrbBC3x5GSolU15gR/Zqgre9O3eH07J2/rr+weiI690vdD8zVqjpgC1HNKFATl1rmBRBZcgD9gagGLoj3OkHy4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB7PR08MB3353.eurprd08.prod.outlook.com (2603:10a6:5:20::20) by
 AS8PR08MB6727.eurprd08.prod.outlook.com (2603:10a6:20b:393::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Fri, 8 Mar
 2024 21:26:56 +0000
Received: from DB7PR08MB3353.eurprd08.prod.outlook.com
 ([fe80::7c57:208f:fe0b:d655]) by DB7PR08MB3353.eurprd08.prod.outlook.com
 ([fe80::7c57:208f:fe0b:d655%5]) with mapi id 15.20.7362.028; Fri, 8 Mar 2024
 21:26:56 +0000
Message-ID: <a99a34c3-f663-4400-90e4-5539c853afba@arm.com>
Date: Fri, 8 Mar 2024 21:26:54 +0000
User-Agent: Mozilla Thunderbird
From: Mihail Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH] drm/panthor: Add support for performance counters
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nd@arm.com
References: <20240305165820.585245-1-adrian.larumbe@collabora.com>
Content-Language: en-US
In-Reply-To: <20240305165820.585245-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::19) To DB7PR08MB3353.eurprd08.prod.outlook.com
 (2603:10a6:5:20::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB7PR08MB3353:EE_|AS8PR08MB6727:EE_|AMS1EPF00000049:EE_|DB9PR08MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c322287-5e56-4156-5ffd-08dc3fb6839b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 0alypQcdoLf7FhXdWY04R4o0Cg5jbTYyrDqCYnPtYpYERhmgPOVxhnp+fIGYjlOLUG8jf29le75yzmuaDgJ7ZsI4PxZuWbRd+qfiKaijY/gfF9zCwVysSunDWzlwoeQUprLNtFKT/gLCiR6atuuCa6RzADJuLgyG1uF1Ya02eee4dxG8rwFhhTuOMFgzNea88SIqcC+dJSkvAaeI1wjZqTNTHzRkuiV2dadRdqzbuUo8MFchLDG2rXJlgzwMBVBptnEDKGHOw3d5FCyanu9BxkzwVmCPQ2NiW8yL02tcqgEg2KHd+9AgP+TLRyx+srE0tagR50ZFPYIpVEubVS0WZNMmSES5Kz9zw7XNZbRNmGfOCzTBWAhao+F4Otdu6AzwggLMyl3NtnUFcNJjgFTTiW2Q4jmHOfusjCa9AdoY8Gb509pe8A4VaXn0vFJoJLsbc3JwgsgHeIuzvceS+wNS37DL5LMx7unlTKXQGSg6F2a83I9s+5GAo5qIx3oHhQYg+jdJqPo1Z/ghVvhMW5RNdplYCT/Cd64HKC8/Wi9p1mqODAub8Y+s7pMESuaD47u038o9EvYEga80HSYcVsJOGQWqWOe7odLpRF6YYo9i/8ETtT09vR8frfPI4eb2kjhJ
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3353.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230031)(1800799015)(376005)(7416005); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6727
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 26d10c0d-a487-464f-0ea4-08dc3fb67b28
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mJgBMIRHlottzrmKosb3+31RPXBVA4k7R7J2tP3Rm6jRgYW33c1E4GDIYthvYw+7mF2XrfGHTS3gFNcZdZ3e89xAlvDkFdZhQHr3iPm6Jqsggj0eE03scG90gdtw9IV1QaLhtGYlKKraxOCDFhehKPBRw+wEkuf4tKFyEremKLYoKwVJn36P9yFLgJE8Y5arYJmSnttaS4XJ8SKQU4HqOFByh552rdjvBG8VWH/LdRCT9aPslGDALZ2qRzOq7a4/Hn8BUtBwVOwJQ/Yf5VjIvXLxbVajEP77aZFbExWq+fGfYfFn5AN7IZjTYgUcRhJ1Hj/DL6vDvTmximpw0Q96Noo5hO98wfg2I/Q+hVaF21Zgwdn5RfVc02owQHvIz3OERXFs7jHJZdjBwxNqs/KfSNQ+9i8Znd2i/xMyUcW3ndDxQKmIYL473c2MKFGR9T+qVdPLrU2TiCCF+hhydryjFWG4xne+pVZOcCE8nE5M3vnB/NhPb73MMOhm47H5TmzG7a9RlSe57ejTMYcf0floTPYWmzgTijZiivMzxOYG3h0syvfEFvSOWuqMkk0XziT4S2NNzWxGLrZUcxS1Z//2/sEjxEQW/CrwUscScxX4gHlGhM6PikmbqsPhmVknnS6MLWxQJM+lqRbUxx9T9hJ6qZhcVmkAf7jmzbby82Y0nENSSC0sCevb5lKbwwh9AeiVED36QvqxMrZFntHxUir/Rg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 21:27:10.3427 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c322287-5e56-4156-5ffd-08dc3fb6839b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7398
X-Mailman-Approved-At: Fri, 08 Mar 2024 22:42:01 +0000
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

Hi Adrián,

Thanks for your patch. Liviu's already raised some concerns in the
adjacent thread, so I'll try not to repeat them here.

On 05/03/2024 16:58, Adrián Larumbe wrote:
> This brings in support for Panthor's HW performance counters and querying
> them from UM through a specific ioctl(). The code is inspired by existing
> functionality for the Panfrost driver, with some noteworthy differences: >
>   - Sample size is now reported by the firmware rather than having to reckon
>   it by hand
>   - Counter samples are chained in a ring buffer that can be accessed
>   concurrently, but only from threads within a single context (this is
>   because of a HW limitation).
>   - List of enabled counters must be explicitly told from UM
>   - Rather than allocating the BO that will contain the perfcounter values
>   in the render context's address space, the samples ring buffer is mapped
>   onto the MCU's VM.
>   - If more than one thread within the same context tries to dump a sample,
>   then the kernel will copy the same frame to every single thread that was
>   able to join the dump queue right before the FW finished processing the
>   sample request.
>   - UM must provide a BO handle for retrieval of perfcnt values rather
>   than passing a user virtual address.
> 
> The reason multicontext access to the driver's perfcnt ioctl interface
> isn't tolerated is because toggling a different set of counters than the
> current one implies a counter reset, which also messes up with the ring
> buffer's extraction and insertion pointers. This is an unfortunate
> hardware limitation.

Multi-context access is quite an important use case and can't be tossed
out because it's not done in HW -- you don't want to have a daemon
process grab counters and leave all other users dry. Some games, for
example, use live perfcnt data to make adaptive performance/quality
decisions. SoC vendors / OEMs might also want to use perfcnt data for
energy budgeting. While you don't need to have multiple access
implemented right away, there needs to be space in the uAPI to extend
the driver to support that.

> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>   drivers/gpu/drm/panthor/Makefile          |   3 +-
>   drivers/gpu/drm/panthor/panthor_device.c  |   6 +
>   drivers/gpu/drm/panthor/panthor_device.h  |   6 +
>   drivers/gpu/drm/panthor/panthor_drv.c     |  61 +++
>   drivers/gpu/drm/panthor/panthor_fw.c      |  27 ++
>   drivers/gpu/drm/panthor/panthor_fw.h      |  12 +
>   drivers/gpu/drm/panthor/panthor_perfcnt.c | 551 ++++++++++++++++++++++
>   drivers/gpu/drm/panthor/panthor_perfcnt.h |  31 ++
>   drivers/gpu/drm/panthor/panthor_sched.c   |   1 +
>   include/uapi/drm/panthor_drm.h            |  72 +++
>   10 files changed, 769 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/panthor/panthor_perfcnt.c
>   create mode 100644 drivers/gpu/drm/panthor/panthor_perfcnt.h
> 
> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> index 15294719b09c..7f841fd053d4 100644
> --- a/drivers/gpu/drm/panthor/Makefile
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -9,6 +9,7 @@ panthor-y := \
>   	panthor_gpu.o \
>   	panthor_heap.o \
>   	panthor_mmu.o \
> -	panthor_sched.o
> +	panthor_sched.o \
> +	panthor_perfcnt.o

[nit] sort order

>   
>   obj-$(CONFIG_DRM_PANTHOR) += panthor.o
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index bfe8da4a6e4c..5dfd82891063 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -20,6 +20,7 @@
>   #include "panthor_mmu.h"
>   #include "panthor_regs.h"
>   #include "panthor_sched.h"
> +#include "panthor_perfcnt.h"
>   
>   static int panthor_clk_init(struct panthor_device *ptdev)
>   {
> @@ -78,6 +79,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>   	/* Now, try to cleanly shutdown the GPU before the device resources
>   	 * get reclaimed.
>   	 */
> +	panthor_perfcnt_unplug(ptdev);
>   	panthor_sched_unplug(ptdev);
>   	panthor_fw_unplug(ptdev);
>   	panthor_mmu_unplug(ptdev);
> @@ -233,6 +235,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>   	if (ret)
>   		goto err_unplug_fw;
>   
> +	ret = panthor_perfcnt_init(ptdev);
> +	if (ret)
> +		goto err_rpm_put;
> +
>   	/* ~3 frames */
>   	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>   	pm_runtime_use_autosuspend(ptdev->base.dev);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 51c9d61b6796..adf0bd29deb0 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -100,6 +100,9 @@ struct panthor_device {
>   	/** @csif_info: Command stream interface information. */
>   	struct drm_panthor_csif_info csif_info;
>   
> +	/** @perfcnt_info: Performance counters interface information. */
> +	struct drm_panthor_perfcnt_info perfcnt_info;
> +
>   	/** @gpu: GPU management data. */
>   	struct panthor_gpu *gpu;
>   
> @@ -127,6 +130,9 @@ struct panthor_device {
>   		struct completion done;
>   	} unplug;
>   
> +	/** @perfcnt: Device performance counters data. */
> +	struct panthor_perfcnt *perfcnt;
> +
>   	/** @reset: Reset related fields. */
>   	struct {
>   		/** @wq: Ordered worqueud used to schedule reset operations. */
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index ff484506229f..6cb9ea0aa553 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -27,6 +27,7 @@
>   #include "panthor_mmu.h"
>   #include "panthor_regs.h"
>   #include "panthor_sched.h"
> +#include "panthor_perfcnt.h"
>   
>   /**
>    * DOC: user <-> kernel object copy helpers.
> @@ -164,6 +165,7 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>   	_Generic(_obj_name, \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_gpu_info, tiler_present), \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_csif_info, pad), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perfcnt_info, fw_size),	\
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> @@ -765,6 +767,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>   			args->size = sizeof(ptdev->csif_info);
>   			return 0;
>   
> +		case DRM_PANTHOR_DEV_QUERY_PERFCNT_INFO:
> +			args->size = sizeof(ptdev->perfcnt_info);
> +			return 0;
> +
>   		default:
>   			return -EINVAL;
>   		}
> @@ -777,6 +783,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>   	case DRM_PANTHOR_DEV_QUERY_CSIF_INFO:
>   		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->csif_info);
>   
> +	case DRM_PANTHOR_DEV_QUERY_PERFCNT_INFO:
> +		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->perfcnt_info);
> +
>   	default:
>   		return -EINVAL;
>   	}
> @@ -1245,6 +1254,55 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
>   	return 0;
>   }
>   
> +static bool perf_masks_zero(struct drm_panthor_perfcnt_config *req)
> +{
> +
> +	u32 counters_mask = req->csg_select | req->fw_enable |
> +		req->csg_enable | req->csf_enable | req->shader_enable |
> +		req->tiler_enable | req->mmu_l2_enable;
> +
> +	return (!counters_mask) ? true : false;

[nit] the `? true : false` is redundant

> +}
> +
> +static int panthor_ioctl_perfcnt_config(struct drm_device *dev, void *data,
> +				  struct drm_file *file_priv)
> +{
> +	struct panthor_file *pfile = file_priv->driver_priv;
> +	struct panthor_device *ptdev = pfile->ptdev;
> +	struct drm_panthor_perfcnt_config *req = data;
> +
> +	/*
> +	 * GLB_PRFCNT_CONFIG.SET_SELECT: This flag allows selection of different
> +	 * sets of counter events. For those counter blocks that support it, this
> +	 * effectively selects between up to four sets of the event count inputs to
> +	 * the same counter block. All counter blocks support counter set 0.
> +	 */
> +	if (req->counterset > 3)
> +		return -EINVAL;
> +
> +	return panthor_perfcnt_config(ptdev, req, pfile, perf_masks_zero(req));
> +}
> +
> +static int panthor_ioctl_perfcnt_dump(struct drm_device *dev, void *data,
> +				      struct drm_file *file_priv)
> +{
> +	struct panthor_file *pfile = file_priv->driver_priv;
> +	struct panthor_device *ptdev = pfile->ptdev;
> +	struct drm_panthor_perfcnt_dump *req = data;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	obj = drm_gem_object_lookup(file_priv, req->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	ret = panthor_perfcnt_dump(ptdev, obj, file_priv->driver_priv);
> +
> +	drm_gem_object_put(obj);
> +
> +	return ret;
> +}
> +
>   static int
>   panthor_open(struct drm_device *ddev, struct drm_file *file)
>   {
> @@ -1290,6 +1348,7 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
>   {
>   	struct panthor_file *pfile = file->driver_priv;
>   
> +	panthor_perfcnt_close(file);
>   	panthor_group_pool_destroy(pfile);
>   	panthor_vm_pool_destroy(pfile);
>   
> @@ -1314,6 +1373,8 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>   	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
>   	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
>   	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERFCNT_CONFIG, perfcnt_config, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERFCNT_DUMP, perfcnt_dump, DRM_RENDER_ALLOW),
>   };
>   
>   static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 33c87a59834e..7b31bb6c21b9 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -23,6 +23,7 @@
>   #include "panthor_mmu.h"
>   #include "panthor_regs.h"
>   #include "panthor_sched.h"
> +#include "panthor_perfcnt.h"
>   
>   #define CSF_FW_NAME "mali_csffw.bin"
>   
> @@ -947,6 +948,7 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
>   					 GLB_PING |
>   					 GLB_CFG_PROGRESS_TIMER |
>   					 GLB_CFG_POWEROFF_TIMER |
> +					 GLB_PERFCNT_SAMPLE |
>   					 GLB_IDLE_EN |
>   					 GLB_IDLE;
>   
> @@ -975,6 +977,10 @@ static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
>   		return;
>   
>   	panthor_sched_report_fw_events(ptdev, status);
> +
> +	/* Let the perfcnt layer figure out if there are PERFCNT events to process. */
> +	if (status & JOB_INT_GLOBAL_IF)
> +		panthor_perfcnt_report_fw_events(ptdev, status);
>   }
>   PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
>   
> @@ -1213,6 +1219,26 @@ int panthor_fw_glb_wait_acks(struct panthor_device *ptdev,
>   				    req_mask, acked, timeout_ms);
>   }
>   
> +/**
> + * panthor_fw_glb_state_change() - Notify change of state in a global request register flags
> + * @ptdev: Device.
> + * @req_mask: Mask of requests to check change of state for.
> + * @flipped: Pointer to field that's updated with the flipped requests.
> + * If the function returns false, *flipped == 0.
> + *
> + * Return: true on change, false otherwise.
> + */
> +bool panthor_fw_glb_state_change(struct panthor_device *ptdev,
> +				 u32 req_mask, u32 *flipped)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	u32 req = READ_ONCE(glb_iface->input->req) & req_mask;
> +	u32 ack = READ_ONCE(glb_iface->output->ack) & req_mask;
> +
> +	*flipped = (req ^ ack);
> +	return (*flipped != 0);
> +}
> +
>   /**
>    * panthor_fw_csg_wait_acks() - Wait for command stream group requests to be acknowledged.
>    * @ptdev: Device.
> @@ -1352,6 +1378,7 @@ int panthor_fw_init(struct panthor_device *ptdev)
>   		goto err_unplug_fw;
>   
>   	panthor_fw_init_global_iface(ptdev);
> +
>   	return 0;
>   
>   err_unplug_fw:
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index 22448abde992..682a02118077 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -11,6 +11,7 @@ struct panthor_kernel_bo;
>   
>   #define MAX_CSGS				31
>   #define MAX_CS_PER_CSG                          32
> +#define MAX_PERFCNT_BUF_SLOTS                   128
>   
>   struct panthor_fw_ringbuf_input_iface {
>   	u64 insert;
> @@ -197,6 +198,8 @@ struct panthor_fw_global_control_iface {
>   	u32 output_va;
>   	u32 group_num;
>   	u32 group_stride;
> +#define GLB_PERFCNT_FW_SIZE(x)                 ((((x) >> 16) << 8))
> +#define GLB_PERFCNT_HW_SIZE(x)                 (((x) & GENMASK(15, 0)) << 8)
>   	u32 perfcnt_size;
>   	u32 instr_features;
>   };
> @@ -240,6 +243,8 @@ struct panthor_fw_global_input_iface {
>   	u64 perfcnt_base;
>   	u32 perfcnt_extract;
>   	u32 reserved3[3];
> +#define GLB_PERFCNT_CFG_SIZE(x)			((x) & GENMASK(7, 0))
> +#define GLB_PERFCNT_CFG_SET(x)			((GENMASK(1, 0) & (x)) << 8)
>   	u32 perfcnt_config;
>   	u32 perfcnt_csg_select;
>   	u32 perfcnt_fw_enable;
> @@ -264,6 +269,11 @@ struct panthor_fw_global_output_iface {
>   	u32 doorbell_ack;
>   	u32 reserved2;
>   	u32 halt_status;
> +
> +#define GLB_PERFCNT_STATUS_FAILED            BIT(0)
> +#define GLB_PERFCNT_STATUS_POWERON           BIT(1)
> +#define GLB_PERFCNT_STATUS_POWEROFF          BIT(2)
> +#define GLB_PERFCNT_STATUS_PROTSESSION       BIT(3)
>   	u32 perfcnt_status;
>   	u32 perfcnt_insert;
>   };
> @@ -472,6 +482,8 @@ int panthor_fw_csg_wait_acks(struct panthor_device *ptdev, u32 csg_id, u32 req_m
>   int panthor_fw_glb_wait_acks(struct panthor_device *ptdev, u32 req_mask, u32 *acked,
>   			     u32 timeout_ms);
>   
> +bool panthor_fw_glb_state_change(struct panthor_device *ptdev, u32 req_mask, u32 *flipped);
> +
>   void panthor_fw_ring_csg_doorbells(struct panthor_device *ptdev, u32 csg_slot);
>   
>   struct panthor_kernel_bo *
> diff --git a/drivers/gpu/drm/panthor/panthor_perfcnt.c b/drivers/gpu/drm/panthor/panthor_perfcnt.c
> new file mode 100644
> index 000000000000..e223e44e3f35
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_perfcnt.c
> @@ -0,0 +1,551 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2023 Collabora Ltd */
> +
> +#include "linux/mutex.h"
> +#include <linux/completion.h>
> +#include <linux/iopoll.h>
> +#include <linux/iosys-map.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +#include <linux/spinlock.h>
> +
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/panthor_drm.h>
> +
> +#include "panthor_device.h"
> +#include "panthor_gem.h"
> +#include "panthor_mmu.h"
> +#include "panthor_perfcnt.h"
> +#include "panthor_regs.h"
> +#include "panthor_gpu.h"
> +#include "panthor_fw.h"
> +
> +#define SAMPLE_TIMEOUT_MS		1000
> +#define SAMPLE_HDR_SIZE                 12
> +#define SAMPLE_BLOCK_SIZE		0x100
> +
> +#define PERFCNT_OP_AFFECTED \
> +	(GLB_PERFCNT_STATUS_POWEROFF | \
> +	 GLB_PERFCNT_STATUS_POWERON | \
> +	 GLB_PERFCNT_STATUS_PROTSESSION)
> +
> +enum perfcnt_status {
> +	PERFCNT_STATUS_STARTED,
> +	PERFCNT_STATUS_SUCCEEDED,
> +	PERFCNT_STATUS_FAILED,
> +	PERFCNT_STATUS_OVERFLOW,
> +};
> +
> +struct panthor_perfcnt {
> +	struct panthor_device *ptdev;
> +	struct panthor_file *user;
> +	struct mutex lock;
> +
> +	struct panthor_kernel_bo *bo;
> +	size_t sample_size;
> +	u32 ringslots;
> +
> +	struct workqueue_struct *dumper_wkq;
> +	struct work_struct work;
> +	atomic_t dump_requested;
> +
> +	struct list_head dumper_list;
> +	wait_queue_head_t wq;
> +};
> +
> +struct panthor_perfcnt_dumper {
> +	struct list_head list;
> +	struct completion comp;
> +	void *user_bo;
> +	int last_status;
> +};
> +
> +struct perfcnt_counters {
> +	u32 counterset;
> +	u32 csg_select;
> +	u32 fw_enable;
> +	u32 csg_enable;
> +	u32 csf_enable;
> +	u32 shader_enable;
> +	u32 tiler_enable;
> +	u32 mmu_l2_enable;
> +};
> +
> +static int panthor_perfcnt_enable_counters(struct panthor_device *ptdev,
> +					   struct perfcnt_counters *counters)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	u32 acked;
> +
> +	if (glb_iface->input->req & GLB_PERFCNT_EN) {
> +		drm_info(&ptdev->base, "Performance counters aren't disabled!\n");
> +		return -EBUSY;
> +	}
> +
> +	glb_iface->input->perfcnt_config |= GLB_PERFCNT_CFG_SET(counters->counterset);
> +	glb_iface->input->perfcnt_csg_select = counters->csg_select;
> +	glb_iface->input->perfcnt_mmu_l2_enable = counters->mmu_l2_enable;
> +	glb_iface->input->perfcnt_tiler_enable = counters->tiler_enable;
> +	glb_iface->input->perfcnt_shader_enable = counters->shader_enable;
> +	glb_iface->input->perfcnt_csf_enable = counters->csf_enable;
> +	glb_iface->input->perfcnt_csg_enable = counters->csg_enable;
> +	glb_iface->input->perfcnt_fw_enable = counters->fw_enable;
> +
> +	/* Enable/Disabled status is value-based, rather than change-of-value */
> +	panthor_fw_update_reqs(glb_iface, req, GLB_PERFCNT_EN, GLB_PERFCNT_EN);
> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +	return panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_EN, &acked, 100);
> +}
> +
> +static int
> +panthor_perfcnt_disable_counters(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	u32 acked;
> +	int ret;
> +
> +	if (!(glb_iface->input->req & GLB_PERFCNT_EN)) {
> +		drm_info(&ptdev->base, "Performance counters were already disabled\n");
> +		return 0;
> +	}
> +
> +	/* Enable/Disabled status is value-based, rather than change-of-value */
> +	panthor_fw_update_reqs(glb_iface, req, 0, GLB_PERFCNT_EN);
> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_EN, &acked, 100);
> +	if (ret) {
> +		drm_err(&ptdev->base, "Could not disable performance counters\n");
> +		return ret;
> +	}
> +
> +	glb_iface->input->perfcnt_csg_select = 0;
> +	glb_iface->input->perfcnt_mmu_l2_enable = 0;
> +	glb_iface->input->perfcnt_tiler_enable = 0;
> +	glb_iface->input->perfcnt_shader_enable = 0;
> +	glb_iface->input->perfcnt_csf_enable = 0;
> +	glb_iface->input->perfcnt_csg_enable = 0;
> +	glb_iface->input->perfcnt_fw_enable = 0;
> +
> +	return 0;
> +}
> +
> +static void perfcnt_copy_sample(struct panthor_device *ptdev,
> +				struct panthor_perfcnt *perfcnt,
> +				void *bo_va, unsigned int idx)
> +{
> +	/*
> +	 * Ring buffer index calculation can be done in this way because it
> +	 * is always guaranteed to be a power of 2
> +	 */
> +	memcpy(bo_va, perfcnt->bo->kmap +
> +	       ((idx & (perfcnt->ringslots - 1)) * perfcnt->sample_size),
> +	       perfcnt->sample_size);
> +}
> +
> +static void clear_slot_headers(struct panthor_device *ptdev, u32 ext_idx, u32 ins_idx)
> +{
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	unsigned int offset;
> +	unsigned int i;
> +
> +	if (WARN_ON(ext_idx >= ins_idx))  {
> +		drm_warn(&ptdev->base, "Extraction index is greater or equal than insertion index %u-%u\n",
> +			 ext_idx, ins_idx);
> +		return;
> +	}
> +
> +	drm_dbg(&ptdev->base, "Cleaning perfcnt ring buffer slots %u-%u\n", ext_idx, ins_idx);
> +
> +	for (i = ext_idx; i < ins_idx; i++) {
> +		void *slot = perfcnt->bo->kmap +
> +			((i & (ptdev->perfcnt->ringslots - 1)) * perfcnt->sample_size);
> +
> +		for (offset = 0; offset < perfcnt->sample_size; offset += SAMPLE_BLOCK_SIZE)
> +			memset(slot + offset, 0, SAMPLE_HDR_SIZE);
> +	}
> +}
> +
> +static void clean_dumper_list(struct panthor_device *ptdev, unsigned int status)
> +{
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	struct panthor_perfcnt_dumper *dumper, *dumper_tmp;
> +
> +	mutex_lock(&perfcnt->lock);
> +	list_for_each_entry_safe(dumper, dumper_tmp, &perfcnt->dumper_list, list) {
> +		if (status == PERFCNT_STATUS_SUCCEEDED)
> +			perfcnt_copy_sample(ptdev, perfcnt, dumper->user_bo,
> +					    glb_iface->output->perfcnt_insert - 1);
> +		list_del(&dumper->list);
> +		INIT_LIST_HEAD(&dumper->list);
> +		dumper->last_status = status;
> +		complete(&dumper->comp);
> +	}
> +	mutex_unlock(&perfcnt->lock);
> +}
> +
> +static void perfcnt_process_sample(struct work_struct *work)
> +{
> +	struct panthor_perfcnt *perfcnt =
> +		container_of(work, struct panthor_perfcnt, work);
> +	struct panthor_device *ptdev = perfcnt->ptdev;
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	u32 acked, flipped;
> +	int ret;
> +
> +	if (panthor_fw_glb_state_change(ptdev, GLB_PERFCNT_THRESHOLD, &flipped)) {
> +		drm_dbg(&ptdev->base, "Performance counter buffer has reached 50%% capacity\n");
> +		panthor_fw_toggle_reqs(glb_iface, req, ack, flipped);
> +		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +		ret = panthor_fw_glb_wait_acks(ptdev, flipped, &acked, 100);
> +		if (ret)
> +			drm_warn(&ptdev->base, "Resetting Threshold flags failed\n");
> +	}



> +
> +	if (glb_iface->output->perfcnt_status & GLB_PERFCNT_STATUS_FAILED) {
> +		drm_err(&ptdev->base, "Perfcounter sampling failed\n");
> +		clean_dumper_list(ptdev, PERFCNT_STATUS_FAILED);
> +		goto worker_exit;
> +	}
> +
> +	if (panthor_fw_glb_state_change(ptdev, GLB_PERFCNT_OVERFLOW, &flipped)) {
> +		drm_info(&ptdev->base, "The performance counter buffer has overflowed. Some samples may have been lost\n");
> +		panthor_fw_toggle_reqs(glb_iface, req, ack, flipped);
> +		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +		ret = panthor_fw_glb_wait_acks(ptdev, flipped, &acked, 100);
> +		if (ret)
> +			drm_err(&ptdev->base, "Resetting Overflow flags failed\n");
> +		clean_dumper_list(ptdev, PERFCNT_STATUS_OVERFLOW);
> +		goto clear_inc_idx;
> +	}
> +
> +	if (glb_iface->output->perfcnt_status & PERFCNT_OP_AFFECTED)
> +		drm_warn(&ptdev->base, "Perfcnt sample operation might have been impacted by a power transition or protected session exec\n");
> +
> +	clean_dumper_list(ptdev, PERFCNT_STATUS_SUCCEEDED);
> +
> +clear_inc_idx:
> +	clear_slot_headers(ptdev, glb_iface->input->perfcnt_extract,
> +			   glb_iface->output->perfcnt_insert);
> +	/*
> +	 * TRM recommends increasing the extract pointer by one after every sample
> +	 * operation, but because sample requests are processed sequentially and we
> +	 * discard samples triggered by the HW automatically, it's best if we simply
> +	 * set it to the next insert slot index.
> +	 */
> +	WRITE_ONCE(glb_iface->input->perfcnt_extract,
> +		   READ_ONCE(glb_iface->output->perfcnt_insert));
> +worker_exit:
> +	wake_up_all(&perfcnt->wq);
> +}
> +
> +int panthor_perfcnt_dump(struct panthor_device *ptdev,
> +			 struct drm_gem_object *obj,
> +			 struct panthor_file *pfile)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	struct panthor_perfcnt_dumper dumper;
> +	struct iosys_map map;
> +
> +	int ret;
> +
> +	mutex_lock(&perfcnt->lock);
> +	if (perfcnt->user != pfile) {
> +		ret = -EINVAL;
> +		goto err_dump;
> +	}
> +
> +	ret = drm_gem_vmap_unlocked(obj, &map);
> +	if (ret) {
> +		drm_err(&ptdev->base, "Could not map the target BO\n");
> +		goto err_dump;
> +	}
> +
> +	dumper.user_bo = map.vaddr;
> +	dumper.last_status = PERFCNT_STATUS_STARTED;
> +	init_completion(&dumper.comp);
> +	list_add_tail(&dumper.list, &perfcnt->dumper_list);
> +
> +	/* Start the sampling if list were empty */
> +	if (list_is_first(&dumper.list, &perfcnt->dumper_list)) {
> +		panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PERFCNT_SAMPLE);
> +		atomic_set(&ptdev->perfcnt->dump_requested, 1);
> +		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +	}
> +	mutex_unlock(&perfcnt->lock);
> +
> +	ret = wait_for_completion_interruptible_timeout(&dumper.comp,
> +							msecs_to_jiffies(SAMPLE_TIMEOUT_MS));
> +	if (!ret)
> +		/* Let's give the worker thread a chance to finish */
> +		ret = flush_work(&perfcnt->work);
> +
> +	if (!ret && !try_wait_for_completion(&dumper.comp)) {
> +		mutex_lock(&perfcnt->lock);
> +		if (!list_empty(&dumper.list)) {
> +			list_del(&dumper.list);
> +			if (list_empty(&perfcnt->dumper_list)) {
> +				atomic_set(&ptdev->perfcnt->dump_requested, 0);
> +				wake_up_all(&perfcnt->wq);
> +			}
> +		}
> +		mutex_unlock(&perfcnt->lock);
> +
> +		ret = -ETIMEDOUT;
> +	} else {
> +		WARN_ON(dumper.last_status == PERFCNT_STATUS_STARTED);
> +		ret = (dumper.last_status >= PERFCNT_STATUS_FAILED) ? -EIO : 0;
> +	}
> +
> +	drm_gem_vunmap_unlocked(obj, &map);
> +
> +	return ret;
> +
> +err_dump:
> +	mutex_unlock(&perfcnt->lock);
> +	return ret;
> +}
> +
> +
> +static int panthor_perfcnt_enable_locked(struct panthor_device *ptdev,
> +				  struct panthor_file *pfile,
> +				  struct drm_panthor_perfcnt_config *req)
> +
> +{
> +	unsigned int perfcnt_ringbuf_slots = req->ringslots;
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	struct panthor_kernel_bo *bo;
> +	int ret;
> +
> +	if (pfile == perfcnt->user)
> +		return 0;
> +	else if (perfcnt->user)
> +		return -EBUSY;
> +
> +	if (perfcnt_ringbuf_slots != perfcnt->ringslots) {
> +		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +
> +		if (perfcnt->bo) {
> +			panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), perfcnt->bo);
> +			perfcnt->bo = NULL;
> +		}
> +
> +		if (perfcnt_ringbuf_slots > MAX_PERFCNT_BUF_SLOTS)
> +			perfcnt_ringbuf_slots = MAX_PERFCNT_BUF_SLOTS;
> +		if (!is_power_of_2(perfcnt_ringbuf_slots))
> +			perfcnt_ringbuf_slots = rounddown_pow_of_two(perfcnt_ringbuf_slots);
> +
> +		/*
> +		 * Create the perfcnt dump BO. We need to use the FW's VM because GLB_PRFCNT_JASID's
> +		 * maximum implementation defined value is 7. The way AS are assigned to a VM
> +		 * in panthor_vm_active means we cannot guarantee an AS between 1 and 7 would be
> +		 * available. An alternative would be implementing some sort of AS eviction
> +		 * mechanism, or perhaps setting one AS bit aside for perfcnt. However, given that
> +		 * the counters are global, it's simpler to bind the perfcount ringbuf to the FW AS.
> +		 */
> +		bo = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
> +					      perfcnt->sample_size * perfcnt_ringbuf_slots,
> +					      DRM_PANTHOR_BO_NO_MMAP,
> +					      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
> +					      DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> +					      PANTHOR_VM_KERNEL_AUTO_VA);
> +		if (IS_ERR(bo))
> +			return PTR_ERR(bo);
> +
> +		ret = panthor_kernel_bo_vmap(bo);
> +		if (ret)
> +			goto err_put_bo;
> +
> +		perfcnt->bo = bo;
> +		perfcnt->ringslots = perfcnt_ringbuf_slots;
> +		glb_iface->input->perfcnt_base = perfcnt->bo->va_node.start;
> +		glb_iface->input->perfcnt_config |= GLB_PERFCNT_CFG_SIZE(perfcnt->ringslots);
> +	}
> +
> +	ret = pm_runtime_get_sync(ptdev->base.dev); > +	if (ret < 0)
> +		goto enable_err;
> +
> +	ret = panthor_perfcnt_disable_counters(ptdev);
> +	if (ret)
> +		goto enable_err;
> +
> +	ret = panthor_perfcnt_enable_counters(ptdev,
> +					      (struct perfcnt_counters *) &req->counterset);
> +	if (ret)
> +		goto enable_err;
> +
> +	perfcnt->user =	pfile;
> +
> +	return 0;
> +
> +enable_err:
> +	pm_runtime_put(ptdev->base.dev);
> +	panthor_kernel_bo_vunmap(bo);
> +err_put_bo:
> +	panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), bo);
> +	perfcnt->bo = NULL;
> +	return ret;
> +}
> +
> +static int panthor_perfcnt_disable_locked(struct panthor_device *ptdev,
> +					  struct panthor_file *pfile)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	int ret;
> +
> +	if (perfcnt->user != pfile)
> +		return -EINVAL;
> +
> +	if (!list_empty(&perfcnt->dumper_list)) {
> +		drm_warn(&ptdev->base, "A perfcnt dump is still running, let it finnish\n");
> +		mutex_unlock(&perfcnt->lock);
> +		ret  = wait_event_timeout(perfcnt->wq,
> +				   list_empty(&perfcnt->dumper_list),
> +				   msecs_to_jiffies(SAMPLE_TIMEOUT_MS));
> +		mutex_lock(&perfcnt->lock);
> +		if (!ret)
> +			drm_warn(&ptdev->base, "Dump didn't finish, results will be undefined\n");
> +	}
> +
> +	panthor_perfcnt_disable_counters(ptdev);
> +	glb_iface->input->perfcnt_extract = 0;
> +	perfcnt->user = NULL;
> +
> +	pm_runtime_mark_last_busy(ptdev->base.dev);
> +	pm_runtime_put_autosuspend(ptdev->base.dev);
> +
> +	return 0;
> +}
> +
> +int panthor_perfcnt_config(struct panthor_device *ptdev,
> +			   struct drm_panthor_perfcnt_config *req,
> +			   struct panthor_file *pfile,
> +			   bool disable)
> +{
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	int ret;
> +
> +	mutex_lock(&perfcnt->lock);
> +	if (disable)
> +		ret = panthor_perfcnt_disable_locked(ptdev, pfile);
> +	else
> +		ret = panthor_perfcnt_enable_locked(ptdev, pfile, req);
> +	mutex_unlock(&perfcnt->lock);
> +
> +	return ret;
> +}
> +
> +void panthor_perfcnt_close(struct drm_file *file_priv)
> +{
> +	struct panthor_file *pfile = file_priv->driver_priv;
> +	struct panthor_device *ptdev = pfile->ptdev;
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +
> +	pm_runtime_get_sync(ptdev->base.dev);
> +
> +	mutex_lock(&perfcnt->lock);
> +	if (perfcnt->user == pfile)
> +		panthor_perfcnt_disable_locked(ptdev, file_priv->driver_priv);
> +	mutex_unlock(&perfcnt->lock);
> +
> +	pm_runtime_mark_last_busy(ptdev->base.dev);
> +	pm_runtime_put_autosuspend(ptdev->base.dev);
> +}
> +
> +void panthor_perfcnt_report_fw_events(struct panthor_device *ptdev, u32 status)
> +{
> +
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	u32 req, ack;
> +
> +	if (!perfcnt)
> +		return;
> +
> +	req = READ_ONCE(glb_iface->input->req);
> +	ack = READ_ONCE(glb_iface->output->ack);
> +
> +	if ((~(req ^ ack) & GLB_PERFCNT_SAMPLE) &&
> +	    !panthor_device_reset_is_pending(ptdev)) {
> +		if (atomic_cmpxchg(&ptdev->perfcnt->dump_requested, 1, 0))
> +			queue_work(perfcnt->dumper_wkq, &perfcnt->work);
> +	}
> +}
> +
> +int panthor_perfcnt_init(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	struct panthor_perfcnt *perfcnt;
> +	int ret;
> +
> +	perfcnt = devm_kzalloc(ptdev->base.dev, sizeof(*perfcnt), GFP_KERNEL);
> +	if (!perfcnt)
> +		return -ENOMEM;
> +
> +	ptdev->perfcnt_info.fw_size = GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size);
> +	ptdev->perfcnt_info.hw_size = GLB_PERFCNT_HW_SIZE(glb_iface->control->perfcnt_size);
> +
> +	perfcnt->sample_size = ptdev->perfcnt_info.fw_size + ptdev->perfcnt_info.hw_size;
> +	perfcnt->ringslots = 0;
> +	perfcnt->bo = NULL;
> +
> +	perfcnt->dumper_wkq = alloc_workqueue("perfcnt-dumper", WQ_UNBOUND, 0);
> +	if (!perfcnt->dumper_wkq) {
> +		drm_err(&ptdev->base, "Failed to allocate perfcnt workqueue");
> +		return -ENOMEM;
> +	}
> +	INIT_WORK(&perfcnt->work, perfcnt_process_sample);
> +
> +	/* Perfcnt configuration */
> +	glb_iface->input->perfcnt_config |= GLB_PERFCNT_CFG_SIZE(perfcnt->ringslots);
> +	glb_iface->input->perfcnt_as = panthor_vm_as(panthor_fw_vm(ptdev));
> +	glb_iface->input->perfcnt_extract = 0;
> +
> +	/* Start with everything disabled. */
> +	ret = panthor_perfcnt_disable_counters(ptdev);
> +	if (ret)
> +		goto err_dealloc_workqueue;
> +
> +	INIT_LIST_HEAD(&perfcnt->dumper_list);
> +	init_waitqueue_head(&perfcnt->wq);
> +	mutex_init(&perfcnt->lock);
> +
> +	perfcnt->ptdev = ptdev;
> +	ptdev->perfcnt = perfcnt;
> +
> +	drm_info(&ptdev->base,
> +		 "Perfcnt params: Sample size: %#zx Slots: %u\n",
> +		 perfcnt->sample_size, perfcnt->ringslots);
> +
> +	return 0;
> +
> +err_dealloc_workqueue:
> +	destroy_workqueue(perfcnt->dumper_wkq);
> +
> +	return ret;
> +}
> +
> +void panthor_perfcnt_unplug(struct panthor_device *ptdev)
> +{
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +
> +	WARN_ON(perfcnt->user);
> +
> +	panthor_perfcnt_disable_counters(ptdev);
> +
> +	cancel_work_sync(&perfcnt->work);
> +	destroy_workqueue(perfcnt->dumper_wkq);
> +
> +	mutex_destroy(&perfcnt->lock);
> +
> +	if (perfcnt->bo) {
> +		panthor_kernel_bo_vunmap(perfcnt->bo);
> +		panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), perfcnt->bo);
> +	}
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_perfcnt.h b/drivers/gpu/drm/panthor/panthor_perfcnt.h
> new file mode 100644
> index 000000000000..6edcbe256f4a
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_perfcnt.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2023 Collabora Ltd */
> +#ifndef __PANTHOR_PERFCNT_H__
> +#define __PANTHOR_PERFCNT_H__
> +
> +#include <linux/types.h>
> +
> +struct panthor_device;
> +struct panthor_file;
> +struct drm_device;
> +struct drm_file;
> +struct drm_gem_object;
> +struct drm_panthor_perfcnt_config;
> +
> +int panthor_perfcnt_init(struct panthor_device *ptdev);
> +void panthor_perfcnt_unplug(struct panthor_device *ptdev);
> +void panthor_perfcnt_close(struct drm_file *file_priv);
> +
> +int panthor_perfcnt_config(struct panthor_device *ptdev,
> +			   struct drm_panthor_perfcnt_config *req,
> +			   struct panthor_file *pfile,
> +			   bool disable);
> +int panthor_perfcnt_dump(struct panthor_device *ptdev,
> +			 struct drm_gem_object *obj,
> +			 struct panthor_file *pfile);
> +
> +void panthor_perfcnt_report_fw_events(struct panthor_device *ptdev,
> +				      u32 status);
> +
> +
> +#endif
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5f7803b6fc48..cbd0ab77a3cd 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -31,6 +31,7 @@
>   #include "panthor_mmu.h"
>   #include "panthor_regs.h"
>   #include "panthor_sched.h"
> +#include "panthor_perfcnt.h"
>   
>   /**
>    * DOC: Scheduler
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 373df80f41ed..0ca940529be4 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -127,6 +127,12 @@ enum drm_panthor_ioctl_id {
>   
>   	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
>   	DRM_PANTHOR_TILER_HEAP_DESTROY,
> +
> +	/** @DRM_PANTHOR_PERFCNT_CONFIG: Enable or disable performance counters. */
> +	DRM_PANTHOR_PERFCNT_CONFIG,
> +
> +	/** @DRM_PANTHOR_PERFCNT_DUMP: Sample and retrieve performance counters. */
> +	DRM_PANTHOR_PERFCNT_DUMP,
>   };
>   
>   /**
> @@ -170,6 +176,10 @@ enum drm_panthor_ioctl_id {
>   	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create)
>   #define DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY \
>   	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy)
> +#define DRM_IOCTL_PANTHOR_PERFCNT_CONFIG \
> +	DRM_IOCTL_PANTHOR(WR, PERFCNT_CONFIG, perfcnt_config)
> +#define DRM_IOCTL_PANTHOR_PERFCNT_DUMP \
> +	DRM_IOCTL_PANTHOR(WR, PERFCNT_DUMP, perfcnt_dump)
>   
>   /**
>    * DOC: IOCTL arguments
> @@ -260,6 +270,9 @@ enum drm_panthor_dev_query_type {
>   
>   	/** @DRM_PANTHOR_DEV_QUERY_CSIF_INFO: Query command-stream interface information. */
>   	DRM_PANTHOR_DEV_QUERY_CSIF_INFO,
> +
> +	/** @DRM_PANTHOR_DEV_QUERY_PERFCNT_INFO: Query perf counters interface information. */
> +	DRM_PANTHOR_DEV_QUERY_PERFCNT_INFO,
>   };
>   
>   /**
> @@ -377,6 +390,19 @@ struct drm_panthor_csif_info {
>   	__u32 pad;
>   };
>   
> +/**
> + * struct drm_panthor_perfcnt_info - Performance counters interface information
> + *
> + * Structure grouping all queryable information relating to the perfcnt interface.
> + */
> +struct drm_panthor_perfcnt_info {
> +	/** @hw_size: Size of HW related performance counters. */
> +	__u32 hw_size;
> +
> +	/** @fw_size: Size of FW related performance counters. */
> +	__u32 fw_size;

This isn't enough to let userspace determine how to interpret the dumped
block. The layout depends on, for example, how many counters you have
per-block. This is 64 for Mali-Gx10 series GPUs but goes up to 128 for
Mali-Gx15 and onward.

Which parts of the dump are what block, or whether they're valid or
reserved, also depends on the number of L2 slices and the shader core
mask. Whilst this is available via a separate DEV_QUERY, it's a very
roundabout way of decoding the layout of the dump buffer.

It'd be much preferable for the kernel to provide metadata to help
userspace decode which block is which type and what its offset is into
the buffer. Then all userspace needs to have is a table of which counter
is where in relation to the start of its respective block. Most of this
is static for a given device, so could be provided right here with
something like:

	struct drm_panthor_perfcnt_info {
		__u32 metadata_size; /** sample metadata incl.:
			* the reason the sample was taken,
			* the start/end timestamps,
			* gpu/shadercore cycle count,
			* sequence number,
			* error flags,
			* block offsets/indices,
			* ... */
		__u32 hw_size;
		__u32 fw_size;
		/* you probably want a sample_size, if you don't want to
		 * pack the metadata tightly */
		__u32 counters_per_block;
		__u32 counter_size;
		__u32 num_fw_blocks;
		__u32 num_csg_blocks;
		__u32 num_csf_blocks;
		__u32 num_tiler_blocks;
		__u32 num_mmu_l2_blocks;
		__u32 num_shader_blocks;
	};

What we would like to be able to support with panthor eventually is
HWCPipe[1], which supports both our deployed mali_kbase uAPIs (vinstr[2] 
and kinstr_prfcnt[3]) and provides a consistent API for other tooling
and game engines to work against. kinstr_prfcnt most notably returns
samples with metadata to help userspace make sense of the sample layout,
which saves a ton of headaches in userspace.

> +};
> +
>   /**
>    * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
>    */
> @@ -938,6 +964,52 @@ struct drm_panthor_tiler_heap_destroy {
>   	__u32 pad;
>   };
>   
> +/**
> + * struct drm_panthor_perfcnt_config - Arguments passed to DRM_IOCTL_PANTHOR_PERFCNT_CONFIG
> + */
> +struct drm_panthor_perfcnt_config {
> +	/** @ringslots: Size of the perfcnt ring buffer in slot count. */
> +	__u32 ringslots;
> +
> +	/** @counterset: Counter set to enable in Panthor. */
> +	__u32 counterset;
> +
> +	/** @csg_enable: List of CSG intances enabled for perf counting */
> +	__u32 csg_select;
> +
> +	/** @fw_enable  FW counters to be enabled */
> +	__u32 fw_enable;
> +
> +	/** @csg_enable  CSG counters to be enabled */
> +	__u32 csg_enable;
> +
> +	/** @csf_enable  CSF counters to be enabled */
> +	__u32 csf_enable;

I wouldn't want to expose to userspace the HW quirk that counters get
enabled in blocks of 4. Currently available hardware already increases
from 64 counters per block (Gx10) to 128 (Gx15 and later), if that goes
up, you'll either get another enable register (easy fix), or you'll have 
to change uAPI semantics to be a bit per 8 counters, to make things fit.
Ideally userspace shouldn't have to worry about either option.

	__u64 csf_enable_0_to_63;
	__u64 csf_enable_64_to_127;
	/* etc... */

The above or something similar will cover all existing CSF hardware, and
you'd simply need to add new fields without changing any semantics if
new HW grows bigger.

> +
> +	/** @shader_enable  Shader unit counters to be enabled */
> +	__u32 shader_enable;
> +
> +	/** @tiler_enable  Tiler unit counters to be enabled */
> +	__u32 tiler_enable;
> +
> +	/** @mmu_l2_enable  L2 cache MMU counters to be enabled */
> +	__u32 mmu_l2_enable;
> +
> +	/** @pad: Padding field, MBZ. */
> +	__u32 pad;
> +};

A couple of extra issues with the config as a whole, though I think this
can be done as an extension in the future, assuming multicontext access
is solved:
  * you can't get as reliable a periodic trigger from userspace as you
can with an hrtimer, so it would make sense to leave enough of a hole in
the uAPI to let the kernel manage when a counter sample is collected by
specifying a desired period.
  * the HW is capable of starting/stopping the counters without rewriting
the enable masks. With the current ioctl, the config and the start/stop
are intertwined. HWCPipe allows for that use case, and while it is
possible to emulate it with this uAPI, it's not ideal.
  * as with the above, the only way to clear counters is to turn off
everything and re-enable it again, which means userspace has to remember
what the config was.

> +
> +/**
> + * struct drm_panthor_perfcnt_dump - Arguments passed to DRM_IOCTL_PANTHOR_PERFCNT_DUMP
> + */
> +struct drm_panthor_perfcnt_dump {
> +	/** @handle: Handle of the BO to write perfcnt dump into */
> +	__u32 handle;

This requires you to memcpy(), and a dump is not a trivial amount of
data (up to 16.5KiB for a large config G715, for example). This isn't
feasible when you want to be able to get more than a handful of counter
samples per frame when your refresh rate is 120Hz. At a 10kHz sampling
rate your bandwidth will be upwards of 300MB/s for the counters alone,
just to shuttle them to userspace (assuming a 1-1 mapping between dump
request from userspace and sample generation from HW, which isn't the
case - HW will take extra samples beyond that). You can halve that if
the interface exposes a kernel maintained ringbuffer that userspace can
mmap() an entry of, use what data it needs, and munmap() it when done.

> +
> +	/** @pad: Padding field, MBZ. */
> +	__u32 pad;
> +};
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> 
> base-commit: e635b7eb7062b464bbd9795308b1a80eac0b01f5

-- 
Mihail Atanassov <mihail.atanassov@arm.com>


[1] https://github.com/ARM-software/HWCPipe/tree/main/backend/device
[2] 
https://android.googlesource.com/kernel/google-modules/gpu/+/refs/tags/android-14.0.0_r0.53/common/include/uapi/gpu/arm/midgard/mali_kbase_hwcnt_reader.h?autodive=0%2F#28
[3] 
https://android.googlesource.com/kernel/google-modules/gpu/+/refs/tags/android-14.0.0_r0.53/common/include/uapi/gpu/arm/midgard/mali_kbase_hwcnt_reader.h?autodive=0%2F#105
