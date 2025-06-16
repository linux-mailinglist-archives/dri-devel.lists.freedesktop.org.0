Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D533ADA8FE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 09:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F7310E2CC;
	Mon, 16 Jun 2025 07:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xRA55PQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2070.outbound.protection.outlook.com [40.107.212.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3870B10E2C9;
 Mon, 16 Jun 2025 07:10:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZE/+Ju00w2pMKaGhGoe4+oOXqd3wc2C+Bz9x9w8QEF5HsWAe//lgJ7JXlsvcMuU/C/sbcau9Ydqeh8LoQ4dNoFE1YmoxestUFmt7pJXDXuv9+s7C8ix4VITI5oUvIik6h4U5VI9x9LHZVnceAWAxrmbUKDjwig51RcC6XPnI5h5o/AHx5o8pFPDm1iNz15yvV85J+i8CI/13vjRUHosb+DctxsYgZpUEYqo64gSFnzmZ/CAUMEZCYZc3m2YaRPjgmyjgk951RUVfyHfNwlvAdHmf9Ch7KzeMKm92LbPcD9mo7pUXtlZ4gyrTnJ5sCpQFQJWRmopfqymyHp7FJrpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvt4vUxZQiUPAQFNEQihmRV0BNJG+OapgRZQsTSSKWg=;
 b=HJJEDv2kniNg/1BQsOpRT+Or5eaEbLTmRcvQLdmIxE0kcfAVi4BXU8QGyMvhc9hwOhtp7hGe1t4Mfw2D19KKsgREaF9kJH7IQLs1BkF7jG6fGi3Gt53x08+K5TPii6aTjPMDJ6gQshEMyql18nsFaN4yMtUjB8rE6DcCDIDeFxmnGubiiisfGm/fjINVlBYYwqig1UYGlWkRW/RpLTrdVwveYf3zOWQFYMZIqjm7wO2EHc1IPDh9RFNswvqayGtRCq1tq54i1j+dyVlS6Sgv+u6rm6HJj36kwt99Lp3LSsKvmq8IN14F09FRKIqScBBRTFYjbVazPTnjFTxnSA6VhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvt4vUxZQiUPAQFNEQihmRV0BNJG+OapgRZQsTSSKWg=;
 b=xRA55PQBXQTRzF9sWs4MO3NZBtq2rKKjivzD7pPVdID2jQv5anfW0/rlsZQQLrvac1Uq/7e+piPNrvyxllAdVKDX0GJWauHWHolUGbcJS1MIseC8Il/F6i+Wyh4J8DsSwyWRP7UgLVvGfjgh0H8QRfhPF4z8DEGjHz7G91v6OZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8036.namprd12.prod.outlook.com (2603:10b6:a03:4c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Mon, 16 Jun
 2025 07:10:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 07:10:16 +0000
Message-ID: <d2fd1130-5253-4adf-a7ad-560284cc5813@amd.com>
Date: Mon, 16 Jun 2025 09:10:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] drm/amdgpu: Make use of drm_wedge_task_info
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250613184348.1761020-1-andrealmeid@igalia.com>
 <20250613184348.1761020-6-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250613184348.1761020-6-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0418.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: a752f6c7-e8d2-407f-2129-08ddaca4d87f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M29CR3ZDL00wM3FJWU1CWEgrLzdJQXU2UDBmSG96OHcyQ1BjOE9VendDRlNZ?=
 =?utf-8?B?a25JOWxkSnh2WmE3UDZpL0Z5ZWpwZytWRVNiSjA5VVozMTgwUENCMS9ZQVl0?=
 =?utf-8?B?YnhWOEJjc3M1ZG5JczZhdlBXc1R1QXN5ak1NQjZPMHNhSERDMFh1RWxpWi9D?=
 =?utf-8?B?S0hGZzhDZFFJSzNhdkQ4aWRzeDYzWDRXQnFQNEdOVXhTK1RQVHFnOXAyZTlo?=
 =?utf-8?B?THl1Q3ZVc0ZGRTV4cUQ2cXJ2akdQd2RKOWpIY1RvL24rSElUNDNqdlJudEhG?=
 =?utf-8?B?K0o0OWNLMjBSdWExNG1pU3JVbkUwNFRuSDF2UkR1aExnbTlZM1FNbEM1ZHpC?=
 =?utf-8?B?R3BPbW1NS296ZkhQa05idmVMZ1ZFUXJOMWNZcVYzRmxjRW8xUDBES0RmUnlN?=
 =?utf-8?B?b1ZOLzdFMy92ZDJaaDJQOGZ1VllFN0JaSkpSd2d2M1pGL25LNFRLZ2xVeHFi?=
 =?utf-8?B?cnN5d1lxb09MRXp1ckt4Yy9nbzdQOFhVZmlSdVUwTGlhV2ZReGZ1Q0dnNFBN?=
 =?utf-8?B?bWhvMlMrYkJwbGl5ZnlKdHNGdFY0dzRnTncwWi9TeG9QMkZJNml5UHRhdWRz?=
 =?utf-8?B?NkFxTjJwdzh2OERJMjFKV1V0MjFPMkExRENiMXpGbnZFTlFBOFVGcEFqTEJO?=
 =?utf-8?B?dk5IenZka3pwMnQ5ZGF0akM4Vkx2ZzBTcGlDNW9ZRVNBcHVVcGNMYmRVcmhr?=
 =?utf-8?B?WjR2YlhvU0RiOWNad1lCYUg5WnNnd3R2S2p2ak9IMWtVOTJHclk0US9QZ2hN?=
 =?utf-8?B?bktxUVNJdUtmYWg0VVA0eXJGRE5uQmh4RGFjN05vUDR3UU9CUW5sMVdNcEZz?=
 =?utf-8?B?MnlkeExUT0c0ME9mWjZsNXpuNDkzWkZzN2RuYnpRcTB3NkxQc05yMUI0Ty9J?=
 =?utf-8?B?a0pxaHZYOW1NdW9iSGV3eURRdWVtandCVEE3TkdYbkxOWFB6YTIyYWs3Vy84?=
 =?utf-8?B?SEIyS1kyc0Q1dGdxc054NWVTSXhaYzllOUZUY2ROWUlvRzRObmJtRmhVNmVs?=
 =?utf-8?B?SmNGUlo5N1N4Z3pOMFdpSlhGM21WN0JSWEs2a1p5TUdTQUZqZ2lSV3RyMEtE?=
 =?utf-8?B?QTI3eVVnajduc0Vrayt2V1VZTk9WK2pha09raFRUVHkwM2VsTTZ5NXJtUnZD?=
 =?utf-8?B?QlRNdTg1OVBYVGJnVS83aXEvZitacVg4QUlZaGlLb0w2THUrclpVUFM4bWlo?=
 =?utf-8?B?UUdLTzR2SlAzUHBsa29zeHMvMTlycVArS3NhU1BCejcraE41RFpGTDNnNlls?=
 =?utf-8?B?TjlyZnJJRzlNUWFrclpoYVhEMTlBZ3QydDdoMS8wOTFYREdCbUwyMnZuYlBZ?=
 =?utf-8?B?VE54cXhzQ2thSDhqaWdNWWx4RVZLaVJpcXlpa3JGNzNJd3lEV2VIRmJOU2t2?=
 =?utf-8?B?MExHVzcwZjRQZnpISnladXdDNklYTTZZeldJNjQrVHp0SDM2TWxXWHlaOEtO?=
 =?utf-8?B?S3dybkc5SHl5ajd3VllKUXYrbFFSVkVmR2tHUTZ4YWJ3N0l5aUU3bzZ4U3Vh?=
 =?utf-8?B?eWRaTlhxWUdxZHhjTlJDUmtPL29STU5ab0VFVXkvN0ljMlpORzJxeW9RZE1i?=
 =?utf-8?B?TTFGMlJDbTNNcTVXbHk2aDB3elJ2WWxLWGJLcXlNbC81dGVmekhLQVNCRzYw?=
 =?utf-8?B?azV4RU9Eazd5REx5LzI3NUR2YnRPd3k5dkRoUDVWc1hKN1IwQVFoK0E2U2E5?=
 =?utf-8?B?TEN3MENpODVuSFdYMmNxU0hEWkpUSXpoRzYvU0F2OVN4aXV5aFRkd3JnOG93?=
 =?utf-8?B?TW9HWnNjMkJNSEhHbWNxajdJamdiZElXMzFUV2NaMzRjS2ZBNE1lNnR3UnRr?=
 =?utf-8?B?R29yZHVnL0VnN0FaSUFQS2VqbnE1TGdTaXNyc3Y3S1NMZGVraFlxallFeHEx?=
 =?utf-8?B?d0NTcngzTnR3WkdkN2pNN3hWcDZGbXg3WVQrckJicSttdG9ibTNMaUs2OEsz?=
 =?utf-8?B?SzdHOGl4c0x6bU9ZTjhPL0hUM29CejgxMlA0YTBNSDdoT3ZNbm5rKzVtMXVp?=
 =?utf-8?B?NkxYVHg5Y1BRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDQ3ZlV4UFBnVFhJM3hMb1FFRm5OQWFnMk9mR2tPWkUvTWV4SGQ4Z0hoRTdl?=
 =?utf-8?B?aFpoRlhsODZ2RXBWYWZqTXJicEcvcFpWZDZSbUZHbCtWQ0FWREFQQ3FZWnJQ?=
 =?utf-8?B?N0ozTVRLc2N0NFBPa1F3UThzZmZ6aTlKNExoTkVlZkx2QWJ3QURqSEttZEtl?=
 =?utf-8?B?NjZBbloxL0ZQUW55Mm1CRkNWcVdOeWdwRlRWREJheHdrMjJQdjlxMzR6d2Qv?=
 =?utf-8?B?M2VRdzBlUWdSemlpb1lEbVVEd2VNVE5ueTc1MXYyK1FKeFBDMk1NZUtuK0tT?=
 =?utf-8?B?NjZzNzdtVFNWWTQ2SmlXdXA1Z1BPWE5ZUEZOaFprNy9UUGNQRXd2dDlEY25K?=
 =?utf-8?B?ZzhlVklxbVlqaDFvOTVBRW9UbHhqeW1hNVdwcXhWU0cwaldSNnpPeEZEcWlX?=
 =?utf-8?B?ZXZCeHQ5SHJiYXJOOGdCa2VMT0hIT21NZTdOV3RvbURRTmJta0JwSVBVRnZy?=
 =?utf-8?B?ZEs3M0FDVThTa1BIOWVseHo1ZUZpVWVueElZUzZualdGc28xRHZPQm5vM3Za?=
 =?utf-8?B?aEFHM1h5RHdmNWgwUmFCOUVWblNYcXJXQmhKdnRiOXc1K0JOVzNRNTExT3Fs?=
 =?utf-8?B?a0N3V1dVcEhCV3NZNTBWbUFqWnpUSkQ2aWZvNE5Ld0NHTHBZcmVuMitwNVRQ?=
 =?utf-8?B?aW9XR3ZoYVZLbXg5dFZxU3NQcnJuWE5tbkxlbjZuczJzZGI0eUthVHNvUE9U?=
 =?utf-8?B?RHhOWTFySlgrbytEbkJOUzN1ZTNrZkJrcHJXanVFVitCM2V4UzhLSXpaUVIv?=
 =?utf-8?B?a3FXclpyNHlkYmZkejZXMnoyUkhtZlJlbGZwZXZBRmtJVStjZUd6T3YzYXdR?=
 =?utf-8?B?emF2UllJV1lhQTFQeUFkcU1jSnMwUExyOVUzRXhrRCtsa1dSa0tFU3owcGtZ?=
 =?utf-8?B?Nnl0YWVGMi9wanZnbTl0SVBlcFJNeEQ3OG9Zbnk1SW9lUVlCYS9UZXp3Y0Fn?=
 =?utf-8?B?MEI0MXIxR1pCNi85ZEpOcEpqTFZqYVFTY3NiWlVwdXJ1NjVVQjFWUEYwSWtq?=
 =?utf-8?B?bzVSekEzcDFsdW1qaUp4RU5UM1d1TlVzSWRYb3lsMmNQdjJBL3hQNFl4NEow?=
 =?utf-8?B?Z1U0MnFpeUlkTC9LYUU4TlJaS0wzSTNVbDR2MGlwQk5QR2t5OW1kamRJK09J?=
 =?utf-8?B?ZGxZVkhlVEJzSEczSDh3UG52VTdlZ0ZqcGtHZFZxL1hjSWtDQU5oMXhPSVlB?=
 =?utf-8?B?bkIyUmVyNytnRTVRVjBOZFdOOGZHRjk4T3BGbTFUS1ZBNnlheDRsWlZNT0N5?=
 =?utf-8?B?YjhEOG5CZldlcUVwbTNjWFJTaU9PUDhKU1BNc1IzeTlxM1N6QjZqVklYWC9x?=
 =?utf-8?B?VVBYQTBKQWRJVDNJeFZYNzk3akJvcS9DOWtoeFU2OWsyTE1DL09ONytndEh6?=
 =?utf-8?B?eFN2NnFoZGhqcGlGVkVDTkRvWW91bklYYW5GS3FNc3RxRmdQazU3akZmcFp1?=
 =?utf-8?B?eTFWRkZ1dFg1U2k0NENRTXE4dXRqcnpkMUM3NVpSVzhldFFQYVQyZVNLc2JP?=
 =?utf-8?B?dW1rczVmbmlkTTdEQXg0a3dJVzVDdSswdWZaYkNWTUw1WmhJOGw4UzI5dkNY?=
 =?utf-8?B?SHU2bEpBZUlTa09CQWRETlVEREJzWVF6cHIzRTdmOElTR1B3Q2MzUE13Ry84?=
 =?utf-8?B?OWJ0ZUJGd3JFQUk3aDliL1FZTFNDanZYamlMT0d5eGI3NmNidVJ2YXhVQmx6?=
 =?utf-8?B?MW0zMjNBajcvaVE1anNVTDFONXZuMXZpYnFQbEd6eFNCeTlqSTY2VjNtTVFE?=
 =?utf-8?B?OWY2SXVVcStTWUYvRURJMExFVmY1ZmJJQytRRDBjbjEwMmZaYnEvek40VExU?=
 =?utf-8?B?dHpETlVhdHArVzhQaWhmSTFiamlPTENjWDBZaTZwZnRpelA0WXVwZEdyb0F6?=
 =?utf-8?B?TDVtREYvaWZKVXp5NXp0WEg0SjBCWk5aZGpkencrVk81MVhaSzgyaFlsNk1D?=
 =?utf-8?B?RmUySG1hVG5jQlRwaU1iRTR4OFFKTGdCampZdXYybVkvQjExME1QV1pGbzRC?=
 =?utf-8?B?dlVCeGpwMnlBNjZlWXd2ZnNMajRHQzU2OXBwdTlkWWgvZDg4bnZ3LytOQ2Ju?=
 =?utf-8?B?dWQ3b2tUc25KL2ZYVk1KaDZET2xhWFFFdEZlM1ZMRSt5RE5RVURYUlVycTkw?=
 =?utf-8?Q?ia2fDyJjxVGdUyJwzQDBwgdBY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a752f6c7-e8d2-407f-2129-08ddaca4d87f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:10:16.5352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWuQ+KZ6641Or0G5jZGMd7oFdHbz34coIVmlojPRegc61iC6NSrIqHZpAN2OBg+W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8036
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

On 6/13/25 20:43, André Almeida wrote:
> To notify userspace about which task (if any) made the device get in a
> wedge state, make use of drm_wedge_task_info parameter, filling it with
> the task PID and name.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v7:
>  - Remove struct cast, now we can use `info = &ti->task`
>  - Fix struct lifetime, move amdgpu_vm_put_task_info() after
>    drm_dev_wedged_event() call
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 17 +++++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  8 ++++++--
>  2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 8a0f36f33f13..67cff53678e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6363,8 +6363,21 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  
>  	atomic_set(&adev->reset_domain->reset_res, r);
>  
> -	if (!r)
> -		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
> +	if (!r) {
> +		struct drm_wedge_task_info *info = NULL;
> +		struct amdgpu_task_info *ti = NULL;
> +
> +		if (job) {
> +			ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
> +			if (ti)
> +				info = &ti->task;

Drop the local variable and write that as ti ? &ti->task : NULL

> +		}
> +
> +		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, info);

here.

> +
> +		if (ti)
> +			amdgpu_vm_put_task_info(ti);

As rule of thumb *put* and *free* functions in the Linux kernel usually accept NULL as parameter.

It would probably be better if we do that for amdgpu_vm_put_task_info() as well and drop the extra check.

Apart from that looks good to me.

Regards,
Christian.

> +	}
>  
>  	return r;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 0c1381b527fe..f061f691f556 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -89,6 +89,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  {
>  	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
>  	struct amdgpu_job *job = to_amdgpu_job(s_job);
> +	struct drm_wedge_task_info *info = NULL;
>  	struct amdgpu_task_info *ti;
>  	struct amdgpu_device *adev = ring->adev;
>  	int idx;
> @@ -125,7 +126,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  	ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
>  	if (ti) {
>  		amdgpu_vm_print_task_info(adev, ti);
> -		amdgpu_vm_put_task_info(ti);
> +		info = &ti->task;
>  	}
>  
>  	/* attempt a per ring reset */
> @@ -164,13 +165,16 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  			if (amdgpu_ring_sched_ready(ring))
>  				drm_sched_start(&ring->sched, 0);
>  			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
> -			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
> +			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, info);
>  			goto exit;
>  		}
>  		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
>  	}
>  	dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
>  
> +	if (ti)
> +		amdgpu_vm_put_task_info(ti);
> +
>  	if (amdgpu_device_should_recover_gpu(ring->adev)) {
>  		struct amdgpu_reset_context reset_context;
>  		memset(&reset_context, 0, sizeof(reset_context));

