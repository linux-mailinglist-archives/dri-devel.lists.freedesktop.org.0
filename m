Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5C07850AE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 08:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA42A10E2F4;
	Wed, 23 Aug 2023 06:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4EA10E060;
 Wed, 23 Aug 2023 06:35:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOPxuJMBsS+VUlwvh5/vTJZ/D1m1IO+rV0D6GyF5hdYXA0MRYqFmUYi4DH5iWDvTnVzjKAU4OTtjbt3A9MuJCVQCwVQL3PBYfo5wOxhLSm4mK7UlpeUf8QRxACvoLPkLCVpEBWWru9v+seRYwqxeAsFW437lMiwAE2ayiyVIRLRiTs6VfFLYNdgc/iZWUqm0C1qqxeXxX+GqRdMmZVDRlNN0DEoWrcht2uGjVdYWG/zOkifjtY7bj2kgDcF8gM9+zGHNzYX9ktA48IYaVjt7EpcSlZgJNKmNeGaq/kRto68ekH18SSFWKIXrDhTFeqUrfKtpAjm20WpkzRwlyg/Dqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uye1FaTdWvwFzIQ/I71HrkpqW3rW7rj65SYn2zS66Hs=;
 b=H138u+pqZ13kpG6wmEXQET5IjZjV0NjShHxmd9HydzCsW0p9lmGiq5YUV3QJEkdxUE++mv8GW+H8UfOhK66J5aQX5otbrrVLgi5yXSwusa/ICZmYnzpADs1a36pqooPly1FGEXhiQ3ePLI4+QbhU73AGD2jl0Vs9COdQXj5NrhDFivcxVvk01KGhxpKoIGJH6zLzxCvkXpbloTUS46dbIh7M1aVlWDCWoZCtSUVjWjzhENkhlh988sOLaRbPZKFzQzLwxecmDyQtOfpA/B5iRoO9otFa9/qIehFY6Kb1/vd+V6HPLmy1Ke2VIPiZ3vGWl7amv0qVRwjEd6w3MGiybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uye1FaTdWvwFzIQ/I71HrkpqW3rW7rj65SYn2zS66Hs=;
 b=Fs3hCuilo9sdILcac5vAHAGc4Kx4yuytPO/rxpbMGanzU1PW4RYthCLiXC2d03v1W4EtlwuOgwT4SL7/+CYAEYSqFo/Sa5pqJUJOuiR8TJ03rfRclC3qXWZ8qJOZxergGA2T/xiwgEpoPFpcvZFl1nalAKa6WnGTvzuo8XfWylU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SA1PR12MB8917.namprd12.prod.outlook.com (2603:10b6:806:386::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 06:35:18 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6787:e196:b8dc:93a1]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6787:e196:b8dc:93a1%7]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 06:35:18 +0000
