Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C808AAFBE27
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 00:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE5B10E0B1;
	Mon,  7 Jul 2025 22:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S2ocvJnb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F368410E0AD;
 Mon,  7 Jul 2025 22:12:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ps99uXRUNssF2fNgT8G44MY+9eQ4oAzrL3tUzyDwjzQx0GPSvZnudkflRSuGVSDSn/vVxEi5kLJIBXfbufMCTSNjJQJJ2msvxlpXxvAYHBibA92lrgEZ4Lu6Ofyjz4508fj3e1YrY7mi0H7v3DgTBhDilVHHWLOiXuEPx3DvPcf3glXeiS8kUcEOb7PrS4Xsi5tHOkz2bFDBBQLBkHrRIr0paLUMZWItUbQxUBps3yxoTEsK7Qvhb6H/+0xS4UCIlBf5BrUvNK65Tu5nwA/EKF14r9PUCqBXRSQQ0zGoCz2YlLjsi3viWxBeu9MUa11vr+h5s/rDkE15NUR2B3JIUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RG+bG/7vAEDE2MAHqhMkkO5R/8g+KoRHAoRdE+RLcss=;
 b=ply8EFkPhRFNDxwV3+yvRfdQymaUvUPQqyooQEWSKKVRoxTRcq/dadoUekP0bLWt9BBB1sd7MpGfmxyYVavDb8jZzOhUv01ktogJYUO+Opoq4xR756mEWjX9FHfM8eBPm/jkoS8dNw+t0JeikPGyr7/Coe3ln5d9kDXZ84tqKSDU1iVByVR9knIWlNN4Mxs0G0PkraCgiSm0uNRT8cFXkxWNF3sT7qRZO1YKmGh4+Vw3BENAhAbtKi/AZnJztot5DzT2hCcwx7N9ubHrUGrCfBqepbbnGvLVhWYqB27B8vQ8cak4rTRR3drKoTlVdn2GCiStbaSSyg5Swcjs6E3yzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RG+bG/7vAEDE2MAHqhMkkO5R/8g+KoRHAoRdE+RLcss=;
 b=S2ocvJnbybn5Q8I6vzEWTWZGZStL4cU9zDXAPyRmEk2zGvkQ2LId9yPgiqkl4nfb/3yqIG6jpoftyFnRysggr95ynKvQHT/V1PMhILRGSKcJ+HGWNoagnupRxD2HGbsL3JrcgmgiTrTmJXhSZTVgWM3FPSU7uvH5Q6kHCDh9sBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA0PPF44635DB8D.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bcc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Mon, 7 Jul
 2025 22:12:09 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 22:12:08 +0000
