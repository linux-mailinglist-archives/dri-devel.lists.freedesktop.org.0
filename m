Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BCE8D1705
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 11:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC56E10E2F4;
	Tue, 28 May 2024 09:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qxh/gN/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C8410E1F9;
 Tue, 28 May 2024 09:16:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzTTfLRD1nREew5wA5J6kHRGmtNt6Z9np4YKYTQqw5fqW5YI+Hz4hRC45FEXkvX2T5dKeEVXO7TRh1JwD5PHDhzOyt56yyuDsH57+1zvISrD639CoMhoBb22OTjxxcPMOkH4cKeqCl0P/GQuYnVZsONblq0r88o1w/P35vh43f5Uc2pov0rcdgcOfvkg+/EES+4klafUuDN15e6Nu8BJSnw/2vcDRD5WzQTwzMHO1PzyWFOBauWR75trCRfXhwM3zK8e8GG8p3xp+1a6OHoT3dbOc1AabIKPUdXtJd2ZQz9wyKtUPmZG6APXAv8+raS1CG98xdBvnfP8DgVKO6tanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQOBcuxNW+RyQrxefWQ/ycezhrzDMmTFwlSittfZHWY=;
 b=kGaGm7FNpwhldEbwN8lUg1fAS7O6glgYjPpjiOshQD7jvtN9gJfefVrp244t7HMw7BCMXfugRXjFp1ScEpuXnn2BR8J8RjXc2RQLikPjRFKwkwjwDkMvL0CWXyTDLpb+KseTTVDi5AcI2rSWFBho7/OWklMEsEQEG5xiwtCzDx/HBtKQzi1a4DjunnfNfiregkU4GT9SEXRFUEu54gB+uYHPT8sXnCwt/i8ZGrQFe9fywezxFeI+ZnaYUuyJs9MnLsLAGQ60bQUTZXd5tPYLSoRMB6jELpVK/opeG5HC/GZeV7SCjhXa1dIuoIBhCqv+TWzDSqD7/kR4+DUy2a3dxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQOBcuxNW+RyQrxefWQ/ycezhrzDMmTFwlSittfZHWY=;
 b=qxh/gN/4/wx6mBR2iGav7fSigE6iy5fexsxU3+kbdDlYMUMI/iVN0THtScNV7dcFka9R0Cu0qxPfQ/ZImSPFa+I29s7K1fcaujAuya0MTAZVvOCLmCev2Rv8rkN4C0LktFhQKitTgaIcGCweKkV6N0v6jN7Y7Fcx0OV1S5oSnVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4472.namprd12.prod.outlook.com (2603:10b6:208:267::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 09:16:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7633.017; Tue, 28 May 2024
 09:16:14 +0000
Message-ID: <aa97bfdd-961d-40f2-89ed-81ae8347494e@amd.com>
Date: Tue, 28 May 2024 11:16:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/21] drm/ttm: Allow TTM LRU list nodes of different
 types
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
 <20240521071639.77614-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240521071639.77614-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4472:EE_
