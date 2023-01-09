Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B36663240
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 22:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B9310E081;
	Mon,  9 Jan 2023 21:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C190D10E081;
 Mon,  9 Jan 2023 21:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8BHMTsDbzhZJa2mVnqjma9nIYa4DXzspuxX9Dvc9o52retd/F5ebqhWWdfuEJc1lyigmHH77GE2q6fosYIIIWE7cyRWdRyVBug3YXFLxodKWC0jzoa0LWnv7toXT/Ws4idVdKZnr+bVdgI+uP9AcXaZd43WlOPczPvpDzU6qigL/dIZ6D1MqDosJgUhSFGLAsjLisdQYTRXWsaLtyf4dtC4NXfU+w9QLUJzUfPFsKqdnNT7+7J/iPhqe6TLDdf7222cy/FbJtZwpzKM1VH+B3JgesnNh7FlDb8s5R3Bk9aJdDuSOeWZeFkVH4s3k0jhTj5BZk4PbfUDEMKdFVN4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUgGspruTWAC4xA/dvkqxvJgtLFZV100J3JtDPSxbuw=;
 b=BxB8Iscz4604smaTyGo505Tx82eP+dpsRod6nuQkOT3lhnklLocQ8ZXbUPVKqhW1sf/YW8Sp8QWF6saEID5p4bxusHEvUy9EdDCbMLVTmlJmuSm/Cu573w7KDEyGtKSJ4rmrQtwWaCjlYE+9PuM4dpsiXokkAoJINxI9U8B6D+iFuM+5V1J+GqfYciNUz99Og2PrTTkoyTbP4yI4LUMbWS7j04SchAHY5Qus4b1oFXjM/KJea7AoCI46p3ngTaGBIIZUcYUHojQv41yc7xHSU9rNRwIHwBvBecrUOjTLZwAAAjhfYTzK9UiKPXo1hxsjNpNTlgSEXx8vL2XyhxB+mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUgGspruTWAC4xA/dvkqxvJgtLFZV100J3JtDPSxbuw=;
 b=o45oaph1MTQqZcJwfzi7rHb9Z/fDC/2Q6kZx+TMGzmgJpGSTJG7bTjIvezjnNxEISlsvmaV2Nb8eTjzp1gTqo+MPn3KnvxI5kL+DYxeI9vMwHm02JTFOa5gvUz+ITrJnfmzyvqYO8t6xy2tucczzwUQ9EsH36Toc0Q8zfj0TL8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB6767.namprd12.prod.outlook.com (2603:10b6:806:269::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 21:07:52 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411%5]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 21:07:52 +0000
