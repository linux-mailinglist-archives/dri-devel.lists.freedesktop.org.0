Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B93846C9CD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 02:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA206E038;
	Wed,  8 Dec 2021 01:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10166E02C;
 Wed,  8 Dec 2021 01:09:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8rbP87acFr0x1o2uayOpjJzs0ISPgJhxKD8/q8uymMv75kcVcjKTv3ilctR1YLQnpDw3OznXKU0/WsMHKBUfVhb4VT5GiXaYDQVxf0g36fm9SzemM9iHzqeynFKROsYcB3nBN2jGEa/mTtvp6lU/dcEmrx2/YxT1K1HzIiDKIr77sG1G45zBtycbA7ElgbBMlGZMJNHMvAC+LlZOxS1OGfGfhI81oqIs959iKltjAvpK2hSR+wavkmD9t6B8kaMClXD7wY7+uQhV873mwnvUOgGIllIJrKhFfaN0C5tXKq/NqxQT54bSIITn+Ks83UEonPikj6nKALQhjFBqXGISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvzjBUg2SPSZKJEmiNu27d7I7qdlLHGZqsuFuo4IfJc=;
 b=GWYKL3TWpD0yeRJjJj62qfyb5m7blifo/w4VHBf/dOT1eMunaetq8ZyrPueXUcaChTttBz+pPziM+5cYWKqpFTU5fqyYwudw2bd0BdHPLMxvdVXBXhI9a0Vkphn6CVlEsWFX3Ob6v1PgyOCHN/oMoqXbvIEBOMx+fowA4nJ/peIOnZtgekwYTewy14Lhg5iSlBCqKGfUp48IDwh6wT9NIwf4o/PwdsDMEm9WBPxEKn/nv4cQq9Ek6U5uO0ecYSbRVGuNkqbv4g0EbUfVLY3Jj7ESGjMKK5Y7qk9xSqBuI6ZyCWzIa2rs5TR5njWPfjsl8ucGDqBnXv5IUbVwqE/mXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvzjBUg2SPSZKJEmiNu27d7I7qdlLHGZqsuFuo4IfJc=;
 b=PYUjAT1KqozeZaroUI1pB8oCB4TJRtWAvONKoHW19Wu8psjgvBV9/4vCSyV70toLSCTtN/Ul2ajpdE/h/SqKXDkNu29BbztnfZtHoYvWh/EZJkKCGOYemx50IagyqZibamJrKvbEtOq93wkUQdp4MHFhKWtiRDVY4L+BxMBjjUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5033.namprd12.prod.outlook.com (2603:10b6:408:132::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Wed, 8 Dec
 2021 00:54:54 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%7]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 00:54:53 +0000
Subject: Re: [PATCH] drm/amdkfd: Fix a wild pointer dereference in
 svm_range_add()
To: Qingyang Zhou <zhou1615@umn.edu>
References: <20211130112644.116604-1-zhou1615@umn.edu>
 <b78771ca-2ca2-a369-b67f-dc479eb87d90@amd.com>
 <4a457ba1-67df-993f-1a7a-9868a954de99@amd.com>
 <CA+Cm_xSm8O_0M2Ng9mvDUKwYaCxkZU+M7AZ=9aU26WTFELC-2w@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <4a5ba56f-bd6d-2dfc-266c-31b22c5e9a09@amd.com>
Date: Tue, 7 Dec 2021 19:54:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CA+Cm_xSm8O_0M2Ng9mvDUKwYaCxkZU+M7AZ=9aU26WTFELC-2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BL1PR13CA0320.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [172.27.226.80] (165.204.55.251) by
 BL1PR13CA0320.namprd13.prod.outlook.com (2603:10b6:208:2c1::25) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 8 Dec 2021 00:54:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67a5a1ea-3f99-4c07-9702-08d9b9e5589f