Message-ID: <f5df3e69-0668-79bc-ae10-92aec58232cc@amd.com>
Date: Tue, 22 Aug 2023 23:35:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] drm/buddy: Fix contiguous memory allocation issues
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20230821101444.119601-1-Arunpravin.PaneerSelvam@amd.com>
 <a1f422c6-728d-afae-29e1-6f091e16df7f@amd.com>
 <4fa2c0ea-d8f7-f884-0eb7-c42cad75cd02@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <4fa2c0ea-d8f7-f884-0eb7-c42cad75cd02@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::16) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SA1PR12MB8917:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e393fc6-1c32-41be-4587-08dba3a31e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fzk/9Pb6TC8zukuHQl/LWjVLxjBDujIo9nxWgG+rweuxgGe3IMKTTQ/fFyZrSSUhzgzR30ZgImAVyC5m1wG6hDm1N/6sbmRosQBuYOmfn1B2gVmksmB7qpBqSdqoEc/9ryFt1+ISSzDcuo2/eOkF9WQOKa3fYKnZp7aX3n82Vp2xUwuvXVhqoNJb1vo6husLLfztky1i+jDKstEHRfi/vxigGUfeUEMnL9NIxdnrG8FztI0DidyIQNYiVoTD8daWTX7mfptYAyIKX2p9qiOkqTUjwT+YKxsxQtI9ggX4K/8CBFcDwJ1FznWBPdRMpfvMgK4HNYUHje4aSOmXJr9Yx5IJr8TJ6d/xxgK0pzqS+BUplF3V0l+YZ/4fMo6sKqsRRPtJ7Dd850wnpnxtPfW6F6tMZ6Lu7faDLQd8+gcnsfLqFL8/4/RhsWVPoiGRq/s07PDDc/Gkiz7gWp9VGKX+vMgCIvwCr9Xr8uFjQ4aSLDL/8VnszMLkBcpR28HeJZEfQSljvoMnZdNaFJvyNF1UFnir+6RKaDQeGPxAt/UvLlyfkiMdGrve1zLwgi9xOCdFxdX34RSEEzrTBqFkWGohS33Si49BuofMJqnxfxy5aWpvcowU8vx0IlkABY2p27D0RnOhGlXYmRNq87RI+2ksmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(31696002)(86362001)(36756003)(5660300002)(2616005)(26005)(4326008)(8936002)(8676002)(66574015)(2906002)(83380400001)(30864003)(478600001)(6506007)(6486002)(53546011)(66946007)(66556008)(316002)(66476007)(6512007)(41300700001)(6666004)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2plUnNVVXUzeEFsVTRvY2VZeVlaZTk0RFYrNEpsb2QrM0FubUtXRFZnN3d3?=
 =?utf-8?B?bEVtQ3dsdlpKMzR0V2FJNFkyUVB6azVMTm1aVDVYQmg2Wnd1QVpieWhmSXNC?=
 =?utf-8?B?RVpta2pwVnVMSHpJKzBWVDNaeCt0QzY0S1QweWpUNDlMUzhjczBveU1LL3NP?=
 =?utf-8?B?MnJyWFl4eXhVb0tpbFpWdm42UjFmYklmeStMbUNxL21jenI5U000RzVXZExI?=
 =?utf-8?B?dk9oaDcxNmhTQ0NYVjBJQWFWOUtPRnhUSnYwOUZrTlJ0YWg4dWFVaHRYWmp4?=
 =?utf-8?B?NFBVNVhYK013bXIwTFFHOFpHWitCVkdYK2NqQ3NaK1g3KzNWck1LR1BIc2Vy?=
 =?utf-8?B?SkE1NS9LeHZ6RjYwYkFmZ1pvelJnVlpmTkhaRVhsN2h5THdialJ2UlBZK3Z3?=
 =?utf-8?B?RTZqZjV0YWVJaXJiVUFxNHVjQXBqM3RLYW9FdUVhaTJUUFJ6KzlrQmpxK1Rj?=
 =?utf-8?B?TzJMUm5XZzZNWnlSNTh1ellqbDlpMXNqNHlXelNoTWh4Qm5YTXhzbHBPVmph?=
 =?utf-8?B?SXR1N0ZPdWRhVVJkTVQzZDV2RVVNMGVWakl0YXhJS2FsRCtUeTU2dmUwdlEy?=
 =?utf-8?B?dGVyU3J4dXJ4RWEyYUdHUjE5Z2NoQ1pZUTAvM2VwSUp5ZnZDeEVaVzl0aDFT?=
 =?utf-8?B?NHJZaGlKUHl3b04zekNUdW82L0k0cEQ1WmlsMUxwYzdzeXNCb3dRZElNajZX?=
 =?utf-8?B?SnBnd0pFb2JLQjExYmphLzFKVXZ3WHBDVnlnZnBOa2ZEUURPdit0UHZSWWdN?=
 =?utf-8?B?S1ZlWnYyRElvb1VxT3h3a1dRVWhGYVAvVnVETEI2dG5HY0NWU2c2RXN4aFJs?=
 =?utf-8?B?VmdxelQ5NEhKbCtPS1ZyTXBCMUNFaThRTC9JS3FFc2JKaW9oM3ZXMkt1UWZt?=
 =?utf-8?B?Q0xrREc0eGd5Zjc3L3JqOFV6eXZ0TkoyM2pTNWNLbWF0cXRZS2lEY0VUdnVU?=
 =?utf-8?B?cW9HTmhOTmNkYkI0ekl4b1VXc3M4di84VHFLeGFUTWh3SE00UGl3K0NtOGdS?=
 =?utf-8?B?bE5CdGtkSTVKM1gzUmpMTXVMeEJRNE9QcW5za3dnZ1ExOTR1TGtGbEs2bzZz?=
 =?utf-8?B?bkpGSGJOWEN6ZUo3c3kwUzdyNERPQWo5RnRJaHljZXJLOUE2REFieXN3OUR5?=
 =?utf-8?B?SDBha2ZkVDEzdjVjQjRKSS9ycXJSak4yTFJTRCtxbzRKeGlCMnNZNm9udVBk?=
 =?utf-8?B?ZHdTS24yQTZtRGlRakJnajZuSkd3TmhTOXpjZHI1Y1VGR0x6Z2dzRUNFVWhy?=
 =?utf-8?B?SFE2UkxINnpNUDJtZWFpVHRHd2J6ZGlpbVNtQlJqb1hSTG1XNTBsTURoNVJu?=
 =?utf-8?B?RmtuaEZIU1ZFeDJ2T3V0bjJvSTBkd2lrNm40bmN3K2NZaXFUc3N3V0xsT2Qx?=
 =?utf-8?B?VzcyMGxKZHhDcXlWTjBLQ0FnSVFPTjgwcUM1TUdvSm91MEF2RHQyMkRraDNQ?=
 =?utf-8?B?aDRzUjlEbXdyNExkd09rRFVObUF6dUpDc0h0ZUFrUHQ5c1U4eEJPcGdnVVl0?=
 =?utf-8?B?T3JKdFBDd01MbTVoUkFXaEZ6NzlwMCs2czNNUCtPdldaaFE0ZTFJeVB5ODVU?=
 =?utf-8?B?Zlo2ay9jcHNMRUtLOVZ2dXdDMmJGazhUTzl6RlFpSnlXMFBDaTlPVURBdVEr?=
 =?utf-8?B?Rjc5SFhjMFkrVnVuem5DaVdRTklWUnJLUmh5U0xMOWFRN3REZEdYUDVjSjdW?=
 =?utf-8?B?MUdJVlYxZlNrUVptVFh0cXRGNEpMS1l1aUFscGxlTHlGTEZBQ2NDS3lTc2RS?=
 =?utf-8?B?a0didUJqZ0hlTlJxN3FnN2Y1bHhXVklvZmdoSDY2VzJpcmtOV1pkNitOU2NS?=
 =?utf-8?B?c1FFTUJiOFpwOTFDUDBSU21uY0ZLU1Z5MlVDTGRjam1JYXhjNi9vUkphMWFW?=
 =?utf-8?B?WG05QW55STVubE13OWdIU0E0VTdBSHAwMEVqWkdjdFF5WktzSkpkZE83ajVM?=
 =?utf-8?B?cEV1b1E3WUZXQWM5TWV0Rng0STZQS2UzS0Z6cHhFK0orWHcwUjNkQmNyVzVI?=
 =?utf-8?B?L1VrdDY0dGJLZkdINnl5ZW9tdDhjYTltWmJsSzF6RFpGeXpkS2NmRFNzNnJr?=
 =?utf-8?B?MlFwNU9jREpodHFXSmVYdXU5M3o0R1R6QTBDc1NIRHZuTk9OeXp1UStKMnVr?=
 =?utf-8?Q?KOWnZasNAPxpF6Li9jWvvgjr9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e393fc6-1c32-41be-4587-08dba3a31e0c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 06:35:18.5577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4vTBUZCQPstoYQ/H1NbGvshsZobRFT79jf1izNtxkBrOXcdOJ/awmMzSx1AN+SP9E0PvRBzErKV4MUA/ml2Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8917
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
Cc: alexander.deucher@amd.com, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/08/23 22:52, Christian König wrote:
> Am 21.08.23 um 13:16 schrieb Christian König:
>> Am 21.08.23 um 12:14 schrieb Arunpravin Paneer Selvam:
>>> The way now contiguous requests are implemented such that
>>> the size rounded up to power of 2 and the corresponding order
>>> block picked from the freelist.
>>>
>>> In addition to the older method, the new method will rounddown
>>> the size to power of 2 and the corresponding order block picked
>>> from the freelist. And for the remaining size we traverse the
>>> tree and try to allocate either from the freelist block's buddy
>>> or from the peer block. If the remaining size from peer/buddy
>>> block is not free, we pick the next freelist block and repeat
>>> the same method.
>>
>> I think it's worth mentioning that Xinhui tried something similar a 
>> few month ago, but that didn't looked like it would work. For this 
>> here I'm more confident.
>>
>> Of hand the implementation looks clean to me, but Matthew or others 
>> which have more background in how the implementation works need to 
>> take a look as well.
>
> One more thing I've just noticed, not sure if Matthew already noted 
> it: When you mention "fix" in the subject line people might try to 
> backport it, better write "improve" and drop the "issues" at the end.

