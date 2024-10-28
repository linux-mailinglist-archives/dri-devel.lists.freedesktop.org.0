Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CBB9B3398
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 15:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3465810E4C7;
	Mon, 28 Oct 2024 14:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LXtzOl9u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2075.outbound.protection.outlook.com [40.107.212.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835CB10E4C7;
 Mon, 28 Oct 2024 14:33:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXsHl6kHEzR4ZZnPPtzw5oTCSMp9Pymp3o0hnzpl9G2fXtAoFPRxkxyn1jpDVBEZSqtFRRktUQHv/GUI1CQ8mDPM9SdZkJdq9JKVC5KhivEZqEoViC0szOhPMQYZKhn9auXazlhVnglGatrSL1zsrOCL2gjx9hoHd8E1q1jFOrF3WGwwqdZgUedyZY/fQju7BliL2wavN5ShMa/iEYpaiZjb9He+XDsBNmN2VAgrdp0OJIOgRPN6Q8zQ5eN3wjXRN5fhwNHadvocs6AcJ7fKy9fS5grkJ8HQb54TxAFFRoTiTE4NJ090Q1133AIP4nuXNh5Ar9bvXWXv0WD8XehXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRoizzqwSacz/ooX7BhE6ggbP6TeVDBjpLWiO0epYF0=;
 b=WOsqpauaJpzoOQhIDqOkxYA5lGk6jDclVZjeIsDNQiZ6y04Os3hASu3K8WbruK+btn076W+az5NYhHV5Ojxty4W9/zJ90H6BzvYm6XiBK1SFIk4ceocbyoxSO/XfUq31kucdt3GSvWLIGSQ2OtsmDhoXmcr0IWDuHlJBUlLjlbTUqUnKuKmcaHM5/ApXjpzY4YE1kQrexgJH9B6ch6vg4/gX8II/1tEyvALNlIuBAxa9HZ6+C+Mu5sVzFdP1fuiBw+7fXt7G+msdVm2jfYkJ1HgUyKl93Al3AfZ9CEozJToaTAHejNqSneUtA5AdvIiTb7yimRSVdiUjTwk5u67iaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRoizzqwSacz/ooX7BhE6ggbP6TeVDBjpLWiO0epYF0=;
 b=LXtzOl9uUn0kzHcJJWe4gw8AMTtYsBsuOmIAb2GJe6t2D7ev8Ai7ouDmjs2Iy25XsDmuHxHDxDXO9kMmI7HqSXn+lfHdPptg7C5+HbGL5l7MeUiUj2k5ExdJdGghjVIJKsBpE205UJ8zd1PQBRwlMQOXtgx2JrnPOdHluTTT89I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 SJ1PR12MB6172.namprd12.prod.outlook.com (2603:10b6:a03:459::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 14:33:43 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%5]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 14:33:43 +0000
Message-ID: <de0e660b-395f-4a26-8bbc-199df83a90b4@amd.com>
Date: Mon, 28 Oct 2024 20:03:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fix possible NULL pointer dereference
To: Li Huafei <lihuafei1@huawei.com>, alexander.deucher@amd.com
Cc: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Hawking.Zhang@amd.com, yifan1.zhang@amd.com,
 Likun.Gao@amd.com, Tim.Huang@amd.com, pratap.nirujogi@amd.com,
 victorchengchi.lu@amd.com, Jun.Ma2@amd.com, le.ma@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241028215933.2599271-1-lihuafei1@huawei.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20241028215933.2599271-1-lihuafei1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::30) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|SJ1PR12MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: e35ab181-874a-4601-1022-08dcf75d8598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0tJQXRBY1NDOVlVbTJNdTl2dUtKcmE4Z1RvYU1sWkhWSGk3cHVNWVk5Q1Yw?=
 =?utf-8?B?clBTVEJKbzFTdDlnbkNoL3BPVWFKbFloL20xd1BsWXdQemF0Y1JWTUU0K09I?=
 =?utf-8?B?clZ6S2pqYVhVUzFKNmNnaGRxU3BxL1hFU1gya3Q5Um1QT0Q1ajJlVE9yclhu?=
 =?utf-8?B?ZURmOWZIM1JGdWVUQ2cva1c0S29oNmxaUEppalM3THFoTG1hWDg2dHZWVVhS?=
 =?utf-8?B?REMwQWdtdCtQczJNWnZaMmZacFBGVzZUSmJhZy9qZlBMSWJ2NVROUDBIZVJ2?=
 =?utf-8?B?Y2h0QzlwNUk1VEF6cDR3V3Zob05KYytHVGxQSC9FbnorQWlrR05oczdaZ1ZN?=
 =?utf-8?B?MU9kVmlhemVWWk0yR3ZhZzQ0MUdGU2c5N0RRSHJxdithVUVlRWdDNkk3NmlJ?=
 =?utf-8?B?QUE1SnhwUjgwaDk1RmdRTHpOa2ltV0ZOQTVWVGZIbk9qSnNxcktFMTVXZEd3?=
 =?utf-8?B?Zm8rTlBEKzhtQk1rYVI1SjVveGFSa2xDOUZEUFhkTThkVjFCWll5dGlNRHlk?=
 =?utf-8?B?Y2QwVW9NWGhQam1NdEpmRElIQlUyU1JzaVRHM0NvK256dTU3U1NUNTNEMXlV?=
 =?utf-8?B?ZmtZL0luckJHbmZBck90YUFYMEtmMU53VEdNS29iNElXVFpzNG9pWlJzVDRh?=
 =?utf-8?B?enlxMnV2dWFJekhHQ0ZjTWE5WWhTenhXdUNuMCtOdW56NnlSVzlCMVZGSG1y?=
 =?utf-8?B?WXAvVGhmdWo0eGlNc01iVjMzdWtYY0JpK0xHM29mcy9FTGp5L2M5VXhOVCsy?=
 =?utf-8?B?THpxaFo4N0pRS2wxbVJBdzBhRkZxWkJBanQyV1YyTHN2anovRjhpQzlsZVlZ?=
 =?utf-8?B?OHFRSVdNTTNqckg2M1R5YXJ0cDNaTlprRmQ1RUVYTWdLYXZ1cHpMdDc3RFZw?=
 =?utf-8?B?Q3N5UnRqU0lReXJ3SzZWcFZ4UXRCY2hhejM3YStvOXNHdkxLK0ovbHlCNnJU?=
 =?utf-8?B?bWxTZmoyYzRCUWhqTHI3Q3NLSGF2dk5Qb3JoK1pzR0pnTVFaTlpkQWlzcHEx?=
 =?utf-8?B?b1lqN2tmVmxYdWppNXRRVkp5S0JFVHpwU3krUzdtSVNTTlNTbnRaaTZLaE5Q?=
 =?utf-8?B?T1YvQm9RZFA5Z1JnOW4xbmxJbFhTWURxR2NMakRBR1BTdi81ZDZxcUIrY3Jv?=
 =?utf-8?B?cStkS3UyWTFTVmZNMkR4R0NUSFFVVklnWjhKNkV4LzhGZzd3NmJzVE1td0xS?=
 =?utf-8?B?eEYvNm0wOW5NbzZUNTRCNEVPcllqYVZUb3dLamF4QmhEL3BEdEF6Q1VvSGJV?=
 =?utf-8?B?eWZFS0IxanBVM2xncHBMSFp1UjA4UHliZ0dBV1ZlVFRpdGN4NUNqS0xIQzQw?=
 =?utf-8?B?Zm1odUZiRFB5QitwbnB1Nno4VzVSRCtWcEJ1VWVmWG56cHJuSjh4bTdXaXJt?=
 =?utf-8?B?a281cTNobklxbmp4S3hCQlZTcjRmUk55RENKb3J3bGkreVJTVlVQSlFLUVpP?=
 =?utf-8?B?NXdmN0NNS2tyUDdscC9VbVprRHlnU2pKem5WNWp1MFVBODFPc2VFeUgyM2Q0?=
 =?utf-8?B?L3hOOEpwVURjVW9nZTFJOXlzbDdsVXM1TE1MV2NzVFpSeEExUkM1clBjK2N1?=
 =?utf-8?B?T0tPcjVmTG1HNGxTanh1QitOMy83Z3h1VUhPcHc2Y2hwc0FFOHJuemQ0cU5B?=
 =?utf-8?B?dnFHczUrYjlOK3M2NUpqVHBqWkVhODBza2hPU0lxajJDbTkrUThTT2RPMGpC?=
 =?utf-8?B?eElDR1RhQis1bmplNUx5WWk2dkc4NjhxMUNDU1k1MzJha0J6MzZEWTBTS1Bw?=
 =?utf-8?Q?93maQ7z3z8dvpu2aBiaoAbxDrPW7wj9JwzyyyE7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L25hMnhLZXhnd2lxS1UrTlNIbHJtajFnbGk1UzFVZVA0STMyd3U4d2pNNHRW?=
 =?utf-8?B?ZGRZbHROSmptTU5KTWR0OWpFT0x3TFp3K1pWTzlaZ2xZeG8yYmRhUFdYUTY1?=
 =?utf-8?B?OUtPL0pwRGpScTNvQkxWakE3aE92NitVQjdXSldua05nSjFCZ0tRa0UySWw2?=
 =?utf-8?B?ZHB0RC9GVDR3R2p0eHhNRkVvVnZINkxFeXFIQzlEZWVYZDBoT21oQ25OWnEx?=
 =?utf-8?B?SmtZZXVSSnlKNm1xSUZmSXppb3RFZDdvTXJwemgxSWNyak1RdlpRRmZja2Jo?=
 =?utf-8?B?dHJWbHM0QXVWd0lUQmd5SFBtc2JKUVNycVhSQ3JWUDVaeXZ0dmlsWkZJRERV?=
 =?utf-8?B?RlRFS2hiSjZUS3JKYnpCYWl6bGVOMG5xaUREdFZuMWRRY2JPampzWFk4azNT?=
 =?utf-8?B?eXpPV0kyN3BoRFM5OStpdU41ZmNISE1wakxoaVhrdHZ0eTFlT1NlK09xWlFL?=
 =?utf-8?B?WFBUVlAwQ2Nzb29nVURIYjczTUkyL0I5eXZVK21PUUE5Rk5nVHg1THY0RkV0?=
 =?utf-8?B?OWVIazJqSGtQWmZZWHlyS09WUmM3RWRjMW42Wk4yZ1BNMmJTaE1uZjlsV2ts?=
 =?utf-8?B?b3h5YXVwalR1MExJZ2I5cXpCYzJqQzJ6clBhWE04b1JESVhPT1lCMXQxa3FB?=
 =?utf-8?B?MFFZYnV2amJBM1NaUyt2c3JxY2dzZ2NMcS9BNDlNTEd1a3E1UkI1bGVnN3l6?=
 =?utf-8?B?b0cvd0EwdzhMYnpQTlJmeTlWZ2RoaGIwK3o4bGFyZUxGd0trbUJIYTcyWlhw?=
 =?utf-8?B?SmxlK0tyMTNTYTNGNHF2dW9wbzN2K0puS0hDV0NqTWJZME1BdGZSVWJWOFZD?=
 =?utf-8?B?V1VnVExPSWo4aWs4eHpucXBnZ1hWTTA2M0lKVXF5V0V3M1I4R2JqSU1DcWhE?=
 =?utf-8?B?MHlsZFRreWllUFVlWTl4U0h2cSt5Q09aQXRMbXh5THJNWCtNT0lyYkwyRWNK?=
 =?utf-8?B?SXlzUWxLS1FuWnUxRVpEc0hZQ1lDOXl0NDNqeU5TWlkyOXlsK1o4WC84Mkhi?=
 =?utf-8?B?N1ZTanhVZ3ZjNWlIcFROS3ZhRDVySUk5dFhBaVVrYUlnWUF1YnZjYWxET25k?=
 =?utf-8?B?eFRJNzdaNmVHQ3RrcytiMitGY1hSWWk0TjJkTkRVbWhJVjMrdU5ZUFlVNmlQ?=
 =?utf-8?B?ZUpCK1hHWjRWZGNJeXBQS0ZDMTVTb1JPMjZMb2V6YzVYUG9nZXlsMzhJZlV6?=
 =?utf-8?B?QnZNL3NzOHFRRUFnVko2UFlHaURFVnNvMVd5ZHBVdlVUY2pkbjRDdCtZTUdn?=
 =?utf-8?B?TjhJc3dzVXo1V0Nva1loaEpjVkFvVUZBTjlpd2NaSmpQaUZ0SWNEbnZ1M1ZJ?=
 =?utf-8?B?SXpQeEthaSt0UDhKVkVEWDZGNUg0QXZmOFdIcUVIR2ZxYlo3MGtVK3doYlNz?=
 =?utf-8?B?VmJnZnk4M2hSeTh1b2tVMENKTU5UcG90T1E5cFVTak1IR1A2Z3Rnc2wrVk1l?=
 =?utf-8?B?cU9Hc1hlbFZJdFl2RWw4S0QzK2wyUCtYS0R0emNqRHdjK1htcG5Edkx0U2E2?=
 =?utf-8?B?aENmRHRZSDhNd2RqV2VscmY1QnRkM1dIam9iL00wa21mQ0JzelNGUjYxV0c1?=
 =?utf-8?B?cm5xd3lZK1FpVHZJemRVUTZ6dGdrZGtsY2JKYVloa2Ixc2RkS1FvKzZvTHlO?=
 =?utf-8?B?ZGFhb3lVbDdRMEMxdmQ0SGU5ZkhaMHNBcjBmdXRjbXc1eFA1eDZEaDdpeHlo?=
 =?utf-8?B?cjJDOUlmWlloR1l2YUtLc3FtUVFlbGhrU3gyaG5ySFVGdU9RTkhndmpsVTha?=
 =?utf-8?B?eTRYYnQydlc3MFYvNlJkeTBpYmtBc0s4cmZyNFQ4UHUzcS9QNHRUUmxEOGs3?=
 =?utf-8?B?RXVTL283MHdrUDl3TzExMnpoRXZvbStnSFl4djJzaXpJVmVTNzFuQlNScE1W?=
 =?utf-8?B?TGcwRkp3SFhNZGVLbDMrTU10azA5aWNxd1JJTkx0UVE5WFBpTzVqUmt1a3I5?=
 =?utf-8?B?dDd2RzlWdjhkNHZoQmgvQ3hYbVlTRzRrcERvb0NuZGJPRGFmSWorMGRGYnF1?=
 =?utf-8?B?OTJMVkhNeVJWY0d0Q2RRNjJBTnBLMTV3NHFYRzRGU1pWY0ZSTHdRN1lraGhC?=
 =?utf-8?B?R09tRDRIeUxIdk56cWJ0OUM3NXF1TmtJbzV2bEc1REllaFBNaS8yT0RqdGJu?=
 =?utf-8?Q?0gP1QHCSRrdPBSRCF1COTi/V2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e35ab181-874a-4601-1022-08dcf75d8598
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 14:33:42.9403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZU0o5PaSrxbNb7yhXGRVleS498NTYrL4QHo049qYWYYE9bfUs9TZVGBspRYSkggG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6172
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



