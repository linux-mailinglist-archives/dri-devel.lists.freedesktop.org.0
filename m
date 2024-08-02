Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCFA946027
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 17:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB9C10E172;
	Fri,  2 Aug 2024 15:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4JbUBYCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD6B10E16C;
 Fri,  2 Aug 2024 15:19:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDM//gkiKMat9EEuN5Fa+u2WH1ZMW7EBOmhyrtkhM3CkPCb2B3fHh8/8Vh183x9lip4fE0MHmWjwcrt8pqbvKEnpSHNhZ592fESIZrM6WRK+1z3JOrf1uI9cGfPZwpZTwmnrlTelzRyJTSdnWVlp8lRwW0xEiZDRSVCs0+eOp1eZq2yEs///uQdKXcjwglm0xKxHhmBXcV10fcAoBn4RvqDZX5OdIxC9ekWKAlgp5dh3na4jt2Bcj8AZ+EJOYL7RzKcmXMedjQuCgxqZQa4wyIYbtCcHBqGERNPVysW4o1gEsblZ1S2++szwHCIdla+V699WWgzZQGhOsW7rid+sxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uEDVquO+A5vyAPHBvzb0NUiD1R6LVQO0ZMmFnW2a3k=;
 b=VvOtFLM+4jXnzKSB/tCcFDt87QqlIWPnQZZl8+Eh3x+TsYQM9YtGa9DePhDijsrxAvWzyooRW1qyfRY0mkz9i3Bep1R6YDmLVp/GNvCf0MhXwqWvnOuE3HykYywCdE7S7maUyLh5WDxa6N4i1cYg/juXXjJdOfBIbUk8F/igJPmdadXzBRSMhaZXWYsVZe1Rt4IRdYVQSHkEqTKnoKGDj7LHbI2LorV8q4i5MwmC6reXSDgNfXHHeSoQeDAyJJQMQMVsJNL9BfbWYUIsOWI0k37TOueKwOxqrjmYEsQQ1YVtBbH4ohca4/9kptcD2Sa0oYY70rSzn9WB92cIvlaf/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uEDVquO+A5vyAPHBvzb0NUiD1R6LVQO0ZMmFnW2a3k=;
 b=4JbUBYCrG5LGg1luW0jLnSnQh6SVsrYEllyvr8zUUZgUZdstFIVkPQ7nC4A4p8EoptEQnYqKMdKL/XZlK8utmlRCIF0VeuSqQEMFOvHUKW6vwgqDTxj4zmhxPGaFUAA/l/FOE30iXr0EQiGa0v+57dsNRP1GsRNAPSaB3HhrI4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA0PR12MB8715.namprd12.prod.outlook.com (2603:10b6:208:487::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 15:19:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 15:19:02 +0000
Message-ID: <a8e7a36b-f455-4378-a467-03b7a1b3b915@amd.com>
Date: Fri, 2 Aug 2024 11:18:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Revert "drm: Introduce 'power saving policy' drm
 property"
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>
References: <20240802145946.48073-1-hamza.mahfooz@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240802145946.48073-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::34) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA0PR12MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: e00d68ed-a2f5-4ea4-a05a-08dcb3067069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjdzcHJrVnRBd2N6bVRWUm84OXpyRmRpWTdyTVVVTEJkZ2x3SlVnQkNNQ2NQ?=
 =?utf-8?B?ZnkySFlOa1NYRm9SR3drM0o1S2dmSUwwWHVlTGZSS20zcjlKQkdHVWhlSlFa?=
 =?utf-8?B?RTh0L1VCS2J1S0pGN0dnVWZQWWk0NWZVM3gySnE5aFlzNEdaY1pNTVdNUUJ2?=
 =?utf-8?B?TXdydWJia29wemRPNlJPVzVTKzFjUVFkSVB3blIzeTM5cmcwR2Y1NHVkRTN6?=
 =?utf-8?B?OGR1eTBZcG9WYXdlb3VuRkpoWDd0UDB5K01hbGlQYnBRbXhOUDRySXBzLy84?=
 =?utf-8?B?SzVNd1o1Qll6dTJlVy9rdDI1a3owWlh6c0xGVVlMQ3AxR2lBeGNvaVp5VHNk?=
 =?utf-8?B?UUY2azFNTk5jVnNWS01XVnFkWXNwemlGMGNOenNnK3NYcm81Y0J5YytLeUM1?=
 =?utf-8?B?aWNrRlNzODh4Y3hOUmoyd0k3b1h3c0NTck12Q3JvaFU1ck9adkFpeGhQa1pi?=
 =?utf-8?B?ZzVpNWRvMFBBMmdRKy83VjAzeWNIR0hCWERvMHl0V0IzZCtCZmRBT3RWNnZj?=
 =?utf-8?B?LzZlRStqS3ZZU0hidjY5UDNpdFM4Rk10NENhcjZUeDdJSWVjMitwM3FEdWRU?=
 =?utf-8?B?ODluRWkyd2tsckx0UVZrYUxpdWlEMkRaVldrYUpRamdwSDV2ckxtS3NOWXBt?=
 =?utf-8?B?UGFYeXcvc2ZWTnRJS3Z0UjFPbjZmWW91WTZuQ01TcU5jUlpORzdVcEE3aGNp?=
 =?utf-8?B?YkdoNFdrYXl3SVBnZ1loMGVVa1hnOTRtMzJzKzNWK1RZWGZGcUR2bi9TS3lh?=
 =?utf-8?B?alhNS2lJZEQvbzNRdkFDVjV3WGZ0MlJwNkIzd3EwT1luaklzWjFNODFCVWlj?=
 =?utf-8?B?bis5QzZOYVVsUUF5cUg1OFk5SE5aS0ZIWWdRSWJYajBKQUh0L1R2cE8zcEUw?=
 =?utf-8?B?Yjc3elFITHFYbEtLL2tXTVd1TnY2L2FiemYwYjhMWWQvQW9ueFZmdm1tN2tP?=
 =?utf-8?B?anVpVkptRkI5VUNTY1RQekRLRENlWDV3WHJ6WWV0S0hhRXBDdEo3ZTN5bFds?=
 =?utf-8?B?N1ZuZ0lXZkU3Zzl5YTh4UXhoSHZmb09idlJuODlCazNlaUVlcFFTTi9KSC90?=
 =?utf-8?B?VmRCYmduSzB3cjVaUWM2WjRQUlhBbXUremxUb3VzWk9aUFFySmc0WmM2VHVy?=
 =?utf-8?B?dFB5NVlheVdscHpJdS9rM045YTlxSHJZZDRpaTBub2cwRlZVQ0NHQzdSMkhR?=
 =?utf-8?B?eFZReGJUZUFmVlpXWmZodGx0cXp1cldnZk5manlGOXpRQ2FqcE1LUm5FRXFB?=
 =?utf-8?B?ajNSZE95VEV0OGt6aFFEWHVJR2VOR3o5bDhZSWxEWXhOYmh5Y0lINkV2aDZp?=
 =?utf-8?B?THlHN3gwTFlGckdmdTJ2cnc5WEErVFJTNGVLbDhIMm5Oa2xDeVo0NW10U2Yz?=
 =?utf-8?B?N0NERzIyV1FxTUZHUWtCNjRTRkMvMm9MUzg0ZDdtSXJ5TzlpeldVMklCUVNp?=
 =?utf-8?B?dFR1L3hudHliZkd0ekdER29WWUM0b3NvZnlPdU1NRzlXenVqaEl2cVhkd1My?=
 =?utf-8?B?RDFiUEhTNDFtTm04V2pCem1xbk1lRk5IUlE2cWpPY3E3UTNVcEl0RURWWXZE?=
 =?utf-8?B?WEFTTWRWcVhrUTNzNjRKNCtObEZzdVlDRVh1VFlMVXNtdmdpT2lCeGNLVy82?=
 =?utf-8?B?MEEvZUZVc3pJRXhrSFpubFpvL3U5RUY4MnhmTEdNcmlhRXo0SHZSZ1p3dGE5?=
 =?utf-8?B?UnpLalVkd1dtOGVtUm9tdkJvZWdVL2FEelBobzRmb2NQZi9oZ3dDMUFCM1Nv?=
 =?utf-8?B?a0twdnJOTzFPSkpoSmw2SGdIb2xacGdObGxIR21CbXJGbHJaSXdrYmtwQzVZ?=
 =?utf-8?B?S1k4TklYQ0U2MklTOURodz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXFRQVBrTWhPWGRYWlVyRnh6alR2TkRBUC94Wk94cWxPTGJ0ZjB5ZThtMnlM?=
 =?utf-8?B?MnZjbkgvN3BXc283a3JmaVZtQ3BmRnVlUUhDZGhtbEdqN1F5N2RBanJFZm1R?=
 =?utf-8?B?dHMxeTl1SEYvVStUSjdxeXhyLzdtcVkzcFkyYzF1NEwvWmtEM1ArVi9uSnRV?=
 =?utf-8?B?eCtXR1B3SGpseUIySm9scjh5RVZxamVHVTFHV0JvQmpmUTk5N3BKaW9qWXNh?=
 =?utf-8?B?Ny9ReHJZU3lvdXIzeVlTVTRadnNSQmJJbkZNdGFBUWtWTCtQdW91Z0NWSlFW?=
 =?utf-8?B?ZzkzekxlV2dqSkdxaVJkRzVhVnJuM21CUU1ESHpYbWNnK09RazJKSURFNnRn?=
 =?utf-8?B?ZkRGRXVaYnJjVTYzZ0FNRUkwK01PTVh6eUIwQTIwNGUramRCdnJpbnNMQXJy?=
 =?utf-8?B?ZTZMZWNPZnF0RS9vT0tFWVpEQWZldkRRZ3llN2VCZytYK0pnNWphN3l3Q0Rh?=
 =?utf-8?B?TC9rZnA5Umx2ak52NGVmb0ExSHE5ZGtlcmdlbDhSSWxreXJDby9DbDZKOERw?=
 =?utf-8?B?UXRHQTVidk1mNXgxR2N2RWxIY0lVRm8xN3lxWjNUNGZDaXRjMkFTbWp2NmQ5?=
 =?utf-8?B?ekJuUmhubXBzZkhxbUpSMXZRRlYyRDBLL0ZNS2ZnN05iWkJPOEdEQ1hMVmxR?=
 =?utf-8?B?blNUYmRTUTB4Y0VXWi9sakNlS1RjMC9RRFZmYXhmaFNQdWhjMlpTVU9Id1pW?=
 =?utf-8?B?Tm14Z08vUnAxdGJqSXRmRUR6MmFKMDNNbmFmWjVTNG0rVnNXYXJobkhJczA1?=
 =?utf-8?B?aUFyV05ESHlnNWEwWE42cXZueTJnSVUwMHZtUktKZGZnMDBJSTN5RXBpa3JR?=
 =?utf-8?B?Q29KQkM0SVozU1VUVmlqQjA1TVN1akZKMVFyZU1uaTM2NGFncFRsbUIzMGhQ?=
 =?utf-8?B?Z2pUTElVbENnaDNkbFZEVjlSZEhDcTJ2MUxUckM5SGtpUVZUZFZQbjlmTEFX?=
 =?utf-8?B?dGRCM3QyRzBPbkc0MkpVZWdZaDUvSzZXZjFFUy9vUGpZOEpOT1o0NkFRZzZh?=
 =?utf-8?B?Q3hQaGxpMCtQdGZFRkZnZmNiTTBsU0xFSkNUTVR5eHVMSXJTNFJETitCQ0Jl?=
 =?utf-8?B?UzhudkgvZXA4eUpReHNTRUlzcHcyV2swT3l1RzE0NkFvTkMvU05NMFVsM1dY?=
 =?utf-8?B?Y2lqUHVQYU9vTXUvWmJvaHpla0R4dll3NGsrUjdhTm1IdXU0NEdhcEpwQml0?=
 =?utf-8?B?aHlzVkNWM2R3WC8zZEZGTDhtMlhHaVQ2aVpSc05iOXZTakdULzlCcEtHVXBJ?=
 =?utf-8?B?QWE1a3BUT3VJYzV4cXVia2dlSHdtSi9sTHJ1UFYzK0pwcGt6RGJzVTArTDBN?=
 =?utf-8?B?ZDNXKzIraHRCSmZISkJlSW5Yd08xSUIxMWVEK0hxL2h4aVpaekUyQTVnN2dU?=
 =?utf-8?B?azBRMUhmKzJmVkFlWFdoaEkrOXRYbGZKeEhxZ0ZVbjFyQVc1ek1xeDR5Wnor?=
 =?utf-8?B?VnI5SktlalFxYXovOEQ2Zzh6UStWUXpydFU3cEVjRWJJc2lER1NJVjkvQkY0?=
 =?utf-8?B?ZzBXNkVJejRnOXBBcTExN0tZSjJkajUvcEZHSS9USnVGSmx1TVVZZzBBb2JT?=
 =?utf-8?B?MU1yamI5ZUhaaTk3Vnd3ZkdudjljSTU0QjB5V09MUEtMZzc0dWNCcU5aL3Fp?=
 =?utf-8?B?YU0vaTh5SzhSeHdsV3ZMRWViNCtkTDR2OEhha3kyTFR2MFlZaG1rZFYvbEd4?=
 =?utf-8?B?WVM4eUJsMXJBaWZ4V2o0aGFNQTNVdTVBcEcrRjVXNFpVNG5seDM4TCtmeC9V?=
 =?utf-8?B?ckRERVd5K2g3dGgrYjIrMTVkSWdXM3owOStrU2RHZE5tM0dnY2FSZlpUQXY4?=
 =?utf-8?B?SHpmVlhyTGJrZzYwYW41cTFrSWZ6bEFVUFU4d3N2Ymc3aHB4ZzgvdjdoZDJl?=
 =?utf-8?B?MlFRQ0dvTjErMldkcUpuVFEwVU1iSTZRMzlBaUZXdW9Tb1ZLTFhqWjh1b3Rn?=
 =?utf-8?B?OW5YY3VXanlWYnBYWnF5NGgxcGRUMkhuNEd0dnJFcFlPTStFQU5NMkc3V0Vy?=
 =?utf-8?B?VHZDNVlNOUxtTGJieU9TKzVBeEpra1oyTllROFBVbHN0aWdCYUg0cnRSTTdF?=
 =?utf-8?B?R29tQ1JnaTlDeFVEOTV1eDc3V1hPOGp2VlpuUllvdWxuUDBtbk10Q2hxbis1?=
 =?utf-8?Q?k6u3AeGak9cL8pktwVWylp+ea?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e00d68ed-a2f5-4ea4-a05a-08dcb3067069
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 15:19:02.5578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhZAj8V7lbXAS2+uFfvRGX145fhubILG1MQJzcUrRjrYPPh2VrmTTQHKsEqYQBSbVYvYuHqGWw0MDR3BnasXmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8715
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

