Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F0F588EA0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 16:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE4C18ABF3;
	Wed,  3 Aug 2022 14:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2086.outbound.protection.outlook.com [40.107.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784A618A308;
 Wed,  3 Aug 2022 14:24:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4BgL5aqF+ua/GAL6nCZZNmjPZPbt5IjMvW48/QzXshoiplQVEGLlWQdQclcY+53hQXB0T5PTg9V6x/yMki9zDOjaMphKX9xa+gbD2chFF8RGEJ1xSNkYPGHzc7tiJ5WYtxV9uR5XziUxJnXbKRoZSFrBj3n2ZqntIu8sESJFm4ML5+0lDCB8FhAzwqmcwxziGhIWMIdTJYoUUXc91BkD9fOFNiW7+h0a8GJGgyz8NhpcH9nLVNzjDtXVwONLEQiWBFm5b7SYrNL9el/GDD8mdbdKRPEr50vdBujndqNWR1+p1nsgwr1OVgxad7hHLVunAYrwJEvhj7hvFEo7MFBQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOpldH8Dsk70eWXGOIgr/RLkxkmuXbFf+WKR4AVpPTo=;
 b=nPzwfS0sWnzWoz7+4JT65UvlQ0Ir/2N+L1xVcjIZFlm/R6jLE7+d3KcgzAHHGzvugukMrY3g2BkvyASBo746N3AslushNnOmYv/EOE4olhiiWxuBOvEpCx/+6+93IiaP9IVnb7FgNTjzfH+mPbqFTLXMebSUcDi1cu2wHjfRLKhyWtbf2I1wcN5/9UgNDsenKCN87ohxtpPAwVBEtS9fXwB16cK0Vxup1zIZ3bBUd4s2AskxDuKNGhsu0Z4pO5Z3eqrA32srQOb53alb1YAiPqmOOBMJsJAp9eFzlzHRVWiAOhBwaXJRV1Mjoxdi/cufGAqeABzPB83Mv8XLzAdAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOpldH8Dsk70eWXGOIgr/RLkxkmuXbFf+WKR4AVpPTo=;
 b=XuKdLxF0dbuDaBfAn/kFh24esLqwAhdDwSkuoBAwDXb7KIjNf83+7eqTVpK8gWpRsfASP4Rc+Zq6Uwbwu4hAmmL5BY/wk0ZQXuTIIHm/Gf1tzc1P5OBY1EuGTkigOiFWlXsgQ7uAOC4pRCQKZZSlRz+05TevaIcjrEuOkhEoAz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by MW3PR12MB4506.namprd12.prod.outlook.com (2603:10b6:303:53::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Wed, 3 Aug
 2022 14:24:05 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 14:24:05 +0000
Message-ID: <b366361c-1626-6df2-4a47-66d94ebfc682@amd.com>
Date: Wed, 3 Aug 2022 10:24:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] drm/amd/display: Fix 'no previous prototype' compiler
 warns in amdgpu_dm_plane.c
Content-Language: en-US
To: imre.deak@intel.com
References: <20220801135259.3039679-1-imre.deak@intel.com>
 <20220801135259.3039679-2-imre.deak@intel.com>
 <8a3f1d72-5995-5db3-e550-8c532024c304@amd.com>
 <Yups9fP/V9hAnAFk@ideak-desk.fi.intel.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <Yups9fP/V9hAnAFk@ideak-desk.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:208:256::6) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d65b94ff-668c-48e7-bb6c-08da755bd1e6
