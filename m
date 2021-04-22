Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12927367F3A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 13:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398056EA6E;
	Thu, 22 Apr 2021 11:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770043.outbound.protection.outlook.com [40.107.77.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425826EA6E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 11:05:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmzY76Ab4RP49ElI5NJ6fbxn2AWLDXSTeb+OgMUam+3Uc1/YppNuePGyeTmfNZBKGfJi3Pp6I5/WWBIEA7CTFfRD1fhD4HHSNLS34iGemkYY5qJZnoojCAQhU1SmHEgw7J+I0UJx1kn0dda9fz41zLFkififBWF+aPlbW6YZbe8fa7jvyspqh4iHd+f3C9NpaBFyrxVWjdAl0I8TQA1c1eNb+tUsEpqi90cRO/1ed/Rn5bbc5YJkjo2B+M8xzf9ZJjvLLIhTDmLfi12P/hiXL4hvmqum6sOkgyQoTp/bZqce6iN+rzLudf8eCp2UWFX1izwDKssO86hWF6IW5AvqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QChMk4mB6ythlD9b2q+F3QDxBHZkKE7cPt7UmTvz+vw=;
 b=ELhwfIkTXVcwDledJYO/5wA0TAp1ejQWZivSvzypheBHhJ2Y4FRTqezluV5DZDgsC1pYCu6oyOyPkYjNlJ0HpyzhEI7Afzlg3mrXJ79csUtK++3J5V7n36oLBDVHDP2poh3R+Mv1/VAKfAHue+3ViV3cXgcH3b1TbyGYq9E4ym5aEKgW7uSQOuv8vXPrWr4eYgpIixYsSTfljaR3Cr0rQ0Qzt32zWrI890BuJNDdHaxyAnChx6yuJ/ZeZ40cmM5CzNagTmNrKfM4A9ilIDCCQs/5GNnDlq9zuns/NRfeMS3lZW/UlKtkPnKdPp537VctBPEyXA/xVCELCj/UL+NnCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QChMk4mB6ythlD9b2q+F3QDxBHZkKE7cPt7UmTvz+vw=;
 b=SADyN5ixJJbm3eZ8hCwcP7HzFYiK7qZPfEC0m989fHBwQv/ntCnW2pv0pT6+wKbNaGDh0FDVd+HjYtPYPaQPvWzjehXsERyPD86uftCEIzeM/+p6HTyAI3OParUY2nGXWTMrE2z1SICrOAsvyaeR6ZqjhSVJjtInJpZLEn7bf9A=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3886.namprd12.prod.outlook.com (2603:10b6:208:16a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Thu, 22 Apr
 2021 11:05:21 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4065.022; Thu, 22 Apr 2021
 11:05:21 +0000
Subject: Re: [PATCH v2] drm/ttm: fix error handling if no BO can be swapped out
To: Daniel Vetter <daniel@ffwll.ch>, Shiwu Zhang <shiwu.zhang@amd.com>
References: <20210422083749.11686-1-shiwu.zhang@amd.com>
 <YIFHRJvFwe3flG6D@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cc103b78-6af3-aaa2-5102-413eae39be80@amd.com>
Date: Thu, 22 Apr 2021 13:05:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YIFHRJvFwe3flG6D@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:2fbd:d2a4:da7e:4526]
X-ClientProxiedBy: AM0PR02CA0112.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::9) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:2fbd:d2a4:da7e:4526]
 (2a02:908:1252:fb60:2fbd:d2a4:da7e:4526) by
 AM0PR02CA0112.eurprd02.prod.outlook.com (2603:10a6:20b:28c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 11:05:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3e148ad-64ca-4cf9-8f1f-08d9057e84e9
X-MS-TrafficTypeDiagnostic: MN2PR12MB3886:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB388662C882A4188839CCDE4483469@MN2PR12MB3886.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7f5w0a3UAvXmN6DnS2PlcsnwzDBVOeDcAhWNncfCgs1zYh5v8T4BUQWBnZ0dax0yBzQPpVTMNkbe+2BQt7TZIFwubRJUBVtLkRR4FoVkKuRCepE6HH+C+BvAkGwU0a1MeKOIAU0A0jPzPxVOTaVNDqCbI7cpRFdw4jnf4WHFezhz1tzXyMI9tru6N4djF3plhkBa7vZqft1SnoFQx8lySjgK1b/iulhWREBGg88Lj3JjUmGdDpzklLBwFlN7G9Ws3BSbs/J8PHw/AG/CbJpPQwMNhVP9gL2/Ndw6mKaKBb3QsYojSPWqgdnhasv7yfkfzK98I6mK3o9Sm2kr0iyHYZIucE3JXqwQlHKLFOOKNtv5Lc+w5nr3mZoTlfoBgrroonORZbMYqHq2o9c6pM/O4bvSSMHJuVdKxN8OsHkAaA1s29aVMIc5bavyRSI6jYSa+K+we1Fx4ifaDjfb5gIMcZn2Vf1q0nM5y+0mwttLb6ZMuRwQ7ZffOHsXqq3JedUqd/yYc8u0oZC4MCeHEXY28IbrUQkXQDkr35yFHUx+usvYW2sI7/JCS92e+ijrZPD+bihTz8Drzdc3l4Oa2OPf/K6goF/FZ3i8zFYl/ezIbMSxizPNkVqlAymBlFNZsp24rJp7mIgYVtlZCYKRDzxhcM/2mL50RI6DQmxQc2ie6sl9lLm/n2uThAYwTOrMdpg4nlhqZnFlX939S2txMUJigjsqa6c5t3so3F6vjNMjSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(38100700002)(2906002)(6666004)(2616005)(6486002)(36756003)(4326008)(6636002)(31696002)(66476007)(45080400002)(8936002)(186003)(66556008)(316002)(52116002)(86362001)(83380400001)(66946007)(31686004)(8676002)(5660300002)(966005)(16526019)(110136005)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cVM5TkdWVjhNTFk3MytydjhxeHk2YU8zSFdZckZOS282T2RmaTNPd2lKM1RM?=
 =?utf-8?B?R3FxRWVnaWxCWFZveEN2ZGZjZldjZkxDcDJnSU41aFRCK2VZR21yM3VjdlNo?=
 =?utf-8?B?ejJnbUdiYTRUUjZ0SXk1N2NmN3NtTzNGSXFkRExHZEIybUgxUXdQVHdDcnhJ?=
 =?utf-8?B?cnJscWN1RE5tVy9DckM2QzVzbWRYdzcrTHg3UnlHSFhlQ0hwQTJ2bEZCRXZK?=
 =?utf-8?B?d1plT2pVc0VqQ3IrclhBdzB1alo4VTZBajU0RWZqVnNXdE5TS2ZCNXlGZWE5?=
 =?utf-8?B?M3RzUUw0SjNuUm5Fa0V5NWdJVW82a05EaGlRaWora0NQdjB6a1hUTVRDRytC?=
 =?utf-8?B?RS9meHlrM3pQVHZEbTRqK3hRb21wejB4d2JYa0syWWxjVW5sd2g4RGtGd3VE?=
 =?utf-8?B?YmY4eU96M2N0dnNDQ0ZCUjlmcDd2VlpUZk0yd25NMGtqbjVtZW5IdnBzR2JN?=
 =?utf-8?B?NTA1RFlUalA2OWVtTmtjSExIMnJWc2hrOXMzQng5eU5kWXB0LzFWRTZwMStu?=
 =?utf-8?B?OFZBTjVtVGJkY0hUVWsyVjZ6Y3RRaDhZMmpWdGhVUE5QNENPTVhnR1BNZHYy?=
 =?utf-8?B?aWk5R2pjSTRyR1BDSXkzeUM4VXhsTmFQMVJ0azFtbEVVZ1JuSVBBeEN4bzYy?=
 =?utf-8?B?OU5jZmxaeTRyekhQNklRdnVaZS9PVFdYaEdQUWtFY0pIQVIzY0FsbHJwQWll?=
 =?utf-8?B?MFdJNC9lU1FpV0loS1gwMjFlK1BpbHM1WTRjSFA2dG50cG4xZFl4TFNGQkJD?=
 =?utf-8?B?QlYwdFRMeFY5Mjg5RjNCaXRGQ1BLMXA4cWNKWEx4SE84ZTBLVmZHSnhrMWJq?=
 =?utf-8?B?b2JSRkxyNDMyR094RUVIYSt3YjhyTDZWdzJzQ0RsZ0srRTZ3SzhDUTdQRDRR?=
 =?utf-8?B?ZHRWUUlOdjBNYjZiRnVYaFAzUFJlT085OEJYMitCejdWVTdhZ2FGWkdQeW9w?=
 =?utf-8?B?ZElkQkh6b1BpQXdkT3ZIcDh1ejBKdTU4UDh2VUZFMzAzRGxOTzZkOWd0MHlx?=
 =?utf-8?B?V2ZodFNUSWRqcFJjVklqRWYwSzhXTkV5Q2grQUlNaWJBWjZxR1V0UEhJN3dp?=
 =?utf-8?B?a0locVlGU3p5eDhnZEdhNjJZR3pLcEhoRWhwSkQvbExMcGp0QkRISmdvT2or?=
 =?utf-8?B?SHYzQVRXZE51U1Z4bFFHcno0cGpwM0E3UkJEMmVFYzRDNlMybksxSjNvQ1p1?=
 =?utf-8?B?a2RkTzFhRHpGMSt2ajkyNXJ5czFCbXR1ZklGall5cDc0SjZsZ0djaldvc1Rr?=
 =?utf-8?B?ckZzd245NE1JcG04c1pqcldWTmtIK2NvQUtoUjlsUzVmcStoSHVVcGVLWDFj?=
 =?utf-8?B?a3l1OUwxb21peU5NUjFnOUY0QU1lY053d3I2OTN5ZmVyQjE3UjUxbHpUdDRo?=
 =?utf-8?B?Y1hmV3lKTUJtV3g3MmJoSUx6RFc3UUcrcG1mc3RGQ1ZCMzAvTytxRFlORjYy?=
 =?utf-8?B?VXJYZTlLWGczUWJ5ZzNXb29QSlIrdEQydkVZeVcxRE5LblJyZ2lHMEtiSmt1?=
 =?utf-8?B?Z0JEYTVxemNVUlNPN0NoVDc5N2pVOFlrM3NLeGZJMHczV3ZmQ3B5dlo4YVdU?=
 =?utf-8?B?azdwWFZtWVBEWnlPVHdmaWlKeDloK1UxVmFkS3g1eS9ERHJrZlhWQVRBeHhw?=
 =?utf-8?B?MWF6WmVhbEhCR3U1Y3V2aVNSRmVidVhKT29zWUtTZElBNURYWUZBMHl4WEY1?=
 =?utf-8?B?N3JyTVRYWFEvQWxjcXBEVmRWRmN0aTBDekgra0J1eDRKYjZidXloajRJb2JY?=
 =?utf-8?B?LzhlQ3RaVWhPWTRQcmJJbzZuV1BEOHc5NmxQUmVXYWM2TlFHcWo0YzUvQ0xi?=
 =?utf-8?B?V1dGa0dBQmRtKzUzcDJQRXZjRUhWVGNEREFJNHIxTy82aHplRnBFcnVLdXM1?=
 =?utf-8?Q?WS9jgGe5XISS+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e148ad-64ca-4cf9-8f1f-08d9057e84e9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 11:05:21.4836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5S8aZ5/px7a0vy9XbBFQRn6JxpaQZ/XVXCJ4EuR4NNmmxq3ZHB0Kk7yrVauKqj8C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3886
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.04.21 um 11:52 schrieb Daniel Vetter:
> On Thu, Apr 22, 2021 at 04:37:49PM +0800, Shiwu Zhang wrote:
>> Signed-off-by: Shiwu Zhang <shiwu.zhang@amd.com>
> Cc: stable@vger.kernel.org or at least Fixes: tag?

The code in question is only in drm-misc-next currently and won't go 
upstream before 5.14.

> Zero length commit message for something that claims to be a bugfix is
> probably too short :-)

Well that is indeed a good point :)

Christian.

> -Daniel
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>>   drivers/gpu/drm/ttm/ttm_tt.c     | 2 ++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
>> index 1f2024164d72..5dc92b056f0a 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -112,7 +112,7 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
>>   {
>>   	struct ttm_global *glob = &ttm_glob;
>>   	struct ttm_device *bdev;
>> -	int ret = -EBUSY;
>> +	int ret = 0;
>>   
>>   	mutex_lock(&ttm_global_mutex);
>>   	list_for_each_entry(bdev, &glob->device_list, device_list) {
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>> index 48c407cff112..539e0232cb3b 100644
>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>> @@ -329,6 +329,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>   	       ttm_dma32_pages_limit) {
>>   
>>   		ret = ttm_global_swapout(ctx, GFP_KERNEL);
>> +		if (ret == 0)
>> +			break;
>>   		if (ret < 0)
>>   			goto error;
>>   	}
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C61e953fa35114f9d69b508d905744ac9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637546819302622693%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=kYfLVPAIa%2FalK8g4xyI9pV7LcIH5Y7VRApNPdUtei5c%3D&amp;reserved=0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
