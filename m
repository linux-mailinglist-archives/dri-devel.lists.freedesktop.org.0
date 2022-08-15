Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2959E592D98
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 12:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253ADB7A64;
	Mon, 15 Aug 2022 10:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD26499C1B;
 Mon, 15 Aug 2022 10:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e43Cra2RudGTF1eplj5DdCf2oJ2pd2jqiZTeDs7bStoRlsI6ti6PZVrRNVorEzqi3WDsjMfW0BSwWFQ8Agcskv5w3BU/50u/FDnT2mVr/+G2iPuleBKbLSLbNEGoLpCB9D/+YGGEqDJd3qVgD1ZGbd9aou8DAvRl43g57f5BYDycxvZDZ3gj3IsIaX67n5DaSCh0OjvN/RJoFWTug7RbZt4Fko9kTrvUrztmqvGFOjP4NhDU2dDYHwgCmo2nB33XtkoqwVdPNUXg6//UTZj++8kDuG/Ev48dsu8ZV6EKgevA9nrCjIbfe4iTc4dqux/3lDS5nIzez0+l9Be8egfJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqNwHwQN6setj9kHfTJQFpY6MF5fflkhWGkFBs/fbLg=;
 b=cAzpV9TJj7iiAYFY3DN5NVPNi5yC/QkKXkVZ51YaIU1YOHPN/ql3MuqML3YbLySArI+nlrow8cN4lJU4yprQsu0965p3EVFCg9j80oExFWZhLAPggrGkn9bnuzmZOQxZzHyUaKNC26ZOssBmj/FXARTb8xSfleu9iMDyfhbR8vT0uImdeup2l0xRjJal5QnGeXvMyLUb2G/mcUf49pZFNPlpFV/MlKQO36HjjLlXrRdL6G1ULAc30mTn4BG+tPc5cs9mroGVNiHn8IVs+GFixNk0hJWyDzsFf9GpTloslj+i5y6nI/GKQzq2y9fZdZJhfiMg6SpWSjC3Qcxkna2/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqNwHwQN6setj9kHfTJQFpY6MF5fflkhWGkFBs/fbLg=;
 b=UilAUf0dLbcCIIFrOgAJE9nxfD1ogLU/qLDIZjp0Xe6QYDZxDMh1NtQInA6GbxXomfq5w5CzXJWx00ZISEAXrBl+aKik0Y27nuYcXUlk2ZyEpMlxhl0V5vjG6JWwJmPajfmyUuZi4vtYgZ0MQ9EeZotN8XEHGUGzlJ3QjXCGLxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6230.namprd12.prod.outlook.com (2603:10b6:8:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 10:58:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 15 Aug 2022
 10:58:25 +0000
Message-ID: <8a2951a0-bca4-ff8a-fd65-6e9b69ee3383@amd.com>
Date: Mon, 15 Aug 2022 12:58:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [BUG][5.20] refcount_t: underflow; use-after-free
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mairacanal@riseup.net>
References: <CABXGCsM58-8fxVKAVkwsshg+33B_1_t_WesG160AtVBe1ZvKiw@mail.gmail.com>
 <be6f1ce4-46b1-7a80-230c-b99f203ce8ad@riseup.net>
 <20220815105542.meuiebxipc35bwug@mail.igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220815105542.meuiebxipc35bwug@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR0301CA0030.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::30) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf9b7031-6019-4d2c-09db-08da7ead1384
