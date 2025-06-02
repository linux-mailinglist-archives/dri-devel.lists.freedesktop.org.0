Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA149ACB384
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6999510E543;
	Mon,  2 Jun 2025 14:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vNscwI3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC9910E536;
 Mon,  2 Jun 2025 14:42:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AifTl9CmCfT8RxyWuYC5IQ1DrKEA21nzuu0D8lOdj8OqwcdgI/FgqR9BTPUDoXPhY/BZzc05xukZCWET9m1WHIdeN36z39sSvmOMJFdvuaAMg0UN5Eklr8fyjHCYCfmywuAP28xWPbWQc61rLxMDmCJeyeH2gqtDdhwdFOqKCILItZj3fjlzfivM3JfVnhjl8IeOW/KK1xn0fPJ8prEMifz94ZnESkE1iyYWlRLn5TZojXby0mwcyLSHzef/4z2T2GWZvr++fERuSWRWrXlI8FIh2OhhRAeWZTj//ClI3CEostM5XI+MpIv6VJjtNZQgdyobY4gt9xFYm/gab/qaEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sC5B75jQ3OSIqbV1agRF61z8j8rU1/MOrKMiCIvPZho=;
 b=lnzUw92JF3dLBNQ0mAlqViOEOc8J0JcuTeUFH+vH09Dd0aRTckQlR4gxgtyU52ZZ4cCRpENsaypIykQDpf0dmr0a211y2BFOqLzxUYQCqjZ9skcWHdanpy8VXj2UssVuxYY3MODelcTGpTnWJ7zJTl29aa+TBLXC0fG+SSSgKl5j/cfkikkJaVfwVLoWcFGkSz0Sy2dWUCKaJjvOGg8DChUGa9TF8Sup+1mpTcym00xwUSfUXMl9Z3Fv8BZ2WDpBfeUpfvWnrhUFjXBLb1FM4Legj9MsMHqd+vRl6tNR5cevSsyYhRjxGOnJGzyR9QvtmglUuKOPmQnbuRZc1agp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC5B75jQ3OSIqbV1agRF61z8j8rU1/MOrKMiCIvPZho=;
 b=vNscwI3OY69HIuqeHSBddfPdCRJViJ2037ZDeE1nVaGq8TnE66UkH8s20qwcW2zpz9hFCJb3pYG2hSxLOw7A0ANGeTCKHrxHedHG4q9hcCJzbwfM4XU97Dq22sUlys1mDfN5abQioCLuzbncIzOiyVlMA17BLoJl3qGhh5TKf44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH1PPFD8936FA16.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::624) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 2 Jun
 2025 14:42:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 2 Jun 2025
 14:42:36 +0000
Message-ID: <13c5edf6-ccad-4a06-85d4-dccf2afd0c62@amd.com>
Date: Mon, 2 Jun 2025 16:42:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, kernel-dev@igalia.com
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
 <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
 <b59cadff-da9a-409f-a5ed-96aafdfe3f0b@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b59cadff-da9a-409f-a5ed-96aafdfe3f0b@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0314.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH1PPFD8936FA16:EE_
