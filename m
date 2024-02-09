Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB0384F578
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 13:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D6710E268;
	Fri,  9 Feb 2024 12:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5brwyVsw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B880110E268;
 Fri,  9 Feb 2024 12:58:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQOJ6Me+sNzO91CXZoLa77i/Vdk8JKGZKG+VsBxt9yAb1QNgnjaf8WDfJedsOB8w5mOGaEvFsIpaakhL9rI3oMVvpP7uaET8zW+OSf/4K8O7y1gxJNy1YK1Pgv0D2IlKA7iBNELbCsYG8fwzmiAnbXu6BnNhSv0mYKFNfe6hss43AnLVzexB6WzoqvDH9QjpHCNyqjzICfJz6sewCvuFR5psC8Lh47iRW3vy1ozSpHvxfchHk5ADH3gl1/3SCP+MY9aXXIt2XSHXq1meJmnDZpputq5HXI357r7HUpmsVYZEtwjXOEcIgEdWHOH+SxwI6cLlQbAlEOyA4E4f96SkBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntahNVRmV1plVPmZpmICQkF+Gpb5+TjQOyHgSfrrdoY=;
 b=MhYY2HLS9Xu2zdkD5pe1YU0HdPOV5aD3zLcYbFPviJ5z34+0RpW0ojegaWQ4gHcUn/u9w6iS6kmo623IYLlHn9tprhrJo21etax3fcpSXb41Lk4MYOCxoLQA1r59flPyPR02V3HaoIS/NAEl7/XpfLC664hWVzzhRXTEHEbvmC+eaDZ86e1MPDfeMzlVRInp/xyCLAS27e8WezR0aVPNOT0+FiKaWv3YEaik4c9esyEtIKJKkmCk5EQnAyUKdOqFAwsn5E7v/jUlAyIj9ylDCu0OgNi80vigx5DdXtM2j5KOglcWwYcAXZY49RrTIVQ8WWMGEPfbGawiry6sv/SZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntahNVRmV1plVPmZpmICQkF+Gpb5+TjQOyHgSfrrdoY=;
 b=5brwyVswgKj9YtqlKEuFzX6SS8mRLMq0pFqaHWaKeGIwzaAcWH31jBc54IeawQWFDxlePy51s3DGt9z2dHtg6bGHflJPQjee0Nefey+U5LPWnsKc3UA9xILMqF7Yh5kEd0KKdP6j4WJMStsIhaylnhvtWygHhfKALu1TqISWJZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BL1PR12MB5803.namprd12.prod.outlook.com (2603:10b6:208:393::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.28; Fri, 9 Feb
 2024 12:58:45 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe%4]) with mapi id 15.20.7270.016; Fri, 9 Feb 2024
 12:58:45 +0000
