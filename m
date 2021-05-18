Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFB1387CA9
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 17:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A176EC01;
	Tue, 18 May 2021 15:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C3D6EC01;
 Tue, 18 May 2021 15:42:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYsznwhLczS91pUL55SUx4zVKYTGwdQMd87qJC+G82X8uJarndirpQU09nN0oJMimKngOPp3bkXHP03VshpBII5Lao7spWbuV6nQpfDK0JGfjap/GFVaYanuxeJxESc4SNvOXzjTJiBIr9hS3Le2sbVGca/A5X4qFJ4rk/3lP7vAM19BuUHgqNUrRtCXN/zTaJ/phUJDQkW0GUy39u6p7T5+pFKJwR8w8bxLjijq+7+u6irQUaMdiYaS48Xf71ZNScpz8OasI7zwhHHvz+m2njJLGroXx5lS43nwIOewRqfiSgEsSRjnb4N05tocsOXndWgiXWqFLiXsWqkZ+QYqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOq4J4ctH4KnKebGg8Z5MRVXM4uCdTibgaItZopPFhg=;
 b=IlS1gHGV2OT97C7/dFGmfDck2/D3vHstaYGtEaB/8EMjtHUdXfMt/oqLoETzUBtYxF3CXRP1ubnsAr2KXEprQBS7DkmPcdfreKYJW8xXwO5r4cZLaJ4V9R4VXa1H7Tj+hpAc1w6STm6KU10KywwhlA3XIn/S2p+Rg/F/OMmw7gVWjf7JT4AtKCKWkE0Vx5MLJp+yM6c+YE5sMvilMSIEW8p8amzuywe5XXdguXaZYE08sUt9/eCuiYqsNAE7+0slYjdY0uygYRSrHdiubDcb3JzLOX9xigEleFWvngMNmptOEnj26e5uqcaiL68A3o5zy6fb1I2mUoRR/mVp1CJIow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOq4J4ctH4KnKebGg8Z5MRVXM4uCdTibgaItZopPFhg=;
 b=ESOmiI4nK58C00JCFkCIyyYHQCgYAYaBEV6umx8Y2tR9JH6U671siSoXKn9/MWmD0R9+dqp47Nupv+MdshQ9kEKzYnGBbRviPmwYG2svJR5DC0gO+3Wt+h6dMQH10NsavyCf//eEGP22W2oSNt7I/x4qw2Nr/dsvrFrAXD4gItM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 15:42:28 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 15:42:28 +0000
Subject: Re: [PATCH v2 09/15] drm/ttm, drm/amdgpu: Allow the driver some
 control over swapping
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-10-thomas.hellstrom@linux.intel.com>
 <c4cd4843-c3aa-1f01-fc73-bc9144fa478f@linux.intel.com>
 <60276369-dbfd-e0dc-548b-a9419ff4c7eb@amd.com>
 <471d8fd5-379f-e95a-4973-c50fadace7cb@linux.intel.com>
 <b909db91-5c61-4af5-135d-aa62d5e4b481@amd.com>
 <f5c008cb-5047-7cbf-0361-e4e58e38d6e0@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fb9a4898-5844-c1e5-7a24-cb50a9ad6df7@amd.com>
