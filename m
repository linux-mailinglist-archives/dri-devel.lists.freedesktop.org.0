Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509BA739845
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 09:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7842910E4DC;
	Thu, 22 Jun 2023 07:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A13710E4D9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 07:39:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXxwbVANJWXHv4CxLKxg5RmxNt1YVCLQyasjfJgd6rMkPeaf2nyZ4E32kgy3D5TKntFMXhNJ0jTRiALk4zJg987r0atg0Pgf9W2w7PXVc6iuBRoupXDHPvXbn75oWw1pyngVY3hB0AznsnKaWxwa49vMSPE9GE+TItwAUkshzpab0/AgJZc0cY1XwLQZ2PfOItfe/LaPqA7RDU/TrG9/bb61K/c08htWoA3mHDe/w5Bepa55AMeV9mt/0WFnjLzpIUgBETzVu9FAatM6Nkv90fVIRAXPhTGTR9nzIC55/SBgQqY0WfNFjbfp5WhHKxTKhlJaxV9RkZFF6BpzOxGNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYLrYvO6sNyxF2iH0pivVQ5Poq6Y63Qzd7BYWBRql7g=;
 b=Z0z15lfydBCclt1Fd7eZ3RIqJqPedzJrrbB/fAGWzR/cg58S9wQE6xVvykGqYPlgJ45gtjT/T1l29pwp5yX1BzLrCmF1T1eHFwn5a/tau6rSl83lTJqMCoXt5IcGg5Acuiw1FDiCz/Ka/p9BnnLYDaGik8ObcPiboBbVKXPr3FGAJ9+rHPvr/GxR/45Sdfk2aRAZv5pfMhcgKFFi3eIqf7PSBYmIz6Afg0PowaA/vSkojnyQLhC9Te667CNCCmH9YhE4KEs2fSV9uL0BiwaxiepBsVJ6mtIkHL+TSw3HX7KPbX0MYtQhIrDQQkq+p6jJVZ73fidw3jITmk+joyZC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYLrYvO6sNyxF2iH0pivVQ5Poq6Y63Qzd7BYWBRql7g=;
 b=ceS9/1VcP9hnDAKGZeV5+FrJ3MOWVGVs4AFhpJdsLbvVrVsmfCfvh2qLmgKvwTmXIsaa/76alUMh7Zs1PEJB2D+SJBK8X2sZlIAXpuaQMG3dah3NT9fFlF+GxzMqkBEigMTJ1XoZGu5XiQaf7e8k+u5B2lzqIUrnVD/FvBih/gE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6175.namprd12.prod.outlook.com (2603:10b6:208:3c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Thu, 22 Jun
 2023 07:39:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 07:39:28 +0000
Message-ID: <1c71ea03-af46-18eb-0698-9a1c771671c6@amd.com>
Date: Thu, 22 Jun 2023 09:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/amdgpu: fix missing fence reserve in
 amdgpu_vm_sdma_commit
Content-Language: en-US
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org,
 Alexander.Deucher@amd.com
References: <20230621162652.10875-1-Yunxiang.Li@amd.com>
 <20230621162652.10875-2-Yunxiang.Li@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230621162652.10875-2-Yunxiang.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0213.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: 3664e6ab-0ec1-4696-82b3-08db72f3cee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6QsPD9oNd3sV3PBtKpcjCpSCPd5yQd3a4oY2ClscLFZc3rafMWt83vkYItsgO/73BqicEonhkC6AL8G86Z3yWjWQuXMqRR5g87bDbDmfAJfac1c8cxJBhJYEaqCHeAUOZMb32HWUnlLtEO2aGWEtarE/j+uPu5EzrRgxnrBxvZR7NYdAJiERkYxKwL2Y24vJvx1Yqig9ZKb3jWKzgTtMmFaDWP2PLxwIZW8+iILBkHRI0rcsfQqlEXG48SS8o/E1hVVGyVj7dmT2wv2HQoTgZuJDfdWyRPyfYMEb91LltHOLqaS/RLN3HsD3xfvvT8tL5J+0dJ6kMVLsYgtr/rE7INcLgR99737JzNuraHFmpmqAiXx3kakditzU+XKULpLWMzsEM7BseyFJAt1kN6BELO88Y5r/1OY+D53p3YVGjOpLhdH1HMI5sruKIvbL1UQPWEtFoWuwcYZsEWctsuyWtGgImz9JSNqcgOiaJj8BNqDiSw4M5h7NX/sCS9chfUmKpNxx0r9m53srdc+AEMMSGBKH3hsqV0ABvvgSIbmn2xokrYtz0gblM6NZDo2qzFZurzS/9AQt3tWL8rGqLjrhi5GC0pvVQBbs0j2GX6t6UvIrbkxLd4kcezeF3wTABHmyfdR7mxP7Zt5CoiE+iZrpEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(38100700002)(478600001)(6666004)(2906002)(6486002)(5660300002)(6636002)(66946007)(316002)(66556008)(66476007)(41300700001)(8936002)(8676002)(2616005)(83380400001)(6512007)(186003)(6506007)(31686004)(86362001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWZuSkVFa1BEdjU2aDZ0SCtyN0JOVnB6MUNPL1NELzZJalFZSWt3czVFVTR6?=
 =?utf-8?B?cEE0TjJrN2Fxd2g4aHYreFc1cjduQTBNTTNMMnFEL1R1RENMTEFFS3AvL1pa?=
 =?utf-8?B?d0ZManduS0s5K0FyM1hQcGFlRGJDekpzU1B6WGxrOXR4bnF2Q2hnUVdsRVFo?=
 =?utf-8?B?VjdHRmF2Ty9MaGZKL215RlFlSk92Q0RjNk1FY0IzMHVGOUJITHpyak8rS1NR?=
 =?utf-8?B?VGIrRkNYZzhCQkd5WGprenZ3SlRMQ0xTZUFFYTdENWtnQy9uMGFNMHRKZmFL?=
 =?utf-8?B?dTY4aEpOR3UzdThJdWJmVHNhb0M0a2VuMWZzTW1XdTYrMHBwTEhqbTdUcHZ1?=
 =?utf-8?B?V2xOc0FHeVJmbnYzTzYyQWIyZVM4bWg4TjJMVC93TEJWYTBxZzBDbGNLMzdN?=
 =?utf-8?B?SXRpRHpyMWJsRE5RRXZEdUs2VWJjbStpUUVOVk5uUHIyUjlsQUtzdG1aMU9S?=
 =?utf-8?B?dklFVTU1WEpreVNxcUNpWXlJeEQ0NHIwbmwrSWdJR1kweUdNYWZpL2Iva1BQ?=
 =?utf-8?B?bEoyNkJxOFhlMklxWXUyb3Vzbk1XMSt4bXFTOURtS25OQ01TejJVT0VXV3Fq?=
 =?utf-8?B?UFdicVl4bHMzUzJETXhTNUx1bU9Rb01xU2JDdlVkV1ZzQ1FucU8xN3NXTG5y?=
 =?utf-8?B?bE5pbEl3bnRtV3pHTXo2dkpCM2tpaHRrTlBlMldSenNQblZUSnRHaHUzSkRq?=
 =?utf-8?B?YStYNGpZVFZSU2tvRm4wcmtYaGQwSkJTMU5YUEo2ZGFWeEFJU2VoSUk5M0JQ?=
 =?utf-8?B?ZXFIWjZYYzBzZVF4WTUxeTF4bkVHVDhKaURnYXRTWHJYYUVDYnpoQlp2SEJl?=
 =?utf-8?B?Ly9OT2FwYTV6aVZuN3c1ZjMxZGdzSlZoTU9ZR3RTc3dielpjS1lyRXQ0Zm5P?=
 =?utf-8?B?UWowenR4bUNDd05VYmpQYkJ3TkZPM3Ztc09PK1ltUHc5RkRUSkRrQ0FCbXg2?=
 =?utf-8?B?T1Z2QnFmcHgySGZKVytvbllpSTk4VDNScGt3Skt6dXpLOTNqWmFFVmFPSnI2?=
 =?utf-8?B?eEliV3hvd1F0V05VSThpODJSUXdzVVlTMVpqQXUwdVhOQ0E3cmcxL3Y0YVJV?=
 =?utf-8?B?TEl1N3RvWWhiVlpVM3YxZFJyWjJXcTlVR1puQkdUd3lhQnYyR3FrbWU5THZa?=
 =?utf-8?B?K01vL0xqMXM4dmoybEpxbUt1dm54U1ZYWU5ZdW5Gc1BnUmw3SDk4U3VJRUE3?=
 =?utf-8?B?cjVDNTFRclo3RkJvQWJJZGZQOVlnOWt3L1V2VTloUkpkcFlMYzZsRkh0M2ww?=
 =?utf-8?B?L2dwZENRaXpNeHh1Rkc2WUJZOGl1VVBWRkw0R0FyVXZzekJKZS81M0hKY2Nq?=
 =?utf-8?B?bzNwa1FWQ2U2ZDVIZ1FHMnY1ZFByWkw4MjJ1b3dFL3h3c2kvQUZlb0RvN1hy?=
 =?utf-8?B?V2QraURoMjNud2p4cWU4SVRtdEh6czRxZCtrYUpXMHloeUIyUGRpR1lqNXRs?=
 =?utf-8?B?ZE5QOHhzRlg0ZjFXNmhLbkIzYk85TnlLZzQ0M3lRYzlLMnNEQ3JNZTFQWHRw?=
 =?utf-8?B?Ym44U1FlTXJoNGVIcE5WVTgzanR5OFNLSDVLdHJPUWUyVW1RNGppYm14ZzVW?=
 =?utf-8?B?UkM0VUd0VVNER0FSTXdGQWV3OWdsU0dHOEwxU1Rlc2hiUCs0ekJ5ZUxIeW55?=
 =?utf-8?B?WE9QSllWSFdFZDhVdDJQN0NkcDE0bXVTV2drSG8zQnhDQWdBTFNPYnFpWCtZ?=
 =?utf-8?B?Q21sMkJlKzBGNTVrc1RGNFFZM3dBdzlUbWQ5WklXMzA1Szljb0JRMFFyd0lk?=
 =?utf-8?B?NjQ1aEIyOC9hUHMyeHo3UUQ1NWxsbVFOR1ZVR0xOWWl0cXBab0k3M2s5UEVB?=
 =?utf-8?B?bU5oVFFqbExFN3FYN1hsTGMrMWFpR3hXdjVaNGRlQklkdkJ5U09MS3EyZjBs?=
 =?utf-8?B?elhoYW5DYnYzb21uOTZ4UWROQWE4ZmJKb0hIcm9vS21aWk1VcHYxak5UMnE2?=
 =?utf-8?B?RmE1OHkvbnNQWlFLMnZLODVNZURhOW9qR0ducVdXakR6WUFLZWt6a2dNZWxY?=
 =?utf-8?B?WlpIaEVRbDBlUDY5SHRJVUFvLzFzYnRyTHJGOWJYM28xQlZtTmlKZVhINU9Y?=
 =?utf-8?B?azBqNFFSYkFwVnlFeHZ6b3ZUbVJWdjRFSlRHQnZUMjhycFpneHU3dFVjZzcv?=
 =?utf-8?B?V1pEMW5LMEtUanNzR0xLaTI2eStPZ2xPTU14Q1hsb04rT2plaUF1UjNOQkFQ?=
 =?utf-8?Q?C6s0Bh/3BuPuSKlh484DSXTRWARemVJjb9SYAkuhKAbn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3664e6ab-0ec1-4696-82b3-08db72f3cee2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 07:39:27.8755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3P+d8e2FrIXdtOJpUq+Wxpv5TbrTdsSxXqxyaasHPM4cCXIyOkov+crLWAqUa46
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6175
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

Am 21.06.23 um 18:23 schrieb Yunxiang Li:
> When amdgpu_bo_fence is converted to dma_resv_add_fence, the reserve was
> removed in that process, so putting it back.

The slots for this are reserved in amdgpu_vm_get_pd_bo():

         /* Two for VM updates, one for TTM and one for the CS job */
         entry->tv.num_shared = 4;

The problem here is rather that we didn't took the gang submit into 
account. See my patch earlier this week I've CCed you on.
.
>
> Fixes: 4247084057cf ("drm/amdgpu: use DMA_RESV_USAGE_BOOKKEEP v2")
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index 349416e176a1..f590b97853d9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -120,6 +120,7 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
>   	struct amdgpu_ib *ib = p->job->ibs;
>   	struct amdgpu_ring *ring;
>   	struct dma_fence *f;
> +	int r;
>   
>   	ring = container_of(p->vm->delayed.rq->sched, struct amdgpu_ring,
>   			    sched);
> @@ -135,6 +136,9 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
>   		swap(p->vm->last_unlocked, tmp);
>   		dma_fence_put(tmp);
>   	} else {
> +		r = dma_resv_reserve_fences(p->vm->root.bo->tbo.base.resv, 1);
> +		if (r)
> +			return r;

That is simply illegal and would potentially lead to memory corruption.

Regards,
Christian.

>   		dma_resv_add_fence(p->vm->root.bo->tbo.base.resv, f,
>   				   DMA_RESV_USAGE_BOOKKEEP);
>   	}