X-MS-TrafficTypeDiagnostic: MW3PR12MB4506:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ocYynRCYpGCAQ52e4C7NYkCxZgLhsSo16YX6W4W2qXVAdTUfllVGANCasrAPZ5XhbjKg3VF+i2iWTNSVCJvwQKy+1zI+r5yZvIP06Sb2GWxcoevh5Xk7M5aQ/aIacTg/ZB+IlKJ/cKL7w4ZoHdCcmrZLqI6rJcXqKmRzEElpZz/bU5Oj0xeGa0lZuUP47rS6InZH1MBFE4/yvuk+3ndqaGbSt013hMkLOc9O56jkorNn3M4HPAoCDIQwW5Ehsi9ByzuEGaT5bC8aKxT0MuXgW2CwLm8IxeBxN+AmD8mmIFKzTgabMkRAom6clYzllUKdpI2z2inyBG6zgDBq2MIhbYcejM0gcJ1YxRKpw5j8AU2IiA8nQHfz1Tl951pRGkuqXLqJcYkbbJbBU+8rZMo43JU1vX7OgheSH1PDSzVTG3KuMXcodcr+VX6dAVtgA1UkIgG9ae2taPSazRS6n3F1oknABx70Q2Keg/q9nUFRUNh4SW/VVY6jM3W9KEB5V3e5ywHOKeiPM17g2NrInHiVazgM+J36y3BfW3l8QLxoT0L1Muj24zjrZMs3JJcqSqm55njJNbO2OXpRwM8G97BdxXcSKm7i0vUQgHMlMg7HxKy5flMwAlLakPARnv+4HC2S79ae3sIel58Mg4n0xORTyW6zT9ZIJbc+K/5daw/tLqLQuTj4Qwu5b75B46rPMxsgIODju92WAs5NveqDuKbSIu16l5nLpxnjnzTycjsJv/dxosHOLhiuHtV8OQWKmVZuO36xkGLfbCEiv7Aq+P0n8uMenvYg/lRppJixnLFJNX3xQ5nYb7ZbH0NrYCZ17U7v/I5pmkbc0XophxPaMsS2TAh5zq7F3VvyxZtzlxQZ9iY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(86362001)(83380400001)(186003)(31696002)(26005)(53546011)(6506007)(31686004)(6512007)(2906002)(41300700001)(38100700002)(66946007)(316002)(54906003)(966005)(6486002)(66556008)(4326008)(8676002)(2616005)(36756003)(66476007)(8936002)(478600001)(5660300002)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUZmL1A4SGdsWExwUDUxZGFjL0RpS1pGcGRDSXRQRytWM3RGaE40R3MzWmpU?=
 =?utf-8?B?NFNGdDYzTU44YlhXbjAyZ3FVdzlTR2x3WjlLekFEMmQ0dGdIczZDZVU3cStZ?=
 =?utf-8?B?M3NINC9jZmlHaXZKR3FqaGtDWkxDZklSUmdmdFk0SUlTWEhOZmloN2drb09Y?=
 =?utf-8?B?RjZ4R2syc3NydlBhL0VTV2p6ZzVYY3ZnNFU3K0xzUVpjSlYzUEVtc2hKVENJ?=
 =?utf-8?B?OFlzUmVWZnFscm5kTGxiRHJpUXF6YWJSTXVJaTdaamZPd3FBU1A4UTJXV244?=
 =?utf-8?B?R3FyTkFMN0w5bWdabER0bkJtb1pLUlJMQmMxTTI4dTZHSVRzNXkwdkptUnhT?=
 =?utf-8?B?VjlZMU9zcVU2dmpiQisvd3RNbmNSV1FTNUpUZGxXYlhSZG51SFI3UG80clZs?=
 =?utf-8?B?Y2NKbG5MMi9SR1VsUG93dWZHeHcweXVsTXIrRWRHcVJLMGJ2cjRBS0c3RVgz?=
 =?utf-8?B?bXB6UTZNL3g3QWxHdWUwa1dBUG03eDhKQ3Y4dzhMQWlPNS9SeDB1eDdxSW9Z?=
 =?utf-8?B?VFFVYjVUTjBsSlFEQmVBb3FXUW0ybUNqSytueFJjVkhrdmdpVHlZYTFtQWRS?=
 =?utf-8?B?QkFBdU42UjZOTkJHR1hqWGZTS3p3Y0dwVkJla1Rid2NYOStLOTVHN3drVnhR?=
 =?utf-8?B?S3IyUTZBN0w1UUNBRjE2eFB2RXh6cTY1L2pyM0xvb3dQa0ZVOXdBUStQVDR2?=
 =?utf-8?B?TWpHajA2ZnpOUHdNY3JaNVhTREVaYnZ6bC9qUDlEZWZYb3J6MVBKN3p1dWFh?=
 =?utf-8?B?WXpQTUtDUGhnMysyenNyS1JNVXVSanZtRXNnMFhxTFM4Y1o4Ujcxai9OY1hY?=
 =?utf-8?B?NTlMR1FIMTVsWXFhcXZBWElPYmt2TWNod1pzL3hLeStaMU1kRVhPaFdsMGRa?=
 =?utf-8?B?SkhLSVovNHZFV3o3N2hXKzdtMWlscitVekI5em1iczUzRngwajNKQWJxUVZw?=
 =?utf-8?B?M1VOdkUrWXZEYzdqeDNhUDdrZUdCL0JydHdsMTNSUld0VHJYZlhMZTF5bXBM?=
 =?utf-8?B?MHBSSlNidU11L2NQQTQwbjJXdTUyalRnb0ZRZjQ1UzRzOXFnNjBCR1dYTXVH?=
 =?utf-8?B?Zlc1aFp2Z3hoeWtrSUpqeGxtR1FRejNLVEx6MWFUYVd4bTFRcW9JNXVnaFRU?=
 =?utf-8?B?ZFpIWmVOaG9IUEx3Z3FZSEUrRXR0RFZTYXpUNXpXaVJVVlV6OVptWFhnRHM2?=
 =?utf-8?B?TlRZQlZ5WlF6MUxXN05KZzVLOU9qYmsrWkdISmxpbEFrQTd1U2VndkY4NGhR?=
 =?utf-8?B?QlRuU0VKVGdWRTdlOWZNMEo0NFVrbkZGZnBqSytWenA2cU5sMEIrMDNlZEpB?=
 =?utf-8?B?czdmMnlpb2JIY1FQbTFLZmdWK2NQRVkzMHBxRGg0czhtZVBEVG5tcERiL21Q?=
 =?utf-8?B?OTdpYzlZVzhLaDByS1djSTRac2dZazNOT3hLMWFRSTFhMjBFUk9pUzhIM05D?=
 =?utf-8?B?TEF2MWpJYUloRGt5TGxuQmtFZ0NYYVlhTVd3Y2owbTBPSzVRZ1h6RXoxaGJX?=
 =?utf-8?B?R2JKMUdVb3phdTk5M094a1phb2krRzkzcGFOS0lvOGs5ZEt0TmJRMzFVQ2s3?=
 =?utf-8?B?K1lYU29Zbm00Y1Rpa0grVjVKR09PY1pPT1lxbDNwM1pzS0JGY2c5TDBIbE9G?=
 =?utf-8?B?M3hpSERQbHlFcERDUHgrcUI5eGxVVnZ1WUdxV2RMWGxyN0M3S25kT0R5dzha?=
 =?utf-8?B?VE1tditvbHhEZHdrM2lndW4rZWFIeTRMYjNNcEx1VE00KzJuMElVOStaaDQ2?=
 =?utf-8?B?MDJvVXZ6ZzNzMkpNYkZUcC9vSlJhZnFIL2cyRWxjV1FIWHg1R3hjTXZtaUxx?=
 =?utf-8?B?VHJZSmFXbE0vWmZuU01nSzVaVFlCdWxvVnpMc1BoZGtzc1RWUUVHa3VxS1ls?=
 =?utf-8?B?ZmdUT3NINTZQUUpYNEhIMWZSYkhPblBJNzFGNis5MEhwTGxWa1JCYjcxcUZY?=
 =?utf-8?B?ejFtdFlWcmlPS1F1ajNyOHNoTE9BQXZ2M2ExV0g0UVFvQUQ4a3J3NTJ2akIv?=
 =?utf-8?B?WS81WEMwc2ovM3ZHNnVYb2ZlTHgrQ2NwTlI2QUVaSHpiV0IzTWd3elptRXh0?=
 =?utf-8?B?eXdPam8yd2krMVN2MXdidFIvM3hnZFlwNytrUTNDanRRaU5KZmpmNnJtcEdu?=
 =?utf-8?Q?lYpPEzt20TDYGiTCImk2RwEfG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65b94ff-668c-48e7-bb6c-08da755bd1e6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 14:24:05.2410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlQvUlUbeSRWisN7p3KdeDza8C4RxLyybR7t/H9J2uqm4aM4pm2SAEHEM2r7OZeOSjYwvcviAj2foLjxNjX+0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4506
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-08-03 08:41, Imre Deak wrote:
> On Tue, Aug 02, 2022 at 12:57:24PM -0400, Rodrigo Siqueira Jordao wrote:
>>
>>
>> On 2022-08-01 09:52, Imre Deak wrote:
>>> Fix compiler warnings like the following triggered by
>>> '-Wmissing-prototypes':
>>>
>>>     CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.o
>>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:83:31: warning: no previous prototype for â€˜amd_get_format_infoâ€™ [-Wmissing-prototypes]
>>
>> I see "â€˜" around "amd_get_format_info"; I'm not sure if my email client
>> adds that or if there is something wrong in the commit message.
> 
> Yes, it's a copy-paste from
> http://gfx-ci.fi.intel.com/archive/deploy/CI_DRM_11953/build_failure.log>> should be 'amd_get_format_info' and can be fixed while applying the
> patch.
> 
>> With the commit message change:
>>
>> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> 
> Thanks for the review. Could this and patch 3/3 be merged via the amd
> tree?

Sure,
Patch 2 and 3 applied to amd-staging-drm-next.

Thanks
Siqueira

> 
>>
>>>    const struct drm_format_info *amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
>>>
>>> Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to planes")
>>> Cc: Harry Wentland <Harry.Wentland@amd.com>
>>> Cc: Alan Liu <HaoPing.Liu@amd.com>
>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>> Signed-off-by: Imre Deak <imre.deak@intel.com>
>>> ---
>>>    drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>> index 5eb5d31e591de..da3b086b0d6ef 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>> @@ -33,6 +33,7 @@
>>>    #include "amdgpu.h"
>>>    #include "dal_asic_id.h"
>>>    #include "amdgpu_display.h"
>>> +#include "amdgpu_dm_plane.h"
>>>    #include "amdgpu_dm_trace.h"
>>>    #include "gc/gc_11_0_0_offset.h"
>>>    #include "gc/gc_11_0_0_sh_mask.h"
>>

