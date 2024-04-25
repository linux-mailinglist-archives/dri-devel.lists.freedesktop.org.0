Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD908B1ACC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E3D11A192;
	Thu, 25 Apr 2024 06:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DfkR8wgi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC5E11A19B;
 Thu, 25 Apr 2024 06:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Swg3Mg5oJ3SOmtCul+lSg3bwMgKsHOVOrtIDAcTESxnvj5Br5IPZxsdZiY/1u0rXBWqNmEpwyErwJL4iyDrR2l+d6di/sse8PF2fTrxK4Giiy4EbouUHhSwl0wK5NILmz2xNPEi1PybdStJ4NWpYCq/tCVh1kApRBaqNWd0FvF6Aox/OXQAbvTphiyTKe8eUF1RjmmO9OCzUhV+9S/Q1wL5e69amWo561ytavW337R3S71H2UTEeCS2kv038hM0uP46VkI8R/PUpG7eGXm/j4X/c+AQBxPzuoNe213904eqgC6rHQbMPDDwGCHOWoloFDI2uNg50VZN7PREyGwki3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xvrb9CDl7kqcVmWe4UtfHsM1tNF2rRbWNyBHDvl9Mvo=;
 b=W+0lk4EU0Kkbp3orn1ntMIKErft2q2KBNtNLJiuAlvulV/pDFh0B5Tq8uS107wZHN/vepy1UrRu+yyPimWI4wqP2u4nEeriVghAeJE9CyPbuILYeBtNylHmH/DT31/27t2zFVnm41x8uzxjShrINscmbDopzF+QC8R6TPqmQhr5ICljyYwCfKHjpfgAByG/aGDcERqwH4LfMaxu9aAgpG24/w/XhytDxhzUR4RtYTG8Kq2RLT3Vi+wmZelGSWfscGu9F+qS/1YacFtsxkGHNXhBxeizBeBpVbJrNe38F3K5TebPM7Bq8smDiW7FA4d+fryW35e8Gi1XOrBsq9PUVSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xvrb9CDl7kqcVmWe4UtfHsM1tNF2rRbWNyBHDvl9Mvo=;
 b=DfkR8wgiG/5bms6eUQKV60okPjCZNX3gj8BsGZoLdiAEFb3sOroOQeZAn3gLeIOkJhVEDwmK5FIN1hExPjav5HuqexQz+tOJ/GKWA50z/W1wuEUBjKQsMKdOxFsHbiZmg/aSfTusvBl4wwI4TTEN/XY9HWARA7hkrreXFGGmId4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 06:18:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:18:44 +0000
