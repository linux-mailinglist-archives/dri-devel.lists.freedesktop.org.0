Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBCFA706F6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 17:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF4310E5BA;
	Tue, 25 Mar 2025 16:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pwJo8z1w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA1310E5BA;
 Tue, 25 Mar 2025 16:33:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYUAHJgIhmjzc/XiZuL7/DZgvml3tHjOjCfeetETFB9ExNM+kv0kkzfW3ni83IHC1ULnIF590Y6Emlfrr4hS58Zy62imxFbsGCzeMkAqraQKeNDoebmD41C8IQGnLTByQRk/i9kKSmYCtRTwIeqcAAMkkAImfDBM41mqd6KLX0yJ3wIuc3dQrHeQlz75LqLTXpnwB3VYuJB5nCkfMeB3L0R0hxuQAeU+SbHgfDrbUYiJm5KorxdhDxdPnXb/rLY7k9Yn7+ZDGWwI9+nbZsUS9UxPrlTheKBZZzi9Qsw3pBHid2FwKCaNhphpRl6LcPug/W7BUBmDKV5Aw5Z/gXR9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpxefshrOrCvYLegpneQuthm5fx4lOEHCPtkJTWIv9M=;
 b=DNakEjU/V59bso77csHXwIucWwp8EVG3FwYxNucuHPo51KVlKswh0WzAW3tQAB+s0gLUcT+8IhXKt7+uOTJc9WHixuBtHUfl1x8hvLojQ+2pr+ySvbp4Q58rHdmqInYou2o2rw5IMwbpt7hQkjWHsavdA8ZatTtz1zkBclwQF2U0/uY3/kBziJ8QfmV217jf/rxSq3x59ruUppauGPbGuaBCw/u1lWM4SJ0/+ThHWZDl625PtV3EBicuJGkZQO5SStC/YSBbghZZsuRm6z9yexo20ZMjKOYVWzzQYtUAhQZbf7l+ObiFcSXG2NbGggQbLzPG7LoANEdnVfvGQOOYRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpxefshrOrCvYLegpneQuthm5fx4lOEHCPtkJTWIv9M=;
 b=pwJo8z1wEjgYzVRCTJhbfVGXgy+tXw/cfndc8rhSO2UTuxe60RGKaTPi3QPi8+sAYhwpVeJ7FCksUsrYbg4xd5ov6TfQAbco45V4YsiahOhtXK33DWbNnneQ0cU8CTEtRMg4Lstqy08grZKRDZTynOakFShlU6imea3qlsNpVSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 16:33:07 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 16:33:07 +0000
Message-ID: <cd965916-b1cb-4911-ba66-155e9eba0234@amd.com>
Date: Tue, 25 Mar 2025 09:32:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: Remove the redundant NULL check for the
 'svms' object
