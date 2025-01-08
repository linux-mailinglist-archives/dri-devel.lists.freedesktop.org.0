Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC59A0645D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B02410E02E;
	Wed,  8 Jan 2025 18:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xFzXLw77";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1236F10E02E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:30:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNyKA+y7uPg3Z56QXmtPFEW2okOxThQtxgyxFSPzA8gDPocBr5r3nhpANtv6npFWxeItLSsb03LRqEwaWHSCSUG556oWcMDW2b1N5zypMDZlmuM6bcVB4O61hD2c6SCDvc94VD1IxYG9PMpb/rq2PKn55I4CJaAhZIvpvE3sWebI2UFnhzgNhER5nTitfE1WDENqAHHc0y86lVk+RhRPKUsuC03EPqpS4mW44Xurd/JrwIzy7nx5Gc8FzWsYVq71SYqBV0dKST9qH72NgTvCccGbj99kM0FTrOxbxWmOW4f6GknY+IpHMsftZLCXhgP4+c9WRhdhMehE7fjmjFp+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5hlYWoFRmqh1+/svu5Uq+V1FedaYvxownc3zdI1i48=;
 b=Z3T7mCvNJesdMzqwCZ7uqZZtmA9gWNoSdcSTtWYfJWZoaep2qu6OTyv4miavTv6DMMImthKiQlDMpYbRrzmkVK4vstVbviFQShUMc7JvlNDMW2jQuCQz3FkXV9Jb+na9gDarvzxJAoAGeqzTYmkFqU2vNApLHzoztRZlV4KAJ8DCm7uOar3koWm7uK4D4kSwiuT5FWN9aiO7qwNIVtfjmtYFQdSVdZyaD/x9N42g6N8FegPuMT/1dd5WIoBEOdjDHVXS7kcMXO2skHMzyxvfamPdq0zy9Wyl+eEyEycYoaM+/9OpxUUCeyDk8uYNtMR/0KDmXN6AocyZ2jZUxkWLjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5hlYWoFRmqh1+/svu5Uq+V1FedaYvxownc3zdI1i48=;
 b=xFzXLw77/ahwJyrV8e6KgEqrDmtIghFoRFdN6K3ouK7ki4H8jQvBCEAE9RKnPAJt55iwugRaZ6yDZtG2VnIFDl11YjRO7Uw+mBAqLlxFb6RvFTomb6rg16tsjIRODnd86bN22T7myxH6jxv1oPKPm+bHMJ6b3AHgVTG8tFfbQO0=