X-MS-TrafficTypeDiagnostic: DM4PR12MB6230:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Xh+F83tF81/DopXI8Rm5pymj+ehjrJzLkMEsUHfCNt7wCp8hSCgnVRXJG54BJvbL7/qnQIg/ru5RQUqRur8RY7valpq4zqnzs7eMFDOubtZINB7J1CsXcU2Pb+lGTdhzUeMKu0gF9ILSKVB7ou4WMrWSq8sj92mjKeiTb8VkARd8uQm4DGQLcsTLKpmDKUAtJkvyw49gEaQTX9O93OL0wx602477rhl4mlIsRHKekNz9WpZ+kKSuojut1+rpACvWnIJFIrgX9j46NyI3S8RCBftTIBcLMNcvnpU33cgBUfkMSk6dVUcgGGRrVFAg6N387JL8RFKPkqc8x0rUHQE2XA3OixQhbCUrSdFw8SNNTBMZj+bkFUx//zzZOIGPr04F/6+6UKYbOj6pz1gtrAcxO+9bmtrS+4tCVIVnvhjVjwph3grLzr6Fo7e8UC2Ps4S7roPqZyz1LSqha4pgA9TEWx6S6EmriXd2I+p6+/t2MRnK3/KxzvFKNOYH3Bo0DBGKVn2tfvpqaJPaRGpn9ms/m2yZ2MIU1R68pyRMMpNnz+d9xdLhM/Ir2uZyltBPONCo0mzA5eXuMQqChRvCBvMSVtIT6GOb1iAazAfPsYsmnjTDLB1j9pOA1W5eDsHGgS4JNC3NrN1U+ONSXBc0dOojexQpbxv5fOdo+bMNUMWjMEaxJoN/DwkbGHpiinNTRf0goIk+dVSpc6dLzA6+eq8Jx+WKtLoXdm1cqN8Uyvn+uvkz4W7bSAbQdVflBt9Yz+SjuKIh6Tb8Oeep3sP5Q6578KcLGBDkzPLo2GNz+U74/dkrA1KACXxi+A36ypdaGm8V+hN0JlC/tVcIYOzJNqao/bDraKfXid2aSYQZjNUAl40RwqZkaz2aXMk8Z3Q8s+ToXg5B4XTc0bvMklEo0n7ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(38100700002)(966005)(5660300002)(2906002)(66476007)(478600001)(6486002)(66946007)(66556008)(31686004)(8676002)(8936002)(6512007)(36756003)(6506007)(6666004)(66574015)(86362001)(2616005)(83380400001)(53546011)(41300700001)(54906003)(45080400002)(316002)(186003)(110136005)(4326008)(31696002)(10126625003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW5ZZkgrV05ZUFpPNzJKL096cWw0QkswbUk3QXNYOVRJNXV4eHoxOXZrNFdW?=
 =?utf-8?B?VDZaYy9GbytTcFZkczJLYXhZOXZjakJRTHNyTmN5Ulg2WlR1Q3ZGeVF5VWw3?=
 =?utf-8?B?cWhtRkdHOG14QmNCSkExcTBpVUxnUlNFdzB4SGtEVUU3aUkrS3MraGhXbEtI?=
 =?utf-8?B?LzNMM2tpK3l5bDZzd2FkUlkvQnl3dnlaUStFbU50RkM3T0lCbEtrTUZlQUNu?=
 =?utf-8?B?bUE0WVp5TWpZNUM5MDRmQmliZGY0Wm1EamdoVENVSWVxTkoreFp6eFlhbVdC?=
 =?utf-8?B?dTJ2NzNZSHA3OVgwenlFN0pmbUpHc3ZmL3VLTlNvOXZvVGhoZEtZbkRyRTRB?=
 =?utf-8?B?RDdzb2JWVnlGd1o3YUlLaDN0aGRWZUNvVEYrdXBQeERDS014SnRrSTBOU09T?=
 =?utf-8?B?K211RW9VME5EdXN6QVpsN0ZrbG01VVhKc3ZieCtyYU9UcldMWWxaMHFEdU9n?=
 =?utf-8?B?QU1pb3FHb2l4aVNGbzZwbWZreW1XTmxJRnZRTVFnRytWUUhtZzlGd0U5bGth?=
 =?utf-8?B?RnFJQmhLR3NpdHg1bGtGYkJjODNNTTN1UFhxdVBPN3pXU3NQM1pKSTBLVDA3?=
 =?utf-8?B?blY1VTFZMTVSbEd3cDJQQmF6R3MvS1VrNCtwZG1KU1VnWDY0U1BUaHVpYjNN?=
 =?utf-8?B?U3IwMTR3VVh3dlA2MEdHK3VxRjF2Tnozb0hLY0liVTVGVFlMalN3Wkg4S2Zk?=
 =?utf-8?B?bWZCMUpGWmpwT0VJQVJOR0kxUDJSbUdKdDR0TTNyeVVBdTNOTDN4a0QrOUlm?=
 =?utf-8?B?SjFrNTlMRWdUSDRyZUMxM3FwcG9Eemd0T3d0YmJyWnB3V1NZbDkyZkh6ZExj?=
 =?utf-8?B?Vk1Eb2ZKQkJkQmlDdnVqUkthMG9YbGhsb3R2eVdVTTMyYU5JelppYlZ0K2py?=
 =?utf-8?B?UVh5ZGhnVllZVXdpVXN3WU1XcTRxZ1NVcFRERUFBbmNaL05XN29OSkpUdEJz?=
 =?utf-8?B?Mno3OUFpZXV3YVlQRk1Lb0dGWHdFaU0raXI0WW5VNTB3VXo4ZVFvQnkyZEt1?=
 =?utf-8?B?clFhdldJZ0ExQytxdGpWZUZKamNPZklCemJ1VTVYU2REc2NVTlRFVlptTlNF?=
 =?utf-8?B?S2tZa2J2V2dnTGwrb3dEV0xDL2NwbXZYWGtLY1dJWnVUK0Q0My9jay9XaUFJ?=
 =?utf-8?B?R293ZHBJREhXaWhyWE9idUJTRVJ2RnJ2aEt2UWpUL1dnUHNkYnY2WC8zY1Uv?=
 =?utf-8?B?WlVyai9NVFhpV1l6dGFLUmVCRzJ2S2VrVkZCRklXTm5TekwwdDdZZGh4WkRh?=
 =?utf-8?B?d05nZUhaamNyL1NiNzZoTGhieG8yL1o3MCttQ2FTbmFFV3htcWl0Qlk0WVhv?=
 =?utf-8?B?bzk3QkF4UUs4YlRuMlJTcjF1dFdsZlBVeEV3Z000c01WYm5maFljNEowUVV3?=
 =?utf-8?B?alJKYlBuangxeG43L0ZkRFFZVFRRS2xPYUFtVzFBQlZRL29nL3BmWlNGU0da?=
 =?utf-8?B?ZEJnallIUFEyZjZxY0d3NTZoUDhTSkk2RmFCcC9mUklQR2ROM1FNUnVsT0VG?=
 =?utf-8?B?SFozaGczUmJNQWxUaHIwdW1Cb21zVFh2VXZJYmFoTXdHMitkYklRU3hJcHAv?=
 =?utf-8?B?ZlloWmNFN1ZXNkN5WHN6Z3JUakZQcFB6U3EyOUVQTUtyR2daQmNmSTJYTGMw?=
 =?utf-8?B?MEdiZ3c2RHVuV1ZXQW9QM2VWZ2FhRFRoOVlwL0ZSQmVwUFAzRXp5cDRMekNk?=
 =?utf-8?B?NnhldXZMMVk1bnBTb0huWUsrdUpMajcwYnZKd2psbkE4NGlSWUNDVzRrYW9B?=
 =?utf-8?B?Z0VSYVR2VDlDQ2VnSnZGNWZSR2ZBSTkyeGR0bTZjYnYvb3J1WjZvaENQRjdK?=
 =?utf-8?B?d0FvVm5LZGVhc2wrclhSa2lqeHkxTVl4c2w0bkh6TWZUZmpSeWQ0THhicDcx?=
 =?utf-8?B?TVZDYTQ4ZGpWRlQxK1lzcUFDZ2xMdng1MldxbnB4WUNSZ3hwanM3T1RJQ29V?=
 =?utf-8?B?T3lUWGNzKzJ4Z051WHdMN1NqYnpUZ1RZSnB1cmZOSnF0OXhla1AvYVlXSEQ2?=
 =?utf-8?B?RUVHamdrUUxPMVFjekFDRWZha1pGeU5aYWFrUDc5Vm52YjFsT1pjZXNJclIv?=
 =?utf-8?B?YmF0SXl4MXFlVER4T3pNdW5yT21Jd3JnRStJM3Uxa2REaUdBSldaR0c2Si9p?=
 =?utf-8?B?WThUTkRhRHpuUUFrTlVwQVJrbGJQNHA3djd0NFlkV2l5SjRkR0c3TTdIeWdk?=
 =?utf-8?Q?JEZ/aO0/IXV007YvYxbeRbMAuW9FWLcVgLREXKvu1XTw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9b7031-6019-4d2c-09db-08da7ead1384
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 10:58:25.7114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6579y4vIrIAw1wh+ETP0Z8a9nV9Eu31H8IM5wB18EXIN+8Qox4R1Ejw3BEhSiV9G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6230
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
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.08.22 um 12:55 schrieb Melissa Wen:
> On 08/14, Maíra Canal wrote:
>> Hi Mikhail
>>
>> Looks like this use-after-free problem was introduced on
>> 90af0ca047f3049c4b46e902f432ad6ef1e2ded6. Checking this patch it seems
>> like: if amdgpu_cs_vm_handling return r != 0, then it will unlock
>> bo_list_mutex inside the function amdgpu_cs_vm_handling and again on
>> amdgpu_cs_parser_fini.
>>
>> Maybe the following patch will help:
>>
>> ---
>>  From 71d718c0f53a334bb59bcd5dabd29bbe92c724af Mon Sep 17 00:00:00 2001
>> From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
>> Date: Sun, 14 Aug 2022 21:12:24 -0300
>> Subject: [PATCH] drm/amdgpu: Fix use-after-free on amdgpu_bo_list mutex
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=UTF-8
>> Content-Transfer-Encoding: 8bit
>>
>> Fixes: 90af0ca047f3 ("drm/amdgpu: Protect the amdgpu_bo_list list with a
>> mutex v2")
>> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index d8f1335bc68f..a7fce7b14321 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -837,17 +837,14 @@ static int amdgpu_cs_vm_handling(struct
>> amdgpu_cs_parser *p)
>>   			continue;
>>
>>   		r = amdgpu_vm_bo_update(adev, bo_va, false);
>> -		if (r) {
>> -			mutex_unlock(&p->bo_list->bo_list_mutex);
>> +		if (r)
>>   			return r;
>> -		}
>>
>>   		r = amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
>> -		if (r) {
>> -			mutex_unlock(&p->bo_list->bo_list_mutex);
>> +		if (r)
>>   			return r;
>> -		}
>>   	}
>> +	mutex_unlock(&p->bo_list->bo_list_mutex);
> I think we don't need to unlock the bo_list_mutex here. If return != 0
> amdgpu_cs_parser_fini() will unlock it; otherwise, amdgpu_cs_submit()
> unlocks it in the end.

