Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D09EB811771
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7C910E2AC;
	Wed, 13 Dec 2023 15:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96AB10E081;
 Wed, 13 Dec 2023 15:39:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArnhRgKWz2sY0ryOqJHUPVr2XnHbjwAoniVazbWWnLFGFWKDQKq4mIvcookEV65PpmMzJPdWIR/qD1yxC6/ZnZ8MFH1/Ae2om7P6NrHftcCX1Ok7hUdiuHNMGNrsBak+Qr1FrY55BTKpSlJVim0WdV22WRjjMw5KgdnsvTSAf97oExYiH0qUmDOx7uD+P/jWHLUjna5rVAxbPQBiq0+XZEEmSU4LGlQkdNTGOfZFuMmaFvxunKwjYAZy9WqUADjZaPZlr2YOAtpih7X+XyKowwNtAWiovYAkOo7asxbnvFbDil4B2vywxPGPEqIaXBPRNOSKREZrOVutAXOs/n/7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0TOecg1Pqx93GUDqFit9e+SCq5NVkdtEPZVptNOQc0=;
 b=mnGIwh3yUtfBx0sAFQCqK/yLA8v9wJ9PYFB8Rh/nPQZJAME43MWaI1p/I491wTKeDcv7vUhbMz+3lYhe3lzGTDrUkYJnPsvtiDBWPIQu9JMnqQd+3vLVhPcK8w5lg9DMGe/lfVWK9vkUhJNBMNVx7Ypr5/0DQtW8mh1inpnlXB+IdChnQf8gNUp5LqrUop/0MoOT+QVvkGeU/gD/rZJLI1jofg5OCahsDSaa+7zGZ0Fy59VWPahRc1KOMH8fSSqTMeJlnZKvCVk4OHWRsEKnxzn9LztS9MHh9k0mqrVRVTOO/PmXlGtCK0o5lNTF4KEIiRLMnQ8qZzsXv1DjILfU8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0TOecg1Pqx93GUDqFit9e+SCq5NVkdtEPZVptNOQc0=;
 b=V9dzgONt4MPafkhsFL7kGDQtD6mhQhtFGD/2ovMTJruDktmj5gB7HlQdLL0NmbybyPr78mViicrOLUhq3AXbexLEedif1cYHecD+BcK81PqhTCE9IMBWP9nPns/rIu3NQYNyMInm0pUVzF43xEkrK2ADuZ3LCluvUEDK4NQkD20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY8PR12MB7585.namprd12.prod.outlook.com (2603:10b6:930:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.36; Wed, 13 Dec
 2023 15:39:46 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 15:39:45 +0000
Message-ID: <8316182c-1b28-49cf-97ef-23c683c1140b@amd.com>
Date: Wed, 13 Dec 2023 10:39:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
 <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
 <d30b7992-5c39-49f5-889c-c31d4994a5c3@amd.com>
 <CADnq5_PdWUDVK0mvMgyTyogMnT-DD2nhXHarO+BLg9BjtGPRGA@mail.gmail.com>
 <473652dd-8ca1-436b-aa52-eb85eb0e98df@gmail.com>
 <381345a6-64bc-4cda-b787-fc431827b289@amd.com>
 <86b95faa-fda4-4354-97bd-a1c15fed0771@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <86b95faa-fda4-4354-97bd-a1c15fed0771@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0078.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY8PR12MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 14377554-d1de-4efb-7499-08dbfbf1bb9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RnJUGWA/8KXMSy9sG8N0cYQK/qO1mhMy8RAC/k++qNsLT1XPYZcmc03diOHLHY4CsSIpXSoO2qloNNNjEAWEKHr6jNG9r60W0dGri5OjQ0hOGcP9gInscgmLwQ70X+3tdsXEAxHqZ4xdaJiPW5bfh5mJ/9QGX2RKLX3DQZQtoj489zxrPddWGdgLBYbtayxzye5dsYxj1IiMG17/FlGkOXtmX9gUoYtfrNmbQluuoL3nXgBv/SMFEsBgKEkoB/7HOAdv6DhMk0QqcBgX25hyc//eYEL8IATmuTZXku6b03/rj5BaUyKs9kjCm+PMPP+g0oAcbwmyP3PNMNrJvLHtPC3NEBCrVW4pJxasU/NfO3K7lzWLHbcwZFGpKs/rJOjU2DRrZKkZdyY6W1Kn0NgHseXXNEUn+uHbEJuX/BPepTRivXQoZs/TP/1y1RECrnPkTQnoML53wznLVeTPCn7BJP6xaa050/iLQsDp5ghs4xAvjh2X+2y04oQOjNlu2UvXPL+kcfUevV6ci7g0X27Gx+xL2EEmuc+UsoOWmF/UDNhI+1payXQ54xoLO0902mtHfv6pkIcUNjdZPt6MrayiTkh+ccFh7otyh736M+z45ZlBvrQvDgoM8MckYXXCCWw8Yg6ZYszS/XGFnFx00Ilp2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(66946007)(66476007)(66556008)(36756003)(86362001)(31696002)(110136005)(2616005)(6512007)(6506007)(6486002)(53546011)(83380400001)(38100700002)(478600001)(4001150100001)(2906002)(316002)(26005)(8936002)(5660300002)(4326008)(44832011)(8676002)(41300700001)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzVWa3lBcGFzTm5KdlV2SHFNMlFCQndtU0hoNEZCT1lhdlJrZVRGYzJrS0hF?=
 =?utf-8?B?bXVhTkZNdyt0b2RYeEVtK2RQejVaTEUwb1BSUmdCTnZheHgzakRTcTNSK29G?=
 =?utf-8?B?clJXQmo3QWQyRWtZaXZjR1A4SUlXWGlVdnFGZjR4SERJVTMyVkdQdStMWGNG?=
 =?utf-8?B?UW1UNCtiOVlLOEVPd3ZGRnNDblZMN1B0elNUWFBGY2xGNzFWSWd0ZFRKaWtt?=
 =?utf-8?B?b1lZU2drUkczdUtlWHMrSjdpM1ZhUDlwODhoVml1VGdWL29HaHVDbHRITUVU?=
 =?utf-8?B?dmM0eDZNenNGSk1GUVhqNm1kQWRtMkxQNElHbGhvL01HeWtzZFNTY3d4c1Ni?=
 =?utf-8?B?a1ZsQ3B5MkhFSStVUk82ak1Ma0ZTSUJJK21MTVF1TDFwbmtyay9RV3VKK1dv?=
 =?utf-8?B?L3I4RG9HM3BCcWZqQURPWFZ2TWUwenhlcGx0ZXhMUFVqaU95YkV6WUwxZFBB?=
 =?utf-8?B?UXFSYkovR1p0ZkVtU1J4M2QvdERuV0ZqV3AxUjVBc2dpZ1dLUTZadlRoNjdp?=
 =?utf-8?B?SzM4RjVscW1tU1RiMm10cklYVW9mUWJNMjMrY1g0REhUNUxEUE03ZlNmZUFR?=
 =?utf-8?B?Szk0YVFIWmFsUHk4NHJuQTJBREp2VU5XZ1FlNnp3Wmd4Z0c2djA1U1RaamtV?=
 =?utf-8?B?SitORzNiYXNIQXR1aTlwaDdRWlh6TWNjV0NtQURqM3BJMmhkajUyR29NZFcz?=
 =?utf-8?B?ZjNWYTdsRTcySTc1VFRIZjV5SDBSVmFnK2RQY2JWekJQbC9oVjZ3SjV6cGc5?=
 =?utf-8?B?WHNmei81V3BTbjZRZzhoa2hvMWZhczBtaVBVR0FNZkhtNDFtM3ZZV2c2ZXIw?=
 =?utf-8?B?ejNPbzh3UUJtMmtqWWNFUmNzQ05JNDJ2blRTSEhPSXo5a2FCUCtlV0IvRXNM?=
 =?utf-8?B?MFRvYVZic0xtYmRkRG1Sb1ZWTi92YnNYVWVGQWluS2ZDb25UVzVZTVh0RU9s?=
 =?utf-8?B?QVpqM2RPQWQwRGxtNDJsRFlBbVZsc0dpZFU0YWZnV3JjYUVleS9mT3JqSUx0?=
 =?utf-8?B?OGlVbXFRb1hZb1IzcWg3UDllVmlmb1BuaHJFcEJFS21YUjRoOFVVQ1RBcUFx?=
 =?utf-8?B?TGZZT3RZMittK2c4RXBEazlxTHRISTJmdzJjZEJhdDM5K2UxQjgrUXNtc3BS?=
 =?utf-8?B?aExFcm9XWEJjWGFVNFIwZE1OWUc5NEV5eThmc2doQSthc3VVZ29sZS9Tbk9Q?=
 =?utf-8?B?UWR6RWMwWm9HNWJldGlNZG15OEVjelJuVkQzb0dYVXc1SG9lMUczNmdSNEQw?=
 =?utf-8?B?NHZCbmN0REpackpVY08rbWxEMnZQQzQvVXNWWmRiR0dUMWY4ZjAzRFpVenE2?=
 =?utf-8?B?ZnhuZmVEMnhEKzNqMVB3VTg5dFVaRU1tN1VCSzcxdkhhb2EvVFI1N0VNcjA3?=
 =?utf-8?B?ZHZRa20rUHloem5OdE9sMmxKZDQweGNXMzYvR1BkYlk0dTkzUm9oNVdZKzZn?=
 =?utf-8?B?Vys4L0JjTE5HL3hiei9oS1lhR2U4b3FwTStWMXBRVzBBQVc1ajBVUlVQRFZ0?=
 =?utf-8?B?MnZiSEJld0lqTEQ0OXpMODFHVzlUblNxNDZZYnFsRmRTQ0NUUnUxOUVUb0dV?=
 =?utf-8?B?WDJZVFV4Ykh3RW14RU1qZXJHOFN6OW01d1B5dEdJU2ZnbU0zVE9uTGVlSUNr?=
 =?utf-8?B?cTh3REdDREQ2RHBJb2tudTFXSDFNNkpFTTc2NkowWmE1VEkrYW93ZlZSaHlU?=
 =?utf-8?B?QWFhSWtjTUY0Vnk1N1lYTmp0TU40czVOcmVzRmRKYUxXWGpTUU5adGxyWjhV?=
 =?utf-8?B?bGdvY29HeHZ4QWF2bERUSXFPdFNkRy83TW9HMFVRWGNsQmFiN212YnlNc3Ax?=
 =?utf-8?B?YjNoc2xld2dhR1JqdGtHTExIT3J1Uzc3RjR5Y0thU0VqQVdpelp1WnUrVWxO?=
 =?utf-8?B?UHE4ZTZ4azlmZW1Db0lzRG8yS1IxWTQ3T1NTcWV6bmhPYm03bjNWVTc1Qzlw?=
 =?utf-8?B?OWhhbFZGc3IzakpxMG5wbkZ6WGlPcWI3Q2piUW5oblMvdmNHUWNKNkFpdWd6?=
 =?utf-8?B?ZnMrRlkwVTFzcWwrWGg4UUpMdjc3ajQ4WlhPSEx6OGhuQnA1Y2lpYkJLMkpk?=
 =?utf-8?B?QVdXT1IzaFdMZ3A3RUhRbjQ0bVpkWStFZlozUUoraUh4RHhOVndDWUFYSXho?=
 =?utf-8?Q?lYB7x1HbhBVjS5nHY6NEYssYe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14377554-d1de-4efb-7499-08dbfbf1bb9b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 15:39:45.7712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EO6/llPc2l4NG/8ujsS7hxIazwtFsHV8aqJe8t+hOreUG1TiX03SGQzp3bBMun/4+eo6O5KICdX9wXmqXTtzGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7585
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-12-13 9:20, Christian König wrote:
> Am 12.12.23 um 00:32 schrieb Felix Kuehling:
>>
>> On 2023-12-11 04:50, Christian König wrote:
>>> Am 08.12.23 um 20:53 schrieb Alex Deucher:
>>>> [SNIP]
>>>>> You also need a functionality which resets all cleared blocks to
>>>>> uncleared after suspend/resume.
>>>>>
>>>>> No idea how to do this, maybe Alex knows of hand.
>>>> Since the buffers are cleared on creation, is there actually 
>>>> anything to do?
>>>
>>> Well exactly that's the problem, the buffers are no longer always 
>>> cleared on creation with this patch.
>>>
>>> Instead we clear on free, track which areas are cleared and clear 
>>> only the ones which aren't cleared yet on creation.
>>
>> The code I added for clearing-on-free a long time ago, does not clear 
>> to 0, but to a non-0 poison value. That was meant to make it easier 
>> to catch applications incorrectly relying on 0-initialized memory. Is 
>> that being changed? I didn't see it in this patch series.
>
> Yeah, Arun stumbled over that as well. Any objections that we fill 
> with zeros instead or is that poison value something necessary for 
> debugging?

I don't think it's strictly necessary. But it may encourage sloppy user 
mode programming to rely on 0-initialized memory that ends up breaking 
in corner cases or on older kernels.

That said, I see that this patch series adds clearing of memory in the 
VRAM manager, but it doesn't remove the clearing for 
AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE in amdgpu_bo_release_notify and 
amdgpu_move_blit. This will lead to duplicate work.

I'm also not sure how the clearing added in this patch series will 
affect free-latency observed in user mode. Will this be synchronous and 
cause the user mode thread to stall while the memory is being cleared?

Regards,
   Felix


>
> Regards,
> Christian.
>
>>
>> Regards,
>>   Felix
>>
>>
>>>
>>> So some cases need special handling. E.g. when the engine is not 
>>> initialized yet or suspend/resume.
>>>
>>> In theory after a suspend/resume cycle the VRAM is cleared to zeros, 
>>> but in practice that's not always true.
>>>
>>> Christian.
>>>
>>>> Alex
>
