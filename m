Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106E79272A6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 11:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2F710EA43;
	Thu,  4 Jul 2024 09:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vYsDDjFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F21110EA43;
 Thu,  4 Jul 2024 09:05:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k68S6Zhct3SnqsCOJmM/qHqSKd6t8bu3qaD5x9E8v80F09W5esOLjCpTbbYXG6DbRO43zLN0xhlGK3Pz3ig06zgdl4KwLwUtrKeIm89gExFdZY24d/Mk8n/DBBDM3XIBJPJsUmRzoaWLeBpA5ClpYmPD951yqle+V6WxTINh2fgN2kr9jV1D5o3jI3cOuDEV/Vr6p2swZQ6yZYJlEqaYVj9tcGXy58JaUv7vbMMPauPEcjC/JkWRXVqHR3hEK2rCfKjuhh/DxxhImJKDt0x2/J8pNuf9kiy5b1fd6Hhm/bm1+Bq+Sczx6NTB9MyjnCVF4M2S+Mk1xv6lDTazENtutg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWGfwqIc4TGBziz0mCtuOKGHK1zA0Vg/haFvBhWAu9M=;
 b=U68ljiyXvq5aBSFQkhQKPVycxaYv4/RHWCZVFfxpNsddcARCc052tx3538+3ynNtRlQIpV6RRD3nCO5yc4Cee48eedM7/KhaRyhoUcASyv2GiXMyrDv1fiZpzZParoMP3rmJSoQkdUSwwH2jMErIB2QENdzRdqQrHQq29jUeGEi52KQkTyPjWc9O3emuQYWC4tSCXL8NP/xMFhbHPGy6ftsFD0tKvACWJ0GfpAfIM/DtlJcSu/68zaO/5QofcD5HnekIzYjzafru3VLs1KIWH8hIWUb7U7ZysOvFJPht6JE9aNptY7xYEcDvh18+GOM2F1QVNRawTztmgCsj1UKMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWGfwqIc4TGBziz0mCtuOKGHK1zA0Vg/haFvBhWAu9M=;
 b=vYsDDjFPsQKbm+OfGbBhQkOT6nqRbJafIHYzkZKvi5AOAeHAgp9ey/xclPUnbKHqk4nWfRK3j1tSDUxcDdm6Pwg2Z6DCSzD0MTc9sM4UVQqX99LOcbCdjYRHbBDlvuR+Kkyw/cXqTpZ9PYF/uisYqXWmQ1qv08qd2zpNqUl4IyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYXPR12MB9317.namprd12.prod.outlook.com (2603:10b6:930:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Thu, 4 Jul
 2024 09:05:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 09:05:19 +0000
Message-ID: <bbab10ce-e331-43bb-9955-085d19b1e7b4@amd.com>
Date: Thu, 4 Jul 2024 11:05:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/12] drm/ttm: Use LRU hitches
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-4-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240703153813.182001-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYXPR12MB9317:EE_
X-MS-Office365-Filtering-Correlation-Id: 280b94ef-6e4f-46d8-f752-08dc9c086da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rk5mckhRV3RLbG5PcldrRzZGUm81b014Q2lPeEkxY1Z6U3JYOGpML0QxVEhM?=
 =?utf-8?B?Y3luYm5FTmY5WlRsMjNpNUFtRmVSbWJ1UGlEOHZIYnpOR01kQ3pGWG1abXY4?=
 =?utf-8?B?ZWd3OWdzQVJsWGc2NTdhamlZdjRKdGVwL3JrcWx3dmpLSnJLNTVRc0ZsdzFq?=
 =?utf-8?B?QXRzWDI0c2N3Z1h4Z05hMFllbWZ1ZEhKVW1Gd2s4UWlOWlRVK2F3Z3U5TVA3?=
 =?utf-8?B?V3NWcDVIMnZwSzlLRWZTb293T3RsRE80L2ovakxQdHJMUDlaMTV0MXN5V0Za?=
 =?utf-8?B?SEVIL2tkVTEvTG8rSGZQc214SmZoL3NlVUpzZ3ZDeEh2VW9GWjFSaVE0bFMz?=
 =?utf-8?B?Q21jVjBPQzRxUWo1MjlCeVdTWTdXYUpxbWl2NGY4MTM3b0VCQ2VJM01MSTJv?=
 =?utf-8?B?eHRUczlXVXpLR0c2NTFBaGNxWERTcUhDbDBQa0N0Y1RWYjk3RHhjWFp3aG8z?=
 =?utf-8?B?ZTd2bjMwQTMvemowaUlYZlN5MnpRajhmS0dQYzFNSkJWQVNxWU84NU52NlJ4?=
 =?utf-8?B?TERlU0ZtMXE5ZWExNXVjUHVWN1RjaUZLREx5a01nQ1dkUWpYbFV3dXNnOVB4?=
 =?utf-8?B?aXAwbUZiSDNOUDdZWGk3MEJTNHNiWjFkbGNHcWR0em04cjhZNktKbEs1NEZ1?=
 =?utf-8?B?bFpEVkpGbE1GcmpaQnRFZVdqQ1AzU0xhd0NNSDBsMWhRNkNjNUcycWZaTmts?=
 =?utf-8?B?VTZXaFlOejZrK3orSnFSUTN0QUdxNzQrV3BEMTJlREhNVmE3NXlQU0VKRWlE?=
 =?utf-8?B?bE1LVlZ3THY3UDFzK3JMWmQ4SS9LcmMvYi9Oa2FtczdVaUp0TDN1Qmd0Ujlh?=
 =?utf-8?B?YlBBZWh3NjBzM2ZvNUJFWWYzUDQ4YjcyRUM5b0EreGs2bEMxbmQ2VS9JZWxN?=
 =?utf-8?B?ZTB1MFBHRG41clZSOGkyeEZvU3JnU1dHalhRc0lwRzVpVWVXQm1NWDZWSFpY?=
 =?utf-8?B?M0c3VGRRdERkQ1pSTUZOL0lIQ1FlVkJ2N1RJbDhsQ0Ruck4yK2dnaERYbThN?=
 =?utf-8?B?WG5uVG1ySzgzN3NlYUROaWNwSFlDRW9WSlgreENPeHhUbWZmTitSRHhIYW9M?=
 =?utf-8?B?SjBXN3U4TEtCQjJLcmNRVE13Si9PVEFmckdMdkJ4MG1vSittOFVpVWYwQ1pQ?=
 =?utf-8?B?TGN5OVRoVUI1dmcyamZaUTd3T1Zlbkl1ZVBZUTVYdjRoTGpMSXZJZjQrMlhs?=
 =?utf-8?B?VG1WQUJFeHdQL1JRUE1QSGxrRmZNdyt0Uk5tNE9wN3k1bkhmWDl0bzRnTTN0?=
 =?utf-8?B?WEozRnIxYkRPend5aGt1U2lBTlNEL25PSndudFBUaUc5NGc0UW02MlY5d1RI?=
 =?utf-8?B?M1FKVk1TcENjKzVtUDBkQ29CLytBUlk0Y2x1d1owTXprai9FQTlCaTc4T0d4?=
 =?utf-8?B?ZHM5anQxNDNEQlJNVXEzY0RiOWtLSUhKVVNiR3NZWEpZR0l5MVBQcVdaa2dq?=
 =?utf-8?B?dGxpaHlVc1AvMEoxS1JMVlNGeUhEV09zdmo2QkQvMitaVnJjT0UwSEZEa2JB?=
 =?utf-8?B?QndlQ2Y2ekZZMU14MHBhS2R1RzVzQ3dPTVRIdmRYV3ZzTHVOVHZ4Y09HZlV6?=
 =?utf-8?B?TmNZUFZMdjlEOU0xdFFTR0VmVmtJN3pRNCt6VmwwTUxQdURQUnN0NnRlT0E3?=
 =?utf-8?B?QUV4SzhodlFqS0RSeG9sUFRXOFZXUTZaTjFPc2o1RnhFVVJQUG9iSndlaGhx?=
 =?utf-8?B?eHlMY1d5c1dHNFhIV3g4VlFNRFYrbFZqdmRhckU1OWM4eFhvQmZZUUxYWlVU?=
 =?utf-8?B?eEUydjVDa01CMnpWbDFidDUyMCs0c2pRRW4xVEMvdHVWMGc1c1JvWlRZME9p?=
 =?utf-8?B?T1U5WFRmbVBONjkyQm0zdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFVYVTNzMWRuY0tsV2lmRXhuRVhpVDZiWmNtWTBZa0t1Zzh6TkhTWVNiVHFG?=
 =?utf-8?B?UTdIZkhKUms4TEdGVkdmSDl2YWE0eHZSK1lBQm9LSEJveHNKUjlESytGMXRX?=
 =?utf-8?B?dThRVm9qcmZ1L1BoeEsxUFN5RFlYZkhtZENvM044RjV4ZnlTajhyYS9MOVZR?=
 =?utf-8?B?a3R5SEVIdFRFeFVLYzQxK3NySjllZTdnWlV0czRYRHc2dWpmbUtiNHJVcU1n?=
 =?utf-8?B?M2hoMVh5M3huWnZFbTdKdDRWeENiVXVHOEFTRi9xSWNPOVFkcFJYdURFOHhj?=
 =?utf-8?B?UU51b2dMSmlZZG5OSlEwS3RuTUJYUm4wbW45SHpKNWU1TnFiaE0rcUE0UWpL?=
 =?utf-8?B?QzJuOVdYNitJaUp6R1VxSkRVVWNlWkE5NFdTRXJTUWM4akN2N3Y4ME5POXFC?=
 =?utf-8?B?blVBZmoyZWNGVlRQRjlNdFFxZGxEeUJnMWdQNDFrRGlLeDVuR2J5YjRqODhR?=
 =?utf-8?B?eWdxVDAwaVB3Y1hLMHRiSkhzOW1Cd2ttajhUL1pvSE1oV2lLUHV5MlNjRmFr?=
 =?utf-8?B?Q0V5UFltL0NzbWFBTERYajR6ZVhEWjJIaStSaElNaUJZbUsrRlhGQWNyVVRE?=
 =?utf-8?B?Zjd3RkJUNlkwS2hOY0tYWjY2ZE5wODVsNmczQ0xrUlJ0QlNzdFI2a0Yzd2Zu?=
 =?utf-8?B?UW9aR2xIQ3AzUjdOL0NMOVZYT2ZrK2d0NTB0cC94TUdmQTYvRTJqdnBvKzhu?=
 =?utf-8?B?d2FWVlM3THVrNkNwOG9sSWtXWUw1T3lNV3orVGprcFcwS0tBWVJjbzRUNm5Y?=
 =?utf-8?B?Rk9iTDF0L2VIanUrN1czdWgvdWRNOTZSQ1RsWTZReW5xWlBvS3gwai80VUFh?=
 =?utf-8?B?RThWRU5hRytKaEp5VDlKSFBTakxoeGZmMGpHNGo3WHNIZUhxNko1MnAvczVN?=
 =?utf-8?B?N0hmNHhWUnc0dVA0ZVBEbWtGYzNDNmZVZXhVcmdXVTZoL2l6UStlR0o3bnlY?=
 =?utf-8?B?QVJkOXlOSnpNdjhtNEg0M0Z3enllZUlDMXN4UHB4dndzMXJuOVlvOGttMTBP?=
 =?utf-8?B?RGF1Mm9tNnQzdDZZd0dxZkZQV2dxU0ZUTThkR3lac3FvMUFMRTBSSkZoTExx?=
 =?utf-8?B?SmY5czFtZjJkQjhUQm5NMy9ZZmNCK2N6R0Y0ZVZVOWw5OVR2MFAzTjRoNWdO?=
 =?utf-8?B?QzFPNEZORHpCNlFkYU5MR2o0MmJIZnhzWkpSNUwxTTg4Qk03UTdPNm1kZHBN?=
 =?utf-8?B?eDUvbng2bzdRVzFIaXhsMWlKcUxOU1ZUTUE5M3dnTUkvZ01pWHhCaEJuNlls?=
 =?utf-8?B?amxNaWZJT2x0ZlNsSnd6SHEvZitDamRlUENCRUp6WG84RWNNSGdESTA5S0JH?=
 =?utf-8?B?YWQ2b2RBM0xxQnhwOGVwbjdLa0JPMXhlUW14MlplNmRjNUtqaDhBNm15VVhl?=
 =?utf-8?B?NlZLYWtEVkhFS0Jrcis3MnRZSUpDcTA1MzIzMDVFN2hEWG9kM1pVNExHOHNC?=
 =?utf-8?B?d2xKMVJnTkRZSTVnb1AyMlZOeGhQNDBkRm1iZjhUcUcveDVQcmQ4NlVia0Z3?=
 =?utf-8?B?MjZNMHg3NmhvenQ3QmZ3eDlmdzlzdVBWdG1UVWZVTlJCcUppQnd3eE1kOVl3?=
 =?utf-8?B?Y3EvZU1pTDIzeitaY21Qd2VKM1dPUkd1ZUdwVlNWTjlmdW0rNldtei9oV2ov?=
 =?utf-8?B?NmpvRXdOOE1lUVNCdzVybXlLTlkwWDIvTzNYUkk3OVJ3Z1V6RktlT3pZek5N?=
 =?utf-8?B?b2JSZHllS3BzeUxCbnIwVHk1WEN0NTdFd1h5dGRSU21RZkxTa3Z3bHhCdDBZ?=
 =?utf-8?B?bW5BVVlKajhBa0RCZ3RCOVAzSVNMbEhWcmFJV1hnZUtPM1Z3UE04WkM3cVJB?=
 =?utf-8?B?YUxmVlUyNnZ4VTRQclFrZVVRQzIzeXVFNUxGam1yQU4vNFUxU1pkcEluejJk?=
 =?utf-8?B?OXU5RzlkVkhCSXEzelJ5ZnBsdFE4Y3lIZnpuYmlmN3ZxYjdXZDJZcUNsR2tS?=
 =?utf-8?B?ZFFDaUFpTmlpbEJjSkVuOEViN3pJS2EwQVBTR2JOcFB2SmJVemJBdUVQdk9H?=
 =?utf-8?B?a0pPUFF2VHpLMmQzMjFVOCtUL20wWnVmb0tPSlkwSWhBTXRCQWhndDFHK0NO?=
 =?utf-8?B?RVk2NUNwMzM3bU1kWE1aM3hJaGIxQ3hoWStyWVlqWE5ETmRwTUl4T2dLWlV4?=
 =?utf-8?Q?slhjo6N684at6Z8qcKmPq1BBG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280b94ef-6e4f-46d8-f752-08dc9c086da1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 09:05:19.5172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cqnKdM/HYUNkdOlKK0ib83Qm2bBKpaB3StdmxvcfHvZauP33PTgeC6riFrI+V+S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9317
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

