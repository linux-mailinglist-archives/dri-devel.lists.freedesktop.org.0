Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D2869009B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 07:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D48110E910;
	Thu,  9 Feb 2023 06:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F2C10E910
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 06:54:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5zHjAM6IhuTuocwoERknuleQTwjokZh2MmtqKVwJk2QKwGEcdLvWMdxvLB9JCVBwIkfyBb47k0PROMbbl4fTwvL44VeiZ32dTFHm/l0c32gRtmUOEi8EqvAcehjM00Y/QoZNh11ku5BCD+4HqM/HFhfY+j+a1HbpLF67xSo4jG7cSitfIx+BKzdx/yqTXWZQhzNuj3Bi6n4VrLUXqsTdf+xgBZLYhBCg//wvnsA//w1mErR2eibP0s5pT6AQYhRlxVpW1gReBVPqpFs93MVOBzfDITj1wIyT0ZWH7JH2bPhYGtdA3onDla3qKCGHMWSAHU6PZCOPIBBdh59JrCdJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxlsBAZWT8j0KXjlwKM3UoTGF5OJo4c4pspSFt7qurk=;
 b=ENgIYtbcHAz7jZY9dYKVw7DvMUoN+ygsOSvSaGJiYwzQbKz9/uBUE6lZEnyswRTQIHrYajSS/PjS1fxbokyK8cdEqS7AmL/rm815wqOPJDI61+jOhG2n9kg39tr00CsuWJQ9h8Gw1THLUIl0iYqamOqHq8AIt/TxsoRvGk4O6MzevAzjqPmRRzD4rekpPjGLenm5J1MvDqMmfmvVcXetCl48PwObUMLEKEtu2WsYyaI3ojuelcko1PPAIFu/53n+SleGuuIVkGKgjobSB5sxCDrLWPSS8u90wDa7xeoEp+0ExOtG4z38YdRxDjNzqzgB/npkU8ZH9jiWJ3mRwRF6KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxlsBAZWT8j0KXjlwKM3UoTGF5OJo4c4pspSFt7qurk=;
 b=iOlqyhp3DnWHkaISbqXY5PpE5xfriSBpzrN1CEmx/nfvf8Mowf1DUTHTPi/7NoYwVmdV65rZsTyWbFVFSjyeMwwHyHeHZxOoKmpDcad6aJ3oS9nFUnB9Zaqxqy7GyqnGBtFQV37fNt/l7eyRw1yUxEbuQgAJgdHraaRKmRlc/2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 06:54:36 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6064.032; Thu, 9 Feb 2023
 06:54:36 +0000