Message-ID: <ab9afb74-1490-45b0-9b40-2e46112538e0@amd.com>
Date: Thu, 25 Apr 2024 08:18:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/18] drm/ttm: Add per-BO eviction tracking
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-3-friedrich.vock@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240424165937.54759-3-friedrich.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0326.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: ba88b787-ba89-4e5e-cd3b-08dc64ef8f39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGlheG9Hd0N4OTJJbmdyR0YzeXlIZ3VUcUtPdno1TXdXNWlrQ2lYZC93emF1?=
 =?utf-8?B?VTBoaUFZdDl0YlJyMzFBclA4dStCWjdpakJTUzhockxXOGladTBTbEROem8r?=
 =?utf-8?B?cHI2Q1VQWEZlS20rcnNnWHA1Ty9JU0pTN1kzWGRBbmdSaWJlTTdUMDBIRlI2?=
 =?utf-8?B?dWhHc2VWZU8vaHZtNnoxa3Y3MW5XZUovVytwSUI5Y0NaMm1mT2NGRm54Umdo?=
 =?utf-8?B?YU1oVi9mR1h3Ujd4Rk9kVUUrNDJRellldUY5RlgrcHcxZnl3SXpFOVFqVGJs?=
 =?utf-8?B?dXV1WTF4clJURWgreERBTTg4WnpRbFU0VWg4NUFhWHRnbGY5N25WWWdMM2dT?=
 =?utf-8?B?alRxUklOYzBrVERFT1ZIYVhaakZtcGFxNGJoN3pMVVJDVVFJaUVSc2c4RFFH?=
 =?utf-8?B?M2RqbjlUMTZnRWkxZThxSDNxQ2ltR25NYjZyR0U1Szc3YWhpaVM4QUZYUi9m?=
 =?utf-8?B?dnNEZ041ZzdJeE1MSEFXVTRXTkdMZXp4bTFpYkFzajd3MktCbmMxVi9Nb01l?=
 =?utf-8?B?S2FVMWZRaktRWGcrVU1rNWU4R0xhTzIvdFlDUm93TkFmaDVrU2kycHRJNGNB?=
 =?utf-8?B?bE9JMjl1RWErZVdCb1NqcGlTRFZaNFRRNjBYTlFHOHlBQmZRNC9KM3p4Qm5Y?=
 =?utf-8?B?aFdESldIODNPd2VWaXhyOXZZblFXL1IvTVB6d2hhSUE5UHJJbDhFRDEzbDB0?=
 =?utf-8?B?Ny91TWoveGxNR2FDNTIzQzlNeUNvcVBGY0ZGQjZsbUVIVWx2SE0vQkF6VDZ2?=
 =?utf-8?B?ckJtSlFUT2lMTnRLTFh6ZTRtSWlmL05SeVZKMDFoOXhpY3hUVXVMZE9uWUpW?=
 =?utf-8?B?bU5NdFJDMytUZG1rZ3R3cW9CbGdEZHE2R0svdXlWczZPR3kycElCZDhiNEZV?=
 =?utf-8?B?ZDUxekYvbFk0dG9MaDdLdHRSYWw2bUFTc3dyOGU3YjdzQ1hOc0p2bmh5bzZa?=
 =?utf-8?B?UEpLS1hzMVBLaTg2alFXY09pdGdyNTIrQ0pBdi9Xd2xPQkUrb1Z4NjBWL2Zh?=
 =?utf-8?B?QXFoVHF4M0hOOVAzSVdPdmk5NjBXSTVxZGVCcW5IYzdlSzI2bi9BcGI2Y0or?=
 =?utf-8?B?M2J1aGM1VVAwZGZQZnNHam0yMUQycDlyZFFwL0xHSVFXQWVaeW11RGVWN3JV?=
 =?utf-8?B?R0FrQnZWdncycFEwV1hoREZ1Q3kxa0tGZnI0Q0ZuSEYzYis1LzJKNWNDTGJC?=
 =?utf-8?B?dmNOd2M3R1Q0VEhKWWJkL1dWRGd1aDlmZUVoNUIvZlM5MFVVeWJjVjZyVFh6?=
 =?utf-8?B?dlJNMHBoMTN6Rk44S0ZEQ243VVBqWHFwWWR3MTlxTlhGVEM3c3hPY0dtVXUw?=
 =?utf-8?B?R2ZHd0FaTFVQNmFRK01jT2pXRXRSNlhoc2ZSbm56alk4dVR4amV0NGlEM3lS?=
 =?utf-8?B?b0NDVDZEVkFwQm5TR1hqSVR4L3pqaVhPdHBCaldwcVh5NzFMeHB3dmxSQ25z?=
 =?utf-8?B?eGY1QmdRNndyQm4wT1FjeFZMNVJFNnVTNkVJY0JvM0VsRGljSld1dyt2L09x?=
 =?utf-8?B?eHBQUmpqc2JUbXp0S1R4UTkraG5YVmlUSVgwTDh6bkd6K2RldlMwR0pjZVJY?=
 =?utf-8?B?SmU3N28zZEQwTWk0cVp0WWUxdndBaE1xeDZEekVPMWl6N1FicVg2QmlKUHRz?=
 =?utf-8?B?SE9aRXVHL2VlU2hvR05xcUNwWHNKNVEyTDBMRDZBUGhIU25SclhtV2xsMS9M?=
 =?utf-8?B?dWJpcmtNRXF0VWRPRkxNdEwrdFczYjBVQllGYzdwSHJMdTlwZ0VqYVR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjViakp5ZHM5eWYxRnBESFM5em1nNUswM1NIVHFQM1cycEtDL3NwaE1jc25l?=
 =?utf-8?B?ZVVTcS9haS94QXJxbzRYcGR6UU1rMUpvWU5obFhYQ0R3OXhLSnNQUG1mcks2?=
 =?utf-8?B?UmgzRGkyNzVpRHh2aE9aVnV1S0c1Wk5maFhjQ3FjVnBpZ05DbFRLTDFTMzVQ?=
 =?utf-8?B?WldSck1qSGp3TUZ6K2ZNOGVUTSs5dWc1bDB0RG1DdkwzQmF3bWFUcXIxcmR5?=
 =?utf-8?B?ajYyTlRvWmlITVFLR093UGNtMFNxbUNISGNWMVI0S05HQm9vRWExa2ZrRFBB?=
 =?utf-8?B?SW9aQlRJUjNpV01CUFZUYUgxQjJxeStMV1dISlV6YW9lVHZvcDlWU3hhL1hO?=
 =?utf-8?B?KzdQcjIxeDd0WFhxNkdZWS9BdzA1RHFJNXBRM25IN0xpRjB1WW9DTUlINkhh?=
 =?utf-8?B?ZXlaNUNIdDB2SlRTdUZMTm1ieHlTdkhxcWQxdEJ1dllEVzJJdlpsUTRDSksz?=
 =?utf-8?B?V2ljeStFVmRKZUpVWGpnMmRTQzNXUG9uczZUVmNzaFQzZzhFSzdPdVE2eC9x?=
 =?utf-8?B?TTZ1VFVENkJPYU1XN3hrSUFhR0tiblNlUkRSWGhiNTFWQkMxWkNxVko4K3ps?=
 =?utf-8?B?Q1d3d0tNZThlZURyVGFyMmwreTM0YXVrRnM1eUNnYUpDOU1hdnF6ZnBLNTht?=
 =?utf-8?B?dE41U1dleU83Nldad0hvSXJ3N1lkYmdwU3pqU3dBWVRKWnkwMDkrTVZ2dVFV?=
 =?utf-8?B?TUV5cGpGL2I1SVVtek1od3ZVdm0zZ1UzWGx5WkxrUTN2MDZHZnM1YTVSQ2k3?=
 =?utf-8?B?eS9PQmltVGtMcHNsMWoyTzRnUW1mTWl6aDBVZTliV2lpUHN6NkJZOWRMbUZT?=
 =?utf-8?B?YWtiRnVpVlBsS0xFaW5MRDgzOGgwTm9BUDFDUURFdGVjNUFJdXZuR2hHNXpx?=
 =?utf-8?B?ay9sZy9uRmlmM3BFYStTQ2ltblkwYzVZQlVpdFNZTWEvbUltY1UxTUZMM21N?=
 =?utf-8?B?ZUFpU1R6L241dEN3MElIb2Q4Rm9JR3ZGODg2cjJZUnA5V1R5cFBDekU3R1Zx?=
 =?utf-8?B?RHdHSGJxSndGRmFjaVdLK3JxWDBzc1BuY0x0Zkdzbm8zdENRYkJBVzZZZ3NX?=
 =?utf-8?B?R3VtdVhzUDk5bUFnSjh1MXprSTRJVUU0YTdkQmZRQjdBOWpwTExtVGFGdjdz?=
 =?utf-8?B?TzJLYWdmaVdrVVh4UDBsdnRwTFdCa1lLVEJJZ3I2cEZUSkRVWlJXTjRpL3lY?=
 =?utf-8?B?bEUyVmRnSkxmV0V6YWxqandhUnRKemN2bGNlREJyVlltdWJoTW5wRWV5SFEx?=
 =?utf-8?B?M1psQXh2Um5PaXQ1MGdoQ1FhaVI1aGRHT1RDaFJCREZqWWtsM041Mmhwb1RO?=
 =?utf-8?B?Z0hablZBRXhhdUs5cDhPQWJmTlBtdHQ1R1VqaU0wYmdtWGtrS2ZYZGFMS0wv?=
 =?utf-8?B?VTdoL3N6ZU16aGNqbDVQTDhkNlVrVDdzUVVxZDg0dWs5MVFZVjVqSkZlSmJH?=
 =?utf-8?B?cWxlMUtkZ1FTV3J6emIzOHVzRTVBb21uMEp0ZkJJR2dQZ0U3TVNDKy9nOEp3?=
 =?utf-8?B?NmxMTXc1YjhRNU9pNFQ4NlpmU3phUkovcldaMndJeVgvVER5c3JxQ0dkRldT?=
 =?utf-8?B?MzcrMTk1TXYrUVh4WTZUQ2dDZk81eFl0eXpYbjlHVTc5NlhrNnYxZDhCbUpr?=
 =?utf-8?B?ZlBhbDcwNURWdlhUYzdQdFpxYVg0dmtyNkhnOHlYVjh2aFMva1A3NUhuaFpB?=
 =?utf-8?B?NDV5M0VtdCs1S3cvY3Y0dVd6dGlVc1FmSzZTZTh3aEIybldoSnZhVzJTazdk?=
 =?utf-8?B?aFY2cUgvVXhiRXE5NnRkRWpUelF1NlY2QWRwSXp0T29qTFU0bG44RmkxdEZX?=
 =?utf-8?B?VUpoVlNNb09wT1hQZlVyNkdsM1FWaDN1dnpSMUdBN0FVNE5qMGZmWTIwT011?=
 =?utf-8?B?K0FMRjlnMXRVTkFHRU5Ed0lqdXNlVElTeDgvTWNDU2Flc2o0ZWdMV2NFcW8v?=
 =?utf-8?B?VzFYcFFzM0RvdExDMjU2VW9DTGlnd1VPNTBRS1p2RnFvQXZmVmw1WURTSUYz?=
 =?utf-8?B?NS92TlBHTExYRDNmSVJWTnlwbk9OZmZVTGhiNmIxeFBoMVNqWkNoNmYvQkNw?=
 =?utf-8?B?QzB3Tkp4VjBPdUxwM3Y5aXpWTllESWFHcVo2UzJmZnc1ZHZsdGZNazVNV25l?=
 =?utf-8?Q?ybx6dgdTRbSeuzDkAYxxJToVw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba88b787-ba89-4e5e-cd3b-08dc64ef8f39
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:18:44.3684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbxVzsfV09mz6bjxuLn6NKsEcHd2+1yLDBczdrt1/MDoEOwriQacLlpBpgV+PCH6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597
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