To: =?UTF-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
References: <20250325100908.68325-1-a.vatoropin@crpt.ru>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20250325100908.68325-1-a.vatoropin@crpt.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CP6P284CA0092.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:1a8::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: b687a155-3f8d-41fe-dcd5-08dd6bbab8f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlYrVXFmSmxyb1pVM3RVN2VILzNackMrVEp4QTRLZUsvOWNQMEgvOS9GS0xR?=
 =?utf-8?B?NGZhZzhmSmZWb0NYZk1vYjlSaFZsbEd3bSsrZVRoQllERTRIRWw4Q1VKSkk5?=
 =?utf-8?B?M2xVTStnbWFSYitOR3RNZVRVZndHY2pQOXdEUHZaSGFWcUErQml3Ny9aT0dZ?=
 =?utf-8?B?WGNmQ2t2MDBORGNLaVdBb0NuRlpEVEw5Z3N6dEFRUk9WZWpqUDhxbnBMQXZQ?=
 =?utf-8?B?Ui9iZ2JYQldRb1EwTVdKRFQ2NU5uVnhJa3NxVHhNRkVxQXphN2ZIZDZTK2Ro?=
 =?utf-8?B?WVNnOVhTNDRXS0tjelFmMTU4RHozcXA4UDhxd1FLMk5lR3kwNmtVMWxyTnhs?=
 =?utf-8?B?Vi9aN2dEY0Ftc1RBWm9TTnhEZnVLeXp2VGthUmVmRzg5OGhWQU4zaCtLeHZp?=
 =?utf-8?B?TS8yTmp2YmlBc0hDTHFaM2EwSXJpZFJTM0N5ODRqa1lPV3M3L3NEc2tVV2VU?=
 =?utf-8?B?UENxTThnUGZrTlRkWXg0bDhBQlNWVHc2QzUxMG0yeEN1VHU1UDVrcW5ORkZQ?=
 =?utf-8?B?TEhQRGFXUUhTZWxFZkRkcFJ5ZnV4bVZYSWdDTjZ4a3pmQ0RLdTlDV0VVM0Z1?=
 =?utf-8?B?M1pRc1hRYzY3ajc0S2pNd2FqZ0g4elRac1NpWDFITFR0d05kWXdLOWplOENu?=
 =?utf-8?B?bWlEbmZ2YzdCNVpTVDFiRWphSVlzbWlhKzM2d2F4andxOFg5MENjamFXM0pR?=
 =?utf-8?B?UytDdHF1ZVVtdHFjOUZ2VzZPUmlqTVFNcktUNlYwaXh1bVU5NDZta1Q5aFdu?=
 =?utf-8?B?UGF3RDNHZnpiQXhrdXV1Nm1yTTBiQTVpNThrU3BQVzJVZnJnVHViVVpnOHo1?=
 =?utf-8?B?ZXhjK2JOdTVUdWtQUUc2c3pRdUdRSGxvZk9xeW1DWU43RTVXWU1BZURCRmZL?=
 =?utf-8?B?ZUw0eWRENkZ6Ym92Z0pKeEpSS1M5a0ZXY0N4RUZnaEQ5ZFhHMWsrQkFTazRl?=
 =?utf-8?B?M2ZQTzExK3lkTVVLeVhWalgvOXVVbDF5bmVKZVI5ajN1VGlobGl3enovVVYw?=
 =?utf-8?B?TVJQai9xZFVaalhOdWgvWG14UzhkQWt6bE9SZ0xaUVRRd09yNWlPZXRjNVJP?=
 =?utf-8?B?VVQ3dnFNOXBQVkIwcDY4RFR3MWx3ekVBaUhlYWxZRmxYeHFtckRHNk5HbDUx?=
 =?utf-8?B?aUY1M0pjRG43cGNCckdVcDd5WE5MMGUya0dtbXo2RnFNUEVhdFQ3NjlPRk1N?=
 =?utf-8?B?aTdRbU01dlljVGlpWCtCUmtwVnFpQ3JFaVBhd2x6RWtxeHU2OHVobnFpa0Qv?=
 =?utf-8?B?UVpxZ3hUNkhWS3U4NG80Vm81UndxYjlMUjVGUTlaTXNMbWVpNjlsa2xDMVhr?=
 =?utf-8?B?a0I4ZmpUNHRUZXVnd3NpVjRmSUJvZTZ6U2xuSWloYzcwKy9pQ3hYL24vczd4?=
 =?utf-8?B?UVZWUGdZTzdwU1h3eElSMFROMURpTWZpR3dxeVpxYjBaVlp5NS9oa3VnSEpk?=
 =?utf-8?B?am1iaXJOQTBQZ1c0a1NGdHBYL2lqaFBuWHlrWnk0T2ZTdHFIMjJTUVZhR2hm?=
 =?utf-8?B?RCtWZmx1TTEvd0JmVTh2YnNvNEJOdEkyeEdYUGtxUmNMOE45WTkxV05FRk9W?=
 =?utf-8?B?Snh3blNVRnJZTk13VzFaR3YvMDdFWEthQlo4MW9WUHRNcTk3WllKbnJGbzN1?=
 =?utf-8?B?V1ZHWnBGTFkwVGsxa1dhTzN1U0pvMXphSzZhZm5RTHJPcHN1eEI5NUhXZ0tU?=
 =?utf-8?B?Rk9HNzdtYXpPcW9LdjVLUFozSkpoVkFCblpOR1RvSEs3YnpObUprL1ZkRmRj?=
 =?utf-8?B?WUl1aXJNWm80aVhBK3BYQjNBamVJRVFhYWhScTlmTGJZMUF1b2pKbHJ2eDdM?=
 =?utf-8?B?eGN3RlpjdldUWW01dmMzL2RhRTJkOXQ0d0wvWGYzZDZiMHZIUlBZTWJ3dXhp?=
 =?utf-8?Q?LoZpCms64aRVG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXplb0VhemtGaU15cHNlMjBVeWtNR2VXSUlEaExpUUpTQkhqaGNVazhSaE1B?=
 =?utf-8?B?UVo4R3U1NEpuVVZDS1MyNmZQYnZJRTRnRXlqY3hDL1RDZmIzOGp6cm5BM3Jt?=
 =?utf-8?B?K01DY3k2QXNmL3U2NTFEejNSbkx2SGNxR0tRK3dRT0wrY3ZzOHUzTUorWU11?=
 =?utf-8?B?UVpkUFdiOTZlY1NGVHY5ck9udDhIWGNRRG1hUDdwRXZlb1N5WElDTDFGTkhP?=
 =?utf-8?B?bHBMUGRYQVVJOWZrZlk5K2VmcWNCQTIvUCtybkZRd1VOaGpBbS91SEJqY2wv?=
 =?utf-8?B?YXVZQ1VIWUJleTNqd0p3elEybys1TE5TSFpubGFMQk9vemRBb25IbDZudXBR?=
 =?utf-8?B?WG1HbDZESjlJd3A2SnUxUWlnblJ1VmFETlhZNmo4RlZzcmlKTlA5N09pVG9h?=
 =?utf-8?B?T1k2aW51Ym9BTXFLaERiOENOc0twYWcxQmcybytnbFlEdmZFTjVKdzlBL0tl?=
 =?utf-8?B?d1d4TWY4cElrbFdvRU1nNUdDVGgzK1AxOXFteXFOdWt6dGhGQitnREpjR2tk?=
 =?utf-8?B?VUFueitlRGllSUVieUNROEIxOEYwOWxkN2Rwak5WSktBbWsydmpaT25mb1ha?=
 =?utf-8?B?aTJianNLL3FWUVFia2hHc05GL3V2RHV5cFlNWHNYMnJmSUxuZEg0Z1dXWDAr?=
 =?utf-8?B?R3o0d2xselpEdHE4Tkp0UFp3dDJvQndqQVBGQ1poKzNLWmlteE9nVXJHM1Rh?=
 =?utf-8?B?enAxY0tHcmp1d202QXMwNm1OM1RvWVhKeityaHJQeUdoUzAweXhjMVNvZGFv?=
 =?utf-8?B?ZzZUcnJlN1p0ZXZJQ3JIOUZUbzRCbStnK0JWWUljSnNxQlRVSHhZcDZFeS82?=
 =?utf-8?B?bFdZbEpGSGdodXI3UWp6YzQ4SDJ0VmRuQ2FLSEhINCs2VWZSS0hMQ2J0UUc1?=
 =?utf-8?B?aW5OS3cvTUc5eFo4VnVZRllQV1E5eWdkcTFsL1NWRzd6ODJNSTNGUVEwRllT?=
 =?utf-8?B?M0lGUE0xTnJ2aGJmMnhBQkRHZ3pkL283aG85MGRUWVIzQ2ppY0EyOVZocVZ2?=
 =?utf-8?B?RXFCVHlnQXJnd2NRWnYxL0dUSlR4eFNNRkhWQ2RvYldNRGJ5Uk5ibkpVWUFW?=
 =?utf-8?B?STRTLzBsRGk0SnFyM0pBNlgzMGVrRG5ERG1MWlRmKzMyNkR0NjJTcmJMbVg4?=
 =?utf-8?B?Q1d6ajVZb0RyTFR5LzlmMS9DTmRFREVuTHZPZExUL0JEaE1ydWZ2elMyVXhj?=
 =?utf-8?B?RXdudnFFbzNKcTV0R2FqcnZGZ1FBSG1JaWZHUTU0S09OT0txUmlHSXh3MGJi?=
 =?utf-8?B?NG00dVF1OTdKV203NUVvTGpGK2Ewa2wrcWJiUUxoUzJjUE5RRWI1YTV0ZjN0?=
 =?utf-8?B?MGwrdXdkQUNoK2VaUDhjYjlxZW91SGcvVXI5eU9xcXQrOFJKL2VZNFlVc0Zi?=
 =?utf-8?B?OGdOMlBOd3BlK1ZscS9CSm9MN0NGM1BVOHNSSnoyaFZFUnR5Z09Od3ArNm1a?=
 =?utf-8?B?VnFXamx1bEhRZDIrUW9RZzZGUndGS2s3UDRNWmpFaXMrVGR2blBXTVhTRkl2?=
 =?utf-8?B?UlhwRmswakJFTzNUQzBScnZGZ3hvMTRnaitqNFZjN2NOVzQzTzlyV3pVYnph?=
 =?utf-8?B?WDJjMjFLT0pFeEwwUXVvOGlTRkZkZVlxU3VVNEZxMGp5YlpSLzA3cFpuMVlK?=
 =?utf-8?B?TksrSXNmSkpSOXpvUVNCVGVKLzQ4Nll0OGJ1ZWU5cjBSVHRhaURMOVpiOXB5?=
 =?utf-8?B?RW9OcGZqU2JWbVcxS21QRDNXQ3cvU3NzY2U1SnBPZFZyaHZmNVJGR2hudVZu?=
 =?utf-8?B?UUNueXIvajhjNkNxUVR6M2k1bXZEaWg0WUhYUUpjWFlidTVvTm9QQVBNK09t?=
 =?utf-8?B?c3FZazRXZWZFRmp0SUZFT2tNN2ZNUEhVY012amJCWjN4QkhYNzlEV2lnQjhX?=
 =?utf-8?B?M0VKUUdWNDZDQ0hyejBNcytKcExYaGNLNmVHRnJJS1hHSVVYRmNqTlpSUDdU?=
 =?utf-8?B?NmZuSTFEM3RTTHZEa1ByTXNMRUFFZnhmMjNFaU43QUdnYVZYOWRacWZIOUNx?=
 =?utf-8?B?K0N0Q244R2luYlVoLzU5OFZ5ZmJURUpBeDZHNy9qV0ZtVTE1Nmh6SmJnb0gv?=
 =?utf-8?B?alg2QWZUNitjWnQ4WnE5dW9uUEJrSEYwUGNCcWRBaDZ2TktpcGxqNnY2MXVs?=
 =?utf-8?Q?8qp8TB5vuUXTnqaVK/L23Wb91?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b687a155-3f8d-41fe-dcd5-08dd6bbab8f4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 16:33:07.0604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cK6yfeS8YCuxfNkno3xJRQIHGt6hZRo7xXRHsLWa75LExIKcndYSZbKgcbqRHufsTF/6by8F7ICYw2H8IY7q2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779
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

On 2025-03-25 3:09, Ваторопин Андрей wrote:
> From: Andrey Vatoropin <a.vatoropin@crpt.ru>
>
> Static analysis shows that pointer "svms" cannot be NULL because it points
> to the object "struct svm_range_list".
>
> Remove the extra NULL check. It is meaningless and harms the readability
> of the code.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index bd3e20d981e0..9f0c6b623176 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -4089,8 +4089,6 @@ int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
>  	*svm_priv_data_size = 0;
>  
>  	svms = &p->svms;
> -	if (!svms)
> -		return -EINVAL;

Thank you, I agree with the patch. You could improve it further, though. This was the only way this function could fail. Therefore you could make this function a void function and remove the error handling in the caller.

Regards,
  Felix


>  
>  	mutex_lock(&svms->lock);
>  	list_for_each_entry(prange, &svms->list, list) {
> @@ -4149,8 +4147,6 @@ int kfd_criu_checkpoint_svm(struct kfd_process *p,
>  	struct mm_struct *mm;
>  
>  	svms = &p->svms;
> -	if (!svms)
> -		return -EINVAL;
>  
>  	mm = get_task_mm(p->lead_thread);
>  	if (!mm) {
