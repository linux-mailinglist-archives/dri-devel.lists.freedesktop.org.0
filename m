Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B3B95F897
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 19:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490A110E20B;
	Mon, 26 Aug 2024 17:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SBJsL0li";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AB310E209;
 Mon, 26 Aug 2024 17:57:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x56yXmaa9dvWysl0p2MUV9zH1pPHvFZX/WxOgil2fBiKGdvuhZH7QyfYZiz2lUlMvSG6Nh2N273YAPkL7LhEM0ZWlOoBHLqr1drBtbhbxJ9FVrsE75dUYM0zK7JMbLyepcWRwiKes0rPyDrIdFcFX7k9Auj/5IurMHOzXO3Bcdoo2xeotPlA6/9SuO8Q+b3s3FtRa5A3QQOQhZepuFZfVT06JyTlOXxZKINBaschxrKYBhaaPoBK42JouKL2D+2DiJaexRqENOA7sCCofPjZKOkX2h90TJRU79zTwXOhPHxWkBPKsT0QNzhchsJuBV123j7EGjyz4su5f2LczE2G+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jttVVjBXwlZGUoiHM1ZZQbSmBuCbYFlPraYwpRlcKWs=;
 b=k5NdqjhO60xP5sCbjMeqR/8MfYW5+X/nJJgQExGjker2g95nNVRwBR6hlOG5P2Hor1MPJ7oDG2/JoJy2Z02phVN7Nip6H+yvgbzjFo22WFU8YS+KZVaCsvU3kldbtlyT3neYTO2xldazeMkLSVRoPOSAg7HjakGdoNXb/kopJ1PpFeoyARSkqNBwi+10UloX1+kDM4yOwOzjScueuhofaBj2Up6J2BWmv+5IFMNoaieg6OSvde40MD0RZLpJ8j5OyjL+A8CxNlS00WzJN2qP2Y/vDPVOwenR/1+M6/TshfSbpnoOX/yUpzEK3+LbiKsT8R0mNIGkTE8Z9+JtKOMymw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jttVVjBXwlZGUoiHM1ZZQbSmBuCbYFlPraYwpRlcKWs=;
 b=SBJsL0liwYYJU7OrjiEjNfYuNokRmGLoYm6qMMaRHus72sQFdtLGj44oDh/w/84wDBLUiAL6zjqK2OnrRZQJ9WuLJQQCQ3aYbZA8FR5v1ejo6oOjVuJlouQ97gNphNJRIFq2lgrzd/r4EK2hAQeul91NZRzbE9ckoKOe8uUFwWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 17:57:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 17:57:11 +0000
