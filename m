Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B415B54D1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 08:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7A610E225;
	Mon, 12 Sep 2022 06:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51ECB10E225
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 06:51:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQ0Vdx6P/ey4eGWkG1o0KUlj1f0S9FY0ESwL4fPXZNmm4yAVT+hERpyHMZhnrtdrXC8mcH+XohGNDxxq5uimtsIL72p/N+d43stkdq/MWhNRa2fYfyzocfZzjh0tRjV/Ap79MkMLXqEPhTd8AruXuOUppkJB2skZHfxU4NrTkP3gJekp5xQVkp22kwqOl/kVPKvLS3V54F5P5CRlvSzNSJ88Qu5C4C2EpYpoDl1Ml5vYDgU9Dkl2xphg3G7EgJEIfIH/kqa9aUX7iAJ819BtFzE5it6VUGJaFbwqozWvIgMkYDN1DpCqoJPcp1C+/bBsCtg6EpTZyhXBXYeZcgudaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQ4w4GSEnUwYoghqoau9IeOBYn1h2NlUEk0Ug8Fh6t4=;
 b=JeFGAf/kIaY4Q48SyvCFmIe9lVNm2wSt3Qnz9CvMXdwiVsbFfnEToDs3tJ2lFd9zxoNqdJtwSisiwkKIcq0hTRPZiAE/QNIn02WHk1Ut1EHQUgXhGtFseV9/+STHgf2HR6DEaBQmHr6hEAcyKRKH8rDd1w4LaFrjTjBd0/lWnMvX2wB1VxBo+0zgrBt0gUj15JUda9SS3cTsA2D3ilr1Tr46TL1OjwW8Uja06M8UiXAfmOm91OtBFNM7zp/f45qKtrv5ZmVMOoVxogmisHRFo9KcrE6p6yxnTZWvLyPT7KbLc2WuZTqxFNffHQcRJj8aoxDUeQeWpMqD7XEmdAfyXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQ4w4GSEnUwYoghqoau9IeOBYn1h2NlUEk0Ug8Fh6t4=;
 b=J5d+hAyirO7en1QBQJhr+mQZoyTKZdIS6xmRUBppce9C6pxyTwxryShz3KElWVv5S0yQ8lTYiSjqUzSDV2x4cgHM9HZZZAGI7UolpkuNjtv0Dhb93Y/p9GwBMfx+aZWjuXo7diUQsknH6xOZJxC84bdkfUZiYw0WhrDnygvJx1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB6794.namprd12.prod.outlook.com (2603:10b6:510:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 06:51:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 06:51:20 +0000
Message-ID: <850b8cf5-27b6-9b12-a5af-bdd4b5b3d9a4@amd.com>
Date: Mon, 12 Sep 2022 08:51:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/6] dma-buf: Enable signaling on fence for selftests
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220909170845.4946-1-Arvind.Yadav@amd.com>
 <20220909170845.4946-4-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220909170845.4946-4-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b628e6-0e5f-468a-8e0c-08da948b3308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kfAgNIIwveNBiycFEBW4bBYFy1bwS9F9/kc/VClh/V8JrLIW6/yyASf85jVDtUBnsIduU4zDTBKuY0atKhFfCk+KGhHcdxvVpwyQRGtse6ZYYBdTAVTHKTKDmhkuEkJXzUiLmFwR/1Txl2Olsj58lxLqpaPGE6ALIoUFQ4uxa/s0f7T0GTSUhHBEb5jmPEc5LzgsjeSomnhQsiSbINbIO+yUrwB5qcTV5uHqCBRB07VI96qzPPRJgmZlYiQ+IjElzZGLtu6uhQwqk0iDNGPoxTWj+XRAHBUU1ng6v/XPfSL7rF50alTWpbpX3WkcuxhRLnsNGMFhsCOWUs2gzyGQ+A97BSb5HDkJoKvl8x5xUZ/2OPdmmdsVAlbAe8+qMk7cPcwNBtSKlNgygaeWIAgHqWGS/j4aYP2nFCEGo/XJ7qMiDyD8IIGz0DpnTPxV7s358pVxSD70Z7WmfoCWU6+xr485w7qHYhcz7m0z8OurkotLQQuU+/VwAby7dkIQuTLeo4gapZrEIHCRZGZ3B/ZPIRUplTf+SoZ+dRw5Ctd7IKvMJQ0R+7IaaWqI/DLsGJ613BhbaP/tAYWmHni80q84CgTRS16dYraCk2M3at5Mz1ti5vLd0Jk8GWnuKapmPnSiqcTyMSqUaj0VQbmB82yS0VFgoyj2fnMOXbV6Z8rm8y84gWtcQmSGE9rjwylpV9ik4zoK1GEe6ckMrlS/u35iHNbRf0UPzaN+lTdb/2GbC4+54CtckrBWj/4m27xfV4OjJZc3DImZ8tAQnxVVYAxBrYxoPdNLNqcbD+RcmAqjx7Pr6924MJcnk5aGWH1WlpLh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(6512007)(38100700002)(66574015)(5660300002)(31696002)(66476007)(66946007)(8676002)(66556008)(86362001)(8936002)(83380400001)(6486002)(2616005)(36756003)(316002)(6506007)(2906002)(31686004)(186003)(921005)(478600001)(6666004)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk50bzZOUnJOVlErNld1LzcrdTV5ZG15ZExHaGtWanBlekhpZEpBOWlsWDFn?=
 =?utf-8?B?QXoyK0xFTThNMHdqWmphMy9DdGVwdkxlWHpWZU44dDk0Qzl4bGFPKytRVitF?=
 =?utf-8?B?MzczcjlCT3VKczBib2FuMWFycXdnb29obnZNU3o2MjVsazdyUVp3Rkk2MEs5?=
 =?utf-8?B?RG5oc2FrU3FZZVJ0R0RYUGhMT2NRZ0Ztd1RQSG03TFBaUUxmZG4xNGdUSDRB?=
 =?utf-8?B?WHRKNkpEeVZNcFNma1NRTHNRS1dJN0htYU9XSmpDa253RTlzcjQwVHRzRHR1?=
 =?utf-8?B?M25jWWt2dFNyR2MzWlB1OStkR1Bxa0JJOVA4eDBiZExYTFpNN0E4YVUwRzFM?=
 =?utf-8?B?YmN3UTVYY0JxWnhNVXZOSXd4TDdKWVgrcDNtaDlvVXFqN1l4OUR5SDBNVGY2?=
 =?utf-8?B?b21nVVB4cFRtZ2Z0VmY3L2d4Wlhvdi9NdWU3NUxXNENGRDUwaGNwaC80ZGNv?=
 =?utf-8?B?YTBHL3VCbzJZUk92WkZJQjhLWVpEc1ZoMTh0ZGZ6eE9vbUJlaXhZbWYrTURi?=
 =?utf-8?B?NGQwTGY0RlZnMzQzR0d1aHZlSjkvNzUzMzZURXI3L1pjU3FkQlZMdmYxQXU3?=
 =?utf-8?B?ZTZWTGdCUGc1d0FmRkNiL2xxS3lab0FOaTF2SnRkclVpUUwrZlFoVUVFUEkr?=
 =?utf-8?B?NlNVOG51RXN2TC9Xcml0MXJqN3JMQ2k4TkIzNlkxS1FBTGZWUllxMUVVNklz?=
 =?utf-8?B?WDBBaFZMcldaOTNXTGxtOUwzS0xBSVNqV0x5WS94eFpwS1lHejZIYThtR3ZD?=
 =?utf-8?B?WmtQL3k0dzZ3YU5kVEpIdXE0V1VMMGhlVDg0Z0FkVngzOXpSZ1orQUc1a2t2?=
 =?utf-8?B?bFRQTVhqcUhuSFFDaFpNUGlDYlJadlBJY2JNYlZDWFkrLzhsL1pqZ09RWVhC?=
 =?utf-8?B?dUlLRmMrTFRJSEc2bUJBaEN1NWM3ek1NNGZOVk9XdDAraVNjMEJZd011M2JD?=
 =?utf-8?B?NUk3aFhUa2NVUHhnNXJnTlluSTdsdnl5a0pFY0NwdHFUMjBsRHJvYU9DNXUv?=
 =?utf-8?B?ZktxVjVuM01IdDlpU25Sb0w1cTc5VXZ3MFA0ZE5lTnhaQmZ0VVlwdDFxVXdx?=
 =?utf-8?B?Wk5CMFVPencwMitJNU1lR1lxWC9zSXFIOGZ1M0VXdENrNzVyYjY0cVlIUW1v?=
 =?utf-8?B?TWNOdUdaZ09ScDBYZE9KRkJCTFBTcGtmYVVTV2RmckEyN1hiMzFhUzBxZlJB?=
 =?utf-8?B?TmpoTzhKTjRycEtaU0RBcm43STI0TjFlbmtLU1BGc243WU0vajhWdlIxWm1T?=
 =?utf-8?B?bjhOMkFSZDluWG9xU3FaWUtGdDlEOHY5ODJnUXozMDB0TWtPemdIREFmYnNu?=
 =?utf-8?B?ZEdiVEpZR29NRWdpRjRkUTczdjBXOUtLSlkyWlQyTi9xbUlkWStYZFdDeXFB?=
 =?utf-8?B?aVpwTmNRMDVEV3ZSZEJmemZMLytWSndpY0VBNU1sUlFRWGkyYmh1UlZzVDUy?=
 =?utf-8?B?WFJaTFZJTE02TzM1RC9oaWRqQWYyNlAyb1F5RGtJYTJsUDlFcU5Db25PNjRW?=
 =?utf-8?B?b01YL3hmWlNxVHN4dTJPU2crNVVvczBOQWZoSDgrUzBrQmowNFFYSzVQdjhp?=
 =?utf-8?B?UTkzZGxjSGFLMEJkSDlYQkZyaHozREJhdUJXc3l2TVJ5K2FVNGpHK01iYTR1?=
 =?utf-8?B?M1J5elNhY1FVMW1NZFBZWFhiK3NwZEZKUFVRcndxVU1pWGQwNVlRZWtwL24x?=
 =?utf-8?B?Q3Vkd3VUWElNUDlxTnI5WklmN1hjc1pRRGduK3BKZVo1bi9rTlZENDR2MjJN?=
 =?utf-8?B?VHZNR0lYMXJNTlJxTlJtbWtESllKZmpXdVZqSWhZTlZudVEwNkVzNitqaVIr?=
 =?utf-8?B?cWlIbUtUdEU5S09IYWhUQmZMWFJKY05venZpZXVHNitxcW5ZREFPbC9lV241?=
 =?utf-8?B?NDBLRy9PZmNSUlVMelg5WjFIUTNuL0Y1Nm5GWlJVR0FDcStQT1g3Yk5ueE5U?=
 =?utf-8?B?MUpHTkxWbHZoOHhOaHk3OHd4QXd3NTlKOWJqU3dhM2laK0I4U0NIamVVUTlO?=
 =?utf-8?B?b2x5QTVONnFjZlp1YXJ1UCszb2VRWWZnS0FDdzFuWHkrWU5VOVFLSS9ITFpR?=
 =?utf-8?B?VWFSbzE4c1V3UTc0MUNUTUFOeGI5aFdpeGx5cWlRblFZSDl4TEdWTHVKSTJ0?=
 =?utf-8?B?MnNsSmIrVFdHMzR2ZWxDcno5Znhrc2NqZWc2UTBZYUlCNDdrM24wcjdDZ0My?=
 =?utf-8?Q?HYodj0aWeU8xp7gbDNDJhHoN+opQmqiqpvE8lZPGYMBv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b628e6-0e5f-468a-8e0c-08da948b3308
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 06:51:20.5160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDj1gKPOZ3VctiqAWDf3aFP78Laa1VruQhKlRnLm3zqO7OOLBeGtVXsMr0Bn88tb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6794
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
> Here's enabling software signaling on fence for selftest.
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>
> Changes in v1 :
> 1- Addressing Christian's comment to remove unnecessary callback.
> 2- Replacing CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
> 3- The version of this patch is also changed and previously
> it was [PATCH 4/4]
>
> Changes in v2 :
> 1- #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH removed
>
> ---
>   drivers/dma-buf/st-dma-fence-chain.c  |  4 ++++
>   drivers/dma-buf/st-dma-fence-unwrap.c | 22 ++++++++++++++++++++++
>   drivers/dma-buf/st-dma-fence.c        | 16 ++++++++++++++++
>   drivers/dma-buf/st-dma-resv.c         | 10 ++++++++++
>   4 files changed, 52 insertions(+)
>
> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
> index 8ce1ea59d31b..0a9b099d0518 100644
> --- a/drivers/dma-buf/st-dma-fence-chain.c
> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> @@ -87,6 +87,8 @@ static int sanitycheck(void *arg)
>   	if (!chain)
>   		err = -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(chain);
> +
>   	dma_fence_signal(f);
>   	dma_fence_put(f);
>   
> @@ -143,6 +145,8 @@ static int fence_chains_init(struct fence_chains *fc, unsigned int count,
>   		}
>   
>   		fc->tail = fc->chains[i];
> +
> +		dma_fence_enable_sw_signaling(fc->chains[i]);
>   	}
>   
>   	fc->chain_length = i;
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 4105d5ea8dde..f0cee984b6c7 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -102,6 +102,8 @@ static int sanitycheck(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f);
> +
>   	array = mock_array(1, f);
>   	if (!array)
>   		return -ENOMEM;
> @@ -124,12 +126,16 @@ static int unwrap_array(void *arg)
>   	if (!f1)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f1);
> +
>   	f2 = mock_fence();
>   	if (!f2) {
>   		dma_fence_put(f1);
>   		return -ENOMEM;
>   	}
>   
> +	dma_fence_enable_sw_signaling(f2);
> +
>   	array = mock_array(2, f1, f2);
>   	if (!array)
>   		return -ENOMEM;
> @@ -164,12 +170,16 @@ static int unwrap_chain(void *arg)
>   	if (!f1)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f1);
> +
>   	f2 = mock_fence();
>   	if (!f2) {
>   		dma_fence_put(f1);
>   		return -ENOMEM;
>   	}
>   
> +	dma_fence_enable_sw_signaling(f2);
> +
>   	chain = mock_chain(f1, f2);
>   	if (!chain)
>   		return -ENOMEM;
> @@ -204,12 +214,16 @@ static int unwrap_chain_array(void *arg)
>   	if (!f1)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f1);
> +
>   	f2 = mock_fence();
>   	if (!f2) {
>   		dma_fence_put(f1);
>   		return -ENOMEM;
>   	}
>   
> +	dma_fence_enable_sw_signaling(f2);
> +
>   	array = mock_array(2, f1, f2);
>   	if (!array)
>   		return -ENOMEM;
> @@ -248,12 +262,16 @@ static int unwrap_merge(void *arg)
>   	if (!f1)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f1);
> +
>   	f2 = mock_fence();
>   	if (!f2) {
>   		err = -ENOMEM;
>   		goto error_put_f1;
>   	}
>   
> +	dma_fence_enable_sw_signaling(f2);
> +
>   	f3 = dma_fence_unwrap_merge(f1, f2);
>   	if (!f3) {
>   		err = -ENOMEM;
> @@ -296,10 +314,14 @@ static int unwrap_merge_complex(void *arg)
>   	if (!f1)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f1);
> +
>   	f2 = mock_fence();
>   	if (!f2)
>   		goto error_put_f1;
>   
> +	dma_fence_enable_sw_signaling(f2);
> +
>   	f3 = dma_fence_unwrap_merge(f1, f2);
>   	if (!f3)
>   		goto error_put_f2;
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index c8a12d7ad71a..fb6e0a6ae2c9 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -102,6 +102,8 @@ static int sanitycheck(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f);
> +
>   	dma_fence_signal(f);
>   	dma_fence_put(f);
>   
> @@ -117,6 +119,8 @@ static int test_signaling(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f);
> +
>   	if (dma_fence_is_signaled(f)) {
>   		pr_err("Fence unexpectedly signaled on creation\n");
>   		goto err_free;
> @@ -190,6 +194,8 @@ static int test_late_add_callback(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f);
> +
>   	dma_fence_signal(f);
>   
>   	if (!dma_fence_add_callback(f, &cb.cb, simple_callback)) {
> @@ -282,6 +288,8 @@ static int test_status(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f);
> +
>   	if (dma_fence_get_status(f)) {
>   		pr_err("Fence unexpectedly has signaled status on creation\n");
>   		goto err_free;
> @@ -308,6 +316,8 @@ static int test_error(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f);
> +
>   	dma_fence_set_error(f, -EIO);
>   
>   	if (dma_fence_get_status(f)) {
> @@ -337,6 +347,8 @@ static int test_wait(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f);
> +
>   	if (dma_fence_wait_timeout(f, false, 0) != -ETIME) {
>   		pr_err("Wait reported complete before being signaled\n");
>   		goto err_free;
> @@ -379,6 +391,8 @@ static int test_wait_timeout(void *arg)
>   	if (!wt.f)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(wt.f);
> +
>   	if (dma_fence_wait_timeout(wt.f, false, 1) != -ETIME) {
>   		pr_err("Wait reported complete before being signaled\n");
>   		goto err_free;
> @@ -458,6 +472,8 @@ static int thread_signal_callback(void *arg)
>   			break;
>   		}
>   
> +		dma_fence_enable_sw_signaling(f1);
> +
>   		rcu_assign_pointer(t->fences[t->id], f1);
>   		smp_wmb();
>   
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> index 813779e3c9be..15dbea1462ed 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -45,6 +45,8 @@ static int sanitycheck(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f);
> +
>   	dma_fence_signal(f);
>   	dma_fence_put(f);
>   
> @@ -69,6 +71,8 @@ static int test_signaling(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f);
> +
>   	dma_resv_init(&resv);
>   	r = dma_resv_lock(&resv, NULL);
>   	if (r) {
> @@ -114,6 +118,8 @@ static int test_for_each(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f);
> +
>   	dma_resv_init(&resv);
>   	r = dma_resv_lock(&resv, NULL);
>   	if (r) {
> @@ -173,6 +179,8 @@ static int test_for_each_unlocked(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f);
> +
>   	dma_resv_init(&resv);
>   	r = dma_resv_lock(&resv, NULL);
>   	if (r) {
> @@ -244,6 +252,8 @@ static int test_get_fences(void *arg)
>   	if (!f)
>   		return -ENOMEM;
>   
> +	dma_fence_enable_sw_signaling(f);
> +
>   	dma_resv_init(&resv);
>   	r = dma_resv_lock(&resv, NULL);
>   	if (r) {