Message-ID: <e72b0b7c-b446-e306-d01e-2d9e1ca5eaad@amd.com>
Date: Fri, 9 Feb 2024 18:28:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/buddy: Fix alloc_range() error handling code
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com
References: <20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com>
 <c5d75c40-7fb4-44a4-8ea5-327385f88004@intel.com>
 <ba6b433d-e672-bcb2-4d25-66b2db50d7b8@amd.com>
 <5c6fdae4-6fb0-4735-afe6-fe35481929fb@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <5c6fdae4-6fb0-4735-afe6-fe35481929fb@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::21) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|BL1PR12MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c2f556-e352-45ec-3888-08dc296ed93f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0201HWbfRebxtTH4KPUpDuNrE9HKsspZplSnNnqZtfA3+mlS4wrMWZDswAd/8CRsFVCHmHhoy457MC0lC+++Zx0So1+KDSCSEfOEp0/OdN3v/W1g36YLt/CyFptfgmzyADhEYmEhKefheJ/ORQCgxBrtn6Oq5SroidLH1VRsLiqsQIChJrox0lcQKa6hFvgTlLD0UakhXXmLuj3yQwmhBd+TWaNY6gYBCBl66wbIS+jCM3n3HRvrJbqKqx6bWc5S0lAFoAxFirrvIUZYV943JHgzAUvD4FisXcROkymCw0PRXlgW1JyI10jrFJq0N+JjyB2Hv4AUvoN38F0PdMHLAOpBhBUKbUO2Cg7X6MCaYbRmVAcywq1LqKNTXvCgx9VsxHzSOPbtXxXCUhtlI6LRtaZkGDCV7erQSFkE8K0Zky0cKCA5lv0nQoRt/jsxmgod5Lmyx0sRCFC38PklOJcpA+S7eo/R9M5/fZoGu0O2W4STF3GahJjfCOky1m5RY7nKuOEEdDJwX3lVVEIfLGuCcD2NGnsWQogBSvdbtcwKVUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(31686004)(41300700001)(5660300002)(8676002)(8936002)(4326008)(2906002)(66556008)(66476007)(66946007)(36756003)(316002)(966005)(6486002)(478600001)(6512007)(2616005)(6666004)(31696002)(83380400001)(86362001)(53546011)(26005)(38100700002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk5XdVB2L2t1MkM4eldmak5uT3lxOHBmdmI5TXBqekRqUWlFZXZObklZcnVN?=
 =?utf-8?B?ak55Wmw3U2psdjFpUGIzaFVGM3U1eE5wUGhmQ1Ftc0pLMjNpRkw5YWUxNDdY?=
 =?utf-8?B?Q1hqbXVTL2xqb0JJSmxGa3pMKzE3N00rRS9ZbEdEUlM2SjViM1VUb3IxbVVG?=
 =?utf-8?B?aGwwMVQvanlLRDJyWG84ODFxbThKQXQ2OW0rTU5OUEtNYzg0S1lSWFR4aGlS?=
 =?utf-8?B?bi9WZTFkSjNubGw0SzNWMG0xbHo2MUpQalhMeWtvYTB2bWorbjlGRzEwcXNi?=
 =?utf-8?B?M0NPQ3ZHZWxxK0owdXVicFdsSVRBWWNINnF0Q04zdlNhVEl2OUNqYTR0clpK?=
 =?utf-8?B?ajJXNGNaOEVjdHc5RFF3UkNsRVAwK2lPNzVrSEdpRDJ5RXhjQk5TcVVUL2hv?=
 =?utf-8?B?TGF3MjFmRnFhek9ocTR2cCt0NVU0MGFlWGFVc09nOEFyVTU1bU1VbzFhZjY4?=
 =?utf-8?B?dWJXMUs2NlR1WUdEVlhXUEpZMWE2dHdhSXdLRkF5RllidkJSOUlvVXJXU0Zv?=
 =?utf-8?B?cTZBckIwaWprUjF2TENmQXZ1dmRMNENwKzN1ZjJEazIydk4xRDNPQmNuTU5n?=
 =?utf-8?B?V3lYVjF3UGFmSkdVMy8zTGN3ZjJFcHhTem45UmFPWHJDbzF3c2pRNXhzWUZ6?=
 =?utf-8?B?MVh3Um5jSVovaFBQMVFCZXF5dHlLNDhmajFXTjlaTmFtVzgreGx6dUJWY3JS?=
 =?utf-8?B?dkMxUUw5ODdNNzVwODFmaG1MSUJlU2J3Y3VweVhjWFJIR2RYRFl1NWt2U0lI?=
 =?utf-8?B?WWFIOStzSkxycnBwUGkrcmc3alM5K21UMTZpYXIvM2hBeVBPZWlxNFdPTWFZ?=
 =?utf-8?B?MHFuNEY3a1VFSEpuT2JJampPUHYxOWgwLzNMaEdZczl0Rk5Pb3lUcUFUL1hk?=
 =?utf-8?B?OUNBd0RUalFxMnR4anlQVVRlQjZtQWVjV1R3UjBPcnNIdnNZdUFwUFd2cGJD?=
 =?utf-8?B?L0VSK21BMjBqZExtMG9VSnpLVklldkhITERVZmxGako3UnF4cmdKUHhVMHBw?=
 =?utf-8?B?aXQ4TDArTFRUTjlrVkQ1dE9UY01PamsxYzNOMnhtbXFXY3ZYRzZlV0ZDd2J2?=
 =?utf-8?B?ejJiQmszSUlycUlsMVVCUXlqYmF2YnBuSHJQcFoyMXZIU1ZVcVVwd3Rtb3BV?=
 =?utf-8?B?dkZiWnFGZFR5Y28xNXI1UDFtQnNhNTZwRWFBaUJkRnFXVDZTemtERFIwUVYr?=
 =?utf-8?B?TS9ab1VkSWplT1JVVURBRG9wQ3EydmdHejM2YmJWZWZxWTNBenl2NHFOZFN5?=
 =?utf-8?B?MjAxaUJscEpNSlVzVXBGb1VrMXQ3NFpMdlNjbENlZ3NwYkMwa2w5REo4SldH?=
 =?utf-8?B?K2JvNVNJbHlHQnRXcHhGYnpFZFJsR05JV2Y5Q09tSmtRZWhUVHdMd3dZcUhX?=
 =?utf-8?B?R3JOdWhydU5WUzJnRU9tcFVUcjA1WnFpVDNpRHplRVJzK3VjdlpMYzlDWE8z?=
 =?utf-8?B?QW81UmgyQ3NMU2NXaDJkVWNhT0h6RjNEUHhrTE1nOUowVXh6UXFmcmdlSjFU?=
 =?utf-8?B?TmNVL29EYWZ0TW5TRm1FWHRnWW1WU3lET0VoWFhKTlhERXhzMjJrbGJpUUdO?=
 =?utf-8?B?VVh4VlJlK0Y1eHV4blRKd2hqNDRYdWh1MTlRa056OXoyRGdiaXN4SStHVmtw?=
 =?utf-8?B?YklmdGZyMlBEQ2MyMHloNkhjdTZCWTJOTlU1SU1ISWVxTDlsdVJEU3ZzL1BX?=
 =?utf-8?B?RTNseU5PeGFqVWdIb2hIZGJTSk80U0picU9BLzN2elJBVTZGOVRXTDQ5UERU?=
 =?utf-8?B?TDBSM0x5Smx4RW1aSU5MVzltOHJaSmdyUWJEWU5DNDdhR21jYVJuYnpzK24x?=
 =?utf-8?B?ZzQ4bHZhNGNrTjF6UUVzTkZCRlU2NEI1L2ZpQlZFT0NORGZaOFRkd25jbzFt?=
 =?utf-8?B?dmtSSGhySVk3bEhKa29CM0drbzUrZDVFeWRmbmdZV1kxcE82QTlNM1ZqbGRO?=
 =?utf-8?B?ZEZVbnBCbGRpYWVOdnBlT3BFNklreDNzUnZlaXVSQWRkbE9nWkp4a05ISVU1?=
 =?utf-8?B?K2JLYlBVWXNxaDBOS2hlVHpGT21OOUxGWUtldHU0SXpuMndxNWdIcDc2OUFy?=
 =?utf-8?B?TXpuSkZHc2NJR1FpSlp4YVFhOEYzNEhUT0g5VzgreGkyTzM2SGJkbEhEVDhV?=
 =?utf-8?Q?TPmNHsKiwWUShBc6SsmH8Xn+I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c2f556-e352-45ec-3888-08dc296ed93f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 12:58:45.1102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VZ3xXg++a+cSbubgt4oMmUATFBFqz+HJUI7Ovy4doSjWMwjQKx9X7/C28Ytei8iFVZwZFlDtZxlYsENIM6Aug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5803
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



On 2/8/2024 7:47 PM, Matthew Auld wrote:
> On 08/02/2024 13:47, Arunpravin Paneer Selvam wrote:
>> Hi Matthew,
>>
>> On 2/8/2024 7:00 PM, Matthew Auld wrote:
>>> On 07/02/2024 17:44, Arunpravin Paneer Selvam wrote:
>>>> Few users have observed display corruption when they boot
>>>> the machine to KDE Plasma or playing games. We have root
>>>> caused the problem that whenever alloc_range() couldn't
>>>> find the required memory blocks the function was returning
>>>> SUCCESS in some of the corner cases.
>>>
>>> Can you please give an example here?
>>>
>> In the try hard contiguous allocation, for example the requested 
>> memory is 1024 pages,
>> it might go and pick the highest and last block (of size 512 pages) 
>> in the freelist where
>> there are no more space exist in the total address range. In this 
>> kind of corner case,
>> alloc_range was returning success though the allocated size is less 
>> than the requested size.
>> Hence in try_hard_contiguous_allocation, we will not proceed to the 
>> LHS allocation and
>> we return only with the RHS allocation having only the 512 pages of 
>> allocation. This
>> leads to display corruption in many use cases (I think mainly when 
>> requested for contiguous huge buffer)
>> mainly on APU platforms.
>
> Ok, I guess other thing is doing:
>
> lhs_offset = drm_buddy_block_offset(block) - lhs_size;
>
> I presume it's possible for block_offset < lhs_size here, which might 
> be funny?
yes, seems it is possible, I will modify the lhs_offset calculation and 
send the patch for review.

Thanks,
Arun.
>
>>
>> Thanks,
>> Arun.
>>>>
>>>> The right approach would be if the total allocated size
>>>> is less than the required size, the function should
>>>> return -ENOSPC.
>>>>
>>>> Gitlab ticket link - 
>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/3097
>>>> Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory 
>>>> allocation")
>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>> Tested-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_buddy.c | 6 ++++++
>>>>   1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index f57e6d74fb0e..c1a99bf4dffd 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -539,6 +539,12 @@ static int __alloc_range(struct drm_buddy *mm,
>>>>       } while (1);
>>>>         list_splice_tail(&allocated, blocks);
>>>> +
>>>> +    if (total_allocated < size) {
>>>> +        err = -ENOSPC;
>>>> +        goto err_free;
>>>> +    }
>>>> +
>>>>       return 0;
>>>>     err_undo:
>>

