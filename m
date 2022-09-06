Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CDB5AE0A7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 09:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04F110E578;
	Tue,  6 Sep 2022 07:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0824F10E578
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 07:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFHGXtr3Rc6jtLlVl7jJQv8+w1ed6qOiO/a3lc0FNdGG34u29H714AD4/X1+zJnNBIX8MhsZ3PmYYy40Qr+23PSKh1D1VJI3Ddsle50LTQuJJsZkBtb0Y9B06/bYLDVpWEAAC6O2pobpAE+j8l4KxKAoLZNzo27fsxFjQo33ceeCDBS/hLquvasVw4j44T2QhOdyVeoqGsgoopmkAyGj9F8LepmMrs5oWPTlBhHLz2bjZBE02Qd2Ty6NTp0XedrKamXYU7SS62kQCyC9AVhJNE29iByimGtMZx0AOryexyG6bsXgzmVqq5y3/LtuyrNMriwlmVdTXiANegcakX2zKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeTJhSLW9Jqcf1qj+5ix3ul9RyFVQzF+ODHImDZcc7c=;
 b=WBkkwPISzBxPZ9vWKJahKj+hzatqoIddEnHCMzIAD4uuQ5ba3wTvRghMQL1vl/U2cFGdKTJ0PV1d59k0c9/qOE4VgTZ6R9EpD5ugvLcjmepJbqK/rPUS0JbVKNbE3GFu//hc4wHVs39TcjzFDdb8dLWagXrzjo7jXrDDmzvACdUhHjeFeYowYUiwKRzc1WXj096mc28rjm1elpPwLQeHdmp3s4UMdt+NCuvceCoeyrOoQRbvP6o19Dv175YlUl76f0A+HH0qFIl/3qLGS0n+j6WoSFIpsirXDHZyRU6j6HCDbZKXWXuSPULB6/w93+cwkbxw26ekf2oV0w1NpQKAaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeTJhSLW9Jqcf1qj+5ix3ul9RyFVQzF+ODHImDZcc7c=;
 b=EMBqihw5wB9aKOQL7zVss1S4LQhG+tPY9NMG+dPs47mrpzjLPbtEuwlWlMhgsiOh33bDg0O7uSsvgsLUVzxPUYJDJHxqzJ40t53Gj9UrzSPeOo0CKuUBpr7katoce9SKO6/gclP7tjB44DnCOvdhMC/9PKG09h+xhpDNyPosdZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by PH8PR12MB6697.namprd12.prod.outlook.com (2603:10b6:510:1cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 07:11:55 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 07:11:55 +0000
Message-ID: <5f193427-0e12-e45a-0d7f-038078f2dde9@amd.com>
Date: Tue, 6 Sep 2022 09:11:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/4] dma-buf: enable signaling for selftest fence on
 debug
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220905163502.4032-1-Arvind.Yadav@amd.com>
 <20220905163502.4032-4-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220905163502.4032-4-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1241de91-2126-4f7c-aba3-08da8fd71483
