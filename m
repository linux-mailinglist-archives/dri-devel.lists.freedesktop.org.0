Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E7069F77E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 16:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C37F10E9F8;
	Wed, 22 Feb 2023 15:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3966F10E9ED;
 Wed, 22 Feb 2023 15:14:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WikdilMnbFC0i+1veefBKThOn0M4vaArzgvgT0r/mEawI2ydYVTzM1cxg97yBk+h46QrHdYZ73RBZfuNuuCfQTvetNyf6SUZe93FxSCHG/IdBWYzeVJScAaxgiT5REzPnB41wS0bLOSAOIN1n6rgcMR2Ry4X5+cVTvNo2fQ86kr/it+6kZib75bGEPhpImlUnnZAm6lOy26in4JzNb9cNo7Zuoq5JhdRm4ziaiLHOmOn49CIxTg8K4KcGQyeCFWTq1BWfJC4ALt68OK9BqnJV6w9sQ+XqkIqOk442EQvyqMkcbIo3N28Ju+jhxjn3a82TRxxVEsMUEWK/AxaeG4lOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jvapx6aY8UVoU2bouqBbKh0o9CmfLYVTQ/xgjDEQzjo=;
 b=D7rATxpPa4pkeVFd16Yg8ooBD68lP7fWBjjI9JDzmWbxwWdjVY0pZlu01PwiFrv1fhAH9YwuViuaSUmEc+OZwh0Ii1EIiPIwfRWX4EkUsNNjo7OhCyXYzodCFeAgrx/oY8kLs009GZDo+DRNT9g863fQb+WHVHiMIP/2gG5FzpcbEQ1MmwGmMGVMa2w7OV/w+uNyagCLdTxksaCaqrJeTmDWtoIjpP3urbodjbXDhbUh8hBVDhmNspO/zWsi6KuTzZcjc6dvBlxIY+HwxyrBT8vWVxolV5RnD4LGfjpe+vWtV629VwGRiB0deauLM9YTKtdKzYOnWa9uReoNhImi3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jvapx6aY8UVoU2bouqBbKh0o9CmfLYVTQ/xgjDEQzjo=;
 b=22Jn9KuV7R8ebNcmDfTpSM55XxmCDc2xJo1nhiqeG+OLEw4h1zO2Cuev9L+8ETX5gosxJlgTOoKBW0XnVz8yPM4I0+4Qtypb9ndMtaubPaPmfrkTH4HOUfwm2MIuUp/T9xTYTch2QlPeOSGBSYzocRG3iiBY5Aq8HnPyv6WltfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5234.namprd12.prod.outlook.com (2603:10b6:610:d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 15:14:32 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 15:14:31 +0000
Message-ID: <29ea3705-5634-c204-c1da-d356b6dfbafc@amd.com>
Date: Wed, 22 Feb 2023 16:14:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <70ba382f-1559-289a-4922-ca9c371aaf59@amd.com>
 <cc8eeaf4-31e7-98e4-a712-012fc604e985@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <cc8eeaf4-31e7-98e4-a712-012fc604e985@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5234:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4f2792-b799-4fa6-f3c0-08db14e77fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /PDRqFgsSaOP77DaCNTPuforgsZt+IcXNoTeNr5JxDsb48bT9nEAy4MYeLm42PFGxqC3gHJKgTWWIK+HY2C+2XrgUwdozEP+YbDE8/Uku+KQAShfjKfaln102sIO82JQAwKRRbpcOtcPQzxI+naVDVmXP0VdGJC5NYFrPnHRFZlch3DkaGsdfvfzmlJ73xfWHVUmazduAsCXeXzVpMIUnlpu9XJAufc7YkRVzg86/yTtg2xTbgADOYcsCyyeXxz1uflFv4uVpSTG+hCxirGyb7Hzur17j6+ig3gDJO1TTFLv4zqjWet9CcOrKUAaA2a6ZpbPpruVObj5QyII2/xNY2HrtsF2aE/oynyiJ0rBqrKtWYKSHW9NOnvYrsUalFrvHqaVTHhFM7c0g9hrtopYlc/eU6IcB0qQe+NUMQ8HDrOqAIyimkkZAPFKjOM6nUw8jfatgFZkKbUy4559c7Lg7R4AAnb3lgWQTsCfbPo3IECrI3ua9DBtBMr6F3NPjjfGzyFnJf+Z8mPNYHTrMXUsxjvHaMj+CSXz+S3uYBCDY3D4wPbqqlRDp41BeklkM8rUgvzWOZVydQ73tZxZJE2p2Splfgj/784heUnp4kiKB1znT+dyzM0tvYG1QwXLaDC/b1JBpzl/FvEhYcDdA83Z/36wKB3jmjnSXX4e25gqi00k/htvGDsTOAUCvepx6B9KyjdtPqCtQG9FGQVj2Eij8iSbPEVqVTA8j/wsD0nSXAU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199018)(31696002)(86362001)(36756003)(6512007)(66476007)(66946007)(53546011)(6916009)(4326008)(8936002)(66556008)(186003)(41300700001)(2616005)(316002)(38100700002)(6666004)(6506007)(6486002)(478600001)(2906002)(8676002)(66574015)(83380400001)(7416002)(5660300002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU12bjNBT3V1aVdQS3pnblR0RkJDMFIxd2F4T3o1dElTUjJTcjREcHRFN2or?=
 =?utf-8?B?UWtRVUlXdXNWM1MwRXlSSWV0NXlNeU9jM3RjOXlTYlZrMjlHNWMvRlNxZURx?=
 =?utf-8?B?WWdET0w2cHNjdTBvU2dFMlBHTGt3NkcrZlh6QXZUYVBBalgyK2VCUlJhOUlE?=
 =?utf-8?B?bmZTUWdrVVFDSlNJSUlHb0lFNG1qOWxhNUhvL0hhZENaUTY4RTVHNHVjRnJ5?=
 =?utf-8?B?cUVVUVB0RnFpaFFFbkdFMVl4Z253dER4dkFMWGRTM2c1SU5OWGxTbXE0ejI3?=
 =?utf-8?B?WXl4Um96d25GRFdDK29JR2c3bjRyWUlaN3NuMUtvZ2drOGVzcVdsSjZVQkpO?=
 =?utf-8?B?UUJJMjg5ZVFUbWRDNG1PK3U5dVpTOC92UGJvaTgvY01oL3pDMG01RHJraTRm?=
 =?utf-8?B?d1NrYy8yMkxRa2xSeFgrMnNyM2RJWmlveVpwbkIyMkxqR21BdWNBdGtPdWxV?=
 =?utf-8?B?K2ZBYk41WDA3VjkyZGY3QW90OGUyb2VsTUNCLzVTc3Bua2dVeFZ4VW5CcmFJ?=
 =?utf-8?B?R3lGM28rQU5BdDFid2psMkZwbW9haFFKc0VTZis4Q2ZscmRDRXIzMzE2Q0hH?=
 =?utf-8?B?dUNXL3JyM0Q1SG1sZkpUbEgvK0hzdHF5S0tpWTNjRTE4bWFnOFNVbEtaREE0?=
 =?utf-8?B?SEs4V0xUTjBBb2EwaUQzOG1LUXhTbkFpM1ptMDdNUllHZWVHdlVOWXNLa0Fj?=
 =?utf-8?B?Wkd5OEY1N0JjdVZDRis3UGpiTENHbjFEN3dlQUp3b2FSUGN5aVZZdCtPL0hu?=
 =?utf-8?B?bm45UGhkS1YvRXArZFh6eEw4RENGOFQzK2p4MXJ2RDMxZEg3amFCNDkwNWZ5?=
 =?utf-8?B?eGN1UWpRR084dmx4WU94U1ppblo3bVpZVmRDUHJHUURWcHgyUVZjMFk2Zkpz?=
 =?utf-8?B?VVpUKzZScGpwQVE0K242K0I4VzJ5dnBQV3VvVG1ubFdSc2IxQmw4RVJPVU1m?=
 =?utf-8?B?c2xBQ2lSelZOVVMxM0RHd001MGlRaWd1cFVtRStLcVRCb2VLVHBNbWVNQUM0?=
 =?utf-8?B?TFd5OVdzMUVVUmQvZ1J6a2JQVDg3MVJDRHAyaVR6Ymd6ZE9iTnZUb2EwRkhO?=
 =?utf-8?B?dlQvd2hpdTRTR3RReko3N0RmTWRCZE9tTnBMdDVYNWhVVzNBVDQ5OGtad200?=
 =?utf-8?B?M2Z4VEdhV1hpZWNBa2JoeWVyWS9SMnZFSjdMS1VrSFNUdC9XUms1aFZYRDRT?=
 =?utf-8?B?eUllOERhWHpUbjFsb2l3SlRrSmdGMDNzMFZoN0szSzEzYTZ1Q0lWMHd6azZ0?=
 =?utf-8?B?M1VlK3ZFR2NGSDk0OTYwbXM5SnhDd2IrWTV0R3d0TGpXaGxydDhuZk9UNWZu?=
 =?utf-8?B?djBGSkJkQlZpUmJZa2loWHJlMkh1UnZLOE1oa3RYMEI4bUFEWXQ2bXVXbGtm?=
 =?utf-8?B?OU44UUZhNFk4VzU3YjFFaldpMDZLYXIyblQxejg1clJTaXd4cTQ5RW1NS3R0?=
 =?utf-8?B?MjJ5Uld0R0grdG9udWhYODNkR2JpWkFHMFZxZnArSXlPM3lWZWlCdDAvc2tV?=
 =?utf-8?B?MUNRQlRueXRuTVVGby9aY0tIY3UyZU5WdEhLcE5VT29LM1FxYUEzQkxaczcv?=
 =?utf-8?B?bjAwSzFCUlRieVFzc2RyOXFpY2o0TDNPVHNVSGQvR29zdS9sdnJtR1JtR0gy?=
 =?utf-8?B?MkZqM29DQ2F2Nmh5VjNvS2ZnT0JQSVAzZzZSeUh3S2RDb1E0OXVURHk2MWpZ?=
 =?utf-8?B?NkVWdGFCa1JOVSt5MVpLa01jWHBGRzA3dnZPUE9ocm5pL3lGUlpIbjlsQnln?=
 =?utf-8?B?UzNPTHo4N0o3L0R1SW5QWEkwMGdNZlVMeHFGaTlQa0I2dGxiMVZBVlhtT3N1?=
 =?utf-8?B?ajRteC9tV21wK1hndzBOcTF3NjZaMDJRemludURNMHoxd3pNVEJ5OU8wbEov?=
 =?utf-8?B?QlZTVXhKVWlyS2VBS3Y4aDZMdlpEd3QrZThnajNyS3FZSDgzcWI4OXg1L01u?=
 =?utf-8?B?bjNGYm55T1pBKzk4S1hRK0ludWgrZzNDa2luRndOa1pGSlBTRndoa3N0MVIv?=
 =?utf-8?B?YmVqWDVaMGFBSDQ4NE1CL0tLdnBBa0RGZ0g4dy9vVDM0bFk4K095NDRXMS9s?=
 =?utf-8?B?bXFPTXlET3N0Wnk5aGVTay9GOE4vN2dHSHBETHJHM3RXQy9NVGZPelgyelBU?=
 =?utf-8?B?NllDdjNIMTZjdEErOU9KYkVDSlI5bFhtSUtkSDh0TCtzYnA0emdxbnU0SDh3?=
 =?utf-8?Q?gMQbxXmrtwGLRmKz7P87SEgTr489F7dLMirW2Eqerpmt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4f2792-b799-4fa6-f3c0-08db14e77fa5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 15:14:31.6671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 345VGiA10iftcGENcMj4XLr/sZVpsA815b/MkB9eRSUSnimiHMXwZSw9t3cVLEi4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5234
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.02.23 um 16:07 schrieb Danilo Krummrich:
> On 2/22/23 11:25, Christian König wrote:
>> Am 17.02.23 um 14:44 schrieb Danilo Krummrich:
>
> <snip>
>
>>> +/**
>>> + * DOC: Overview
>>> + *
>>> + * The DRM GPU VA Manager, represented by struct drm_gpuva_manager 
>>> keeps track
>>> + * of a GPU's virtual address (VA) space and manages the 
>>> corresponding virtual
>>> + * mappings represented by &drm_gpuva objects. It also keeps track 
>>> of the
>>> + * mapping's backing &drm_gem_object buffers.
>>> + *
>>> + * &drm_gem_object buffers maintain a list (and a corresponding 
>>> list lock) of
>>> + * &drm_gpuva objects representing all existent GPU VA mappings 
>>> using this
>>> + * &drm_gem_object as backing buffer.
>>> + *
>>> + * If the &DRM_GPUVA_MANAGER_REGIONS feature is enabled, a GPU VA 
>>> mapping can
>>> + * only be created within a previously allocated &drm_gpuva_region, 
>>> which
>>> + * represents a reserved portion of the GPU VA space. GPU VA 
>>> mappings are not
>>> + * allowed to span over a &drm_gpuva_region's boundary.
>>> + *
>>> + * GPU VA regions can also be flagged as sparse, which allows 
>>> drivers to create
>>> + * sparse mappings for a whole GPU VA region in order to support 
>>> Vulkan
>>> + * 'Sparse Resources'.
>>
>> Well since we have now found that there is absolutely no technical 
>> reason for having those regions could we please drop them?
>
> I disagree this was the outcome of our previous discussion.
>
> In nouveau I still need them to track the separate sparse page tables 
> and, as you confirmed previously, Nvidia cards are not the only cards 
> supporting this feature.
>
> The second reason is that with regions we can avoid merging between 
> buffers, which saves some effort. However, I agree that this argument 
> by itself probably doesn't hold too much, since you've pointed out in 
> a previous mail that:
>
> <cite>
> 1) If we merge and decide to only do that inside certain boundaries 
> then those boundaries needs to be provided and checked against. This 
> burns quite some CPU cycles
>
> 2) If we just merge what we can we might have extra page table updates 
> which cost time and could result in undesired side effects.
>
> 3) If we don't merge at all we have additional housekeeping for the 
> mappings and maybe hw restrictions.
> </cite>
>
> However, if a driver uses regions to track its separate sparse page 
> tables anyway it gets 1) for free, which is a nice synergy.
>
> I totally agree that regions aren't for everyone though. Hence, I made 
> them an optional feature and by default regions are disabled. In order 
> to use them drm_gpuva_manager_init() must be called with the 
> DRM_GPUVA_MANAGER_REGIONS feature flag.
>
> I really would not want to open code regions or have two GPUVA manager 
> instances in nouveau to track sparse page tables. That would be really 
> messy, hence I hope we can agree on this to be an optional feature.

I absolutely don't think that this is a good idea then. This separate 
handling of sparse page tables is completely Nouveau specific.

Even when it's optional feature mixing this into the common handling is 
exactly what I pointed out as not properly separating between hardware 
specific and hardware agnostic functionality.

This is exactly the problem we ran into with TTM as well and I've spend 
a massive amount of time to clean that up again.

Regards,
Christian.

>
>>
>> I don't really see a need for them any more.
>>
>> Regards,
>> Christian.
>>
>

