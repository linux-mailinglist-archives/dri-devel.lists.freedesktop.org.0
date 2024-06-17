Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8919090AE10
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 14:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE1910E388;
	Mon, 17 Jun 2024 12:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l9r3XDfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8F810E21B;
 Mon, 17 Jun 2024 12:36:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0oDZgViHHgGhWiTmqLIfMDs4o61W1R3GDlCSButOGwzJTlczz2TXs753SH0giGicXUqPDtxTYKisRVl1nvtNASHF4yvDuPo3nRP6w3lAHKFtWblM+J3QkRbqhXgOSNLVtMwUvtR4kzlmeraCE9hos8vI6VoMZPl2Fny655kO0BVKKPXcarW4Qss01kPsuutrkTO8DfaPnN0fskTp/bc52QuB46tdMLwDEF8DybWZAKY6cdPP2cC5YbrWzny3CkcMnkDCfGXTsGKej4hXoqvas/teaZoAAS4uC4/NZU1ChZeulVkMK5QmRwqMf7eSCsin48gD+rGQeyTpwvWRFqlyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEzr957Nj0m+9CykxdJ6HI3TcQivfPmYB0ENEvk3hds=;
 b=hlLtLQ6O1AW9AJ6v+Rg6l1Vbfxl03djxY+gcDoy0JWJwXHLQzSIm6avRuypgBbWgRB5GqhxnoMNaEFtcG65g1tJ/7sdj42qbY9yWAJE5xPjcmXl75aAkPaVYLsGLjJUMJFZBBAf3CFbCvq/kHpz5P/NP7l/O37qMd0h0hWJtBtRGcHkWkpDLCrZxGuDASUknVmC+2hojsLIHKSSmXDG7TRPgQG6w5iHdi18ysgvAuza5HW9KpE0maT8PtjkiN7dHZk0p+n+e273593X+Y/5HVvZTpMChh1S4Mc/n7q4OEfJaXEI5gfgrE+aowCwUjjW/Trj7G/v93DotQOi192NdjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEzr957Nj0m+9CykxdJ6HI3TcQivfPmYB0ENEvk3hds=;
 b=l9r3XDfnt225jsgeXKcNM8LsAESCisj4R24+MsltIn5iCtdbS7n4Lv2w9opzXXrsLyb6d6oVmDJLa20zVqAANvN+loWhcvtV62xU7iQ5orw414sM1Twq1EzyU5bWbwTMVn4JafnEKAeibSl54hm0h1HEM8MUGLk1iWrzwWaqerk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21)
 by PH8PR12MB7109.namprd12.prod.outlook.com (2603:10b6:510:22f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 17 Jun
 2024 12:36:07 +0000
Received: from MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105]) by MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105%6]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 12:36:06 +0000
Message-ID: <88337509-3ad7-47aa-b70f-5294f7f1e486@amd.com>
Date: Mon, 17 Jun 2024 14:35:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: make duplicated EOP packet for GFX7/8
 have real content