X-MS-TrafficTypeDiagnostic: BN9PR12MB5033:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB503310A6A0B89D8D44F0A2EA926F9@BN9PR12MB5033.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gaGr3THyrCJzvb8gI5PRAAXOzvbdzhsYtqs90rZeETEZMTTh2Ay7IQLLMCCpLM3uPBLdKGM8OyVjHTtrmm3a789WG/9ruylPW5EaFLsEVULE860HIcHyn65vE5Jqtf8/Si1aVsU3DHN+OYrv9Bs5x05dFyxAPYbEDYN/wqpXs0SUuOgHgkzt0VNu0jpVgkLIYPtbacaCQaR6e0R3VvD1COaExd3j63Q0Kj/Kne8tnA11WBkE7vKvQxanPNLcKr5Ph5kl8YGfxig0Gg3K/8HlVbep1jyHZAHM1q5g/OGDCx7WiZeK7HH6byjRYXuzef2EdlD9HlxjjWpuYB2a1WsWfmG41GKuDSe0r1Yu/XAUegPb1dyZPDXxDAz32szzWWiQc+t8V/J5CcTKaVzuv0clIybLVRYf2pP7yYg2Vyz4n73V/F8iQ1SEgCtx4pIAlFE2uhkzd4fFOU1shZBb2bKJn+nBMlhsXK0Rjym2OS86kL8ir+pKj+KlKwtrh286nA+rIF9b66xBhKMSDNqRGti3b3oqUZRy1CzGXDztgmhPziQ2I0kcXRRX/weOgnEcJagzbXFmToT2Z4vuL/dN/OYroCcZSOJg+mmUy0X3jVGE+OeeMwanY0OrDsV42G1PghhSNM1ScDyLobqyQmJdYpOYxpaOr9ZojjSF4YILLcJPnpI+vNkjwXQAU9wRR/Sr+ufqAj9aMYAhrwpw6vPEJec3k1Y9ETaY32AT5rATJWwK8IM+0LpeM/bhP3S27jz18yov
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(38100700002)(86362001)(8936002)(5660300002)(6486002)(66476007)(66556008)(66946007)(4001150100001)(8676002)(6916009)(83380400001)(2906002)(31696002)(4326008)(53546011)(508600001)(31686004)(316002)(2616005)(44832011)(26005)(36916002)(956004)(54906003)(186003)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3ZSd2tkQWlqZFRJVUk4ZFpkWHZKTCtadFpVbzFyYXZxWEdNaHo1MTMxbzJn?=
 =?utf-8?B?TUJ2dnE2L1hyK2VYVVpkOVd2alJBQVhOZU55aTBsYUplVmpvSmpxT1hqLzdw?=
 =?utf-8?B?Y3E4bFdYMnk1aWFXYlJkclJJeUcwZEE1MUJJSGI3bEIwM2YrL1ROeG1ZbFpw?=
 =?utf-8?B?eUszUzBPd3RpbXZQVHBaS3AwS3NvSHE0Nk9TVjBBRVZLQ09pNEtkcDgxS0ha?=
 =?utf-8?B?bVo3ckhzdkIyR1M2ZlcyOXdPT2w1Uy9kMU5wZVdPUXcwcGFSMEowTUQ1MDFK?=
 =?utf-8?B?TFhqZWpjYVBXTXRKVHhrbWtueW04b1UrdkovbzVxRlhSMUdtbWZKT2tkMXlp?=
 =?utf-8?B?anlLZHFGTHVBM1BHNUFlV1pvNU1WUXBXNzc5SFFVV3ZDdXpLZXhjK3hXbXVL?=
 =?utf-8?B?YXZhM1h1c2dkTFl3YTBmM0xFbUt5MWlxRk44ZVBQc0ljd21hS3FWWTJvTytX?=
 =?utf-8?B?WTFWYnovTkFjQnp6aVlBU2FUcWN2YlZ6Zy9ORUk3MEo1Rm9Ja0dkeEhKZTZj?=
 =?utf-8?B?Y09BenlvS0p3VVJXTVBBRGFsSHhHUmI0YkpPUzZIUlF5UGdEMDZEK2FEV2JR?=
 =?utf-8?B?c2FyTkxUZTlhSGluMk5YanBaMEJ2RUd6S0kwRWVqOUhiY2p0RTgrUUVmVjlr?=
 =?utf-8?B?dmtoamZIeEFzaU11WXZoeHNxcWF6VXpyQ2ZkZU94cEFUalBQQzhET3RKQ0l3?=
 =?utf-8?B?cXZ4QWNwaXUzaWttNGJsY2tFVFJBcDA5SFZhSVV1MVVLMmVHV21ZaW1LQ1Y2?=
 =?utf-8?B?RmlCRVlEUEwyTEZJTjFCVUdjMmsrUm11RjhVdEVMalVwMHY1VGdkeGhvMUha?=
 =?utf-8?B?NzlBN3VsM3ZvWFZXSE5TK2FHNjdNWFA5Slc4Tk4yQklIdmdlZFpqSHlCVytZ?=
 =?utf-8?B?U0pudmxNU1FBSUN3RTR4VURJa3liRXFYWWxtd3lGQ2YzRzkrVzU3NHROWmRY?=
 =?utf-8?B?MzBLdktSRHY2SWQwa0FZMDh5WmllNldmcmRpLzVwOEdmOCtpYjVHTm9PRk5w?=
 =?utf-8?B?aFJSczIvQzdya1UwbzdqdGxFTWNCNjcvU2Z1N0dIOWNWNE54Qm5hVkozK3JQ?=
 =?utf-8?B?cVZXb3JYbm9oZVhmUVBINFB5NjUzZHRYVnR5TkhuUkhoWERwSWtDUmd2YTRO?=
 =?utf-8?B?bCt0UkZzREY4S0YrUlRMcWprL2w5TjBvN21RQ0hOcisrZE80R2RCYXJBUmJr?=
 =?utf-8?B?RFM3bDdvWDVmNTFwcS82a1VWc0R4K2d4R2R6THNaSG4xL29CeWxiaG9qUzE5?=
 =?utf-8?B?aHdpcnBURGc5T2lVbnhTM1lhdkt2YzFYWFI1QTQ2TUhTT0VCTE5EVEtFbXpY?=
 =?utf-8?B?S3RkandWcEVZdHFMcVdudFc5QkJVRmlrSlBpT2hWTnR3ajNSZGJoZGs4Y1RU?=
 =?utf-8?B?SGR6TnM1UVhEMVVGMjJqTGtqY1ZxQURUUzhYVzJsRzZsUHNlV2ZqYzlnMWZi?=
 =?utf-8?B?WUFobEhYQUpZbStSd3V1bmJ6SWcxN1VIM3J6bHlmclhKQkF3K3NyejVTNjRW?=
 =?utf-8?B?c3VxYmlXLzMwZE1lWWg3VHluc1pobjAxT1ZTTyt3T3pHTHdNdW5QYnJocUlT?=
 =?utf-8?B?TUF2WnZJQ1JVLzN5RGxkSDFiZUdyNHM0OWs0RnQ0b1g3REZLcHZqdFhpSzlZ?=
 =?utf-8?B?Q0xHMW9jMER5VmU3blVNcEpNMWFUUjR6c05rbXJVNzJDUjkvM1BBV0tqUUlD?=
 =?utf-8?B?ZDArR2VzMHhsSStaRzcxWEVsN3FsT2E1VGVVV2Vidm5qamU4RGlPWEU5UWlC?=
 =?utf-8?B?S21LUjFBR2IrQlhQMGt4MG1KWG15cGZ0QkxMSXh3NFNYeERTMGoyYmZSaFF2?=
 =?utf-8?B?R1luVmlaZ01LelZ2NWtBSnVoc0N4cmFNS2dySVFRSHdzamZRTHpGTGdOUlNa?=
 =?utf-8?B?dnpHa3BjdlNtUGEzYUVnNXJxcEd4WDcvTEdMTmxoYmRMNUcwZ1BVNHUyT2Jt?=
 =?utf-8?B?cUd5dWx2NU5VK2NmamE3TnBuTlcxYTMrUDBqaWh5QkZKczl5RjVoUVJEckhy?=
 =?utf-8?B?bmhzaXdZSTc3dSt3d2RxL05vNXhuNEtPeHhlZWFrQk5XNjA0SThaN1Blcnkz?=
 =?utf-8?B?U3EzRlA1Ni85eERTV2ZybDF3RlFEaktZOGRXN2QyclRKeTdIU0QxV2c3MlQy?=
 =?utf-8?B?bFJPRy9QS1B0ZFBWWmthWCsvUjJXTHdTdndwTHh3SFdIY2gvWFVjd29LZ0Fa?=
 =?utf-8?Q?SzQeyroPMqVnOgOaZDrjlDM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a5a1ea-3f99-4c07-9702-08d9b9e5589f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 00:54:53.7379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjKVEWSc999DSOoUk8kFMW8E7E3sQySFeUjOl+0k1Af9xtGVQ+jjJx36Y+VFyoKTQkCAIic5h5un4I0O+mUZig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5033
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, philip yang <yangp@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-30 12:49 p.m., Qingyang Zhou wrote:
> Dear Felix:
>
> This patch is not auto-generated, and as a matter of fact, it is 
> requested by the Linux Community.
>
> As you can see from my email address, I am a researcher from the 
> University of Minnesota, and because of the unpleasant event that 
> happened in April, all the patches from our university must contain 
> enough information for the Linux Community to verify. Still I feel so 
> sorry to take up your time.