On 10/29/2024 3:29 AM, Li Huafei wrote:
> Fix the potential NULL pointer dereference on mem_ranges in
> amdgpu_discovery_get_nps_info(). Additionally, assign the output
> parameters nps_type and range_cnt after the kvzalloc() call to prevent
> modifying the output parameters in case of an error return.
> 
> Fixes: b194d21b9bcc ("drm/amdgpu: Use NPS ranges from discovery table")
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index 4bd61c169ca8..1b1aedebb3c2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -1757,11 +1757,13 @@ int amdgpu_discovery_get_nps_info(struct amdgpu_device *adev,
>  
>  	switch (le16_to_cpu(nps_info->v1.header.version_major)) {
>  	case 1:
> -		*nps_type = nps_info->v1.nps_type;
> -		*range_cnt = nps_info->v1.count;

This one is used in the allocation call below. If you prefer to not
assign any of the out params before memory allocation is successful,
then use nps_info->v1.count in the alloc call.

Thanks for adding the alloc fail check.

Thanks,
Lijo
>  		mem_ranges = kvzalloc(
>  			*range_cnt * sizeof(struct amdgpu_gmc_memrange),
>  			GFP_KERNEL);
> +		if (!mem_ranges)
> +			return -ENOMEM;
> +		*nps_type = nps_info->v1.nps_type;
> +		*range_cnt = nps_info->v1.count;
>  		for (i = 0; i < *range_cnt; i++) {
>  			mem_ranges[i].base_address =
>  				nps_info->v1.instance_info[i].base_address;
