Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641B1C625EB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 06:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B274910E181;
	Mon, 17 Nov 2025 05:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="CCGJhlTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010064.outbound.protection.outlook.com [52.101.85.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BC810E181
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 05:12:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+RLI7+srrV9mkOuSWmqU23CeLa2vvNb1kGwWRAmMxY/b7/PT/7Ts4oUubzEIKWi1JT7nXSqJaNHekZZqbZ+OO9Fp54YCnn6EKPiiLwFuKNLAm1q2nguRsHYcSMSm5NI1gZO7sFhH06+q2QRCOXcSfscxXkpPOWrDlf66botnA3MGq3kr34Px5DlCqAQMN71t/XZfjACEC47gr/Lvo6cLSXtNrEEC5la3YyfAB8oLcF41GwOmjWP4TfcniP/xvbIza7Po3KWKCIOK/nfBMgABSyUrphQL3iBimffkE8Q+kWKsCiS+EHlhFCs8z44gF51we/nE9cfZZgKqx/wMIaF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WT4SBD6yB7l34eOsHab5B5G8LuBUYMeWoj2dEYuvmh8=;
 b=b50An5J8n856xN7ArIoIYN+/PhTOvszHERsAkgXrnMqZw6J7oYOvnjVyl2e+iuEb1pBpMopJTtmy8Q1XiZZgi6hMesfcqcfv8t5iZJp5mpsF+VkSHMqOL0AH09emgfK9zi7E1dcIeqw2UEGgD79LbQEqb91RF8G11T51E3iOBRscblfbNsPiA0+NQyozfmyaHjUZdIpkuxD6/NbPpbq8yxi9D+zLeGhWH8Dd9grLJHANYZEgj2fWtBpQ7MJAOfbyl8QadJbdwAmN2sdhtufzmQuGRXMmTR+vYV28OMwx09UegsG4/71PvvN6qshn+AY04kJEw+eZ5pYZdXurOmFTYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WT4SBD6yB7l34eOsHab5B5G8LuBUYMeWoj2dEYuvmh8=;
 b=CCGJhlTlXDpTWFQ89CW0IdBlLtpQz1aFdVXa1vDZLyvss6zyGqKTc3b8M5vVElO+wrrukt0XZomXe4hTn7eXCvgoz7Lij8oJ+E/iJcdXLfteRe/dy5HlmszHzAnfiV41dJzDuJorvzc2ATVf3hwlziRAhbWfQ5W7LiLRiazi+8w=
