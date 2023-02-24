Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED626A1E60
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 16:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C2510EC48;
	Fri, 24 Feb 2023 15:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D689E10EC48;
 Fri, 24 Feb 2023 15:19:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lImvHofE3c5BWMyw1vnKYS1kghM3GnDDBO/6yvt9ZzvyEyr3nUD7iXep1wyza6OB97ixt31Kd/Jjo25Uwflc8ITV/weCwwBKst1XV4Y3lmiiZpeOUKJdUohj5am7SMz7DwtqMRci2ybJdNjyeHBYXPJPDOBSosrZKXVnvZWAPTBzAL7vfUHEZeKaQ/L6DmQygf5ri1GwtyZfFbvv7tHgwULgdeeiagIHgKgrSiGY8v3CafT8oJ31GQ65GIC45gImyl+lBtkGejrDf3QsrpgpqjAP8I6622PFClPVIZDmh9eS8f3VuwGcFKX2zIpki1Mdp+ISjoirdgIcbq93kjAwVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsjqPSfnm3Ygi4Io01Tn1OMFABOCofeh5v8NtS11/2E=;
 b=VCtAIxNdya0AiMhozyGYPRdPL1OtsGyicOfwPUEkQqasvbs4AFAwvoGAiXtEwX+JJ+1kxEUnK7XTWOGo+ROVI9lGNfSaaN3tNVKQawbmqpVVW2nzP2AdZf1szT9h92AmbhybL6RgTAwxhhn24cwS1F4fPSDFTAgHG07d4vxRE+3ZsQ5zCJugbJUcxNvcDPSPdsLhXbAjUEXhpnxnUv4g3uSWQYga9QiKDxVmJ69ed3dhx/EoQIZjrmASE4ixozOU19+iZkCPHKyfdU79pLOU5pkMZnZFyLR7IsZyh9x86CMIc2ra/5LyPiRFTHXKRAJGeH17XmbAhlpaMUvlhMvUIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsjqPSfnm3Ygi4Io01Tn1OMFABOCofeh5v8NtS11/2E=;
 b=oQ/0YCsJx18U6FHhuqF1+00z84f580UHIAXAiEAt3c93FTlI4XlEZmoY20UdKeH9u4WSTz8sLhVbELWZUrofSfR2fGRdaxelnaSUlyRQkckk9iBWwbhPVZzOc6UvYzDWz3UyBfsZihctFgV9+sieJBOZLnfKCIi77Rx2XR3k87o=
Received: from PH0PR12MB5434.namprd12.prod.outlook.com (2603:10b6:510:d5::8)
 by IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 15:19:08 +0000