X-MS-Office365-Filtering-Correlation-Id: ef5ac502-be33-4dd3-c484-08dc7ef6d280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czlHTUFLcTNrUnpyVXcreG8xWnRtNDBKT1oxRW1HdVZJUzdVWWRLYVQxbWtt?=
 =?utf-8?B?YWljVWNlK1hQMVlVK1FZOFFmY25iUHRsODI4M1R6eWcwb2t1aUtQUVI0Umhu?=
 =?utf-8?B?QTloZ2VOZUZJRFhQQkJyM1pwVkZDMExRQWVnL3J5K3dGSHhGUEp0OGFJbGow?=
 =?utf-8?B?WkpLcEIyNUNTVTduTENWR3dZU05KREs0UVFRdXcrVllMOG1oWFJHR2dPZVpN?=
 =?utf-8?B?VkEzMHpjcGRYOFM3SFZVTkhaR2psRFhNSzVMc1QzSzNyY0xtbjdLcHRIYlFq?=
 =?utf-8?B?UDBJaDhWdGtyelVGUmI5dzZlWHhsQ09od2tXREpkTEwzbTNCTExITGMyd2Jp?=
 =?utf-8?B?cDhVSk5UV0w0SFZvbmNRV3kzM1JIbDRxTXpHejRLRzJpaTJaZkNHRzhFbFBQ?=
 =?utf-8?B?RVYvck5nRzdpNjN2N01pdGpkcEg1OWVkQWhGbzZ6WWMzcU9qWG5qZ1ZaNjIx?=
 =?utf-8?B?T3JoOGxwVE95VFkyL3RpNXlRVVZkMlZqVVFLWXJsK3R6b0l0Y1ZZYTBuZGxq?=
 =?utf-8?B?SUExelNOUGQ1b1huSkdtUzRjajVvZFFYZFIydzJ4bVByL2xCR3VvcEk4R2pC?=
 =?utf-8?B?d3J3dDQ1ZTNya0p3Mmw4dDlQM2VGWkVhY2E1UzlEcTlWcE03cllST1p6bmxl?=
 =?utf-8?B?VWt3akJwWkJiS3dzR0kwUms3RVg5OHMvdnB0cCtMSTBRMmZpWVJwQytjL3Fp?=
 =?utf-8?B?QzZnZm42cVA5RVNnL2RyK0QwUGhKN0J3TzdhWk5VZEJBWXBUMkRCT3ZqT29P?=
 =?utf-8?B?OS82RkhLNEJrTktsQUVoTHBUalNYSzV5VW5EQUVyajV4RGxJajFPWndkYXEr?=
 =?utf-8?B?LzYxYkFlUTR2MHNpNVo4dDI2ZHlmNXFhTG1McXZSTE9NMUEzSmI0dmE5M0M2?=
 =?utf-8?B?TDlWR0tlR1RlM1Nub21oMmpzM0RVaWdkM3BTRDFrSno2UDFVTUgrem1NQjVh?=
 =?utf-8?B?SzIva2hXTy8ybFFTY1ZHMlNVUE5XdVFTdlF5UXZGUU9XRzJ0Y2k1Z3RwN2Yv?=
 =?utf-8?B?SUwwaDF1OXZJYjczKzdhYWNBWkx1VUUyUXU5aWZhUUVCYjZPSXI0UzgvejNz?=
 =?utf-8?B?amdoL1hiQXN4cUF2d1VWbzhKZ2UwQUdxWmFYK2xYWXFJc2tXOEs5Yis2R0N1?=
 =?utf-8?B?NmpicXhqMkFwbm02VnA5aDYyQmRqS2V4a01tNzNYTmtMM0dpOElLR04rRTBo?=
 =?utf-8?B?RU9RVWhTME1tSTNpS09SbDJDZmNoQlpESStRL2ZHNmsvaFZhSmFDWjhBeWpK?=
 =?utf-8?B?WXdRT3B2RE5WMk0rRUlsY2lFUTZYdjRKRHJZUUtaUFRPRS84eUVFME0wZHBq?=
 =?utf-8?B?N04zVVU5SkNjM2dyRnd2WDRHZmxQRXl2RVAzbDBaZjBCUzJRQk43MGlpZloz?=
 =?utf-8?B?MW51WVpKSllhTVFuK1dzRktmZVdXUUdOS3Yrdk5vb3B0TWZDSzdFd2ZJdUZC?=
 =?utf-8?B?cGQ1YVh3UWZldTVkK0Z3dUU2TzhCUnF4cHdpSUswdllURnBaUlI5OFdvOU92?=
 =?utf-8?B?OUtZdTNFeE9QMlRLUXdsd25IZmNuSHNGQkFIbFU5d2twVGpDajNPOUtTbnhC?=
 =?utf-8?B?TVlEZnQ4b29NT0tRWFdwVlZ6ODltTFZqSENVU0JuRDFjMGQyeHd4RC9peWlY?=
 =?utf-8?B?Qk03YlBBT0Y3Rk5sUkR3VXprL0d3WS96MjM5R3pRU2Roaks2UWpVeUgxOVV0?=
 =?utf-8?B?eWlLN0I4YTZ0dEw2bVVQRkNEWlM5TkZMREVNV3hJcUd4ZHlzVmhVbURRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1o4YnhGV3R4UDhuc3htVi85ekhXQS8xTUFwZWh2MmxId2l3UzRpN0Z1cFJX?=
 =?utf-8?B?Ni9zRm5qV1daaElxU1lpZUtpbWNCNG43RHExSmFSdmE5a29ZZFoyZTNTYjlH?=
 =?utf-8?B?cW02KzFLTnQzWG1KN2U0R0dMM241WHZIRE41Q0dxTnpOL2lWSUFuR00xWmgx?=
 =?utf-8?B?TEg3N1RoTjMwajlBZHRpeHZtNC9qaC9hMHFERVZaTmxCdkQ2QmVQOVBEWC9u?=
 =?utf-8?B?cURXbjhqNDQxM0loVkdYeUFuTlRCbXFCa3kwMjJmZ21VQUhzUzBZd0E3djFt?=
 =?utf-8?B?UE95MlRaVjV5dkVzWnVuU2hkRVpTclVCeFRWcEE0Z1pqZTIrUGs4akU5aklT?=
 =?utf-8?B?ZVlTM0FwQ2dCVUJSVTh3RE5CL00zcE03VlZPbnJhY0FzclRFdXA0U2lFaUdy?=
 =?utf-8?B?MWM2T3JtRVY0OWtWc2xLRWZKZHMzanJDbHBxbnByTU5rbHBndFIyandBT2wz?=
 =?utf-8?B?N2tKa1R2dmQ3RnFTalBMM1IzMUlqNWI5a3pFM2ExQzNnZWFKeEdxUDNJbjRC?=
 =?utf-8?B?RTZIMFRIOG5Ud01IN2VNUFJmK0hrdGNnV2puZEw4NlhHWE1oQWYxRkFXdFNw?=
 =?utf-8?B?QkNWR1JnVldwdDY4eFk3WnRQU2k0M0dhYzdWcUFSV1JLRTgyZzluQmV5VVZ4?=
 =?utf-8?B?S0Z2YzVhTGJQNWw1YTEyK1ZmUFZvWEl5Z1RVaUxOejV2K3gzRldIakNsbVVm?=
 =?utf-8?B?eWNUVjM2YjhsUENPVkxHdVNVTHFyMTliS3JGZ1g3YU5lMEhuRXpjYlg1SC8r?=
 =?utf-8?B?eit2MHE3aFJjekVZRzZ5aVB3R0Z6VytpK1dtRUdQS1ZjZnZ0cHVGNDVQM2dp?=
 =?utf-8?B?NVA3eXJTbzFKZ2JTWFVoREwyaEJOSHo1UjI0TWxnVEt5aURpUTA3TmdXZVQ3?=
 =?utf-8?B?a0EzZUs0RGN1c0ZSZW1VQ3lNQVBLVHZWSlpyT0tBOGg0OE5hLytHZXVOUWNN?=
 =?utf-8?B?aytvYmlJb29XNnduZUtyemxnVnY4Y01mL3BTRFMrMHJqZUZRYUVSd2IrQ1Jt?=
 =?utf-8?B?UDVkNm84WGZOT1dqTHBLRTVPN2dud3B2dkVmOCtWblJYUHZENEpReGxDTk9L?=
 =?utf-8?B?WjYyVWpCOWdMNTdZSldzZHdEN2ovYy9oWFZzNXNNdTFPQVJXb1AyVkRha2NX?=
 =?utf-8?B?Z1I5SC9QMTlkNHdOSHZUVWp1TkxGL0JKZk1zZjg3dFFoT1QrZmlSaVJCZW90?=
 =?utf-8?B?REg4b3QwTG5yRHFEbWF6bmdtWWRtcGlDZjFNSU9sby9IR1B3WlhmMXRucUho?=
 =?utf-8?B?L29qZE5oMWFjOWtKdlNXWWQwektYQzJURG9TYTRnU1p5TzBaRmk0OGhQS3Bl?=
 =?utf-8?B?MlZKb0hzRnJ5b1hZbTlMeHRFQ1dUb0cvZEZRMWFnQTNaQjNMV3VWdzZOOFZn?=
 =?utf-8?B?TVFMMXREWFdHVWY2aUNzYjlGVGlCazIwUDRIQ3pQOUt3K2ZjdHk0a1RoWDd0?=
 =?utf-8?B?SUhsTEtmbDNEajhlaEw3b25UTDJUUUZZNVRIc2pXcE14VnFtby9zZWxwRzlS?=
 =?utf-8?B?NXlPcTRTUDZJZ1hTV2RBUGhSY3pqN2FIMEFBdDZHSk45V2M0ZnZrK0dkNFY4?=
 =?utf-8?B?OTJhNHBTaUJSWURJdHNFcDMwSDlrcDV2TTlCZXdjVnhpUXIvOHZzUlh4aEli?=
 =?utf-8?B?RnZMb2tVdHJGME5XRFArZ3FxL0cyM1kxZlB0QW1ML1F5TzhTZjZHamhkN25M?=
 =?utf-8?B?bzZRS3p0bllSa0hUaTFoM2FWK0V5bTlYVGs1MmU2MnRXWWdLL3Ryc0NPUmkx?=
 =?utf-8?B?VUNCZldYN05BUjFlRDNGM0szb2theVY4amphVEttbXdORHZWcWMyTFNoZDdR?=
 =?utf-8?B?RDhnZVgwZFhqQ1pZcHZHYk9WUUk0Nzh6dWxBNXdDWktScStaQ2JFWEgrcDRq?=
 =?utf-8?B?Rjk4eDRpYkw0SWdCSGNqemZqNGZQaDFTSjd1M2lBV3czWWN2VkFFSEtEdE1V?=
 =?utf-8?B?RmNRL0RFVWFpMjNlSWtJUThrLzJtbS9jemNWUUk5MkNiaEhYbTVZaThESTMv?=
 =?utf-8?B?ZHBwa1A3ZzNncndOWGhCRmRHejhSRHh4NUV6bmZoWElWZ21SeGUxdGxONEhU?=
 =?utf-8?B?LzRpdWlXNVgvbkVNNk41US9VTVpyK2M1VUVTV0hLMzM0V21iZkIxMDBzdkhk?=
 =?utf-8?Q?4fIyY3ZlOXqjenRx7WasayF7k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5ac502-be33-4dd3-c484-08dc7ef6d280
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 09:16:14.1408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9b4pnZk2zITXruXYMzL8TD6/6Qis0h6DwssFiwLdWGSd7RRR0pJxMXWOX7ClYsoW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4472
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