To: Icenowy Zheng <uwu@icenowy.me>, Alex Deucher <alexander.deucher@amd.com>, 
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
References: <20240617105846.1516006-1-uwu@icenowy.me>
 <20240617105846.1516006-2-uwu@icenowy.me>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240617105846.1516006-2-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To MW5PR12MB5684.namprd12.prod.outlook.com
 (2603:10b6:303:1a1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5684:EE_|PH8PR12MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: e6afe768-25e0-48ce-ff69-08dc8eca0f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2ZTQW93amJNbEtDQ1pNZk5xRzExeWI0Uyt6OGdlOW9DV2dLbGM1V2R5ZXVC?=
 =?utf-8?B?ZkpKY2JDbVh1cTgrVHl3NTFpdWZ4N0IwMnBvMko3MXlaNzdOZ29CdERDemRr?=
 =?utf-8?B?a25rd2lPNE9vbGh4ajF1dVR5amFtY3VZcE93VC8rUGN3bDljcjVUb3c3YmNz?=
 =?utf-8?B?bWxBcmxQbTJvUGNLbkZHQVlzdHJsb3RjNDd0cGZrMkNCUXk0c1ZXRCt3MmJM?=
 =?utf-8?B?a3BoNzZUWTFrTEpBNDhwZDhTd2EycTMvUVZvSEdSVUdmUkN2Y2h1b2FaY01W?=
 =?utf-8?B?RGEvT29MMEoyeFNjRkNiRlZVUHl0b0ZZWDNXYmpSVkl1OU52eGR2UmhYb0Zh?=
 =?utf-8?B?N1dsY3FSenFyNDA4R2tUNmFxWXBJdUFBUkc0eStJbHJjekFVZUlaZ2diUUVR?=
 =?utf-8?B?OHdGbUpWclg2eGtuU0JCMWpZM2hrYWJseFlnQlUrSkwxUUhrRGtFc1FjZVhX?=
 =?utf-8?B?RGl3eG5vNXlwUEp3U0lxbTU2WTZKQTVCSDN3NG45b2RlWkNoTllaaWk0akZw?=
 =?utf-8?B?d3p4MVNJYysxeE51dCtqV0V4eW5pNWhLeXE4d2o0ZEU5WXo0Y3NGeWlZQm1r?=
 =?utf-8?B?OENvTGJ0bzFUdjJDOXB5SE9jTUlLWDRjOTN4bkNWOWthOGdnNzdXSmJXcHZQ?=
 =?utf-8?B?RWpYZ3RPWkM0aVQvcXJtS2UwV0hnTG9haDRQQmVqVEV4eElFTmg3UURoRjI1?=
 =?utf-8?B?SHpBeUF6OWtGZzJ5TzA1OVZaMEdnNVFsd29hR1lMOC83QkltOVUxT0k1dVJM?=
 =?utf-8?B?a2ttdlhuNkxwY3hkbGp2ZHN5RlhVYkRMSjF4djF0UjN0L1ZNOEZja0VYMlRO?=
 =?utf-8?B?blVlaXlkMGdqSGYvZVl3V2V2UXpXejFGY0NuSlBGVzBlWHFJT2lpTTlYL09s?=
 =?utf-8?B?WVNOVmU3MmRnMVRFL3BadkE4ZXkwbmZEcVlWYW4yVHZtN0M3amNwZXF3dUVl?=
 =?utf-8?B?ZUhBZkdCdUg5amx0TklGR0RTNmpVTFpkanprT0xoc2FYdTJ5cDdCVDA5TzBl?=
 =?utf-8?B?RHBCb3Z3eFJIbE5zVmhRa0F3Y3QyYzQyWGpnejRkOEZPOHNaV2luSDlwNlIz?=
 =?utf-8?B?Z2JITVVRR24xMWg3dFgxeE5CSFMyclk0enlzTUdMeno3QmVnR3FLUFRqbTZs?=
 =?utf-8?B?cFNmbFJvQzRhV0xQMklwcG5laVZUazFqZy9NTFFsbG84K216dm51NCsvbHpW?=
 =?utf-8?B?Snc1dUxIVmg3MkwxUUNOZnE1akhoSHU0bE41UlBTU2MxSXVJU3pFYnJFdEhL?=
 =?utf-8?B?NTdkNEFna1pCSDN4anhwN0l1aTl1V29UTk01S1RkNUV4K0ZzNUtUSUlEazZp?=
 =?utf-8?B?L0w4RCtZcWpjeFh1cStldVdld2FLZC8vYytxUk9ITmxSZ25aS3hMWW1raXJs?=
 =?utf-8?B?NmtPTndIRmk2YnZwcjBYYVpYRW5wOUoyQmYwM2RMc3hOVjhReHBoR0pyN0Mv?=
 =?utf-8?B?L1JLb3RETldTTWNRZDRBRGtDNlVjOEhvMzRBNGdObUVrNlVRTFdySkw1bFox?=
 =?utf-8?B?My85dVdNSENIN1l1QUdML0FQMkw3ZkhpMU5vc2tkTlFaNGUyd3YwVVUrSzdX?=
 =?utf-8?B?U1pVWDE3bVRiNWhuWFdodGxaSzU2dkN4Ykx4R0FHNFdEMUszQ1ZVcVp3bjYx?=
 =?utf-8?B?clZiY2NRSkZnVVVOR3ZwOS9hMjdQYk1TRTNiTEpCUTNBalFmblRKTEFMMVR6?=
 =?utf-8?B?Wm1uZFpMc0t2Y1lZWnZzZ29RdWp3TUowNjZ3YXk1aGhMSU92RUtEeXZMWEVk?=
 =?utf-8?Q?5CBHYZDYHf1QzwGrYFSSfP+gLkq+k2TjDXokcN3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR12MB5684.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnlzdmxLek53TTkreU9icEFRZG55OWtIaldHRWI4TU9Relh3NHkrNERIbDNr?=
 =?utf-8?B?UTYzYkRVVysxaE8yS1MxQjBpUjVoNDhtZDc3UmkrbmR2b3J6b0tDOHMvcmVq?=
 =?utf-8?B?MWZPSjJCbndVcmRMRU9hWlhiRUIvUDk1bm4rZEFoaHZQajNMaFlsU2lWWWNs?=
 =?utf-8?B?V0xRL0lDUTI0UnRFMTFDVzJCd3pGcnU2T2trUVRxMitUN0QxYVUycnNBYmV5?=
 =?utf-8?B?ay9uVWhFS282bzg2eXRYYVlFeEJOMHBIQm9EcUxFZVNVckJMMXJXYXlqYWha?=
 =?utf-8?B?SnBtVlFMZUJwT0VNVEp4QURuVnYwQXo5RTBmNVJFQnFNZ2ROZzFlSmx4WFlr?=
 =?utf-8?B?d2FHNWdWYzBvaGJjSHFiWGVncUVPbjJWc2wrMkphOVlDcDAzWGdnZEJZcnJ1?=
 =?utf-8?B?WjBQaTQ1YVdYTjYxcUtqNjRMMzMxSGI5QVl2bmpQWGRQbTRzWEk0cXExWkc5?=
 =?utf-8?B?NGNoNlRJcFZJZGxsakdSSkdLRW5EWDh4NUoyT0psNjM2eXlISHYzVzBJKy9h?=
 =?utf-8?B?Mmhxb1VuZXFxQldJSjhOWUwxY044Mld5bGVMSGVyblMwUDE2MDhjQ1VTWDc2?=
 =?utf-8?B?UHlsZ0x1SEkwZ3c5VHVwZ0RaZGMyNlJ1ZlJyNUVHTTJsUEdiU2NCL2hOZ3Fp?=
 =?utf-8?B?N0QxWHFyQVd5QkNaTWhLc0N1MVpLTWtwREcwRE5DcjlVVW9TWDFlejdCRTZw?=
 =?utf-8?B?U01ZcjRaVFgyUFNlMkZCenczUGJsdzRGcVJpZzhla0djOURzNUJXK0x0MUNO?=
 =?utf-8?B?azhveWNBNDNYSTFzSXB0TUY5ZkhRa0xQWjlDdHhKallkTXpFSmFoNDZaNFhK?=
 =?utf-8?B?aVZhNkpCb0lLOGJ0ZDJpNmVRb1E1MHVLb2ZEa0JjbVRyeEpUdExPQldLeTFa?=
 =?utf-8?B?RUthTEhuTGVlSXRMUHJ6UUZIR29ZcFRXOTMzMytERFlGQW1GalVJYXdHL2t5?=
 =?utf-8?B?ak52UkNLRTNhZ0pqSUIxU3lRb0JvK213Vng1V1ZlaDB0d0JKVlgzOFNJeUE3?=
 =?utf-8?B?N2pqejhac055Zm1nNGk1Q1NoSk9UNjI0OUVHSUVuVEE2RkN3alRicDhFRFZq?=
 =?utf-8?B?VzRkOUhPd1Iwb1ZVTXRrdWZOWkJ2SVZmOGk1cWVWK3JKRlAyOXVUWGpoZjBY?=
 =?utf-8?B?Z25MT29wZ25EYUhNOVhLMGdSbGRra1NTYWcyZlNaMUhtM2doODBObkdsYUhV?=
 =?utf-8?B?N0dwVWRsRWNSckwramZ1N3Vqc3hiaC9MRzViT291RjRpNlJkYzJ3MmV2VERK?=
 =?utf-8?B?enhsRjRPVUxtVysvUWlqR0NrT3NBaENhTkpBd1NORVQzUDhDTGtyNWFnTksz?=
 =?utf-8?B?bTh0aWw4ZERCcFFDQVozazg2cUZmL2l0Vkg5OVAySlRJUkdSQVBBWkR3cFdR?=
 =?utf-8?B?QVh4NW12WnVqYVRONm9SdDJOU1Y4SXpPdUFzRmNOL0FhK1VJcXdGdUNEZnpV?=
 =?utf-8?B?UW1mNUt0clozR0VMTVZ1azNxMGdWSHBnTjlic1hFQ3M3SW9pUUtzN0g3VGpP?=
 =?utf-8?B?MzhCNGFpUXdCZU94TmJCNm1YZUZ0NFN6Tm5RWGdCVWlaazhJZGtJdlVqTFVy?=
 =?utf-8?B?cmtDNEhMOXlOLzRMSVZUcitWd21rT0xPR25sWFlRQlZpN0VhMStwYjZUSnk0?=
 =?utf-8?B?SUppQnVGTVlwU2poeVJ4aGJaMkxweU14ZFhjZmNBSFZuK2t1SzE4Vm55T3Jn?=
 =?utf-8?B?WDRYS21NQVRGU1cwU2NsY1EyNzJnOGcveWpBbmc3MnhPOUgyMVcvZXk3MmY0?=
 =?utf-8?B?UTBMWVVaK0F5Nmo3RzhheGJiMGJrM2hydnN3azcwN0RrUTBvcjRHV281N2hx?=
 =?utf-8?B?U2ROWlN0RUpnSTdtNW9nbHRmeXhRazJNL2tVMCtzT3h3b1BxazJ2UitkQjVi?=
 =?utf-8?B?VU5RL2Q4ZzJrYXk0VlRNamtDcUFjU3g1R3VRd3Zka3cvTzdnMXdvMnd4anZH?=
 =?utf-8?B?OUlrcWhNc3RkVFFLU1dWVVV6bCthV2NsME1DRktjK3V2UDZkekVIZkRKd3Rr?=
 =?utf-8?B?N1doN1FkSHNYQ093S2RFSERBd0I2bHNLMnFOVGNsQ3Zzc2QvS09YOWxUMHpY?=
 =?utf-8?B?S0ZmSWtTNG11aDlXM2J4T3kzczBYQmd1YXRCQU1penBLemxFR1lsRWE0SXI4?=
 =?utf-8?Q?HeLxAZHA8m/CsV0CKdJBpR57Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6afe768-25e0-48ce-ff69-08dc8eca0f03
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5684.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 12:36:06.7847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjogj6N9mNcZpEe8cbZRtK1DJijTG4c5k3T/O01rvPfz5Sm5zI0pE9eRtT4Tzqbj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7109
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

Am 17.06.24 um 12:58 schrieb Icenowy Zheng:
> The duplication of EOP packets for GFX7/8, with the former one have
> seq-1 written and the latter one have seq written, seems to confuse some
> hardware platform (e.g. Loongson 7A series PCIe controllers).
>
> Make the content of the duplicated EOP packet the same with the real
> one, only masking any possible interrupts.

Well completely NAK to that, exactly that disables the workaround.

The CPU needs to see two different values written here.

Regards,
Christian.

>
> Fixes: bf26da927a1c ("drm/amdgpu: add cache flush workaround to gfx8 emit_fence")
> Fixes: a2e73f56fa62 ("drm/amdgpu: Add support for CIK parts")
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 12 +++++-------
>   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 12 ++++--------
>   2 files changed, 9 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> index 541dbd70d8c75..778f27f1a34fe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> @@ -2117,9 +2117,8 @@ static void gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
>   {
>   	bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
>   	bool int_sel = flags & AMDGPU_FENCE_FLAG_INT;
> -	/* Workaround for cache flush problems. First send a dummy EOP
> -	 * event down the pipe with seq one below.
> -	 */
> +
> +	/* Workaround for cache flush problems, send EOP twice. */
>   	amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
>   	amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
>   				 EOP_TC_ACTION_EN |
> @@ -2127,11 +2126,10 @@ static void gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
>   				 EVENT_INDEX(5)));
>   	amdgpu_ring_write(ring, addr & 0xfffffffc);
>   	amdgpu_ring_write(ring, (upper_32_bits(addr) & 0xffff) |
> -				DATA_SEL(1) | INT_SEL(0));
> -	amdgpu_ring_write(ring, lower_32_bits(seq - 1));
> -	amdgpu_ring_write(ring, upper_32_bits(seq - 1));
> +				DATA_SEL(write64bit ? 2 : 1) | INT_SEL(0));
> +	amdgpu_ring_write(ring, lower_32_bits(seq));
> +	amdgpu_ring_write(ring, upper_32_bits(seq));
>   
> -	/* Then send the real EOP event down the pipe. */
>   	amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
>   	amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
>   				 EOP_TC_ACTION_EN |
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> index 2f0e72caee1af..39a7d60f1fd69 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> @@ -6153,9 +6153,7 @@ static void gfx_v8_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
>   	bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
>   	bool int_sel = flags & AMDGPU_FENCE_FLAG_INT;
>   
> -	/* Workaround for cache flush problems. First send a dummy EOP
> -	 * event down the pipe with seq one below.
> -	 */
> +	/* Workaround for cache flush problems, send EOP twice. */
>   	amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
>   	amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
>   				 EOP_TC_ACTION_EN |
> @@ -6164,12 +6162,10 @@ static void gfx_v8_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
>   				 EVENT_INDEX(5)));
>   	amdgpu_ring_write(ring, addr & 0xfffffffc);
>   	amdgpu_ring_write(ring, (upper_32_bits(addr) & 0xffff) |
> -				DATA_SEL(1) | INT_SEL(0));
> -	amdgpu_ring_write(ring, lower_32_bits(seq - 1));
> -	amdgpu_ring_write(ring, upper_32_bits(seq - 1));
> +			  DATA_SEL(write64bit ? 2 : 1) | INT_SEL(0));
> +	amdgpu_ring_write(ring, lower_32_bits(seq));
> +	amdgpu_ring_write(ring, upper_32_bits(seq));
>   
> -	/* Then send the real EOP event down the pipe:
> -	 * EVENT_WRITE_EOP - flush caches, send int */
>   	amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
>   	amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
>   				 EOP_TC_ACTION_EN |