Yeah, exactly that.

Apart from that the patch looks good to me. We moved the mutex unlocking 
around a few times during review. Probably just a fallout from that.

Thanks for fixing this,
Christian.

>
> BR,
>
> Melissa
>>   	r = amdgpu_vm_handle_moved(adev, vm);
>>   	if (r)
>> -- 
>> 2.37.1
>> ---
>> Best Regards,
>> - Maíra Canal
>>
>> On 8/14/22 18:11, Mikhail Gavrilov wrote:
>>> Hi folks.
>>> Joined testing 5.20 today (7ebfc85e2cd7).
>>> I encountered a frequently GPU freeze, after which a message appears
>>> in the kernel logs:
>>> [ 220.280990] ------------[ cut here ]------------
>>> [ 220.281000] refcount_t: underflow; use-after-free.
>>> [ 220.281019] WARNING: CPU: 1 PID: 3746 at lib/refcount.c:28
>>> refcount_warn_saturate+0xba/0x110
>>> [ 220.281029] Modules linked in: uinput rfcomm snd_seq_dummy
>>> snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
>>> nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
>>> nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
>>> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink
>>> qrtr bnep sunrpc snd_seq_midi snd_seq_midi_event vfat intel_rapl_msr
>>> fat intel_rapl_common snd_hda_codec_realtek mt76x2u
>>> snd_hda_codec_generic snd_hda_codec_hdmi mt76x2_common iwlmvm
>>> mt76x02_usb edac_mce_amd mt76_usb snd_hda_intel snd_intel_dspcfg
>>> mt76x02_lib snd_intel_sdw_acpi snd_usb_audio snd_hda_codec mt76
>>> kvm_amd uvcvideo mac80211 snd_hda_core btusb eeepc_wmi snd_usbmidi_lib
>>> videobuf2_vmalloc videobuf2_memops kvm btrtl snd_rawmidi asus_wmi
>>> snd_hwdep videobuf2_v4l2 btbcm iwlwifi ledtrig_audio libarc4 btintel
>>> snd_seq videobuf2_common sparse_keymap btmtk irqbypass videodev
>>> snd_seq_device joydev xpad iwlmei platform_profile bluetooth
>>> ff_memless snd_pcm mc rapl
>>> [ 220.281185] video snd_timer cfg80211 wmi_bmof snd pcspkr soundcore
>>> k10temp i2c_piix4 rfkill mei asus_ec_sensors acpi_cpufreq zram
>>> hid_logitech_hidpp amdgpu igb dca drm_ttm_helper ttm crct10dif_pclmul
>>> iommu_v2 crc32_pclmul gpu_sched crc32c_intel ucsi_ccg drm_buddy nvme
>>> typec_ucsi ghash_clmulni_intel drm_display_helper ccp nvme_core typec
>>> sp5100_tco cec wmi ip6_tables ip_tables fuse
>>> [ 220.281258] Unloaded tainted modules: amd64_edac():1 amd64_edac():1
>>> amd64_edac():1 amd64_edac():1 amd64_edac():1 amd64_edac():1
>>> amd64_edac():1 amd64_edac():1 amd64_edac():1 pcc_cpufreq():1
>>> amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1
>>> pcc_cpufreq():1 amd64_edac():1 amd64_edac():1 pcc_cpufreq():1
>>> amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1
>>> pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
>>> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
>>> pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 amd64_edac():1
>>> pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 amd64_edac():1
>>> pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 amd64_edac():1
>>> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
>>> amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 amd64_edac():1
>>> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
>>> pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
>>> amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1 pcc_cpufreq():1
>>> [ 220.281388] pcc_cpufreq():1 fjes():1 pcc_cpufreq():1 fjes():1
>>> fjes():1 fjes():1 fjes():1 fjes():1 fjes():1 fjes():1
>>> [ 220.281415] CPU: 1 PID: 3746 Comm: chrome:cs0 Tainted: G W L -------
>>> --- 5.20.0-0.rc0.20220812git7ebfc85e2cd7.10.fc38.x86_64 #1
>>> [ 220.281421] Hardware name: System manufacturer System Product
>>> Name/ROG STRIX X570-I GAMING, BIOS 4403 04/27/2022
>>> [ 220.281426] RIP: 0010:refcount_warn_saturate+0xba/0x110
>>> [ 220.281431] Code: 01 01 e8 79 4a 6f 00 0f 0b e9 42 47 a5 00 80 3d de
>>> 7e be 01 00 75 85 48 c7 c7 f8 98 8e 98 c6 05 ce 7e be 01 01 e8 56 4a
>>> 6f 00 <0f> 0b e9 1f 47 a5 00 80 3d b9 7e be 01 00 0f 85 5e ff ff ff 48
>>> c7
>>> [ 220.281437] RSP: 0018:ffffb4b0d18d7a80 EFLAGS: 00010282
>>> [ 220.281443] RAX: 0000000000000026 RBX: 0000000000000003 RCX: 0000000000000000
>>> [ 220.281448] RDX: 0000000000000001 RSI: ffffffff988d06dc RDI: 00000000ffffffff
>>> [ 220.281452] RBP: 00000000ffffffff R08: 0000000000000000 R09: ffffb4b0d18d7930
>>> [ 220.281457] R10: 0000000000000003 R11: ffffa0672e2fffe8 R12: ffffa058ca360400
>>> [ 220.281461] R13: ffffa05846c50a18 R14: 00000000fffffe00 R15: 0000000000000003
>>> [ 220.281465] FS: 00007f82683e06c0(0000) GS:ffffa066e2e00000(0000)
>>> knlGS:0000000000000000
>>> [ 220.281470] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [ 220.281475] CR2: 00003590005cc000 CR3: 00000001fca46000 CR4: 0000000000350ee0
>>> [ 220.281480] Call Trace:
>>> [ 220.281485] <TASK>
>>> [ 220.281490] amdgpu_cs_ioctl+0x4e2/0x2070 [amdgpu]
>>> [ 220.281806] ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
>>> [ 220.282028] drm_ioctl_kernel+0xa4/0x150
>>> [ 220.282043] drm_ioctl+0x21f/0x420
>>> [ 220.282053] ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
>>> [ 220.282275] ? lock_release+0x14f/0x460
>>> [ 220.282282] ? _raw_spin_unlock_irqrestore+0x30/0x60
>>> [ 220.282290] ? _raw_spin_unlock_irqrestore+0x30/0x60
>>> [ 220.282297] ? lockdep_hardirqs_on+0x7d/0x100
>>> [ 220.282305] ? _raw_spin_unlock_irqrestore+0x40/0x60
>>> [ 220.282317] amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
>>> [ 220.282534] __x64_sys_ioctl+0x90/0xd0
>>> [ 220.282545] do_syscall_64+0x5b/0x80
>>> [ 220.282551] ? futex_wake+0x6c/0x150
>>> [ 220.282568] ? lock_is_held_type+0xe8/0x140
>>> [ 220.282580] ? do_syscall_64+0x67/0x80
>>> [ 220.282585] ? lockdep_hardirqs_on+0x7d/0x100
>>> [ 220.282592] ? do_syscall_64+0x67/0x80
>>> [ 220.282597] ? do_syscall_64+0x67/0x80
>>> [ 220.282602] ? lockdep_hardirqs_on+0x7d/0x100
>>> [ 220.282609] entry_SYSCALL_64_after_hwframe+0x63/0xcd
>>> [ 220.282616] RIP: 0033:0x7f8282a4f8bf
>>> [ 220.282639] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10
>>> 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00
>>> 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00
>>> 00
>>> [ 220.282644] RSP: 002b:00007f82683df410 EFLAGS: 00000246 ORIG_RAX:
>>> 0000000000000010
>>> [ 220.282651] RAX: ffffffffffffffda RBX: 00007f82683df588 RCX: 00007f8282a4f8bf
>>> [ 220.282655] RDX: 00007f82683df4d0 RSI: 00000000c0186444 RDI: 0000000000000018
>>> [ 220.282659] RBP: 00007f82683df4d0 R08: 00007f82683df5e0 R09: 00007f82683df4b0
>>> [ 220.282663] R10: 00001d04000a0600 R11: 0000000000000246 R12: 00000000c0186444
>>> [ 220.282667] R13: 0000000000000018 R14: 00007f82683df588 R15: 0000000000000003
>>> [ 220.282689] </TASK>
>>> [ 220.282693] irq event stamp: 6232311
>>> [ 220.282697] hardirqs last enabled at (6232319): [<ffffffff9718cd7e>]
>>> __up_console_sem+0x5e/0x70
>>> [ 220.282704] hardirqs last disabled at (6232326):
>>> [<ffffffff9718cd63>] __up_console_sem+0x43/0x70
>>> [ 220.282709] softirqs last enabled at (6232072): [<ffffffff970ff669>]
>>> __irq_exit_rcu+0xf9/0x170
>>> [ 220.282716] softirqs last disabled at (6232061):
>>> [<ffffffff970ff669>] __irq_exit_rcu+0xf9/0x170
>>> [ 220.282722] ---[ end trace 0000000000000000 ]---
>>>
>>>
>>> Full kernel log is here:
>>> https://pastebin.com/gn01DVxE
>>>
>>> My GPU hardware is AMD Radeon 6900XT.
>>>

