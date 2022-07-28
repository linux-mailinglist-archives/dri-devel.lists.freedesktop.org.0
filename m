Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6672B5847F5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 00:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7246311A0A0;
	Thu, 28 Jul 2022 22:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3CA10E8F7;
 Thu, 28 Jul 2022 22:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sow53AllvsFVOCNgOBlVeXGre9PylEI4vnN3mrsiCeKnohj6UP2yTPhsEP3J7Zn27Be+DGsdRZ3xarzw1/cCCjDGVpIBiyPm+5h7xlBB/ShPGdI47LFJdkfWkA05iot4uhave02GTyFnaUhooMEPmIQKmWTn3TEqv8vkneA9FG4Bb2gwMLL2zTuJqn5/VNqiXhmcHr8QCJ+v6qVyf8cTbDeMZ3ApdVfb1MgV9vVS3DkCKPL2fRpuicllHxTpZiWmjrhV7bmGcdkosbLV0X5IG32OnKLHZ822SkxSzslmp4fiuoLELgsihiSOjzzMP3mX0eqk44mKhzUHNhG52MIExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVYfAVDIN387QUi9lipTuaTjBh+YNBzlhgiwYCqh+k8=;
 b=FaNrGNCUpReONd/a9BxIJlcoXFLcFo1OIMEb0NQ3Onx4XtjLMHWvpfQN4WsBVvWjj5IQdZPqtBw1QS9Ab0aCkC/GgAxB7k5t2yS3NgqvOs0rv8YGITUZcFcBpeUNrk6RKg9iFeaKwVg+PhuZYUPI/Iej7Bqm0uXPwjwNKcFuTjdAT5Ux7bW7Z2Oi3nssQG+539Jsbg85/B3CuLMTJH/hk3snukOdn2lfEaSi/l1MID9+TYKsKZ5F0pHKYzMyeSKRQvL/HdYmcawmjAut7XZiyQZduiBgkzWXvg3Wz+9YNp+oJb1FWS1VpPc0jpLWq8eW3K+LReRE1l/grEGqKgK77A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVYfAVDIN387QUi9lipTuaTjBh+YNBzlhgiwYCqh+k8=;
 b=E1kvD/hTkWbxGUZDHhYAfQIg42aDaFP+Fy/Md9+5b6w4jo7mo6xHCZYIsQ9rSsmFtFKYdWQGo2lpbx203ABJO7WusoWFimnwgvVINLO0PD/x0SHwNcSgrdys/75SgSLtnzdkQqawLPSguO8EdYgx6gbDmnIfSE95u1LfK91hog8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 by BL0PR12MB2513.namprd12.prod.outlook.com (2603:10b6:207:4a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 22:05:52 +0000
Received: from BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::453c:c60b:f11c:367c]) by BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::453c:c60b:f11c:367c%4]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 22:05:52 +0000
Message-ID: <79dda8ce-387f-be0b-45b7-b3eb7af0d189@amd.com>
Date: Thu, 28 Jul 2022 18:05:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/amdkfd: use time_is_before_jiffies(a + b) to
 replace "jiffies - a > b"
