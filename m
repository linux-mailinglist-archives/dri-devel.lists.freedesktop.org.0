Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BCCB3886B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 19:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF8510E16C;
	Wed, 27 Aug 2025 17:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="14wkTsua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B41810E16C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 17:18:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoWzYmYHpvuHr2NTE1SNJMrbYsZSUurViRxc2Iz016ezI0KltXekRw4P8Q922L8OFCEdxFunt4P/3WqzpKmiV6t34Bv9S0yxhG0485L6x5REU1Df3awbeX3RtB4FklIh+o24G7C29Yzi9ZPWTeESAdyeCHMKj9U4rqBh2ZlYu2K2Y7D0IMYLRRdhekuAT1+qWaV6vgMpXHO+yUKmjJhCkgWFJqzU+phyxTM5T791P6oX6+631pWfr2AxYoczy96ksCrpp2zlfVkBhB59x8hC+QO8TkWdX9ioogiWMiRmGjijFQikl9O64GRnKQ1YD5kLzpcmYyNu5yzXf40owoQJsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9I+VCdpvEvg7u68GJElvnpcKYq5YoB4sQLkuF3apVY=;
 b=N2FWermn/3WdO3Oq8lnwVElF3UGt1ksEY90V5ogkZ2IGoH0N9d1ZYWLglZHJa7K+KV7ZUofkdkqUe6q9KPfSkWWfazuRBnfKvkgxd3am131gwakgj6o5TDeIVY1KYPc7XKoeEFmiMs/yIpeyq/HzBjrVN5tAc/jnLXIRfNNJzFaU1mD4Pi9kxvjjFFB78xsFAJfsEkNwN8WiulHLpccLWn6DTfbiwSroudl6wUC+2Kfk5Ei8s8PQHbCBmQxACNflBiR9Z7X+AJnsiqVSvyH170PpipL8FsW0BH6BqLqFb5zFIA0BWmW+OgigNDs+Dx8Z0SiZIuZ8M8TA67F6iVtxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vivo.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9I+VCdpvEvg7u68GJElvnpcKYq5YoB4sQLkuF3apVY=;
 b=14wkTsuaJxRENj79ejIrRLRYBKz1s5c6ThKbrZ++J5n7gaIElmNFIKh0z98yuSh7pMUoo2Uv8FjyyV616xlszDl7McONV/Qa2OCfjo9+dyNeOjDbIEJVwmEqIMWj/U3cyd4ibPEHxK4F4N8tyt8cLPpWNzGCwLBxp1x7Fs51Yis=