Hi Qingyang,

Sorry for the late response. I was about to apply your patch when I 
realized that it's not unwinding things correctly in the new failure 
case. I think I'll refactor svm_range_add and svm_range_handle_overlap a 
bit to make sure the unwinding is handled correctly and only needs to be 
done in one place instead of two.

I'll copy you on the final patch.

Regards,
   Felix


>
> yours sincerely,
> zhou qingyang.
>
>
> On Wed, Dec 1, 2021 at 1:35 AM Felix Kuehling <felix.kuehling@amd.com 
> <mailto:felix.kuehling@amd.com>> wrote:
>
>     Am 2021-11-30 um 11:51 a.m. schrieb philip yang:
>     >
>     >
>     > On 2021-11-30 6:26 a.m., Zhou Qingyang wrote:
>     >> In svm_range_add(), the return value of svm_range_new() is assigned
>     >> to prange and &prange->insert_list is used in list_add(). There
>     is a
>     >> a dereference of &prange->insert_list in list_add(), which
>     could lead
>     >> to a wild pointer dereference on failure of vm_range_new() if
>     >> CONFIG_DEBUG_LIST is unset in .config file.
>     >>
>     >> Fix this bug by adding a check of prange.
>     >>
>     >> This bug was found by a static analyzer. The analysis employs
>     >> differential checking to identify inconsistent security operations
>     >> (e.g., checks or kfrees) between two code paths and confirms
>     that the
>     >> inconsistent operations are not recovered in the current
>     function or
>     >> the callers, so they constitute bugs.
>     >>
>     >> Note that, as a bug found by static analysis, it can be a false
>     >> positive or hard to trigger. Multiple researchers have
>     cross-reviewed
>     >> the bug.
>     >>
>     >> Builds with CONFIG_DRM_AMDGPU=m, CONFIG_HSA_AMD=y, and
>     >> CONFIG_HSA_AMD_SVM=y show no new warnings, and our static
>     analyzer no
>     >> longer warns about this code.
>     >>
>     >> Fixes: 42de677f7999 ("drm/amdkfd: register svm range")
>     >> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu
>     <mailto:zhou1615@umn.edu>>
>     > Reviewed-by: Philip Yang <Philip.Yang@amd.com
>     <mailto:Philip.Yang@amd.com>>
>
>     The patch looks good to me. It's an obvious bug and definitely not a
>     false positive. The patch description is a bit verbose. Is this
>     auto-generated output from the static checker? It could be
>     replaced with
>     something more concise. Especially the comment about this possibly
>     being
>     a false positive should not be in the final submission.
>
>     Regards,
>       Felix
>
>
>     >> ---
>     >>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 3 +++
>     >>  1 file changed, 3 insertions(+)
>     >>
>     >> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>     b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>     >> index 58b89b53ebe6..e40c2211901d 100644
>     >> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>     >> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>     >> @@ -2940,6 +2940,9 @@ svm_range_add(struct kfd_process *p,
>     uint64_t start, uint64_t size,
>     >>
>     >>      if (left) {
>     >>              prange = svm_range_new(svms, last - left + 1, last);
>     >> +            if (!prange)
>     >> +                    return -ENOMEM;
>     >> +
>     >>              list_add(&prange->insert_list, insert_list);
>     >>              list_add(&prange->update_list, update_list);
>     >>      }
>
