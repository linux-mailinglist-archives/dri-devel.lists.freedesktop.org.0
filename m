Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8FC3B717D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 13:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208D86E873;
	Tue, 29 Jun 2021 11:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ACD6E873;
 Tue, 29 Jun 2021 11:43:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQwxxamkA4Xor78TMh9CErAlhULbrX0G0pds9LKKRFsErkcz5QR8N9VKxPE5Gc0wqpIMp2p+dBso0rcazPYH/RGnHMKuMHvBOk5InQo9ohfBsZzir9F8P1+0zmsPhecmclax5g/dsVhsqzTyUDuA/NGHcyjOxjx2vz3OX0toRgeHtl7wF8HFYwMZqGIEpqENgUwKvhT2hJ3i5hQFEcDoLG3R5Nj+Ln/5QTD6gQx8qgNXyJkPz5fPPpgn5ahtgxTwx6PT0pJRtpHEFuEyzPg5jnhBX9vTHIYEk3xMckMqVbpyQDJMKGM+lHuu4F0B75CA9UVYawJxNMyboUzPhJgRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9n6OmhryAOCFYzs1hE9Tii+IhNBBqiXz6YmCevzVzU=;
 b=SHodK3CAbbSELHcd1XeUo9rpLEF3eze2leSxWWQ1iVb6vKtNkX6rjyTM/ev1qoXX69mzCswbM2Dq/oBDNLEcxxnBnKRqvPyil1yFp/F2+J+C6Ws54c/NkRlQf+/leqs7JWw96yJdlyOK8R9d/oew5mVYNQfJU0ELi+suOTWETu3j8Xg2SfIrxUGDqu1wMTGRPG53xJKDneYYMgMoLgnc3KWkP7u5g3r5pAIWVT505tKxKXiM4cFdDissCqPYZrkqs6/pNNnrbyaDs0rWM1onFNnqZKd9AoezMLcuTuIYEeEm3w1KqJD7d1vS7dXUzqF6K4oLW8c9YwknIN8LcxKU7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9n6OmhryAOCFYzs1hE9Tii+IhNBBqiXz6YmCevzVzU=;
 b=Dqls+nMqrshnvhXNQouui/rqR6K1h8mj3GdzBTi0O7f4AGHQZbiaHE6CmMw/fBUU0TaMtovRDSh8xQzxlhaXN5whrz1ZKgjUvSlpQKuu9ysGhmS3CMVQkzzI+Bln+g+k8wcbmAGQSCpDG6FN6uygWcoON7skJtN6jkpQ7GnwXfw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5463.namprd12.prod.outlook.com (2603:10b6:8:27::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Tue, 29 Jun
 2021 11:43:24 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68%4]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 11:43:24 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu: raise error on incorrect mem_type
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20210629073629.3069-1-nirmoy.das@amd.com>
 <20210629073629.3069-2-nirmoy.das@amd.com>
 <d5cf73d6-ede7-c2fe-1b1b-7cbc89ae9978@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <20ed3817-10b9-1214-3c38-15d0c068723a@amd.com>
