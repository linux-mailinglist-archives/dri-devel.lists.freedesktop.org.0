Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEF2B953DF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F48E10E5CD;
	Tue, 23 Sep 2025 09:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EDyGvXf8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010001.outbound.protection.outlook.com
 [52.101.193.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312D610E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:26:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xlgtb3pwG5cxpmll86t66qtuWFBZ4PuEbrbmQ25BKd9Mvr9VK40bF0i12QaXGTqHfynP0iLFo+Bfv58lwvluD0LLDYErZSjupDxvCSjt3bwTZZVKw4DY9SpP1tGQb1SECq1fZPF2Gji+89L3KVLWDozowW2dbi10CDzgkA9RMR8ktY/9fdhXkIsWz+uNl/WVOjwGoWawsJdnxLLH+rS5c8ad3RLSmGVhiVuy4x5kXE2A0ojOqYxByMqo+WLjgp6vZuDkTqhGhNzGIEdMhSoJAE8vgR6Z4eopdnRyVoB9Somj54ZmYy1ec20d8btlQZMiGuwEhXMw9uyctbJCmqiOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9sxpcpQFWIGUqaxJFn/olUCPz/E1D7bmsVKTL+fcnY=;
 b=J8fYDWDXI04o/OKfqdL9DIj3qjbIimD45SuWYHSaB3cNkq2POrJVeXbBASMTYvRYMfx94VtGE/MpOAw/QBg4ZFv9+UvVIf1hm3N9DXup8BFaqCjS/z8PiagecEWOw3o7kv9NQkWWl3kTLTY+wPTHFayY9ukAkNBbQycjoFAfmfDt8tdgEiSHfW2ge8HS6hKvyb8R1xPBkyoAMrvQBJ9iOY1lf5cmlPnWuL/Tw/rAf85jIpuphBwKRZ+gn+YqE/Azvrtz1UqMzoezc5wnt1t3Y3rOmrGNY3KJttrKuNAwfGBKGtt0u/hW7DCzSWsUhFtE2owYpr9GZD+Rcq46AJsHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=suse.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9sxpcpQFWIGUqaxJFn/olUCPz/E1D7bmsVKTL+fcnY=;
 b=EDyGvXf82heVvwwtnHxY9N64/U+hMzM0VCRi9yLIWsHrcT10zVd+5BnWYpuX9tFNHSz7/gLVWdf8v64aHq0DNxHLfPDzXSNk8iC+rUktPv75OfWXUhsf0DavUpwK0wBS2fm1SvVAQUwgt6R1AgfbO8tzNgva1IZDFdo6T0PJvtQVLH2VA0koAeUvHV2BxFFE/vN7pUj7gJycmBEh8/sNs83YZc54dAA2slwVWP6Ttw+XzfAaOBPYStI9zqCanoAMWVoYA9+1wWtoVrIaIXwUmhPvj+uWFMqdFRCVWQSTZZPrToH3kNiwyiGV7FRwKz9ccxy4mAqBTZgfjo6Akq1TDg==
Received: from SJ0PR03CA0144.namprd03.prod.outlook.com (2603:10b6:a03:33c::29)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 09:26:31 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::bd) by SJ0PR03CA0144.outlook.office365.com
 (2603:10b6:a03:33c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 09:26:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 09:26:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Tue, 23 Sep
 2025 02:26:17 -0700
Received: from [10.221.136.181] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Tue, 23 Sep
 2025 02:26:15 -0700
Message-ID: <ccb24ca8-60e6-48b7-aff0-d1774630c700@nvidia.com>
Date: Tue, 23 Sep 2025 11:25:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ast "WARN_ON(!__ast_dp_wait_enable("ast, enabled)) on reboot
To: Thomas Zimmermann <tzimmermann@suse.de>, KuoHsiang Chou
 <kuohsiang_chou@aspeedtech.com>
CC: <dri-devel@lists.freedesktop.org>, Carol Soto <csoto@nvidia.com>, "Matt
 Ochs" <mochs@nvidia.com>