Am 03.07.24 um 17:38 schrieb Thomas Hellström:
> Have iterators insert themselves into the list they are iterating
> over using hitch list nodes. Since only the iterator owner
> can remove these list nodes from the list, it's safe to unlock
> the list and when continuing, use them as a starting point. Due to
> the way LRU bumping works in TTM, newly added items will not be
> missed, and bumped items will be iterated over a second time before
> reaching the end of the list.
>
> The exception is list with bulk move sublists. When bumping a
> sublist, a hitch that is part of that sublist will also be moved
> and we might miss items if restarting from it. This will be
> addressed in a later patch.
>
> Changes in previous series:
> - Updated ttm_resource_cursor_fini() documentation.
> v2:
> - Don't reorder ttm_resource_manager_first() and _next().
>    (Christian König).
> - Use list_add instead of list_move
>    (Christian König)
> v3:
> - Split into two patches, one cleanup, one new functionality
>    (Christian König)
> - use ttm_resource_cursor_fini_locked() instead of open-coding
>    (Matthew Brost)
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c       |  1 +
>   drivers/gpu/drm/ttm/ttm_device.c   |  9 +++--
>   drivers/gpu/drm/ttm/ttm_resource.c | 56 +++++++++++++++++++++++++-----
>   include/drm/ttm/ttm_resource.h     |  9 +++--
>   4 files changed, 62 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 6396dece0db1..43eda720657f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -621,6 +621,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   		if (locked)
>   			dma_resv_unlock(res->bo->base.resv);
>   	}
> +	ttm_resource_cursor_fini_locked(&cursor);
>   
>   	if (!bo) {
>   		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 09411978a13a..f9e9b1ec8c8a 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -170,12 +170,17 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   			num_pages = PFN_UP(bo->base.size);
>   			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>   			/* ttm_bo_swapout has dropped the lru_lock */
> -			if (!ret)
> +			if (!ret) {
> +				ttm_resource_cursor_fini(&cursor);
>   				return num_pages;
> -			if (ret != -EBUSY)
> +			}
> +			if (ret != -EBUSY) {
> +				ttm_resource_cursor_fini(&cursor);
>   				return ret;
> +			}
>   		}
>   	}
> +	ttm_resource_cursor_fini_locked(&cursor);
>   	spin_unlock(&bdev->lru_lock);
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 8bfbddddc0e8..9c8b6499edfb 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -33,6 +33,37 @@
>   
>   #include <drm/drm_util.h>
>   
> +/**
> + * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
> + * @cursor: The struct ttm_resource_cursor to finalize.
> + *
> + * The function pulls the LRU list cursor off any lists it was previusly
> + * attached to. Needs to be called with the LRU lock held. The function
> + * can be called multiple times after eachother.
> + */
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
> +{
> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> +	list_del_init(&cursor->hitch.link);
> +}
> +
> +/**
> + * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
> + * @cursor: The struct ttm_resource_cursor to finalize.
> + *
> + * The function pulls the LRU list cursor off any lists it was previusly
> + * attached to. Needs to be called without the LRU list lock held. The
> + * function can be called multiple times after eachother.
> + */
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
> +{
> +	spinlock_t *lru_lock = &cursor->man->bdev->lru_lock;
> +
> +	spin_lock(lru_lock);
> +	ttm_resource_cursor_fini_locked(cursor);
> +	spin_unlock(lru_lock);
> +}
> +
>   /**
>    * ttm_lru_bulk_move_init - initialize a bulk move structure
>    * @bulk: the structure to init
> @@ -485,12 +516,15 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   EXPORT_SYMBOL(ttm_resource_manager_debug);
>   
>   /**
> - * ttm_resource_manager_first
> - *
> + * ttm_resource_manager_first() - Start iterating over the resources
> + * of a resource manager
>    * @man: resource manager to iterate over
>    * @cursor: cursor to record the position
>    *
> - * Returns the first resource from the resource manager.
> + * Initializes the cursor and starts iterating. When done iterating,
> + * the caller must explicitly call ttm_resource_cursor_fini().
> + *
> + * Return: The first resource from the resource manager.
>    */
>   struct ttm_resource *
>   ttm_resource_manager_first(struct ttm_resource_manager *man,
> @@ -500,13 +534,15 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
>   
>   	cursor->priority = 0;
>   	cursor->man = man;
> -	cursor->cur = &man->lru[cursor->priority];
> +	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> +	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
> +
>   	return ttm_resource_manager_next(cursor);
>   }
>   
>   /**
> - * ttm_resource_manager_next
> - *
> + * ttm_resource_manager_next() - Continue iterating over the resource manager
> + * resources
>    * @cursor: cursor to record the position
>    *
>    * Return: the next resource from the resource manager.
> @@ -520,10 +556,10 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>   	lockdep_assert_held(&man->bdev->lru_lock);
>   
>   	for (;;) {
> -		lru = list_entry(cursor->cur, typeof(*lru), link);
> +		lru = &cursor->hitch;
>   		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
>   			if (ttm_lru_item_is_res(lru)) {
> -				cursor->cur = &lru->link;
> +				list_move(&cursor->hitch.link, &lru->link);
>   				return ttm_lru_item_to_res(lru);
>   			}
>   		}
> @@ -531,9 +567,11 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>   		if (++cursor->priority >= TTM_MAX_BO_PRIORITY)
>   			break;
>   
> -		cursor->cur = &man->lru[cursor->priority];
> +		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
>   	}
>   
> +	ttm_resource_cursor_fini_locked(cursor);
> +
>   	return NULL;
>   }
>   
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 7d81fd5b5b83..8fac781f641e 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -273,17 +273,22 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
>    * struct ttm_resource_cursor
>    *
>    * @man: The resource manager currently being iterated over.
> - * @cur: The list head the cursor currently points to.
> + * @hitch: A hitch list node inserted before the next resource
> + * to iterate over.
>    * @priority: the current priority
>    *
>    * Cursor to iterate over the resources in a manager.
>    */
>   struct ttm_resource_cursor {
>   	struct ttm_resource_manager *man;
> -	struct list_head *cur;
> +	struct ttm_lru_item hitch;
>   	unsigned int priority;
>   };
>   
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
> +
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> +
>   /**
>    * struct ttm_lru_bulk_move_pos
>    *