Am 24.04.24 um 18:56 schrieb Friedrich Vock:
> Make each buffer object aware of whether it has been evicted or not.

That reverts some changes we made a couple of years ago.

In general the idea is that eviction isn't something we need to reverse 
in TTM.

Rather the driver gives the desired placement.

Regards,
Christian.

>
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c |  1 +
>   include/drm/ttm/ttm_bo.h     | 11 +++++++++++
>   2 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index edf10618fe2b2..3968b17453569 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -980,6 +980,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>   	bo->pin_count = 0;
>   	bo->sg = sg;
>   	bo->bulk_move = NULL;
> +	bo->evicted_type = TTM_NUM_MEM_TYPES;
>   	if (resv)
>   		bo->base.resv = resv;
>   	else
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 0223a41a64b24..8a1a29c6fbc50 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -121,6 +121,17 @@ struct ttm_buffer_object {
>   	unsigned priority;
>   	unsigned pin_count;
>
> +	/**
> +	 * @evicted_type: Memory type this BO was evicted from, if any.
> +	 * TTM_NUM_MEM_TYPES if this BO was not evicted.
> +	 */
> +	int evicted_type;
> +	/**
> +	 * @evicted: Entry in the evicted list for the resource manager
> +	 * this BO was evicted from.
> +	 */
> +	struct list_head evicted;
> +
>   	/**
>   	 * @delayed_delete: Work item used when we can't delete the BO
>   	 * immediately
> --
> 2.44.0
>