Received: from PH0PR12MB5434.namprd12.prod.outlook.com
 ([fe80::d292:d108:c1b0:41ea]) by PH0PR12MB5434.namprd12.prod.outlook.com
 ([fe80::d292:d108:c1b0:41ea%9]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 15:19:07 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4127.namprd12.prod.outlook.com (2603:10b6:208:1d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 07:12:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 07:12:28 +0000
Message-ID: <57e38bdd-8369-adb7-f095-26652d4ad8d5@amd.com>
Date: Fri, 24 Feb 2023 08:12:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Keyword Review - Re: amdgpu didn't start with pci=nocrs parameter,
 get error "Fatal error during GPU init"
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <CABXGCsMbqw2qzWSCDfp3cNrYVJ1oxLv8Aixfm_Dt91x1cvFX4w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABXGCsMbqw2qzWSCDfp3cNrYVJ1oxLv8Aixfm_Dt91x1cvFX4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4127:EE_|IA1PR12MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a91925-96f9-4ea4-8cec-08db16367c40
X-Moderation-Data: 2/24/2023 3:19:06 PM
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8382IwWZc95aD1RLQiwrDRfWIVY5nI12Bg1L8N2q7uJ1wiB+pbBL0rZTuI/VQGHtVe57xWRMGTOQP4ucDWUlBNwN1Aq8McI0/xDAwF3teG9Z6umcnRJ0g0T8tnaO2qFsN6tG29qqZI5xWCVkOOZ2mV6navzKseXHnk5jW6KwRoJm4FZ5kYephqSzHWr5IaVy0hxxTFiOftGzX+F9Vp9Q4C9OcjMaCX/zZ9RA6cehMiXAisFuOXxuSgfklbyS+JXEBQlUPcsxYzZZYECriHSTwk6QrrVt1BF9dW8iZg/YVWlsGWdSkPtEj7QSr8lAO27cHPUqWfk3St9ML0qGuazD6jCqY5ZTB6kj1kNJ9fsx0G9meFEFsCC3wt+UhiUhp/YRDGtKUMBCIrzj2EwWUeGYOlyCKhlLb5IWreDU5hEExmx6kopKlMs0A0f2JyUgzXSWlCeKxRJkQ967nm80h6c9LNHQGjlskmgm5z8ValBlBI8ljqOaFpB0V0DePXNAGG9gJ/sSqTRGpjtj22rBYTj0EEX7y4Q+ZhUQQv1EkR4rrmrR/G/N54N5o5RSE2+/ZXCNga2r+sP1ItgZev5cs4m50Q9SwYv3m7AMkhILK8tFiNvp+I9alvVjDWdjdtq5CeIgyqeDRqNM5hcHwkxQLq6mqhb5NkATGAh0v+oSYfnxZwfVeJ6Oi3/dpmnv7JlmEFYo8R5CGkkv8a6XWbWOs309BEDlrSN8U1LnjsfpO0uUxA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5434.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199018)(478600001)(5660300002)(2906002)(2616005)(38100700002)(6636002)(83380400001)(110136005)(6486002)(316002)(36756003)(186003)(6506007)(6512007)(6666004)(8936002)(41300700001)(31696002)(8676002)(86362001)(66476007)(66556008)(66946007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S081U3Vxak53M0l0bHhKN253VVlrYUIwVkNpOTJQSzNTLzF5NFM1czZCVUpK?=
 =?utf-8?B?UDhVK1hzdkxWazlqRERvUTd2OTZ1OTZPZEJWYW1tT3pBbXFwQnRHcE9kY2xX?=
 =?utf-8?B?TVJ0T0o3Q2xENnQvajV1Z0QySzhPSGlFK0ZsZENhMU11bERFZ21wRmNFTlQ4?=
 =?utf-8?B?Qnp6WFcxNDJTRnM4aXNJTGVwdVNOSEdqNmxIMWNTVStCWnJXY1ZkYUN1SFZS?=
 =?utf-8?B?dXQyQnljbmxzZDBvMzlQTzFuamJlSHd0Y21GQUJNSWJIRHZYV0xZMFIxZzFM?=
 =?utf-8?B?SXpoNnRDR0pJVzlrQ0kxbWU2TXpjL01JeHB6d3c4UlBIY3EyU1V0ZWJMRktK?=
 =?utf-8?B?RGN6dHJpd0VqTzBGMDVvOFRyZUxmZ1o2RVVIN0IwVmJPODEwOFBkZ0p4QWF3?=
 =?utf-8?B?ZEdaYnJEbWUveENuSW1wZUM2amhYdmg5NjA3dWJTQUY4bnBHVFVFNTVNVmpE?=
 =?utf-8?B?QjdqYXB0bUFjUkRIcXBPam83MUxROE5GYVpmVC9ZZ3d1dVh4NjFDZXV0T1Fx?=
 =?utf-8?B?NER6T0FjTHpCdmRIWXk4WDVrTGVZblBYSUo4MllCaDNJNXRqWlZ1Vklyd24r?=
 =?utf-8?B?QTVlVXRmTW1EQ2VBWm9CbGZCYVlJRWYwNFpUZGROTWlnT2gxK0JCcU5hNEts?=
 =?utf-8?B?d0JUbXo2WjdYWlJjeFFQS2JaZ25ZOVU1UUFtbWdXa2I1REdzSllSdDlnUWRQ?=
 =?utf-8?B?ZzAxNTh5anZkYmkzdm5MVUFKQWFaOGtCU3JUaGZzWXgyTnlpcm8vMmpSNUFB?=
 =?utf-8?B?cTcxMWViUlRscGorY0J5TUZGK25iMFVXTzR5M0lZZ3ZZM3JJdlc1SnJRTzk3?=
 =?utf-8?B?My8wNXVINkU5K3FBbXNMaUhDdmdYOFNHc1VIQ2VOcVVnVTdUNGdqampEL09J?=
 =?utf-8?B?YVhUV0dEVXoyeEgvSDc1NWthdkZ4Qi9CbUc3ejUrc0o1Uk43ckx1TUhlWW5v?=
 =?utf-8?B?VzluVmZKaE5ZTHk5OXBBRDhKRDBQVUcrb21VM0V5QStjWGJqZFR6VWZ5NkFP?=
 =?utf-8?B?S0VVbDJha2pJK254RTR5cUNPOVA0UEE2cEhqNVRXVzByM2xJd2NDQW1oT1B0?=
 =?utf-8?B?czRTMnhXN3FWZW5YZjRKek50enIrMUxndkNTNnB1TXBaZVlYblJuMTB6Wm5q?=
 =?utf-8?B?RDlwak1IKzNJV0dwMy8zWEtDeVN5ZllJMHBwZDljVjdwMCsxY291UFZuVEEw?=
 =?utf-8?B?VENRbW9CTW9BckpiU3ArUlFlS2IzUHB0TWQ2Q0ExN29sZC96VERwNC9maWx5?=
 =?utf-8?B?Yy9uVmdQQjVwOHc2TjI5eVFkbGJGWXczclVETUFtVWZENkI0RUc2WkZRd3Nk?=
 =?utf-8?B?TG9QMFlWa1ZJSHphVlRVVkNzeitqbXZpNFhTL1ZnM0prY001SVdTM2hDVk93?=
 =?utf-8?B?cWx1TUcwZlpWWHhFbUdFa1ZVc21JMmRBVVpGSG5VMksxQTk2Y0h2aFBKUGVy?=
 =?utf-8?B?dlVKWHFKMG05QUtWcHpyZjdrK3lxSVYxQlpKVFF0aXRsNmpVSCtXMThaVjZw?=
 =?utf-8?B?Q3JRL1VkZXZnbW91a3k0WTFCVjg4L01KZ3dZR0JCdnR4WVJNQ1J0bXhDc1lh?=
 =?utf-8?B?cWhndEJ2M2RFRWdkWTBaN2V5MVQzSWxpMUZKRlp3R2REcDkwZElEOXl6aEF2?=
 =?utf-8?B?dFAydXFEa2xVcnoveFhCTHI2ZEtCc0pDMnZsblV2aWNReDFlUkd0OUhkNSs0?=
 =?utf-8?B?UWhZVjBrSWljVThPYWgvNHJlVHN5bVdLcHZ1eEdUK0VWeXM2ZmlQb2xWd2lN?=
 =?utf-8?B?RFZBYXlYMXpiLzEvRkQ3VzBIOE9SS3RYV3pXYzIvZEFjSllXMFF2bjJoMkZz?=
 =?utf-8?B?dlI0Uzh1ZjhwOGM3Y0s5cG5KbDNHM0JiYXU0T25iaFdBZXpQTUFhZ0tndEEv?=
 =?utf-8?B?WGRETEdjWU9SajhoWk1uNHNMWit4aS9zMmFzQnZmZUIzYjhKbFRzQ1hLdE1V?=
 =?utf-8?B?enpCbUdpQXIxYlZZZGgzSDRhSkZ2MmFLQmxJeWg4MUVHd3ZiVldoU25sbTk3?=
 =?utf-8?B?WmNLZTVrYTRvWnBuOVhXQytBaW5nam96dzZmcnNZTVI3V1krT3QxSVhHVkNH?=
 =?utf-8?B?ZDFCOTVzSDFrQmtMdWlSQ0tUbm1PNjRlSGlPRS9NZmNDQ1JMYlI4VFpSZUpM?=
 =?utf-8?B?QUZ0dm1aaUdSQkJXU3NrTmdsb3VNR09uQy91YzN3U2NVTE1PamxJNjBNU0M5?=
 =?utf-8?B?ZFkzM0hCM1NJWWROSjM1MDkwUTJYcld5K1dFYThST2h2YVA0YVlXUkFPNXZS?=
 =?utf-8?B?VVFGOFNoL2NjRWV2RzRzNGE4ZTZTOUtUNC8xSG9ZblBZNWw5RE43bzltdmNP?=
 =?utf-8?B?RHgxaVFwNkpUUnFGSTlxRXliMUNsRHRLc0U0Q01UTFkvaUR2b3VveEd3NEhn?=
 =?utf-8?Q?DB2o8w3a0dTZvtwXT+2clRGvQDu90WPa2RCskwzLqtQsQ?=
X-MS-Exchange-AntiSpam-MessageData-1: kKeTFWWn1FRYt1VjJztwB1xahn/kgUUXh8JVaEU5462aTq9T8zFFlK+F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a91925-96f9-4ea4-8cec-08db16367c40
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spN+QuPmfvOx1JPKpEoFHuHgXLEphW5qK8vBfZUw19dY7N3SJvbcm1Pgs1UXfJSec8jSuMgcQmvY7JMESTw5VXL922N/JQztC6zfEvi+lJZDnNpUWpynjwyQFuXniTTwdR/7ldry69p3OaLT4FkZ/IrID2P/5/K3PRVY7YqnwuiDaYKBBrOTsj9fNKTLbTYEmzTvcGqWuamWeJ7Jtm4vfQCUOA6nNdM292RuStB0Pbw=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 15:19:07.4098 (UTC)
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8190
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

Hi Mikhail,

this is pretty clearly a problem with the system and/or it's BIOS and 
not the GPU hw or the driver.

The option pci=nocrs makes the kernel ignore additional resource windows 
the BIOS reports through ACPI. This then most likely leads to problems 
with amdgpu because it can't bring up its PCIe resources any more.

The output of "sudo lspci -vvvv -s $BUSID_OF_AMDGPU" might help 
understand the problem, but I strongly suggest to try a BIOS update first.

Regards,
Christian.

Am 24.02.23 um 00:40 schrieb Mikhail Gavrilov:
> Hi,
> I have a laptop ASUS ROG Strix G15 Advantage Edition G513QY-HQ007. But
> it is impossible to use without AC power because the system losts nvme
> when I disconnect the power adapter.
>
> Messages from kernel log when it happens:
> nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
> nvme nvme0: Does your device have a faulty power saving mode enabled?
> nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off"
> and report a bug
>
> I tried to use recommended parameters
> (nvme_core.default_ps_max_latency_us=0 and pcie_aspm=off) to resolve
> this issue, but without successed.
>
> In the linux-nvme mail list the last advice was to try the "pci=nocrs"
> parameter.
>
> But with this parameter the amdgpu driver refuses to work and makes
> the system unbootable. I can solve the problem with the booting system
> by blacklisting the driver but it is not a good solution, because I
> don't wanna lose the GPU.
>
> Why amdgpu not work with "pci=nocrs" ?
> And is it possible to solve this incompatibility?
> It is very important because when I boot the system without amdgpu
> driver with "pci=nocrs" nvme is not losts when I disconnect the power
> adapter. So "pci=nocrs" really helps.
>
> Below that I see in kernel log when adds "pci=nocrs" parameter:
>
> amdgpu 0000:03:00.0: amdgpu: Fetched VBIOS from ATRM
> amdgpu: ATOM BIOS: SWBRT77321.001
> [drm] VCN(0) decode is enabled in VM mode
> [drm] VCN(0) encode is enabled in VM mode
> [drm] JPEG decode is enabled in VM mode
> Console: switching to colour dummy device 80x25
> amdgpu 0000:03:00.0: amdgpu: Trusted Memory Zone (TMZ) feature
> disabled as experimental (default)
> [drm] GPU posting now...
> [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment
> size is 9-bit
> amdgpu 0000:03:00.0: amdgpu: VRAM: 12272M 0x0000008000000000 -
> 0x00000082FEFFFFFF (12272M used)
> amdgpu 0000:03:00.0: amdgpu: GART: 512M 0x0000000000000000 - 0x000000001FFFFFFF
> amdgpu 0000:03:00.0: amdgpu: AGP: 267894784M 0x0000008400000000 -
> 0x0000FFFFFFFFFFFF
> [drm] Detected VRAM RAM=12272M, BAR=16384M
> [drm] RAM width 192bits GDDR6
> [drm] amdgpu: 12272M of VRAM memory ready
> [drm] amdgpu: 31774M of GTT memory ready.
> amdgpu 0000:03:00.0: amdgpu: (-14) failed to allocate kernel bo
> [drm] Debug VRAM access will use slowpath MM access
> amdgpu 0000:03:00.0: amdgpu: Failed to DMA MAP the dummy page
> [drm:amdgpu_device_init [amdgpu]] *ERROR* sw_init of IP block
> <gmc_v10_0> failed -12
> amdgpu 0000:03:00.0: amdgpu: amdgpu_device_ip_init failed
> amdgpu 0000:03:00.0: amdgpu: Fatal error during GPU init
> amdgpu 0000:03:00.0: amdgpu: amdgpu: finishing device.
>
> Of course a full system log is also attached.
>

