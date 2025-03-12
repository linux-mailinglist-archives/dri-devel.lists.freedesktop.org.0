Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2444EA5D7ED
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 09:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3517110E71F;
	Wed, 12 Mar 2025 08:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MS+T6aQS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1357F10E6F0;
 Wed, 12 Mar 2025 08:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uR610m5UpNNjupx0h5ky7T1WCGSrVlX/LgxEBXZ94vlvUJ5BLacve0D2ysoYV5guvfFllOftdmNasKHnltG62O0FUfj8OXfCJoXhqQnvjNdZN0K0Pt4Gx8BfdKim/V7BdShNOerUZC8BRmaQMhQ0gffnWvLM38G2pYTPXGqpOWdV7aM1w1UZ3/7235CD5KDe3LKK2/p66XaM5WExTIWW6J1iSTSTvlfQKPVnqhNjb0Gg92x8GV6L0mMwkgrt4bieueGSktKAEWIVZcab/P5+12cNBxCB76o7Uo5DCzb3NpM9YW7FxeF7A11sbzQSLWJyJxzljbRzW7Exg0ns6PNVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AY94lRvuqKpMBB+99/D8+i2taWlqz86z3DegRHiQR9c=;
 b=AuI3xs6Xvhb3s4ATqMonwS0qs9CX4aOSXnXaaWKZIrUdXTKlXOqx1KtVyB5Ra6/BustueG7sbHGaAllX+Wnf0CgvgqANOq0xHYrgIGbHIz+N7z2GyLhiXptQgDFftAMraQKShGhtPIyKym8xhXZc2dV8v9oa0TFgWhV9cROQvDHif6XOYDjeOy1uVqkKSLeOr6QdrVN77fz8iw+WLPcMasxDs/B51lf6G4ZTBmiOT7I6PMIEX/6PSB8jh4vWOxTXZI9v/1KvDyd0c2woHYZewRKC7YRizPxm4HlFgNeyE3ISGJ/caI65xeLWfhD6QY0WWFO++0a6E/8Wmu3jmH+/ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AY94lRvuqKpMBB+99/D8+i2taWlqz86z3DegRHiQR9c=;
 b=MS+T6aQSbGjTjmWcSAs0By1Ma+wBoRuHzvqlQ6iys3Da/H04uB8V6BGjwSpzEQHwK4okFkEWPCH5Wl3e708CGH2UbtVVjSGkmhfsngr7GscrIf7MwU1gFp//yxmLoT7Ql7qe4xkps8Px2iuH+Gwh2RyqGLljpSNdLjGHjM2DyW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 08:11:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 08:11:40 +0000