Message-ID: <c2bc5e86-f839-7960-1784-bb2a1bcad239@amd.com>
Date: Thu, 9 Feb 2023 07:54:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/5] drm/sched: Create wrapper to add a syncobj dependency
 to job
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mcanal@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230208194817.199932-1-mcanal@igalia.com>
 <20230208194817.199932-2-mcanal@igalia.com>
 <49d580fa-60db-5d55-00de-20dd3eefe737@amd.com>
 <efe36086-fa78-b7af-bfb2-1d2cad618905@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <efe36086-fa78-b7af-bfb2-1d2cad618905@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: f75d7605-a058-4fee-58e5-08db0a6a818b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: omheqrS4buVVt6Z95Aw8xoW/6pKKi3sHdO71/LK9K7AdI7o2bIOruEINyaORxqf3glhAAT/E5KnmtWkWXIta8U+zC3MwZgoQmdya9x4Y+JUIj0McY3Ya5zjibeUmO1E/q/37lYPHZzjvW1fvfTcZkBvxX6fvBDawFRFhpBwJAv6WGYI02kPvjZp2AhQyUIAqHnpo9fENLMKqi2U6K81iB/3NvnshZelYwpJA1895MMUdGhl9jQg51iG48/s7gsCuwo7opuY8b5JW4RBw7uv0tokI3EG64bWWTxZ6cpF6PmiByTjIt9KOTU8cWjtFAIw03PSuqzTBWaSJgDm4q2VaJxrf02P5vhNoy2h3YmF9Ap+7VGgeYveDocCiSQF0OKgCA1lsmbNljBIZ8+IIhA22F5vMR06JnAcb5ytRTjUzA2SnqIseUapT9ttFqFr3vUTuMx81f6ZZXvlLKOeqnIRiRC/zMmuVewbYlmEMoz+DwnhJMRIthsG0pTMVAIU2O+pZcniej7tRCt96b9zynZ5LoGbJScLKwRwQpfRdl4iQN3tjAh/TGNmc+VIUfgUDSmTeL3XHtBL9uuP+rt1yuMC76UxR07CWhnFP2uvIGglrPmaLVcbhDjm43sMQSjWKTZdmm2eBRmYEDOia1EHPxmxCJY9DjUhalMmHE5+73xlTnJaddCMdWff/LFyi+oD7/uAci/gWaNn/5qO0QHr44e+Imx15B5x/r3XUkryraGSWty4Gkt8OXHuBl/v6/vOiW006
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199018)(31686004)(53546011)(83380400001)(66574015)(36756003)(5660300002)(4744005)(2906002)(7416002)(186003)(6506007)(31696002)(6512007)(8936002)(26005)(41300700001)(66556008)(6666004)(316002)(478600001)(6486002)(86362001)(38100700002)(2616005)(66476007)(921005)(110136005)(4326008)(66946007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGRXaUpYNklwTVoyYjZxSHB0cWxzY3RMUDBCMyt6S1dwR1Zoa2lxV3d4YnBN?=
 =?utf-8?B?QkIrSDNRbXUxR2xiR21samtnVm5xTjZaTG13MldET0k1OGs5WWFXSjkybXhp?=
 =?utf-8?B?a3VIZkNROUFVSTJ3ZzliTXlXbU1RUjJselhBamV6c0FuT1BleFRHUE9ISDNo?=
 =?utf-8?B?aWc3TytTQTFaZnJqekVCOE1XbTVSQUFMUGU4UCtmZTI2TnRaTlZ2cTE0QzlO?=
 =?utf-8?B?L3J2QlJUaE5zNVNkYktvYkV5K0NoS3A5L1ZQcHVvS3pLVm9hcFV0ZnhGdVh6?=
 =?utf-8?B?NEp4UFA0QlZKQnExZ0NOUitkZnRuc2FZN1I0R1FiaUUySi9obVlaTFJaaFlU?=
 =?utf-8?B?YnlyL3BERmRRUWh2S0lKRU9UdmtqdmprZURITm9LZS9VQm9ZNEt4cnpUL25J?=
 =?utf-8?B?M09WQVljSzBVQVc1VEU4ZmhXUkM2dWlqYnVPSSs5UDljMHVuS2xhNU5iVFF5?=
 =?utf-8?B?Skk5ZzZLbHd2czREVDgxUjZHckV0T0VtK3ZjM2EvWWc2bHZSMGZ4R3M5VWtK?=
 =?utf-8?B?NlZoTFlYTWgwVVVVMjhHTjR5ODc4cE1RMm1hOVc4ZkRzbGtPb0R3NTlveTR1?=
 =?utf-8?B?bXRYWWZROTdWOG5SVUprWlcrOXJ1bU5TVFlMYkNKMEUxaDY5MklUeStIWGs3?=
 =?utf-8?B?VVZNbjlKTHJXdDQ3Yk9kYW1RbmlLVy9oRUlrVnRZSmt5azJLR2E0NlhuSVNR?=
 =?utf-8?B?dCtRZVZnVUQ2MFN5L0gwUmpGU0JBWGw2TmZVUElUa1BtU3NZcy9GbEdDd29q?=
 =?utf-8?B?bWNUSWZWa3pKbGh3SDkwVVNHdDNmSStuQUIyUjR6VUhCUVJUS1U5b1cwdmd5?=
 =?utf-8?B?WWtmMzNkV3RGdXZaYUh0WjN5QnpTSjJpQW1Hb2s1bzlmV2FmWjQ1L041cGRk?=
 =?utf-8?B?cDRETExXcjdDcDJLUkJCVStscmpWLzJzK2NSaFQvNjRGcHk2Y213YUhjMlJQ?=
 =?utf-8?B?M2RQTy81MVB3eGsyK1p6M1VXUzk4ZFFpUit6T2J1VkhHUHcvTzc1Zkp1bThp?=
 =?utf-8?B?ZHVneWZkNWt3bnRvUkZFc20yWVRSN2YvTktnNndUaDVkaTI4SFEvSlpQK1No?=
 =?utf-8?B?NlJoTnlPcExYUXkxeWlxbHFqZEkvaVNKWitUSUo5SWt4aHN1NDc2QXNscTRE?=
 =?utf-8?B?elUxR2dQVldPTkJPUUZVVGpXVjkzcUY0WU1TVk5FWlROQlg1cThnWHZCdnpZ?=
 =?utf-8?B?OWVkcUd0aEFwOUQxZXRLUlA5MWpKd2FDRm41Mm1NaGFlSXV2OU1oc0hYcE5F?=
 =?utf-8?B?bXlwc0JITEpzUG5Ka010d3I5NWcrdnRNWjNvK2dzVjRvOEFKTkZHTzYxVEh0?=
 =?utf-8?B?YkRWeG5IeTVZMklMSHd6NFh0dG9mUUpNM2RNbTdnelZjSU52TkJrUkZzZkl4?=
 =?utf-8?B?d1c0MHY3TnIrelg4UzZLSzBhSThOb2RRajFwZUJ4NWlHNGRsV1hNUFY0ZDla?=
 =?utf-8?B?RGxwdE1PVkg4MEVhQ2dJT3JsMlk1eUhQcks2SC8xOGJiVmVpZ0xTTERxUGpW?=
 =?utf-8?B?ZkpSc0xrZ25JQTlVZlBKdHAyNHVDbzNIc3RVM1BMY1BDYW5vcHBEWGROb3hN?=
 =?utf-8?B?R0orWjBja3dtYnRCcDh3NmJiay8vR2o4TnZLbnF3bkV1Zzd6am1yQjA0RUda?=
 =?utf-8?B?MVJuSWR6aWFLZ2duQitIV0N3Ny9zdDBzNXpLYTRSTFhSenFKVHJ0WHV5WmpQ?=
 =?utf-8?B?cDZraXI0d2pBbTdpS1V5UTJGR0cyaDZYTUlnZm1Nd1E5UDlTRU54RERKblBP?=
 =?utf-8?B?cUNPYS9Qa1dtZy93WHMxOEt2ODBqQ0lHWmFESW5CcG1rVWpHc3p6R3pubXk1?=
 =?utf-8?B?MTBrOU9KM2VGTmJwcTFoczl0bTNWZ3BCM2tIRVRieGtsT2FoeGZPZEppY1Zr?=
 =?utf-8?B?QVYxc0RoT0g1NnlxelFYaDRnMnh4MjU4Rkwya2t2Qk4yRGtacDR6SjRlMC9Y?=
 =?utf-8?B?bzRLOWNzVGdkYzhEQmVZOHQxRzVjbUFHc0V2Zk93b2drRzM3em9nc0tBU2tO?=
 =?utf-8?B?LzNlNFNKbk0vc1AzN0EvNjdkNWpyVS91NVdLVVg4MkxUWlhOT25EbXRiQklX?=
 =?utf-8?B?emptZk1yMmdHYzc3c3VYemtyOWRuejdhNkw5bFVmeVZrVVBSTG5iam9MMFl1?=
 =?utf-8?Q?IsNqhlgvwfoQzlDhjcVf6xrhl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75d7605-a058-4fee-58e5-08db0a6a818b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 06:54:36.3479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHvEw+ja3zLTtP7xPXEtmuH4avvZc5t8Tn14J2IerHziAcfKkh7XU5MwK9cUoI9Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.02.23 um 23:20 schrieb Luben Tuikov:
> On 2023-02-08 14:54, Christian König wrote:
>> Am 08.02.23 um 20:48 schrieb Maíra Canal:
>>> In order to add a syncobj's fence as a dependency to a job, it is
>>> necessary to call drm_syncobj_find_fence() to find the fence and then
>>> add the dependency with drm_sched_job_add_dependency(). So, wrap these
>>> steps in one single function, drm_sched_job_add_syncobj_dependency().
>>>
>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> Just one nit pick below, with that fixed Reviewed-by: Christian König
>> <christian.koenig@amd.com>
>>
>> I'm pretty sure we have the exact same function now in amdgpu cause I
>> cleaned that up just a few weeks ago to look the same as the other drivers.
>>
>> Would be nice to have that new function applied there as well.
> Hi Christian,
>
> Is that R-B for the series or just this patch?

Just this patch, haven't looked at the driver implementations in detail.

Regards,
Christian.