References: <d81cc339-43c9-4529-ace5-29a687378b0d@nvidia.com>
 <bfb9cf60-decd-44c8-aee7-061fb64d5041@suse.de>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <bfb9cf60-decd-44c8-aee7-061fb64d5041@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|MN2PR12MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: f325aea9-89c8-474d-9660-08ddfa834786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2JCZGVRVjRvYVNhMkJkcnNXSjJPdWFaOFRxOWhlbDVRZll6cFhOd2hITlpq?=
 =?utf-8?B?YjBzMENIbkh3ZHNLM21ZOWE5OTc5NkZnYytRSXo4NWVuQ3Rab3NiVGlYOUNV?=
 =?utf-8?B?MXFaL2FaTnpjZmlYLzA1aE1xbEZnRGMwWE9NL2lNd3VwUkFSSzAyMVdaVTBF?=
 =?utf-8?B?SCt6dWtjZ0d5bFdydzRodHBickdUZmd2L29UUFZSNGhWVkMvSmlUVUQ3dWpY?=
 =?utf-8?B?L0FMY3NnbVRXWlU0S0REMU5Vdjc2c0QyeVZsQmlOTkVUS1JRdWs2OE5GeTA2?=
 =?utf-8?B?OWJjQmlSSlNFdmRzTHZFTDlxSHdHYi9WZmRyZXkvbjllMGVnbElvY3pUaWtZ?=
 =?utf-8?B?YXJZdWcxSldLb0tyMnlTMkZBVGlWT2s3cU9OL0ErL1ErYWRBWXB2cFRVQkVB?=
 =?utf-8?B?Q3dpbHluNEFtbzd6ZXorTFh1TWY3ZTgyaS9jcHlVaWtPb0VPVjAyTUZOaUVy?=
 =?utf-8?B?c1pkaHRla1gxeHRscW1va1pTSGY0ZGRCVkxGQWV4V3JaeTRObFF6RWVFaTJv?=
 =?utf-8?B?aU15OFhEVDZzM1pVbU5aNVlQc1hESG02QVlrdHE5ZjJ3bVZFVCt0VkdFZVdt?=
 =?utf-8?B?WmczNEhBVlBZVTZGVzBxejVqMjIydkJyQVFJZm1EZm5mblVKaEpnMkI4dC9U?=
 =?utf-8?B?MVFrM0lGTllvK0d2ZFBtWVN2SW5Edjh4aVlCV0pjVVliT2p1NEUxY1Qwcm1n?=
 =?utf-8?B?NjJUSmJKMWd4aEJWa0dnUUMrd2E1UVVKdmlJTXg1enlXRGJvWTJoMThPOXlS?=
 =?utf-8?B?NnRXc051NzNPNzJBcFlrRWppUW43cUlmZWM4RDN3NDk0dFIvQWxKWUZjK2FD?=
 =?utf-8?B?aFh4QkRYRVRyR2kxWmxqWmNMRk95UjM3cmQwUkFWNTlKWXpXekNMQy9HTXB1?=
 =?utf-8?B?SGtoWWhXbVM1Q29FdkJGRUl0Sk5tNGtIN21xMG50Tjl0MkNQbitVUlZUdjhE?=
 =?utf-8?B?eHV2UVZhdkgxWlRSU1VXbFVQaVB6Y25uU1dWMmFRc2Zyckd3bjdlRjNVeHhp?=
 =?utf-8?B?dnNCSFV1ejhDWUxTS2c0R1RybVBXRkRSUUtYeTZiVXhvZC9uNS9nSjB3R2hL?=
 =?utf-8?B?elljS2xlRmozUHh5cFVSZTNVYmhjeHpDZTlxREpnMjVpbVRTYW9WMS9QRWtn?=
 =?utf-8?B?Z01mcVQzU2JWUWxsMzJOYUU5VXFtUU4rSW5YN2FzQTNLaHl2K1JQY1loaCty?=
 =?utf-8?B?Ymc4bVNjU0RXS3ZRU2NJelNxYkxMcUcwUHpEQ05QZnRNYTBQdDFCT3d6VkVQ?=
 =?utf-8?B?Mm9qRmVGSHJOVlUzVjBkL2FwR0w3TVAvQU9wSGxrOStqa3VLL1pQQnpaeVFi?=
 =?utf-8?B?VC9sQnVac1VGQjBiTnBXMWhmaFJwNTNQRThJZUFGcHlCVnVWdXVmV09rRE9E?=
 =?utf-8?B?bWVyMnlzRVc0RW1TYUVERFR3c1oyejN6YnJoSWhIdUk0VlpRdk9tVVUvRjNY?=
 =?utf-8?B?TU12czZ4aTJuYzVZL05xeFN2NjVGTndzVjB1Sm1mOUlqTjJhb1N2cFpGTnNp?=
 =?utf-8?B?a010NjdEUEF3ZUtkSEdWdXZlR1VxMFJtajJ1N2NEUXVvWFlmQUlYOU5yNGV5?=
 =?utf-8?B?REZ3ajJuWFBveWQ0OHhEOEwrVDR6c0g3SUhyTW1sMU1QcDhlK2dFdDZSME02?=
 =?utf-8?B?QkwyK1pEQ2d3UTNIaXBmbWZ1cW0zUmpWTzNYWlZZTiswMzBzQzE4Um5reWtL?=
 =?utf-8?B?N20yYVFoUnRYeXErUC9Sd2pHUWtoNTNtQkozeTI4WDlUbmgxSFd6NjJ6WVRK?=
 =?utf-8?B?ME5TMDkxSVh0VmVJdzkrNEZJem9XTzdVempUWVYzYmlVbTA0QTlyUThiSkZC?=
 =?utf-8?B?Q2czeGZIczh6SVpVcGJjZkxYYURMMk16OFhnT1libEMzMmVaUDJ2Nk1HT2E2?=
 =?utf-8?B?emRHNEhhNXRPc2N2MitpTyt5Z24zQ1M2S3FoeC9EcXpKWWVyZkw5N2JlN1dK?=
 =?utf-8?B?MVhLSjZtTXZZakVvVXA2bEZXUE80RXJtS05EdmtZLzFYSERUai9ldWQ4SVBr?=
 =?utf-8?B?NzhkR0J5dkVEMDk2TUhEV3RiV25yWDlKUTV6bjc2bEVaT0p3NFRTNlBHVkps?=
 =?utf-8?Q?Rq9RdB?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 09:26:30.3821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f325aea9-89c8-474d-9660-08ddfa834786
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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


