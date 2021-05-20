Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CEC389E26
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 08:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E2B6EEA9;
	Thu, 20 May 2021 06:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEA76EEA9;
 Thu, 20 May 2021 06:47:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQ9N7vO/i2dqk5o5n/NBtsJFzGf7lACjmsvYv32FUuiIeSR+z3EFCTV1HFlN4n5a61ZZUpCRvQnhdE6l2qRAoHN/CIEyuua4z025YV/rgS1pYSPRojHANwA0Mbc0ng5Zv7Ycbsp01aFcCrlGkg4nh96Bw+6NFphC5wL3r3e1cxj3kgCfJw9LxiXQkihEQ8scOCCFDBTFqwrl0U+kdXDmIQefuPbV0h/6Hzg7LQ0//8i3GZ7iEFqlUE2tT57u81uXk6nvPR/kOKHPSjzuQ1qUleFAD/U2MIEJRtItf7axXojK44I/bf1vvjHqtJeP1sgeIHZPE3LJF+P5pFUzcEN7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhFm+yLTHed8WfbzsTjLlL3L8IA8ugE3lVbFzEW7UCk=;
 b=RvEouwOpOEvxV5GmyyOLyr3Qo6DexJ7CdVcGkka/5s784u4nCUmJCxQf6w1tqGPRjbsR4d6tX1Y388OE8EN1M4AVo5mP+oGNr6pGEbldHDoGzk3xcZynW2lthc1p5cFph26RHLbTkHQxMbpAZ3O4A7+Zpq0sRiIUKk8AzT+Ws5qj1TZDudyZNmOQrEAA+Kd3ehoXsIuv0G/fddZQRXiOHZFXfoswacSK4uh2O/pLHWkoz/bIWi/euHLpucX2pKrTAoH9I/I05E4ZdploSRIhDEfjbRbJXCD9xXtOb0k0NYHs/MB+ssfjarWBIl/ZR3lSNhq3L3JWGCa0gV8NmVQZzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhFm+yLTHed8WfbzsTjLlL3L8IA8ugE3lVbFzEW7UCk=;
 b=gbjS6D+WNcovXcfOnnEgWWna4JbBpzIKKji2PDdxGeiT4ILlQmEgLSrHCONEh40DSPj3m7TDze5jHGqAwDu8tzEah4BXWShH43JnNGShBIsiJXk+8miVl4m/zlXeftZBOdU+VMtsj5SVdFcBqz5Ak2ZBc+OnADdRvTQWTy3Aof4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 06:46:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 06:46:57 +0000