Date: Tue, 29 Jun 2021 13:43:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d5cf73d6-ede7-c2fe-1b1b-7cbc89ae9978@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2003:c5:8f27:5d00:9499:a270:2927:4d86]
X-ClientProxiedBy: AM0PR02CA0073.eurprd02.prod.outlook.com
 (2603:10a6:208:154::14) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f27:5d00:9499:a270:2927:4d86]
 (2003:c5:8f27:5d00:9499:a270:2927:4d86) by
 AM0PR02CA0073.eurprd02.prod.outlook.com (2603:10a6:208:154::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend
 Transport; Tue, 29 Jun 2021 11:43:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d3b2ffb-2cfb-41b7-2078-08d93af31a5b
X-MS-TrafficTypeDiagnostic: DM8PR12MB5463:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB5463C7376E5EA82F74928C588B029@DM8PR12MB5463.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iz9iaiDLsTqWtGhZehhfuHJGhSSN06fGfxDEmQRh8kMRNDS0Af5HACcU9TlBu3enOYm4jUZMOi5wCrp7YXBfC3rvFXBlSmjwNKigjzYfO+43VlHsZvgiALdw6QbUWATSlB4/cGowMjlkZy6Tn72i8gjpppIvrqf5jFwRCqKBKfDMcBopf60xlIuztYyLUDaXtzLzCQ4cKth5RxR1lr2quRIzxsFCxeWqBmFIKa3nITKDvpT5UygsW5/xBlYnOzvh64cICJnlO52aIA3mWVwl/ka/nw5+/jC6lh8YcCGlOjbPFH3hhRtFSb+OTjxoquhuaUCfsvJRrRcNW+RWYXQ3ylDQ2HhW8ZMLaxJe848sZMN91eB11SnIu1Q5kpnXg9FUrUg5UHLBLm79SZpmGzNLBhV1bWR29mf/jS4X9FO/GV0AcguhOXVnSjpYRQ/sodWHSM5bvF7shrfbbbMU9liigmZkyDXEa/4BItqlg1vb41qJu/8MVZ5Vu326vUJO19yqpkxqpGZOrGk+JdolLgV+fIe12e9ziaboiv1yHjOpS46yH3Z7ua7EGVZETmV6N4JYGJmzDrR1Mi8Q+UKOFfw1++nr9p8a+ibcGEIMYTcQUL4dDI0kVryLf7rOJN9P7HGuQv7awdfkPcse8fTkb4SXjCUFaPvfeROWfabb/NuNaEyfTzGBSfB1auILSdTzWpYYOvV0XX+gyk+KZVP2d4rHBihF3kruRN+HT2NHan4bpJmZgZsLbXThKwrU9n1fKFQB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(6666004)(6486002)(316002)(450100002)(16526019)(38100700002)(186003)(4326008)(83380400001)(478600001)(53546011)(66556008)(66476007)(31686004)(5660300002)(52116002)(2906002)(2616005)(66946007)(8936002)(36756003)(86362001)(31696002)(66574015)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnZiZG9keHAvTWdiZEZ2WU5BUkxQdU9TVXJnek9OMXkyWmR1RjUxWGNRNkJr?=
 =?utf-8?B?U1VrSmRYNDBIUWd2VXkyaHRzK0k1YmR0SExUVG1XNDJSczFDTWxNZ281UHRQ?=
 =?utf-8?B?SGl1Z0FneHIwdUV3ODZtM2tJSlFkWFlXUTdWcE8xZkFlSUl6UXZBd1RiVmlQ?=
 =?utf-8?B?UXU3NlI1Q0pBWSttaVkwMFNZY1JUQVRtcTdYUjlHZnp6bmdkVEo0NHlBNmMr?=
 =?utf-8?B?aGxCRkE3dzVLd2ZtelJ2WHpQNlRWdmtCaUtHQktmeG9la01yVUVMY2Q1aWRP?=
 =?utf-8?B?eFFzcXNDODRtREoxcGVJMFVIeTBsazNGaStLN2VBbGMyZWp3QUxwUWpQM2Yv?=
 =?utf-8?B?a3EwZzBGRlRGM25YVnJnTXF4T0kyWkJVUmpsd3hMT0V6NU1UZjZRNk1va2Jo?=
 =?utf-8?B?aldrcU9FUndsOW53WDJvWUk5b2FXWU5kc3pEQmg1MlpKUVZMWXJKaUxrNXFF?=
 =?utf-8?B?eDZZWFJzWno5cWsxWFNPMnNwQjJ4emhxK3lndmhTN1VwT3FtdEJiZ1BLSm1I?=
 =?utf-8?B?WkZhUUlLNkJzWjhHYmZMZFhCaW9nS1d2ZzdqbU1VUmhtbHgzbExsbk9RYXFa?=
 =?utf-8?B?dzRUdVZnOS90dVdoOHU4LzhITTQ1dFVYbHAzRkd1RWtrSTdUZXdtK3pEVGo3?=
 =?utf-8?B?QTJVWnZ5K2o3eUdXVFh0SWJGSHlSNHI4T3pVVXQ0VHMrSHBzUmxTbnhQTS8w?=
 =?utf-8?B?cmZ5eFRENTZVU2sxZVZqQ1g3OUF2S2wySFlPKzBlcHJnYzF4OWZCaVNiaVk2?=
 =?utf-8?B?Vlo2cllzL2xoQUozTStobTJvMVQzMUt5M2VMQkZOTERUT1FwMHRvWGlNRy8y?=
 =?utf-8?B?UklXTE00azdWazk5SUphY1lVcGtkL1N6MkY2VEVNTVI2VDFPT2xBNm1CalM4?=
 =?utf-8?B?U3M5KzhzS1NQVFJrWHo1RXpuQVFRNW9MbzI4VzZSUTJVRmNMK3h4OVFsNkNV?=
 =?utf-8?B?UmgvSmJTZ3lKRDFiN3VxaXA5enJBbGlHd3ptaldWYUhmb0ZydVVmdEVkemdH?=
 =?utf-8?B?L1EzbVBBNlJMVWpXYm5tQnNYQ3k0eDcwTzZ2UHRkTnkzMytCM3kxRHNYVFFH?=
 =?utf-8?B?V1lUWVNDSXIwYkhWRkZpQ1VaaVJOMGVyTUZPdUVqcnczYThmQ210VkIwT1ZJ?=
 =?utf-8?B?VEMwRUZDTlFjMTdJQWRIYW9PQmgrcTJsU0RkLzNVMGFIakMwekxMVXp6Q1ZF?=
 =?utf-8?B?V2h6Y1VyN3FKTEZ3RXlES1QrUDRCdUliREczMExjRTROWTJCcGZ0ZnlzSkps?=
 =?utf-8?B?ZVBDb1dvOWprQ1lDRG1GVXJoMEt3K1kxcC9kVEhwSC91MWsyc01PN2V6aFFa?=
 =?utf-8?B?Rm5IYnRJazdubkF4OHRRS2w5K1NMakVQbEc5S2tOWlkzUkFLZm96L2F2amxa?=
 =?utf-8?B?NUdwWDM2YkZhQzBvL01RT2xsN1FKeDUydVl1SzFwSXR3bHZjNXJqelNRRzg0?=
 =?utf-8?B?bnNITWZ5VjlML1Boa2pUeXNKMVp3ZTJZWDBjREw5Slc4ZlkreHhNRk1aQ0s1?=
 =?utf-8?B?R2ozK3RGeUF6aG91b0ZPNEdtNzNXQXFVdkFXUnVlNXdubTBIQ1IrbnNzOEdS?=
 =?utf-8?B?RkNoN3NsVktaUkIxQ0Fmb01RcGZkSFJvc1BJYk1WSE5nQm9iNzNTcGkwbnZT?=
 =?utf-8?B?T25hbjNUMlNSQWdzc1JIWU8vQ1pCc0RlQ3o3VEpTZ0VsQWMvQkYyMHd6b2pZ?=
 =?utf-8?B?bWVERE1zek8rWER4czVMeXZId0QzQ0QvVldUT1NDclRVRjlhOWpCSlErTkpj?=
 =?utf-8?B?MFlzTzZ3NTNmN2FUM3hzUjIwekt1cC9nTSswL3duUFdGMVdhalJ2SWJYNkg4?=
 =?utf-8?B?S2F3Mi9VVG9yR0ViOVFNYVdQazUyMW8yenhOeldmd0dkNDNwMHAxVmNDckpF?=
 =?utf-8?Q?peANIX+afRSzS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3b2ffb-2cfb-41b7-2078-08d93af31a5b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 11:43:24.4066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qIAy9CzynYjkQEsh1wIFFZRfq7iUfR3UbO8jVRouUToJKW2pNsxKlzZ6qe5Dldv7az+TKzg+nHnOOj6CBThzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5463
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
Cc: Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/29/2021 1:06 PM, Christian König wrote:
>
>
> Am 29.06.21 um 09:36 schrieb Nirmoy Das:
>> Be more defensive and raise error on wrong mem_type
>> argument in amdgpu_gtt_mgr_has_gart_addr().
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>> index 543000304a1c..0b0fa87b115c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>> @@ -107,8 +107,12 @@ const struct attribute_group 
>> amdgpu_gtt_mgr_attr_group = {
>>    */
>>   bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *res)
>>   {
>> -    struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
>> +    struct amdgpu_gtt_node *node;
>> +
>> +    if (WARN_ON(res->mem_type != TTM_PL_TT))
>> +        return false;
>
> I'm not sure that is a good idea. The GTT manager itself shouldn't 
> have to deal with incorrect usage of it's component.


This is in-case we accidentally use amdgpu_gtt_mgr_has_gart_addr() for 
PREEMPT bo in future. I will drop it as the previous patch should give 
us enough hint.


Regards,

Nirmoy


>
> Christian.
>
>>   +    node = to_amdgpu_gtt_node(res);
>>       return drm_mm_node_allocated(&node->base.mm_nodes[0]);
>>   }
>
