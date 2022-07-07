Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD99569C6A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331EA10E729;
	Thu,  7 Jul 2022 08:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B26E10E2D9;
 Thu,  7 Jul 2022 08:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abdRa2hGNQmJmIC8kAuJzBhhxna17MkiA28JOGmutr9LUxRPmD2AHoS/2/VawOTX6qbsFxl+3l4k4mMgDbsOc/uENLHa2R6A1wVc8TuKk1QKzdmI0WfNO6vTQagwBYwVqgrJil01TkKxcvKad6pe8XyctdjVLKCMMMRGzJK3hsYOmkwyODHKvd2QM4HIidbc6yitvw1x9vAa/8bcYDwF0+T2rjvnhAmEUwCNJaMRcSxuLJ3oUs1FhjOb/T5BYjMeqYjVpPWAw9XWxIEKQjUwasL50HcYbudZJrhdBxbMUZAgWwgNareUf1sYqBRNVOglsk2acl6ht5NJ1ZLHUJHU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tK7cKbS1fFj+2501iNRaLYlfm4qBCjI0LRHX86NaH/4=;
 b=AmulCgnblxGorYyBdSXdcsXtzkmeZ5lSaMLXdrlbqWPNHW3/8l9WbiDU8T+PMvep3FngS7JfVR1lAKWZulsuza5WQKAoRM6H4oiM2E2I4Xyq0ZFKxCXMEgEm5WDxa4sCmDAjtrplg8JfJ/HniCxOy1/QNV+SNxfzAE54gPeYvjFBPVpE3CaAlh3JKoi3JkCw4gwoLDhmFLATHW5fpfnbIeBHTd9DOJUX563rA0hKCvUlhUvpIlJWF92/Y8ocWigMzrAEUzWQY0Y67rBw/vbreFoX8E+ppdLDdARzk7Mb5sZGI8TvDmDV3UTwhf15SKIyTu9r4A9UbUu/CVHQcb5zdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tK7cKbS1fFj+2501iNRaLYlfm4qBCjI0LRHX86NaH/4=;
 b=cqkM++K8kLvWwdbi82tKnAv8+MOMajOW3BaUbff29D/12CwRcniLfiRWbf/2PqIzicMWNvJF5oGfKfvrRn+B3/H5s8jf8smmXhfzeVkC/+eDbex4NL6Q3Q5Lu3JfNrx1cxHbJzAwx5ED8wToCV63l7QU30vswOskH2mynTdW32s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN6PR12MB2752.namprd12.prod.outlook.com (2603:10b6:805:78::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 7 Jul
 2022 08:05:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 08:05:35 +0000
Message-ID: <97924e60-f0fd-0a71-0a34-0606c5a83cab@amd.com>
Date: Thu, 7 Jul 2022 10:05:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dma-buf: Fix one use-after-free of fence
Content-Language: en-US
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220707080241.20060-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220707080241.20060-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3542f244-c8d3-44b3-2c0a-08da5fef7870
X-MS-TrafficTypeDiagnostic: SN6PR12MB2752:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FoVlD7MAAk4r67F5I8RtBwmeQ4I5sIiNtrA+CZqF6zlJETWlPKvoshuRGz3ttd4Bn3kNKO4noOjNlOYAhYjZDh4NWBMG1VvDp1EEozmTSXKxXOr88j18R4Iaj9jIDsCuj1NUvgFrkoZhUg8WCBR7T/UvyrQ5kmoljus4WC2aY6NUk6F24M2mS9pHxalEz71n/v8wZdpYFtPB+nBf3qeXmabcIVnUpMScCQuOhGbgym1StJ4jkzFnyAj8PUBlFZxFe5CZY0YWPPQdHyWVnFbmGlkhnsme4mufSoouFFPo5X4qdK+jNaHYLgooRscAji+IW6vFy/GI1wvJLyG5LWPHOslazsJCFzOI3LVDTcVi/yHRA+bxNaPIH0kiYPAVHqJJB9TOW5cbETlIc9pM5528ccd17pSMDCE8nLDJ4k57RaiTGd2s6hyRNWQFAn+JJOyseDdWfPcQU5REHGS5ppxDulB4TvWclmQ2f8hCQ6RQssHekT1NZFM0V/LsCU2Y51HCKysHqALQ2jbo/0IeJNufbMRwfP3hbOzX5v0sd4xI0KqSIx60BU6RYZFb9y+0ogFdC14ojypYrVj4aBUU7RY87Vd+ovL3QRRaBuKsPmn02dGhU79A/tfgeZovXcKVmR4e054YTqT14L/kbr3ycKgzR2En/oUOmeemzdQs9Ve75yEVSq5YoG7DgzYAv33yi1/9hQpJdW92gCvwL69vNXL3jM+yDCFX+xhddGDyHZzVrR7FSpPBeA3KaPwJ7wIxb65v/gD9XoNfDvl/rfYZRuKYKyKUzPNQwC4uJ0GegXKK9sNUuknslxxQGokDwAIYljtsOjihs6QbNvHzo+WzLLxFl37Z0V2ioUIw9oT+JE4LHt8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(31696002)(8936002)(478600001)(186003)(66574015)(83380400001)(4744005)(6486002)(5660300002)(86362001)(36756003)(316002)(31686004)(2616005)(26005)(38100700002)(6506007)(6512007)(41300700001)(6666004)(2906002)(66476007)(4326008)(8676002)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0IvbVQ3QTY4QXdRR2dwVjVuOVlSNUt3alBMaXJ0bktCaUlwQlRTUkMxeE03?=
 =?utf-8?B?OExJOCtPWXFHMlN1Y1BPT0QzMjZkanBEZkZBdTQ2WWRhWnN0Qk5KQWM0bnFZ?=
 =?utf-8?B?NHROMmVtR1ZUZ0xVR1VMMUk3VU5sd2NscUlFZ2ExaXFSV3JTOGNrL1ZndmFl?=
 =?utf-8?B?ZlB4YVZ3dVRDbVlhb3NkWi9HQW1LamdXODFyYnVNNkxLdVdRaVR2bVVRU1Fs?=
 =?utf-8?B?bmpocVV6dVdzY1hiaTBodVJ5TUpYWkJHcE14TzNuaFFxbHpQMEhmcnlFNUxW?=
 =?utf-8?B?MnpjRU1RL2FEVi84djJQRDZZeFdOWWFiVkJwemRCK3NhMTN2bDRNdithc1NJ?=
 =?utf-8?B?dFhmRFJMd0M3aUFQNkE3VmtUY2g1emdBbUpjMkVMUDlmOXNZcVc1aWlxc2xK?=
 =?utf-8?B?VGQ2T1NVYUtNTlBZR21lSFVHT2lhR2Z4Sjd2Y0RuTS9vMXFkNFFOdCtKS2lv?=
 =?utf-8?B?RnhlOVo4R1NOQWswUm1xbk9UN1lSTHlWZ3JOc1p0OW9ES252SUFYcWJocHY0?=
 =?utf-8?B?NWFGL0JzencxVVR5U2lHRkNsRVlJUitnR1BtT0Zub1drcFRMK21tZm9ZbkRL?=
 =?utf-8?B?WXI5bWVRQzFybUUvbml6QlZWU0g4ZXNLUFZyMzFBZm03Y0Z5ajUwbFdqTDBl?=
 =?utf-8?B?M3Rlc24vN2NtVGVpUUd3NVVHTkhwdnZJU2svZEF3WWI0WVhicUpnQzVkOFE2?=
 =?utf-8?B?NWhTbytpV1dQWGQ1K0NQYmRGUGM0V0dTMk1iR3hYdUZ3SFd4RFJ3RGE5SmFZ?=
 =?utf-8?B?dHZnYkRVUFc4bURLZ2E0eEhSeHZYUjdVTG5YZ3U1OTd1b2R5aUtBYUpyT3Y5?=
 =?utf-8?B?RmVJdGU0UW1GaWladFJXZEg3bjRmUmFwdkYxdW05VHF2RTNnOU9jb25Hd2dN?=
 =?utf-8?B?NUc2cElmV2lPd1RrSGE1L1dER0pPV2RtUTZSRXF6TnVMakR5eWxtMWFhVjhE?=
 =?utf-8?B?T05FZmR4aEFyK3FXUXZrK0tOK1V4VWJaS29NTWN0clA1VDhGNjhyVGlEMXJY?=
 =?utf-8?B?dWNKUTBVKzNIcFlMRXNOaTVEcStCMHBrUWkzRHdCMXFvdkVaNXdiMnNiK2NH?=
 =?utf-8?B?aEZUNTdwRTgxdUNYOWZvdSt2dFZWcVhxZWhoK3ZLbzZWWmQrUklQQzBTRHYw?=
 =?utf-8?B?ejhCVm1BNFR2VzFmK1BaYnJDTTMyQTZHMzNvRmZYbmYrMTNFVmUzc2RIQ1hm?=
 =?utf-8?B?V2cvS01BSmFtbG9PVUpkVjVyUCtyUHFMOFpHZ2VYd3ZoalphamRuNFhod3M2?=
 =?utf-8?B?U1pod2hyZHpyWXhBUEovaXQ3MUFvMXRmaVQyellLN0NtTkt0cm5vZ0ZqTm9V?=
 =?utf-8?B?TEJIQzJRRXdIU3JpS0R0Nlk1Q0xpNVBrVUM5U1NQNDFYb2FNc2VqcVdBVU80?=
 =?utf-8?B?bUVCT3dLM2NscWk3elZsRC9pd0RFOVgrR3FPK2I1RW5CTlViM1RjRlliS292?=
 =?utf-8?B?RTNHS0daRUlhSmlOUGRPcUNKV3VOSkpST2FnTHlsb2pMSWFOdVp1TUNpZDFS?=
 =?utf-8?B?b3h0RWRVdGFFeExSZXVzenBTOEFHZS9hRjY2V25JNmd0SW91NnhvcUpVakk2?=
 =?utf-8?B?dk8xQUxZbk5qR2svOGYvMGQ4b0RDVUhzQW8rQms1VGhJaUMxbmc0cEhzUVFX?=
 =?utf-8?B?czZTV2Vkd1Zqc1A4QTVaMCthQlNRVEZORmNLVTZVdVBWQ25tMW1LVTBxNDhw?=
 =?utf-8?B?c1JENnUwdFhlbUNUWHBIb2lIakIrb2lTdFFxU2VQcUgrcUtFZVB6Si9YM0JJ?=
 =?utf-8?B?RzEzQ0xrdklBRXBIRVRCWXFubGJLYkx0TGNSSlovOHVGSTRQM0p1UDhqeURp?=
 =?utf-8?B?VkN3bzlxOC9zdGtTcGJVSG5Gclk1TkthOEJmaEdBOVk4TVJ1Y0RJcW9zMEx0?=
 =?utf-8?B?ZzJzckVkQlBzT1hhRTZtVWpmd0lYeXlPakMwMU5wd1RIbDd5aHRvRmZhY29w?=
 =?utf-8?B?NFg2anRidXREeUR4UXpiaVZFbDJsSzdjcnJDaFRQK3l6ZFZQZUF5T29pS1Rn?=
 =?utf-8?B?QmtNY3Ayb0NQd0VDNHQxcWxGZnJxRUd3cUxjYzFWVlFuN1ZaUm00dW9KbDhI?=
 =?utf-8?B?N045cGFzYWVrRU5wb1JpUWZUZ205WHp0QVJyS3VBdS8xR1gzdS8rODBFc0Ev?=
 =?utf-8?Q?PpEmBRzBl3r1mMKzL7dVexKe2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3542f244-c8d3-44b3-2c0a-08da5fef7870
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 08:05:35.1598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaJpVCBP00RblNNqy1OXQ9QYd7OUhBPR+jFJ+YD68i4nRYeGzWe6ddJfTNgLpb3H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2752
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.07.22 um 10:02 schrieb xinhui pan:
> Need get the new fence when we replace the old one.
>
> Fixes: 047a1b877ed48 ("dma-buf & drm/amdgpu: remove dma_resv workaround")
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>

Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push that in a minute.

Christian.

> ---
>   drivers/dma-buf/dma-resv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 0cce6e4ec946..205acb2c744d 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -343,7 +343,7 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>   		if (old->context != context)
>   			continue;
>   
> -		dma_resv_list_set(list, i, replacement, usage);
> +		dma_resv_list_set(list, i, dma_fence_get(replacement), usage);
>   		dma_fence_put(old);
>   	}
>   }