Message-ID: <07d92fbf-7573-dde0-958e-20845b8b1089@amd.com>
Date: Mon, 9 Jan 2023 16:07:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amdkfd: Use resource_size() helper function
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <Y6TI1O9adSP/OrnT@qemulion>
 <Y7nRdaDtptxE8Rwd@ubun2204.myguest.virtualbox.org>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <Y7nRdaDtptxE8Rwd@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXP288CA0030.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::36) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: 94801a28-4d12-4d72-8a4d-08daf28591d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MDxaBtO6ThJBA0JrkpjFQMVCMdl0wimdKyBPeUJQkaa1NqIQQrM0f/iT/FxBEFXvecuGreoA3MHhyNCA5ObYtrBljgjHOMGpwrtF4DjR63F9vU6Qm5ci1+yLoj3hs2qAhMOf1qMtrGqlFLYwjTqI1wqdZMY2rBunyGYqCheVu/I2sj3mQ1nfth4KbLhq1aaGEdp3sj787Rjoi/Zcp3HPHjtUzLyxw5UwkfUZ96Vow5YSusAxWO5Dt2tCsaJF3ifO5her8ONmogPqDYUhNJY+RrRJazWtilv9NSkktFCN+hB3bXElvUtepj9M90eiPUQkuN4yVgsHkt+CW19bwQNCLNMv3aKyTVPH/0eU9uAEKyyvbqoWvcg2hRFDeu1mPgwODdeof9QXqDSDuTm6NvQnlcTa3BoFxowbRxmo+UgF0y6BALSGt1qL24I0FY95v8OEsnMfX9SJ4HAPcuECBOkO5EUx7/Nhzf6xfBTesjgGIcBjJveh5GM1Fawf1s9wB4yqFwygohABUibPSLTdW4r+eYXx2+xV9N+zUGcszhxwK33sgzd99Jv4QtM+BrLTaXWU0I0XGwRYJJaYqAnJTXnhX3N9F6/BIY46jy6kvaNqGtWhY/5tqcHJNdFYPTuvH4NIN3vN8/uWw52DSCzMm15kFHgs8fCo3aiuHp7Xky/Jy9Ff8VnDd7XkUaEPo92lxxkibU3m8Kd23mO50UcSckdHPeXdmV3CphA3xw0yVHqdRgnEZ0oieos68iZqz9eM3Mno
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(8676002)(316002)(66946007)(66476007)(66556008)(4326008)(110136005)(54906003)(44832011)(921005)(4744005)(2906002)(5660300002)(8936002)(41300700001)(36756003)(31696002)(83380400001)(6666004)(6506007)(6486002)(478600001)(38100700002)(2616005)(186003)(26005)(6512007)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlRQUlg4ZkhlbzJHcllVQjljdDFiemlHME9uS0pzaDRLQ3RYdW5RT21HOEUy?=
 =?utf-8?B?dVR5WWVUL3RGRHJ1anRjdFBUOUswNE15c0hyUGlOU0VEK2xicFpXSWo5UVl0?=
 =?utf-8?B?VDl5NXl0NzNuSTNja2kxbmhnVEhIamJZTlBwWFlYbllFT2lhd0g1SHRobnlo?=
 =?utf-8?B?ZlZ2cmo5d0U3OHp5YXl0RjFSUzNEUG9jKzBnOFVkUVUrY0tHK1pTZ3hHbjNa?=
 =?utf-8?B?RzROWURYbFU4WVpJNmtRc1huVTdLa0tnVFUwcFF6N3FuYlF2UUNZVzJoU1JU?=
 =?utf-8?B?blZ1Qmx0UVVZbGFIT1VVY2RaSk5aNDFUSmxQUmMvUmRTdk8yQXZaRGZsNVJi?=
 =?utf-8?B?UmRSVTFsbVY1bTJaa0NSeTFWUW5RNVdia29lVEJkSnlWQ3kzbGdiNlJiU0lI?=
 =?utf-8?B?eTh0L084bXE4VkJ5YTlJbzZsSmV0bXFQOVZmQUNCZVhyYysraGh1eGprdUhG?=
 =?utf-8?B?T3R0TTdkbndiY0tJV3hPT0pDQzdaUUVQb1laY2lBVkNIVDdmU1RUQ0xRNDIr?=
 =?utf-8?B?dnE3NVkwZHNjaGpieXFNOTNodkhuUWIxSnYzSWZzR05WL3ErUkpLcWJacmZ4?=
 =?utf-8?B?YnZZdDFMWVJEd0dPQng4UnB0NElFaFMyUk1YYU5GNDJvekhiSER5QWNqVkkr?=
 =?utf-8?B?c1plTnJ5ck5haEd1Rzh6aUZhYlE5ZTdNWDRJOVZvRG5sWG1DQndDTkw0a1R6?=
 =?utf-8?B?WWR1dHBiTWZYZDlERzRSRjNIWHpxV2lxVkRNUW41d29UT3NqSk42WEtqTDhK?=
 =?utf-8?B?NVl1MDl2UTZtV1l4NFlsYzRocXp3dGlaY2wydWxtM1NCbTZTYVY1RWQ1czlK?=
 =?utf-8?B?Ukh1QTFLbTdOTmVqZnRjQUlIbU9oQmg1RWYySE5NMk9mbmt1N09QQmtla3ZQ?=
 =?utf-8?B?WVNjNHR4M3pZODJONmtBa2RMaHY3MU0zSTBpT2ViM2hXUmcwMmJ1SmxtM081?=
 =?utf-8?B?ZUFva2ZlNHdVRTNNWkl0NlczYTg5NUN0S3pZRVhJUHQ1QXVnOW1QN3pNaDVj?=
 =?utf-8?B?dzRMbS80czg5bXVhQThBS0NoK3RzUnY5UVZXOEZJT2MzOVNHUlFQeFIxdnUy?=
 =?utf-8?B?NjdVZlROU0dlVHQ1OTBJL0NkNDBVTHYxNExuekhsSjExMEhxMDJWSlFJSTF1?=
 =?utf-8?B?L0hSZDZNRHdMSnpxeFg3cDhIUys3b200aHJFUFc0bi8wU01SMVpXRXZHc0M4?=
 =?utf-8?B?TjBJYUk0b25vV1hqbzhKUWQ5dklNSlhIWFUybG9iTndHMVpyaUZSNGxxay9L?=
 =?utf-8?B?dWJhNzlJQXRJTktzSUZDdEJmR2xsemNUZGg4N2lCZnkrNW9sZGxrZHNPVWxv?=
 =?utf-8?B?cWRxaE9QZXAxeU9QTmJsMzN2YlBNU204WUNPeXpDbVM5anlZeE5ucFY0WTR3?=
 =?utf-8?B?WHFwbXZqV2dkM1BRMlpBUFVmeVZsSW96aTI1RncxWWgrMDVsaEpmRjZzNFhB?=
 =?utf-8?B?VDFFNEdOU1VsRTdIQXdES0JsVjZlSGU5ZUlqUk5UWVptL1RLY3ZucUI4Vm9p?=
 =?utf-8?B?d3lZTS9Da1ZKeE5jSGNJTFhFd0t6SVRUNDZsMm5ML0VOL2dsV0FkU1lLQ2w3?=
 =?utf-8?B?ZmZONTh6eWlKNFNDWFlKRm03bHlzd2VmdzBjWnorSWhhempWckdyR1o2cjVm?=
 =?utf-8?B?UlIwRXNVSmtpSEpLTDNBQTB2V0pJbDVFdTBRbnBNL2pxL1BITEJ0cjNBVzBQ?=
 =?utf-8?B?K0J5VTN0STQ4RVZVVUJwS0FKa3hWdnYyTU4wUkdFOVZUWlFPam93TXFLMytP?=
 =?utf-8?B?TGZVekpJOEF2SUdDVWhBcDRvWHZNNEd5QVhWU0ZMQy8ySEJrWk9TcSs4bkEy?=
 =?utf-8?B?NnNqcnZwM01weHcwb0w0OW1aV2FsdlJRbURSMUNkWk01V0Y1eFMxc0tyaHJp?=
 =?utf-8?B?eW5FS0V5ejNtUXc1YXY4YUdRVU5oOU90dlpFMTFubnVZalJlaFZPV3B6M1dF?=
 =?utf-8?B?STVpL0t5OGgwSUxoQjdNOEsrbTczR3AwYWpPSTd2NXhTdTYrRThRUE05ZE5D?=
 =?utf-8?B?K1BnN2lvLzd1aDhwdzVOVUpvQUpLcmhPRmg5b2MzMFp1NkJPVmtOV2pnSk1z?=
 =?utf-8?B?YVlHc3RtTnE3emNVbmJPTDNOL21LNjVqOHFaYzR1d1B4azM0czg5MnM3U0ZF?=
 =?utf-8?Q?mxzy61/KXOu2x3m0FgVxktYG2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94801a28-4d12-4d72-8a4d-08daf28591d1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 21:07:51.9222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rR1Kp3xEzOlu5kQ7Rvq30bDeDX6YbjOouwrVMZesy0HJyGkxpMZ5emZOxokYXUg5sjSL/IRlT5pEyEEu6Fpv+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6767
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2023-01-07 um 15:09 schrieb Deepak R Varma:
> On Fri, Dec 23, 2022 at 02:45:00AM +0530, Deepak R Varma wrote:
>> Use the resource_size() function instead of a open coded computation
>> resource size. It makes the code more readable.
>>
>> Issue identified using resource_size.cocci coccinelle semantic patch.
>>
>> Signed-off-by: Deepak R Varma <drv@mailo.com>
>> ---
> Hello,
> Requesting a review and feedback on this patch proposal?

I applied the patch to amd-staging-drm-next.

Thanks,
   Felix


>
> Thank you,
> ./drv
>
>
>