Am 21.05.24 um 09:16 schrieb Thomas Hellström:
> To be able to handle list unlocking while traversing the LRU
> list, we want the iterators not only to point to the next
> position of the list traversal, but to insert themselves as
> list nodes at that point to work around the fact that the
> next node might otherwise disappear from the list while
> the iterator is pointing to it.
>
> These list nodes need to be easily distinguishable from other
> list nodes so that others traversing the list can skip
> over them.
>
> So declare a struct ttm_lru_item, with a struct list_head member
> and a type enum. This will slightly increase the size of a
> struct ttm_resource.
>
> Changes in previous series:
> - Update enum ttm_lru_item_type documentation.
> v3:
> - Introduce ttm_lru_first_res_or_null()
>    (Christian König, Thomas Hellström)
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_device.c   |  4 +-
>   drivers/gpu/drm/ttm/ttm_resource.c | 89 +++++++++++++++++++++++-------
>   include/drm/ttm/ttm_resource.h     | 54 +++++++++++++++++-
>   3 files changed, 125 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 434cf0258000..09411978a13a 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -274,14 +274,14 @@ static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
>   	struct ttm_resource *res;
>   
>   	spin_lock(&bdev->lru_lock);
> -	while ((res = list_first_entry_or_null(list, typeof(*res), lru))) {
> +	while ((res = ttm_lru_first_res_or_null(list))) {
>   		struct ttm_buffer_object *bo = res->bo;
>   
>   		/* Take ref against racing releases once lru_lock is unlocked */
>   		if (!ttm_bo_get_unless_zero(bo))
>   			continue;
>   
> -		list_del_init(&res->lru);
> +		list_del_init(&bo->resource->lru.link);
>   		spin_unlock(&bdev->lru_lock);
>   
>   		if (bo->ttm)
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 4a66b851b67d..db9a7a3717c4 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -70,8 +70,8 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>   			dma_resv_assert_held(pos->last->bo->base.resv);
>   
>   			man = ttm_manager_type(pos->first->bo->bdev, i);
> -			list_bulk_move_tail(&man->lru[j], &pos->first->lru,
> -					    &pos->last->lru);
> +			list_bulk_move_tail(&man->lru[j], &pos->first->lru.link,
> +					    &pos->last->lru.link);
>   		}
>   	}
>   }
> @@ -84,14 +84,38 @@ ttm_lru_bulk_move_pos(struct ttm_lru_bulk_move *bulk, struct ttm_resource *res)
>   	return &bulk->pos[res->mem_type][res->bo->priority];
>   }
>   
> +/* Return the previous resource on the list (skip over non-resource list items) */
> +static struct ttm_resource *ttm_lru_prev_res(struct ttm_resource *cur)
> +{
> +	struct ttm_lru_item *lru = &cur->lru;
> +
> +	do {
> +		lru = list_prev_entry(lru, link);
> +	} while (!ttm_lru_item_is_res(lru));
> +
> +	return ttm_lru_item_to_res(lru);
> +}
> +
> +/* Return the next resource on the list (skip over non-resource list items) */
> +static struct ttm_resource *ttm_lru_next_res(struct ttm_resource *cur)
> +{
> +	struct ttm_lru_item *lru = &cur->lru;
> +
> +	do {
> +		lru = list_next_entry(lru, link);
> +	} while (!ttm_lru_item_is_res(lru));
> +
> +	return ttm_lru_item_to_res(lru);
> +}
> +
>   /* Move the resource to the tail of the bulk move range */
>   static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
>   				       struct ttm_resource *res)
>   {
>   	if (pos->last != res) {
>   		if (pos->first == res)
> -			pos->first = list_next_entry(res, lru);
> -		list_move(&res->lru, &pos->last->lru);
> +			pos->first = ttm_lru_next_res(res);
> +		list_move(&res->lru.link, &pos->last->lru.link);
>   		pos->last = res;
>   	}
>   }
> @@ -122,11 +146,11 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
>   		pos->first = NULL;
>   		pos->last = NULL;
>   	} else if (pos->first == res) {
> -		pos->first = list_next_entry(res, lru);
> +		pos->first = ttm_lru_next_res(res);
>   	} else if (pos->last == res) {
> -		pos->last = list_prev_entry(res, lru);
> +		pos->last = ttm_lru_prev_res(res);
>   	} else {
> -		list_move(&res->lru, &pos->last->lru);
> +		list_move(&res->lru.link, &pos->last->lru.link);
>   	}
>   }
>   
> @@ -155,7 +179,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>   	lockdep_assert_held(&bo->bdev->lru_lock);
>   
>   	if (bo->pin_count) {
> -		list_move_tail(&res->lru, &bdev->pinned);
> +		list_move_tail(&res->lru.link, &bdev->pinned);
>   
>   	} else	if (bo->bulk_move) {
>   		struct ttm_lru_bulk_move_pos *pos =
> @@ -166,7 +190,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>   		struct ttm_resource_manager *man;
>   
>   		man = ttm_manager_type(bdev, res->mem_type);
> -		list_move_tail(&res->lru, &man->lru[bo->priority]);
> +		list_move_tail(&res->lru.link, &man->lru[bo->priority]);
>   	}
>   }
>   
> @@ -197,9 +221,9 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   	man = ttm_manager_type(bo->bdev, place->mem_type);
>   	spin_lock(&bo->bdev->lru_lock);
>   	if (bo->pin_count)
> -		list_add_tail(&res->lru, &bo->bdev->pinned);
> +		list_add_tail(&res->lru.link, &bo->bdev->pinned);
>   	else
> -		list_add_tail(&res->lru, &man->lru[bo->priority]);
> +		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
>   	man->usage += res->size;
>   	spin_unlock(&bo->bdev->lru_lock);
>   }
> @@ -221,7 +245,7 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
>   	struct ttm_device *bdev = man->bdev;
>   
>   	spin_lock(&bdev->lru_lock);
> -	list_del_init(&res->lru);
> +	list_del_init(&res->lru.link);
>   	man->usage -= res->size;
>   	spin_unlock(&bdev->lru_lock);
>   }
> @@ -472,14 +496,16 @@ struct ttm_resource *
>   ttm_resource_manager_first(struct ttm_resource_manager *man,
>   			   struct ttm_resource_cursor *cursor)
>   {
> -	struct ttm_resource *res;
> +	struct ttm_lru_item *lru;
>   
>   	lockdep_assert_held(&man->bdev->lru_lock);
>   
>   	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
>   	     ++cursor->priority)
> -		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> -			return res;
> +		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> +			if (ttm_lru_item_is_res(lru))
> +				return ttm_lru_item_to_res(lru);
> +		}
>   
>   	return NULL;
>   }
> @@ -498,15 +524,40 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
>   			  struct ttm_resource_cursor *cursor,
>   			  struct ttm_resource *res)
>   {
> +	struct ttm_lru_item *lru = &res->lru;
> +
>   	lockdep_assert_held(&man->bdev->lru_lock);
>   
> -	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
> -		return res;
> +	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> +		if (ttm_lru_item_is_res(lru))
> +			return ttm_lru_item_to_res(lru);
> +	}
>   
>   	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
>   	     ++cursor->priority)
> -		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> -			return res;
> +		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> +			if (ttm_lru_item_is_res(lru))
> +				ttm_lru_item_to_res(lru);
> +		}
> +
> +	return NULL;
> +}
> +
> +/**
> + * ttm_lru_first_res_or_null() - Return the first resource on an lru list
> + * @head: The list head of the lru list.
> + *
> + * Return: Pointer to the first resource on the lru list or NULL if
> + * there is none.
> + */
> +struct ttm_resource *ttm_lru_first_res_or_null(struct list_head *head)
> +{
> +	struct ttm_lru_item *lru;
> +
> +	list_for_each_entry(lru, head, link) {
> +		if (ttm_lru_item_is_res(lru))
> +			return ttm_lru_item_to_res(lru);
> +	}
>   
>   	return NULL;
>   }
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 69769355139f..1511d91e290d 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -49,6 +49,43 @@ struct io_mapping;
>   struct sg_table;
>   struct scatterlist;
>   
> +/**
> + * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
> + */
> +enum ttm_lru_item_type {
> +	/** @TTM_LRU_RESOURCE: The resource subclass */
> +	TTM_LRU_RESOURCE,
> +	/** @TTM_LRU_HITCH: The iterator hitch subclass */
> +	TTM_LRU_HITCH
> +};
> +
> +/**
> + * struct ttm_lru_item - The TTM lru list node base class
> + * @link: The list link
> + * @type: The subclass type
> + */
> +struct ttm_lru_item {
> +	struct list_head link;
> +	enum ttm_lru_item_type type;
> +};
> +
> +/**
> + * ttm_lru_item_init() - initialize a struct ttm_lru_item
> + * @item: The item to initialize
> + * @type: The subclass type
> + */
> +static inline void ttm_lru_item_init(struct ttm_lru_item *item,
> +				     enum ttm_lru_item_type type)
> +{
> +	item->type = type;
> +	INIT_LIST_HEAD(&item->link);
> +}
> +
> +static inline bool ttm_lru_item_is_res(const struct ttm_lru_item *item)
> +{
> +	return item->type == TTM_LRU_RESOURCE;
> +}
> +
>   struct ttm_resource_manager_func {
>   	/**
>   	 * struct ttm_resource_manager_func member alloc
> @@ -217,9 +254,21 @@ struct ttm_resource {
>   	/**
>   	 * @lru: Least recently used list, see &ttm_resource_manager.lru
>   	 */
> -	struct list_head lru;
> +	struct ttm_lru_item lru;
>   };
>   
> +/**
> + * ttm_lru_item_to_res() - Downcast a struct ttm_lru_item to a struct ttm_resource
> + * @item: The struct ttm_lru_item to downcast
> + *
> + * Return: Pointer to the embedding struct ttm_resource
> + */
> +static inline struct ttm_resource *
> +ttm_lru_item_to_res(struct ttm_lru_item *item)
> +{
> +	return container_of(item, struct ttm_resource, lru);
> +}
> +
>   /**
>    * struct ttm_resource_cursor
>    *
> @@ -393,6 +442,9 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
>   			  struct ttm_resource_cursor *cursor,
>   			  struct ttm_resource *res);
>   
> +struct ttm_resource *
> +ttm_lru_first_res_or_null(struct list_head *head);
> +
>   /**
>    * ttm_resource_manager_for_each_res - iterate over all resources
>    * @man: the resource manager