Subject: Re: [RFC 1/3] dma-fence: Add boost fence op
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-2-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
Date: Thu, 20 May 2021 08:46:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210519183855.1523927-2-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4635:589e:67a4:e02a]
X-ClientProxiedBy: AM4PR0701CA0036.eurprd07.prod.outlook.com
 (2603:10a6:200:42::46) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a]
 (2a02:908:1252:fb60:4635:589e:67a4:e02a) by
 AM4PR0701CA0036.eurprd07.prod.outlook.com (2603:10a6:200:42::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend
 Transport; Thu, 20 May 2021 06:46:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00a6c7d3-a8fd-4019-c691-08d91b5b0fca
X-MS-TrafficTypeDiagnostic: MN2PR12MB4157:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41572F8B88F5234551E9BC2F832A9@MN2PR12MB4157.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hIBGICQIGDCQgL+OSt2qN9L3yv+famlYXD6rdLCmdbf7JrwOGXrHe1RagArnZ9WgFyH4MY46Co8v4b2RIR6L84SyBu9koNZEKbpcjJ04yZ2yfeUDB7nGuAppBcT+widd1gUlQAMMWzg7PZjWcAF1IFvEx3w44usu6mdVfANjUUvxSxyBfg4lRR1PHD8DzafRQDo0m5zlpwalGeL9sBCUIPkVNlK2CCsEimS6XRXkXE1O1kP1yE1ZlGCpSY4ZYWKzDHyspgYZTnm+2STaOFZmyqs9dBTiU4ucBAXVTTYKZd0Vk+s6EOTdN4d8+sxuGbDLfHuE4hUDRYm2Rlp5UMN2W1icoVuMI2Dh2RHvYUUccKSRX7we/meXduvfvHR8+ilJymilngpEaEWFBGC+k1wsBxnZNZQIx93zEBgV2IJIUhu6HUTFNvZh4QsHZJVCuIo6qqCB1/v2CVFfPcb1+jNbK95cc7G8Mf5FnEBtKVzt/x2iFlC7y/xhkOAXNpcQZjLOOXH2PqpNc2b2QB6ouSezXetWZjOdW4aAs32pD3AoCDiGGvNTc2CuvDPXvBKVKbtugdM20vEKoJ49X0nH+LNGhVtX4x0kJtczsL2v+n6tGj8UyH1pmTfSiLaIZybhI8Xalsq3BwULKK+rEqbtP5CNUddFbqHiYqFFG4PSI1zxMoeQrYpMNoaLOXychtPIXeBp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(86362001)(52116002)(31696002)(6486002)(66556008)(66946007)(66476007)(54906003)(6666004)(31686004)(4326008)(316002)(5660300002)(2616005)(83380400001)(38100700002)(2906002)(8676002)(8936002)(186003)(36756003)(478600001)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z0s0SHB6Ry9FRFZiMDJxSVFpMHlxYlRacStKMDBLZWJwZWd6MUNMOXRSSnVS?=
 =?utf-8?B?SFBtTUxmQzV5WjUvbmZxZUQ4cWVheWwySWRvYndEL1d5SmcwdDQrUlpYd1hP?=
 =?utf-8?B?OG1pZTE5bGJkWCt1UHE0aktsYzBEZE9kZXAzVFZrKytIU0E2bU9aYTFVSHVl?=
 =?utf-8?B?TU9WTVlCSk1EN2ZVNXJ5czZZTS9EaVdDQzFXS2lBOXdVWi9tbEllMWJtV2lr?=
 =?utf-8?B?R1h1QlRINlZNRGs0b0trVFQ5THRhRi9oSkJIem1vb1JJUFN4ejNuUlVYZkFh?=
 =?utf-8?B?WVk1TUVKa0hmZ2hqQWxLb1YwVnRqUnlkbEdwUG5xTE8zelFRU2xqS1h6U3l4?=
 =?utf-8?B?UEFDakJSS09lU0dUT2w3dWQ4TUgvKzRoUzRiTERlRXRPQXZ0WXBEbkRCQ0p4?=
 =?utf-8?B?OTdTSVhCNTRyVGFBc1JuQkw4M1NERnBzSFdpTEpwaWJNSUtNWU04TUxtbkJD?=
 =?utf-8?B?SjlKbDZWYk41N3RhK2dkaUV5WmZzOXNCUWVncUJIZUxxbGtPWW9HeVhIb2dH?=
 =?utf-8?B?TE5NK3RhZVFrckRjeEpCZXRXOGZCM1l3YkhiS1U5YnBuUmtkbml0cm1SRG5x?=
 =?utf-8?B?VnJTaXFpdWRTV0JvZ3Q5RmNOTDNRTXlJRXBZMnhzbW80SUpjb3ROR1Y3M2hI?=
 =?utf-8?B?OXFCNXY4UldxTVZkc1dGTHR0RUEvOGgwUUM1cFkxSzdhYno3N2VjSXh0VEV6?=
 =?utf-8?B?TlNJT1ArS2VGTnpqblZPbGpLRHBDenZuc1A3M0laZm1jTTJHWm83UVdOYWE5?=
 =?utf-8?B?bVJoQ2JRa2hMV3M4cGptK1hSSXNJcUMraG9jcHh5M0FOdmhYNUM1Z1QyeXUw?=
 =?utf-8?B?NjZIbk5udWRmUDJLa1p5UUN2MTU3VzNLRDBaMmZGazJzSnFPMGFkclZGL01W?=
 =?utf-8?B?UTJlRlptSWdWS0RIM3MzYU4zUTNTOGFLZzdOVFdURlg0RGw4clg3aVNsdWF6?=
 =?utf-8?B?dGNHamtIUU5JeS9sQSt3ZjZacGFwMG1nMHNXT1hsdXBvZHdYbnk1WnBTdEdq?=
 =?utf-8?B?RkRRZExNelg5Y0xwMU01YTIwK3N2MTQvQmhEYmFTZEdUTnJXWXFhaGdxbkdr?=
 =?utf-8?B?WnExZ2tmZTR1aVg1RGc5NlRFa252L0J1T2lqTUNpSkk4SnhMdms1eGI0QXh6?=
 =?utf-8?B?RERPRDdsM0dWZUpqNi9xeDd3WnFabXo5ZkExYlJ6R3hONFd1bVA0KzVUQ0Z4?=
 =?utf-8?B?YVlFcnlEVm1oZXI5WklIdWhJTkJrZkJQUk5VVnpGdFplY0p1eFVxS0h0Mm9B?=
 =?utf-8?B?Y2lVY1hhdWhXU1l6VzlEMHdXcldqY3VIZjRYa2dJckpHVmRscWwwV2FYME5o?=
 =?utf-8?B?cGVxWjFlTVBCbk80WTllRjU5cnJhcllTNFUwaWZQVWh1cXBGemJOQnhBbDc1?=
 =?utf-8?B?NHdQUm00NUxiSVlhM0hSNDdjd1BEM04zNndSOWxjTjJHVVNmR0ZETHBLRUpJ?=
 =?utf-8?B?T0pKODl4ZlM1ay9jMllCdXlNNlNidFVOMit6bnJyUTdnWVlCV29SQWp2a0RB?=
 =?utf-8?B?SnJqa2tBNzhSdWZ2eGtsYklqdG9EY2NKWlAyUlRvQzE3RWxiT0F3MWU4aE9O?=
 =?utf-8?B?Q3NsSThROVREWTZ3cWsrYnczNERBSk1jU1hTNm5hODlqaFo5UzBuTm1SU1NX?=
 =?utf-8?B?alljakZZL0Z0MWlNLzlUTlBzekdZOGN2cjlOOWwvVFJRQ0c0L3E5ejE0a2ha?=
 =?utf-8?B?SVdRbG10eHRMdklWYjZMeC9ibmU5dS9ZblVQVS9YbVp3bEZYMnhEUHc1Wmg1?=
 =?utf-8?B?RXNpWG9ka1NxNSt0NkcvTUhRaCtNaXJTWkJmUnVOaTh5NUVyMVdmQ2d2aXhL?=
 =?utf-8?B?YkFwVDRQUEdTV2kxNzVYaDV5aFp5K1hpc0xOTFQ5WktqL0lxTWV3cVhaRE1z?=
 =?utf-8?Q?kYtvdJUKYv2gW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a6c7d3-a8fd-4019-c691-08d91b5b0fca
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 06:46:57.5014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9nu2d1lVCUTykt16sxfa7sy+FCzC8G3rv5zScBEZ7PlalnpJtUrgXKvr8k2ftJG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uff, that looks very hardware specific to me.

As far as I can see you can also implement completely inside the backend 
by starting a timer on enable_signaling, don't you?

Christian.

Am 19.05.21 um 20:38 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Add a way to hint to the fence signaler that a fence waiter has missed a
> deadline waiting on the fence.
>
> In some cases, missing a vblank can result in lower gpu utilization,
> when really we want to go in the opposite direction and boost gpu freq.
> The boost callback gives some feedback to the fence signaler that we
> are missing deadlines, so it can take this into account in it's freq/
> utilization calculations.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   include/linux/dma-fence.h | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 9f12efaaa93a..172702521acc 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -231,6 +231,17 @@ struct dma_fence_ops {
>   	signed long (*wait)(struct dma_fence *fence,
>   			    bool intr, signed long timeout);
>   
> +	/**
> +	 * @boost:
> +	 *
> +	 * Optional callback, to indicate that a fence waiter missed a deadline.
> +	 * This can serve as a signal that (if possible) whatever signals the
> +	 * fence should boost it's clocks.
> +	 *
> +	 * This can be called in any context that can call dma_fence_wait().
> +	 */
> +	void (*boost)(struct dma_fence *fence);
> +
>   	/**
>   	 * @release:
>   	 *
> @@ -586,6 +597,21 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>   	return ret < 0 ? ret : 0;
>   }
>   
> +/**
> + * dma_fence_boost - hint from waiter that it missed a deadline
> + *
> + * @fence: the fence that caused the missed deadline
> + *
> + * This function gives a hint from a fence waiter that a deadline was
> + * missed, so that the fence signaler can factor this in to device
> + * power state decisions
> + */
> +static inline void dma_fence_boost(struct dma_fence *fence)
> +{
> +	if (fence->ops->boost)
> +		fence->ops->boost(fence);
> +}
> +
>   struct dma_fence *dma_fence_get_stub(void);
>   u64 dma_fence_context_alloc(unsigned num);
>   