Received: from BY5PR04CA0026.namprd04.prod.outlook.com (2603:10b6:a03:1d0::36)
 by MN0PR12MB5907.namprd12.prod.outlook.com (2603:10b6:208:37b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Wed, 27 Aug
 2025 17:18:14 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::48) by BY5PR04CA0026.outlook.office365.com
 (2603:10b6:a03:1d0::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Wed,
 27 Aug 2025 17:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 27 Aug 2025 17:18:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 12:18:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 12:18:13 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 12:18:12 -0500
Message-ID: <6222cb69-fbb5-07b8-043c-cf0c25c9f3f0@amd.com>
Date: Wed, 27 Aug 2025 10:18:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Use int instead of u32 to store error codes
Content-Language: en-US
To: Qianfeng Rong <rongqianfeng@vivo.com>, Min Ma <min.ma@amd.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20250826072917.186638-1-rongqianfeng@vivo.com>
 <51440ea7-bbea-c890-057e-109685a72cb3@amd.com>
 <eaefefb6-7ced-4c47-8bff-bae83f143b72@vivo.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <eaefefb6-7ced-4c47-8bff-bae83f143b72@vivo.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|MN0PR12MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 092292f1-063e-4c08-150e-08dde58db4b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0NmeTg0SURpMnRDZDZ3Rk9pY1FmZUxONzRoUGRjUVgyTEdTRjZabmRmSkpY?=
 =?utf-8?B?UEx0eVFzN0ZtZlFZSDdaSURxK2RmaWM4S05QV0xmSFZWQ0FFaDRXWldxdHlG?=
 =?utf-8?B?VmU0QnVFek1rUmphTWVHM3F0YjdoUHpWbDRXUkxTWkphUUR5UktPZUQrbVhv?=
 =?utf-8?B?Zk14ZWtaeXBLcmRwalc1Vk1RRWZRazFkRkpxL2hhSFR6VmQ1WDR5bXMvWHM3?=
 =?utf-8?B?NzFvaWt5RkxvVXppTVpOTDNaWEkrQll2RFpuMElTMDBWcHRFMjNPK1EvbWZx?=
 =?utf-8?B?Zjd6TUVyL1FiWFh6bjJlV3Yxd0tLT1p5UDFGZ09EU2E0QnUzSFlWODlaWEc4?=
 =?utf-8?B?NytzMjdpc3RwdWdzODBYYWNQQzhZcDdCSzJOa0w3b0dVa0x1UStnTmxXTjJZ?=
 =?utf-8?B?Vm12bThkUUVxQ21YcmFUWk9uQzl1RVRXMjFFcXJjUkxHNkRqVHlwN1owWU5I?=
 =?utf-8?B?c256VVc3UzhDQUUyc01odS8vZlYvVkVnVUh0TXJrb1pmelVPNUErcGtKK0FE?=
 =?utf-8?B?bXB0QkJlc1NNTEdVRThYUUZuMlJDYnpHRDhLVkgyU24reFpjYWxWVnl0dDM3?=
 =?utf-8?B?eXFKdGp3d01vd212OWZnYkt2ZFBNcUF6c1htRCtoMEIyRGlFUmRBSTIraC9M?=
 =?utf-8?B?TG05NDRId1J2dGZEeWpXTWxUOUxpdm4vVEZvMXMwdHZGcTRmM202K1p4N0Nl?=
 =?utf-8?B?TTBMY215ZUJHeEs3N3JoSzNNblNOZmlxUmRWRzllcEhDMFlwKzhDZytUbEpP?=
 =?utf-8?B?N0xOZzNyQU0yTUI2dTBNYjJmMnV4b2RpUWtTaGNjVVRkTVhnV0h5cVFoYVdp?=
 =?utf-8?B?VGduM3kzV00wT0ZTTWFFdCs5Y3RkNkRlMnIxSCtHNzlvZUJFNHpJeTNBaXUz?=
 =?utf-8?B?c0x4OHV4dldtR3JtY3FhRXpXSTVHQkxBbDB4WlQ3WVBIVUhQRTdzUlNuTXFv?=
 =?utf-8?B?MGFCS3FnQU53R3hTT2g2UUhlK09oMzlqdEtqTjQ2Vjd6bExkRnlwdERtQWpp?=
 =?utf-8?B?akZ4RnA3T1dXZXZqM1A1ejBPVW1qSUFvbFEyT3MyOHdTL0g0UmJQcE1VVlNW?=
 =?utf-8?B?MklHR3RBbkQxa3Z0NWN5ckR2YmoySWZhZ2tDTG0zTjdtUWFjdmdxU3ZGVXJP?=
 =?utf-8?B?c1hlL3RuMDhoR3BuV1dCaUdYbHp1MjIzUjZsRWNFUnNhSmVHS2svTTlwb1l2?=
 =?utf-8?B?NEVyTm5vWWE0R0VOTFQyOVAwblE2OWxyRG9Fem4xc0R5Sm5zdXAxc1YrOUFp?=
 =?utf-8?B?d081OE1BeTZDeGZ1TXRadkxBTUhkVUd1YWJsWXFsby9GNWI3MUxZajRZc0tD?=
 =?utf-8?B?Q0RHTndvYjNpbjBaQXR1UlVSaS9NZnBka01YN3VoeCtyR0RrUjB0WXlCa1VF?=
 =?utf-8?B?bnRYT1FXZCtHWndDZTdhMUZGM0Fub0pNVmJrTjQ3ZkUrT0VpVFVLUTFKd1lQ?=
 =?utf-8?B?NDZIM1NUTXY3c050MHNJMkpzeEpidGcxZWY5RWJjS1pWSUZtUjdqNW5wamVv?=
 =?utf-8?B?MERVRFpOVU93NEgxbjA5UWl4cmJYVFZxV2lmZVVHQWlzL1VOaG9tRjZQSjdy?=
 =?utf-8?B?emtCUzhKZWZvMFZnTXBwVGVzTFF1Y2tvMlVrSE10bnV6WDBWQkQwZVlDaTU3?=
 =?utf-8?B?M0J5QnZtajZBdkFsaVNLOFNiQ0tTdVJQVXE5RW5PRXJYTm03QXV4Vm5PMk5T?=
 =?utf-8?B?R3dMNGNMeXl3N0FCeittTjJNSXYyY2F5L3pmdDM1dDJiYk9pSExsZzdESHAv?=
 =?utf-8?B?anpoOVA1c3Yrb3BTdDBDUXArWDB2c2hmR2hVUGNoRzJ4SzNlYk9wMGV2TTJZ?=
 =?utf-8?B?dmUzUEpHdEZxM0NnQTFMNm9USUJsUXdYTld4TGZQajZNUWRnY3I2SFA0N1Za?=
 =?utf-8?B?N2V3bGFuU014Q0ZLUGNYRDAxMlFScVlnNDVoY0dtNmFNbk56YjNWc1lBeUd0?=
 =?utf-8?B?YkM5bmpEOExkQjZEWFYrcUlZemlsTWp0QXJ4NFBRMkhSd2xkenovdTFSNVRr?=
 =?utf-8?B?dDBWd1lXbFFSZlNuRC9qS2RMN0Y3ZTlJclhiMUxqMnJCc0htZjdYd0dGN0Nv?=
 =?utf-8?Q?KsD2uC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:18:14.0046 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 092292f1-063e-4c08-150e-08dde58db4b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5907
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


On 8/26/25 19:15, Qianfeng Rong wrote:
>
> 在 2025/8/27 0:31, Lizhi Hou 写道:
>>
>> On 8/26/25 00:29, Qianfeng Rong wrote:
>>> Change the 'ret' variable from u32 to int to store -EINVAL, reducing
>>> potential risks such as incorrect results when comparing 'ret' with
>>> error codes.
>>
>> Sounds this fixes code issue. Could you add "Fixes" tag?
>>
>>
>
> The 'ret' variable stores negative error codes directly.  Storing
> error codes in u32 (an unsigned type) causes no runtime issues but is
> stylistically inconsistent and very ugly.
>
> Logical errors with 'ret' only occur when it is compared against negative
> error codes. For example:
>
> u32 ret = -EINVAL; // ret becomes an extremely large unsigned integer
>
> if (ret == -EINVAL) // This condition will never be true
>
> This patch reduces the likelihood of such issues occurring. Since it does
> not fix an existing bug, I believe there is no need to add a Fixes tag.

I agree with the change.

u32 ret = -EINVAL may lead to a gcc warning if -Wsign-conversion is 
enabled. That is why I suggested Fixes tag.

Lizhi

>
> Best regards,
> Qianfeng
>