X-MS-Office365-Filtering-Correlation-Id: c2992bfe-31ed-44d8-6f99-08dda1e3b72c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nnh1bDZIZTZkejZTOXFZSitlY2tNcGw4QkZsQ3ZPcGlwZUlEY0JJQXJEbFBL?=
 =?utf-8?B?azltS0s1NEpmR1VKdlVCV0MzVVVGSXdUMEJSeVRWcHZ0TG9sbDBGMWNsejR5?=
 =?utf-8?B?VmhBRFJOdzEvSVlqTFo1ZnlFY3NsdUFJNm5zbmk0UGRwRjNRZkljSjZaazBL?=
 =?utf-8?B?b3lZN3ozVWhLT2pCKy9jK2FuZjB2YUVBOE5tU1NUMDFWbGxUSlBERDZqdG1M?=
 =?utf-8?B?bkpDbkx1NlhKbXJhaG55Y2xzV25DdHRhM0YrbmtFUlA5blljS09YWXRhQjJZ?=
 =?utf-8?B?dmlHRS9lUzBBaVE5MzN3RllrNjlEWk81SmtBT2hlVVUvNVBQZ203Zkt6VEpU?=
 =?utf-8?B?SUJxZ015YjZrb09FWkZRQTZQaW9XQ3NXR28vV2ExZ0FSQlErb3FadUZ0RzJw?=
 =?utf-8?B?cGRCQkJmeWpRWDY5dEpWcnRtSUhUZ0M4VWh5dnI1MFZMREVXcEJBek9CK0lu?=
 =?utf-8?B?SUl2UFNWWU8yUTIzT0NNQ0pCRGZKUkFEakRwL3BJbEJtaXNHNDlrdjE2Qzdr?=
 =?utf-8?B?aTh2cm1XS29ocFNtaE1XVWkyU1pTNWZvdFlkV2psVUZaL3ZIamJvemV3YmZX?=
 =?utf-8?B?RkNKS2RMSjNoSXF6ektadktyd3l2Zno4QTJvZ1J1WHNJaVNVWEIvUTNWQlV3?=
 =?utf-8?B?SmI5N0F2S21PYUYvNzVTYVBKeFdKNlhEWnpQYWRNUGdmZUJLNzEzQmJ2RkU5?=
 =?utf-8?B?N24yRTdBY2JWTlhDa2w2UzVUeDR6ZllnUHd3dldCd0Z3cU5EakdnK1hDYmhn?=
 =?utf-8?B?VUdzdHJqN1NOdmF6aC9JTGQ1blc4YXk2N3pnZjVxZXlEZXRJMFI2NmwvbTJy?=
 =?utf-8?B?a3lCc0tPNlR4OFczWkdRaVBrWk5vdmtkZjNwb1BIZUtpUjd6VkM5cmp4U2x4?=
 =?utf-8?B?am9pYXdoYittdUlsTDNzMnhxelJGQk1lVVNvcUFST1ZHNjVrYnZEZUx5QytT?=
 =?utf-8?B?b3lBWWRzMVNSdkFXMFI3QXhTYmZJQUVJVlpnMDdBMGQ4T0JNSzZvaFZZQ2tr?=
 =?utf-8?B?QTRKUWVtdXVoRGJZWml5bEVRM1pud0tCSGFsbU8zNnkyUkZnWmMzelI1NVJv?=
 =?utf-8?B?VUdzV2xRUHZNc1UrbXpZNG4yN3YvWHJKaHlTT0thQnRUcEwzNGFFczU1ZnFm?=
 =?utf-8?B?Q290UUlpeXI1MnI3c2hXeG5tMHlIRnNwSU9RNWNSM1gwM1R3ZkdWdmp3cWIw?=
 =?utf-8?B?TzVvS0JuanBRMnNuekxlcy9tNUQrTnNkTjJuRUFBRURrRjduVnZLMmwvdTAv?=
 =?utf-8?B?enhiN3diTlI5cEtLNnVudXQxc1JZOVd2V0xDOExYbDlhdS9BNWVlTEhUcUhB?=
 =?utf-8?B?M0VLbElBbDNWcjFqanZLaGJSbXpWQ21iSkVpOVVPNDE2RnRnNXpoT1dLa3gx?=
 =?utf-8?B?UWt5dUpkc2pJWFNpYzRtSGxqZGdNaXJueFNJa1NNQUZob2dIK3VkTTVOVXBV?=
 =?utf-8?B?MmRZOExUMi9VUGxrV0FrT0NJMUJrOHlKakZVNTFqdlFiQnFiR21adVRxZWpE?=
 =?utf-8?B?aURZcWJ0R2czNENsaVZmbzJUZk84TWNadE1nZFNUODl4NWtVOFd5U1VndXgw?=
 =?utf-8?B?YW9wMXhwRVRaUUpjS1NzT2JIVUk2VnVndWIwUllYNGZGdS96Z09jeG1GOWlL?=
 =?utf-8?B?NHhVQkRMcHNMVUtBalREd2VNZXpyenI0amp0NXNaWE1MK1k0Q3A0b3h6WkNs?=
 =?utf-8?B?dmdydEhpcnU1cDdkVnVUNm83OUYzd0dUKzBTdVBHQ0hCTW80K2loMWRIYlZw?=
 =?utf-8?B?U2FyaVFUQlIwZUp1dzE3ajNURTc1NTdJUi9zdnJDeEhMcFU2MTBnT0xGY1g4?=
 =?utf-8?B?aVVlemtseVIxdEpVMDArQWxvL2syaWdvb1NXTGRpaUVNMndOdnRXdVVteXdO?=
 =?utf-8?B?MGdYMTBxUy80cXIyZ29yS1AzRTZ3TXgwSGVBSFlDeXl3SCt0TXJrY2p2dTBn?=
 =?utf-8?Q?J3OY1x+zQFU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzlzeUcvQ1ZFdHlOSHN3Wkt6b3M0VGFQdjZSZC80SGw1dlFUelBIazVjUCtx?=
 =?utf-8?B?ZzRCK1dSYXdCY1dOcE80WlQvYkhaai9ET3BrY1R4alNsblRlbXUxcEowU0FE?=
 =?utf-8?B?ekxhL3AyYkMrTFVwb3VkRW9MVXZWVnZ2Vm10WkdOQmliWmJCeUE3VDBjSEpF?=
 =?utf-8?B?blVONWJsVUNlQjQ5Um5LSk5KSGswalM0NVIxUWErMXNNdFBvRG1qeE5CSkxT?=
 =?utf-8?B?Nk1Na1Zka1Z4UlJYZkt6ek9qNG9QMzNXVEJMTm1YdVJkUEFrM1VLWG5yMFdt?=
 =?utf-8?B?cUFjb1M0QUdyQ09rbE5IR1d5c3UrS2dmdVZ4V0R2VU1xNEF1YXp0dDZaUTBX?=
 =?utf-8?B?Z2lReEdxZnVXdFl6cHdGQlhMam9zRjExM2lUdDRiSTdiN3I2R3Fpblpsb0JB?=
 =?utf-8?B?U3crRnE5TG5sem9pcDF4dnhVeU55Q2RHdGx4Tlhna3YwY1FlWm1FR1JmVXlw?=
 =?utf-8?B?VW5FN1pEVGhMR0EyK0cwaWIrZjlxTFNTYzZ5a3pzZzhzaHdlZFlqMkgzQU5z?=
 =?utf-8?B?c0xxMGxOV0JTZDFqY0NFNFJ6V09KK2x3WkVaQ0trSThIOE1mcVo2QUxYU20y?=
 =?utf-8?B?UkRwdHBvdVE0cnNvVTVWeDlDbW1meWI2WDRjSXNkTXlmZGhEYi9HVEhueDA2?=
 =?utf-8?B?Nk9Ka1E1cXFTeE9TUUU1QUtidUhxb1JXeGJDTjFZcUVOQ1JNb3BFQlNZMTlp?=
 =?utf-8?B?QXIrNG5Fbkc5Slg0NGhpd1NMY1g1NFkwdVc1bEZsWXRwUSs2dW12WC9YdWVV?=
 =?utf-8?B?Y3JOVEpETXZOTVdRZUUzKy9Pa0tBL2I3K3UrMTlZTWFzRTNadDRjNm9pRGhY?=
 =?utf-8?B?T2tkbTFzQVJIY3VQNlBhSjQrNmNWVDQycUN1UmhVR01EcDRlQ3RPRWRYRlho?=
 =?utf-8?B?UXkzRnI4T3FUWUlkMzNCMk16LyttdkoxaFJJU1ltQTgvTXVLbnRvdGlwWFBK?=
 =?utf-8?B?c0pGeUlzcWRGVllOYi8rVlVDeFFudzA2MExja1hocWRaaUphTkZVR002Znds?=
 =?utf-8?B?NlBhOUg5WENYUTNDTlN1T3ovV3p0RW5uZVNhNFJRUndpazdlTWhvSGR6ZjNz?=
 =?utf-8?B?ZXdWdzNFR0FnUmNqdEV6enRwVzdBK3lkUXhCcG1oVU5BUVREQXVPVXVMR0pP?=
 =?utf-8?B?T0pVMnZMaXpweW5YNlBHZWJsRWY4bkdqVnhBVkFIZVRuSlRYeGVDOUNqTGgv?=
 =?utf-8?B?UWVOUFM0MitXeUFXSzF1djIzOUVWTURIeEIzUm9rRmpKVlZQdGNCSStnTFoz?=
 =?utf-8?B?K2h6RjRYbStUVDVvbWR5dS9aNEx4NG5WMFBXOFpWRzRnbFozdWZrVWpIS0k2?=
 =?utf-8?B?QkFpRHdGTFI2RCttVCszMWdaYnZXbWNGTHNNc2xmOHFDRmIrSWd6V3RMS1Fu?=
 =?utf-8?B?YWIzd0JlSFdUZjVKSngwcDY5aDBLYmVRTmM3ZjZmbVcrWnJQRXBCUDBMUVhE?=
 =?utf-8?B?eTlSb0hoaUVXZHRCT1c3dHlqTDJlTThjelNiZjF0T25kUWwzNVpodjlnZ2Jt?=
 =?utf-8?B?TWdINDZhYzNxZG9LckRvd3dpRTVzb0ZsWFZzeEtQYjZrRkt3bW9tbktFMTNl?=
 =?utf-8?B?b1dKalFtSjZRSk1SL1V3bW1uWEJLRXVtNmQxZ1R3QzRWLzM2bXJ0T000TXZR?=
 =?utf-8?B?bytlaXZJY25wa3NmQkpGMXo5MnlhanRnd1pCR1BYazE5eG40VVg2N2x4R3Uz?=
 =?utf-8?B?eVBZc3N2YlFyRFdJQUJMK3VyRmYwd29ZY0ZnUDA2YmJmYVRjalVqN2daL0Zi?=
 =?utf-8?B?blp4bk9aSGQ1dVFuVzd6Nm1nbGVGZVZLNjdQL1oxbllVQzl1VnpHSHc0YTJU?=
 =?utf-8?B?c2Ricm42VC9XNVR1MVVhcTVDRjVNNk8rdlhFVGRFRjZUSWkvcTNTUTVtYWZF?=
 =?utf-8?B?MVB6Sk05TWM3cTd0VEhVclFHL2kvbjZLMnVFRjRqWWtESjBKM2oxZlBINUVO?=
 =?utf-8?B?dDZWNzJIbHhISDBvTS9BRkx3WWMyaDJKNzVjUzJoNnNKQ1FvY1dlWEtRMlBC?=
 =?utf-8?B?STVYcEh1T3R6amczbnVaSW9UUlI0dFB2eFJ2VWg1RDQ4TGVwY3lrb2ZVdlBQ?=
 =?utf-8?B?eWt6Z2VoZk8wZnM0ZU9mbkM0ZG96ZXlOZmxiZjFDRG1KNW9BNHVXN21CTUdt?=
 =?utf-8?Q?N8JpMRn+jMOelhVnF8sRJklY1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2992bfe-31ed-44d8-6f99-08dda1e3b72c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:42:36.0672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcfnL79PIJ3/wZrrKdfOppY4qOQQcE+uks4kyRoFjM3eIcSh6pSSNYbodVAEVyqF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFD8936FA16
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

