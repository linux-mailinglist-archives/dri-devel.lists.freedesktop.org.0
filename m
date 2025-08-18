Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66BDB295CC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 02:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E91C10E199;
	Mon, 18 Aug 2025 00:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BHymdysx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED92210E041;
 Mon, 18 Aug 2025 00:09:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dImgeS4vg5XANvw9O8tKm8ePBxz33RWcpfIXgesdUCDonHUiDNP0WfWgLH4c0g2Co7+OicpuS1R/nhXweDRHt9DGeG1D9SmE0jqf8bLIalb52kEEX3c79dsYZbELbc+T9t+ATIud8LPdu2F7uZykh4oTheFX1zX7Mlo0ADw430YyRn+KAXJbHhkAGHR+SgI7KKT3pPKOmp7+cRJGE4R8H7ntl4RpqAzfnAywCudYLEGyEdL6rTOkcGdVfxbHWejc/D4MUp7k4JZ7Q+lMPtRcCBpm1317HWj1hsJvw/Lx0Jv4VzgMf9Q/J4wqXqF35RiJyU7hmxHyp2KonKTeIbMJxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REdHazSIZpzBr7Ik2Q8ME8Ibk5RymWNfCts2Mtq7RIY=;
 b=D0w6ZhJj7nFuPjpwcgxOJrUPWK+znd+H8j+ejUQfF0bi/2c43vro46//elBpgwRoNXsniHlH5OIh1fAQZnLe+zq46o6e9n26OntqyqGb+cmM9y39lXUhZebgcpMbrEpj53Ljsu7Wx9s5qjmAudDQjqlg7mKNwS3BRp16Y4PpR6ar/rkrF0aBeU+cp6VtHV/BaslVbLLC3Vil9n4YJMml5b81nCVi6kR1V48Yx0za/z2Y6LlAhfRdiyHizeBztVq4CIcmAoEazx0tWU2S43xXPoQVHyl45Unhm1cN3RHLoPwaaSnc3/etyIDxuSDRc4Zt0Xa5dtRFThAPDjuvFDPMuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REdHazSIZpzBr7Ik2Q8ME8Ibk5RymWNfCts2Mtq7RIY=;
 b=BHymdysxF0iiSYAyI3W2jCAA5KlA9MLRLikz8erJ2QA7g26TwdcALMPTz5pZZdSiXJL4Na/7ahIapN7FThKyTfZq9kp4Kl9IZKTl3k73jAOfDL5/SQbwNNgrL+nrIEOrW6yVs9kd7ZtfjuaiB7xVkMZfWopWfrE7tlPXCggX2Pg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SN7PR12MB6887.namprd12.prod.outlook.com (2603:10b6:806:261::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Mon, 18 Aug
 2025 00:09:40 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9031.019; Mon, 18 Aug 2025
 00:09:40 +0000
Message-ID: <5e5b4d9e-b2f6-4198-b8a4-86de74a7e54e@amd.com>
Date: Sun, 17 Aug 2025 18:09:38 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: replace min/max nesting with clamp()
To: Xichao Zhao <zhao.xichao@vivo.com>, austin.zheng@amd.com,
 jun.lei@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: siqueira@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250808025209.120448-1-zhao.xichao@vivo.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250808025209.120448-1-zhao.xichao@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0300.namprd04.prod.outlook.com
 (2603:10b6:303:89::35) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SN7PR12MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: ac544748-ac53-45f3-19d8-08ddddeb86a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEZRbUxKUjJKNzMwNDA3andlSTVrUFBpR1VVaEsvSnQ3UkhOZFM3ZFJPL3NR?=
 =?utf-8?B?bXBZSXBad290Ym1OR3VacXpCSlMyQUVRUGt4ak5YL3pIRE02clhWWkxiUFIv?=
 =?utf-8?B?ZTh2UTVYdEtUQTlVcVhjdk12emVna3o3MEtyUEpWT0Y0c2xoRTNoMkpYSHBD?=
 =?utf-8?B?d2ZueElzdC9FdC8zYmJGYkdlVGNVdUdnRTcrMU41YjNtVklHK1pKZFViSTZR?=
 =?utf-8?B?c29hMDZtOXZ5blRaeUQyVHZReFl2WFo2bElRN0lFMkxIRHcrU2ZsM3hsMDYv?=
 =?utf-8?B?dTNqVENYZGRqaEg3Szk4RlY0ajUrQzR1ZU9ISkgwcXIrRllGUHdCVU9QTHJD?=
 =?utf-8?B?VkpxWjBVV0E3RUo3QWk5SFFSQ2VXemZ0WS9FS1NWWHpYVStzQ081clJLdEZ2?=
 =?utf-8?B?aU5mRFV4Y1d5Sk9NL01CRzl1NFhCdVRZdUxXUGJ4bWx4VXRVeTRzdGdwNzdS?=
 =?utf-8?B?KzhPWGxBUkdKcUM3dU9oMk13czNLOEZ2L3pQK0tZMjZxeEFjYmh1clBvS08v?=
 =?utf-8?B?S0dYek1UOHFNYTZsSDZHQ1lQb2NVbFdwVWlFeWtiVUIwbjlpOXMxU0w2dCt1?=
 =?utf-8?B?aUhBUmttSXo5bFBtWnNNZG1DUExLYnRETkJUMkdCREN6NmYrVm9nUk5BSGVv?=
 =?utf-8?B?LzlsejhkWXA1OHJMVEZNT0VhaUU4TlMxTzJQQ055aXV3aWFOTG1IeFNaV2Rv?=
 =?utf-8?B?STZ0Nlc5S2p0SWFSem1xMFdjeTBUckVRZGlKblgxMG11YXI5OWF2WUdkbFJu?=
 =?utf-8?B?aTEwUlYxM01iU3l0QVlndTBVdzR3ZFVyM2w0UEFjOUV3WVh4SWYyeEpnaDdH?=
 =?utf-8?B?VUp1UFVGNEFlQ0hUL1dsUHZLVDR4Q0dPQ2c4eGliT0haNFZXZVVISVFhajRm?=
 =?utf-8?B?bG4rb1dZQko3RldTeCtxNitweGI0K0ZmbDd5ekNDSzJ6R3doV3RIcTRBaEJE?=
 =?utf-8?B?ek04aVhrMDduNUF3amJvYlRWNDZnWXplWHNSVjJLMmxIbWdNY2pFdDNtRm1X?=
 =?utf-8?B?bzV5VllvRHRYTGM2UnR5RnZ2R1Y2ODFGdlZBV2pWMG5BMFNWR29WQkRFRU1r?=
 =?utf-8?B?RkdqcEVES0VBdzN1L2VoNGZJUnU0VDJ2aEUwMjBqQWJESGkvY0VzWUVqcHNU?=
 =?utf-8?B?TkJQOUhxWmNWT1g2RHV5Y3h6Z1lIRUxSaE1EbTJKNEJRWDlKTG9PajljOHZZ?=
 =?utf-8?B?TVVaeThpTkZhQnFqMlBwMFhCd0d5WEY0SzFzZ2lxNlBmSGNqOVJ5Q0dxTE10?=
 =?utf-8?B?ZjhGQy9KenNUeEl5cjN1THViSnB3Zkg1bVNUc2s2MGdWWWlNbTBOa0YyRWgr?=
 =?utf-8?B?MHpTbFFld3d4K1ZLbk45NzltblVGdStjaWdqSER6ZE9jVThMdmNPSTA3dmkv?=
 =?utf-8?B?b1RScmZxNGIySGNyZ0VOc1dxSnMrT3pOY3BlQ2dOUUtHdGgyU2x3L1ZnRGVR?=
 =?utf-8?B?MnpSSitodytoOFVKYVpQUE9rbTIxZlg5UFNMeVY2R2JIbGtFODlSNkx2TVFo?=
 =?utf-8?B?Ymh3aTlpdG1ESzhtT1hnZ2dIMG8zZW5xeWQrdUw5dEpVZHdnd1pJb2wwVFFC?=
 =?utf-8?B?Nk50NFIwTDVYT3ROY1lLOEhTN2p2cmdMVlVIRThjTXNmZ3hyVWlVVmsvNGFL?=
 =?utf-8?B?NFlSMENtd0NyMlBzNDJIcFZPcjNpT1Q2YzByUFFudXhiYXluajdYN1JyTkNr?=
 =?utf-8?B?aDUvVjZ0ZUFkZHhxODFyWUx6TDN4MjlXdnFSU05rYW1GNDRnQnluYnNocnYw?=
 =?utf-8?B?RlJKNnVCaURpS2ErZHZKM3lFRTIvTnNXcWxaZzh0VDJSUUJENzZvYys3NFNW?=
 =?utf-8?B?QTl0YS9JOW9UKzd4V3lhT0g2cG5ZUHo2ZmlLQXJDNnB1dStvdkN6UUlVTEpa?=
 =?utf-8?B?eGVlUXZPZFlNdHVUeWZKSWFGMVNIMWdvS013bElESWVZb1NhbHJpZEYrYmQ2?=
 =?utf-8?Q?XuJhyr5pIRg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm9VdGhYUmw3Z1lsREdjeUkzTit1S3cyZEZBWTVtR1l4NXZYRjBKS0dtMjBl?=
 =?utf-8?B?R2lxTUpHUzlwbzJVUHQ4enNXV3J3NDc4N211ekpzWDUwVEpFM01DMjNlR2xS?=
 =?utf-8?B?NXQxQmZaVGpyOEtjS1NpN0hDKzErZ0dTbXZwNHVqTFVnaDE1YmkrYVdXczJF?=
 =?utf-8?B?QSsvVllNZ2RBaUlPUS96UENSR0lKandJSlJHaDRaMlRiU0NoQzc5K1VrT0Zz?=
 =?utf-8?B?Y0lHMUdIOVJlb0VZalV2TktQS245RHB6ZEVDQW93M2lydWpINnEwZWpqSnlK?=
 =?utf-8?B?NkE1TTRyQTNxUkFPWkdqc3JBeXQ3M0dLMnpwQklGN1UwV1pLU3Z0WmtWdWZs?=
 =?utf-8?B?QWF2ZjZhYVRhN0l0NHh3WElVcjBqelZOUjNuWEFOeEVhYnBrMTJSN3dFVzJO?=
 =?utf-8?B?QngvNEUraC80V2tWWk9OcDhUY1g0aDc4Zi9maVJuN2xWUXdITXl1TlN2bUg0?=
 =?utf-8?B?VUVzN1cydy9DaUZ6N0sxSXlrVW41anl2NHRHTEZ6ZG1qNktzdDhyMVgwSXV3?=
 =?utf-8?B?ZFRaRHVxNWxjQU1xUGx0NWtHdGFGK0dubnZZY2NZRmsrYTJldDk2eXl1dllN?=
 =?utf-8?B?dGZpUzl5MUx2akJvSWNTZ3ZMdFlhaGhxaER0Tk5tUVROemZYSzcxSnRjclRw?=
 =?utf-8?B?Ukx5TUV4cFhtY3lYeVQ4NTBuRmVNdUJtYTdlYStLOFZEbmRBaDdPL3M5Q0ND?=
 =?utf-8?B?OS9TL3RyU2dVWk9TS2laNWd0L0xMZlZRaDE5Zk80ZElvRXF1UEQ4cUxCRVp2?=
 =?utf-8?B?SENpdm1aUC91QmxpYnM4aG8vcW9UcmdnTTU4alI1NlhPVVMyYjZyNk5wdGFu?=
 =?utf-8?B?dmpiYnJkNGJLL3drUWZjSDBHWnlGQjd4Y3AzdG5vRHVYRUhiejYvMGVKa0ZJ?=
 =?utf-8?B?VlpJVXRPT0NVdC9PRmg0RGU5NXpETkVsZGc2R0hvcjZhOWg5ZEFQcmtONURT?=
 =?utf-8?B?NTB1UDZ4NEFBQ0E0aXBLdGxUd0NKUDQwSmUrUnZRMkl0b0xJT090OGprV1o5?=
 =?utf-8?B?T1Nqbi9ia3JMRGFaUUFMN2hnUjFRWjEzYUxRc09YMTV4dnVpdGkxU2lKbVp3?=
 =?utf-8?B?QzNoK1FKYkhvN1BxNmNnOVo2SDFHWWw4aEZSQnloSmhZVjhBOStjSThMNFNP?=
 =?utf-8?B?MWZoU3J4cVUwWTNiNjFkRDlDRWJFT0RUK1dySy9VV0pJdzBtdm1WMTBEYklO?=
 =?utf-8?B?dFNIMGpGZnRUSk1sUVV5RWZybW9aOUxaYUlnU0lsWDVnK2trVWFaVDIwM2R3?=
 =?utf-8?B?K1lEY3FXYnZ1MkxsZVRaRStaSklyVmlUcjJSYW9MckZLMWZzY00yUVJpb3E4?=
 =?utf-8?B?Tks0aEF4QTZzcmNZWkFwUFVpeDRreFloRFRkOUt6Z2JRNDBjSVc2UDRnVERh?=
 =?utf-8?B?V29hak1tT2ZUOHdSdmlqSWxJTDJIa3BxT2w2aWtLREZQdlc2MmRkWElIY2NF?=
 =?utf-8?B?eDl0ZzhnazZQRUo2empFaWY0V2JWWVd4SENRK29QL0ZHaEUvSXN1QVVYTGxG?=
 =?utf-8?B?TWFST21nQ3MzUHZZdmcyLzVWYXlXOWFjQlA3aXBSRUVyK24rZWxLR0QzNnlu?=
 =?utf-8?B?TG1DcVordWFXODZVSEsrT0Z6UDVtclVPQnBlNDIzSEdMOWp1SXdJa2NuS2pn?=
 =?utf-8?B?U3laMjhJUEVraFJqNWN5VStFSTQ0di9KRlVWUlBRZXRjZE1tK1piU1ZEak5z?=
 =?utf-8?B?QWhWK1k4aEhHc0dwK0NLZWVBanNGdms1ckZzWk1LL3Q1aXNtM1NVc1BMZ1ow?=
 =?utf-8?B?NWdQa01oUThhZjZUd2F4Q0R6UWFDaFU5MW1XNFE4WEFnSWxadG8xUXBkdm4w?=
 =?utf-8?B?YU54WmMrWmxvWHVrenYrSE94QmhUTFgyazI3TWRhOElqVE1COER1SDgxL0Qz?=
 =?utf-8?B?bHFVUDlJbzdHYWk1K2k0U3duMWtqREFFRldRQjc3aHJCWWtmMEVBak5NZjZQ?=
 =?utf-8?B?SlNrdTRwOWpteHRqK0ltTTlpdmdtaXRUUTNTWXhONTNJMUpCSFVNM0RseXpV?=
 =?utf-8?B?T2VPajh5UWRWQkROeDM3YURPem9VQzZ2ckV0YzFuMlhzNFZsQUVtb2kzYlFX?=
 =?utf-8?B?WDJzaW4rMjkxNy9pRUFIc3l4dmxaREw4QmhTY1VaL0pRZGtaRFFyQmxCOWZS?=
 =?utf-8?Q?8nYpPNJo3S2HM+xv2G6EQjppM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac544748-ac53-45f3-19d8-08ddddeb86a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 00:09:40.7271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q728ZLsQ+1l4DXHIkilXNX6pPCPz26seTkRUx71xP/U41172+L+CrYcOXeVPyIwI3SdGUEgtKcRAW8Vlk6GgcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6887
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 8/7/25 20:52, Xichao Zhao wrote:
> The clamp() macro explicitly expresses the intent of constraining
> a value within bounds.Therefore, replacing min(max(a, b), c) with
> clamp(val, lo, hi) can improve code readability.
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
> index 0c0b2d67c9cd..00767b8ccdae 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
> @@ -435,12 +435,12 @@ void dcn301_fpu_calculate_wm_and_dlg(struct dc *dc,
>   						&context->bw_ctx.dml, pipes, pipe_cnt);
>   	/* WM Set C */
>   	table_entry = &bw_params->wm_table.entries[WM_C];
> -	vlevel = min(max(vlevel_req, 2), vlevel_max);
> +	vlevel = clamp(vlevel_req, 2, vlevel_max);
>   	calculate_wm_set_for_vlevel(vlevel, table_entry, &context->bw_ctx.bw.dcn.watermarks.c,
>   						&context->bw_ctx.dml, pipes, pipe_cnt);
>   	/* WM Set B */
>   	table_entry = &bw_params->wm_table.entries[WM_B];
> -	vlevel = min(max(vlevel_req, 1), vlevel_max);
> +	vlevel = clamp(vlevel_req, 1, vlevel_max);
>   	calculate_wm_set_for_vlevel(vlevel, table_entry, &context->bw_ctx.bw.dcn.watermarks.b,
>   						&context->bw_ctx.dml, pipes, pipe_cnt);
>   

