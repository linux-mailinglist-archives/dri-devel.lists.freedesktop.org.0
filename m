Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4128A961F5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 10:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539C710E53A;
	Tue, 22 Apr 2025 08:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LoZ4M0qV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E12F10E18C;
 Tue, 22 Apr 2025 08:38:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjLV6CM3he3tS7+97o/m5gLhN/UFLmXxwgT15lGXiTLiPkv0Yesy/lU3ss1rFGwjP4ff2vzqIfezB/Zt4BO4AVUW1Rh57u31k8pM1Pj9ZErTzm7SLDb58ZzOVL9lVFPBmoTD9gCTTqAvKwnDPoFsuRMCSe3csTBZ7V2e3QKHeNn67InnLsL+mKd09EvCZOrg5mtEprc2nLvfAP+KfrkGMwcZ7IZQG5uP2dx1JeuM6J8iB+jaWJSWAX3PqJd/SfWS1V/1ACTYXY57DLbWNMRyrRz21AXdpNMUdG59bnqqwXZXp7qo6P1XCfqQZ+iRTbZ4uib8SMAB6LDa3k32wXjmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXkgf87z5er8dXjtNHH/HRWg9l5PNb6Uzfdv9xtBQ0A=;
 b=n14vn0i63fsDup5VcEkSPgQL1YNvTXBOXCecRInHQK6u3VV5Geui8h9KIK2U2jRom6XECt01VU28clEQTSKSApLEDS0xF2iDR3iI5NGROc9XN3rChQRTbO+7m1Gv0hv7hLEelj6lstKESOdqNOCtrllTLsOc5+z65GZuCy0cYYIk3Xc6n0dXz4fgsZzGprEdb99hE0Zjfm6WH8ixiEedHl51j0jIzYq67HM2/aA3pCO+xEvDBzf7VIhxNryVp9CWKquko15r7JMunTJfwSP/Qi4kjvdbeC/VX2W807gW+urvx/bMv6jmD8bvVN3j2mdyLTZu+c/ifNOylqpwBkVtTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXkgf87z5er8dXjtNHH/HRWg9l5PNb6Uzfdv9xtBQ0A=;
 b=LoZ4M0qVDVYI7TS9YxJkaUfTpIAZgiDUkXm9PXW0GjClMWuI/PiK5UMvfXeBbqmtEh0C7dpsR1rVT4bqOARGhpr2Fd0gH1T3lips5h8BgRIVMUrzXYxCcZEo7ulEFtn+2ayVUGOFF5hM6UKcCFlEx7oOLktF7JDg+UEUdTZgaUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN6PR12MB8489.namprd12.prod.outlook.com (2603:10b6:208:474::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 08:38:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8655.025; Tue, 22 Apr 2025
 08:38:04 +0000
Message-ID: <4714e132-e875-4a16-b94b-0d5af0418b7f@amd.com>
Date: Tue, 22 Apr 2025 10:37:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 2/5] drm/amdgpu: add drm_file reference in userq_mgr
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417161042.120981-1-sunil.khatri@amd.com>
 <20250417161042.120981-2-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250417161042.120981-2-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN6PR12MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a484a90-5ff7-4223-a8aa-08dd8178ffbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWtLOExOWGYxTnFjbHh0R1JsM0lZRkkvT3FHbVUwQ3YyWkkwWnhTS1JtZ282?=
 =?utf-8?B?a0tnSzViU3pzcUk2UGQ4S0I3VVp1TFcveXNNN2gwU25tOUxlcFRuaXhlcWdY?=
 =?utf-8?B?V3hrMTVIdTlBL29PbkJ5aVYwSFZiejEzMmZFMEZ4THpoZEVac003djFzMnBl?=
 =?utf-8?B?TCtBeWJnUU5XNllHVFUrbm15dWQ4ZUZlbG8yWkp5Qk4xWkV1VnlZV3hrWm5G?=
 =?utf-8?B?cUYrWUErVmVpTmc1V1d2YnhLeTRTcjlRM1lTYUwyWmd3OFVIRlJlZFZEbFBk?=
 =?utf-8?B?QlhrUmV2MGZobzlSRHoyYkhTUGJMR3JTODZkcGN4dGU4NHpPQjBxWGdCM1VE?=
 =?utf-8?B?QW1ueGVlTS9ITE45aE1GaERaelVlNEp0bFIzc0t5aXoyc3A3NUVUeUNqR1VQ?=
 =?utf-8?B?NEN3UXIyandjcndhVldxTzE0NnFTbDFFTTBMVUFuazdYYW01bXdUY2krYVI5?=
 =?utf-8?B?NjZubWw3d3FvWkVOWUdmVmxxM3REd2Z6UEw5MFVyZFp4N3pWZ2NKYzUxd0ds?=
 =?utf-8?B?S1pJRUhabmRHOGM3UDdZRnlucVZDL01IZCtlbFJkWjlGcEpsU055QndVa2M2?=
 =?utf-8?B?a0cxbjA1VXZjZkcyY3cxb1NQazRUOW5CMldFL0N0ZmovSnBPNGxYMjZRVTBL?=
 =?utf-8?B?L1ZWb2RGZytKdmFlL3c0dkRSNnBNMlFRcngreVc3Mk1CUWtXMzVFTDBMYlRw?=
 =?utf-8?B?MXJhT3dQV3RYbE02Nk0raUY4Zk95K08zQ05ZZ1VyM1lHK0Z5VW9PTmg0aFQr?=
 =?utf-8?B?dUoyWmdtVUpGQjZKMTN2VE9GT0tvRUJ4NGZFb00vOHVuczR5M0dlaWtqV1Qw?=
 =?utf-8?B?NnpPczdqVklGZUZaNnJNMDdxU1Q4ZjVSTERUT2Z2SXFYMXIrTnBLM3h6VVkw?=
 =?utf-8?B?Qmh5azZ2MC9DcVhHT1VnRERpelpodUEzUGQwY3lXZHVFY2ZMUjlUMGRIVHFw?=
 =?utf-8?B?MDBuN241cmZtdUtUUW1wUmJDUGJWOHF0T1E0a0VzWGNkQkVyWHVJWU01RXdV?=
 =?utf-8?B?czdVNVdnVmxwNlovT2tJdTU4MVNjeklLd01pdlNGZzRwU0lVaHhIUy9velZl?=
 =?utf-8?B?S1ltNGRhM2p6ckhNckFQZW1GTDBxREJxaEFHT0R3SzYzZUZWR1FTbngrTjl6?=
 =?utf-8?B?Y2puc1FEcUVKYm1IYXArQnVNQ0NsV2ovT3lxOHNmSkdUNFZzcVMzeXg0NGJB?=
 =?utf-8?B?cnBqSlF3QzIveFZJY1hrNUExVTJWOVhEMlhWenhteGJYcUs0TzRVYjc5NjJZ?=
 =?utf-8?B?eXJXQ0IxcDE5VjdZakZ5Um04dU1TNzhGSmpzWUR0NmFwUXJrNnowemZSNG5r?=
 =?utf-8?B?TGhXQ2Zwa3RVcGI2SlZSZ0lZcjVrbVNUckRxUkp5cnlXNFV0bk54ejdtdFlL?=
 =?utf-8?B?WDlnbGEyMVVPcHp2Q05TZnlsSXZ2V0kzTVFoZGM0T0tvUWU4WTVPRkFHRHBh?=
 =?utf-8?B?bFZndWY5cVBuSWFDRmg3elF2aGw5UitmK0w5bFdodVVjMlVDZ0FKejRaTUVu?=
 =?utf-8?B?UnBoUjRkcTBFOThYR2hqbmg2RVlrWUhCaUZxY3I3cUJOaHdqTUdweWxTVUVx?=
 =?utf-8?B?Z0U5aXc1eG5KcEZlaEhkNlJJMjU5TDVxZlRRVGRFNmhzUGNWQVkyQzRIdUJs?=
 =?utf-8?B?TXR4eFBkWFZFeTdmY2U3YVNHY2JlcUVmU21mSVE4ZEhFY0dKV2k4QmFqcnpD?=
 =?utf-8?B?c1ZhbmhJdGdvSndYZHQrTGJ6K2MyN09iblF4N3VFWDg2UW9kZzdNaXdlbWdm?=
 =?utf-8?B?UG13R1ZpYU04REpPTXlLZmdOWFdjZEZ0RUdUbGp5RmxKMHNCUFV0YkVhcjNi?=
 =?utf-8?B?Q2pydmJySGFpWW9SUmIrTmsxOHcycjFVT3VIT1hKTGxRSDY0VDU4d1ozdFBP?=
 =?utf-8?B?SmIzOW9rM2pyTmhNS3hEalgxM0UraHU3SmQvU3pFbFdJb0NPbU9oaDduZUpX?=
 =?utf-8?Q?np8scjp7srM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGVaVEg1Nm1tSFhaaFZWdEV1b2J1aExiZjhaVFN5bFlzeExsclB0YWdUb2RW?=
 =?utf-8?B?N2ZDVEZYS2VmUXhCcUlLam8vUEk0MEhPNWN6cmQ4Zy9UTG9LYldJMnRyUnpM?=
 =?utf-8?B?cWZuSUIxbFpQOHFQYkJUV0pRYmFsYURodEVIZlFnQWpaSVAyUTJvdU1OR25N?=
 =?utf-8?B?RktKblprcnJWeVlsSmR3eWM5UVRPS1BhQitzMExtQmx6WHlvajBNTTRpWUxX?=
 =?utf-8?B?SE1VT0xwcEJERFNrN0lqY1k3ckJxWkUyZ2FKV2dCcXZUdjlidTl1WDR3RldH?=
 =?utf-8?B?U0syQXQ1UDM5SDl6Y3lwK1Y3WG11ZEpodFdEQ3daN0xORTQyUlB2REFOaUEv?=
 =?utf-8?B?MTZSTnFRcllYV0FvbkFtK2Q5YVp6NzZRUVNsMlpTZ1hrcFdFQmxpNkViMDFL?=
 =?utf-8?B?TWIxNWZlVlhreDJJMEhtUXJ4VHhjeHhPUnhyK0liUlFTNjhHRTNXaEdFdjlN?=
 =?utf-8?B?cUJxQ0pPZ1laQVlPdEFjbFM1emhjc1FpcHBHbzdrZU9ENGFEZ0c5RzZWc29K?=
 =?utf-8?B?VyswbUpxUjNtMkZCRkNBVTVuczBUc3VGMHdxVTA1ckdvRXNMT3NJenNCZ1Uz?=
 =?utf-8?B?ek40U1FGQ3BTUS9Icnc2Qm12TW94aktpM3RjZmhBdU55dEtGNkJndFhSN005?=
 =?utf-8?B?cVV0NlpkaUxMOC9qOG9PU3VBRG5yTm5pUEJCenV6ZlpiQnhnOUYwd0pwdzlY?=
 =?utf-8?B?bVVYd2NvN2VvWmNWVzl3enRxWkVOaHpGeGpJWG9wMUdFUUEyTFZtWnR5Mmg3?=
 =?utf-8?B?NEQ4eUUzUmgrczcvTDVKUGlJNklvRm5sbWdrRG5EQlhJMEl0aEgwbjlsMFpL?=
 =?utf-8?B?OER3a2NyU3pkVjR1VzVveGFOUmdUeVVuUXRsaG1vOUpSRkt0K25rSGdZdmFI?=
 =?utf-8?B?YUE3VGdFKyt1T3pSa3FvdUM2TmMwWE1iQjhMVWptUEo4VWVSMmFYNTRXbHYx?=
 =?utf-8?B?UE0yeFFMMlgvOEN3SnZKZHZKbjdUMjVxQXZEMmJqZlIvelFBWlRrV2dqbko3?=
 =?utf-8?B?SDNnbURyUjlXZms5cURhdnpaay9WRzZLc2xVQzlzcDJIMlo2WEwxbmJmRmxl?=
 =?utf-8?B?K3JHSWdMZFU4cHEvRXhMZG1PMFVzMHl4Z3VJYW41Y2dPdTkxdlNCOXdiMXpC?=
 =?utf-8?B?QTFxcXRlSnBMZ25wa2s2a3N1TXFla3MrZVgvT3AxS01HWlVQY1VvNm9ITEhZ?=
 =?utf-8?B?Nm5odjBxM05ocDZoa2txMnRRbFFSUFRZR1FCRlEwNWlSMGY3dlg3MWJxQjhY?=
 =?utf-8?B?Rnk5YU9Oc0Q1K3gwU3FnMDZZc20xTE5id2ZHQVVRZ1Z2Q20yUXhIcnhDVDNC?=
 =?utf-8?B?M0xsL0lDRHJyV2VLQ0Z6ejJHc2JabGtWVDBiOWRZei9GTWFnUXZ0REVZR1pk?=
 =?utf-8?B?eWdUUHFmb2c3YzlqOWl5RXdHTmw0RG1qR2xDcmxtaENyeVRhZ2YrTmNMdzMy?=
 =?utf-8?B?WTBxTEplanZwS01lQ1Nsd05ERHMraDY1a2RWYXVaZ09FVjg2V0s0WVNrbi9l?=
 =?utf-8?B?TFNKVDdaUmpFUiszTURoY1Nmak1iaXNCV1R1YUFheWpIUTZlTDRxSWZVTEU0?=
 =?utf-8?B?YUZZMCtPcXp6eksrcGNEQzcyZHBZV3EwNHIza3EzbGpBUFRIYTdTUnNiTGVw?=
 =?utf-8?B?WWpIZGZwTnd6Y2dTZmhQZHJvU3gvWXArZDVRUVVUYnFCdGlwZ29UZlVEdGFm?=
 =?utf-8?B?Q3dmZFFyY3B1Rmc5bFNGZUhUZFpPMyt1SWVKdlBEV1h0aVFBUHZLRm5WalhJ?=
 =?utf-8?B?c1ZOQjVzeWNaYkx6dHd5TEJiZWp6L1NYTjc3V2hrL0oya1Nja29DejdsdG5T?=
 =?utf-8?B?UjB1YXVMYWZ4d0lyWDlwL2VHd0hWV3cva1djSEtEVE1JTE1FdWhOdC8wT25j?=
 =?utf-8?B?SThNcTl5eHZ5VDkrRkoybTlqTU4xYjRicXFaQ1QxRWxzdHZjc3VZem1MSUVl?=
 =?utf-8?B?OTlXa2JOYXlhMVpoR3ppQVpSOEQ1WUpmbVVJdVZ5NHFxMHVIRytrMVUrRU1H?=
 =?utf-8?B?SDFzUXEwcXNocG5RNnNPRks3RVowNWVVdDFPUlcwU1J3ZEpoY0VhS1hRbUtX?=
 =?utf-8?B?M014SzRSdXJ6MUJjZGlqN0tKV0x5M1V6TWlzY3NIblJrM0FTdjNYMTlwOEV6?=
 =?utf-8?Q?SFCeInAMvoLawZNOqU4pzevUd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a484a90-5ff7-4223-a8aa-08dd8178ffbf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:38:04.7091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQ/xYoaNjAEOIEPpd9HUAbH+HiVp8AH1dY9Vs6ZsaZ+QIIlPJjztZhqG/ierLf9P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8489
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

Am 17.04.25 um 18:10 schrieb Sunil Khatri:
> drm_file will be used in usermode queues code to
> enable better process information in logging and hence
> add drm_file part of the userq_mgr struct.
>
> update the drm_file pointer in userq_mgr for each
> amdgpu_driver_open_kms.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 3d319687c1c9..3de3071d66ee 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1436,6 +1436,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>  
>  	amdgpu_ctx_mgr_init(&fpriv->ctx_mgr, adev);
>  
> +	fpriv->userq_mgr.file = file_priv;
>  	r = amdgpu_userq_mgr_init(&fpriv->userq_mgr, adev);

It would be cleaner to give that as parameter to amdgpu_userq_mgr_init() I think.

Apart from that Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

>  	if (r)
>  		DRM_WARN("Can't setup usermode queues, use legacy workload submission only\n");
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
> index b2da513b3d02..29c1360d8c8c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
> @@ -79,6 +79,7 @@ struct amdgpu_userq_mgr {
>  	struct amdgpu_device		*adev;
>  	struct delayed_work		resume_work;
>  	struct list_head		list;
> +	struct drm_file			*file;
>  };
>  
>  struct amdgpu_db_info {