On 6/2/25 15:05, Tvrtko Ursulin wrote:
> 
> Hi,
> 
> On 15/05/2025 14:15, Christian König wrote:
>> Hey drm-misc maintainers,
>>
>> can you guys please backmerge drm-next into drm-misc-next?
>>
>> I want to push this patch here but it depends on changes which are partially in drm-next and partially in drm-misc-next.
> 
> Looks like the backmerge is still pending?

Yes, @Maarten, @Maxime and @Thomas ping on this.

> In the meantime, Christian, any chance you will have some bandwith to think about the tail end of the series? Specifically patch 6 and how that is used onward.

Well the RCU grace period is quite a nifty hack. I wanted to go over it again after merging the first patches from this series.

In general looks like a good idea to me, I just don't like that we explicitely need to expose dma_fence_access_begin() and dma_fence_access_end().

Especially we can't do that while calling fence->ops->release.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>> On 5/15/25 11:49, Tvrtko Ursulin wrote:
>>> With the goal of reducing the need for drivers to touch (and dereference)
>>> fence->ops, we move the 64-bit seqnos flag from struct dma_fence_ops to
>>> the fence->flags.
>>>
>>> Drivers which were setting this flag are changed to use new
>>> dma_fence_init64() instead of dma_fence_init().
>>>
>>> v2:
>>>   * Streamlined init and added kerneldoc.
>>>   * Rebase for amdgpu userq which landed since.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Reviewed-by: Christian König <christian.koenig@amd.com> # v1
>>> ---
>>>   drivers/dma-buf/dma-fence-chain.c             |  5 +-
>>>   drivers/dma-buf/dma-fence.c                   | 69 ++++++++++++++-----
>>>   .../drm/amd/amdgpu/amdgpu_eviction_fence.c    |  7 +-
>>>   .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   |  5 +-
>>>   .../gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c  |  5 +-
>>>   include/linux/dma-fence.h                     | 14 ++--
>>>   6 files changed, 64 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>>> index 90424f23fd73..a8a90acf4f34 100644
>>> --- a/drivers/dma-buf/dma-fence-chain.c
>>> +++ b/drivers/dma-buf/dma-fence-chain.c
>>> @@ -218,7 +218,6 @@ static void dma_fence_chain_set_deadline(struct dma_fence *fence,
>>>   }
>>>     const struct dma_fence_ops dma_fence_chain_ops = {
>>> -    .use_64bit_seqno = true,
>>>       .get_driver_name = dma_fence_chain_get_driver_name,
>>>       .get_timeline_name = dma_fence_chain_get_timeline_name,
>>>       .enable_signaling = dma_fence_chain_enable_signaling,
>>> @@ -262,8 +261,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>>>               seqno = max(prev->seqno, seqno);
>>>       }
>>>   -    dma_fence_init(&chain->base, &dma_fence_chain_ops,
>>> -               &chain->lock, context, seqno);
>>> +    dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
>>> +             context, seqno);
>>>         /*
>>>        * Chaining dma_fence_chain container together is only allowed through
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index f0cdd3e99d36..705b59787731 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -989,24 +989,9 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>>>   }
>>>   EXPORT_SYMBOL(dma_fence_describe);
>>>   -/**
>>> - * dma_fence_init - Initialize a custom fence.
>>> - * @fence: the fence to initialize
>>> - * @ops: the dma_fence_ops for operations on this fence
>>> - * @lock: the irqsafe spinlock to use for locking this fence
>>> - * @context: the execution context this fence is run on
>>> - * @seqno: a linear increasing sequence number for this context
>>> - *
>>> - * Initializes an allocated fence, the caller doesn't have to keep its
>>> - * refcount after committing with this fence, but it will need to hold a
>>> - * refcount again if &dma_fence_ops.enable_signaling gets called.
>>> - *
>>> - * context and seqno are used for easy comparison between fences, allowing
>>> - * to check which fence is later by simply using dma_fence_later().
>>> - */
>>> -void
>>> -dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>> -           spinlock_t *lock, u64 context, u64 seqno)
>>> +static void
>>> +__dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>> +             spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)
>>>   {
>>>       BUG_ON(!lock);
>>>       BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>>> @@ -1017,9 +1002,55 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>       fence->lock = lock;
>>>       fence->context = context;
>>>       fence->seqno = seqno;
>>> -    fence->flags = 0UL;
>>> +    fence->flags = flags;
>>>       fence->error = 0;
>>>         trace_dma_fence_init(fence);
>>>   }
>>> +
>>> +/**
>>> + * dma_fence_init - Initialize a custom fence.
>>> + * @fence: the fence to initialize
>>> + * @ops: the dma_fence_ops for operations on this fence
>>> + * @lock: the irqsafe spinlock to use for locking this fence
>>> + * @context: the execution context this fence is run on
>>> + * @seqno: a linear increasing sequence number for this context
>>> + *
>>> + * Initializes an allocated fence, the caller doesn't have to keep its
>>> + * refcount after committing with this fence, but it will need to hold a
>>> + * refcount again if &dma_fence_ops.enable_signaling gets called.
>>> + *
>>> + * context and seqno are used for easy comparison between fences, allowing
>>> + * to check which fence is later by simply using dma_fence_later().
>>> + */
>>> +void
>>> +dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>> +           spinlock_t *lock, u64 context, u64 seqno)
>>> +{
>>> +    __dma_fence_init(fence, ops, lock, context, seqno, 0UL);
>>> +}
>>>   EXPORT_SYMBOL(dma_fence_init);
>>> +
>>> +/**
>>> + * dma_fence_init64 - Initialize a custom fence with 64-bit seqno support.
>>> + * @fence: the fence to initialize
>>> + * @ops: the dma_fence_ops for operations on this fence
>>> + * @lock: the irqsafe spinlock to use for locking this fence
>>> + * @context: the execution context this fence is run on
>>> + * @seqno: a linear increasing sequence number for this context
>>> + *
>>> + * Initializes an allocated fence, the caller doesn't have to keep its
>>> + * refcount after committing with this fence, but it will need to hold a
>>> + * refcount again if &dma_fence_ops.enable_signaling gets called.
>>> + *
>>> + * Context and seqno are used for easy comparison between fences, allowing
>>> + * to check which fence is later by simply using dma_fence_later().
>>> + */
>>> +void
>>> +dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>> +         spinlock_t *lock, u64 context, u64 seqno)
>>> +{
>>> +    __dma_fence_init(fence, ops, lock, context, seqno,
>>> +             BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_init64);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>>> index 1a7469543db5..79713421bffe 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>>> @@ -134,7 +134,6 @@ static bool amdgpu_eviction_fence_enable_signaling(struct dma_fence *f)
>>>   }
>>>     static const struct dma_fence_ops amdgpu_eviction_fence_ops = {
>>> -    .use_64bit_seqno = true,
>>>       .get_driver_name = amdgpu_eviction_fence_get_driver_name,
>>>       .get_timeline_name = amdgpu_eviction_fence_get_timeline_name,
>>>       .enable_signaling = amdgpu_eviction_fence_enable_signaling,
>>> @@ -160,9 +159,9 @@ amdgpu_eviction_fence_create(struct amdgpu_eviction_fence_mgr *evf_mgr)
>>>       ev_fence->evf_mgr = evf_mgr;
>>>       get_task_comm(ev_fence->timeline_name, current);
>>>       spin_lock_init(&ev_fence->lock);
>>> -    dma_fence_init(&ev_fence->base, &amdgpu_eviction_fence_ops,
>>> -               &ev_fence->lock, evf_mgr->ev_fence_ctx,
>>> -               atomic_inc_return(&evf_mgr->ev_fence_seq));
>>> +    dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
>>> +             &ev_fence->lock, evf_mgr->ev_fence_ctx,
>>> +             atomic_inc_return(&evf_mgr->ev_fence_seq));
>>>       return ev_fence;
>>>   }
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>> index 029cb24c28b3..5e92d00a591f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>> @@ -239,8 +239,8 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
>>>       fence = &userq_fence->base;
>>>       userq_fence->fence_drv = fence_drv;
>>>   -    dma_fence_init(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
>>> -               fence_drv->context, seq);
>>> +    dma_fence_init64(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
>>> +             fence_drv->context, seq);
>>>         amdgpu_userq_fence_driver_get(fence_drv);
>>>       dma_fence_get(fence);
>>> @@ -334,7 +334,6 @@ static void amdgpu_userq_fence_release(struct dma_fence *f)
>>>   }
>>>     static const struct dma_fence_ops amdgpu_userq_fence_ops = {
>>> -    .use_64bit_seqno = true,
>>>       .get_driver_name = amdgpu_userq_fence_get_driver_name,
>>>       .get_timeline_name = amdgpu_userq_fence_get_timeline_name,
>>>       .signaled = amdgpu_userq_fence_signaled,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>>> index 51cddfa3f1e8..5d26797356a3 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>>> @@ -71,7 +71,6 @@ static void amdgpu_tlb_fence_work(struct work_struct *work)
>>>   }
>>>     static const struct dma_fence_ops amdgpu_tlb_fence_ops = {
>>> -    .use_64bit_seqno = true,
>>>       .get_driver_name = amdgpu_tlb_fence_get_driver_name,
>>>       .get_timeline_name = amdgpu_tlb_fence_get_timeline_name
>>>   };
>>> @@ -101,8 +100,8 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
>>>       INIT_WORK(&f->work, amdgpu_tlb_fence_work);
>>>       spin_lock_init(&f->lock);
>>>   -    dma_fence_init(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
>>> -               vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>>> +    dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
>>> +             vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>>>         /* TODO: We probably need a separate wq here */
>>>       dma_fence_get(&f->base);
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 48b5202c531d..a34a0dcdc446 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -97,6 +97,7 @@ struct dma_fence {
>>>   };
>>>     enum dma_fence_flag_bits {
>>> +    DMA_FENCE_FLAG_SEQNO64_BIT,
>>>       DMA_FENCE_FLAG_SIGNALED_BIT,
>>>       DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>>       DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>>> @@ -124,14 +125,6 @@ struct dma_fence_cb {
>>>    *
>>>    */
>>>   struct dma_fence_ops {
>>> -    /**
>>> -     * @use_64bit_seqno:
>>> -     *
>>> -     * True if this dma_fence implementation uses 64bit seqno, false
>>> -     * otherwise.
>>> -     */
>>> -    bool use_64bit_seqno;
>>> -
>>>       /**
>>>        * @get_driver_name:
>>>        *
>>> @@ -262,6 +255,9 @@ struct dma_fence_ops {
>>>   void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>               spinlock_t *lock, u64 context, u64 seqno);
>>>   +void dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>> +              spinlock_t *lock, u64 context, u64 seqno);
>>> +
>>>   void dma_fence_release(struct kref *kref);
>>>   void dma_fence_free(struct dma_fence *fence);
>>>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
>>> @@ -454,7 +450,7 @@ static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
>>>        * 32bit sequence numbers. Use a 64bit compare when the driver says to
>>>        * do so.
>>>        */
>>> -    if (fence->ops->use_64bit_seqno)
>>> +    if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
>>>           return f1 > f2;
>>>         return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
>>
> 