Date: Tue, 18 May 2021 17:42:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <f5c008cb-5047-7cbf-0361-e4e58e38d6e0@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3b27:1830:9671:4cc9]
X-ClientProxiedBy: PR0P264CA0175.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3b27:1830:9671:4cc9]
 (2a02:908:1252:fb60:3b27:1830:9671:4cc9) by
 PR0P264CA0175.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 15:42:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a447d5e-1c86-4452-5b30-08d91a138a8f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4390FDFC0E43008CE9DD0D09832C9@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: osb2/6Yj6onJy4/R2pmUomWznIj2rn4ADUCTzoG0E5pJvTuW75BiF0ab7ujDJn5v2Q5zRbRIUAGHZSbNT9AUEpaGNEtranPpoRrXQpGKfJThStp+1QUqIbjO/xKVCs31mziJPUBUPY1HuwUThtUtduQirZE1VEB3UcMM07My1uvz765gwhNVBkI5nT74mRRZE9jokS3q/oCY0atTHPTqiT0yDGdfi0llKV1knpZe+/LftJPhwNs6lTQA6KUx6oIC4D4S+akHAiV9M14iKaWZsiec62Frsa1ta4+vVKFGfh3jD1ZgWHKejCmmTQO9kAEFAvNsqVTcYDIKeJtqgXEqq9+uQ2wNtMJ4E9Jf6aae9Vof7TLfhA8HW7E1Of25cy+dP7DMu2lqxXoLEG21toq+3MioaLR8sCzb9jqo7mV9RTAr663uiRa5KjBBDjmOaXEmb98e2jfW27Qu4Wxzr46p9kwIkh5bG3UAdECQONdhLx0wlT2Sus8PvgIbbC103brB/lnLU5cMzQEeeSFrVSjU9136seJ4EPAnHlLvovc3CradgGEZbDzaLvYrQM9PX2PplHNVhg3nV7S6aAsXTIaudmw1HAQrLK/6iPP3rSKI9F3UQrgIFaUF7mRjdy1+vBeUK+3HSKJ5FVppSyxYSCigColaugmyF1mXvJiPlLVWptsA3DyHFrCvqZT1zutuRfdY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(66574015)(186003)(52116002)(5660300002)(6486002)(36756003)(31686004)(38100700002)(66946007)(66476007)(2906002)(53546011)(6666004)(83380400001)(86362001)(8936002)(2616005)(316002)(66556008)(8676002)(31696002)(16526019)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MGdrNDE0UGFhblM2Ry9xcnhGZWhzZXpOK0hFOGx5aWNvMTdlalloZzR6cXdw?=
 =?utf-8?B?blNhVmRhVzdXeEExOVZQR1ZxbGdaUVhWNGpRUjNqWTBvRWV4NVVkRkZUeVAz?=
 =?utf-8?B?ZW52NEdhTmprS1UyRmVjcG40a0tBWGRFc3BWWDcyZkdpbVpTNW5NMitreTVh?=
 =?utf-8?B?UnJtOE0yYmlJTjNyUXNVUmVuSkNZYnlYZ1lKZ1hRZ3dDTmNadDVWNFh6OWdZ?=
 =?utf-8?B?ZFArVjdNZWxaTWZsR2tCWHdjNXBuUmVPUFU2TExEODYyTTJ1T3gxM1dkMW9m?=
 =?utf-8?B?L2xhSUJpd3NzODJSRkNTOFF1c29EbmRJaXM2RklaR0JCWDU1YWVPZXFzU2I5?=
 =?utf-8?B?K2F5MkN2T2N3RU1LTzVLWHB5UWdBbFhZR1k3cTZoR2pTWFR2STcrYUlmS0hu?=
 =?utf-8?B?dkkxVndxUGhEWHhjMWZham9xeXFzd0JTZHZ6RzVVRW5oODlBOS9nRFU2bFgw?=
 =?utf-8?B?M3BSZk9scFM1ZlVqRmIvN1BSSW5yYXo1NWl5UitFeUgwbkpEQTJHVUNFOURE?=
 =?utf-8?B?NzBmS0QvWWJRL0dwVkZ4THdDS1loTklKTWI2dERmRXN5azBpaVEyZ2ZPaGV1?=
 =?utf-8?B?TW5yMkhYOGJGL21xTSthYm91TGtqVVR1Vy81V1VRMkVVN3FoOW9mSEJJRTZm?=
 =?utf-8?B?a0VwUTQ2Q0RQV3RLWmhDaTdhdjdjVzJXOVRabE5NcGs1aEJzbzZVcTJpZnRq?=
 =?utf-8?B?Njk3TXkxUzRaNFJMcGRTdHVydGJwL1RSTG4rczl6VHNqanBSNjlOZXBlQW1G?=
 =?utf-8?B?aDZzak9yWkxoVmg0emlGcnpEQ3VZTEI4RW43WEsvSW5GNnlVcDk4VDU1bS9i?=
 =?utf-8?B?ZzJNT216RHhNRHdRUk1Bb3VPakRIaytkVkJ3d01HUjhqYWIxTjVzMmZkQ1hv?=
 =?utf-8?B?Vzdzc0I2MlVEYVNnamlMQ3VPM3JKb25FMHB6RnR0MXUzbW5NTXdBRk5QYU1S?=
 =?utf-8?B?djRXU0FuQjJpWGxyaDVFaWJnZmpMMkN5SkFkeFlLWWM2UXFLWGhoUHVPWUMy?=
 =?utf-8?B?V3V4ZmNjR2dzMEN2c0ZFcUU1OFhwVTBwS2ROZ1ROL05ZNlRkamJLQytrM05a?=
 =?utf-8?B?ZW8xYTUyQzF0UnV3T0E3WERKU3ExREIyOEFuN2NsMXZrVXVuRUgzZXoyU1dl?=
 =?utf-8?B?dXFGY3htZk1KVEdvamk0a1NTUk5sOWVnTy9XV1lOOE1lKzFBSGwxcDBsUWNi?=
 =?utf-8?B?eDd1THZjRzVvZ01UN2VXRm96WjdQU0JRT1lYK2lzYVFHSE91emJZUlppMU8r?=
 =?utf-8?B?QkxidFU3TnNTSVl0elRRbmhwNTNub3dYZ0IzbFg2M3d3WTNjRXVQZTV3ekdn?=
 =?utf-8?B?VHR4S1k1K3FYWkNMTHpIVi9IdTlLTm02QzZISWxqVHZ5VTRPSnRsbExsQ3Fy?=
 =?utf-8?B?cTZuZEdTZTNybVVaRG9OazFiMFl1a3dkbHlvT3I5bkIzYVc0Z3lHRExJemRw?=
 =?utf-8?B?aEFIMkZicncvSFY5Vkp4U25WQ2ZISVZKZWRqMjRLa2hWMHB1eXRVMkVyQXBL?=
 =?utf-8?B?MitNYy94RlhKL0JjaitEN09lWFFudUtmUUR4OEZwbk5GM0VUcFNuQmhuOExO?=
 =?utf-8?B?UmpDa1RXMm8vZ3BxVEl3NDRLQmFNUjhuN1hlWFhhZmFYcFEwOWtFcmtndm54?=
 =?utf-8?B?c3pKME0xSnE1NEpwZmJoMDB2dnNWR29kZUtjWXVTd3U2V1IvalhZTTZxeXRI?=
 =?utf-8?B?TGV5RFZkb051VXNNYkU5T3hlNFNBU1paVHJJZ2VPblhLc1N4eWhPaEtrMjNa?=
 =?utf-8?B?alBBWTIwYmVhZmtnekJIbUQ0WnhQeWZrcGdIS2E0b3FWNkFGOWdYOHdWUlVN?=
 =?utf-8?B?NGJDU3hWRHNxMXFTdEJhWnM4bnFjNWxNQlAveGZGaDZPMDdHTFdLcGpNSFY5?=
 =?utf-8?Q?78UvFF01txeZs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a447d5e-1c86-4452-5b30-08d91a138a8f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 15:42:28.2246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvuHFPa3YuauuXAJDSn79rIQi2XC9rv1MqC0F1XEQaBw0ebdvS5RsJ/58it6n5wG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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