Received: from SJ0PR03CA0230.namprd03.prod.outlook.com (2603:10b6:a03:39f::25)
 by DM4PR10MB6279.namprd10.prod.outlook.com (2603:10b6:8:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 05:12:37 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::76) by SJ0PR03CA0230.outlook.office365.com
 (2603:10b6:a03:39f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 05:12:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 05:12:36 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 16 Nov
 2025 23:12:33 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 16 Nov
 2025 23:12:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 16 Nov 2025 23:12:32 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AH5CRlG1911460;
 Sun, 16 Nov 2025 23:12:28 -0600
Message-ID: <c380c950-0649-428d-a0a8-86ed031c9a86@ti.com>
Date: Mon, 17 Nov 2025 10:42:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/tidss: Power up attached PM domains on probe
To: Francesco Dolcini <francesco@dolcini.it>
CC: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <h-shenoy@ti.com>, <u-kumar1@ti.com>
References: <20251114064336.3683731-1-s-jain1@ti.com>
 <20251114064336.3683731-3-s-jain1@ti.com>
 <20251114153925.GA62911@francesco-nb>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20251114153925.GA62911@francesco-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|DM4PR10MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 10424560-bf8f-4c2d-6975-08de2597ec2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFJoeGo5NHVONW9ZQXpTdGpGSzZTQVlYK0xFSzhBbDlLQS9pbVE5UnJYbk1H?=
 =?utf-8?B?SGlzL0ZsQVV4OHo2N2JYOEZGV2wyOEhzaWVseTZvUUYxUEhUUEdYUHZ1cVI5?=
 =?utf-8?B?UElTUFNCUyt5eCtwc2h5akJCSld3MnJ1akE1Q3RyQ05Pb0pWbk1hb3NBQzJ5?=
 =?utf-8?B?QWwwQjcydi8zSlZFREtPS3oxditTelYzNkdMMVV5K3BTSksvS3Iwajc2YXYx?=
 =?utf-8?B?WmpGZ1l0VUIxbkFrR1d3Z1JQSitUUE5vTDNITEpob3pjWWpKeUZoSysrbmZX?=
 =?utf-8?B?eU9FNlhqbFAyU0M4SjZoTjBwbyttOXIyMnkvUE1zMXN5NjZrVVB5aHJFWEVo?=
 =?utf-8?B?dFJ2VEdrc25pVWpXVis0ZkhxUXQveE90NnB2S2xybERGQ3dPSy8xb2RBYlVw?=
 =?utf-8?B?QmFFLytzVSt2aHZhcGF5QUx1TCt2RHUrazByaTk2TXZmTmkwK3AzbS8yUi9a?=
 =?utf-8?B?TlRRcVZmOXVCZXNYdTlwM2wzZEw3OU5qNmp5eDVONDZUMnZ6aGRHaks1UVVv?=
 =?utf-8?B?NlVzbEtWT05vZ1Z1bTJsQXUyMDRWZFRmM3l1L1ZZOFdJYUc4ekpTZFBuWlBw?=
 =?utf-8?B?QzRPZDZ3cHFRdSt4WXlVM3RuRGNGVC8xeUJYckdzZEt5ZUZ5QWw3ZG9JTEtF?=
 =?utf-8?B?NDRTR2thWjhhK3lETG03Q0c0WnVvSERjSUdRZzJKQkUzOHc1Rm5mZmFmS1J5?=
 =?utf-8?B?dHZjVTZLT1RveFBGaU5LUnVHK1c2bDNSYkZEeVhsbTJWTDlhNm5tR1YzTmdH?=
 =?utf-8?B?aUVJcjVKOTZTQWpLT3N1SzVQYnhFUlh3SEc4Qk9yUUJEbVR3Lzcxd2UveWJP?=
 =?utf-8?B?blYrV1B5YTRuWEhUbjRRQkgxRGJwVHhqQnNoZ2wzRXVFeE9NeXN2K2hSb0R0?=
 =?utf-8?B?NzJ5aDNaZDdmdkNKSzB4TFJXLysyM3hCY2gvem9YN0x2NXZVNkx6Q0l4TWlW?=
 =?utf-8?B?SFJFMmVqdytWViswblR6VU41bEtiTjBsRk84UjJ3NUd6V0ZwNWFzdHU4TnpT?=
 =?utf-8?B?eTczN29IbE1TM0xqTjVaWXlXQlFTMzAxUzB5c2pneFFQT010SkNNWVEyQ1B5?=
 =?utf-8?B?Mm1CL09hREF5L1YxN1V4YlpYUzdqbmI1VmxFSVNZNmdLazZSUzdnZTJ1Zncy?=
 =?utf-8?B?QkhpMG15MHhkejdPR2lFUUhEclUwbmYzMWo1VERsTGxNcHN5WTdvbDBpLzll?=
 =?utf-8?B?dUN1RzR4Z1o3TmJUbTRlbGlOK3ZuVm5Qb0ttWkQ1M1h4VzJoeE4zR0x0c212?=
 =?utf-8?B?bXhDRy9FSHN5VkczN0N5UTlMbTRzQkgzWVJTU0NLdWFiRU5zWHRzNXkrRS8y?=
 =?utf-8?B?bklDSjZxb3NuUmc3ZXVzK3FDU08weUNJMG1ORklKV3lQQXNLR2hiRjh6Ymox?=
 =?utf-8?B?NHU2by9KR3d3MzA0TW9SK3VVbjcyM3loZlB0bmxUZ0svMitGN0NwcWNRbysz?=
 =?utf-8?B?WVcwMkt5dVcrbGdYb25Sc0pubjBValowMVZxWEhQbmFTOG5NLzAzR0s1ZDdF?=
 =?utf-8?B?MEdjN1lpay9MN1YvOStLemU0U3o0Q0ZabWxiKzJFOW5VZHNHc2FpZHhuaWcy?=
 =?utf-8?B?cjhKSGMyT2p0c3VnYXowNSsydXZLVlNTb0lmdHNTOVRQMm1jckRxQU91K0FV?=
 =?utf-8?B?L1J2My9hNFZNbXJ1cndkYks5TWw1ZjVvV0JreDU3bWxySGdBYmR1UUZWU2lD?=
 =?utf-8?B?QjRWWTBuYlZRNWk1V0VIblFMYmloUENnTmt4R2U4Zy9QS1NVMUFpNWlBM2hl?=
 =?utf-8?B?VlZhcHY2V1dpRUNIMVQxdkRTUE0zQmY0cUZMRGhnckZzQlBLRnN1NHR3Y1Jj?=
 =?utf-8?B?Mk84Y0VIY1JWZzcxWnRnUDB3T2dtMFdaQlJ0R1FlQUlpRFppakVTblpFaEM1?=
 =?utf-8?B?RzFOT1NlY3V1KzB4a3c0NmNFSHhiT09oUXZyYlBZNVVic3NsdUkvRkxVaU9Q?=
 =?utf-8?B?c0I2QXFjd3ByWnBBd1pzem9Ed2I5UHlvaDlaUEY2OUxhR1ZnRmZ5bXVWYllu?=
 =?utf-8?B?bG04YWFWeStKWndIZHVaT2ViWE9Mbm9hdlZrUVVEdFB6TjViZWQrcjZSd1Ft?=
 =?utf-8?B?WjhQU0NpalB0VlVQbmErSTdyR2JTaDJwQ2IwQ0J0alpiOXNiTytaTmlLU0ZS?=
 =?utf-8?Q?2pzE=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 05:12:36.4787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10424560-bf8f-4c2d-6975-08de2597ec2e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6279
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

Hi Francesco,

On 11/14/25 21:09, Francesco Dolcini wrote:
> Hello Swamil,
> thanks for the patch.
> 
> On Fri, Nov 14, 2025 at 12:13:35PM +0530, Swamil Jain wrote:
>> From: Devarsh Thakkar <devarsht@ti.com>
>>
>> Some SoC's such as AM62P have dedicated power domains
>> for OLDI which need to be powered on separately along
>> with display controller.
>>
>> So during driver probe, power up all attached PM domains
>> enumerated in devicetree node for DSS.
>>
>> This also prepares base to add display support for AM62P.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> [j-choudhary@ti.com: fix PM call sequence causing kernel crash in OLDI]
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> 
> you need to add your signed-off-by at the end

Thanks for pointing, will add.

Regards,
Swamil.

> 
> Francesco
> 