Message-ID: <aebe8cee-8674-42f0-b112-439da1ef7073@amd.com>
Date: Mon, 26 Aug 2024 19:57:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dma-buf: Split out dma fence array create into
 alloc and arm functions
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org
References: <20240826170144.2492062-1-matthew.brost@intel.com>
 <20240826170144.2492062-2-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240826170144.2492062-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 228dd653-a9b3-4b4d-3a00-08dcc5f882c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0Y4c20wWVdVOTEvN2Jrc0xncktzUUsrbGdSMlUzNzNveUVqakFtL1VtVmdO?=
 =?utf-8?B?RFRpaUYxaUFFZ1JQM0lzYTlvMlJyZzlVWjJHOTcwaVdjQThhVUdLOTUraGNB?=
 =?utf-8?B?MW5CRlMrZE4xVDJBR2Z5Vm9XQ3l4VGduZUtNUSthbTV3UmtXNzlJMlVhTmFr?=
 =?utf-8?B?RmphNTFIanJsY0dvcEIxbXJpdHZlYjBLdDBNSEtMTk9LdU1wb0tXUkF3eHFU?=
 =?utf-8?B?RnhETmMvK1YrSlo2eEZyRGpYR2FSQlFOaFhmdmVyRGNLOGxWV0NVakNwRFQy?=
 =?utf-8?B?eWo3cHZXT0REN0Vwbi9rNWNJRVhTNURQTFhRTmtpc1E0ekZmWHUzU0cvY1NE?=
 =?utf-8?B?K2tYdTBGZ0o3R1paUDhJWFBVNndVa09UTEJTWlYrVDkrcUFSaGM0ODd5cXNP?=
 =?utf-8?B?TWRqM3grdVRrb21kMGtQV0JpSTJWQnJaaFN0bVorOVVvd3psRi9sZGlxOXhm?=
 =?utf-8?B?aUoyRDR1bkdyTDdnZkllVW1jQTFFa1MrMlc4dWJtaVRwZVNHdXUzYUFUZFB0?=
 =?utf-8?B?NGxEU2pFNHZmdTZoTkFzNFRHYlFnWitQelNvTk9lRzlwRXhqelduMzhrbVJ0?=
 =?utf-8?B?VlFOT3lyT0RJWGZzTzV2SDE5YW5DUFBNTW1TR3Z4WW1wUEs4dGdxRzBIVHND?=
 =?utf-8?B?d2tuaC9iNmxWUDQzQzZZR2VEM0pQbnBXbmp4VzE1ZWdyNFQwTWwveTNDS2sx?=
 =?utf-8?B?VUsxcDlheHBpbVJLRS92eEdlWlkwNUhxRUpmVlJRZ3Z6NDdwdzVpYzRhRHFF?=
 =?utf-8?B?djRlZ0swd3ZHRmMrQ0N5UnpsVDB2VExXdjN2bEw2a1lPSUdoWS8rZUJlWXNO?=
 =?utf-8?B?bk9wNHpLTlJkNVJDTFhveWJXblUvZHFHVEFEMzZ4UENXYjQxVmhObkhIR2xz?=
 =?utf-8?B?NFAzSXFVcVpndDNCTVVJT1g0aWd5eEY5dFV4TG8yNFZTSVgvN09IMnN4T1lM?=
 =?utf-8?B?cHNIdGF1UVJ4eHBDNll1bWZHUlAybDRXYUpoeTFKVENDczhLSUttamxBSXZp?=
 =?utf-8?B?eEdBMllFNXZsaEViNnc4UHh2amZiR3EyMjNKcFBiV1RqWXYrdlJyL2taMGVk?=
 =?utf-8?B?bytMK3RyeG1WRFlVdnJtbFQ0VkplZDl6ZTkyT2hsY290SFdabjhBQm9BQ0ZW?=
 =?utf-8?B?ODRCN3gvSmIveDhVcXBMcHpteWI4WWZwajJwVzZMem5jRFMxcU5LaytMOTFC?=
 =?utf-8?B?a1FWZ0VhQ1NzZExGMkJDRUo2a3lPaHZFQXNreWtpUVA1SHBJZXpQaXFKbFBL?=
 =?utf-8?B?bGFqRkpkakU3SlA3SmRQTkhhVVFsWDVmOXRLdFZOeFBtUEowb1MyZDE4dkJT?=
 =?utf-8?B?RE5JSlhpa1F2OUxtTDFjRlZNa0c0cFZEdk1vaEtBQ2dsbVFJOTh4aFUvd0Jm?=
 =?utf-8?B?RHozK3BTV01uZHRZTHZzOUVnSWxuUHJSSFhJNW9MRmdhaWJ3Nm50UzNXMkp4?=
 =?utf-8?B?ZEpJQUxEbjFNZC9DTERpTzFUTWZPUDllUWJVL2Yrd2RwVXRLWWo2bEl1UGxK?=
 =?utf-8?B?Qk9kZUJFcEltcjAxWkdvOTI4bWdlTDVPNU0wcUFqT2FZL0owTzJKK0I1MElK?=
 =?utf-8?B?Qlo0MGZUN2RwSEw1dFZncXAzelZoWmVjakpFYUVvcWFQZUx3UUFZMXgvTDVV?=
 =?utf-8?B?MElnNHlVdlhZRDU2czNERkxrU0p6T1NNNzBLTmptSWxIQ2h0MFhHcGZ3NnRi?=
 =?utf-8?B?emdnVmpMN2VxZlI4Z2htTzhSZHFuYnNCNlpTZGRHUXpSL2FUQUNKTjZwT050?=
 =?utf-8?B?MERBQUc5RGV5SmhuOWk0NnI4M29lMHM5aFBjem1qbTVzOWFLWTcxQ2NOa1V0?=
 =?utf-8?B?VWdWNVpxdWtkUy9iSjhodz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXRLVDBBL1R3WTc4bllQN0Q5WEpWdWcrUU1XU0xrSXg0b0lGMGxWYU1hODlE?=
 =?utf-8?B?Vi9lWlNMUWJlYk1reWlCOURFUzh6cmpENlZzMGxMYU5lOU9OWFFEMkE1OVVo?=
 =?utf-8?B?YTZibXptejdMVUNWaXNYaHZWdk56YkxwaGpHZi9WMmJTYSsrL0RvRitESWtq?=
 =?utf-8?B?N2p3UFBFWDdkQ2Nxc0ltMHlDZ1ZFZFJBSTMwNno1eU53YkFWeHNVV0VkYUth?=
 =?utf-8?B?cHpvSjVSdURaZlNxcXQ4MzVSbnFGdGRBYWhYcCtodnI3K2hKdkVsNUdETWhn?=
 =?utf-8?B?K0ZyWGFJRDVnaFpaNzlCZkFxS0pBNUIvWEpKckErTWZPSkZWbDFDeVhhVlVN?=
 =?utf-8?B?WldPUnFSZndtUnhyb21OUVdDcGZybkxJbjZMWWY3N0VMcitlOHRxQWJJUlZo?=
 =?utf-8?B?RzNUKzkwRFNnN1JIN2NJQVR2ak1DZTkweXk1azdGSWd6dk1CakFHc3prK2ZP?=
 =?utf-8?B?SitERUhJNWFuaEVaWEc2QldoUWZSeVJkQ1JUSDFPK0s3Vko3cmRJbjMwMGlq?=
 =?utf-8?B?Q2ZmS3NVbEN4UzlDbm5tK0x2TVRERzY0QzVrMVZzdlNCTEFINGhlWXhDOVV3?=
 =?utf-8?B?M0dLYlZNZm8vU1hJRUJoUDdncDRJVkZ0VlR1N0gzMDRBVFhKOENITy82SWJE?=
 =?utf-8?B?K0tHdDNObnBmUHVzRDREaUNlV3lSRDVpQmpzNy9ocmY3NmhFaW5PZUhURVVn?=
 =?utf-8?B?Z0g3QnNUdDdLKzlDMGpHc2djM2gybWJBMSsvQ2xadFRiZi9EVElYS3UwS0dL?=
 =?utf-8?B?UnA5Q29aV2ZXT3BIbkJXelBhM0VUS3UxTU14WnhScGV5YUpwcHVTUVNRS0M2?=
 =?utf-8?B?anR6MVZqdnBFTUYzUkhybTN1eTQ0L3EyZzhTRFFSdnNDMUtyTEs5Y0Foek1x?=
 =?utf-8?B?cGFzb3BjR2JjUGxzNXc5ck1zODR0MjRkdVV4K2JnT0hDbDMvWlhoYmRHU1F3?=
 =?utf-8?B?WFNBYkhVeGZRY3BPZXc0RU5IZDRVTnlsOURlMDdSRDFPWWtFOFovQVJDNnoz?=
 =?utf-8?B?TFZsUWxJb2JNN1RLZmpIU3poU0RJTnkycnVxMzFoUjhubzhWUjUvWDkyOVN2?=
 =?utf-8?B?Z0NXZjAxcmxDQ3RZd2x6MDJ5SXhDeWY0SUVwN2tDUlRVL2Z5dDYwM2gxVi9U?=
 =?utf-8?B?VmcwTUpXYzBEYjh3akhDSnNORlljbzBSSzFZV2R6Wmc0SUx2bUpMTmMvMHlp?=
 =?utf-8?B?VENIOGZuRDhDYWo1R01Nczc4aWRXSFh2MHF5b1hBdlpKcVExZlZSUHZBUXc5?=
 =?utf-8?B?L3RoeWdpLzNzVTRIQ24wbndETlFFZXZaYWY0aW5wT3ozanpOdGZjL3VYd2Rh?=
 =?utf-8?B?U3pFdVhUNVdvRDB3YXFuVW1uOWx3bGg5NENndHJMYUR2NkFyeVpXY25SNU1m?=
 =?utf-8?B?eCtyVlVGZCtUVVBmU3RSWXNXRS9DMkEyS1MzVjZGTkF0eEdsVUtkV1R6NExJ?=
 =?utf-8?B?NE93WlBwcDZsRHVJdktkM1Mwc2gvbHdyakIxRy9QN3NkRDZLN0pPSWJBOFBZ?=
 =?utf-8?B?amYvL1FJUVgrMmVqZmFwUGRaYWVxWlNRQkhjRGZJTktpUHNrQkYyMzEwRCs3?=
 =?utf-8?B?SjRXM0tkN2l1NE9PTGNvcCtzLzY4Yk5Va2JVZFBpd0NZcnpCdEJ0aU5qVm5M?=
 =?utf-8?B?R0xhMmw2L3dFWlorR3hxaUl4TnhveFhMSFJaQUtXU1FTYzFyWjg0VGc4enFk?=
 =?utf-8?B?L1lBbTlFdmtIb0Z0MkVxZ3phM2JBQWs3VlBtTWhaMS9saDkwS1RpNndtTWdv?=
 =?utf-8?B?SkNwVUJadHM3Z3FZOExNMUQ2MHMvVmlRTDY3cU80Wk82Rk5tTDN2T0pqZ0c1?=
 =?utf-8?B?djJIV2RQazBmVjU5OHF6QWhZeW4xS044TFZ4T3lSSndVMHlaSHd2OXZuZjd0?=
 =?utf-8?B?cWpEZkN2MTh0ZkFvR3NNc0pldk5GbnQyUGczK242Y0E1YUw2RGpKMUNCRVY4?=
 =?utf-8?B?SGVUWFBIcFQxWDhQNnd4MEZFUmJYWENYbUNiQUlIUzZRU1ZQRWsyMnVPbkpF?=
 =?utf-8?B?Q0FDTUlYVzZ1K3Nrc0ZvbkpIWlhhWm5wNkFhYUtBa3VRT1JUM3haM2J4TmtP?=
 =?utf-8?B?VHgvb25RRXFjNWN1eHV6QzFMRUt0UEZ1UE5BcWVJNGhsM3RwUC95amlJTkdi?=
 =?utf-8?Q?rwEI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228dd653-a9b3-4b4d-3a00-08dcc5f882c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 17:57:11.7661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEmqxP7HuE1XhQl9bJbF8PwiiGMfrWs4sOkWF3pY/5kKYfJFZkWrUn2EjAa/BYt1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174
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