Am 18.05.21 um 17:38 schrieb Thomas Hellström:
>
> On 5/18/21 5:28 PM, Christian König wrote:
>> Am 18.05.21 um 17:20 schrieb Thomas Hellström:
>>>
>>> On 5/18/21 5:18 PM, Christian König wrote:
>>>>
>>>>
>>>> Am 18.05.21 um 17:15 schrieb Thomas Hellström:
>>>>>
>>>>> On 5/18/21 10:26 AM, Thomas Hellström wrote:
>>>>>> We are calling the eviction_valuable driver callback at eviction 
>>>>>> time to
>>>>>> determine whether we actually can evict a buffer object.
>>>>>> The upcoming i915 TTM backend needs the same functionality for 
>>>>>> swapout,
>>>>>> and that might actually be beneficial to other drivers as well.
>>>>>>
>>>>>> Add an eviction_valuable call also in the swapout path. Try to 
>>>>>> keep the
>>>>>> current behaviour for all drivers by returning true if the buffer 
>>>>>> object
>>>>>> is already in the TTM_PL_SYSTEM placement. We change behaviour 
>>>>>> for the
>>>>>> case where a buffer object is in a TT backed placement when 
>>>>>> swapped out,
>>>>>> in which case the drivers normal eviction_valuable path is run.
>>>>>>
>>>>>> Finally export ttm_tt_unpopulate() and don't swap out bos
>>>>>> that are not populated. This allows a driver to purge a bo at
>>>>>> swapout time if its content is no longer valuable rather than to
>>>>>> have TTM swap the contents out.
>>>>>>
>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>
>>>>> Christian,
>>>>>
>>>>> Here we have a ttm_tt_unpopulate() export as well at the end. I 
>>>>> figure you will push back on that one. What we really need is a 
>>>>> functionality to just drop the bo contents and end up in system 
>>>>> memory unpopulated. Should I perhaps add a utility function to do 
>>>>> that instead? like ttm_bo_purge()?
>>>>
>>>> We already have that. Just call ttm_bo_validate() without any place 
>>>> to put the buffer.
>>>>
>>>> See how ttm_bo_pipeline_gutting() is used.
>>>>
>>>> Christian.
>>>
>>> OK, so is that reentrant from the move() or swap_notify() callback.
>>
>> That sounds like a design bug to me since you should never need to do 
>> this.
>>
>> When you want to destroy the backing store of a buffer during 
>> eviction you should just do this by returning an empty placement from 
>> the evict_flags callback.
>
> So this is for the functionality where the user has indicated that the 
> contents is no longer of value, but the buffer itself
> is cached until evicted or swapped out for performance reasons. So the 
> above would work for eviction, but what about swapout. Could we add 
> some similar functionality there?

Amdgpu has the same functionality and you don't need to handle swap at all.

Just return from the evict_flags that you want to drop the backing store 
as soon as the BO leaves the GTT domain.

Christian.

>
> /Thomas
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> /Thomas
>>>
>>>
>>>
>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Thomas
>>>>>
>>>>>
>>>>
>>