X-MS-TrafficTypeDiagnostic: PH8PR12MB6697:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIpg3sKsDL4acd7wBWcW7sN49KCA7mbxXbbEbHpuSU8zK+REvp9Epp9nt/miVHLnbk3D+cW3Rq8MfShPZM3MpfbQcvNiud0AJvJcaxqwn0mcqM40G6ObRemJD6h8bB/wxfnfYZUHRgCw3BzeLUGSBeurAjBNJlneJFC+rTiXpDAjoSdpEBeJ6ajREZoKn513Pf8oWuni7KfAQCbFw7r9iX3Heyi6FIuSLBx0vXZPlJPGH05H2G/wIk0i2/HGMu7BmCon7PLQVERJhjY52d8TFwL7GKnAKwkdHoM2dQbm/4IqONswtPgbNcAZktw3t3p44D3Tw4BOyp7LfJv5713UZ2PaNK5AKbBUA3FSL59HPANyEJJW1lCUUg9P3WzDcRuDh7fFg/P11yzUcRKrqjyCuT9fo3BjY2aRlB3hfo9W8NBaotW9Hk3yUey6owbQMsjnenDRL2Jk/GAKl37nDdcvydf3NdzwpO2pDAFo+TARSNRmqmwzOlVhABBcQ206PTcXMrLEtfaip9dznOpiWMKBKJKJKPSFhhvXUC5/q19wmIVQ0c2NWWzR6gjKGyPNdkLZL5EK2aoBJRYXFx04+RUxknyeL0zi//EDy4l/EP/vdImzBOokCqiCV7xHYZ3XP5tmRd7eJguYcazkr4bX9LZe/loFFdAkgKpOIJgPUXnqH3F9I/4wa1MOMbvxNFtvZnCmEppWV/Z4Ye1W2bFgN+ODLoS6BRH93aJ9GrlyfvvjkgCEJ7IbToCxse6rAGVifIFijcTE8xpW3TTQPupxn3ieb2NdbvNv6cuq/byx+Mn4f95buPSoA47B+OmqEJzvl2QV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(66556008)(31686004)(38100700002)(8676002)(316002)(66946007)(66476007)(921005)(2906002)(31696002)(86362001)(36756003)(83380400001)(6666004)(6512007)(6486002)(41300700001)(6506007)(8936002)(5660300002)(2616005)(478600001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekVzMTNoSlhBbDVULzBhT3VBdXB1U0syWjBvckZTUWhPNGJ6YnF5d0NzWWZQ?=
 =?utf-8?B?VEtUNXRlVEVPbFJ0VXpOT0hTbXVjYnIxWUFYTmZuUW9HeE1XN0lGSGNGdVN3?=
 =?utf-8?B?UXYrYWZjR3VmMlBveFIxcks3bzVnVUR2MFVpbENOZ1VwNVVaYUcvRk85ZVpN?=
 =?utf-8?B?cks1OFUxbWVRRDVHRSsyRUF0Snh4cjdxbVdwS0NETFJYMnVwM2xVd0xXbWtQ?=
 =?utf-8?B?NWRLRGkwOFppTitvSWhzdFdOQ2NuYTNPQWsvVFk1VndOR2NuWStFa1kraElm?=
 =?utf-8?B?TTh5MkxkUU5KMWJyc1lRN2lTYkFTQlZ2RVdVcXdsWXNtK0tyT2YwaERrUVJI?=
 =?utf-8?B?L1l3RnBTYmpBQ09uZHdmRTNMRTVDYVkvbFpHcHpqZFllTXlhL1VSY00rT2d5?=
 =?utf-8?B?Y04yc0ZhZUd6Sk81STF3THFVSVJ0UmR2dWxnbVQwZUpuckg3OXM4YmN5VG5w?=
 =?utf-8?B?MzAzS3ZnVUwwQWtUbVpIK1NTd3NGRCtnaG1Ud2lpQVRmSmlKdlhldlVzMDNO?=
 =?utf-8?B?czdtZEN4RVhGaWFUMDd0ckJvTlpNOGZONVo3Y0hhRHdRbVJQSGY1cU5keGR1?=
 =?utf-8?B?QmpoTjQ3WGxsbE5vR0czbW5qb09ZZ3ZMSUM4bStib29zVXBvWkJpRGx4Zmdx?=
 =?utf-8?B?SEdTdFhDTzNTTHJGYWUraUp2OVRVOXdBMGdDWS95SzhCaitDQSs4Vkk5WTZN?=
 =?utf-8?B?U2RLaVJHU3JtNDV6cVo1MDRXZnhIWnZGU3M0em9IUVZGd1pUOENrdURhcVVV?=
 =?utf-8?B?TnJ5OThQNzNsTW0wRDdjbE4rRW92VDFJc1d1bGFkSWN6U0xKVEl1enZsQnNh?=
 =?utf-8?B?WENKMExERlorcGRpSWcvaWlKU3dJeFhLL0lRUVRpVzI0SlFnOHVnd2N0M3ZT?=
 =?utf-8?B?L2xxQXowamV1SnVjUFNZejJaZE1YeHdjVkczOGNOTkR2cDUzU2xYelJhT1Zz?=
 =?utf-8?B?M3htOHBNSFBXOC85cEFyUWNmOWJFcENkTHpXdWszeWF2VjdERmlPMVlGNVRm?=
 =?utf-8?B?SDBXN3JkckJMMEJpejJjWmE5SmNCcVZVanRXNGR5d0FNWGMvcW1lbld2SWs0?=
 =?utf-8?B?aDl1eHFHK1ZYVTBvMkJjbzlOUUZheS95bURZbm5yN0RiQUt4Z0x0bitrTlNV?=
 =?utf-8?B?dGpFb21jYkg2UUNVYkVSdHJLMkhyZVRNWWZsWEszUjZSSzA3b0ZPak0zNm1I?=
 =?utf-8?B?TDNWb2p4T2dsYm01cVIxdVJ5TkxvVU5TYlBCZWovaDExNjlKcVFHdnFudVU4?=
 =?utf-8?B?bDFwQ2YwSHorbEZ0b1ZJUG5RSzh0c2d4TmZFWEw2NWg4Q1dzZ3ZnK24rMyts?=
 =?utf-8?B?STVUNWswWkZ0aUhOaDlIVndBL2FXT00vemhBWFE4aTgwWG5Ra0Q1Mi9rNmZp?=
 =?utf-8?B?RW5UcmJLUnBvYWFwcmFPQWFiTkdjSnNtSzNPWE0vOGNMNmhaNC9CekJzanFv?=
 =?utf-8?B?ZU9BVXEyZHJ1WEQ1cEJITFNRdzlaMlp5S1k4bmNwdHdOaHlnZzQwSkIvcm9k?=
 =?utf-8?B?aUR4c3R4VUxjVEZmV2lweEpiWkxRakphUU5ycVA1d0JISlhibzNSU2xWK2p4?=
 =?utf-8?B?M1NkbDg4VHBsSVhlMUhORG9VSHJzdWVyREJadjF2eEo2Slp6K082TjdwSjdW?=
 =?utf-8?B?eE5kY3Q0NzBPMGxKcGU5UW5JUmlwSm9sNUtKdENIMHNHdVNZa0xrZmJkVHJw?=
 =?utf-8?B?VkhQRlJHTDFjNmZ1TlhVYjJWSUpaN2dkcGk0SkN0R2ozYmxqWEpWVGtrOGlw?=
 =?utf-8?B?Y0JQVVRBR3EvN21Md3ZKbWRaaFgzd2VxNDdSa3RPTHhwUW4reGRIbkFybjQ0?=
 =?utf-8?B?ajNVMTN6QW9tcURKUzZUZmxwTjA2VkR6dHlpVCsyMkxzcVlHcmpBaDVqQitv?=
 =?utf-8?B?NEtVLy9EWnJ1b01NWWJHNUIxenYramdRTms0Mlk3QklmOU9KVjBvU1dVTnRh?=
 =?utf-8?B?MDJBL2FsallHejM3VCtZN1MrM0U4M3grNXcwUFBEQU1uak1wOHdLN0hTZHFP?=
 =?utf-8?B?bG9wcVZhTE1PTUh3cGZxUnJNUFBnRENjMWI4QXR3V3NPdTROemlzT1pTMjdU?=
 =?utf-8?B?YWkwMVVtOHh1L1ZaRVNlZ1VqWFU2L1hoeXFQRUlKeGZSb3MxUVR5aWQ3b0lL?=
 =?utf-8?B?SXgxR1N2dUpDY2E3aW11NDQ2ZXYxMndzaTdSZE1uTHY2eElIN0tKdmJUaXpY?=
 =?utf-8?Q?QHyNH0MGgHu47Qpbq+Xq5BbecAUF+7f1j0GJQsMxHXUG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1241de91-2126-4f7c-aba3-08da8fd71483
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 07:11:55.2666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zv2/YWuVRZTpRXAV8lVcdahOrR156cXSfkSyCSG5ix8JuiZkouEArbbdUbyNlRO9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6697
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

