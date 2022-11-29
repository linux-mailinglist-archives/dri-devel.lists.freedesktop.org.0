Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89D663B902
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 05:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD47C10E1F9;
	Tue, 29 Nov 2022 04:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DEC10E067;
 Tue, 29 Nov 2022 04:14:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiFkjuDJBpST+kEZRWW3e9pIu4EsVdT7raZWvOS7GUnFCcBe0e03eDGPx/4zemUrrsskKvsVXvmG95kC47zwTTBQAdqPRSqlIn8WFPkNddHQ3joYEo4ggkc2X+vYJhmxPBdKSh0Nm7ueaFv/ahe2bk1ZEDYM3OQ+jThGc8XJhKLY1Qni+lepFeFosq4lE16L7cgI+eIRVc3nVHg6062jPxw8+hKM/8uFy80oeLHGi24zHThG+27NF4qf3Oyaa22S3UvvcQVaVqgs7WDvp8WwKfA7sXbdaIhe9dFalG9AH90rXgMOV6WdWIHY9Qk9iLLQsBE9y+MD6qc50XxTINXEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXeFHuyYLFNH56qG2kiBKn0Rrykvt7uiAxARiPrIWt4=;
 b=UMiFkjVTjKDLCkzH3gnWOvBMvKiVGJGODTgmoc8ET4Ul6FqOv0k91MyY8EoJSJIm/ktyq2BSEDmKUH5tmK/+QpMtAGR27UzWtUvpUdj0gcIX+ep+V5NiY/XKvbhQgOiEhZQrjL41kQZ+JmjcgctjvCK/JdXmibd8mpxDavqAqpwk97iATdc9H6GMCPZIRXR7gbwDEGj9g0xFC3dQDAEONUhSUb+4YShH31G+/GKB1FyZUvqeAPkBSAa69vW7VTDK41TNDvDBnYYfdkP26GcDPfD4QEhiNA5BeZjO086Nsr0e4rwdZtdJ4p0P5JAHtPC8utZtd7TiomiLwfSRvDS0Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXeFHuyYLFNH56qG2kiBKn0Rrykvt7uiAxARiPrIWt4=;
 b=q7evUMmZFB8yJleUpuZN68p8IrEWCR6QEBrq+IpzmQkElOnjMt5gUTFLKBq9gLpYCt1wtLcqq4BTollm2GoXkUpVuUSe6LNH4gsbPV76VWfH/oStH5+5aUx490OWCtW9MLToEyG1F7bd2YqgROrXXxULojNlCoST4Rjz4socD8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4944.namprd12.prod.outlook.com (2603:10b6:5:1ba::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 04:14:01 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350%3]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 04:14:00 +0000