Content-Language: en-US
To: Yu Zhe <yuzhe@nfschina.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220727025917.22477-1-yuzhe@nfschina.com>
 <20220728033026.15952-1-yuzhe@nfschina.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220728033026.15952-1-yuzhe@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::34) To BL1PR12MB5112.namprd12.prod.outlook.com
 (2603:10b6:208:316::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae89260a-ef53-40af-0ff1-08da70e5561f
X-MS-TrafficTypeDiagnostic: BL0PR12MB2513:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qfxpELb4/TJ240qRWQiupKMH3torCu8dKcA4QkGambfR1PsKZtnoDT5l5ObzwbHMy47aE4dXt0mZ59RIp1Zzjxq6SAMn9ybGZkWHKJdvbp4abk7WaiBnZrE/FFqe7n5DOGhoc4hf0LCpAj0rs02OsXHsyY3/FoEXnxZcXEwNLm1u9crApOnzDeSXssLPYPV2XRklYblNW2CzfdFZhyUl6qOGNUf6SG4p4jwiT2nJ6SwPLIYevHajdKJ6rsMIqZ3px+a6KTFj/cj8tBrUVluyhNBHABa06qH53WC+ZQ8B/033W1SHm8h8MkzWeachHjns8mVAsVlkaGvihitbBNhN9sVx9SaLr97I/odUHB/2XcJgLxP7wu5fAsuH/ql03nKXh7cn7VRAnSvwBzRb2ACjAfmtZ/eUPA9hBvxHxuifgvJJRwUJGUwYBv+UGrHDHtG1rsvAV/USdMWygIgMUitUpHIr0QAxYzGyK9Wh+cZtH8LNnxk3vLHdc+bYWbZkmyPXNSevdnE1Be34Go3esc2OhSs4oaxu0cQGZg2ZO5e6AmVpvIS/PG1eHl/l4WUFCkr5rYmI3yrXUy/AkOsI0BDUEpRauDK6RV7UCbQ8NqJCZUNgo8/+I9D1uKatQmMyyKdDamjQf4MQx+nWaUmq+RGI7yRlqyvx8a95+NRq25iYJ1pI5Q0hLY8dadBjSb0jTa+tjTBR69rurgziY6D8Df2iFYxOB+rSkK+SNh6tfWKT9HmwhC41y9jRuTbhWtasaRRtOfM6zxHhOVASGkQHv5u45eHOyx8pKqQBJ3pLjJoU7dZoxdU6Z+7P3Gjgrzi4wEM7W7EQhotwlfCtxB0g8+UlpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5112.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(8676002)(186003)(478600001)(36756003)(2906002)(41300700001)(66476007)(8936002)(2616005)(6512007)(83380400001)(31686004)(26005)(6506007)(6486002)(86362001)(66556008)(5660300002)(31696002)(44832011)(66946007)(316002)(4326008)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0s0YnpwQVAxQjBOeVhRMFJnZXFOcnNTZWtXMHRndzEwRnNQWHpMenF5NUVs?=
 =?utf-8?B?VDkyeG96MVJYYko0NVJVb0NUc0lvaXF1MVpEWU51cjJ2d1NHZUh3aEhPV3lE?=
 =?utf-8?B?ZXkwNUUvUHljVmw0VGhqNUVhY1YzZ0xrY1lld2VIMFFTWUkxTU5pMkE3cXRj?=
 =?utf-8?B?OCtwK2VkajNRT1lHSHE0dnNWckl4UXBjQ1Zibk92ZlJzNU91QXU1YVl5cVhS?=
 =?utf-8?B?T1pLSnNuZWtybmNDd24zcXMybVZFZ3NFbllOeTREZGRoTEJwNlBicndwOVZ4?=
 =?utf-8?B?VDhBaU1oajV6elB2TzFhYlY1VU0rRFFqVjJ1aTA3UDVKYmhudzl1NnppY1Yy?=
 =?utf-8?B?RDg4VmlFRzlwckgzRUdKL3dyUUJQalk5dC9peDJ2K0ZwZnJKdDJjRzlyYzhm?=
 =?utf-8?B?ZVhDUTBmcGZnVUV5eXRGZ01HVWJvdHRuR1hlV3dIYmZRZXVKVUJ2WkpKKysx?=
 =?utf-8?B?bjFNbVlNbmhLSUZ4L2o5TmxVeDNjT0RQN3VpRXhwQ0d4ajl4SFR6alZ4bWlt?=
 =?utf-8?B?RjFCTy9ZNGZoVFlod2V5bmcybExRRGZkaFJKZ3h1T3p0T0YyMmE1KzVMTFY3?=
 =?utf-8?B?YUpWdlYzVStZM2ZSRW5md3U3VEM4QzdSeXN2cDFnaXpFWUZYcU9vNGpSWXox?=
 =?utf-8?B?TmtVdXVLNEtkeUJ3YUFmQ3hYY3A1RVdtN2J4cE5uWnFsY1M5Nm9EeC81Q0d0?=
 =?utf-8?B?NjZHWWtaUlZzcSt2Sm5vL3dFTU41U3p0WGQ4eG14MHVHM2J1ZGhQVlRka05X?=
 =?utf-8?B?dzlCVFdTR1pIVWg2S05SSmZRcWl5NUtIUnpUdFRPK1QrMUZRb2svYlVxUlRw?=
 =?utf-8?B?TnVQQjNhQ04xZFBrdXdjL3lDR3JkWHQ2YlVoUnBjUjVwaU1PQUp4RzJsMExJ?=
 =?utf-8?B?NklQbEhJRVdIUEY3QklLZlhtSnlmOWVlOFN5TWJwdmg1NnhuaW1ZQ2VDRFRt?=
 =?utf-8?B?L1U5R3JJV1QxY3dSaFBoRkFZMERFa1FVdEtFNC9CWWFLTEFKVlQ3RjFuMVVM?=
 =?utf-8?B?b0hKY1EyZzlyS2lkZlBjTkRtY0ZyWC9BdGN1ZkFEajA3ZHYzM3hVaWVIT01s?=
 =?utf-8?B?MTQyUFRzenJ1MFFhampXUndwakRFYWN1ZWNLUmtld09sTisvOGRJdk9RYXNH?=
 =?utf-8?B?OFdqQ3ovM3pUbzdUUE1sRU8xV2VTN1E3MnYzVXhIQzhvODJIc0J1QVZUdHFO?=
 =?utf-8?B?WGE2QktnZklqMnRLK3dmeTBVcDFtN2Z4UUdKQ1hQWlhUSVRWejRRQ0gzZVp1?=
 =?utf-8?B?SHFZbkNFYWpMeUluVnVGYjdRYzBiV256T2JpRkNtY21UOWpJUlNsTWYydHF5?=
 =?utf-8?B?NDZCcFBCdmNzQUQ4L0R1d2xMbmNlN0dxWkRzSHRMZnBhSEgyMGtydTc2c2Jy?=
 =?utf-8?B?eEFUOWhRN2luNkxFK1grUlZ0TzE2cW9nQk9RbG8ycERyMHAzbjZGQUV5VllV?=
 =?utf-8?B?QUNnS3dJUXgzWDhPSmRvbTg3YUhHQ200cUtubVpnYjJ5SEhWcUQ4NlMwNVVW?=
 =?utf-8?B?MUk3d1VOdUowMC9xN3B6WE5id1g4Sm5rczZXL3ZzZFhUNXZLOFpvL09HTENu?=
 =?utf-8?B?c3NDWFdia0ViQ2krSjJkVzNPMDFaTjZTT0s1QWk0cHVlNXBodWltNzZEcTk4?=
 =?utf-8?B?bmoyelF3aTZnLzhycTVaNE1tR3Y1dE9NQzlzRGtCQ0o2bGRITDZIdVlQbE5y?=
 =?utf-8?B?YVNyd1Y2TWhzQmVZOTJXMC9RM3psZG1OcENTalBIYXJuL2w3T0xMdjhFVzY0?=
 =?utf-8?B?QUg3MWtvZUk1OXJpald6eG1Nb2FCVEE1b2ZXbXhkZCtzcEFVZEhxMUhtWE1U?=
 =?utf-8?B?djFYSWtRL0YvM3RvZHErOGN0aUd3QUFlRGRPWUNpQnJteXpqMlpnZ1pPL2FH?=
 =?utf-8?B?WWRnSXRVekNMekRkVzlUNVlkNkcyTDAyNTJValExaVVlbFdpOE42Tzhrak83?=
 =?utf-8?B?V2RJOVhLS0Y3NWF3WThhbFJpV3cxWFdqSisreVJ6VWthbUEzcU5EVUI0dVZY?=
 =?utf-8?B?UzlkTzJiZFYwQlpvYmhkUGZ0NFZCTkZBTERXcWNYQ2Vyc2JsemFteWFlWWpL?=
 =?utf-8?B?cHpnS1BBelFMak4rWFU1eldGejRpK0ZwNlBpT1VLSE5MRlpkYWJ3d1R5am13?=
 =?utf-8?Q?oc0QMr8wevYp9/G8WmEGncZsO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae89260a-ef53-40af-0ff1-08da70e5561f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 22:05:52.2450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqpzpeLDhYZihmVjbxL1mlMkUa7tvTwXBt4cBvu2o5NgAD9ceVsjTc2286xwBv1e7U+g3zVYapw+Yz6KPe0upA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2513
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
Cc: liqiong@nfschina.com, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-07-27 um 23:30 schrieb Yu Zhe:
> time_is_before_jiffies deals with timer wrapping correctly.
>
> Signed-off-by: Yu Zhe <yuzhe@nfschina.com>

Thank you. This patch looks good to me. I'm applying it to 
amd-staging-drm-next.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
> index a9466d154395..34772fe74296 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
> @@ -146,7 +146,7 @@ static void interrupt_wq(struct work_struct *work)
>   	struct kfd_dev *dev = container_of(work, struct kfd_dev,
>   						interrupt_work);
>   	uint32_t ih_ring_entry[KFD_MAX_RING_ENTRY_SIZE];
> -	long start_jiffies = jiffies;
> +	unsigned long start_jiffies = jiffies;
>   
>   	if (dev->device_info.ih_ring_entry_size > sizeof(ih_ring_entry)) {
>   		dev_err_once(dev->adev->dev, "Ring entry too small\n");
> @@ -156,7 +156,7 @@ static void interrupt_wq(struct work_struct *work)
>   	while (dequeue_ih_ring_entry(dev, ih_ring_entry)) {
>   		dev->device_info.event_interrupt_class->interrupt_wq(dev,
>   								ih_ring_entry);
> -		if (jiffies - start_jiffies > HZ) {
> +		if (time_is_before_jiffies(start_jiffies + HZ)) {
>   			/* If we spent more than a second processing signals,
>   			 * reschedule the worker to avoid soft-lockup warnings
>   			 */