On 2024-08-02 10:59, Hamza Mahfooz wrote:
> This reverts commit 76299a557f36d624ca32500173ad7856e1ad93c0.
> 
> It was merged without meeting userspace requirements.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Series is:
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/drm_connector.c | 48 ---------------------------------
>  include/drm/drm_connector.h     |  2 --
>  include/drm/drm_mode_config.h   |  5 ----
>  include/uapi/drm/drm_mode.h     |  7 -----
>  4 files changed, 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 7c44e3a1d8e0..b4f4d2f908d1 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1043,11 +1043,6 @@ static const struct drm_prop_enum_list drm_scaling_mode_enum_list[] = {
>  	{ DRM_MODE_SCALE_ASPECT, "Full aspect" },
>  };
>  
> -static const struct drm_prop_enum_list drm_power_saving_policy_enum_list[] = {
> -	{ __builtin_ffs(DRM_MODE_REQUIRE_COLOR_ACCURACY) - 1, "Require color accuracy" },
> -	{ __builtin_ffs(DRM_MODE_REQUIRE_LOW_LATENCY) - 1, "Require low latency" },
> -};
> -
>  static const struct drm_prop_enum_list drm_aspect_ratio_enum_list[] = {
>  	{ DRM_MODE_PICTURE_ASPECT_NONE, "Automatic" },
>  	{ DRM_MODE_PICTURE_ASPECT_4_3, "4:3" },
> @@ -1634,16 +1629,6 @@ EXPORT_SYMBOL(drm_hdmi_connector_get_output_format_name);
>   *
>   *	Drivers can set up these properties by calling
>   *	drm_mode_create_tv_margin_properties().
> - * power saving policy:
> - *	This property is used to set the power saving policy for the connector.
> - *	This property is populated with a bitmask of optional requirements set
> - *	by the drm master for the drm driver to respect:
> - *	- "Require color accuracy": Disable power saving features that will
> - *	  affect color fidelity.
> - *	  For example: Hardware assisted backlight modulation.
> - *	- "Require low latency": Disable power saving features that will
> - *	  affect latency.
> - *	  For example: Panel self refresh (PSR)
>   */
>  
>  int drm_connector_create_standard_properties(struct drm_device *dev)
> @@ -2146,39 +2131,6 @@ int drm_mode_create_scaling_mode_property(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_mode_create_scaling_mode_property);
>  
> -/**
> - * drm_mode_create_power_saving_policy_property - create power saving policy property
> - * @dev: DRM device
> - * @supported_policies: bitmask of supported power saving policies
> - *
> - * Called by a driver the first time it's needed, must be attached to desired
> - * connectors.
> - *
> - * Returns: %0
> - */
> -int drm_mode_create_power_saving_policy_property(struct drm_device *dev,
> -						 uint64_t supported_policies)
> -{
> -	struct drm_property *power_saving;
> -
> -	if (dev->mode_config.power_saving_policy)
> -		return 0;
> -	WARN_ON((supported_policies & DRM_MODE_POWER_SAVING_POLICY_ALL) == 0);
> -
> -	power_saving =
> -		drm_property_create_bitmask(dev, 0, "power saving policy",
> -					    drm_power_saving_policy_enum_list,
> -					    ARRAY_SIZE(drm_power_saving_policy_enum_list),
> -					    supported_policies);
> -	if (!power_saving)
> -		return -ENOMEM;
> -
> -	dev->mode_config.power_saving_policy = power_saving;
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL(drm_mode_create_power_saving_policy_property);
> -
>  /**
>   * DOC: Variable refresh properties
>   *
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 5ad735253413..e3fa43291f44 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2267,8 +2267,6 @@ int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
>  					   u32 supported_colorspaces);
>  int drm_mode_create_content_type_property(struct drm_device *dev);
>  int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
> -int drm_mode_create_power_saving_policy_property(struct drm_device *dev,
> -						 uint64_t supported_policies);
>  
>  int drm_connector_set_path_property(struct drm_connector *connector,
>  				    const char *path);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 150f9a3b649f..ab0f167474b1 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -969,11 +969,6 @@ struct drm_mode_config {
>  	 */
>  	struct drm_atomic_state *suspend_state;
>  
> -	/**
> -	 * @power_saving_policy: bitmask for power saving policy requests.
> -	 */
> -	struct drm_property *power_saving_policy;
> -
>  	const struct drm_mode_config_helper_funcs *helper_private;
>  };
>  
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 880303c2ad97..d390011b89b4 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -152,13 +152,6 @@ extern "C" {
>  #define DRM_MODE_SCALE_CENTER		2 /* Centered, no scaling */
>  #define DRM_MODE_SCALE_ASPECT		3 /* Full screen, preserve aspect */
>  
> -/* power saving policy options */
> -#define DRM_MODE_REQUIRE_COLOR_ACCURACY	BIT(0)	/* Compositor requires color accuracy */
> -#define DRM_MODE_REQUIRE_LOW_LATENCY	BIT(1)	/* Compositor requires low latency */
> -
> -#define DRM_MODE_POWER_SAVING_POLICY_ALL	(DRM_MODE_REQUIRE_COLOR_ACCURACY |\
> -						 DRM_MODE_REQUIRE_LOW_LATENCY)
> -
>  /* Dithering mode options */
>  #define DRM_MODE_DITHERING_OFF	0
>  #define DRM_MODE_DITHERING_ON	1