Message-ID: <56e7ec54-9820-4e02-be97-2a9e1dedd117@amd.com>
Date: Mon, 7 Jul 2025 18:12:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: enable kfd on LoongArch systems
To: Han Gao <rabenda.cn@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
References: <2b83380bf64a424b9cb902a20a244c3e106c4bb8.1751702072.git.rabenda.cn@gmail.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <2b83380bf64a424b9cb902a20a244c3e106c4bb8.1751702072.git.rabenda.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::31) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA0PPF44635DB8D:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6059f4-7ea3-4e36-9852-08ddbda3509c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXB2SGVSOWVLSWFnbEJONGRTZjdYdVJVT1doZm96VHU1U09DWWVxcldNVm1J?=
 =?utf-8?B?RlRCMDBvbG9CajZsT0MwdFgvbkhBUnBxTVdVbXlqa0pZdTJOUkhlcHkwVUJF?=
 =?utf-8?B?eUc0Yld2ZlNNNlpFcFRLTEE3a1B4U0pleXo5T1cvU08rZlVqQ29XVTluTWZI?=
 =?utf-8?B?dFBvRU5ERmR2TURYNmNLN3B3WHVvV3ZrTEtsNUhYeEtVMTNJRzl5UnpBVGI3?=
 =?utf-8?B?WVZHbUNYekthUzBzdUVOa0hBeG9DNS81TTVBL3g3Qk9GS2FLbXFEUkJtdTJx?=
 =?utf-8?B?NVdTd1BwZUpxN1lRRWZFdEYyT25qa1c0U1pmRGp4cGxCSit1ZTBJcFlGeWxI?=
 =?utf-8?B?UFpBQTgxR0E3N21RNlpaOVplc1VDZSthNFZGMzFBUlh0SUF4R0trSVpxNzhU?=
 =?utf-8?B?bnFCemREZXN6Y3YyNERTL3JJeVJlUkU0OE55Mlg5dElBVFRpWDlyeFR6bUhG?=
 =?utf-8?B?R3NVbmVLWGl6UzREUG5ud2pXeHQxTlJ1RU43U3ZtS0o0bDQwTm1ET1lFcyt5?=
 =?utf-8?B?TXRKNUEyS3NURWYyZXU2T2FSckx4b25vcjFuNzV3VGVnRi9YZ1l3enZhSXJE?=
 =?utf-8?B?blRaNXVFR2tBNXl6TWJNMmFYRnUrVDhIZEl0dGk4QlNycnFjaFpHTE8rV29Z?=
 =?utf-8?B?ZHU2Y0FqMTd2SVFCci9obXJsL3pWSnNoQUptZWRwbWVSK3VxcGNwSTU4OUJJ?=
 =?utf-8?B?NHZNTmVQZk1JSVZVM0s4ekN4Z0UwZmlhbEtIVkxnRE0wSWx2RGUzWEdVZThQ?=
 =?utf-8?B?YnpGRlozcGhFcW5xNFJTazBQU0xpUzJvazU1SEs3ZnRPUXkya2lZekFwNUFT?=
 =?utf-8?B?bjFEK0JOUmxxNkV0anlmcW9zMzkzaEVkcE91ZDlpci9iblRFdS80WXJTMUlI?=
 =?utf-8?B?NHdoWjVUM0Q2VitxZ2l3U0dVSGNQNFpnSC9kdUZzMVNqWU1VWnZDa1NPOEc3?=
 =?utf-8?B?OFhyQnY3NkRPcDZ4UTE1U24wV2p4Sm9xdUR6MWxrOHpDNHlqNFNwMC9JVTJI?=
 =?utf-8?B?NzV0Y01UMHg5MWRwYUoxc0NoTHJ5a0ZGdzF0QmZac0FRaFIvUmVLVnhkaFRR?=
 =?utf-8?B?NlhWRTNrYzhzMlc5eFREYWVnNzBkTmYxa01YdTFleEw1QXRSN2xUdUdzVTlM?=
 =?utf-8?B?cm1xN1FvRHNLNzk4d1Bua1g5enFkdXEzZ1dxU05HNjM5dy9QUURuejJRRjhF?=
 =?utf-8?B?VGNSK3JoT2pRS2FMdmJiSGd0d2lVZUZRQ0ZZd3JYcWIrQmRsNjdrSEpIU0RB?=
 =?utf-8?B?dFBrVXlmekFmOUdYRUpHeXU2SVptUXhkUjFOYTN4VUJsYXAyakdpZ2NNdzZy?=
 =?utf-8?B?SlJyZ1VFWS8rYStxUHJEbEFoMHVQclRWTVJsR2FQTFRUWEdheE9NSEVQcEZ5?=
 =?utf-8?B?a3llbzN3VWZ1dm1JbWhLQnUvRjRDcTByL3ljL1BpdnB3ZXlvZ2twZStUTE5k?=
 =?utf-8?B?RWIzc3lNMEhBVS9Bd1M4TnZvZzhxNFdWUW50S3VGMlJqYzNyTGMzS2tZTldX?=
 =?utf-8?B?UmRNR2M1OWFNNWdwZTYxc0dGTEg1VjJEZnZUYk13YkN2R2lTYWNHeEEvUEZG?=
 =?utf-8?B?QUkyakpGUkZob0hMVzdOWlpYNzc1QTJzTzQ3U1lVSTE5Z1VYVFJSUWJMcWJ1?=
 =?utf-8?B?K0VTT3FMejJ4OStKK0cwTldNVW84T1pSQ2xqU1FPTmpWbUtsTGYreGpQTldH?=
 =?utf-8?B?dkVQSmJBMGF1QnpDYmpzN2RqSnJpWlhrdnRwMVZOR0owb1I5QUtsTUQ3dnRl?=
 =?utf-8?B?amFzWEg4KzB0dEdnUkV3SEpTZVJRbnZPRCtYUXo1NmQvcTFEdHZuY25WTlF1?=
 =?utf-8?B?blUxQ2xtYkk5czkzWElmZnNuTEUyMUpUV3krV0liSStTeDhMUkNvczZQbUZo?=
 =?utf-8?B?Q1g1bytaYWJXL0U4azZ0bndLSVlmWkN6TFdlclRZU1pZRlhxVnBJYlFMWUN4?=
 =?utf-8?Q?94GUaHlEdn0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXd5WVpVMUEzVzNvVGNXeis1Wnk1bXVvQytFL1h6TXdXVEZuWjFKSmJyQmNV?=
 =?utf-8?B?SmpVU3VHMUg4bEFVNnU1MlZDK2lmZEIxRk8zb25ka1B2TE4xbS9KUm1mTUNM?=
 =?utf-8?B?eE5yRG4rQ2prUEtVbm5WWmxRZ2xaSHZqT0hlaXpVWDZDalkvdk9KM0FNMm03?=
 =?utf-8?B?RHI3YVZEL003Y3hsdVZRYUo2M0Z0MUVWN1BoT1piUkt3Zm1pS3FOankxazI5?=
 =?utf-8?B?SUVJaEFpakZrZmgwMTVZSmZvN1hkS1lGVTM1bWIwMWVSL08rWmxKOXFpZDA1?=
 =?utf-8?B?Z3VoMVZjUC9ZaFhCOVdGWDluc2Z6M0tuRWpVdzV1L202cnJqQmk2SllOQmYy?=
 =?utf-8?B?RzdaMDVqM004NlMveVdZQjVnQU5mSlpieU1IYnlRZXpsWkhaVmZtWGhNODBP?=
 =?utf-8?B?cU9lajlVZmpkdTZuMUhkMEw3a0FEQ2QvSDNIVjBmZW1KSlM0ZTdnYmIzZTRa?=
 =?utf-8?B?bWFaOUF2bDZ5bTV6ZjdIazd4N0pQekJ1K0ZXNk1FQm96Y3NHQWgzd1VYbU9h?=
 =?utf-8?B?TDdkbFpPandhSGY4ZHhia3F3cVRYNVlVZVAvbk9zZXFxMllQZG5PbEZHa2w4?=
 =?utf-8?B?U1MvN2RSSnFvZ25RejlyeU8waVoveXdmdGhmbTRMZllBemliK1l1WUpEYjAz?=
 =?utf-8?B?aFBLOWF6YlM3L1pQMDlRMS9iMmpEeEFTOUFhWFN6SFBrT0Q5ZnZzaXlOMHVB?=
 =?utf-8?B?UXpTRmlmUnd4YngxS1pseTlQRFB1WUdvOWJZbzJpb3BkNUpaWUFQTmRyM2Zr?=
 =?utf-8?B?bDl3RDdhYklieTFtam11WHY1WU13ckh0czRoSjNOVEEyelBScGIzZ1VHTTJu?=
 =?utf-8?B?ZEhqV21EUktzc3NEbS8rbTc1TlYvK1RrRncvckYzUXNmZHh2QmtMYkVLRGtY?=
 =?utf-8?B?am5XbFJqbE1jL2ZaQ0ppU0kvbkhZVGZsdVNsMnNtL09zSjZaMVRXWnBMemc3?=
 =?utf-8?B?NEdEVE8xYTZJcU9DSXErK1Q3c3BJbWt2U01oYVp0Uk9zWkw2ek9FUEZiR3Ny?=
 =?utf-8?B?ZXZvYkNEQjNqRkNSMml6MThuZ2J3MDJjR2NTRGZzN2FobE96M1diNmJNQzBt?=
 =?utf-8?B?RDF1UGN3NkZIZkZBcXJhWUdXTS9zcnZ3N3AzekJoZ2JKN3JCL1NUT0dTcDVo?=
 =?utf-8?B?S25hbU9XQmd6eDc5ZncwYk1NakVNQ0tQTm5iQWV4d2dHK2xuYkY3dUIyS2Fp?=
 =?utf-8?B?MzQ4SS9NZTJiekE0SzU3WVlmY0lRajhJMkxDOUNxdmVYZW9NdDVCOTBubGFR?=
 =?utf-8?B?SS9nM2xsRmVvc2RGT3B1c2R5MVJLSVdUL0xOeWRmTWxSbnRxMng3V0VaTkxQ?=
 =?utf-8?B?dDlXR21SZTFTaHkybEM5UUZYWitaRW9CelphNjR3Mm9zRHBSM1VPKzRGaHhW?=
 =?utf-8?B?aDZqMjhZNGxBSlhFNkJZVnRFTWR1SkFEbm9PRDZZNm9OU0t3dC9vd0NWS3o3?=
 =?utf-8?B?VlNlY2JibWJOMEtBVmtpQmRuT1U5QjdxbjBXcy8vZG5VdVI5RGluL3NtVjRW?=
 =?utf-8?B?YWFlZk0wd0ZXOVV0VHJsQkpKbkpSVWxTWVFkd1BXTXB1d1V4bkNaaW1rVVM2?=
 =?utf-8?B?Vno1SDZzbHZnQnN3bWIxb1o1dzUwUjlrajZwMG01SFM5N29jMFQvMVVINjBu?=
 =?utf-8?B?SFVQTi9LNnBjNStVdWY4dE9WYzVTNUZiNkxLblY2a2g4ZHRXZi9EMTdaUEFj?=
 =?utf-8?B?V3N4UE1aWE56VmJtb2VtYndBYnQyUHN0SWNhOTV6M0Z2MGJXRmlwbWVYZHd3?=
 =?utf-8?B?akVqS1FHckJQVlRXQWVROHcvQ0ZoSVRQRUpBUTdNT2pYTnRZSUd3c1VBaWpi?=
 =?utf-8?B?Tmswb3EwNHFtYnlYZ3VDQVAra20ybm5LUmF2UXNKdGtGL1pEeW1MNU03M2JS?=
 =?utf-8?B?WDhJc0NOaS95OTgxZHNlcUZ0d0lQRWVCVXdTaEcxYlRQbVlubE43SjMyZmV3?=
 =?utf-8?B?alNQTytxdEpPajJ4OWdNRWVMOHArekFKbmREYnhLcnlXcE5PZ3FqTXJZRzB6?=
 =?utf-8?B?K1VFL29vTGpmYkRuRUNteUg0RG1mSlQ4RGdwSU1DSTZybkFhcmhYb2g4NUdx?=
 =?utf-8?B?WGQrejBTYWs3bEcweVY0dlRxSml0SGJ2YSs5QnZraVRBU1hHM2FGbkxOdERK?=
 =?utf-8?Q?YK7AtOygCkQcR8lpsop5reisp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6059f4-7ea3-4e36-9852-08ddbda3509c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 22:12:08.8155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pft65jYuWEyq+IWCKWyQlyGC+3X0Ye+ImzvU2R7UHO6GYsDSqgJVyR3qjfs4znEbcVJF4OYQZzUHB4dw1HpMfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF44635DB8D
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

On 2025-07-05 04:05, Han Gao wrote:
> KFD has been confirmed that can run on LoongArch systems.
> It's necessary to support CONFIG_HSA_AMD on LoongArch.
>
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
> index 62e88e5362e9..b2387d529bf0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/Kconfig
> +++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
> @@ -5,7 +5,7 @@
>   
>   config HSA_AMD
>   	bool "HSA kernel driver for AMD GPU devices"
> -	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT))
> +	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT) || LOONGARCH)

Is LOONGARCH always 64-bit? If not, please make this (LOONGARCH && 64BIT).

Other than that, I have no objections to applying this patch.

Regards,
   Felix


>   	select HMM_MIRROR
>   	select MMU_NOTIFIER
>   	select DRM_AMDGPU_USERPTR
