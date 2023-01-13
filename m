Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3562066A431
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 21:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35DF10E002;
	Fri, 13 Jan 2023 20:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D802F10E002;
 Fri, 13 Jan 2023 20:40:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfRFRNftFw4N9jowucy4CdVSZnMfB5MbYxzX91IiPuwQFFDYFi6C+TZlQkrg7KRZmtS8d1Y9W5CQIA7rL6pfnJxXkMvfLujEuKM8gCHH/GD3TREYJ3eqFZPiRfFDfYhHzWXpRA5C4KtfuufjWAZ8tlecSthvEghtS97OCGBy1+ApY5+sidVnDA3TS0LRMKHqhchjzIRum6pR9UXeyoKaoLRH5BHMH7oZ7WoUnEdw3QbjB7O79qCajmljUQRaUw1bnLGgtJs/67XgLgl6cZRVt2KYIVl5ZJTo5GI5TBG+40qfAKcgQ69+dk72/Hng2lQUmDnDm+fDneSMhBV+1KQOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hr3PEr+OYtSxW5HJmCPPdNv4qr+Nr/7cSRRmOud09sA=;
 b=SvsQhWLalOgUgA/GWQEPg767t6uSS2UCN4Y7LuSrph9UN4KNabgf0uU62nnXERQffsAZwWqabfBDeb+arpESEGecycYxYwoi5HFLc2GO8AgVZBSXzJEl/YJhJ8goxVD1f/X0SixHyRuDQT0ilr+YKjQx+9E/oy3G7NDfTBdCfst8fHq0sHafk/pUIPT8tCyyPZ7NXeoFSkkhNuXxI5X3M1mG9CAvlfn7/qBKYcNuov2R+n2fJ6JjplSUtSPcwIZeUgscOtPjvtC+RcRD4oCBxgNHbMQ+Ehf5t/sOkoDHXEYxLBKY+thsl37IXx50eek7rlUDUjWqxlQdpKlOgtO5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hr3PEr+OYtSxW5HJmCPPdNv4qr+Nr/7cSRRmOud09sA=;
 b=Xo//VUamyk92Vi3Fw0aFY9gKmKYhM9WZxp0qj41VexIDQEf6KA4JZiCaBoDVlPp2HohVjXzUE6EtcBiZTVhySyEnh117iTnjLww5J81jVgirjf27MBGYTTktWq5eJ2AzRohVZ5L2KPFE3zzJ1WymiSEyHyHsvPIXXDKYNDc5PYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 20:40:11 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%5]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 20:40:11 +0000
