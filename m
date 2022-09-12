Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DAF5B54B0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 08:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA1710E1B8;
	Mon, 12 Sep 2022 06:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062.outbound.protection.outlook.com [40.107.101.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EA210E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 06:45:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ii5/csU7zz6h8a0xhkdnSXnMUvhu6M5BzPsse/LkmLKpSGvNE1XWvU0rRShDVUbeeVnLflsrbQ0Dn4AOOYZ74cXnIAgdDa6LLviTm6bjcLrefGbHoQgil1sHGa4DAphrF8+xfDlZOYU/sm2Kb3dwkh144hHssEgr2CLx2zgWaSQKf6Nq8HoXFRpfcK3R/fBaVJxk0P2s93d7Zjr07NPJ9ot2nMCynxW8DurtWuMuGXwuY4eojzjy152mdzOzx5w9RPy65kGLqNT8l5sDFF25nd/du+5tI4L28TQWc/86wsgo1le8nHjR6aZGATo2oVFOSVtag7vHin8+06QmozmSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0jElLVAmVYDnQvieoYt4WhuWsqmX6IWgiQ0ptz5EnY=;
 b=gMrxGEmF6VXRuekbohhRVLHomCrAFzf1DcQQ1FYuDWQbcOkfxxBy2phMwCmfST2VRVtI23oljbSemR/04IkYhCVeIng4iiT8aZXyu3rwWnopFH1RIvgQ3YycTM0v2YcJchZ6F6DPoIC0EdYYAC8FFDrc+OWi4LpP9Bl+VmT9GFSdjS7nwxKIZHF03Lswz6e6Z4Ja81RkqNmksXl1rLgkcpF5GqBxcsN5/J4Ya2yOjiXslmanD6iTg6J4PnflNuruahiekeNvTT18Uzu4VS8YSWDEaPFsIozJzzuyhCgLKzn8XjxP0Unhtr4C1P4zs2EHTHE0OF8s9mvOo77SV1HfCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0jElLVAmVYDnQvieoYt4WhuWsqmX6IWgiQ0ptz5EnY=;
 b=5GiM1LFCu6FX6Lp9r3SngMytPwcW7zqDnr829VHW1Tgo2fVIxqy89pFoMtNiPDL3h7pbZGe9rg/NIeEqyIeZAxEdD8miJ0hXDP+vE7EK4MBfH33bs0ssNUYMx40dz3unDt1DxpH7h5pRb08UOMAmHxNd4RNy2QdwxvaLTpXl+tM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6375.namprd12.prod.outlook.com (2603:10b6:8:a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Mon, 12 Sep
 2022 06:45:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 06:45:40 +0000
Message-ID: <43d23604-9def-251a-d733-0bed9a431f85@amd.com>
Date: Mon, 12 Sep 2022 08:45:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/6] dma-buf: set signaling bit for the stub fence
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220909170845.4946-1-Arvind.Yadav@amd.com>
 <20220909170845.4946-3-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220909170845.4946-3-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: d1dcb196-d5bd-42b6-f3f2-08da948a686f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LtDTMJ7Wd9Kfn1U9vr3Y5Rt7fECYMp5XlxzKjwXFDzO/1uFGx8sgsKhdYb3dHyC/Wt+TL+n0skpe2Hhx8CMqBCnFrPCyhvI3m8StJe8HytpH3vVXUR39KFZQLNQMzGKDJ8JO/nBTlRxuqsz75+X38WRNoB8mtymEJ92d1WQ8OaUhdg3crd5N4n7/5pnl1htjPT9qT0tO8Ys8gSE9rv4jLaZ/7Fuq0sDlQeLjNSVOLRc+53Oh+j/CCKW5ZTi3IzdMxL6Err8kUmlPn4dF8hMfRCgfjRzYQu3dhboevXPS2xgo1geuLPZ3lT1M5SUiu9Ww+VHOlBfuRbs1Ej9arj8bvbqHDVvL3K9axohVO5QBiCDPr8iv7cAjIjDF7ZIa3+Q9eCbunqesAISSfzex67SsqX9MqoQDkq/jvb8m58dPKD0IOcyYK5zWdzPalIFOx69+/vZ1XZFA1qST/b1HZE0U0Ppxa4rVzpW4+DLf7AoeLK/eY2rc6Yax3sz9xtUu4uaj1xUVXNgqLIeWahZUGSK1apcYm19ls5mQVvZCalFP/uOTnNa4Hpy2bjYevI175nfhuHg/okdhpYdPGQyQ8UZt/B2BTmE2rMuxrbYbjVw838tzYkv3gCnVZwu+8W90lhOGDm1eRv5U/0hvLkqhmfFYihW0LRclg1nybVqzVcL6OU0v8hW0M3tD/tkK9tmZEzmFVBu+W0rhUFMqlLi3E/YUyHwLp1+1eecHeQeZY7R7FTH74EKlqBHYeQ1W7I+abWNJkDd+vMBDaDbKB8YJngdtD4IIL9Xur/Qep86xOR2mpK9caFM9NyFxwpNBY8MBH3Mk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(6666004)(8676002)(66946007)(38100700002)(921005)(316002)(66476007)(66556008)(2616005)(83380400001)(8936002)(5660300002)(2906002)(6486002)(41300700001)(6512007)(66574015)(478600001)(6506007)(86362001)(31696002)(31686004)(186003)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmlKbVVhQzJUY3VGdkRGS2FRaWpobzZnc1dDejRXajA1ZUlWQ0pwdHZKdW5z?=
 =?utf-8?B?RnB1cEdNTko2aFFkbldhS0FiNGRNRlMwRUcrNWdRRWR5UWNCSzhYNGdHak1O?=
 =?utf-8?B?ckhLSFhnM0RRNEZKSm5VVWlWVE50STlJRml0V2ljdnF6aktRSW9ndHZEZmR1?=
 =?utf-8?B?Slh5aUxGMXNnM2prWkpEeTRPRnc4a1h3c3FKZUpjSG14allIbnB4UEl6d2xY?=
 =?utf-8?B?VzJUN0dESmtETENoYlo5d2s2RlNmRGlkZUhaWVF2ZGEwUkorNTJ5NVRtdXlu?=
 =?utf-8?B?bWpQMmtYZE1QS3J5cmt1dmVhUEVzRncrQjUyR3ROVW5NbzhtM3JLUWcvMkNV?=
 =?utf-8?B?RWVhT01HeW05ZnlyY3BNZDBUTGk4RlNVL2NFd0IvWUhZbU5hM3Fic20wVUJk?=
 =?utf-8?B?dEx1eURkOEZUdDhMdytRaEpudWlIeXI2TUwxeHc4ZjlSSktDdnRUMGNkYmFR?=
 =?utf-8?B?bnVZYkVXQm1JQjNON3JHejdjSW5KU2RsWlVHbkMxbWY5Z3lwbHF6UlA3YTgr?=
 =?utf-8?B?c2dpSGJCaUVyNjE0ckVRaU0wZWR0dXpHMm1UYlJ1U1Zqcmlwa1NnYlF5NmVK?=
 =?utf-8?B?RkhPNngwL3J2Sjc5eGVDOXhVdEk5ZVE4bnZEZ0dNY2QvdHlHaTdHb2twMzh6?=
 =?utf-8?B?cTF1blM1d0ZJOHIwNUF3SDFocUorOUhkQnBvVVI1bnIrMWpoMWVOZzVpbEg2?=
 =?utf-8?B?SzdWQzJuaVo4M0prOUg3VDdIZjhEYVBibllGak8rM1VyNjFlYUNwVlpRVWc1?=
 =?utf-8?B?N3dBUmMzL1JueGJvSTNYQThrVUZ1Ums0Y2Q1VTB4ZFljNGJCTnQ2Z0xsbjhM?=
 =?utf-8?B?a0tMd01yZWVPc2hNbkFELzJjWlY4YW05OVBZYkF6SW9LNmxJYndjNnQ2YlBa?=
 =?utf-8?B?aHpkQjhqTmJ3bTdCcENEaFl6WWtrV1NRQVJmYmhjakQydlRINUI4SWRyT2RB?=
 =?utf-8?B?U3BoVm1EeXZSR2J4VjB2ZkFWUmg0T2pZRDMyK3RTblhvOWhnWjh4cjEvRHdy?=
 =?utf-8?B?QzJXYVY5clNubFo0alBTNmRhckppOGR2THlyNDVFcFRkb3dVcnMvcW5ESVEx?=
 =?utf-8?B?NDdzUWZyMWlISitGNDZReEVLRnkxallNcVNJNWR4WFdHRkVQVjQ0M1ZTa01D?=
 =?utf-8?B?UUp4b3M1UmlvZ2NXQzVJdG9NMWIzWW1JODBZUmlvbzJXQ3YwTFBDajZjS1Rq?=
 =?utf-8?B?b2xsbnEzc0NRK21Sb1hGbkowM1ZHN29xZi92ZE15M0hwNm9LR1A5Nm9IS1FB?=
 =?utf-8?B?WkxJdXEyVE9MMXBVZmsrR1Q0bzNQQlNFaEdZSHRtWWRWVG9jd0J4bHd6N3hr?=
 =?utf-8?B?RkRUZ1VaRXg5M1VBV1U3YnFWQ2tOOXJiWEZmMlFhKzhqVUM2dVVseDZld0E4?=
 =?utf-8?B?Z055SGx2dEh1SEpLRkxweEVXaVp4Vmw5ZTd0U2I5WTVtb2VDUDBQVjdVbzVu?=
 =?utf-8?B?ZkFQejhkY21IZ3NWeTNtc0JUZkVJVTV5RXNNWjJlMzBnQ2JScWlERkxLU0tw?=
 =?utf-8?B?cFp1ZHNoUkpSZFB6bFhFNjJtL3dZUGl0cnJBakR5MWMxbGZNYThvRlZDMUJG?=
 =?utf-8?B?TFY4M05vUHQ0VHgrSGxGWHVVaXJQYmM0cDNsTzZ3RkFlL2RuckxGOVVmUmFs?=
 =?utf-8?B?Yjh5aWJQK1RZSHlPNDF3K2plbUhhc0R3UEtJUHdrOW85NGNBRmMzdU9mQm9E?=
 =?utf-8?B?MGRoVk94UEpySEx2UVhhOUtsaFo1YklCR254blQyd2RCYi9sTE5ESzNYZGFo?=
 =?utf-8?B?a2xzTFMrTGNpbHA1VW10YUVzSEN0TjQ4Q2tFQjZIR0FzTVlxMWhzSVdCc091?=
 =?utf-8?B?M2xTcjNiYmIveStrNzlRVXBZZzhVSHV6NjJRdTl4V0dkeDE4SHFld0d0OVN3?=
 =?utf-8?B?QWhYSzNUN0wvM2kvNFIvK0JWc2JTZDJqbW5JRmVGOUZ1a3Vtekt4OFE2Zkl6?=
 =?utf-8?B?cnBEMnFkZDJ2Wjh4L0lUNW9BV05WeUxuSVRBdzh1Y25FOFRJSW1Ybm9LOE9w?=
 =?utf-8?B?N3FsK2pDWVNSSktrcTcvMndqbTdLV0JxaG9yY1Z1bUhZV2JHdmZBTlcvM1d3?=
 =?utf-8?B?SkxMS2N6ZXZWUXpGSlN4WUk4YlFFei9yUTJ5QjQrV2tCMGIzOXJpQ1VSdWpD?=
 =?utf-8?B?cjl5eGhBNXhyV1l5NW5DUHFycEIzcU1Db3pKa3ZiRWphcm5PWmc5Q25FT0dy?=
 =?utf-8?Q?ICK2Et61u4Tg6Gn5Zutp6zsF+H5dqc4HIKtEppDGVr0x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1dcb196-d5bd-42b6-f3f2-08da948a686f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 06:45:40.7411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mbEyPMl6rnpDhLC36N0Nn1KyFYyEGNSBgxWw9Yve9PEeKEaZk9jGY2D6o8tRVLQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6375
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

Am 09.09.22 um 19:08 schrieb Arvind Yadav:
> Here's setting software signaling bit for the stub fence
> which is always signaled. If this fence signaling bit is
> not set then the AMD GPU scheduler will cause a GPU reset
> due to a GPU scheduler cleanup activity timeout.
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>
> Changes in v1 :
> 1- Addressing Christian's comment to remove unnecessary callback.
> 2- Replacing CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
> 3- The version of this patch is also changed and previously
> it was [PATCH 3/4]
>
> Changes in v2 :
> 1 - perviously using  __dma_fence_enable_signaling() for enable
> signaling.
> 2 - #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH  removed
>
> ---
>   drivers/dma-buf/dma-fence.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 64c99739ad23..bead1a6e9f59 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -136,6 +136,10 @@ struct dma_fence *dma_fence_get_stub(void)
>   			       &dma_fence_stub_ops,
>   			       &dma_fence_stub_lock,
>   			       0, 0);
> +
> +		set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> +			&dma_fence_stub.flags);
> +
>   		dma_fence_signal_locked(&dma_fence_stub);
>   	}
>   	spin_unlock(&dma_fence_stub_lock);

