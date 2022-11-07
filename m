Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F5B61F507
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BAB10E19F;
	Mon,  7 Nov 2022 14:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF7010E19F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 14:13:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1S2qKBE/Ud15knIJZPEhAiEL4o8MI4IdH5wiE702oJm6VLk5oPM5EVufMr2vuHutxUwojvRSdyvE+4MrwNNdcv6iWGyExRjgYfg2qYd5nC0UKiAUM2YgHST+PXgjM7EF21AL70kLZfJMph3bFnr7I+nOCtxTBs7X1roXiW/6pOSy748MsUN3xFDEDO2CARdMZs184VVJFn6m9jsPf1focV80Uh0zIhXM8s++gsL9HRXMOeL479HyzXZLY4JbDISE80qm3KIFquxZIRXQN9fZC4wirK3MaLh3Zm/CEIQ5Ju5p6XTHEIzSpzhOyL+Q+LYnBdPHhiZFY+zoVkqOXoZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ql8iMkSU+8aDD1+DxdykrLn3lHixabxtbxK2cnvomIg=;
 b=NrBL/b/nIwOZu+g/urCUeE4DwKO3iOz2+3ZjUKk9hDFIwlwCr0kc2ZOMaks2Xrp+N+5JqhkkC1Gr73aIq7JhiMVQirJHOUZSLZr2W3QLatKgXozv9e4+vrojtbO3VOvOuzuVSN9TInIzGaFTQL0t2e2fwA+T+DfMB3sIneP2mA2PmIG9Nx4kMnDYAKuQwMOTpYJ+T0K+Knts+YAVjjGFyOYrYIusCKSNzWhB9pyw2s5F1q5W7KZgXec9+xAApZSMfxjChucpIWKcONiN1oMpdEbOOCwxyrIhfPggUl1fQ2+u46KJ2PQ6gEI+tgKL0rANGO4gbzY/ZMIKsJPOIVAKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ql8iMkSU+8aDD1+DxdykrLn3lHixabxtbxK2cnvomIg=;
 b=VdupVe7WFojTLZxrMc2Sv6BIASMWDWZRQ8FEkQra3/uCs54R5kSlks1rXQNSO0iqztghagaeTUQO0gcSW7fQEI/QcbZMXrcihrE9tMz8Yf2m8tsJY/dzPIIUBc7TjHG8Q9ynsZi72SfqHZNKU3dpVvlj401L4iKzjL0m8kotZOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4531.namprd12.prod.outlook.com (2603:10b6:5:2a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 14:13:03 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 14:13:03 +0000
Message-ID: <c7b5a907-1e1f-46ba-ec1a-dd40c33dab37@amd.com>
Date: Mon, 7 Nov 2022 15:12:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4a 30/38] timers: dma-buf: Use timer_shutdown_sync() for
 on stack timers
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org
References: <20221105060024.598488967@goodmis.org>
 <20221105060200.357061890@goodmis.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221105060200.357061890@goodmis.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4531:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afc4d13-d90b-4e92-a6ed-08dac0ca2f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igPtnsWhTDGoPW0r+/sLsU+B8nGZilZVER3uNM8hKCWcW6F4zkD3EemdDTaGAoxKwUpBoOT9Xf0SSkGryOGlWCnnSwTzJ0Or4kdA9NQ5yAbLCdTx3l8kppeAL0ZowIT4meFc//BgdprlTTnOZS5vEOKZA/IAFvrIQBm/xhIJCuDLg//Adp+qHvvc1uyoVGIxcWwmupUDoUuQZrkhbQJyefn6dyZoDtdHe/LNlakwBE9YB49G5cfuT+Fr/+EHbVlp1cm3DGUAtXv+IuOYuQ07E1j4H0PoPVGvUkelbDd8jxVUg44FKs7Y16uQTXLAxiOCPaPWfTqjSGproIsQ6dLFmzc9yGayv79fQ33CJPL5q2URP7F8jaQLHAkTu6I6ydrDTQu1zlhOlLUOWtXb8NhzjuJHY8rTTlDZN3xD4bvhSvUArBqJYFHZkw/ZggiNq0knGt7wkoZ9V1/sT0tQdLKX7nDN/Ky6d4grztwg4n2TbezCT9B0B5uly3oydwAT2Lx2f/cMnVPnF417JBzsQGpe0Cp40WOJY/wYWWVSsZkV4gHbEX4+gcpa1TlwbRHJOzKVJLdw53cZQzuv+vMK/UrK6oQsrjyJ0YSrjnhwz4Bdq4weQVekvKPAvKASJDbe2HVK9yJbXZNJFBPOWGPrncEsCzDIUc6pAANyyNXQCv/YoJUKjIg8YGlZb14TyZo452FPGpXfvUEu3voXe1mbJTSgtpv8s0oLvJvgcyXg4pwO6ZXge7QCiicfSOD65M7NHedElDCQPuHLNrmEFFPPNR+AuuBqKt+9+koHuRrvBgQ3thfJM3yt4umM66tBAtIe6vLvrcNQOuV5rBsHiIrEg7zt7OTmJqOAT9VC25Ho+JoaHX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199015)(36756003)(31686004)(86362001)(31696002)(2906002)(6506007)(7416002)(5660300002)(66574015)(6512007)(26005)(83380400001)(38100700002)(186003)(2616005)(8676002)(4326008)(66556008)(8936002)(41300700001)(66946007)(66476007)(316002)(478600001)(6486002)(45080400002)(54906003)(6666004)(966005)(42413004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnlVMkIyRUovbTdJd0JkY2Z0ZHp0OGlGa0Z1YmVsVC9tNFIreCtrOStYcXhp?=
 =?utf-8?B?YnFsTlV1bFEyNmR3MHhTM1pRSkRac1NiMTdwTEtUZGpQRUZNWUZsVzFIQkZI?=
 =?utf-8?B?OU1yTldiQkFTU2UzK3k1NllKVUVnaENzYXlCcXRFK2lQa29tT0g1OTUzb0hE?=
 =?utf-8?B?cmU4clFiaE9RODhrMHVsaE5DZUlOazZyRVBDd3BRSjc2RERZMHRDZXZSeDhl?=
 =?utf-8?B?WWFWbWVLNnFQVFVxdTRQV01vSTJGOEI4YkR6bU9HU3Z6ZWF5MFA5REJqYW5l?=
 =?utf-8?B?SjZsVi9nelIzcHRjdWVDY2wzQXRzZGdkY25vMm9ralBEbWdCU3VUc3IvMjhP?=
 =?utf-8?B?aWh0WVpGVkNmcnFSL3FJdVV6OFpEWmVYWmdqOHp2MWo1V01EVDQ0RWJXdUV6?=
 =?utf-8?B?ZEpTZFpFT2ZyZmNUczJydGxyVEM1UW04cG04OTVwRnVUN24yalY0K3RTMTBN?=
 =?utf-8?B?S1ROTVpKMEwyTXF4ZFBJSzZGelNxOTFBazd4OFgyayt5N043NnIvVU1NUXJp?=
 =?utf-8?B?NXphTzBCQUw1VytQc1JPUWNnQ09GWmpCWk9iQkU4dklvQXRDZ3Vram1zTVkr?=
 =?utf-8?B?THNKbEROckpWMURxcmFtOHJKYUNSL3VQVDFHREEyV2Nib0RNU3E3TW5PczRy?=
 =?utf-8?B?RVp3QWUwU1k5YjNxeEpHWncvMlFvSFBwK2ZGb2R1NmxJUFJxNUJPWW5RSEpW?=
 =?utf-8?B?ekd4RnJDZ21uRVJBbHV2dUxmWWJHdGJMUlBLaVE4ZzJFMGFzTHN4UmNHMUw0?=
 =?utf-8?B?Z0tPYXNTTmZwdjRXK3pLZXpGNU1Oak1EeWl2NklxOGh2NXFFQWd1OUxQV1Nu?=
 =?utf-8?B?NE9XRlQ2b2tWYUw1N0RlREdKTTQ0bDh3Vk9mTmVXNm5JOElTM2tRSVA4NUdC?=
 =?utf-8?B?bENpNTd1R2lWY0N2TDNvNU9wdFhyZWEwTjd3b05kRTVPcjNqQmY0RUVBUThJ?=
 =?utf-8?B?Y0t2anlYZS9CRGtJa0QvRjRyOUVSQ1BraXVvM044Zm9vbmRoYjNxZUkxZmVj?=
 =?utf-8?B?cGM1b2NBODg2WkxudlI4cGt1N25mbjM4d212ZmphMCsvNDhXWk9pb3JnbU5s?=
 =?utf-8?B?SHkvSllGbGdTOStvN3VNTjFvZkdhVWVtQTRPNWt4c1U5NkNxaGlnb2ZIc0No?=
 =?utf-8?B?ekNxRkNPOElwUm1FYlhYR0d6SDVBa0hrWno5SnpkOHdETDF3ZWRqZHJGRWdF?=
 =?utf-8?B?dTlmSkp5M1Nyb0M4SEtPWE5kbEtyVHZZc3A3VUdPN0xLMkt2cnFYclk5eDQx?=
 =?utf-8?B?TGlKdzdFNFg1WnllNEp1SVJWekpQZmVQcWFITThQbElTM3dRQ0Z2SGtPN2ZC?=
 =?utf-8?B?NXVSMTQxcUM0bkY5OEpBRHNRVGU5NjBveGNORFBqKzhGL0Z3UzVkWGczN0Vj?=
 =?utf-8?B?THA3WUsyRzBVWUswTHBXRDF0ME9KWTgxTjZLcFMvMHZKTjR2OHl1N1lEQUpX?=
 =?utf-8?B?NE00N3ZoUm93OHZPNE1YaVN4MmFCa1ljYjYwWmJ2U3l1cDlycmw3OFFFWGpO?=
 =?utf-8?B?QjF5c29QNXdGVk9QdVYvYzJoWUd1UDYvazNsVDdPdWF1MldjdzQrUTc5WkJI?=
 =?utf-8?B?VzdFMGpZd2Z5bXlGcU9jMHpaUTBCN0NNdzJWaEJZR1ZMQUtXUTBWRFZYR2pj?=
 =?utf-8?B?TnNob0NQdGV3Um1IK2R3Z1NINk5KeWFUaE5iZTJrZjJrcjJ2dW12djFmWUNS?=
 =?utf-8?B?ZGxZZ1lCR3pIbksvYk9YUXkwZkRIL2VyTnNFTkFMTFVWaDRyMjEwZDFLbVRG?=
 =?utf-8?B?eThXU1ZRZzVSaElOTVViQ3dxc3E3SFZONlA3cU1sNFovcU8vRVZaK0xBWDRK?=
 =?utf-8?B?R1grSnlZdFVEbXZ4UUVWbitPRmk4cXJ6RXdEL2RLNStJTmpCelBiQUNNRE1I?=
 =?utf-8?B?eEdiLzBFcHdUR21MMHV5T1FmSWhkRVZrdjFJTVcrU25NWG9NTE5nOFZaNGZZ?=
 =?utf-8?B?d3lZc244RCs3NUs0SUZhcms4d3JNU1FqNzgrNkJDMllSb2taUVJBcXMvQmZh?=
 =?utf-8?B?eHlOMk05Sm80TzlId2k0ZHZaMmgxYkpDNnR2akpQNkdRM1V1THlwOVhxNGV3?=
 =?utf-8?B?KytLSHR5N09pbCtuVDRxSit4ZlU1aFVncnpndVN4UlJhSUV1SkVLV25wdEUr?=
 =?utf-8?Q?e02Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afc4d13-d90b-4e92-a6ed-08dac0ca2f3c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 14:13:03.7433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gvJIo1JOyHcnEFohV9OttjXZMlQVuClPW6K0L3xPOgLt5xe9RlJBnWY9ybMQl3d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4531
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Gleixner <anna-maria@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.11.22 um 07:00 schrieb Steven Rostedt:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
>
> Before a timer is released, timer_shutdown_sync() must be called.
>
> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20221104054053.431922658%40goodmis.org%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Cfdadde8d801e48fecafa08dabef330f4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638032248997820518%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=mEL3bFU7fZ7kSrz3vv96opdAyt7Ew4UeY2nNF%2BhDmfc%3D&amp;reserved=0
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/st-dma-fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index fb6e0a6ae2c9..5d3e7b503501 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -412,7 +412,7 @@ static int test_wait_timeout(void *arg)
>   
>   	err = 0;
>   err_free:
> -	del_timer_sync(&wt.timer);
> +	timer_shutdown_sync(&wt.timer);
>   	destroy_timer_on_stack(&wt.timer);
>   	dma_fence_signal(wt.f);
>   	dma_fence_put(wt.f);

