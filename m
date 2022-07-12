Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B01571D74
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 16:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E719810E64B;
	Tue, 12 Jul 2022 14:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D29F112E0B;
 Tue, 12 Jul 2022 14:57:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIImg/U3W5bykBVAbFTeF2DOUrs8Caw8tnXPFp032lBJ3ceqgVaSQLyD2d1/G2phvgqCnSYIAxb+JsEQZ6w88ClM/0FkgxK6hNdBfpZIv2jjNL8sSUVrF0ncJOcXavDKBp62FTZO3Pl+d4Y5apeyIbiGnIFQRaiQxrN00Mmye3TKepjOZNPmWSoMlDHbWQrW914ayhyJBhr1kSBbIyozCjHqh4RDDYkuX4Kbvwhrz+QqzAllgFZgxcdLdfr7MWDbDBf/o8v2ezeed55iN54ErF9mdYntK5nZLos88h7a4DmcBxjp957obJWN+3yHHGFlhK6PPOMT+T4xCzwXE0ME8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DE2yDOJgRJLLQpAtWDxDnl6IcpzjEhYDNhAA71NO0EY=;
 b=C0bmg51ufrrV2Z9uiE7TQ+QZck8s2wbItwwcBOWHkQQwlST7qxpTI/e+qtik0dbXra+Q9s2pejKbZTyhxW8RpcDCYpick2MxaVD/HqWR9bDLZW00jZbvRFTEri0xuzpfB8/LrO84D1G9VNyDTxvG0ZY+O+ePoHKKO+45YmUWcieuXQbaeZx1d8AIQYRRb+ccgxWk0ZtPfsmqjEIYh17kTi8UMAwW8LR+6inhzzDcEJqFTHfWnvJYJCdMPD56HvkXXMZhX8sT9vpCvJQy6co2BZZajwESebfAyrpVhakEq7O+39UAjFrGstIBcELn9OjtBfwxhkdAsuG2FnK3V50UDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DE2yDOJgRJLLQpAtWDxDnl6IcpzjEhYDNhAA71NO0EY=;
 b=uQ7fXAb1bHiLW0kGMW+/fDLp0+cSr6+Uxp2SbzJQxmHQ0QOMQEZI4jvMLbiUSIfRZHHLKvUVoGQBou5xLqhIXwaImHPJd1g6hku/soLMgHc0P1Z4JCJBcOf7svOyTjX9xV4+DpndijWkPqLfO5xd4FgCEDSyV1ecSTFUH7sMt8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4165.namprd12.prod.outlook.com (2603:10b6:610:a4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 14:57:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 14:57:55 +0000
Message-ID: <5caa08ba-6211-f2ad-6c78-4201ffbed8a4@amd.com>
Date: Tue, 12 Jul 2022 16:57:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] drm/syncobj: Fix sync syncobj issue
Content-Language: en-US
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 jie1zhan <jesse.zhang@amd.com>, broonie@kernel.org,
 dri-devel-bounces@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220707102953.769684-1-jesse.zhang@amd.com>
 <22a21338-305d-bdf7-0079-df67fb030fc7@amd.com>
 <ea892ffc-4a03-7772-6d99-85a356a3738b@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ea892ffc-4a03-7772-6d99-85a356a3738b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 044e4067-11f7-46f1-ad25-08da6416e6df