I will modify in the next version.

Thanks,
Arun.

>
> Regards,
> Christian.
>
>>
>> Thanks,
>> Christian.
>>
>>>
>>> Moved contiguous/alignment size computation part and trim
>>> function to the drm buddy manager.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_buddy.c | 253 
>>> ++++++++++++++++++++++++++++++++++--
>>>   include/drm/drm_buddy.h     |   6 +-
>>>   2 files changed, 248 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index 7098f125b54a..220f60c08a03 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -569,6 +569,197 @@ static int __drm_buddy_alloc_range(struct 
>>> drm_buddy *mm,
>>>       return __alloc_range(mm, &dfs, start, size, blocks);
>>>   }
>>>   +static int __alloc_contiguous_block_from_buddy(struct drm_buddy *mm,
>>> +                           u64 size,
>>> +                           u64 min_block_size,
>>> +                           struct drm_buddy_block *block,
>>> +                           struct list_head *blocks)
>>> +{
>>> +    struct drm_buddy_block *buddy, *parent = NULL;
>>> +    u64 start, offset = 0;
>>> +    LIST_HEAD(dfs);
>>> +    int err;
>>> +
>>> +    if (!block)
>>> +        return -EINVAL;
>>> +
>>> +    buddy = __get_buddy(block);
>>> +    if (!buddy)
>>> +        return -ENOSPC;
>>> +
>>> +    if (drm_buddy_block_is_allocated(buddy))
>>> +        return -ENOSPC;
>>> +
>>> +    parent = block->parent;
>>> +    if (!parent)
>>> +        return -ENOSPC;
>>> +
>>> +    if (block->parent->right == block) {
>>> +        u64 remaining;
>>> +
>>> +        /* Compute the leftover size for allocation */
>>> +        remaining = max((size - drm_buddy_block_size(mm, buddy)),
>>> +                min_block_size);
>>> +        if (!IS_ALIGNED(remaining, min_block_size))
>>> +            remaining = round_up(remaining, min_block_size);
>>> +
>>> +        /* Check if remaining size is greater than buddy block size */
>>> +        if (drm_buddy_block_size(mm, buddy) < remaining)
>>> +            return -ENOSPC;
>>> +
>>> +        offset = drm_buddy_block_size(mm, buddy) - remaining;
>>> +    }
>>> +
>>> +    list_add(&parent->tmp_link, &dfs);
>>> +    start = drm_buddy_block_offset(parent) + offset;
>>> +
>>> +    err = __alloc_range(mm, &dfs, start, size, blocks);
>>> +    if (err)
>>> +        return -ENOSPC;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int __alloc_contiguous_block_from_peer(struct drm_buddy *mm,
>>> +                          u64 size,
>>> +                          u64 min_block_size,
>>> +                          struct drm_buddy_block *block,
>>> +                          struct list_head *blocks)
>>> +{
>>> +    struct drm_buddy_block *first, *peer, *tmp;
>>> +    struct drm_buddy_block *parent = NULL;
>>> +    u64 start, offset = 0;
>>> +    unsigned int order;
>>> +    LIST_HEAD(dfs);
>>> +    int err;
>>> +
>>> +    if (!block)
>>> +        return -EINVAL;
>>> +
>>> +    order = drm_buddy_block_order(block);
>>> +    /* Add freelist block to dfs list */
>>> +    list_add(&block->tmp_link, &dfs);
>>> +
>>> +    tmp = block;
>>> +    parent = block->parent;
>>> +    while (parent) {
>>> +        if (block->parent->left == block) {
>>> +            if (parent->left != tmp) {
>>> +                peer = parent->left;
>>> +                break;
>>> +            }
>>> +        } else {
>>> +            if (parent->right != tmp) {
>>> +                peer = parent->right;
>>> +                break;
>>> +            }
>>> +        }
>>> +
>>> +        tmp = parent;
>>> +        parent = tmp->parent;
>>> +    }
>>> +
>>> +    if (!parent)
>>> +        return -ENOSPC;
>>> +
>>> +    do {
>>> +        if (drm_buddy_block_is_allocated(peer))
>>> +            return -ENOSPC;
>>> +        /* Exit loop if peer block order is equal to block order */
>>> +        if (drm_buddy_block_order(peer) == order)
>>> +            break;
>>> +
>>> +        if (drm_buddy_block_is_split(peer)) {
>>> +            /* Traverse down to the block order level */
>>> +            if (block->parent->left == block)
>>> +                peer = peer->right;
>>> +            else
>>> +                peer = peer->left;
>>> +        } else {
>>> +            break;
>>> +        }
>>> +    } while (1);
>>> +
>>> +    if (block->parent->left == block) {
>>> +        u64 remaining;
>>> +
>>> +        /* Compute the leftover size for allocation */
>>> +        remaining = max((size - drm_buddy_block_size(mm, block)),
>>> +                min_block_size);
>>> +        if (!IS_ALIGNED(remaining, min_block_size))
>>> +            remaining = round_up(remaining, min_block_size);
>>> +
>>> +        /* Check if remaining size is greater than peer block size */
>>> +        if (drm_buddy_block_size(mm, peer) < remaining)
>>> +            return -ENOSPC;
>>> +
>>> +        offset = drm_buddy_block_size(mm, peer) - remaining;
>>> +        /* Add left peer block to dfs list */
>>> +        list_add(&peer->tmp_link, &dfs);
>>> +    } else {
>>> +        /* Add right peer block to dfs list */
>>> +        list_add_tail(&peer->tmp_link, &dfs);
>>> +    }
>>> +
>>> +    first = list_first_entry_or_null(&dfs,
>>> +                     struct drm_buddy_block,
>>> +                     tmp_link);
>>> +    if (!first)
>>> +        return -EINVAL;
>>> +
>>> +    start = drm_buddy_block_offset(first) + offset;
>>> +    err = __alloc_range(mm, &dfs, start, size, blocks);
>>> +    if (err)
>>> +        return -ENOSPC;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int __drm_buddy_alloc_contiguous_blocks(struct drm_buddy *mm,
>>> +                           u64 size,
>>> +                           u64 min_block_size,
>>> +                           struct list_head *blocks)
>>> +{
>>> +    struct drm_buddy_block *block;
>>> +    struct list_head *list;
>>> +    unsigned long pages;
>>> +    unsigned int order;
>>> +    u64 modify_size;
>>> +    int err;
>>> +
>>> +    modify_size = rounddown_pow_of_two(size);
>>> +    pages = modify_size >> ilog2(mm->chunk_size);
>>> +    order = fls(pages) - 1;
>>> +    if (order == 0)
>>> +        return -ENOSPC;
>>> +
>>> +    list = &mm->free_list[order];
>>> +    if (list_empty(list))
>>> +        return -ENOSPC;
>>> +
>>> +    list_for_each_entry_reverse(block, list, link) {
>>> +        /* Allocate contiguous blocks from the buddy */
>>> +        err = __alloc_contiguous_block_from_buddy(mm,
>>> +                              size,
>>> +                              min_block_size,
>>> +                              block,
>>> +                              blocks);
>>> +        if (!err)
>>> +            return 0;
>>> +
>>> +        /* Allocate contiguous blocks from tree traversal method */
>>> +        err = __alloc_contiguous_block_from_peer(mm,
>>> +                             size,
>>> +                             min_block_size,
>>> +                             block,
>>> +                             blocks);
>>> +        if (!err)
>>> +            return 0;
>>> +    }
>>> +
>>> +    return -ENOSPC;
>>> +}
>>> +
>>>   /**
>>>    * drm_buddy_block_trim - free unused pages
>>>    *
>>> @@ -645,7 +836,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
>>>    * @start: start of the allowed range for this block
>>>    * @end: end of the allowed range for this block
>>>    * @size: size of the allocation
>>> - * @min_page_size: alignment of the allocation
>>> + * @min_block_size: alignment of the allocation
>>>    * @blocks: output list head to add allocated blocks
>>>    * @flags: DRM_BUDDY_*_ALLOCATION flags
>>>    *
>>> @@ -660,23 +851,24 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
>>>    */
>>>   int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>                  u64 start, u64 end, u64 size,
>>> -               u64 min_page_size,
>>> +               u64 min_block_size,
>>>                  struct list_head *blocks,
>>>                  unsigned long flags)
>>>   {
>>>       struct drm_buddy_block *block = NULL;
>>> +    u64 original_size, original_min_size;
>>>       unsigned int min_order, order;
>>> -    unsigned long pages;
>>>       LIST_HEAD(allocated);
>>> +    unsigned long pages;
>>>       int err;
>>>         if (size < mm->chunk_size)
>>>           return -EINVAL;
>>>   -    if (min_page_size < mm->chunk_size)
>>> +    if (min_block_size < mm->chunk_size)
>>>           return -EINVAL;
>>>   -    if (!is_power_of_2(min_page_size))
>>> +    if (!is_power_of_2(min_block_size))
>>>           return -EINVAL;
>>>         if (!IS_ALIGNED(start | end | size, mm->chunk_size))
>>> @@ -692,12 +884,21 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>       if (start + size == end)
>>>           return __drm_buddy_alloc_range(mm, start, size, blocks);
>>>   -    if (!IS_ALIGNED(size, min_page_size))
>>> -        return -EINVAL;
>>> +    original_size = size;
>>> +    original_min_size = min_block_size;
>>> +
>>> +    /* Roundup the size to power of 2 */
>>> +    if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION) {
>>> +        size = roundup_pow_of_two(size);
>>> +        min_block_size = size;
>>> +    /* Align size value to min_block_size */
>>> +    } else if (!IS_ALIGNED(size, min_block_size)) {
>>> +        size = round_up(size, min_block_size);
>>> +    }
>>>         pages = size >> ilog2(mm->chunk_size);
>>>       order = fls(pages) - 1;
>>> -    min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>> +    min_order = ilog2(min_block_size) - ilog2(mm->chunk_size);
>>>         do {
>>>           order = min(order, (unsigned int)fls(pages) - 1);
>>> @@ -716,6 +917,17 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>                   break;
>>>                 if (order-- == min_order) {
>>> +                if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
>>> +                    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
>>> +                    /*
>>> +                     * Try contiguous block allocation through
>>> +                     * tree traversal method
>>> +                     */
>>> +                    return __drm_buddy_alloc_contiguous_blocks(mm,
>>> +                                           original_size,
>>> +                                           original_min_size,
>>> +                                           blocks);
>>> +
>>>                   err = -ENOSPC;
>>>                   goto err_free;
>>>               }
>>> @@ -732,6 +944,31 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>               break;
>>>       } while (1);
>>>   +    /* Trim the allocated block to the required size */
>>> +    if (original_size != size) {
>>> +        struct list_head *trim_list;
>>> +        LIST_HEAD(temp);
>>> +        u64 trim_size;
>>> +
>>> +        trim_list = &allocated;
>>> +        trim_size = original_size;
>>> +
>>> +        if (!list_is_singular(&allocated)) {
>>> +            block = list_last_entry(&allocated, typeof(*block), link);
>>> +            list_move(&block->link, &temp);
>>> +            trim_list = &temp;
>>> +            trim_size = drm_buddy_block_size(mm, block) -
>>> +                (size - original_size);
>>> +        }
>>> +
>>> +        drm_buddy_block_trim(mm,
>>> +                     trim_size,
>>> +                     trim_list);
>>> +
>>> +        if (!list_empty(&temp))
>>> +            list_splice_tail(trim_list, &allocated);
>>> +    }
>>> +
>>>       list_splice_tail(&allocated, blocks);
>>>       return 0;
>>>   diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>> index 572077ff8ae7..a5b39fc01003 100644
>>> --- a/include/drm/drm_buddy.h
>>> +++ b/include/drm/drm_buddy.h
>>> @@ -22,8 +22,9 @@
>>>       start__ >= max__ || size__ > max__ - start__; \
>>>   })
>>>   -#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
>>> -#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
>>> +#define DRM_BUDDY_RANGE_ALLOCATION        BIT(0)
>>> +#define DRM_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>> +#define DRM_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>>>     struct drm_buddy_block {
>>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>> @@ -155,5 +156,4 @@ void drm_buddy_print(struct drm_buddy *mm, 
>>> struct drm_printer *p);
>>>   void drm_buddy_block_print(struct drm_buddy *mm,
>>>                  struct drm_buddy_block *block,
>>>                  struct drm_printer *p);
>>> -
>>>   #endif
>>
>