Am 26.08.24 um 19:01 schrieb Matthew Brost:
> Useful to preallocate dma fence array and then arm in path of reclaim or
> a dma fence.
>
> v2:
>   - s/arm/init (Christian)
>   - Drop !array warn (Christian)
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-fence-array.c | 78 ++++++++++++++++++++++---------
>   include/linux/dma-fence-array.h   |  6 +++
>   2 files changed, 63 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index c74ac197d5fe..0659e6b29b3c 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -144,37 +144,38 @@ const struct dma_fence_ops dma_fence_array_ops = {
>   EXPORT_SYMBOL(dma_fence_array_ops);
>   
>   /**
> - * dma_fence_array_create - Create a custom fence array
> + * dma_fence_array_alloc - Allocate a custom fence array
> + * @num_fences:		[in]	number of fences to add in the array
> + *
> + * Return dma fence array on success, NULL on failure
> + */
> +struct dma_fence_array *dma_fence_array_alloc(int num_fences)
> +{
> +	struct dma_fence_array *array;
> +
> +	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> +}
> +EXPORT_SYMBOL(dma_fence_array_alloc);
> +
> +/**
> + * dma_fence_array_init - Arm a custom fence array
> + * @array:		[in]	dma fence array to arm
>    * @num_fences:		[in]	number of fences to add in the array
>    * @fences:		[in]	array containing the fences
>    * @context:		[in]	fence context to use
>    * @seqno:		[in]	sequence number to use
>    * @signal_on_any:	[in]	signal on any fence in the array
>    *
> - * Allocate a dma_fence_array object and initialize the base fence with
> - * dma_fence_init().
> - * In case of error it returns NULL.
> - *
> - * The caller should allocate the fences array with num_fences size
> - * and fill it with the fences it wants to add to the object. Ownership of this
> - * array is taken and dma_fence_put() is used on each fence on release.
> - *
> - * If @signal_on_any is true the fence array signals if any fence in the array
> - * signals, otherwise it signals when all fences in the array signal.
> + * Implementation of @dma_fence_array_create without allocation. Useful to arm a
> + * preallocated dma fence fence in the path of reclaim or dma fence signaling.
>    */
> -struct dma_fence_array *dma_fence_array_create(int num_fences,
> -					       struct dma_fence **fences,
> -					       u64 context, unsigned seqno,
> -					       bool signal_on_any)
> +void dma_fence_array_init(struct dma_fence_array *array,
> +			  int num_fences, struct dma_fence **fences,
> +			  u64 context, unsigned seqno,
> +			  bool signal_on_any)
>   {
> -	struct dma_fence_array *array;
> -
>   	WARN_ON(!num_fences || !fences);
>   
> -	array = kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> -	if (!array)
> -		return NULL;
> -
>   	array->num_fences = num_fences;
>   
>   	spin_lock_init(&array->lock);
> @@ -200,6 +201,41 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>   	 */
>   	while (num_fences--)
>   		WARN_ON(dma_fence_is_container(fences[num_fences]));
> +}
> +EXPORT_SYMBOL(dma_fence_array_init);
> +
> +/**
> + * dma_fence_array_create - Create a custom fence array
> + * @num_fences:		[in]	number of fences to add in the array
> + * @fences:		[in]	array containing the fences
> + * @context:		[in]	fence context to use
> + * @seqno:		[in]	sequence number to use
> + * @signal_on_any:	[in]	signal on any fence in the array
> + *
> + * Allocate a dma_fence_array object and initialize the base fence with
> + * dma_fence_init().
> + * In case of error it returns NULL.
> + *
> + * The caller should allocate the fences array with num_fences size
> + * and fill it with the fences it wants to add to the object. Ownership of this
> + * array is taken and dma_fence_put() is used on each fence on release.
> + *
> + * If @signal_on_any is true the fence array signals if any fence in the array
> + * signals, otherwise it signals when all fences in the array signal.
> + */
> +struct dma_fence_array *dma_fence_array_create(int num_fences,
> +					       struct dma_fence **fences,
> +					       u64 context, unsigned seqno,
> +					       bool signal_on_any)
> +{
> +	struct dma_fence_array *array;
> +
> +	array = dma_fence_array_alloc(num_fences);
> +	if (!array)
> +		return NULL;
> +
> +	dma_fence_array_init(array, num_fences, fences,
> +			     context, seqno, signal_on_any);
>   
>   	return array;
>   }
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> index 29c5650c1038..079b3dec0a16 100644
> --- a/include/linux/dma-fence-array.h
> +++ b/include/linux/dma-fence-array.h
> @@ -79,6 +79,12 @@ to_dma_fence_array(struct dma_fence *fence)
>   	for (index = 0, fence = dma_fence_array_first(head); fence;	\
>   	     ++(index), fence = dma_fence_array_next(head, index))
>   
> +struct dma_fence_array *dma_fence_array_alloc(int num_fences);
> +void dma_fence_array_init(struct dma_fence_array *array,
> +			  int num_fences, struct dma_fence **fences,
> +			  u64 context, unsigned seqno,
> +			  bool signal_on_any);
> +
>   struct dma_fence_array *dma_fence_array_create(int num_fences,
>   					       struct dma_fence **fences,
>   					       u64 context, unsigned seqno,

