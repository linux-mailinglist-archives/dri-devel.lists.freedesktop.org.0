Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B91A476C01
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 09:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D091610E247;
	Thu, 16 Dec 2021 08:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B22A10E22D;
 Thu, 16 Dec 2021 08:33:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnOHyVwZXbjD7Jr4FPrgGtVzxbW5mTaTLQh+bo4ihJ8GkQ7ttcBCG+kFKhVvErXS6kuVDdmqVFjCz23qeP1vkM8gBd1MCd4QkWLnDP/eZTbuyJZ9ikMvL7L4MnjgxuJCqb+gY2a+RRglf2DZB/Lf2bBrKn9403ypStQRjbByvG78lbiX4bXqn2GsTbFsL6RRnDwPJdbRy6GVGtpXW4YblcTwGKUrhZQkiFI7hoBa0rUIzJCLhR8Im/Im3GeC6l4rf2BHx7zQs3OnJ+yEY1bBz44y6FpAD148RvfijfZab4RBTdB6GwMsjbD2mkkIockqpq0PblT1VOP+ZLVg0tgYqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0GQ7izHkZE4k0wsKAWxbZQVTyMkmVS7v8KgFdugD10=;
 b=il9NQ+ygUeYLKzTcakXs2VQ3tlGci39490GL8qTdZv+QljYE2N+EnqERYkZiY7dK5mCz/nX1bAItZatNUMUimfDbXU3d39MZEyxzQIOM5gvuvQ6VFfH7dU6Z4FPN9nDLmnGVHQyeCG47QDPkBfnTWK9CXcDQPy5dfoi0p4KXbbzZSzuK4xGzD2V3ZUHklQGSG++bddtSAEJHgwx7XHcHYg8t4MoJUaX3IeSJZOYN9LIoc5mIVi7yPxNLgtg2ScGDk0FGmep9SlclgGdgzJ3XcAHfOIOZm6LxaR1jnpmOPqXnKyjvAB58FOAsq73C36x6sXqlajVsDWkev9sKZNViEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0GQ7izHkZE4k0wsKAWxbZQVTyMkmVS7v8KgFdugD10=;
 b=GYs2iA3MLDbCMhnBBpkW8uUrDXkCxjimyiJtlba71eoa4fUq7VujhxkC+kEhKHLmEaWfnuhHuKgfVFYROM8Za/A9gse0n+Mz54d8jvh6vsr9aqF+fNf6kgLmh3mhiC5ie5z50sngiPEPwW4Ewjfq6vmD6407fKjzPgCFVZpks2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0077.namprd12.prod.outlook.com
 (2603:10b6:301:55::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 08:33:09 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4778.018; Thu, 16 Dec
 2021 08:33:08 +0000
Subject: Re: [PATCH 6/7] drm/amdgpu: Ensure kunmap is called on error
To: Ira Weiny <ira.weiny@intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
 <20211210232404.4098157-7-ira.weiny@intel.com>
 <5bbd3c48-1388-9469-8b6f-deed64406d7d@amd.com>
 <20211214033725.GR3538886@iweiny-DESK2.sc.intel.com>
 <c3b173ea-6509-ebbe-b5f9-eeb29f1ce57e@amd.com>
 <20211215210949.GW3538886@iweiny-DESK2.sc.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2a7030f5-d55f-94c7-90ba-5a57235159f6@amd.com>
Date: Thu, 16 Dec 2021 09:32:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211215210949.GW3538886@iweiny-DESK2.sc.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR0701CA0007.eurprd07.prod.outlook.com
 (2603:10a6:203:51::17) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 550f1c5f-b9ee-4f0c-dd84-08d9c06eb036
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0077:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0077EA66DE67AF9A095BEED183779@MWHPR1201MB0077.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Adt4c3+gDcqa+4OMTcZ9eMd7nj6/FrkF7cfhddRrDUYhBVbtQphxXNYzOsUqS3osXWTMpgNuSCuMvcXAYIYuGpLyUYLnJN4MPfOzc9IYxh84p3O/4q/1XcPtsAX1vvZBpHKIGzesKeFQ4q3EOtgg1hSShtLFi7WYde/0opVHcU/vXzTKFFF2QxbJtzIybWinGyvPrdDyTBZWv6MjCzdc/n+ighYYc0JqFuq7MrbKEEoo4OD0oBodhwdMaLSYJGV3Dl8SqQ2j0kJwyjh56/jdFhWQx4TslN96Fbljsc38dEPvGv4RXSpLNBi+vwt/JLCnYmwGQkHsSlP0laAUnSSgC6XWYqlPyqndIgEzSJJVkaSjvRoZeu805ZXq1g0VDMZ8yWepHFqGv9GFwhzu8gBFmQKJZg+n3QT50NTu5uenXYUIiRcsYjUKbs2BxcJzpD4MVTo5vXdGUmb1uHO9KQlbaKc8TDR+ddeNp9LeWZgG0trHvLUKMGR+j6UfO5DRytx2c2VbEo+JICZnw2mZso2V/mB0it5E9Sh0YlreHslABI1Hen3shkrnHM1ZJODyUQLpFIqJBRM5mttBHfvha8Xm4PJaCoE1VjQuVAv+tKyLx49HxYXLcsTRLFOWgqq9IMpdJCw6ickH+PHEvalt7g+9ENpDKjEDwfs03b6cuOAP+uVgAw9dayNhTKgQ1lcZwrU1vs9s0HmsuDfnLw+P9otK3vb10ufUvU+RlJ41AK3YybxjkK7rS5KA4gIF8Le1vydW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(6666004)(36756003)(2906002)(54906003)(186003)(8676002)(5660300002)(7416002)(6512007)(31696002)(38100700002)(66574015)(26005)(316002)(8936002)(6916009)(86362001)(6506007)(83380400001)(6486002)(31686004)(66556008)(66476007)(66946007)(2616005)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTMxVzI3eWRQU1BLMkdkYjJLMTBKK2oyT1JMN2RhbW9GQ0VzVlljb1A1UFJF?=
 =?utf-8?B?ZWZaYUN2VDhLZm5zZ2dNZ3NhMHlqa2gzMVJDeGxyZWt2RlJ5ZXhFeWdEbkdv?=
 =?utf-8?B?UDBITThrQkVkZmpjMXBZMHBFcFVCbG5QU2NmU0dEZytGd0VvYmZ1cWp3c3I2?=
 =?utf-8?B?OGs4a20vNjdiUjF0RTAvQU1KT0JHUHhoeTVnQWp1WFRpSDU4cFVQSGFQYklE?=
 =?utf-8?B?KzVPSHgyUEhHVzNrR3FpWEtlQjFISjd1a1kvMm55SzRtUy8zQXBlendINEU2?=
 =?utf-8?B?R1dyMS96Q0Zta2RHQjVNVUlSM0RzWHd1QnAvakg2a3JOdEthaWZQYitiQ1Zp?=
 =?utf-8?B?UXdnd2tsNW92a1JMRGlaenBiblU2REtpNjA5WURuNTl4dVg3QUF2b0FHRVZ6?=
 =?utf-8?B?TkwvOU5kTUY3K2FTM04rU2czanlOQ1RwQ2dXVHBWNjRwRnIxaUE3VjNjcUgw?=
 =?utf-8?B?VTZKZ1pZZW5xVkhWaUQyaStmdnpNQVZhNzY2cW1yMWJjbFJsSGRMeTNrR2VM?=
 =?utf-8?B?S0MrRTJzNFFXdnpsMHk4elh4alloQ2ZHb243eWpKN0VmSjI4aUhBdVBRdHht?=
 =?utf-8?B?RlVRNENXMUJMZWdjeUZnSkVVY0lNVmw1YUwxLzVZYzZhWW43RUcyZ0pKelVK?=
 =?utf-8?B?K3hrWEdqS1ljYUxMUnU5NDFMRVozdTlmTElJN2VUclNCS0V2VjFwVWJtUXkr?=
 =?utf-8?B?OEczMlZ3WDVXbGJKMHFwVXA1Q1ZzM3VXOGNWS0luNEhCb3EyZzdMUGpodzM2?=
 =?utf-8?B?WUtsSzZucGtVN3NXci9uck8vek1sZ0Y0cTBsWkNycG94aEZieGR4YzdiT09F?=
 =?utf-8?B?cEdncWFrTDFRQ1RnTjB1enVGWTZnbUkxY0xHdnd4TGVJNWkvYmlrZWx0eGZ4?=
 =?utf-8?B?ZnFPV0FlTlU1d1JNV3ZiejJIa1V4clhsalB0UmN6Q2xHek9OdklOcnRVMTY4?=
 =?utf-8?B?azUreGFVZmNkVlJqRVIwYjQyVGNVUmV6UnBSazdJOGFlMVVsa1RwSmhvamNz?=
 =?utf-8?B?SWxUaDNPeTBSYTlqbGZLNUdLek1VZ3VpLzgxQno2cDRzTUJYM212R2J0dmYy?=
 =?utf-8?B?UTg0aW1USHFIbkRRVkNMU3dRQnNQYU91R2ZkR2lpR01sUGl0L0gzNGdrazh3?=
 =?utf-8?B?eTY2VFVOS3FXbWVyNEpGQkRtQm5tclI4MTk2MVdyMElJQ0hJaGFadVZ2Y3F3?=
 =?utf-8?B?dDlha3ZkVTQ3cHZ1aTFqSkRzTk5LTysrNVhIbUR3VVNCYkhPWklMWTcxU1Nv?=
 =?utf-8?B?aFJUYWZCRTkveEh5SWZCenpTZXFJR0hxTStraUFObmUrOWRoYS9mUXhEZ0Ru?=
 =?utf-8?B?YTdoOStQVWNJTWFyWU5RSHhPcEFFMVZFeGpJdzV1NVEvcUI4ZXB4YVA0V2xS?=
 =?utf-8?B?bXJMaFE5WlhkajhFNzFpdjlYczI2MUhuUFFzVUJWL2FwL1ozRkxIemxnY28y?=
 =?utf-8?B?elpraDlxZ0locVkvOGRQUWEwaXlOWnN2VWFNTEI5a0RrVW9UUTRGdHpUaCts?=
 =?utf-8?B?WnpNT05Ic2lWMlphVlFrYWlJb3B6aUpDSG1IdU5pN0hqQUZxTUc4cTVRSDBn?=
 =?utf-8?B?MUE3T211eWtoS0FPWFErcWhzY0RxQ0U1UFh6bytDTDV4RmpSS0VROCt4Ynlo?=
 =?utf-8?B?WVNlUUI5VTNFNzJhSVFwYmdkb3NiRTd5T0ZZNkpSUkNjbXZFajc2ZS9mM3Ju?=
 =?utf-8?B?c2M5eFpiR1orVGh0RWRLMCsyQlRkSlBRazFHdy94REhDNkM4NGVZWGx1R0Zu?=
 =?utf-8?B?QjdUelMvZWpNeDhnYTExYUpPc3I2VjN2ajVET0hveDB2VFp0QWpCa2Fzblgx?=
 =?utf-8?B?cWgybGNFNzFMdStqZDEvWStxTGdMblNyL1hGa1NGeW5pdk92UHRmYjFtVXd4?=
 =?utf-8?B?NDJRZ09jd2FyTk9xUkh1bnc2a2RQSjNBK0FRMkpVTjFwaXN5OTVBbjFzRWta?=
 =?utf-8?B?b2lQbkd0WXNFeTk2dTV5aVJDQk84NHlHZ01JaGxHcHByZmlEckpnMWVGNmR6?=
 =?utf-8?B?N2VpbE9zeW11dVpocWRLdUo0NmZjNVRJM2lFWnowamVFOUpESFEyL1BmOWxm?=
 =?utf-8?B?YmZGSFZwRCtEdCtUMjFjYkVYWGRRWlA1cllOcTJxMnJ6MnFGNnNEWnNPdVVT?=
 =?utf-8?Q?J9So=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550f1c5f-b9ee-4f0c-dd84-08d9c06eb036
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 08:33:08.6396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQys50RsNhj9dk+e4CPDwc7+r1b9jCUVltR6C4Q5E5d60XY139BpWliCzdL14AId
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0077
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.12.21 um 22:09 schrieb Ira Weiny:
> On Tue, Dec 14, 2021 at 08:09:29AM +0100, Christian König wrote:
>> Am 14.12.21 um 04:37 schrieb Ira Weiny:
>>> On Mon, Dec 13, 2021 at 09:37:32PM +0100, Christian König wrote:
>>>> Am 11.12.21 um 00:24 schrieb ira.weiny@intel.com:
>>>>> From: Ira Weiny <ira.weiny@intel.com>
>>>>>
>>>>> The default case leaves the buffer object mapped in error.
>>>>>
>>>>> Add amdgpu_bo_kunmap() to that case to ensure the mapping is cleaned up.
>>>> Mhm, good catch. But why do you want to do this in the first place?
>>> I'm not sure I understand the question.
>>>
>>> Any mapping of memory should be paired with an unmapping when no longer needed.
>>> And this is supported by the call to amdgpu_bo_kunmap() in the other
>>> non-default cases.
>>>
>>> Do you believe the mapping is not needed?
>> No, the unmapping is not needed here. See the function amdgpu_bo_kmap(), it
>> either creates the mapping or return the cached pointer.
> Ah I missed that.  Thanks.
>
>> A call to amdgpu_bo_kunmap() is only done in a few places where we know that
>> the created mapping most likely won't be needed any more. If that's not done
>> the mapping is automatically destroyed when the BO is moved or freed up.
>>
>> I mean good bug fix, but you seem to see this as some kind of prerequisite
>> to some follow up work converting TTM to use kmap_local() which most likely
>> won't work in the first place.
> Sure.  I see now that it is more complicated than I thought but I never thought
> of this as a strict prerequisite.  Just something I found while trying to
> figure out how this works.
>
> How much of a speed up is it to maintain the ttm_bo_map_kmap map type?

Good question. I don't really know.

This used to be pretty important for older drivers since there the 
kernel needs to kmap individual pages and patch them up before sending 
the command stream to the hardware.

It most likely doesn't matter for modern hardware.

> Could this all be done with vmap and just remove the kmap stuff?

Maybe, but I wouldn't bet on it and I don't really want to touch any of 
the old drivers to figure that out.

Christian.

>
> Ira
>
>> Regards,
>> Christian.
>>
>>> Ira
>>>
>>>> Christian.
>>>>
>>>>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
>>>>>
>>>>> ---
>>>>> NOTE: It seems like this function could use a fair bit of refactoring
>>>>> but this is the easiest way to fix the actual bug.
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
>>>>>     1 file changed, 1 insertion(+)
>>>>> nice
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>>>>> index 6f8de11a17f1..b3ffd0f6b35f 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>>>>> @@ -889,6 +889,7 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
>>>>>     		return 0;
>>>>>     	default:
>>>>> +		amdgpu_bo_kunmap(bo);
>>>>>     		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
>>>>>     	}

