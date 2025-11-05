Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EB2C34895
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC2710E6DB;
	Wed,  5 Nov 2025 08:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WInsO0RL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012026.outbound.protection.outlook.com [52.101.53.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168CB10E6D9;
 Wed,  5 Nov 2025 08:45:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcmMMs6oAyxo4ZuBuH0U5MrqQa3a4Wj/+z+/JmhQbup5t1+gmYJuCTxiAlfsUgD3ijzC3Ik8g50L3nVLRVJLMvGozTu4G4pXO1Cka5MoRu+4h5LZj2n/ArxF1SApEidAJNSdPX+ZR5mdGZDzoTU48rgRg1WY3PiBtFy48x/JPajEwgQ79EfeiUke8Owr9xZdls2mpEBCavqVgPn+yjSC70NpJw6CCdLEbi6hcM8tPcRrFrt9U8FCHvOaUnATut38Yzcp3hChb1rrcAh1qDKHWf5x/xWMGiEb9CRtzwEnjONHpKmWOc4lRXPmL+BmUrn5SI3A+Nort1BXlQXionngUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQHTZqB++zDM1iMmmc1lJSO0rLRBW0iQ8x5e7gAT9NM=;
 b=p1MLR7hoxbvhvVHt92zcQvxCbQ4GwH9RpvAirWNamBURKi8psSXV91SEfDT4fZWrcpzntzmJgmGrRdH7xjZYRugc4+DdgKT2QsUDofILOhWc5Mrh0j433/JTWzTTPgPY39xOkQjPuFRFSANXfTO1uPjceHdFrnpbI63hsgcYIsWSXDLxULxTuj2aIuVNAYoG8RzDZXnO/rmwWxad66/PoxpeDWcg2k9DPCgtB8Rcol++327ffWamJjqlrZ3a7zv30/HLTruqY86SajFc4RUcyApMzDZXgH7GhLKU4G5x2vINk/1E5nMhDloo3FBK2H6/XYOhGtfxSnI9y00HsyGbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQHTZqB++zDM1iMmmc1lJSO0rLRBW0iQ8x5e7gAT9NM=;
 b=WInsO0RLmKqm7XnuhqlMXxpQdO/tqwxxFygnGEwNnlUsRQwTo4KAuNaSFcyYzTskXwtL+bKbPqgIT+WSczQMZAIvg3i8MIDLA1qPsUls29w4djhkXRGHd6Cqm9IjUA+Vx+vVGD4tMrJbjpqN3HBBGazGcRzec4AD94gv+7KJfbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7538.namprd12.prod.outlook.com (2603:10b6:930:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 08:45:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 08:45:31 +0000
Message-ID: <09081174-2bd0-461e-bae4-642b2cfa3c44@amd.com>
Date: Wed, 5 Nov 2025 09:45:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/20] drm/amdgpu: give ttm entities access to all the
 sdma scheds
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-17-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251104083605.13677-17-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: a5317a12-1188-478f-138d-08de1c47ad72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFZ3ZDFGdnRwQmNhd0FnYzVZWnV1VWhUMlpZNFMvQUpCMklnMkRPRWNvcE82?=
 =?utf-8?B?cGhvVW5PcDRzYldvUnZsM0hzR1lFVEpTR3grNkxwVHFVbVBFd2pFYzJmTm1H?=
 =?utf-8?B?THl1VmVnYURQMGdUbTMyQS9RZDFERlcwVmNka1ZyNDZkTUNMaFo3ZnIzOXpC?=
 =?utf-8?B?NHdMQkxvWnM1YndLNUNxRnluNGRSMFNnaWs3RTczNE5YeWo5WjdYVWl1dDhr?=
 =?utf-8?B?bGFyY3FadXJPU2FpVHAwRDdjb29OZ1pabm43REdOU2JLSDlSWlRyWVRQbXlF?=
 =?utf-8?B?TUdVK05HSjVQRHN6Y0QxSjdhcnAwQk1NemRtNHZ2VFlxc0ZCaWlyVElValpo?=
 =?utf-8?B?Vk8vNWlhRXh2aGFlcXp2QnE1ckZnTk1pSEZtVHBEbGZCazJmU3U4ZmNqem1R?=
 =?utf-8?B?Q2lBQURicDdOQWxRaTdXOHc3QjhkM210eFBvZHhkYmNvdU5XbTNkNjVIREZX?=
 =?utf-8?B?N244TDZuY3E4SGx5REZoTUlLdUkyZXI1a25TTWNQQWxteWZGbWZDYXBwYU9u?=
 =?utf-8?B?U1VLMmZ4YzFMSHYwL21wL3pEd01RdVR0UXNXMTlLWm1oWmNldWN3R2hyTnY4?=
 =?utf-8?B?Q29hbytDbEVNOVVGWml6TWhBNzdHd0ZxdW1id3prWTRXWGVrMmZHOEVpaGlw?=
 =?utf-8?B?L0NsQXBGUzBWdDVwckc0NzdhWENNblIreFlKSDk4dVRiL1padHVUVWRyNWFW?=
 =?utf-8?B?d2xIYzg4SVNiT3JyZUFQZ2tlcUUzc2tWTS9vQUdWVms3UnBZKzJSanROVWtI?=
 =?utf-8?B?eU5HK01TVDc2REJnMjdiVXBkQkZ4d2cvZGtPc2lYZmIxVDhyTkdwWDMvK2xF?=
 =?utf-8?B?TVdkYi96S29IbUR5dzlNNHRTeGtQWmhCUFlZbDA1dEZVZHU3eHk1MzUwMmw0?=
 =?utf-8?B?TnVJdkZpYlkrdm1lUDAralBBeFRxUzc4RTVBekdZRy9rY1dBbll4R2Z0dGF1?=
 =?utf-8?B?UUV5emVoNk9oLzZzWkJjaWhoMFBVVi80R0xERGhMSGc5RXQrTU10S2FWM1gr?=
 =?utf-8?B?SVN1MHNKWVZXeHhpRncwSEZuek1ZNUIzT0dxeDg0d0NFMVVPK0o0Ym9NL1Na?=
 =?utf-8?B?TER4aHFGK0tNYmRielhFQWdFZExFUEZlMWhkeE5ScExCMWIvQXA1OFozYXl1?=
 =?utf-8?B?R1R4Ly8vR09LUHdnWDVmd3RnOHNHcmpJS0dvTndlZC9MWnJLdkU1Q1FEMGpR?=
 =?utf-8?B?bS9INUhiWE12TUwyV1QweXRnMVFIWWJ6UmVva2ZsWml1Y1VGaHRubjBPT09P?=
 =?utf-8?B?YmpDTVpPdmhldFN2TjliYWhNV3NERXlRbFlTTUhQZFZKR1Q5ZHdZWjl5MEtP?=
 =?utf-8?B?cE40N3JOZWlId2ZQVjJ6UzdmQktKMkRUUVVzVFhQc3hKUzh6Rk56aGdrTzNB?=
 =?utf-8?B?c01XT2FVdmNmZ05aRXQwc1V1ekxhY0MybnlVNmR6bmFvckU0N0tjazZQMGsz?=
 =?utf-8?B?TERsZnZxb3J1U1NjT3hrNitxcXhESS9tUnFxbTE1eDVFSnZza2NyNTc1OS9t?=
 =?utf-8?B?Q3BRRG1xamFHOWNJODNORmgwRXZCUm5FMS9ybHNla0h2Vmp3dG9wUTdqemF2?=
 =?utf-8?B?MlNucTFQdXMrZDArU0tYbUcrRmtHMGp6SGIrNXBDVTh5U0FCTFFOcjFsU3N1?=
 =?utf-8?B?dHlVNEdwWGJqSjdrZjNYODE0RFk3Ym5wY0tIV3JGdmpHRy9NWEpIMUNJWVNZ?=
 =?utf-8?B?cHZvU3loTFNNWnFEZm1qdXVIb3d1VE9McHNSWXhlbEZ6NEduVTZKN3BwMUhI?=
 =?utf-8?B?cG9KUERvM0Y3NXp2VEJUeWFETk5GZVhlRFBxaHBrOVppWERyZ1N1UUR4bVVG?=
 =?utf-8?B?NGJZWW1CRjNqWGI1S2RwajFhd2ZTVWlTMkJFSDR5NHRNN3F6M0hvZHJBUnRN?=
 =?utf-8?B?VndIakdnSlN3Mytsc3N5eThleGZWMnlTcTZMd1IrQmNMbng3cFd5YjRDbXBs?=
 =?utf-8?Q?bzEpPr6VYQeyZl6XFFI4MRlhBP5EoTd+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDRvdjFNS3VIQUFkaUc4Y1RkRkw1UDJvMVFKTWhIOW90RzN2UEpINzlxUTJo?=
 =?utf-8?B?dWcxNFlkUFYwa2JneUo1ckh0M1k4clVuNWc3TjJmU2RpZEJveStJdXZTRGI4?=
 =?utf-8?B?RURxNW9MU2ZXZ2pMVDhld01DRUN5VWVLSHBBc0JPZUlMSndmY0FQcFhaZStk?=
 =?utf-8?B?bEpBK2RRM1JSUldCak1xMTRaTHFScmN2aFo1RTNGRm05Zm1kb0V2V3VHd1Np?=
 =?utf-8?B?VWhHMEdXblpsd091Vk1BQlJoUXlmVTNSVDFtTFRYNW5oOE1CNHl4RzFGNFVY?=
 =?utf-8?B?Y3hTNzM2azdPWVcwcVh0RDlKWjhsaXlDNnhEZ1ZSWFluTmlOMGZUWVNCSEZw?=
 =?utf-8?B?aG9lQjg2czcxbUs2ck15cWNBWlNSN3l5TlhUaU5SdGxvdzVTMTlwY0xaWnZy?=
 =?utf-8?B?M01KT0FtS29wek9GRGVQb3J4VEhmcjlBSjhGenFRMVlXb2o1Ly96QU1peTN6?=
 =?utf-8?B?R0c1Uk81UEtCOHJxYm1TQzFGZGpGaFBTVk91YlhCSjhLQ2p1aGg2aDZMRFdR?=
 =?utf-8?B?YlFzRVJDVmNiUGFseUljd29pYUhqM01pWGNZanA5THZFMEtuMGlVTmMvNTMx?=
 =?utf-8?B?UW90V0czZnFNMDczSjdUYm5HT3RnMysvNjFpMzZHQmZxcy82SjVSbzBzL1RW?=
 =?utf-8?B?akt0SU9tamZBS0hEZTBBOWhYM09GV0tRcmlWOE1KTXlHQ1YvMDRkMktXb1Y0?=
 =?utf-8?B?ckYxajJJMmxpc29MNW5mMEc1V1FQVk5RbFhIV2ZCVW1vNm1zYWo4Y1lJcVpB?=
 =?utf-8?B?TXY5TlRvVmhVcEgvOXlIc1lIcFVkV2Flbklmd1lKMVFhbEZyemdpVjhxQnBS?=
 =?utf-8?B?d0FkTk9uN3oybzhENk9xNUh6SzN3LzF6N21jZ2dTck1UNmdRRXptaWErV1Mr?=
 =?utf-8?B?VVMxNi9kTlQ5ZWhxTFV3ZmxaUUN2Y3I4cVVNSkxFSElCOG9nRjJwMjNHMTZN?=
 =?utf-8?B?aVo5ZmZkVGFxQXpPL3NvK0RsNUVaWjRnRmd1c1U3NGVWV2d5REtVTzNBcVVX?=
 =?utf-8?B?N3JTMnBEWUZTbytCSFBEakxoUjRJcEhhMEUvUkdtZS9LWE41aUo1UG9PemJ2?=
 =?utf-8?B?NFFkL3daTnJDbUZzQ1d1WGdUOVM2TGQ1eXlEY0RwbnNGVFNFUDN3Mkk0NzNH?=
 =?utf-8?B?VnBLaHBNd2RYMTJjQUpLVFBhelBJdWtSMEJ2TWdJay8rWGQ2L0lEazF2aG1N?=
 =?utf-8?B?dndOVnpLazdvQVZ0eUw0OTRySDlUbjJpOEZIekFBdFZJRFplUi9tV0E3Y2FR?=
 =?utf-8?B?YytJL1U0UFpnZjVTU3hXZ3IyZHNmZGkvYVlMQWJMbnczdWk4eVlnZ3ppOElC?=
 =?utf-8?B?dTh4dnBQcFgwMTd1SmNQQzRsRDlGelVMRldPVnJPR2YyYzgxUzRwT0UxUnBm?=
 =?utf-8?B?UVZWUnc4V2pkMVY4dVdsSW5kSXkzUWsxRVNrTEJmdXhrN0t2NlAraDBIUWpN?=
 =?utf-8?B?eVNZTDVLOS9ENHZhUlAvRllESUcyNjNHZVorLzdrb21lTEhzb1ZlK1JiR0hV?=
 =?utf-8?B?dExjb3RNeHI2cE4xeDJlTWM0ZmhGMS96aHBDZytDQWhvUEpjbXRqcC93TW5Z?=
 =?utf-8?B?S3hFQ0ZOaEVrSnpMV21SNVVMYUlqWXVTc09aWllocVl3OTR0VGY0L0VoRmsv?=
 =?utf-8?B?Mm8wQkxZeFpoNUxRM0lFdFhhYk5lTHhEMXJ5c1BNSXdVYXIvakZIOUc5THFi?=
 =?utf-8?B?ZzJENXZaNVVoZ2FmTFV3UjUwMkZxRGFUUnRvSU5lMkZ6bEJSUjFjQ2srNGtJ?=
 =?utf-8?B?enI4NjZ1cFVhWDVYR3k2UDNjV0tQYzAwZTVOQlFFM1JWY010MlBKb3dmNzBw?=
 =?utf-8?B?VWVaSDd0SlNDeG4xeDFVcXhjcFcveEFSVHFCU0FVQWNWbGZtZWtkWUVSR0xV?=
 =?utf-8?B?Z0dhZzBmdnFJM2piTXo4ZWhZcnlkdWdsUFdoYkRNbnRiZ2VGZm1MZ1BFUjRB?=
 =?utf-8?B?SitzbE9zUkZicDFrK1NMRmREWWZETFFMQkgrcXlTbU0vMHZRb3VzVmpKa3lP?=
 =?utf-8?B?MVhDLytQWHF0TDlLVFNPWk9xSjRabHM4MmVyVll5eTB0OWNCQlJMc0tvMjFm?=
 =?utf-8?B?dkRxc3kvdG5jdExRaS9VUzJOMTdsMFdCNG5Pd2s3Ym44THhWZXAxcGZuejRm?=
 =?utf-8?Q?9z+mAdR61xq8QeWxdPSKAvcRR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5317a12-1188-478f-138d-08de1c47ad72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:45:31.4577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89iZFoiEwyZgbXFD3mIWtUovONoN+gLh+6o5Gfy+u32T+Bc6z9TgSt4Z/FRKrGrX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7538
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



On 11/4/25 09:35, Pierre-Eric Pelloux-Prayer wrote:
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 23 ++++++++++-------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
>  2 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 47eaab9350ae..d88bdb2ac083 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2187,8 +2187,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	u32 num_clear_entities, num_move_entities;
>  	u32 windows, w;
>  
> -	num_clear_entities = adev->sdma.num_instances;
> -	num_move_entities = MIN(adev->sdma.num_instances, TTM_FENCES_MAX_SLOT_COUNT);
> +	num_clear_entities = MIN(adev->mman.num_buffer_funcs_rings, TTM_FENCES_MAX_SLOT_COUNT);
> +	num_move_entities = MIN(adev->mman.num_buffer_funcs_rings, TTM_FENCES_MAX_SLOT_COUNT);
>  	man->pipelined_eviction.n_fences = num_move_entities;
>  	windows = adev->gmc.is_app_apu ? 0 : (2 * num_move_entities + num_clear_entities);
>  
> @@ -2197,13 +2197,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  		return windows;
>  
>  	if (enable) {
> -		struct amdgpu_ring *ring;
> -		struct drm_gpu_scheduler *sched;
> -
> -		ring = adev->mman.buffer_funcs_rings[0];
> -		sched = &ring->sched;
>  		r = drm_sched_entity_init(&adev->mman.default_entity.base,
> -					  DRM_SCHED_PRIORITY_KERNEL, &sched,
> +					  DRM_SCHED_PRIORITY_KERNEL, adev->mman.scheds,
>  					  1, NULL);
>  		if (r) {
>  			dev_err(adev->dev, "Failed setting up entity (%d)\n",
> @@ -2215,8 +2210,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  		atomic_set(&adev->mman.next_move_entity, 0);
>  		for (i = 0; i < num_move_entities; i++) {
>  			r = drm_sched_entity_init(&adev->mman.move_entities[i].base,
> -						  DRM_SCHED_PRIORITY_NORMAL, &sched,
> -						  1, NULL);
> +						  DRM_SCHED_PRIORITY_NORMAL, adev->mman.scheds,
> +						  adev->mman.num_buffer_funcs_rings, NULL);
>  			if (r) {
>  				dev_err(adev->dev,
>  					"Failed setting up TTM BO move entities (%d)\n",
> @@ -2238,8 +2233,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  
>  		for (i = 0; i < num_clear_entities; i++) {
>  			r = drm_sched_entity_init(&adev->mman.clear_entities[i].base,
> -						  DRM_SCHED_PRIORITY_NORMAL, &sched,
> -						  1, NULL);
> +						  DRM_SCHED_PRIORITY_NORMAL, adev->mman.scheds,
> +						  adev->mman.num_buffer_funcs_rings, NULL);
>  			if (r) {
>  				for (j = 0; j < num_move_entities; j++)
>  					drm_sched_entity_destroy(
> @@ -2650,8 +2645,10 @@ void amdgpu_sdma_set_buffer_funcs_rings(struct amdgpu_device *adev)
>  	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
>  	int i;
>  
> -	for (i = 0; i < adev->sdma.num_instances; i++)
> +	for (i = 0; i < adev->sdma.num_instances; i++) {
>  		adev->mman.buffer_funcs_rings[i] = &adev->sdma.instance[i].ring;
> +		adev->mman.scheds[i] = &adev->sdma.instance[i].ring.sched;
> +	}
>  
>  	adev->mman.num_buffer_funcs_rings = hub->sdma_invalidation_workaround ?
>  		1 : adev->sdma.num_instances;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index d7fee371b814..c059a3d52b57 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -68,6 +68,7 @@ struct amdgpu_mman {
>  	const struct amdgpu_buffer_funcs	*buffer_funcs;
>  	struct amdgpu_ring			*buffer_funcs_rings[AMDGPU_MAX_RINGS];
>  	u32					num_buffer_funcs_rings;
> +	struct drm_gpu_scheduler		*scheds[AMDGPU_MAX_RINGS];

That looks like you are duplicating the data of buffer_funcs_rings. Why?

Regards,
Christian.

>  	bool					buffer_funcs_enabled;
>  
>  	struct mutex				gtt_window_lock;