X-MS-TrafficTypeDiagnostic: CH2PR12MB4165:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Hw5jBKTZ6RwNkJXDaJG8orY7QaySoscer3T4OCIdwxQhYqOJ/65WjvYRFJZ9NtMdJLDBfPmEe0XDnmH80hM4xE+MGCJEX5W3axNtCZ12/UE9TYlno6Ofcx9XqBJM+oOl1LdyXDBlr5gl4o2mjn0hq9GJANotRfni+OTMdxgUG9/4f9IU81VxU2IP6UtlKCzSw8dmfggS3ohle0VXqhu+rNgvt1D/j851hD4TAzj88ER/cXGRZOYtsYXAVOUl6K6yoapoP0gOa1a0tZjBO790r1uczVmx02Xmk1rkQj24/t+W1QIZILDSvWKSsTHkQ8ZgAp8JcimiXjxNzQjD9HTaex8ai9uaxWRM0DP0ByGUvNt2ukMZ1QKUiKzpJZ45pTjPoSKehcHNBFJtSDv/JEe7+GcnnDl6NP1xYBFpCMXiB0/1IDVBIpJ3q0R1LaKIyUoxoAqje4KdaLFOaQfIzfQ9nfj+5KQ4/91gLMr7VvZjO+NrsQQ2HJCSgNT3t/Q0mbtRbYE5SJD8GG7ouNB6Kf6a2PNYokM1jFLlNj906fLCcdRVOSOpBLySTcRULPK6rEXDnTW2vChjt5kv54mI0/m/5qVGTKip5VlrVJntNA42yd5hoDYOXq2LVlrfT/Zw0aLLGS1SHstmRHc1WJ8v8vykJ+GE5ldQH2UsxQjnz3BAlCmXv8IPr8laVrmtqc3JtyprWZMtQome7nOXefXFqjhqtUQcyVx7UxJmqk8yazxCU8e197c9pkxJVZKx4L/gcO0zn2d94U1Q8wY5p6gI6dL4p86I9cI5MrwBDxMa5LexBvVVvfya7oHfSmYJtgAKi6JOQJJAmRjFvqnKYAhiwSqLEqOBhAfwIJq4EW8EU1QTCnNoKi7VBrePU4hfV0x1IHNA0GJ6vq+MSincqBBRMq5LA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(66946007)(66476007)(66556008)(8676002)(4326008)(186003)(53546011)(6506007)(2616005)(6512007)(6486002)(6666004)(41300700001)(478600001)(316002)(5660300002)(7416002)(8936002)(110136005)(38100700002)(31696002)(86362001)(36756003)(31686004)(54906003)(2906002)(45980500001)(43740500002)(414714003)(473944003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk1WNUxBVVhVYnF6T0QrOHdpSnA5UllFUWd3WjdZbm1ZcEp2alFya0NCZGJz?=
 =?utf-8?B?YUdxaE1EUkRjZkdPSXpUNlpndG5zT2l0d0ZJYklqaFE0bFpHaUo3VGFoK2pn?=
 =?utf-8?B?cXNyVkUveG1YNXpuT1FLRGppcjFvYlJYYlBrZHk0M04xR1JIUHdnRFYxVjZP?=
 =?utf-8?B?T05xb2ZCRUtqdFk3Yk1wVm5RWlFTb2lZUjFpUEI5cnZyQWZmL1hoRHRHK1Iw?=
 =?utf-8?B?b3p3eEFlTTc2TDZ4dy9SNmozcGVtSXpFZzgyNHlPMzhhUzRLejR6bEx1REda?=
 =?utf-8?B?WUo0TzQ0M0h4aHMwTkVjcjhrcGRTeTR1Qm1oSXNWc1YrdVZOSEtscXByOFZq?=
 =?utf-8?B?cWFEV0g2M1haUG5IaE5oWGNZa1hIeXZsM2hSZUJSMk83azNMY3A2ZlJ6RFRD?=
 =?utf-8?B?eEd4OVl0S1J3QStNU2dDek8wT0xISU1yZnlkaCtnd050aHluUHAycmhuUTcy?=
 =?utf-8?B?TTQ1c3dUOUs0emZNczRUaWhpYTExSFBSSGt6bDY4TzJoeFdDRXVKbFNNUUV2?=
 =?utf-8?B?N2NVWTVac0dTV3VkU2p1Qk1WQmZEUThXeVdBTm1UUWY2UklreE1Oa3BTVVFE?=
 =?utf-8?B?QUJFT3pDaHhOcW04WjBhTkgwd0xMNm02TU9tMi9RSC9lUGk3NmFpaGtjd2Ns?=
 =?utf-8?B?SDQvUUlSSWFvOTlmWlpuem5Yc1RoaE9lL2pCRXplVU8wL0hLVElzVDVYQkU0?=
 =?utf-8?B?b0dETjJtRWxtcWZuL3pCWkFsQ0pGMDhFRjRFKzhQekdoMTFLWTBsdlBJbmRv?=
 =?utf-8?B?TjRSeGRLUkI1OU1ERWcyRWdyc1k5bVppeGR3THFGSUJEbmJ4T0J6eStRSGxr?=
 =?utf-8?B?dFRoSCt3QndEMExVRy9DVkpCb2phUi81Qnpvc3BMV3hjUkl6cVJUemNkWEta?=
 =?utf-8?B?OUxNZHRJeDZKZjY5cElVcFdxR2gvdWJqbHNZWE43YVFrdytIYkMvWE9hVzA4?=
 =?utf-8?B?ZFRHY0N4TTI0dzl6cktJTFJUQTA2WW95bko2T1FkdWRaNDBzQmxGUndkWHR0?=
 =?utf-8?B?RmtQamJ0VlQ0ZDhtaUh6eWVqb2RWUW0yNU5xT2pLMjh4c3I5dTlaYkEvWUhC?=
 =?utf-8?B?Nll4NzZyb3pPaFFOK0hadFVyL0lpdGtKc0RzR3B2VTRrOE03WUg5NURwbWtC?=
 =?utf-8?B?L2xMOUdBd2EyZ092VEF6R3dXRXN1U3cwUzFhQk9qTjAzSVFRREZvalJHOVFD?=
 =?utf-8?B?d0pTMXdsU0JQZ1paV0VxVkF2QjdCeDdoQ1J4TzRmVjlCT3E4dHVvVFA0WXBw?=
 =?utf-8?B?cmh0U0QwWWIzTjRGWXZlY3lOV0N2Rm9tZHU5ZlZiVllKRStVbFhuc0NkdlFX?=
 =?utf-8?B?bEdKWTJFNHlVMWo5a2lrNWIrWnNjMGdmVWdFNm5XeG1yeWdLUWc1QjVCZWMr?=
 =?utf-8?B?OU1FT0hPNXFRcU9seTlaZlRJY1BBQi9jaStMRFJlV3pneWxTbGhiNy9pRkdQ?=
 =?utf-8?B?WUJqaUh1UGJNQStGdk54RkpEUXk1MHRXbnN1N0xoblNHM2tLbTVOWTNVcVEv?=
 =?utf-8?B?S2xyZjhBU1pkN3RVVklpZkFMRGhwWU9xcGI2TlNKL0dKL1ZkSm0vNkR6Ukk4?=
 =?utf-8?B?MFNDdmora1JyU2FBRUc4MCtRdGZlVEdoQjhpRXhJMktWS2ZHLzhrTzlrOEdq?=
 =?utf-8?B?MEZSUFVrWEthdXV4d0ViaFkzSGo0MjNOekd5b29ZSS9FM0tTMzlrbXpMdHdv?=
 =?utf-8?B?Y0tUdDdHRU81aDBBay83Ungra011OEVDbVFQZHBDYVRHdTJhZW9naEs4M1p6?=
 =?utf-8?B?dHlESHRsQVJBbzBGN2RJRHF1d3hRTlp1SFg0VHI5Tk1jeVlFdUtqOWtXOFYv?=
 =?utf-8?B?REZ2OFhnR2xYRm9VSlo3K2lwQUh5aCs0UkMxWmhic1JWVlJWeXBKd2IyeVpS?=
 =?utf-8?B?RXRMY0Uxajh4c2NiZFRXcHRzcmtMSXlvWEMyRWJ0T090TWx6WFh5RUhtYTdo?=
 =?utf-8?B?WWtKZmtiNHUwczFYM0w2REMvTW9OQklVUjhxTzdaSW1rWjZSY0dwcFhTdVB4?=
 =?utf-8?B?RVZGMmZEYzJlRTJjbzNrbEZNQ2NKRnJaZXpDVmJQbzM5OFdRNDIzVUpxWVBC?=
 =?utf-8?B?cklQeFQ3em0rYU04dHVsZkUvUGFTYmpGM0xaOXZ1TDNtZWQ4KzFKQytzRC9W?=
 =?utf-8?B?R1ZxV0E1WXc5VFBnSDNuNnoxMjRZSVFnTnhLTUMyZFZ2ekpkTzBuWEJySGxW?=
 =?utf-8?Q?kzksUhjckvNH/W9Qx1Itwd4lpB2bxM84+8eRk5U47OJ3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 044e4067-11f7-46f1-ad25-08da6416e6df
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:57:55.4010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnWVDyc+yrUaCr1Ywt4EXn3N19xR5oParLXAF38w5Hk2plYziQg02io/t9wTq1mE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4165
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
Cc: Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 David Airlie <airlied@linux.ie>, Basavaraj.Hiregoudar@amd.com,
 lucas.demarchi@intel.com, open list <linux-kernel@vger.kernel.org>,
 nirmoy.das@linux.intel.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Vijendar.Mukunda@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yeah, adding dma_fence_enable_sw_signaling() is the right thing to do.

The question is where to add that? Usually right before the fence is 
returned from the object or queried from userspace would probably be the 
right place.

Regards,
Christian.

Am 12.07.22 um 16:22 schrieb Lionel Landwerlin:
> I'll let Lucas comment. I've only looked a little at it.
> From what I remember just enabling sw_signaling was enough to fix the 
> issue.
>
> -Lionel
>
> On 12/07/2022 13:26, Christian König wrote:
>> Ping to the Intel guys here. Especially Lucas/Nirmoy/Lionel.
>>
>> IIRC you stumbled over that problem as well, have you found any 
>> solution?
>>
>> Regards,
>> Christian.
>>
>> Am 07.07.22 um 12:29 schrieb jie1zhan:
>>> enable signaling after flatten dma_fence_chains on transfer
>>>
>>> Signed-off-by: jie1zhan <jesse.zhang@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_syncobj.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_syncobj.c 
>>> b/drivers/gpu/drm/drm_syncobj.c
>>> index 7e48dcd1bee4..0d9d3577325f 100644
>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>> @@ -920,6 +920,7 @@ static int 
>>> drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>>>       if (ret)
>>>           goto err_free_fence;
>>>   +    dma_fence_enable_sw_signaling(fence);
>>>       chain = dma_fence_chain_alloc();
>>>       if (!chain) {
>>>           ret = -ENOMEM;
>>
>