Am 05.09.22 um 18:35 schrieb Arvind Yadav:
> Here's on debug enabling software signaling for selftest.

Please drop all the #ifdefs, apart from that looks pretty good to me.

Christian.

>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>
> Changes in v1 :
> 1- Addressing Christian's comment to remove unnecessary callback.
> 2- Replacing CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
> 3- The version of this patch is also changed and previously
> it was [PATCH 4/4]
>
> ---
>   drivers/dma-buf/st-dma-fence-chain.c  |  8 +++++
>   drivers/dma-buf/st-dma-fence-unwrap.c | 44 +++++++++++++++++++++++++++
>   drivers/dma-buf/st-dma-fence.c        | 25 ++++++++++++++-
>   drivers/dma-buf/st-dma-resv.c         | 20 ++++++++++++
>   4 files changed, 96 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
> index 8ce1ea59d31b..d3070f8a393c 100644
> --- a/drivers/dma-buf/st-dma-fence-chain.c
> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> @@ -87,6 +87,10 @@ static int sanitycheck(void *arg)
>   	if (!chain)
>   		err = -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(chain);
> +#endif
> +
>   	dma_fence_signal(f);
>   	dma_fence_put(f);
>   
> @@ -143,6 +147,10 @@ static int fence_chains_init(struct fence_chains *fc, unsigned int count,
>   		}
>   
>   		fc->tail = fc->chains[i];
> +
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +		dma_fence_enable_sw_signaling(fc->chains[i]);
> +#endif
>   	}
>   
>   	fc->chain_length = i;
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 4105d5ea8dde..b76cdd9ee0c7 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -102,6 +102,10 @@ static int sanitycheck(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f);
> +#endif
> +
>   	array = mock_array(1, f);
>   	if (!array)
>   		return -ENOMEM;
> @@ -124,12 +128,20 @@ static int unwrap_array(void *arg)
>   	if (!f1)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f1);
> +#endif
> +
>   	f2 = mock_fence();
>   	if (!f2) {
>   		dma_fence_put(f1);
>   		return -ENOMEM;
>   	}
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f2);
> +#endif
> +
>   	array = mock_array(2, f1, f2);
>   	if (!array)
>   		return -ENOMEM;
> @@ -164,12 +176,20 @@ static int unwrap_chain(void *arg)
>   	if (!f1)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f1);
> +#endif
> +
>   	f2 = mock_fence();
>   	if (!f2) {
>   		dma_fence_put(f1);
>   		return -ENOMEM;
>   	}
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f2);
> +#endif
> +
>   	chain = mock_chain(f1, f2);
>   	if (!chain)
>   		return -ENOMEM;
> @@ -204,12 +224,20 @@ static int unwrap_chain_array(void *arg)
>   	if (!f1)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f1);
> +#endif
> +
>   	f2 = mock_fence();
>   	if (!f2) {
>   		dma_fence_put(f1);
>   		return -ENOMEM;
>   	}
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f2);
> +#endif
> +
>   	array = mock_array(2, f1, f2);
>   	if (!array)
>   		return -ENOMEM;
> @@ -248,12 +276,20 @@ static int unwrap_merge(void *arg)
>   	if (!f1)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f1);
> +#endif
> +
>   	f2 = mock_fence();
>   	if (!f2) {
>   		err = -ENOMEM;
>   		goto error_put_f1;
>   	}
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f2);
> +#endif
> +
>   	f3 = dma_fence_unwrap_merge(f1, f2);
>   	if (!f3) {
>   		err = -ENOMEM;
> @@ -296,10 +332,18 @@ static int unwrap_merge_complex(void *arg)
>   	if (!f1)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f1);
> +#endif
> +
>   	f2 = mock_fence();
>   	if (!f2)
>   		goto error_put_f1;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f2);
> +#endif
> +
>   	f3 = dma_fence_unwrap_merge(f1, f2);
>   	if (!f3)
>   		goto error_put_f2;
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index c8a12d7ad71a..b7880d8374db 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -101,7 +101,9 @@ static int sanitycheck(void *arg)
>   	f = mock_fence();
>   	if (!f)
>   		return -ENOMEM;
> -
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f);
> +#endif
>   	dma_fence_signal(f);
>   	dma_fence_put(f);
>   
> @@ -117,6 +119,9 @@ static int test_signaling(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f);
> +#endif
>   	if (dma_fence_is_signaled(f)) {
>   		pr_err("Fence unexpectedly signaled on creation\n");
>   		goto err_free;
> @@ -190,6 +195,9 @@ static int test_late_add_callback(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f);
> +#endif
>   	dma_fence_signal(f);
>   
>   	if (!dma_fence_add_callback(f, &cb.cb, simple_callback)) {
> @@ -282,6 +290,9 @@ static int test_status(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f);
> +#endif
>   	if (dma_fence_get_status(f)) {
>   		pr_err("Fence unexpectedly has signaled status on creation\n");
>   		goto err_free;
> @@ -308,6 +319,9 @@ static int test_error(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f);
> +#endif
>   	dma_fence_set_error(f, -EIO);
>   
>   	if (dma_fence_get_status(f)) {
> @@ -337,6 +351,9 @@ static int test_wait(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f);
> +#endif
>   	if (dma_fence_wait_timeout(f, false, 0) != -ETIME) {
>   		pr_err("Wait reported complete before being signaled\n");
>   		goto err_free;
> @@ -379,6 +396,9 @@ static int test_wait_timeout(void *arg)
>   	if (!wt.f)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(wt.f);
> +#endif
>   	if (dma_fence_wait_timeout(wt.f, false, 1) != -ETIME) {
>   		pr_err("Wait reported complete before being signaled\n");
>   		goto err_free;
> @@ -458,6 +478,9 @@ static int thread_signal_callback(void *arg)
>   			break;
>   		}
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +		dma_fence_enable_sw_signaling(f1);
> +#endif
>   		rcu_assign_pointer(t->fences[t->id], f1);
>   		smp_wmb();
>   
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> index 813779e3c9be..bd7ef58f8b24 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -45,6 +45,10 @@ static int sanitycheck(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f);
> +#endif
> +
>   	dma_fence_signal(f);
>   	dma_fence_put(f);
>   
> @@ -69,6 +73,10 @@ static int test_signaling(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f);
> +#endif
> +
>   	dma_resv_init(&resv);
>   	r = dma_resv_lock(&resv, NULL);
>   	if (r) {
> @@ -114,6 +122,10 @@ static int test_for_each(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f);
> +#endif
> +
>   	dma_resv_init(&resv);
>   	r = dma_resv_lock(&resv, NULL);
>   	if (r) {
> @@ -173,6 +185,10 @@ static int test_for_each_unlocked(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f);
> +#endif
> +
>   	dma_resv_init(&resv);
>   	r = dma_resv_lock(&resv, NULL);
>   	if (r) {
> @@ -244,6 +260,10 @@ static int test_get_fences(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +	dma_fence_enable_sw_signaling(f);
> +#endif
> +
>   	dma_resv_init(&resv);
>   	r = dma_resv_lock(&resv, NULL);
>   	if (r) {

