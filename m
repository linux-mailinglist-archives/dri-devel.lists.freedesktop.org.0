Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5656334AD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 06:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1433810E36D;
	Tue, 22 Nov 2022 05:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1301110E14F;
 Tue, 22 Nov 2022 05:19:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXKpS6Vi6E3CzTH/f2pUr8kMEwdXSnj+hCJ+yyZaRuzPAgIw50YHpB8Ev0o2NzNph8Y64BS1n+RUSI9zdsvspnAk6QZHV93I5RZmpZCwhxOP2m93R0zzJ6zmf3ZAyLWzZwfFTzNJz+feFHp4ygpT+u//xZmcuUW3cSm/O0XvJHigPOMH1f/KD9tckp31VJOFW9aHWshuGDyeU2TM3yOuBXUiT3hyfcPuVDnWHlju2cr9q/ZS/aQ/HTsnSHpVJE4iIjwopbSPWd8AniefV9G80xwYki+bUf0St+I0jBfY7VK3QRtHW2tLWPgEdD1QecPNteTn0eyKVxv2aobftXY6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=va6w38PmyyjazIb8lXGqus+K2nWf5odc8XxeHNmULZk=;
 b=eL2cAP2uJxC9ICe1NKPks3RqQchDVJ3V5E7juoCQGuJw3HoS1Ppxk6dpsGYH+JMM5uuspww1SwhDkcQI2ZL5OsjndI7juiDJB2FXYADNfLaCd8e1zzHiooqO69Nqn/6EHIvEp4RROW8tb8btFz7bjjIeUZI4n1w18GF7r3sr/ZVI+o4JyyMo8mSVgDr6bVXLHsxHwyUNS4hYlyA1p14BT8yv/v7/robeQ3atQSrOeGyGTF4xjjsSTEN/VD4RTIHAhwCna5Lq44r5etcLneCo6+fflt3i/ZcioZl0IVw7+T51Eqv6BlHVbU/RRRVR4b/TPVYZ8VPAIQdWIxLaMU/UXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=va6w38PmyyjazIb8lXGqus+K2nWf5odc8XxeHNmULZk=;
 b=c20rD5VN112zdvqS2yiTwR+hj9eSEhO6HyLfVvnq0StKpBGK9f8VXpv3/GXvn3YfQcpmIskVaBWQq8W2ekKjhrWcqstvNzKqvr/dAQH6hfifhkltUTt2og4J3+ZBVXcFM8d14KNO9ogA6d/L+d+rc1JIYr/rIfAK+QsHLKUvy8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3892.namprd12.prod.outlook.com (2603:10b6:a03:1a2::11)
 by IA1PR12MB6281.namprd12.prod.outlook.com (2603:10b6:208:3e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Tue, 22 Nov
 2022 05:19:11 +0000
Received: from BY5PR12MB3892.namprd12.prod.outlook.com
 ([fe80::3070:2c51:2a78:ebc1]) by BY5PR12MB3892.namprd12.prod.outlook.com
 ([fe80::3070:2c51:2a78:ebc1%3]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 05:19:11 +0000
Message-ID: <4afc480b-a211-dcc5-1b8f-7c097f2c6a7b@amd.com>
Date: Tue, 22 Nov 2022 10:48:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] drm/gem: Remove BUG_ON in drm_gem_private_object_init
Content-Language: en-US
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20221116085012.187756-1-Amaranath.Somalapuram@amd.com>
 <20221116085012.187756-2-Amaranath.Somalapuram@amd.com>
 <fa9ecb1f-17a9-c7ce-d25a-42c3860f1b8d@amd.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <fa9ecb1f-17a9-c7ce-d25a-42c3860f1b8d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::17) To BY5PR12MB3892.namprd12.prod.outlook.com
 (2603:10b6:a03:1a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB3892:EE_|IA1PR12MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 6291acfb-221f-4696-6a72-08dacc4915de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rKBqv6eLrD8x5Q6Fj9Suz1OaPJNwcx5UkiUY+mp7w2X4xgwh1rf0m7x6rMgAGcxZhY1tX+Scz8I0s/dVyhw/JEcwpQS0LCVJHptWArWHRNIrDjyXS4vP3Y5apkPO1bgN0oYr9HStzyvBnr7TZEwY3OcnCgWfeMtM+uhTqAGRVM5Zb0NZM7MoNLFIksWsDu1RQ9XTz/t9yVIBbl1UFSSwlMTJDPmimBaTY8QrwJndqvkBoIh7tl1Xx9aduC9A950gwDYzXRP2ngV5xRYniP96shwccbzGUp0SRRMK2WdryzUfPTdLH/IgG7EYSBBPpY90Qd+zGRdiEbfsq7jIbiEz07NhsUt2jqMovDcDx5WzkGVRHzaDFxMi4QIXgMTePWKT0X92pf5Moujblpk9JA6MVdQVz5buebBt3J2a4f8IAjzra0wx/PxDWmEO2q4rO+XBfSZDGg3TkG0iBjlIiXGxzGewZOi2d4aZkBimw40A2WrLt4Pre6vgHQ/ym6tR1niz6wIEsQ3Qaf0cDNUIFTT1nFlkZne/RqzfChZKu0sZO3Crom00IDjOwmb1QXu+fSrV8us1ERoTXVi1B+C/CkH/grdiH2ty6NQJCD9fe5vssngqNVul44Bf0MM0v4y2y5rEpmjf7fuz9ae+L/XlWDS5lX/TteGMYCgDxYUqogaexJMj1bNuRqByHcOBGUy3kj+QtJxKxhw7+KGJ1yGJmH71gaMcO41YwxCGSkyvl0ByAH4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3892.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199015)(450100002)(316002)(31686004)(66476007)(66556008)(110136005)(8676002)(4326008)(66946007)(186003)(26005)(2906002)(5660300002)(8936002)(36756003)(53546011)(6512007)(478600001)(6486002)(4744005)(6506007)(41300700001)(6666004)(31696002)(83380400001)(2616005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2plVVVuVUg1UVVhNEpzL083M0FQc0YzcFFNcFUvTmpoQWUvQjhETE9TOGRQ?=
 =?utf-8?B?QTloYnk3aVFWWlQvZ3N2NzFVL3QxY0VRaG9UWVJLcTNxY1J1aFgrL2pMQ09P?=
 =?utf-8?B?Zk5qbXlFWkc1eUN3RGJvYzVjR0Y2VHRyaEwrcW5BUHJJZjhXZzJ4TmlIQnE5?=
 =?utf-8?B?ZHVCbkNQQnlGV1RwbHBYTDVJeWFSVzdjQStOKzJUdmdFZlJMZVZJcjZzODBr?=
 =?utf-8?B?U3VMbHdNM0RmV1BWR3libGVTczFMZ0t2Z084UldKVGh1bng5eWFoM1JUNTVw?=
 =?utf-8?B?c0hoZ1hJNFlhb2U0Rm9PUzJJSk5nK3ZWWlBXL1J3Z2IwaVBRUzhKanRYNFpE?=
 =?utf-8?B?ODFQcERvMDNKemU2UDY3akloUWdXeHJGaGJLM3lxNVkrZzRySFZNc0FLbHkr?=
 =?utf-8?B?eEVFSjdpUGpES1ZhZWpBMEYwaE9OajliWGpyTWJuSEZRdW9IKzVOcUNuaWJC?=
 =?utf-8?B?TmxzN3Z2amE5anpPb2l5ZkRHRElkT0JkUTFWZzBuanZDK1VMSEFrMGdHd2po?=
 =?utf-8?B?UGhxNkprSkNvbUErc3lld1U1dERDVStZQ0N1azd1enljMGhZR1pxS3I1cHRp?=
 =?utf-8?B?N3ovLzAvcHNXK2lja1Z2Rm1FSlR6elFUMXFrQVZ4dkd1cFQ0VEVNeHphbjVX?=
 =?utf-8?B?bHRqTVVqQ1JyUEI0cWUwamlTb1U0L2JIYVZNZGx2V3EzRTNESzZtNExUZzRz?=
 =?utf-8?B?Y1licS9LU1pPbU8zdGpaa1lIY1pxWTlYemJvZlpDSm53TTUrOFVJK1pDdU1t?=
 =?utf-8?B?ZTdoV25YMFNwQ1g3S3ZSRG5ZYit1TGhWWVlrdGp3bUhJcGdqNmQvNm81NnFW?=
 =?utf-8?B?dlp6RGVENWdON0NlK1RaRzFuaFdFbDR3TkJ2YTdkcVdXMzN0RDNZS0ZDYTZv?=
 =?utf-8?B?SHMrcEJqdnhSMStHUG9xMmEzcHdTRHVrZUdiRjdMMjBQQXNkMXhWUk5TUlBn?=
 =?utf-8?B?UDg0cjRjRmJRRjZwT2tiVWo3UlVLR2tMQXNKSS9oSFBEVFNZRHphb3ZMRjI3?=
 =?utf-8?B?VHB4QXhNTUJKZURmQUovLzBKRlFIa1l3M0ZZclgyVHR1N0kyc2YzVXFBU0dy?=
 =?utf-8?B?NzhqYzY5Z1BVVnE2QTNzZ2JDaVFmTWdkM1EvQktwYWk4Sk1Ja2lybEZHN1kx?=
 =?utf-8?B?MlZOa0xFWmZyTW9TeDhnK21hY2ExdHRyUERIM2ZrWGcrN1AwZS8vVk8wK013?=
 =?utf-8?B?bmgzTTE3U3RkVDRYZ2h5RVF0d1ZsUnUwOS8wMFBYMXV2VEtyL2lzL05jdlZD?=
 =?utf-8?B?Y1ZpQUFPQmNCcUpmd0F4SllJZVVJV1NPbThzQzdUcXJ3RStSTkNpMUZWNzhH?=
 =?utf-8?B?MXVpdEtBYXBuWm80akljMnowd2hZVFFVR2hJZ0ljMVJHUWtBeS9HR3BiemJX?=
 =?utf-8?B?eTJuRUpsMWhrVVRQMVVISXVBM3Rnc1g4MzRwcDluTHVSR1kxejFWT2ZxTndP?=
 =?utf-8?B?a0xFcEtNdnN1ZUkzOUhrYnBhaEVGY2t6TjFpL0ZYSENNUzlrUGMra0xUU2dS?=
 =?utf-8?B?c2srMTdTY2ZKYXIySysrdzF3Y096N1pmMEZ2aytTclppZlhoais4M3ZrQmNX?=
 =?utf-8?B?ZDFoTGdzWjgvSkRxNTdRa0trcnlSNzQxWktsMXBqZ3BVQ2RwOEZLL3k5QmY0?=
 =?utf-8?B?ZFZmalA5Mmg5RnNDNjdnd1FvSVhQeW5TenFNaks0ZDMzQjlMdkpiODloVWxO?=
 =?utf-8?B?c2ZNaHVNWXBoNUU2anpJZ3c1ZkNOUmxEVTNVMldOdVNEcGptQ0N4ZmFrRzRr?=
 =?utf-8?B?SnA1Nk1uaTFpc2YvQkthTmM0OXR2bXhLVHFVRCtQaWRLSTFINkZsUW9KdzJ4?=
 =?utf-8?B?K1Q5WTBOZ2h6a0VmVkNNL0tlL3FqUjZNRjVIcDdZczFBY3dFVElCeGpwbkdz?=
 =?utf-8?B?MCs0N080NDlRZTZDNHdjbGliU2E0QlhSN0xWVm1CK0krSllEeFlTUFBqYnhB?=
 =?utf-8?B?SlhXRnZ6aHdyRUlNQUIxeTdnTkw5OVJ6cndLampFWUlORFltVVBkU3RlNE4v?=
 =?utf-8?B?K3N4d1Y0dDNaREVUZFRiMzVLRmFXMVVCbkRxY3FyUzVvQ1VWY2txcC9mcjQ5?=
 =?utf-8?B?cWVmSXl0WTRkc0p3NklnekZZNjU2aUpQSUpKckFaRFhRM3R3ZTFGeC96N0d3?=
 =?utf-8?Q?WwV0YHfm54XcFy/AV3yWlgZN3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6291acfb-221f-4696-6a72-08dacc4915de
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3892.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 05:19:10.9172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNTwIFTVI0iI9oMJnatHiFKgThC8EoRQSRnOJCpsVUERVLNKyYT+urQh6KKmrXt1/jyjVTpXw3NBnzIZBA9WBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6281
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/16/2022 2:50 PM, Arunpravin Paneer Selvam wrote:
> Hi Amar,
>
> On 11/16/2022 2:20 PM, Somalapuram Amaranath wrote:
>> ttm_resource allocate size in bytes i.e less than page size.
>>
>> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>> ---
>>   drivers/gpu/drm/drm_gem.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index b8db675e7fb5..a346e3b7f9a8 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -152,7 +152,7 @@ EXPORT_SYMBOL(drm_gem_object_init);
>>   void drm_gem_private_object_init(struct drm_device *dev,
>>                    struct drm_gem_object *obj, size_t size)
>>   {
>> -    BUG_ON((size & (PAGE_SIZE - 1)) != 0);
>> +    //BUG_ON((size & (PAGE_SIZE - 1)) != 0);
> This line is added by mistake?

No this breaks when the size is less than page size.

Now we support size in bytes.

>
> Regards,
> Arun
>>         obj->dev = dev;
>>       obj->filp = NULL;
>