Received: from MN0P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::27)
 by CH2PR12MB9457.namprd12.prod.outlook.com (2603:10b6:610:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 18:14:49 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:52a:cafe::12) by MN0P221CA0009.outlook.office365.com
 (2603:10b6:208:52a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Wed,
 8 Jan 2025 18:14:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 18:14:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 12:14:47 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 8 Jan 2025 12:14:47 -0600
Message-ID: <47966a55-0272-b4c7-3717-fabf85cc0f3d@amd.com>
Date: Wed, 8 Jan 2025 10:14:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [bug report] accel/amdxdna: Enhance power management settings
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <dri-devel@lists.freedesktop.org>
References: <202267d0-882e-4593-b58d-be9274592f9b@stanley.mountain>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <202267d0-882e-4593-b58d-be9274592f9b@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|CH2PR12MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e091ec2-38dd-43ca-e985-08dd301056b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1grNEUwbUNhNDJtb3NFZGFmZDZ1Vkg3Vkh6NE1KbysvZVRHRTFBcFlNVkhM?=
 =?utf-8?B?dU9ManJ2V2srZyt0NjJPWlV2dm9SZFdSaHl0ZEtRU2pieldIMW0xL3RjYjJu?=
 =?utf-8?B?YTFkS3pER3B6TUlXcGU4eFlFektjZ3VzNFN2MjhpNXZiNWlma3hTd3dkNGgv?=
 =?utf-8?B?Y1Y2MEErYmVNckk2R2YrZmRPWGxYRC85R3pHajZUbURuM0dJaVFTVlduQ29N?=
 =?utf-8?B?UWdrU0dRdERtc2VrUGZZd0ZmRzBzeklkVExTUklaSU1xeUFZOExCOC91Y1Zl?=
 =?utf-8?B?WFFFa1Z1ZERseFFIRzFNNi8rSXcwRlNNYk96Z2N4am5PR1I0L1VQKzFyT04v?=
 =?utf-8?B?dDhsRE1WNU9VaWZNWjlmb1BLeVo2TGVLKzl6WXR1a0xMYnNEQzY3KzFOYjcr?=
 =?utf-8?B?MU5iOXM5YVVqdGozNDAyRkNFR21uR1ZXcUQ3ZmhmZFgrakxxVHF0aW1WNUg4?=
 =?utf-8?B?cVZHVkl2SHNoTWo0ZSt1N0doeVQrODhoSnVMdWluTHJ0ZmJYTHRDYVlvenpr?=
 =?utf-8?B?alBIWkZHOVNyK3E4MWs2b0ZmdE1kMCttTThoaVhrMkJUaE82VTVJVGJ3cEEv?=
 =?utf-8?B?WkRQUDNnZHcvS3UvYU5lQ0Y4YTNsRTlZRW5LbVZhQkxYaWNlUzhjZFIxWlZx?=
 =?utf-8?B?SU50TWdhSjFoMFc3ZU9SdnlsRVlidGpJQy9PMC9zdytlRFBwS0dlajFURWdE?=
 =?utf-8?B?ZHFubFVFMG9RQ3RMRm5oWXM2QnRYUGQvUUJyY1Exb0JJZ0VLdmV4Mm9ibjBN?=
 =?utf-8?B?RlZZNU11aUZORVdYd0pPN2wraXhwdmhyektLUk9oYUcvWDMvVC9EZTBCL2dh?=
 =?utf-8?B?eHhSVUMxclkzSVRkMmNsSktLdS9PRlBaK3R0MHBJR0tQWFVDMnlPQko5cDNu?=
 =?utf-8?B?VjM3ZUlZY1loNGh6dWd4MGdpMEhoNklnOVYyejQ1WWxQUGk3RSttL3dOWWRx?=
 =?utf-8?B?bGUrSUU4V2ZwRDlDMk1SQjZSaTByem5vNW9wbzZCL2tXeFVwZlhaVWxyWjdC?=
 =?utf-8?B?aHpteHdKK1lzdEJ5SmxiRnJBcVJPMzYzN1VHV0UydmlyVGQrTFI2QnZ5dGhS?=
 =?utf-8?B?MEl6N0xydU9KRVFKMjRXVkRrc2wyR1FCbDV4a1hINmIwOCtuakJSMjdBa213?=
 =?utf-8?B?eGE3anFFRTVxQzdhK0p5SkRHeGc5RnZrZjNjelVrWE9KUUFmZks1ZDk2YWxR?=
 =?utf-8?B?dDFtYlVtYXI0ZjR3MjlCaHdmN0pRSFJmZm5USlJsajhlS3kzRllWc3d6L2pP?=
 =?utf-8?B?REx3MklrYW83WFNCZ1RBRU1hRzRnOWFFM0xuVjBldlc1cEVmTkNyZHFSNDNa?=
 =?utf-8?B?RFhzUDlYa21ldHg2V3VRbnNNQ0VmcE1KKzhEc2ZpUUNOTFVJcTdmNE16aWVs?=
 =?utf-8?B?dEhpam5oK28xam05ZlBIVzlCZ3NvcGlkemhMOW9lbHAxazVPNDJQa0Y1ZWNP?=
 =?utf-8?B?a0dRelFsMTNoNDdNQitmQWhsMWROMUR5VkdrL0RKN1dnWjQxcGxGQS8yQjNz?=
 =?utf-8?B?ckZHOXQyV2lsalE3QjdWS05VM1Z5MW1ZOVRWcXladEpmL2IxVUJCNDdReTlM?=
 =?utf-8?B?dHAwazdodCtwVVlMRE5sajJoTnE0MlBJSlhTQk5pS1Z0QmYvNUVON1dhQ3Bh?=
 =?utf-8?B?SkxYQzRrTGg3Y0dLMTZvdnpkMzFTaFNWanJEZVBlcEYvS3pBYVU0RGxKTFoz?=
 =?utf-8?B?SjlpUU1BbTNEYTlCSnpZR3BqT0pDY0l6NnRVdTVyUFBFNEhaWkpWZFZTQ29U?=
 =?utf-8?B?dzNoODQxQ2dDY0w3VzZDYVo4MWx5UDRkdUVWNnR3eVpuSi9CK0dFSkwxQ3kx?=
 =?utf-8?B?cysrVlZEWHN6aVprVmdqa3lMK0dpNDNHRyswSVdKQjBXY0daQzJZUjFKY2tK?=
 =?utf-8?B?dkFYRWZXZEo0V1FrdWdpY3VweTRaMzhaNURhWEVFTVV4U2gyL0hPRUZ6aUFE?=
 =?utf-8?B?dVd0RTlRYVBBek13YytmUDJ1MGZpK3ZxeEdsWExuYWs1WVZxWlliTnFObzRs?=
 =?utf-8?Q?sovWIMVxHJQX+Q7zo6Qq63QAZj3qNM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 18:14:48.8029 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e091ec2-38dd-43ca-e985-08dd301056b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9457
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


On 1/8/25 00:40, Dan Carpenter wrote:
> Hello Lizhi Hou,
>
> Commit f4d7b8a6bc8c ("accel/amdxdna: Enhance power management
> settings") from Dec 13, 2024 (linux-next), leads to the following
> Smatch static checker warning:
>
> 	drivers/accel/amdxdna/aie2_smu.c:68 npu1_set_dpm()
> 	error: uninitialized symbol 'freq'.
>
> drivers/accel/amdxdna/aie2_smu.c

Thanks for pointing this out. I will fix it.

I actually did run smatch_scripts/kchecker and it is clean.

Maybe I did not use the correct command. Could you share the instruction 
to reproduce this?


Thanks,

Lizhi

>      57 int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>      58 {
>      59         u32 freq;
>      60         int ret;
>      61
>      62         ret = aie2_smu_exec(ndev, AIE2_SMU_SET_MPNPUCLK_FREQ,
>      63                             ndev->priv->dpm_clk_tbl[dpm_level].npuclk, &freq);
>      64         if (ret) {
>      65                 XDNA_ERR(ndev->xdna, "Set npu clock to %d failed, ret %d\n",
>      66                          ndev->priv->dpm_clk_tbl[dpm_level].npuclk, ret);
>
> return ret; ?
>
>      67         }
> --> 68         ndev->npuclk_freq = freq;
>      69
>      70         ret = aie2_smu_exec(ndev, AIE2_SMU_SET_HCLK_FREQ,
>      71                             ndev->priv->dpm_clk_tbl[dpm_level].hclk, &freq);
>      72         if (ret) {
>      73                 XDNA_ERR(ndev->xdna, "Set h clock to %d failed, ret %d\n",
>      74                          ndev->priv->dpm_clk_tbl[dpm_level].hclk, ret);
>
> Here too?
>
>      75         }
>      76         ndev->hclk_freq = freq;
>      77         ndev->dpm_level = dpm_level;
>      78
>      79         XDNA_DBG(ndev->xdna, "MP-NPU clock %d, H clock %d\n",
>      80                  ndev->npuclk_freq, ndev->hclk_freq);
>      81
>      82         return 0;
>      83 }
>
> regards,
> dan carpenter
