Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FB04255E5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 16:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8D66F4B1;
	Thu,  7 Oct 2021 14:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F33E6F4B1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 14:57:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEbFHVyXfzOwnwjMGrJ1jIkMQJXSZeLDEmuItBVQajJIyMqt8epKAXv+O6GG0NuceGJ1AWkwZc6fTApOu88wdjujsVZBoRrsvmS3VkFJ3uJMLIhN5/biJZyovg/3Vn4jWT9IQE9OiJB4+fFr+gffwKzw2gAj3Gcn6eWuRZDvzr3JxlCM3JULDvEKTk6/gI4NeoV/QHJUuJ3+C+eESplrq2iAlM/4EO6Lxahz3YtH43YSK5PSzVkPNQ9rQnW1WF//yNfHfjdN3UDC8UTa5JprcpMyp8F1mGx2G/2dvDvSG4zC39HFB9h9/e/6S5ABL/GPg6fOllNbdPo6Lc8kt/I81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7X+43sw9Z7LzUZke8eiX9ikwzNW5hxeBJMORalmR4w=;
 b=BHzCApqdqN12JCTc0qIUGF+c0ledMjKfEveEDmmYslHG2imY9D5vFpRtxuNG4DcXTE+du3lw6rCyrKL6XimbK0fyhqPPklTbveEYRDzMbdcH2GCjIvP0yLMPvJ/jwdQ1moe177j7//RFlEZM6eICCNyMYRSjXsE3ZethYXpK4mVgjr+FtkkeoRnHWS+NfeisQ7QEXLkim3L8IwlGdKJwRc+brFetkNRa74Ckc9tox9ctmzg2uwHaR16GSbNh6pShgWg3tJKbXuKHiOU3NQgfutG2uHJjK9ECMz3k5jOKA44DB8T3e8yyE6dcUyjUH8eZsb2XjbaDx/G21qNJvduLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7X+43sw9Z7LzUZke8eiX9ikwzNW5hxeBJMORalmR4w=;
 b=gaiv4D7YgaqjrAhtEWRTH30zdaoKV8oaZQksX0RvX5tUhg0TYnL2bX/HU4zYmvg65MHJ3oVy9oEMM8YU60EtG7x/V+eaLSYxSJAtOdJk8PKMjeuLpV4WGwAglVPXG/N4DhUM/C/ck/8ghTQykCksDw+Gm9wxHo38m2qL5rRykOU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2556.namprd12.prod.outlook.com
 (2603:10b6:907:a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Thu, 7 Oct
 2021 14:57:39 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 14:57:38 +0000
Subject: Re: [RFC PATCH 1/2] drm/amdgpu: Move dma_resv waiting outside the
 notifier lock
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20211007132630.495184-1-thomas.hellstrom@linux.intel.com>
 <20211007132630.495184-2-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d56974c3-c887-2086-5e7f-ba46a7f82319@amd.com>
Date: Thu, 7 Oct 2021 16:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211007132630.495184-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::24) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:c25:2d4e:5911:2b41]
 (2a02:908:1252:fb60:c25:2d4e:5911:2b41) by
 AS8PR04CA0169.eurprd04.prod.outlook.com (2603:10a6:20b:331::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 7 Oct 2021 14:57:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e3ebef7-46fb-4fe5-00cd-08d989a2cdea
X-MS-TrafficTypeDiagnostic: MW2PR12MB2556:
X-Microsoft-Antispam-PRVS: <MW2PR12MB25565B70B87C26CB258F85B683B19@MW2PR12MB2556.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q2iJ8GNi6iqu84BUl0zm5ofxur9gcipXuPlWFyiMf3VHq6yZ3UajmfDodpkblKl4eiakfKd8HXpWBsJutFAkO0J69xuc/peiRb0KZ9DNMwxb2VVm4R8mV7mVsVU3KatAs+7ifWhptZtnXlYbMBvu7WOCYVpC8n7EESRmVfqmOxhqgth88RtkeTU6MDD34nZc7vphGlPiwrT4P44CwKN5UFoXnL6Y/VdGKCfFaBTTA8xPVO1uGkvfCzvOJ1aC/XfZRqvVP5NnMSwpoxSID7caoNdL3i43nNksJLLYIxr/kH0B/6WkAKwTWlVpFin/MDLixvhmRGItogMRHHbMmxFsv7PFwf35znzx1kL+RT4Au3rz2QFMCJGOcVz6V1LVrx0/+b7PUmXmT6sSQFpmBuWLBqrMj0C3V62DPKOmN7jvL5qqC870dO3zqguQ8F7kOMyLIxi7Qh0D+V/OFd9Zm2ysfHMIk2lVOUCbAQ/TuINrjrVZkJCSm/Zd5uMNgSu2kNQCeFOkBE2PNLbCXupYfmsCwPDCgL+M32iiPb+fAuQesev6x2esGcmd0gbENc/UXoMmk78Ga2396hv1pXlmdxyJkPrRDCG4MRkyd4vcnlWr27O7nr60S2a3kxN4ad1o0eh/ppQOX3I7oGB0EW3yW/e7kMaHySgrZ7QocKuaRIulLpCHR/S2MHkjfRw7qULfaz3tOtS8NzlNazGNuVcgTlUBaU06e+RM6nWyjSzKrQTZlnxYPSI8zoZAc0onCfuWOOqr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(66556008)(66946007)(186003)(38100700002)(66476007)(316002)(5660300002)(508600001)(36756003)(2616005)(8676002)(31696002)(66574015)(31686004)(6486002)(6666004)(83380400001)(86362001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEtIODdzWXZxR1A2aC9aMG41YjZvVkZOc2FKUVF0NStudkhtS1pkV3JucTNC?=
 =?utf-8?B?ZGJUOW8xU0JnU0NUbURqVWtvR0xhYTBhT1QybGQ5REx4K3NUemhMZ0FVVW1q?=
 =?utf-8?B?UlVjd2EyUC8rcGxYTmdZcmhSdFBIVWtYRUtFQ1RWMWpvZzRrQkF4RUlTSmRZ?=
 =?utf-8?B?aUU0Y0tqM0VJK0F5WFByMWZhTEE0dWZ4OUN6WThNUkk3UGhFMlV6Ym1WR1Zh?=
 =?utf-8?B?MGRUSXpkR2dENFdtZlR1RVdhS1IrMzBTd0lXMlJyWG1hbUFQcTFVOURxRFU4?=
 =?utf-8?B?ZjB3dUlFODZnMy9EZEcxUklJRFNzM2cxU3VZb1UyampkdE9NRTBwU1FuYXVM?=
 =?utf-8?B?OGcxbW93VFBISHMxTGZKTS9yS25qWnMyMFVQRWVlK21FdHVhdU85dUVYb04w?=
 =?utf-8?B?TTYxdTdXNUJhZk90Mm8vdnZiem12RFd6REJDemY2MFAzVW9WWktqdll1bXlN?=
 =?utf-8?B?RmxPd05UMElqRXZlZDlwODA3cDVUNDdJbWZZd0RTekdPTjg3YjZMaDdub0x3?=
 =?utf-8?B?UCtvZy9TMkhhOVpmRkNEbVN0YURWVVUxYUJlZVZzdS8zeXhPcy8vbmJkRVdP?=
 =?utf-8?B?V2VCaHo1RkI2OVRjeVpnL3hSUExLM01Fc2VMZS9FUXZ0Y1pOQWcvbk5NZEZw?=
 =?utf-8?B?eDZ5V1dVellTNVFSVzV6ckJpWXVlUEhjZjcvSUJ5c2hkTWZ2dk02OGtld2Mr?=
 =?utf-8?B?b3A1OE9UQ0hPZUwrYi9SajlXN3NWa3djL2RQZktjVTVuMlFGdGtianVHOThT?=
 =?utf-8?B?RTFQY0liNWpPZlhHL2h5TVdFTEJHbUZmV0FsR1h6UnZ0UDA2QjFqMm9qdUNZ?=
 =?utf-8?B?cW16ZS9LY3ZwZWtVR2VwNTJkRG8yai8rd2hBeEFVanZMZjlQTXlML0szaVRP?=
 =?utf-8?B?MUxQVit3S202VjlzYmxQWGlFVW43Nk5zV2NNZEs5a09yd3p0N05sbnE2aVBO?=
 =?utf-8?B?UlYybE5qUHpnbmNaWk4rVDhQTDltTUtESFd0OW9UZUNPSi9rVXU2b1ZyckF6?=
 =?utf-8?B?TWQrc3pwUVp4Ty92a1Zjc2tQNEh3YVJzc213WXpEWFhBWEwxWjhQYWlaVWtn?=
 =?utf-8?B?d0NMV0ZiNmJWRWU0aTRHYkhCaFZMUkQxc09wSXZMRkdzbHllVGdFY3BhRmRq?=
 =?utf-8?B?S29ZT1ZZeCtzR3hLbG44TGYxdkhISW5nK0hYck9MdU52U1ZuTVpEcTZOV3p3?=
 =?utf-8?B?NTVqa2hUV0RxSjFHMi93VFptM05BVGhQSldhY2JQRkJCelJGZFpYdURPMnpO?=
 =?utf-8?B?RHJYSzdwM2UyVDZCdzZWQTMrV0szM1RuYUJkQS9nZ0lhTjYzdnV0U0g1L05o?=
 =?utf-8?B?RVI3aW5IcUF0a0ZtQWZ1VVhmb1RCUWxYazFKV1o0TEl3cW9wbDJCUTBQRlBv?=
 =?utf-8?B?eEhHbW84cDlJRko3dTBTbnlTejV2YUZoSFlyVHVOdWMxa2d2TWNrRTIrdnhO?=
 =?utf-8?B?bHdZU0JWVzNxazZGQ0x5NEh0cmI4dnArZGZGZzAxMmF5ODZnUCtDY09VQ254?=
 =?utf-8?B?VXIzaWoxWi9Qc2lwUmQxQ1ViNzJReFRHeXNLSVJyUWoyTDRCU1l2bjNvRFdo?=
 =?utf-8?B?RW1Sb2JydmUrWXlIc0kwdXRFZTlNc05Ka2RObTV4Q3F6M3pMNW5SZW1rK2pX?=
 =?utf-8?B?WlNmMmw5T3ZpdDc1eVAvQWcwbW9zaitlaHgrcTB6V2g1bHZEN081VDk1N3Rn?=
 =?utf-8?B?U2cxZy91SS9VNGhUd2wrclErdS8xTTF3VkJpSythMjFtcnZwTHltd2JpeEx2?=
 =?utf-8?B?S1IrK1BJdWhLRWIvczRHWHMvQ01Rbk5YQkR3cEw4TjFIZFZWSEVDd2pETXBW?=
 =?utf-8?B?N3QvUXNSRlVPTFlMQ05XSGFqWFNxRkZZUEpGOGQvWXNhRmNWdlR3WWNrMG1C?=
 =?utf-8?Q?3ZN1XXNYNYxe3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3ebef7-46fb-4fe5-00cd-08d989a2cdea
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 14:57:38.5216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgyvLChFOu+j25WbHH/+uZdviybPR33nJVl3OM67Da7l9geFUwXoIvy6HNd3o0Pl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2556
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

Am 07.10.21 um 15:26 schrieb Thomas Hellström:
> While the range notifier is executing, we have the write-side mmu interval
> seqlock, and mmu_interval_read_retry() is always returning true,
> which means that if amdgpu_cs_submit grabs the notifier lock during the
> fence wait, it will retry anyway when checking the userptr validity
> and block when retrying in mmu_interval_read_begin().
> (See the extensive comments in mmu_interval_read_begin())
>
> Hence we can release the notifier lock before the fence wait and avoid
> a device-wide command submission block during invalidation.

First of all I'm not convinced that this works and second blocking the 
CS while an MMU invalidation is underway is completely intentional.

In other words when for example fork() is called in parallel with a CS 
the CS should be blocked until the invalidation caused by the fork() 
operation is completed and *NOT* risk that the CS succeeds and adds 
another dependency to the MMU invalidation.

Christian.

>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> index 4b153daf283d..d3d340a6129c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> @@ -75,9 +75,10 @@ static bool amdgpu_mn_invalidate_gfx(struct mmu_interval_notifier *mni,
>   
>   	mmu_interval_set_seq(mni, cur_seq);
>   
> +	mutex_unlock(&adev->notifier_lock);
> +
>   	r = dma_resv_wait_timeout(bo->tbo.base.resv, true, false,
>   				  MAX_SCHEDULE_TIMEOUT);
> -	mutex_unlock(&adev->notifier_lock);
>   	if (r <= 0)
>   		DRM_ERROR("(%ld) failed to wait for user bo\n", r);
>   	return true;