Message-ID: <5577b032-dae8-41d7-9e30-abba60a22c44@amd.com>
Date: Wed, 12 Mar 2025 09:11:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Remove incorrect macro guard
To: Alex Hung <alex.hung@amd.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 jun.lei@amd.com, aurabindo.pillai@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Samson.Tam@amd.com, Navid.Assadian@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250311171017.3053891-1-alex.hung@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250311171017.3053891-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: acc8a7b1-ab84-411e-9161-08dd613d8458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTBrSm5EZGVyWkJOaGdGSlJwM0JyUUl1TzNxYkMwTUhrcHYwakt2dzh1K0Fu?=
 =?utf-8?B?T1c3cWxQRHh4WVJDSEtFenNLMkNDU1JzKzhKUlJmWG54ZjVTbVF5c0c2SllW?=
 =?utf-8?B?dFVpL0Z5RGd5WGExV2tTTTdWN1FwUHVlczZOYks3SzZpS0p4NU5NZ0Z1Qm5m?=
 =?utf-8?B?cnZjeTV0RFVoYXN0STJoUTdZcXZ6VWF1b29RM0xFVVkyUTJZMnRZMndxeWc3?=
 =?utf-8?B?TVBvYnYxZ3p5ZEtrY01pcVhhU0s2ZXNsZERVVFRjQklkMjM4dmxid05UcjJy?=
 =?utf-8?B?eW9XL3VsSTY2dEVPdHNYeEdsZlY4WkZ1QVBHNVBMYmYxdk5jaDB0OE5mdFN0?=
 =?utf-8?B?UmxCV1FSS2svSlE3cDdKa0VlTWtyOWFnOFNpeVpOU28yYWZreHRMZ3B4Tm1t?=
 =?utf-8?B?NnRiak5qTy9qNGtFbm1PRWZ3NVJvcDh6Q0l6ZGNBdzQwaDZRdTlaenBET21Z?=
 =?utf-8?B?Wm5IbU5mTkZhN003VVZEMk1oNTlRMzRBMGJWc2pYNlF0a0h6ZzQrcWE5SEJw?=
 =?utf-8?B?dTZEbEthYkg0bkFDZGhTZkxobEF1TDgzVklua2thT3Q5aE5mUFlHU2dvMUFU?=
 =?utf-8?B?b2Vac0xGM1M0dDZCWFlRWXZjYllPOC9FMDAwYlYwZ0ZjdmM1eGI2UGdZWFVG?=
 =?utf-8?B?ZTIzdzE1YTBWSnMrK0JNdXU2VlNWUzZYaVh5MzlTTEZ5ZGJoN1ZIYTUzd1Fp?=
 =?utf-8?B?cHYyaTNJcGYwODFnVUVZZkZobU5RU1hsODJQbzU1Y2Q1c3pWUXRkVnVjZ3pO?=
 =?utf-8?B?aTJDbkJVTU12K0NZeVd6V2x5NjA4RW5OMlJYVk5iQkVSckh1OENzWjc5NFNx?=
 =?utf-8?B?Zno2YXJ5dG9RSG5jNEp2TWlGQjFQZWhIMGo3NVhnVmRrcDdwVjkxTDNwSG5T?=
 =?utf-8?B?WlVhc0dSd0RLbXBzZm5uV0lCTjJZaGNJNXN1eFU4eFBuK2FEdWxCQkZlcVVa?=
 =?utf-8?B?MUV3WlpXWm1PcDJaMzlWejRHbTN3dmlybzZLYzN6THhlbkVTaU1SQnY0VG1B?=
 =?utf-8?B?MmtJTWxwSjZGWGVyMXpLcnpMcjJ4L1NJeXhLRDEzRGJCazNxTVAycEszZE5D?=
 =?utf-8?B?UDJ2UGlRZmNrQjd3WEgyemtxeHBQOGZ2ZDRycmM1OTY0N1JQTVRLUnhLeXdN?=
 =?utf-8?B?ZVJXZWhjanFQdW5EUlllcmFpY01odFh0UGZseUx2M0lJbXV4RHg1amhDY3Za?=
 =?utf-8?B?KytGSEVQdkRNRlFOYnloREY0dENwSjk5R1BZWUIzdTErc1FaVkFGVmJ0T0t3?=
 =?utf-8?B?TTV6QWhlc2lTak1Fa2laVkNUVVZrcG9uY3lxVThUaE9VSVZodFFzQkFvTFU5?=
 =?utf-8?B?RjJTUFR3YTQ4Zk5tdTlWYmplNVUrSCs1d3k4cVRYY3cxSXduZExIVTYwZCtH?=
 =?utf-8?B?L3NIdXJoTmhYanMxNDRlakNaeU80NS9ZdFR6aVh1VGZKRFZxL05JUHNpbGRL?=
 =?utf-8?B?Y1F4MUR1K051ME1Nak9zQkYrcHFpcTQrWHdjRGViaDFMSUdPTGhXMHY5MDhK?=
 =?utf-8?B?UmZCdUw3L2JqLzcwdDQ3WmNhb2tIcCtpMEcvcGFGTG5sZ3E4VzNCcUdJOHIw?=
 =?utf-8?B?eTVWZjRwMWFqUEFwMkJLVHh4T2t2eUg1d0J6a0ZZT0trL2NKakRyMW1Za0RV?=
 =?utf-8?B?VkNrY0lIVjhZekhUNlhRVk5reVROOUNmYVNuOGd6VGRBVmJnZjAzOHBNZ0RH?=
 =?utf-8?B?eFNXcDkyU1JMNUlBWUxhTkIwSVlkZ0RSK3NXWGUrdENMdWpQVkZPZWhUSVM3?=
 =?utf-8?B?NVNCTUp2MWVZeWlldWU4V3MvK09NQTZjdU00R3dIZHhSTTBVbUtOb0VOOWZ6?=
 =?utf-8?B?S25keEVrSmhNckJLVTMvREZWUlpPMGRoclF2SVQ0SnI2SzlWTU8wam85R0JK?=
 =?utf-8?B?S01Pcm83eWYxcTJBWm5PODZ1S01IVllQZHlwWWtrZkJqWVBpeUpYaVFhUDFv?=
 =?utf-8?Q?YCAP8Ny+pnE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU1RUUUwSDk4NDFodWZsd3k5dWtYMk90M3pnN3BLN1d3N3lGRUVJL2NMUUlm?=
 =?utf-8?B?SUFnR1huY0tPOXphdW9Ldk8ydGtWTU9VZWcxajZDeTUva0lXYzFLQkpZcG4z?=
 =?utf-8?B?V1FXenJvVjNVdkNhbmc5T0ZpNHpWZm55Y3doYmxRVkZzVW8vTWpneE5wY2F1?=
 =?utf-8?B?UU44a0k0RXREdzIrVUllWUlpaWRSWkRHbG9SbHdJQlJhTmpFcE9La0tYMFZ3?=
 =?utf-8?B?ZnQzanJBYUpVTW1mVTlGRTYxM3hOYWJvT0R5MDBuSEtVZUlSQ3pwaSt6T0Fi?=
 =?utf-8?B?ODlMdWtNRHlxWG1MdWcxZ2RvLzF1U3FZV3hFeGpKT0YrbXRhZmNwZXhkbjRv?=
 =?utf-8?B?VTBmU1JBZnE4RnFRT2tlenFJNFc0VEVhTnAzc0k1cjZVMGJ1K1hhL3RvcjZp?=
 =?utf-8?B?ZjJQOEdkZGZWZHlDazBQb25vbjFTZnV6NmxuUXVza3BTM2hTOTBJTGkwcHdp?=
 =?utf-8?B?UEdSV2lyVEFlajVXdW90MEdJa1JhNkZDSVZ5WlpzemNNUGxqbnpmOUtSOWVM?=
 =?utf-8?B?c1BWZFlYb0VFL3UyMysxQW9uNTdDaDR2UTZLcDEwbFIvbTJjYm5XOTFjZEVR?=
 =?utf-8?B?Tk44WGhrNUsvbUVXSzV5d3RQb2hRcmIrVUsvdVhOb281R0NHbSt5WVN6eDU2?=
 =?utf-8?B?VDZDT2t2U0dYdTNvYU04WUxPYzhUNnk2bTBXNUgydDEvczZYR251Y3BsaVJm?=
 =?utf-8?B?NUR2N3VmTUJPREV2c054K1BFclN2TnQwTnJGd1ptb2pUVUZmaVdselh2OVVD?=
 =?utf-8?B?b0V2azVPRUFINGVnRFZZMmo2UUhsVnpveDZ4U1NocW1pNm5sUU1JcEx3bDUv?=
 =?utf-8?B?d3k4Q0Vua0Z5aEJMdTBjanRvd0o0U0ppRXArdHN3cHV1bHh5eHJNODJpZnFH?=
 =?utf-8?B?VjhqRjRGN2tqcXRmUFllODBKRmlFSTZsN1BnMFJYOTlXeTZlT0o0SGIwTTJX?=
 =?utf-8?B?K2xGU3gzZ2JaSUZsZjRLd0hZbEcyQTNlVVc0ZEs4NjdrbzlrL1ZrT09Vb2ph?=
 =?utf-8?B?clB4V3hnczZRcU9RWWgrRmVYQkZFditld1RVcXNKcUJ4ZDJzcEt5QUdnUDZn?=
 =?utf-8?B?TTIzMmRhMytFT1FNWFhpbTBNbWM5Y1RXd0V2ZlR4OXl6ZlJnaTcvZDY1cmpX?=
 =?utf-8?B?RGliRE5Ua2ZpYmNRYXV1dU82d0ZWYzQrSG5IRy9oSlVubUNabGZmMTF2MEFM?=
 =?utf-8?B?T1dTbUVNdVZKejdRTVRnMWNmbGI3dTkvYytLejl2WU1zZnpwWEtYN1RqaERk?=
 =?utf-8?B?M21UaUlneHdMeUdha1M5bWZaY3JQYjlPUWdiS3JuNHRxQ3A0NnRUaVFkZzd2?=
 =?utf-8?B?aDN1dGZ6TEZyVzRHVHlXczc0NG10VXNWVUtrSHRlM0FKL2JQZm8yYWV5VWFx?=
 =?utf-8?B?eTVVWkc4aStlc0JXYUJtN2xsL1ZTbDZWd2k5VFVlYzJLM0k0NnpIaC92TDh0?=
 =?utf-8?B?M2hYbEVLZDZNOTJmSXNFOUV0ZlZ5TTkvMlZqbDh5enFsUkI2T1hVMHFtN3Y5?=
 =?utf-8?B?RUZicmtiazZVeHFML0o4WWZqT2NCZUNrdDhzbFJJUlliY3VpZkNRSDJ3VjVN?=
 =?utf-8?B?VklIRmxZN0RDWVpOYjF4aGg3Yk02Zk5Bcm43VUlUYXVFaE5yRkxwOFRka3gr?=
 =?utf-8?B?bWJkN092WVp2M3VwOGNmd1ZNd0FndlFZZHowcmFjQlhSMUk1TkJwMmZQUFZG?=
 =?utf-8?B?NTc3dnorS1BZYkFVdXU4LzhMZW5WTGdvSGhwa2krbTJMZi9uQnl3MEhpT1Jn?=
 =?utf-8?B?WG03MDFneVBMbmxXd3NWN0IzZTZXRTJ5N3BFVVBpUk1nemxmdzVRVnlnSDRq?=
 =?utf-8?B?ejdnN1NBNTc0aFl5TC9wQVl3V2RGSmcvZmt6TnBxZFpGMjJadSsvakZOcEZ2?=
 =?utf-8?B?SUl5R3UwZUVHYVhLVDN0ZjJkWXM2b0xFaU9VSTFqRzJteUxKdlI4VW1nU2Zh?=
 =?utf-8?B?UHpNRHo1RjNvSXprVjRYL3hJTExQMGJqSjZKN2pFaFZvOVhLaU5MSUR1clU3?=
 =?utf-8?B?U3d6Tml3MWVlQ09jM2ZLN3Rhb0tkWXhDb1RFa1ZaUjRKazI2RlRLOEhqa1ZB?=
 =?utf-8?B?cjdiL3QrZlhWMFFUR0k4L1ZSZDIwNmd5S3ZKOXZ4a0Y3VnkySzVJTEZnVTJy?=
 =?utf-8?Q?uAdj4kZe8jNyrg+mOsDilb/rO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acc8a7b1-ab84-411e-9161-08dd613d8458
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 08:11:40.0564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0yiMTdSVJ7UE7kXImczCGogbIqHdq9e4/1XrjcmghOW2tn7mgCAqJPuoLhAVPpz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6134
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

Am 11.03.25 um 18:10 schrieb Alex Hung:
> This macro guard "__cplusplus" is unnecessary and should not be there.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h b/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h
> index 145961803a92..d621c42a237e 100644
> --- a/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h
> +++ b/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h
> @@ -17,9 +17,6 @@
>  #define SPL_EXPAND(a, b)          SPL_EXPAND2(a, b)
>  #define SPL_NAMESPACE(symbol)     SPL_EXPAND(SPL_PFX_, symbol)
>  
> -#ifdef __cplusplus
> -extern "C" {
> -#endif

Just double checking: Is there a closing "#ifdef.. } #endif" at the end of the file?

If yes then please remove that as well, if not feel free to add Reviewed-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

>  
>  /* SPL interfaces */
>  

