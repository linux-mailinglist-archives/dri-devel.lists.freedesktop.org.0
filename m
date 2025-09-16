Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A79B5921A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 11:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B7010E75F;
	Tue, 16 Sep 2025 09:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ro8JqfaG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7D810E756;
 Tue, 16 Sep 2025 09:25:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlnTIOfIjwerEaOcjbLE2AblD9WsHaIGzqZbt6GsZGmCvKose1+51s6RAn4qf655bjfmhWuj95nX6SdkE9muWhDGLihXAQYPBTTpzt7Nys/3f0TEhKkTxDLp6c60g8ukRJUdMlKcVuU2I3Aw5c47HKlOzdjyQKD8Lbf/7QytRXtnsIhKC0UxfidFthMyy/h0GgELJp7G+0d1CKPqe57tYOXYqpFRl4e4BmhkTHHXdmAoxHH8zmic3X6/hRSOf61cxNcYE/bbFK5V+IGJErRhu89Ui0lYM01xzuZtKFax8lzW6fIio0w/sT4bC1eeKnUXPyQwvogc/6dBmGbdE8UI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I55lKc6Tx3CeubZ0XlwqX34vssWmPJK8hjn6AcNiMzo=;
 b=PnD9dJiBTcJ/vNNOWXyFxMeYOPPny5DYV09dYIfF9LRoL7bNuW2zo20K5wkU9g56rJk789BuuiNCNhdsngDc7TSkphs8PfFT5oXTrA6w4hbDBWxksumglu/a5fnedhCh4SG6n0IL73eIdo8eB/s7v4mFJF8MI8ynok12MoPMvSznSNkMKcE4/2axOwgWpCBcq7mukgc4PTFGKotQD9h4mEUk6jGC6+B2eijTYQ9ebF+qBJ2MPGrSU+aSfnAjmLrRHkfRZiz6SehoS/qQaouBoVjmLJn32F8OmdsxXRpE5b0Btjf2ww/BCJjsNO624f9YfokumsbXrMjdTTxNxrGBhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I55lKc6Tx3CeubZ0XlwqX34vssWmPJK8hjn6AcNiMzo=;
 b=ro8JqfaG1nPAP70oc55RDZrwSD/ld5+a1wlrKM97o8KeyE/larivIpdUecxdBIzlBFgCs4i9Ddb7hw6fObjC5F3bWRm/YILhgwhWtjEeibzs7IuQKeW8j0OtLF6ixzeeh+mbia/WLaVoEhAiDg0Gs8RtIHSaELHPpqQSjR1WmPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY1PR12MB9628.namprd12.prod.outlook.com (2603:10b6:930:105::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 09:25:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 09:25:41 +0000
Message-ID: <6d7b6840-de22-444e-8182-a3b6fdd7d8f0@amd.com>
Date: Tue, 16 Sep 2025 11:25:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/amdgpu: remove gart_window_lock usage from gmc
 v12
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250916070846.5107-1-pierre-eric.pelloux-prayer@amd.com>
 <20250916070846.5107-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250916070846.5107-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY1PR12MB9628:EE_
X-MS-Office365-Filtering-Correlation-Id: 062000fd-6653-4c24-bb02-08ddf5030166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qzlqc0xHemZzZWxVN016R3FzcW9yTjJuRlZaZVprb003QU1LSzRqaC9COG9F?=
 =?utf-8?B?QVVCdWxkNEtrR3JJanlrOGJNb2VoemVhRFZCOTA0RjFnTm0wM01xVGlvRHRa?=
 =?utf-8?B?R245Z3RQSHRETTcveG81cEc5ZEFmR3hKaGl5eDA3bFJFQjVSNGpzbHZuQWMv?=
 =?utf-8?B?eFp1ZTVNNGdaUXF5emVxSnlId0IrVld4VExzNGxBdEc0dDVJUW1qRU0rY2NQ?=
 =?utf-8?B?d0FPNVJlQXRRaThoMXRTWEhGR0Rya24xVzB2RjEzMlRzVlJtcmpBNndubGNC?=
 =?utf-8?B?VjgwamN6VFkva2ZibU1XL2hHNVNiNUgvNm1kUlgyWjlabnlqSTZCRUVlVTlv?=
 =?utf-8?B?UDk3QTBGQWdEMEJBbFRkQU1zZkFqV0VkOUlmaE16aW9XMEZKOEgxMks2Ri9j?=
 =?utf-8?B?dDZoTU56eUIxbHlTY24zcUpIMEtWN096eTZkK3UyL2owRFJ2VVBWWkpvR1NW?=
 =?utf-8?B?K1VodUhJUmM0MGhJNWdNRnRhSGhEOFBJcGY2NCs5MzJFbnFTaExCam95SWxS?=
 =?utf-8?B?c29QMUhnMWhVOEN3eEpRaHVnd092c2M3bWlSdGtjSW14V0pxc0F0TFlxUlR2?=
 =?utf-8?B?TUhuWHNPTG5jRm05eWhySE9rTDhRL3pkWFVydUR0cXY3OGp3c2FYdG1QRzlF?=
 =?utf-8?B?RndwT01CcEhpNStTVCt6LzhTYjdleVZiTVhmVGszeFZnZTlhVm9lVmxMaWJG?=
 =?utf-8?B?cFphaDVpSFpRcXJ4eURXSENtd3QybVUxMWp5SllaSUcwNTd0RVlNaUtwNFF0?=
 =?utf-8?B?NDh4cnkycU9Zd1hLa09aS25OS3RDK1Y2MVZDaTJoYmdFdkU1bDl3VU0xaERm?=
 =?utf-8?B?NFRDdzR4citsRkpvbWdJQnNBQ2xhNTIrai9waS9zRDZZMlVpVlREbG9KTjYz?=
 =?utf-8?B?M3VHaG5FNFF4TUdQMkw4c3dEeGRUZFRBbFJuNzZaeDU3Wm43czRQejFabXVs?=
 =?utf-8?B?ampsVkpsNnZsMHZ5a25md0cxWnAzSGx3UndZNUZTMGNyTXdkMDd4cThzeUYv?=
 =?utf-8?B?SW5vaVlPTGNycXpzZTlQTU4rQjBkd2tNK0tXYjd3WW02YUxPbnR2WlQrN2N2?=
 =?utf-8?B?UVJvZEpFYnQ5MHRTVlJGcG5NaE1kR09XNmdrRDhSZHR2Sy9udUVUOW9OeG5v?=
 =?utf-8?B?eEZhWmlmSEQ2MjlKTnNyRkJFUGg0Ukw4di9FMHdMSElOQU1KM0NtM1NIZ2pV?=
 =?utf-8?B?Sjk0dUo2b3ZaZEMvRUJQM1ZwUS9uc0MydGtuNENPMXliZHlXQ2RuVCthM3A5?=
 =?utf-8?B?OE9ERkt5OFAyeWhJOWlSMEVyb01LRDNhOWZEV0pMZFhGMXpyZVpKdDBIbEgy?=
 =?utf-8?B?TmZZbUwydFNqYkVRUXNUSjAzdFJ1bnkybXYyLzl4MnZiNFhPa3N3aHRINU1B?=
 =?utf-8?B?K2p5b2FjeVlKbFZrZWFyL2N3ejlsOWxIMi9JV0pQVlhlNTdCRHZ0UHRJTWU3?=
 =?utf-8?B?Z3BGcnRtNUdlN2tqcjZqa2FhTm1XSWdYWG9JWXVMVGNYTlh2MnNjS255Ujho?=
 =?utf-8?B?bUtJOVJacFplRFBsZ2x2T3J2QUVpc0lQcVdnWVFydDJDaHZVdlFtYlN0SlBD?=
 =?utf-8?B?eENzZzd2aXNITWxnSUovSjZ6SlVuN05VZmx4aVRiQm1iOFBzeEdPbktuSzJq?=
 =?utf-8?B?SG9Dd0RobjNEOHM4Wm01RUxpYnM0dm5qVERiTWpSTzRuekIwWWxzcENOTkhJ?=
 =?utf-8?B?S0YybkxGNkMxK3FrZDdvKzNCNG5NdjdyaGtWSHpDYTdrT0d3R1FBU1RXQnhD?=
 =?utf-8?B?RGU3MC8vM2JUSXB0Qzl2L3RBQWhkZFVhUlJyWmUraHppR0JIMGtXM0NnMUpa?=
 =?utf-8?B?Y1dVNjdQYldaUHBRRXZWMnJrOG1KN0JOOEFURE9GSnlyV3Rmck1uVWVjcG9s?=
 =?utf-8?B?Wlh4S2ZyTjNRelZ2Q2FBeHljUmlkdmNUSnJTdzhibXdWZ0dKenRCSHB2N2pp?=
 =?utf-8?Q?an8JRH+XWj8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEJlTVVCZUlsSThQTVpVWVU4STgxcFVGMDRTeHBYZjhET2V1VzB6cFNCRTJz?=
 =?utf-8?B?UjBRa1lxWkxKdlM4d1crQjVIenhYVXVQSXRsVSszT0tNVUx5QWZZeTNIRVNC?=
 =?utf-8?B?dEhPdCtidHhjZk0vR2NNaEJlNnZ4WmFHa3F2NUJ0UjI3UTVvejdRczZVVFJ6?=
 =?utf-8?B?Zm43QVd5RWdhakZYbWhYYjEzTmwwcFgwL1IxWUkyMXcwR2ZNY1BBYlZ2ZGpI?=
 =?utf-8?B?N3RLUFdxSUc5YWFwTkR1ak0zeHo3L3A3d244SGhIOEVwK2d2T1JjZ1lWZEFQ?=
 =?utf-8?B?YWhHb2E0ZU96QThaditpYnRkdEdKcUpIb2hhclk2TWxYU29zM1BvcFNlUC84?=
 =?utf-8?B?VGMwai9lZVdNVngwWlpsdHJ2d2RybkQxK2x2K253Qys1eWh1UkoyV0tqbi9M?=
 =?utf-8?B?RjV2SFl0enhLSHNqUVpBQW53cy9qU2o3S2NWTk5EbldoNG5pbG9BTzlEYUdQ?=
 =?utf-8?B?R3d0a2pxc1hwVXdkUTVJVXZuV1BVTnNDLzJqbGhQa2htS3N5U1hBOXhQbUpz?=
 =?utf-8?B?M3FPMHVsTFF6UXJhWEZZMkk0Rk1VZGYydjJQb3drWisvRkJLcWh5Q2FxT1Fx?=
 =?utf-8?B?K1hXYWlMbFcwRXZDdGZPZ1Bobk1Xb09Ja1NYUUJoNUtlbHlJbGhYenVIQ2I1?=
 =?utf-8?B?NnBNVkNjajQ1MCsvbTEvMG1Tc080eHZvZnlUdy9LUVI3c3FHTGwxU1Rsd3VG?=
 =?utf-8?B?ekFjbHJrUUk5cFRQYjJ4bUdFMDBZNjFIblVSYlp2czBoYm9VUVFNamJBdEoz?=
 =?utf-8?B?dldkUEQrUUhtZ25Ya2grcUk1U3JNRXRqTXhGdFhiR1BxOG9ZSkpxakJQaDdX?=
 =?utf-8?B?TWdrRHNEWjdRcWZMKytLMnlmYUx0djI4a2ZtSEpwaThuSkpWcFROZFdacTFk?=
 =?utf-8?B?cTYyeXZHOUVjOTZTWm9USDBNZlpGOUNZSE4xL1M3WTJvR1FZSTFYV3ZoSTRk?=
 =?utf-8?B?MDhZNEpQaVhwcHRHbnN6MmtWTk1DZkswZVVRcjRKU1dmejFQbVZCSkwwaTdh?=
 =?utf-8?B?U0x0c1NJNzJoV2w2ektXb0VpTkdLN2YyWGx2Z01ldExZRjNONFJvMk1FdW95?=
 =?utf-8?B?aUpGb1phN1oxY0lGZlA2ZTZWMkJJYnp6NWQ4ajNlSGlxc2d3LzBnTjJYb2Yw?=
 =?utf-8?B?SDRManBBeEFISlpUQ1ViSENybEFuMnJ6aEtaTkpiaCs1OVBPSmhuWUd5R3l0?=
 =?utf-8?B?c1YxM09yWmZvMEF2dGZxL0N3UUlDaEV1Y0pWTWw3S0QyWFB1cEpkYWk0WnZW?=
 =?utf-8?B?aUJ5NlNEb1Y5OTNtVlJ6c0d2YURhNmgzRFYwSzJZMyt6VmV0VTl2SkpwWi9a?=
 =?utf-8?B?OFMzaHZBQnFJUHpCcHFGcWpZNmMrUHcrTUlIbFJGYXE4VnpGUkgyOEpJTDh1?=
 =?utf-8?B?MllYTm5yT3Y5eEpYbEhEZDBLQlRETHhoeGdvWjJUZXpJNU5vRmdaV0pEbUl4?=
 =?utf-8?B?QXVoVzVVcm0vcWM4OERwaHFqSlg0NVJZelFKQXIwOC9waXZpSUE2ckZWdFJO?=
 =?utf-8?B?ckFBVm0vTTZCTUtjUCtTZEMvWXJkSGF5NmN0WExneVM3YjN1S1lhKzU0a2NL?=
 =?utf-8?B?b2h1Mjl6bFJNRDlRUngvSXptOCtpSHVHL0NpSmZQVHBrQUVCd0ROMmNmem96?=
 =?utf-8?B?YnBrRGdJM2E0eW9EdHAvK0xDb1RNWGFRdHlqY2NvUDFXWFBBSEM4cW00OStI?=
 =?utf-8?B?WmU0ME5ORjFzR0d4TnFqZktBVGk5RmFTWFEyRWYrM3N5Tk5sNGFOdjJuWUdH?=
 =?utf-8?B?ZEI0bWFQWkNXbVUzUWlVQ3dBbzYxdnRDcEVKMm12bE9pWEZ4bXlvTVdiUDhK?=
 =?utf-8?B?STd0ZTFyWWlMM0ttQXQwd3JCU3g3Q2p3UGZLL1o1Rkp0T3VjZ0ZjWEhIV0Jo?=
 =?utf-8?B?WVdBekZnbURhazZDOEtuaDZBSWp6eklZVG1SdHc2M2FNdWFLOUFmMmh0b2Nk?=
 =?utf-8?B?aURmSXR0TEMwejVBMTZKZlRydTJvUHVkY2c2U1JxZWFoQ1JZUkJMRWlUakY5?=
 =?utf-8?B?aHVGbnlXT1ErZm9yTnRyUUwzYkloYVpIeGkrRHhkMS9jT1cxTkp0T1FpVUtP?=
 =?utf-8?B?NjZyS1JCOGUyZDY1aWJoVjlPVEs3U2tqWEg2MEtpNkFnRU5pdmtoSE4xdXhm?=
 =?utf-8?Q?2LYXI8YeU58rj1JhMiDCvJtFu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 062000fd-6653-4c24-bb02-08ddf5030166
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 09:25:41.5626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWY18CShC4CnZk8N9I4jNyR59p14oL54PHKAF55uVckLI5Tqdzs4nGPR9RuhY9aJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9628
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



On 16.09.25 09:08, Pierre-Eric Pelloux-Prayer wrote:
> This lock was part of the SDMA workaround originally implemented in
> gmc_v10_0_flush_gpu_tlb (a70cb2176f7ef6f moved it to
> amdgpu_gmc_flush_gpu_tlb).
> 
> This means this lock is useless and be safely dropped.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> index 76d3c40735b0..454fd1104c6d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> @@ -312,9 +312,7 @@ static void gmc_v12_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  		return;
>  	}
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
>  	gmc_v12_0_flush_vm_hub(adev, vmid, vmhub, 0);
> -	mutex_unlock(&adev->mman.gtt_window_lock);
>  	return;
>  }
>  