Message-ID: <89cac4d9-ed8a-1498-7e30-4a3c87720043@amd.com>
Date: Mon, 28 Nov 2022 23:13:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amdkfd: Fix memory leakage
Content-Language: en-US
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
References: <20221129034734.2141562-1-konstantin.meskhidze@huawei.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20221129034734.2141562-1-konstantin.meskhidze@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::34) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM6PR12MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e3e0e6-1b76-4e34-2237-08dad1c01f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jzACskwxpyo2dYsJu+VPPN7f+ZSLgZLkDr7OygoNC+kv22lK8lIplfERigNSXkXQU7rq/gVbADXyxtaVowg/orABYSWyuW8GudOV66ql23zlquvt3EIlJkr69mgX5NKMJHl4FtF/1W9pv17mVahl3ypbRZlMCTtEjF0j5L7zLMJNoSiDKHj4FpSxedDkp6gXPd8c2f0MxSRYIQ96g8CfoHN7OAy3RpMuQezKj+SKkrR3HNwippnCMwKOY8K4P3bIXVIDBkxMGA0VXpS8LYjBttPDTPoBYwyQf4/P/xfVBic31CZ1An6mf2svOHPtgerVLvpJdwex76YKQsGs5uE46nV42rK7vRs30H8Bx7afMOVGfastqFzcrj5LWvX3JkkVJ8p6eno6Guf8c0iUgsCAXD9wWL2gYUTwaEuflOZ84ZmkZH1tz+cJ4eOf4+dxCKCbQ/UmOOjTnXYj6ytWTnnJfOZ/rb+8NKfHnFj/uX9Gm7I3EHCWbwE/7RkV6DdA+IozQ2RllVt6hZqYQXwZt3ZyANxwB2P1q6qd8jrEqoHz9kL3Vm2mVvU7DtUyfMnFVaUU7Hkd3xxiUets/DFLfIwZmX3l9YkoYhbf0esCcqFvmiXlGs7JfMajodRiC2dyszO08fd5Pk3Jw0nPJt+XEy4Jcj/3Hldq4CO3NMO2tM7I3pL81GBRpaJpDXDLaYH24DrEs2aWf4c9mMDkV0NBx5MFSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199015)(6486002)(6666004)(6506007)(83380400001)(31696002)(86362001)(478600001)(31686004)(6512007)(2616005)(26005)(6916009)(316002)(41300700001)(5660300002)(7416002)(44832011)(38100700002)(4001150100001)(2906002)(36756003)(4326008)(8676002)(8936002)(186003)(66946007)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWowbElZeTVEdFdSUUlRcWJCZGxmZVVWVjNuZU5heW1zayttUGRrT2RvN01l?=
 =?utf-8?B?aVhPeVc1RnIzYkVHZVNUbGVUUmJSOXMxdVRrMUdNNWtIYjM3eFBOR0JGU0gw?=
 =?utf-8?B?NnFTclIvZWtKZ1plZnVPM1I3eEM1TkFjMVRHT0Yxc2U1c0x3V2h1czFVVStP?=
 =?utf-8?B?ZjYzNXptSXJSbGliVFJsMThySGJaRXNNUERPNVVraS9kMklCMGtMTWRDMzVn?=
 =?utf-8?B?UEdhY0MwTFpLYW1rK3Q2RHphQlovOS8vbm0rV0hsUjdQb3A5Tyt5WTFlMVFv?=
 =?utf-8?B?ajRURGZEajU3ckQ4TmhnVjJrb29VT25iU25RNElIa0V6bE4zYjh0S2dqZlcv?=
 =?utf-8?B?MHpUK0U4TU4waUdZRElUcGZhR3NrNUZUWWo2bnV4d2xOOW1GNG5qQ2kzT2th?=
 =?utf-8?B?UUlqNVlJUzZRdytUd2JkV3RsK3Avdklnc2w3NEgyamEybFgzOGNoM0RqYlpG?=
 =?utf-8?B?NmNRSU95R3U4V2gwRHNSTzlWSTN6em15b1lMdTYvYjYwRHRqL2dyQXI1Ymtw?=
 =?utf-8?B?amZ6cjMxV2Y4Ykl0M0NvRGV5eVZyUlZhb3BzTU80UzRoWXZFSXR1UWFDcFAx?=
 =?utf-8?B?cnVXcWhFYU9JSm03TU4yZ1Zza0UrdW84R00xRkVpZU5vQ0tRcGhEOHdvVTUy?=
 =?utf-8?B?VDJwRkcyQVhrS1pITUZKVUozSlVlSHNnNjZ3dXh4QnE5WUtPMndjUEFQWThE?=
 =?utf-8?B?c3lUeU5hMk9yOGF6ckhSelo2L2QyandRNHhadWxoRi9PUGpzeFFmNEh5M0xB?=
 =?utf-8?B?b2szamVHUVdkcDA2UkNwOWxwL3VRY3llc3o4SzZ1ajNjMWhoU2o5NVBMS1dm?=
 =?utf-8?B?YzNFMWdBZzliSW9aMkxsbnVaVVNzM2hlZ1IxL0NSNkw4cHdkR3NSTnc0azIw?=
 =?utf-8?B?VTVRVHpxK25RTEF2eitwQlZsRnBrSUM4cG9QUzN4VTJuS1ZsVGlGMVZSRk1t?=
 =?utf-8?B?WldYRThPNE1jTFpYSElLdThrRDdWZGw0a1ltVzhOOGprcUtKbkJxVkp4aE91?=
 =?utf-8?B?bDYrK2hSSnNKTWNmRlpETVpCR0JMeFF2S09uS1FxVXdwSWNQZjVpeHAyTjZC?=
 =?utf-8?B?K2NjVi9mN2hGdHY3aWJyaVN6QnNLYkZjbzZzSUVOVE1yZWthaEFBMzdCeW53?=
 =?utf-8?B?ZUI4Z3d4YVBYZmh1ejd3S2lCcXpuLzhNTGk4MWx2d2VJZm1xYUxRZm5EMW14?=
 =?utf-8?B?bndOei9WWUpFTnNMLzM2MVB1NjFUSVRoZmQ5SXlBNTNjdnljeWNnTitkazhv?=
 =?utf-8?B?THFoSjZWT01CY09YRC9BSVN3bVJadVRKaVA1aXhhaG81REVRZkJsdDJFZXRU?=
 =?utf-8?B?c1pXL3RzNUh4em00MTZlbkR4bTRRcC9wS1EvdTRuekdnbWxhYjNXS1Z1WDNu?=
 =?utf-8?B?WFNZSE8rRk10K1VTSXdqVUlPNGdXWlc1eGZBZmp6eEtSU2dKajFaMlFWaE9P?=
 =?utf-8?B?SDJwcmliYXJtZE9Nb0NVTUFPT09KS0RPZ0lpRWY1SE51WXhKQndtenBETjgv?=
 =?utf-8?B?OGo1N05uZ1hqNXRnOXhTV2trNGZYcmdKcDlEMDJEUTV5U0ZhUEV0Sko3RTI3?=
 =?utf-8?B?eGh1VGlLMkdjdUZYSElkZEc5bENlYnVrcE5TV2tPV3o0NDNKdDB4VTl4dHh5?=
 =?utf-8?B?SWU0dWZFSzl4MVN6OXVvV1FleWNieGhsdjMrTW1CRndJbGtZa0FEMEZLQW94?=
 =?utf-8?B?WjF5dUNKWjJicU40Z2ZFTjJaNkxmckpRendFQTBRZWVRYXFQN0lsZ0pFcXZM?=
 =?utf-8?B?R0J2MERaYzlvTzVEQ0hDejBYWldvc3NYT3VxVXBFOEdWajNhQ1U0aFIrSXlh?=
 =?utf-8?B?eEpOWndwS2hNUHp2TWFrM2dZZ05VZlZnaTJzRnFDVGJyb2NGNnk1WWNmRkUx?=
 =?utf-8?B?RnZUN2podG5wM1BlaHJ2NjFsY0FZRU1sTjVsMHdGcGFLMlJHamZXL2hCMERu?=
 =?utf-8?B?TTc4UUZBTEpxbGJOQ0hKaXdTV2N2ZW9nbW5wTjZHM0tMUmFyb1dBSWZSWmhi?=
 =?utf-8?B?OE8zNWliRDRpWkdySXZybUpIemQreUZpWlh5S3BUUUJDQ0doS1hPNG9tcEIr?=
 =?utf-8?B?QllNb0xhT2svN3o5RnRjN1NGQTFNWVFTRE5zazdXY0pOeFZ0UEsvYi9JbE9N?=
 =?utf-8?Q?slfxA89IZz80Oxn/M4Ql3wMFH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e3e0e6-1b76-4e34-2237-08dad1c01f37
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 04:14:00.4959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PT6hQ4AXzXStPzitw4dL4K/w9Gwd/nbLxnAE53x/V8eC4n+20Z+cyG8FbuWsF70OHHzy+8AgjnngttCUql6xRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4944
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
Cc: yusongping@huawei.com, artem.kuzin@huawei.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 sumit.semwal@linaro.org, hukeping@huawei.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-11-28 um 22:47 schrieb Konstantin Meskhidze:
> This patch fixes potential memory leakage and seg fault
> in  _gpuvm_import_dmabuf() function
>
> Signed-off-by: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>

Thank you for the patch. I'm adding a Fixes tag and pushing the patch to 
amd-staging-drm-next.

Fixes: d4ec4bdc0bd5 ("drm/amdkfd: Allow access for mmapping KFD BOs")
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 978d3970b5cc..e0084f712e02 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -2257,7 +2257,7 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>   
>   	ret = drm_vma_node_allow(&obj->vma_node, drm_priv);
>   	if (ret) {
> -		kfree(mem);
> +		kfree(*mem);
>   		return ret;
>   	}
>   