Message-ID: <3a547292-b6b6-4876-8954-edbde4ef26f0@amd.com>
Date: Fri, 13 Jan 2023 15:40:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] drm: Add SDP Error Detection Configuration Register
Content-Language: en-US
To: Arun R Murthy <arun.r.murthy@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com
References: <20230113043653.795183-1-arun.r.murthy@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230113043653.795183-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0072.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: be9e9692-cc19-4779-5455-08daf5a65d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CexmKoE2hZELpGR+hZx8mGSmjgZEgCu9gWycQuQRTWYkULkFF//V2hKgezGU1xEFuREETEDxcFYpXWVFYVn8VB6imXN1kU/4BiRqXQO3Pc5Y2P1RsgX/xOWxcX4LTw6TWhw9jJ+4cMFCIOArwJtrzFM/PIX/6vRZPiKLUmESDpZ2hZWGtOMmNP/DJvJz6Njec5TQ1yoOVX7FIB8dVsvEDfJ3jdb0UmJvGobc5G9FmC3yAUgsaIWmEPC1fUdxqTjiqCFy6YrGuwKEyweNucmCUEhF+VdO0jFZyAxswobd32wCN+Ot2zN+aNh1/bLnwHQnEfQNcRzOL3gB3hnvsD8i9Xq0gllwNoYvqDYGK/HoxesqH12Hk0fGlLhfm9ocZWBQLIDFITO8jHDC2UOWjZHqz4JGZHeAnKTUy7mz5AeRk1qwuFA+wQxKBOgMTeJqxLiXtw9OIIHwEl8WCLTsX23ED55aEDbyoqkNXuv0QBZyzqKqOdgonBp82ZdjTUgm5h+S1kK4bhwCHPuFwkBXPDLHXid0WtSVJI8DTni/LaICSCmWC4+vYirJ1oPO/d4TWXdpzFF+Z47Svrzzh/GzS/Twxc12ZuziOg9TJYmJIHd82kcgD28OrH/uoVIFFaDGPNGFHm1r7q7GBXhrFXGowoAZSpv/LYAqGa2P0KHeG4Z7bj1FW1sW5AKekyBRPeQ4GftXNP82QAzP1yLCWliAmgVreXetacZR4Uuqql7ZujT5YFQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199015)(6506007)(6666004)(5660300002)(2906002)(53546011)(8676002)(8936002)(31686004)(4744005)(83380400001)(44832011)(6512007)(36756003)(66476007)(38100700002)(41300700001)(478600001)(6486002)(26005)(66946007)(66556008)(186003)(86362001)(2616005)(316002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0VMbmJxRG1CdGcvc2NOQjVuaEMzc0VBN0ppdVhlU0FEN29SdXhCVE5PcE9s?=
 =?utf-8?B?SkZQejl0L2Vjd2V0alFBdGNEMzljNC9xUHZNZVZJMDZJbDdLZFpuWXBYZHlJ?=
 =?utf-8?B?YlRrd3NoUGlpaklqeDU1VmJrd3pKTGtnVUZacTNRVFZvc0RsSVQ5dnVPSlR0?=
 =?utf-8?B?clBjR0F3THI3QkJMbUhXSlo2aVgxNGhKeVhFeTU5MisvZi9GZTV3OTBZNHBY?=
 =?utf-8?B?eVRRY05DRnFTbE1nc25FdUIwRUgxTDVLenlvOWJ3Ujg1Si9MejZRTmFVcHJE?=
 =?utf-8?B?SXVzOVRlUzVVMkJ6WWh3QWdobTNVaGVuZkVNRGFRYUpxUnhqNFhUZy9aU2FD?=
 =?utf-8?B?dlJXOEY1Rm9YYTF3SVdhTUhiM2wrb2tZbE9WaW90eUE0Q2FDSlJIOE8wQUVT?=
 =?utf-8?B?c2E4RWFjRGVOQjMrSm80cVRBREpDV215bWRmZ1l5elB4cjFjdHZzYzZPOUl5?=
 =?utf-8?B?SlNja2l2cXNaakpSeU11REppUFU1TlhOai9BekQ4L21iU3JVYUxBSW5FdTlz?=
 =?utf-8?B?T0l4WVg0UjdpQ3ZwOFQvczBNbi9WMEdXQUJHUHh1Vnhmb2VML3lUd3F6SkY2?=
 =?utf-8?B?bFc0K01ocVdxUkV5V21oam1XbFMzQzBrbktVdnJrNlQ5VzNGSDV0Nmo1UVMw?=
 =?utf-8?B?a3lrckkxMFpGUFFVUTd0YXR5MGc1V3o0MmtiOCtoRitaaVBiUkt3alFra0R1?=
 =?utf-8?B?RndLcU4xYVo1OTZiUHh3c204WkVJZW0wTCtLMkpYKytZZ1VocGkvbmhQWHNt?=
 =?utf-8?B?dm9FTHp2QkljRlpUMzlTa2pGZGNob25lYjRKUDRuYTJSSjM5a1lMQ3ZpWGUy?=
 =?utf-8?B?RUVlNlNYb3laYzBCQ2RNL3FhdTgraDE1dHJsU2txM2RmUTQ2ZFZJRG4rdC90?=
 =?utf-8?B?MGQ1WmUweTFXVlNHc2xDT2dieXQ0M1o5RnB2WXA3dE5mNXBiWHE4Qmg4cWps?=
 =?utf-8?B?di9aWno1dktBQzBnVkJEUExVU0I3UEVZTFlpZ0ZVWmh0MHFldVVaL3A0S0xP?=
 =?utf-8?B?c0hIRHZSSnVpZjFwcGsyTjQ2Z0RBVmVXMVlCOE9Ld2FZR2RLVjdzZFJkT1R1?=
 =?utf-8?B?ZndMcUd1aUJVenJ3aDhaOHJUWGsrSUZSRWVKRUtkWlh2enQ3L252UTRyRWs4?=
 =?utf-8?B?NFZERVl2MHJqQ0QxVkR5WUtSaXdSNndoNVZ3byt4NzQ3VG9uVUxucTVrWURZ?=
 =?utf-8?B?OUNYbnBpMlZQdklRQ1pYMWNsWlFSKysxRHJpRFE2eTM4UlRBaG56T0U4bG41?=
 =?utf-8?B?em9GdU1BVmd2RDN2WDMxbUVpN3J0VVdVQ3VKU2QrOG14a1p5TTRlaG5aRVJr?=
 =?utf-8?B?MzZHYXArNjhBRzJRWURrUkFnRzdNaEdaRWMvQ1ZVK1l5SDBmU0lJUTVjS3J2?=
 =?utf-8?B?UTJ5VXArem5wQU5HWHl6NTRHZUVjWk1RZEw5Uk56UWVsL096c2toa3lxMVAr?=
 =?utf-8?B?bmNBRXAxc2RSelF5cFZxVTc3WVZIRXNGUmhyTi90aXhMQWVWbEQxTXBiNDlL?=
 =?utf-8?B?Y3oxZXlhZVg4ZEdLeHdHR2E4czFYQWg2bVJGK0YvOSt4TXYrT3lVMWE0ckFK?=
 =?utf-8?B?Vldxd1h1M2tHU2RwVGNudXZ0MTBBbDVzbmVCT0RicmQzMkROSmJWUWNTVitP?=
 =?utf-8?B?NGZiSXh2V3JpbmRiLzdSN1VTekoyaEhkdFRGWHFCdGlxb2txTTF1d1M0OWIy?=
 =?utf-8?B?bElkSlVjK3NINFc0UVpUN29vbXJaZnZyM0h3SkZCZlNNSCtDVEVqYXdhblds?=
 =?utf-8?B?dmFhTmlSaG5OUXNodjloVG5Kb1pwZlNFdzBiancvRmxYcGN2YkxjMmdEMkdV?=
 =?utf-8?B?Wk9WeXZmWjFPNUdFdVhoY2tsejloOHlkYmFoNU8rMUhCQWVUbFk5SnBBbmNv?=
 =?utf-8?B?ekhhRWZ1SU1DTDVTeVIyYzhWVkF3T0ZldjZkU2dURzI4TFJleFd4anhHcmQw?=
 =?utf-8?B?QTdreWNuZzdmb21MeGkwTE55cGUrYi95SkMvNnhVOWtHYkpFU2pzYk5Pb3V2?=
 =?utf-8?B?U3RMeURONUZ4b09LanJXc0hZUEZKMUxhdE5Dc0laa0tQTkd4b3E5eDBXeFV4?=
 =?utf-8?B?L1dGWXVuWGowQkZsaHlSc0lFa1FUNU1hWHRxbUVKengvUXcva2E5dEZPM2pm?=
 =?utf-8?Q?6HktFYYhJQnjY5VmqK9jDcqiJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be9e9692-cc19-4779-5455-08daf5a65d23
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 20:40:10.9674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jdzyIvuRNlP3anfN+lREGIU5wfFgDYfcOCh11imPFTBgYUHVfFcFQvE8pWiX7g7pr0lShTyYDTuapVqnAX6Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6611
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



On 1/12/23 23:36, Arun R Murthy wrote:
> DP2.0 E11 defines a new register to facilitate SDP error detection by a
> 128B/132B capable DPRX device.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  include/drm/display/drm_dp.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 9bc22a02874d..8bf6f0a60c38 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -691,6 +691,9 @@
>  # define DP_FEC_LANE_2_SELECT		    (2 << 4)
>  # define DP_FEC_LANE_3_SELECT		    (3 << 4)
>  
> +#define DP_SDP_ERROR_DETECTION		    0x121	/* DP 2.0 E11 */

If we're sticking with copying the exact naming from the DP spec
this might be more correctly be named DP_SDP_ERROR_DETECTION_CONFIGURATION

Harry

> +#define DP_SDP_CRC16_128B132B_EN	    BIT(0)
> +
>  #define DP_AUX_FRAME_SYNC_VALUE		    0x15c   /* eDP 1.4 */
>  # define DP_AUX_FRAME_SYNC_VALID	    (1 << 0)
>  