On 23.09.25 11:15, Thomas Zimmermann wrote:
> Hi
>
> Am 23.09.25 um 10:34 schrieb Nirmoy Das:
>>
>> Hi Thomas and KuoHsiang
>>
>>
>> (Not sure if there is separate portal to report AST issues. Let me 
>> know if there is one)
>>
>> We are observing the following trace on every reboot. I tried 
>> increasing the timeout value but that did not resolve the issue.
>>
>> I tried to read AST_IO_VGACRI(0xdf) and AST_IO_VGACRI(0xe3) which  
>> returns a value of 0xff. I wonder if
>>
>> the device is accessible at pci_device_shutdown().
>>
>> I have attached the lspci output for your review.  Please let me know 
>> if you have some ideas how to debug/fix this.
>>
>
> Is that a new problem? I occasionally refactor parts of the driver. It 
> could happen that an older version works?


We saw this on 6.14 and 6.16 so I think it is not a new issue. Should we 
try out more older kernel?


Regards,

Nirmoy

>
> Best regards
> Thomas
>
>> [ 196.248014] ast 0008:02:00.0: [drm] 
>> drm_WARN_ON(!__ast_dp_wait_enable(ast, enabled)) [ 196.248045] 
>> WARNING: CPU: 76 PID: 1 at drivers/gpu/drm/ast/ast_dp.c:282 
>> ast_dp_set_enable+0x124/0x158 [ast] [ 196.277550] Modules linked in: 
>> bcache qrtr cfg80211 binfmt_misc cdc_subset ast dax_hmem 
>> drm_shmem_helper cxl_acpi drm_client_lib cxl_port i2c_algo_bit 
>> cxl_core ipmi_ssif drm_kms_helper uio_pdrv_genirq uio coresight_trbe 
>> arm_spe_pmu arm_cspmu_module arm_smmuv3_pmu spi_nor mtd 
>> coresight_funnel acpi_power_meter acpi_ipmi coresight_etm4x coresight 
>> ipmi_msghandler dm_multipath efi_pstore drm nfnetlink ip_tables 
>> x_tables autofs4 overlay isofs nls_iso8859_1 raid10 raid456 
>> async_raid6_recov async_memcpy async_pq async_xor async_tx xor 
>> xor_neon raid6_pq raid1 raid0 linear mlx5_ib ib_uverbs ib_core 
>> mlx5_core ghash_ce sm4_ce_cipher sm4 sm3_ce mlxfw sha3_ce psample 
>> i2c_smbus sha512_ce nvme tls sha1_ce arm_smccc_trng nvme_core 
>> pci_hyperv_intf spi_tegra210_quad dax_pmem i2c_tegra cdc_ether usbnet 
>> aes_neon_bs aes_neon_blk aes_ce_blk aes_ce_cipher [last unloaded: 
>> ipmi_devintf] [ 196.355667] CPU: 76 UID: 0 PID: 1 Comm: shutdown 
>> Tainted: G W 6.16.4-dev-main-nvidia-pset-linux-6-generic #16+f4490439 
>> PREEMPT(none) [ 196.369453] Tainted: [W]=WARN [ 196.372481] Hardware 
>> name: NVIDIA Grace CPU P5041/P3880, BIOS FF.04.00 20250422 [ 
>> 196.379955] pstate: 63400009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS 
>> BTYPE=--) [ 196.387073] pc : ast_dp_set_enable+0x124/0x158 [ast] [ 
>> 196.392148] lr : ast_dp_set_enable+0x124/0x158 [ast] [ 196.397221] sp 
>> : ffff80008049b930 [ 196.400604] x29: ffff80008049b930 x28: 
>> ffffa507dbec1b98 x27: ffff0000acb337b8 [ 196.407901] x26: 
>> 0000000000000000 x25: ffff1003985d2e00 x24: ffffa507dbdc45b8 [ 
>> 196.415197] x23: 0000000000000000 x22: 0000000000418958 x21: 
>> 00000000ffffffdf [ 196.422495] x20: ffff100008bac0c8 x19: 
>> 0000000000000000 x18: 000000000000004c [ 196.429790] x17: 
>> ffff100008b5f200 x16: ffffa508522b5ce8 x15: 0000000000000000 [ 
>> 196.437087] x14: 0000000000000000 x13: 2d2d2d2d2d2d2d2d x12: 
>> 2d2d2d2d5d206572 [ 196.444384] x11: 656820747563205b x10: 
>> 0000000000000020 x9 : ffffa508523621cc [ 196.451681] x8 : 
>> 00000000ffffffff x7 : 0000000000000030 x6 : 0000000005000000 [ 
>> 196.458976] x5 : 000000000000004d x4 : 00000000000000c0 x3 : 
>> 0000000000000003 [ 196.466271] x2 : 0000000000000000 x1 : 
>> 0000000000000000 x0 : ffff000081356040 [ 196.473566] Call trace: [ 
>> 196.476061] ast_dp_set_enable+0x124/0x158 [ast] (P) [ 196.481135] 
>> ast_astdp_encoder_helper_atomic_disable+0x28/0x90 [ast] [ 196.487630] 
>> disable_outputs+0x11c/0x3c8 [drm_kms_helper] [ 196.493160] 
>> drm_atomic_helper_commit_tail+0x2c/0xb0 [drm_kms_helper] [ 
>> 196.499753] ast_mode_config_helper_atomic_commit_tail+0x34/0x58 [ast] 
>> [ 196.506427] commit_tail+0xd8/0x220 [drm_kms_helper] [ 196.511503] 
>> drm_atomic_helper_commit+0x174/0x190 [drm_kms_helper] [ 196.517824] 
>> drm_atomic_commit+0x94/0xe0 [drm] [ 196.522392] 
>> drm_atomic_helper_disable_all+0x204/0x220 [drm_kms_helper] [ 
>> 196.529158] drm_atomic_helper_shutdown+0x90/0x158 [drm_kms_helper] [ 
>> 196.535567] ast_pci_shutdown+0x1c/0x30 [ast] [ 196.540020] 
>> pci_device_shutdown+0x3c/0xa8 [ 196.544216] 
>> device_shutdown+0x140/0x2b0 [ 196.548229] kernel_restart+0x4c/0xb8 [ 
>> 196.551974] __do_sys_reboot+0x148/0x260 [ 196.555979] 
>> __arm64_sys_reboot+0x2c/0x40 [ 196.560074] invoke_syscall+0x70/0x100 
>> [ 196.563907] el0_svc_common.constprop.0+0x48/0xf8 [ 196.568712] 
>> do_el0_svc+0x28/0x40 [ 196.572097] el0_svc+0x34/0xd8 [ 196.575220] 
>> el0t_64_sync_handler+0x144/0x168 [ 196.579670] 
>> el0t_64_sync+0x1b0/0x1b8 [ 196.583411] ---[ end trace 
>> 0000000000000000 ]--- [ 196.656701] reboot: Restarting system
>>
>> lspci:
>>
>> 0008:03:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI 
>> Bridge (rev 06) (prog-if 00 [Normal decode]) Subsystem: ASPEED 
>> Technology, Inc. AST1150 PCI-to-PCI Bridge Physical Slot: 2-1 Flags: 
>> bus master, fast devsel, latency 0, NUMA node 0, IOMMU group 24 Bus: 
>> primary=03, secondary=04, subordinate=04, sec-latency=0 I/O behind 
>> bridge: 40000-40fff [size=4K] [16-bit] Memory behind bridge: 
>> 40000000-410fffff [size=17M] [32-bit] Prefetchable memory behind 
>> bridge: [disabled] [64-bit] Capabilities: [40] Power Management 
>> version 3 Capabilities: [68] Express PCI-Express to PCI/PCI-X Bridge, 
>> MSI 00 Capabilities: [b0] Subsystem: ASPEED Technology, Inc. AST1150 
>> PCI-to-PCI Bridge Capabilities: [e0] Vendor Specific Information: 
>> Len=20 <?> Capabilities: [100] Device Serial Number 
>> 00-80-5e-00-00-10-0b-b0 Capabilities: [10c] Secondary PCI Express 
>> Capabilities: [150] Virtual Channel Capabilities: [1e0] Vendor 
>> Specific Information: ID=0001 Rev=2 Len=010 <?> Capabilities: [1f0] 
>> Advanced Error Reporting 0008:04:00.0 VGA compatible controller: 
>> ASPEED Technology, Inc. ASPEED Graphics Family (rev 52) (prog-if 00 
>> [VGA controller]) DeviceName: Embedded Video Controller Subsystem: 
>> ASPEED Technology, Inc. ASPEED Graphics Family !!! Unknown header 
>> type 7f Memory at 650040000000 (32-bit, non-prefetchable) [size=16M] 
>> Memory at 650041000000 (32-bit, non-prefetchable) [size=256K] I/O 
>> ports at 40000 [size=128] Kernel driver in use: ast Kernel modules: ast
>>
>
