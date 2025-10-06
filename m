Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3156BBD5DE
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 10:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508FE10E334;
	Mon,  6 Oct 2025 08:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H5OAcH7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010041.outbound.protection.outlook.com [52.101.85.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A684010E334;
 Mon,  6 Oct 2025 08:38:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vE+NkdEHX9Bc6L3MKKbQitYbFbJdTYC8SmwXHlnhRBjpD/SX20Gcx9ywMvuAhfp+3MGPMejbFGYPthJcIcjnkYAvzTrVj2JQ/6IhO+HZ/EP7oi8nk7+3IXOFn+X6H8o4Hjx9j7oe0CpNYjv2kvgrrwIKMk3hC9H5XbxcNg/T+h/RoUs6uoWdy5CXyjzqahfMT4Tl+ezNgtMc5OiVQpNFyfsiQkhQEUuswJuZE2MQs9DIKmkhbHcQzfq+XkPfnS5/uCtB67dvjxAlR7QtFLVfCHG3uUozRKzzmZA0KJcjYug45dBEiZa2yEeHTbe7a8A/sMJyK8QMAssMomEEpkNf8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhGC9RzRNKMBoovSWqOto/17KpFL0uBJX9FXLx5uMOA=;
 b=XoClWk4Vo6ymVCubqzXpSrmJYeB3fI0Oq9vb1xGZIMFB3cT6J1WMrA5BT736Ka1oqEHsQPiEnY5cUKWcJey26bCYy3WtjnWVU0qalafzP+CH8aVuu8ftCVQHDj1wL4rc0upH9y/fSyO+56jaS9V64FL3euGi9VUFAY0ObeR9XETR1i0UCtiRshMImGenRJRGRbY8AjE6gQOhcvLo6Fao345t9QO2TLnzgEZ7hYs+eTlhQIqJiFRLZ0SNncxJ35zsDGoFux4jv8PGuxF4AVe6yqzDdYRp6ykBd+zL+vQYqwCvDFP435EENJ2igAm4qXzmWwBMDfWDrUHysDiTg3dzsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhGC9RzRNKMBoovSWqOto/17KpFL0uBJX9FXLx5uMOA=;
 b=H5OAcH7NyagyljuMXCtWCXrKoLcNiUfk7Y3oJP9jQwAud1FO1bmfXNcVBnMxttauk+cM8LvQkCP0XO00UaUn0khqAUVcCzSwTgZZyjj7M8vLPFmgGUHKlC80NvWtU82iOrFuwfP5gOJalNwq4X5n86+czuX7+OcfWsUacVKPw/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB5659.namprd12.prod.outlook.com (2603:10b6:806:236::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 08:38:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 08:38:35 +0000
Message-ID: <b9a866ea-0f67-4e34-bb30-f8e297ee26f2@amd.com>
Date: Mon, 6 Oct 2025 10:38:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 1/5] drm/ttm: Add getter for some pool properties
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20251003135836.41116-1-tvrtko.ursulin@igalia.com>
 <20251003135836.41116-2-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251003135836.41116-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR14CA0027.namprd14.prod.outlook.com
 (2603:10b6:208:23e::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: f98a2a09-5d20-42e7-e690-08de04b3bd16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0hHbzhPVFVOWEd1a0tCMjk1dVQ1M1Y2TU1RTGd0ZU5KTXNNcHBvV3hKMlQ5?=
 =?utf-8?B?SXJNT0prZVVKZE9ObjRYbnpOSkJzN2dEK3BtaWo1SkZxdmpCckExYldWM1F5?=
 =?utf-8?B?Q3ZMb0ZTSUpLZmxmWGRYVkc0Vkl5blFXcmdqVnVFZzNGWnJ5ZVd5c0VoSDlo?=
 =?utf-8?B?K09wdXNWZWV1U2hrcTJtVHl4Rm0zOTBDMU94TTloMnVXK1VWeHRnRkVuNlRN?=
 =?utf-8?B?amlyL1RoWWw4ZDhxT281WE16SlRRc05CRmNhNld2Zzk5aVlvZ0JHaStUV0px?=
 =?utf-8?B?NW5BM0tNTG5sWDBjbzF2a3JjZHh6Y3B0SmxvQXJPcW5PY3F6R0UzdTZSOXdq?=
 =?utf-8?B?STYvVjB6eUswd0JmWnB5bktJb1FJa21EL3BVQW1UQnV3ZGNjMVZGMWw3Q08w?=
 =?utf-8?B?bk4vTUVXbnlaV01qajJybVBYaVZVaVIvWExuR0Zrc1Z0K29CVkxFWGx4RHZp?=
 =?utf-8?B?ZThDNVpucnBJRll5cm5FbGRUSGx6VTloZXcvb0FwZUNLTnd0VFZWYXhJd1cz?=
 =?utf-8?B?YXBQaVhLc1ZVQjhzblBRbjBadGcreVZ6T2VnWHMwS0xweGVBc1pzcE5yN0VF?=
 =?utf-8?B?ZExEbElodGlwdUlHRHhFMFV1UlZTZFpXbm5DcGM1Q0MvRXN0dC95NlpVRTlk?=
 =?utf-8?B?YnpOaWFUSE9qUUl1cU54aW92Q21PMFh6SlEvaGF0R2N3d0NCRDJTcFpMeVZp?=
 =?utf-8?B?eCtwQWhFTThsVW1aYXZWVEtlb3BQQkdtV0xiV0JCU21kVlBUWVUwMGgrbm1Q?=
 =?utf-8?B?K1pxWlkyM1ZMUUU5V1REY1lCOTJDOXFINDJycVNTMld2VHlyTVBtdWl1dmZE?=
 =?utf-8?B?RjFVcTVUZDZoUCt6TlVZMTdMYitSb0JNY01IUWJld0tCVUJ2ZGRwcTNzYk1D?=
 =?utf-8?B?cGpVME41OGxtMmIrd3R5Q0I4SGZNcXhjdlF2L0VOc1dwMGREQWZPdmRZNEhq?=
 =?utf-8?B?OEFHcUJoS2VsckQvNFpuRU83Qko1amVSTnE0VjViZWFtY3JBVmgrbytDZ0sx?=
 =?utf-8?B?VXBvNC94eFVodDFPSytaTDFkcVhsM0llQlllenFOZytFQ0lUKy94MEprUWRn?=
 =?utf-8?B?Vkw1M1VicHJRUUF5Z3BGTE1tejVwTDhMdHpUWjBKSm9rV0sveGNlT2UyQUY1?=
 =?utf-8?B?MlVTRXZwQW9XZDFoTVlnS3ZDcGxKbCszRjhGT2NuWmxHSnd1dnQwdFI3U2VR?=
 =?utf-8?B?ZzRUdzhpOC9Vc2V6ODNyem8zQnpnOGJSOXpuWGYrNlJMYUVKYm5TMWxMeWlx?=
 =?utf-8?B?TkRTMnhFSFk2bk5WOHdCUXNiOGcvMzB5U0hpSndIbDZOK2dheVdudVhVRDN1?=
 =?utf-8?B?TWZQS01nZDRqRU1UdFJLcnVDallqbTVvRGw5dCtOeUhsR2Via25ieVNyMThi?=
 =?utf-8?B?YnBiVk96TnJJeXZKQ2RkRUx2RFBPQ2RKNXZtZW9ITkVLdmZQSWxoMEJHUVRJ?=
 =?utf-8?B?U2lyemdBMVFOWlNKbUs0RmRFMGIrYzRkSm5JZ1hkSjBDcm55UXlUS2xzQ3lH?=
 =?utf-8?B?M2J1aURDT2dYT085QlBvMy96NHBqNkFldEcrT3d1V3g0ZjRoV3RNY2R5cDln?=
 =?utf-8?B?WFlhUG1EYm9SaEhYNTVLVC9hdEczODMwVGNaR3k3bXdJZTJxRDVXSjNEcWFG?=
 =?utf-8?B?Ti9MUTl6d0owc1czNlUxcjVZL2RubDZEMTV1Z3FCZkNKVnl0cWxDU0hHY285?=
 =?utf-8?B?SW1lV1RmcXFYTDRRMy82WUlscmdlblJpNWVaWmN3TFN2SVpqeDNreVkzcURM?=
 =?utf-8?B?eEVpQlUyamRWc2RadGJPaWNoT0tpTDQxSGx1R0lnSUoxcmlZYlVaR0NWUWhX?=
 =?utf-8?B?Z0RUdllsVkp0RmhldmdEUGdVaENPcG85Q1doWjNkWkd2T3dlWDZJMDNZUDgv?=
 =?utf-8?B?enZML3loby9wcStERlo3MDNNOXFjNDdSbStFZXJzYnlydVdjTmI1bm1ocTVs?=
 =?utf-8?Q?SCFAWdD2RSUOsNYwrHcRZ1kNWHq7ygTI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWhJdjl1VnhYZy9TQjMrQnpVeVd1ZHNRd0cyM3NqQXNFRjBFbExHcVloM0FB?=
 =?utf-8?B?bkVJd3dLWFIrYndMRllGZ0ZmYWZ0T2Rhbm5nRml4NzdUS0szMDZIQ01hblpr?=
 =?utf-8?B?VzhUVXIwcTFJTUJHTFE5c2gyd0ZUZ2JjWU9sUmp2NldpTWtHbHZ1bTdxYTZU?=
 =?utf-8?B?bEdhc1VNQ2ZhS28rTDRUMzhpczVpZTNPOWREV0hGU2JYUTZCY0R5QUxFRk5O?=
 =?utf-8?B?M2V2K1Vtc3E0QUErc3dxb1ZpRHB3Q0tUc25RMTJYRFV5Q29lemNDZWd3TGVU?=
 =?utf-8?B?NlVrd2ozMUpnZzB3M0xVZE1VMVlIZUdOZE5saEU5RFk1cDFEQW1wK1BNUjRT?=
 =?utf-8?B?SHc2NWR1RUlFSHYrRldZaGtoQjJhYm5aTy82TTlVRDRQK1RDTmNRVmx1OTFy?=
 =?utf-8?B?Q0NLbnh3WVF3ZE9GR1ZCa0lJelowWFdid0dOK09FeXJvNm9WbXh1c1A4UjlU?=
 =?utf-8?B?SUthOStCVDJMbUs0dE5sN2NiZFZYREhaQ2thME00cHBGa0tyTVg0bC9uUkJE?=
 =?utf-8?B?YmMveW4za0l5ODlQMjdya3dEMjdScnVzTVRIL01raVAwSUs5VjB3dUNaTUJ3?=
 =?utf-8?B?UFlzV0wzSXBjRmFLRkVDRzRHb1FPSWRJcTNCNzFMeWRuWFgrZ1ZhQkw4MjJq?=
 =?utf-8?B?bVpWTlhuVHRJWGtOYzQ4WDYxUmhkV1JGanE3bEZwZFdPcXBIZnp4RHd3OE50?=
 =?utf-8?B?ME1pL3ZpTGxObTBjQkpFbXNzeStqM0ZuM3dOZDVHNnlnbGR2eTFTNU54THFt?=
 =?utf-8?B?YUltbWp0MzJ5SG5tSCs4SzFCNVhoeXBseExPcldvME1LcWVuN0Rwb0lRaUdL?=
 =?utf-8?B?TEo2U1RxTWFrZnlxTUFPbVVXZ3lXVmJ5TG1BWkE4T3hOZUVEeFhCN3FmR2s1?=
 =?utf-8?B?K3VLdnEvait5QVZtWEdUT1Y3b2ZIdHpiZlFNdTJ2b2l4N3RZQkxXMG1ZYzZh?=
 =?utf-8?B?ci9xcXF3eVh5bm5Mc1VnZ2dabHoyMzlUQVJQZ256WXp2Rjc1WlpCcENmWW9R?=
 =?utf-8?B?NDJqMklHc1VlbUJjbHRpdmQrelZUaWRmd3ZzQ01qYWJ6My93OXlEM3JlY25y?=
 =?utf-8?B?QUhPQ0hKaTUrUGlCOGhPUEZlTHNlc2VpQk1yV3EwZ2UxcGRTQVp0K21tRUgw?=
 =?utf-8?B?ZFgwdmIwUzBkaHJCQXlGejdXQUJ4WDVlTnBHcm1CVkR0N3ppekFEK0NDZkVI?=
 =?utf-8?B?VzQvUHUvaEI5dTBBQit5YjliYW9jczA4MFdHdWlwQk9lNzNCSXZXUVpuNGR0?=
 =?utf-8?B?bWIrOXBhQ0RKdHE5L1RLTUhuNGFKdEpMOG1YVUNPSVNaKzhWV3dnWEpIQ3Q5?=
 =?utf-8?B?WVpPQUFjNlVJdnhRTmZPRVBQT1ZjdjQ2c2lsekk1R3k3Ynp5VURQVnRLUVFU?=
 =?utf-8?B?VFFCazV0clNHZVRrTWtXcWVKOFF6TE5KMzJSWXBaY3RXdEpJMFdlbHBSR2NU?=
 =?utf-8?B?L01TdFFUM1lieWtSaHhCa3V4Q0k3eHhjbzFyOHM1VUlwL2ZtYmtoMjE5eTM5?=
 =?utf-8?B?bklqV1djSXRnNWNwMStPdm42cmF3NU5kYld5enVFTGphRFErZDI2cUMrWFha?=
 =?utf-8?B?c3ZwTHBVYVBxM2lLb2VMTzNnV2J4TllDbnduNnBtRVMzSSt2cEpjUmFXQnNC?=
 =?utf-8?B?TnlQMW1NdHZYeVZWWi9OTTEvY3FxcjBaN1BOYkxadjJlek1pNmlBaVlIR2xn?=
 =?utf-8?B?VUo2YnNackhFWTRVNlBIY3J0RTBsQ2QzWERqYVF0dkgxcmR2MVg0TkJHZTBB?=
 =?utf-8?B?MFVOdXRBVkVTOEtqNWxyS1JIcmJiM1dDbWN1eWVtQ01Rd0JNRUd1RFNCNTlm?=
 =?utf-8?B?QUJDcFUxem5vS1k4c1RDZ0F6ODdIUHpwWUJ3S1NBNmlmRjlSdW9ITjltdEY0?=
 =?utf-8?B?NysxNHhsYldrSTZ4T3JVK0xjQ0YwUkk2RU4vd0YwM1dJd1UvQnJaY0xmb1Mv?=
 =?utf-8?B?dmMwSy9qdmgvU29uMjNyVXFKQmVrMGxjVnFaL0tYdlBSdlpQZlZ5U2EvQnJl?=
 =?utf-8?B?TkJvbHRSOHkrVnZ0Y3Jvc0RodGxGT3RmY2tsNVNIQys5MU5yL1JkaHE4LzJN?=
 =?utf-8?B?QVYwR0NUb2VFYmc0ZXZmSVU5Tm9mc2YvaG92UW9UbGNWWWJLdjdKYkh3WE4y?=
 =?utf-8?Q?woqbTbpk3Wch0CkUBH8T+oP/R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f98a2a09-5d20-42e7-e690-08de04b3bd16
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 08:38:35.3668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4URFX2dYYEPwn8nuhQG44rpbvAggAjE3++UNB6B4Y1miDAp3UEBSJR7otckZiKq4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5659
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

On 03.10.25 15:58, Tvrtko Ursulin wrote:
> No functional change but to allow easier refactoring in the future.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 28 ++++++++++++++--------------
>  drivers/gpu/drm/ttm/ttm_tt.c   |  9 +++++----
>  include/drm/ttm/ttm_pool.h     | 10 ++++++++++
>  3 files changed, 29 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index baf27c70a419..a9430b516fc3 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -148,7 +148,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
>  			__GFP_THISNODE;
>  
> -	if (!pool->use_dma_alloc) {
> +	if (!ttm_pool_uses_dma_alloc(pool)) {
>  		p = alloc_pages_node(pool->nid, gfp_flags, order);
>  		if (p)
>  			p->private = order;
> @@ -200,7 +200,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>  		set_pages_wb(p, 1 << order);
>  #endif
>  
> -	if (!pool || !pool->use_dma_alloc) {
> +	if (!pool || !ttm_pool_uses_dma_alloc(pool)) {
>  		__free_pages(p, order);
>  		return;
>  	}
> @@ -243,7 +243,7 @@ static int ttm_pool_map(struct ttm_pool *pool, unsigned int order,
>  {
>  	dma_addr_t addr;
>  
> -	if (pool->use_dma_alloc) {
> +	if (ttm_pool_uses_dma_alloc(pool)) {
>  		struct ttm_pool_dma *dma = (void *)p->private;
>  
>  		addr = dma->addr;
> @@ -265,7 +265,7 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
>  			   unsigned int num_pages)
>  {
>  	/* Unmapped while freeing the page */
> -	if (pool->use_dma_alloc)
> +	if (ttm_pool_uses_dma_alloc(pool))
>  		return;
>  
>  	dma_unmap_page(pool->dev, dma_addr, (long)num_pages << PAGE_SHIFT,
> @@ -339,7 +339,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>  						  enum ttm_caching caching,
>  						  unsigned int order)
>  {
> -	if (pool->use_dma_alloc)
> +	if (ttm_pool_uses_dma_alloc(pool))
>  		return &pool->caching[caching].orders[order];
>  
>  #ifdef CONFIG_X86
> @@ -348,7 +348,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>  		if (pool->nid != NUMA_NO_NODE)
>  			return &pool->caching[caching].orders[order];
>  
> -		if (pool->use_dma32)
> +		if (ttm_pool_uses_dma32(pool))
>  			return &global_dma32_write_combined[order];
>  
>  		return &global_write_combined[order];
> @@ -356,7 +356,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>  		if (pool->nid != NUMA_NO_NODE)
>  			return &pool->caching[caching].orders[order];
>  
> -		if (pool->use_dma32)
> +		if (ttm_pool_uses_dma32(pool))
>  			return &global_dma32_uncached[order];
>  
>  		return &global_uncached[order];
> @@ -396,7 +396,7 @@ static unsigned int ttm_pool_shrink(void)
>  /* Return the allocation order based for a page */
>  static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>  {
> -	if (pool->use_dma_alloc) {
> +	if (ttm_pool_uses_dma_alloc(pool)) {
>  		struct ttm_pool_dma *dma = (void *)p->private;
>  
>  		return dma->vaddr & ~PAGE_MASK;
> @@ -719,7 +719,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	if (ctx->gfp_retry_mayfail)
>  		gfp_flags |= __GFP_RETRY_MAYFAIL;
>  
> -	if (pool->use_dma32)
> +	if (ttm_pool_uses_dma32(pool))
>  		gfp_flags |= GFP_DMA32;
>  	else
>  		gfp_flags |= GFP_HIGHUSER;
> @@ -977,7 +977,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>  		return -EINVAL;
>  
>  	if ((!ttm_backup_bytes_avail() && !flags->purge) ||
> -	    pool->use_dma_alloc || ttm_tt_is_backed_up(tt))
> +	    ttm_pool_uses_dma_alloc(pool) || ttm_tt_is_backed_up(tt))
>  		return -EBUSY;
>  
>  #ifdef CONFIG_X86
> @@ -1014,7 +1014,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>  	if (flags->purge)
>  		return shrunken;
>  
> -	if (pool->use_dma32)
> +	if (ttm_pool_uses_dma32(pool))
>  		gfp = GFP_DMA32;
>  	else
>  		gfp = GFP_HIGHUSER;
> @@ -1068,7 +1068,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>  {
>  	unsigned int i, j;
>  
> -	WARN_ON(!dev && use_dma_alloc);
> +	WARN_ON(!dev && ttm_pool_uses_dma_alloc(pool));
>  
>  	pool->dev = dev;
>  	pool->nid = nid;
> @@ -1239,7 +1239,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>  {
>  	unsigned int i;
>  
> -	if (!pool->use_dma_alloc && pool->nid == NUMA_NO_NODE) {
> +	if (!ttm_pool_uses_dma_alloc(pool) && pool->nid == NUMA_NO_NODE) {
>  		seq_puts(m, "unused\n");
>  		return 0;
>  	}
> @@ -1250,7 +1250,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>  	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>  		if (!ttm_pool_select_type(pool, i, 0))
>  			continue;
> -		if (pool->use_dma_alloc)
> +		if (ttm_pool_uses_dma_alloc(pool))
>  			seq_puts(m, "DMA ");
>  		else
>  			seq_printf(m, "N%d ", pool->nid);
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 506e257dfba8..3b21ec33c877 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -93,7 +93,8 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
>  	 * mapped TT pages need to be decrypted or otherwise the drivers
>  	 * will end up sending encrypted mem to the gpu.
>  	 */
> -	if (bdev->pool.use_dma_alloc && cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
> +	if (ttm_pool_uses_dma_alloc(&bdev->pool) &&
> +	    cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
>  		page_flags |= TTM_TT_FLAG_DECRYPTED;
>  		drm_info_once(ddev, "TT memory decryption enabled.");
>  	}
> @@ -378,7 +379,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>  
>  	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>  		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
> -		if (bdev->pool.use_dma32)
> +		if (ttm_pool_uses_dma32(&bdev->pool))
>  			atomic_long_add(ttm->num_pages,
>  					&ttm_dma32_pages_allocated);
>  	}
> @@ -416,7 +417,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>  error:
>  	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>  		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> -		if (bdev->pool.use_dma32)
> +		if (ttm_pool_uses_dma32(&bdev->pool))
>  			atomic_long_sub(ttm->num_pages,
>  					&ttm_dma32_pages_allocated);
>  	}
> @@ -439,7 +440,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>  
>  	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>  		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> -		if (bdev->pool.use_dma32)
> +		if (ttm_pool_uses_dma32(&bdev->pool))
>  			atomic_long_sub(ttm->num_pages,
>  					&ttm_dma32_pages_allocated);
>  	}
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 54cd34a6e4c0..22154d84fef9 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -100,4 +100,14 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  int ttm_pool_mgr_init(unsigned long num_pages);
>  void ttm_pool_mgr_fini(void);
>  
> +static inline bool ttm_pool_uses_dma_alloc(struct ttm_pool *pool)
> +{
> +	return pool->use_dma_alloc;
> +}
> +
> +static inline bool ttm_pool_uses_dma32(struct ttm_pool *pool)
> +{
> +	return pool->use_dma32;
> +}
> +

Please not in the header. Neither drivers nor other TTM modules should mess with such properties.

That is all internal to the pool.

Regards,
Christian.

>  #endif

