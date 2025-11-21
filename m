Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E473C7A5F3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F6C10E8A2;
	Fri, 21 Nov 2025 15:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GcGlarXZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C000A10E895;
 Fri, 21 Nov 2025 15:02:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJ1Wu+gGVpuMsRh/4EWJV8guZrSEjI+VQrd6r1yM1kPW+ippB4qbL/1CVF29oOTU5nk25LTwlh/H91nE2Zq39bv+snbOUJ9uI41+9ydGKfzk34yZQphMjvgYpDdnJoHgnfZ60FH03dk2E2lwR8FhP5wJQWuHCcOe7yAZTvYNWLX94C7ez2jlb1CYZ1uTHauGJImgKeJ0sHu1m4WLi7kFEIEAZGbppJgiAbnXN3KZvDGfq0kVL8n9+yyiM03YStDd6fJbdU5yFzxBGWSf9cW8vsZ0Osu+AE6GQ7LlxZQn4n3sM0SmcQYqZRL6VsC+Yif0LpLz6q1C1nyAEF+njjncYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=At4C4qaWh9piH6LWI0eRrs1S35u9eJfuJkdtSyJakEo=;
 b=GVStk8auMjR40qkYIA5gGjx596pLyG955ReVRFdVenEkIvDriAlIU/51gwmaK3xdyrEL13LfTGPiGkmAi+z2NdzTnv+Sx+x19FChQB5uEJ6lwMyAnAGetcKSAloBYzDavXB/rOEMRbP+eEG/t6UVoPv3Lsq5YLYrOWSaeR3Gk+9tC9CY6xSioRvCp+E0H+H/bDEKjsGWucwTNNvFfxB7wZkTgvNAU6jjE9HAfsO0gdyHC3cHvfuYsNryugH0D+rXYafoZm6kdEn+RU2XgPPtFw9GCsWno551vJ+oND0I48Zrvz6aYsGfcLO+HqUYyy5xb6OOL5NpLWK6MjtjwucV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=At4C4qaWh9piH6LWI0eRrs1S35u9eJfuJkdtSyJakEo=;
 b=GcGlarXZuzmhbubClYfGy2D0KvKLOKxacINmaGKzI3nDMHLfUCWiXm0VSbx5At0zO7F+AC2+HnhW+pUeuLDowDBXVcwtcKe8ss0qv2x88GEaO3madzBdu+BPhyneIhgWP9yb1xK4h2+TqPSsDEs9zDkaFbQRnsoHi01jsajvMeg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 15:02:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 15:02:51 +0000
Message-ID: <a8ed8682-5546-493b-825c-3545081250bc@amd.com>
Date: Fri, 21 Nov 2025 16:02:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/28] drm/amdgpu: use larger gart window when possible
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-17-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-17-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bbe965c-5970-4f8b-4f80-08de290f0a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVp6bXMydnJaVktaUGh6MmgrRG9ZMDdRNlR0VFo2MTdwNzRtb294MEMvVGNC?=
 =?utf-8?B?U0F1OEpNWkZWSnM5YkpmMElzUjdpdWcyQ2lBc2dxc0RzRzN2bGcwUVJia0tx?=
 =?utf-8?B?eVVXeWlMR0g5dmNDZVd0Nk9CVDd1MUFwMWRXR04vQlhoS29tWjk0ZjZkN0Rm?=
 =?utf-8?B?dkpMTGNTdE56bDU2WVNtZi9oWkdmR2I3dGJNSjlqZXhYMFpEaDh2UkZNQW82?=
 =?utf-8?B?RTFlUDZpaWZTYnBRVzdpMmVSM1FwNUdhY2JpUDErTXB1aDlSWWswMCthNk9N?=
 =?utf-8?B?ZWJmajd4ZGp5V1RUV0pYVXc1MGpIaXViUittZHg0U1ZpQ1VDbUZTTGhhMlJ5?=
 =?utf-8?B?djhhVkUvbmlCOWhsbzQrWFQ4dWNLc3E0QWJRSXliSnV3WUw0VDNVRWVSVXFx?=
 =?utf-8?B?SHB3amFweEtmT0hVVHhsaVJxV2NqUkpjdGFOZkpmT0ZDbTk5NG9pdFVJS3ov?=
 =?utf-8?B?WVJHd3dVcE9NTnNQeWE3aWJ4b1o2ZUJSR1VzeWY4aUo3eWJEMllkZnV1WjA0?=
 =?utf-8?B?TDlHQk42NFViTTFjMmllcStmQ2lGYjlRTHQxR3prSnNxUHRLNEtOemJhbjZR?=
 =?utf-8?B?UDFiNUFwNDdWYjRpYWlqSEtrbDhnTUg4WnZtRFBGSERlNWZvbnlUbDYxaWN5?=
 =?utf-8?B?L0JobC93RFE5NktqUDVPOWNpQlNaOHRnVFB3bjdRT3V1RTZwTnk2OEtNZXpY?=
 =?utf-8?B?MSt5QSsvSWgvNkhPVWtIbXlvdXROZjFqelczQWlyRXhoamp5UkIyczByRlUr?=
 =?utf-8?B?ZXB4MkJRK0haQnkyVTVYVVJkSHB3MklLUFZSR0QyaTVVenA3R1VwSFFyV2FL?=
 =?utf-8?B?UVNmM3BPVGV6SFhSOEp4VlpOYklnOEZqZnFQN2hmRjFIbEQ0RXVhcUdhOHdU?=
 =?utf-8?B?dGRxWnJFTVNXczVrRjA3ZVZkZk9aeVpweUdoZkdpejc5MEswUkUrVTFqYjMr?=
 =?utf-8?B?VXgvUGd2anNHRnNlVmVpcnV6dFJld1RUc3BncXdjaWNzUExsNXpxVERlTmRJ?=
 =?utf-8?B?VTZhSEdTa2RUa2RyNjcyRGtaNHFrTHFQMkY5b1ZUMTkzdU9kN0ZQeVdiS2Y2?=
 =?utf-8?B?RHAvVGZtZjZ4cUNZOEZjQWpoekpXbkhSbzkwY1NISmRoZ3F1a1NrUTM5cE9h?=
 =?utf-8?B?dE1CZC9hMW5ySDZhb0JWWGdIK2NRL2Faa0FXZmtXMnRNeXlIQ09CVFFBUWYz?=
 =?utf-8?B?WWJIdndIVitGWkhVWXZmRHNoTXFrSDYxaU1RL2hvK3BXY1lLWUhEcUNkdVF1?=
 =?utf-8?B?YzZZSWJWa1ZSekNtenJ4U3F4NkxPV0F0TnZNV3JCcFB4RFNxU0gwRldHdmJl?=
 =?utf-8?B?a2VhWWttancvTDJHWFNqd2lPY0g1RE5RS1lraGhPUXdPT0d2RUYzZEpXVFV3?=
 =?utf-8?B?bEVZMnRvRk5YQUxQMUJQbDh5YlVNeTFRT1hrbngxSTcwK0p3R0ZVSkJpVWpY?=
 =?utf-8?B?QWRHWnFQWWZWNkVOR3BmQzFUNWhRNUpRcmgxdi9NcGVyRThIQkF2SzRyTTJG?=
 =?utf-8?B?NERYVTY3RHk5S291QjBRZmRhdUd4bkpwZ090MEEzazkrNVU1a3dER0w0ZDdM?=
 =?utf-8?B?NysxRXkwbDhwQnM1L0YyeXdndDFCa1p5c3YvM0hTZUlHbUVta1pPOTVneG9p?=
 =?utf-8?B?OFVQS3U4MTMwVkRJVFZrUVhaVkNSZVB6djZYWVQ0RGNESU5sb0s1UTh1TEdh?=
 =?utf-8?B?bjh4MEhRV0JUTHF0eDNXWWYvK0llaFExMzUyNGEzb3piSEtGeEtJK0ZIWU9n?=
 =?utf-8?B?S0RlaDZwMHRqd0R4U0w5TkRvRHpLNWlmZ3NCbEQ2bGcvNytrWjBIMVpSdk0z?=
 =?utf-8?B?U21seCs5YjZ5T09EaHA2VmROWVdPbk5Wb1MvaUc3WTBpMjg0ZlNScUVlbXB4?=
 =?utf-8?B?WGZuZWw4dEM1dEZ0aHIzbVVNaHVTdGR5NTg2bjhiUkRYSnhvMGNPUnNYaUtx?=
 =?utf-8?Q?p7llk5vtrq++ZYxBtWRJ4zqYrffVI7WY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V21lNmlPZDlMUE80UEhwTWRVWWlWNFRCcXpqZ0xiWlJEY2FTUG1zbnNRVWZR?=
 =?utf-8?B?U2NnRmIyYjdhYjdFMGVldFd5Vk52cldUbjVKYTRJdkd5QVJjK0VlVmliZExv?=
 =?utf-8?B?QTVtc2dUcXpCSWZjREhkYm15d2IvZXRVSWlXZXMxRnU1TkFjcWwwZUN6M1du?=
 =?utf-8?B?OWRIaHY5T2w5SURLdHJNektSSHZzUFpPUC9Hdi9SR1hRMCtZNFh2YXBaRHJX?=
 =?utf-8?B?Skk4UnU2cU56djFCMllRTE4yYU9teHhGa1VyaHdtM1BkZmxlam5IVFpDUjRS?=
 =?utf-8?B?bktTL2lhanJYSG9VY3JlZ3RSMEhnZ3UvQlpSUVd1N2FzV3hYb040dFdHcEU5?=
 =?utf-8?B?ZFE0Ny9wNmlFc0JkYUllNGZNT0lkTnVEUmRXQmVycDFyTjNaMEZqV0psWG1E?=
 =?utf-8?B?Y1VMYkdrcGYzWGpDRVFrMTM3MWE4MDIvNG42V2w2RHNWQ0diQnpKc3RsWGxz?=
 =?utf-8?B?Q0RVR0MwTlViUTlyTi9WNXJ4VEtqNmxzank3enc0MU9LaU1pMjNWU292dk9I?=
 =?utf-8?B?Ym5YM1A5VE81dldaQmNVTGxVZ2ZDV0UweDc1ZHozdytoTkZYOEZpSHRYeG1Q?=
 =?utf-8?B?QmRPZnUycEUwaDY2YW9FaDdocUdTNGpadVNIWW1kRHNIZ2xoTUU3SUxVTVdD?=
 =?utf-8?B?SXA1Uzdqc2czalFXWFVEYldXU1RJQW82MjVpZ1BrN1J1NkVsZ2s1a2U0MHBG?=
 =?utf-8?B?RmY2TnVoMWZyRXUxbHdjT3pyaTM4blZDTXNGSTRaRWN0YVRpbnFNSUFSdG9K?=
 =?utf-8?B?QjNOSzIwejJGWitBdGlHNXZ2V3lwZnF5blpwVGUyMndtK1dqcmF0bDVzT0Y0?=
 =?utf-8?B?eUZVQU9SY2FmL2wwVkxTalZuY2ZBWTZodWVhallXQlR4bXBlelluWGtlWUll?=
 =?utf-8?B?eitvdDlNU2Z2SndVdWpkeXA5TUJpcE9CK3QyWHVaTDNDdUxsSzBkRzAxTWZr?=
 =?utf-8?B?SnB4TnBlUS9HNFA2TjJ3ZExFVmxtTXRKbGM1VUI1Zng1QmVpdWRCZ3hVem0x?=
 =?utf-8?B?eS9sN096UlgweHB5blNFRmpBR0pUV2p2VmoybWdZVXRMVnVxaWxva0VlakNR?=
 =?utf-8?B?bENieXJwVXZLd3FITVMzb21RbkF3MC8zMUVldFlya0U1bytDVUFkNjF0VGZG?=
 =?utf-8?B?WnJZazFSY2dQMjN5cGllWHVXcXdzTTIzRWh6WHlNK0F0TnZSc2k5Z2hHOURO?=
 =?utf-8?B?TjlJdDNmWk4vQkQvWWh3b1VpWEh6b2VlTEpldDJ1dnprTVhxeGdFazlnUG9i?=
 =?utf-8?B?QThrMWp4WlB5cWxLUHNScGFCbEd4RkwrUWphaEZGQ0VRa2ZqQUdVcy9WdUdF?=
 =?utf-8?B?dU5KRk5uQnlMejV5VTVMNUJ3b3Z5dWh5aW9hTzUwNTRUNjB0YTlCYU8wNHBY?=
 =?utf-8?B?dVl4d2craG9pdHhBbWJKeTk5d3ZRUUM5dDJ6QW5KcWVXdTJOaWphVk1wZVRD?=
 =?utf-8?B?K3QxaTdHOXg1cHVQQWZiZWhqVTdJeUR6MUxCYi9BVnVUYUhZcGUzQUgzUWoy?=
 =?utf-8?B?Sld3akFrUDdrS1I3ZDlPaTh4anpyYmxhWWViTDlmMWovU21ML3owU1BOS3Va?=
 =?utf-8?B?QWZwUy9lYnErWk5KZGJyRGNFTmFTMHd3OUVxZ21uaFhjK0VmK3NOVmRnL2ZZ?=
 =?utf-8?B?ZXozbUd2YjhQdTlwanZYUFNSZzBSUmNGWTJ0Rjg0cUg3OEVySk84WUVaUk0y?=
 =?utf-8?B?UjBObGNUREY1eE5EVk1vMTBDcHhaelRVRGZzeFRybVd4byszL2pabjZYZERL?=
 =?utf-8?B?STV5ekUzMk5Wa0hUYXpiWFNTWkh5TS9RZm92YU43cjhwd0h0eHZPaDNzbnd4?=
 =?utf-8?B?NUhJTGJTS0p4RithdEVoY0ZZKzVrRXB3bzlRSlhDVi9mVHgreVZtL2NIWVMy?=
 =?utf-8?B?dFNOQ3NkVHJiTFBRS0sydG51ZloxR2JjTTFqRXBnMjJnTkhRVzdHeTlvbWJB?=
 =?utf-8?B?Vnh0K2l4NzB0alZMZitjbnJhL1VMTHowSW9LUU8wSStSR2V4RFF6Uko4WmE4?=
 =?utf-8?B?MCtaRHR3RWVoR2cwM0RjbmE0RUQ2eFBlUjFVS1RJMGI0aDA5ekpoNkczSzcz?=
 =?utf-8?B?NFZjczdaVnFaTTdEd25VK3lodE1RTWUwL0RtTERiVFBZRDZCR0UxNEtiR052?=
 =?utf-8?Q?Rqo3g+8vauo2YBjZ763E8OdaU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbe965c-5970-4f8b-4f80-08de290f0a94
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:02:51.3611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iZcQHDwm0zhk8AepxfBFachTIvhEz9Uejvthe6tRgAB8t9hhTTNoeS5k7Wuq3Ye
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
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

On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> Entities' gart windows are contiguous so when copying a buffer
> and src doesn't need a gart window, its window can be used to
> extend dst one (and vice versa).
> 
> This doubles the gart window size and reduces the number of jobs
> required.
> 
> ---
> v2: pass adev instead of ring to amdgpu_ttm_needs_gart_window
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 78 ++++++++++++++++++-------
>  1 file changed, 58 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 164b49d768d8..489880b2fb8e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -177,6 +177,21 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entit
>  	return amdgpu_job_submit(job);
>  }
>  
> +static bool amdgpu_ttm_needs_gart_window(struct amdgpu_device *adev,
> +					 struct ttm_resource *mem,
> +					 struct amdgpu_res_cursor *mm_cur,
> +					 bool tmz,
> +					 uint64_t *addr)
> +{
> +	/* Map only what can't be accessed directly */
> +	if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {

Checking mem->start here is actually a really bad idea.

IIRC Amar was once working on patches to fix that, but never finished them.

On the other hand, that is certainly not a problem for this patch here.

> +		*addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
> +			mm_cur->start;
> +		return false;
> +	}
> +	return true;
> +}
> +
>  /**
>   * amdgpu_ttm_map_buffer - Map memory into the GART windows
>   * @adev: the device being used
> @@ -185,6 +200,7 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entit
>   * @mem: memory object to map
>   * @mm_cur: range to map
>   * @window: which GART window to use
> + * @use_two_windows: if true, use a double window
>   * @tmz: if we should setup a TMZ enabled mapping
>   * @size: in number of bytes to map, out number of bytes mapped
>   * @addr: resulting address inside the MC address space
> @@ -198,6 +214,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
>  				 struct ttm_resource *mem,
>  				 struct amdgpu_res_cursor *mm_cur,
>  				 unsigned int window,
> +				 bool use_two_windows,
>  				 bool tmz, uint64_t *size, uint64_t *addr)
>  {
>  	unsigned int offset, num_pages, num_dw, num_bytes;
> @@ -213,13 +230,8 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
>  	if (WARN_ON(mem->mem_type == AMDGPU_PL_PREEMPT))
>  		return -EINVAL;
>  
> -	/* Map only what can't be accessed directly */
> -	if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {
> -		*addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
> -			mm_cur->start;
> +	if (!amdgpu_ttm_needs_gart_window(adev, mem, mm_cur, tmz, addr))
>  		return 0;
> -	}
> -

When that is now checkout outside of the function this shouldn't be necessary any more and we should be able to remove that here.

>  
>  	/*
>  	 * If start begins at an offset inside the page, then adjust the size
> @@ -228,7 +240,8 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
>  	offset = mm_cur->start & ~PAGE_MASK;
>  
>  	num_pages = PFN_UP(*size + offset);
> -	num_pages = min_t(uint32_t, num_pages, AMDGPU_GTT_MAX_TRANSFER_SIZE);
> +	num_pages = min_t(uint32_t,
> +		num_pages, AMDGPU_GTT_MAX_TRANSFER_SIZE * (use_two_windows ? 2 : 1));

Rather use two separate calls to amdgpu_ttm_map_buffer() and just increment the cursor before the second call.

>  
>  	*size = min(*size, (uint64_t)num_pages * PAGE_SIZE - offset);
>  
> @@ -300,7 +313,9 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  				      struct dma_resv *resv,
>  				      struct dma_fence **f)
>  {
> +	bool src_needs_gart_window, dst_needs_gart_window, use_two_gart_windows;
>  	struct amdgpu_res_cursor src_mm, dst_mm;
> +	int src_gart_window, dst_gart_window;
>  	struct dma_fence *fence = NULL;
>  	int r = 0;
>  	uint32_t copy_flags = 0;
> @@ -324,18 +339,40 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		/* Never copy more than 256MiB at once to avoid a timeout */
>  		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
>  
> -		/* Map src to window 0 and dst to window 1. */
> -		r = amdgpu_ttm_map_buffer(adev, entity,
> -					  src->bo, src->mem, &src_mm,
> -					  0, tmz, &cur_size, &from);
> -		if (r)
> -			goto error;
> +		/* If only one direction needs a gart window to access memory, use both
> +		 * windows for it.
> +		 */
> +		src_needs_gart_window =
> +			amdgpu_ttm_needs_gart_window(adev, src->mem, &src_mm, tmz, &from);
> +		dst_needs_gart_window =
> +			amdgpu_ttm_needs_gart_window(adev, dst->mem, &dst_mm, tmz, &to);

The coding style looks a bit odd.

Regards,
Christian.

>  
> -		r = amdgpu_ttm_map_buffer(adev, entity,
> -					  dst->bo, dst->mem, &dst_mm,
> -					  1, tmz, &cur_size, &to);
> -		if (r)
> -			goto error;
> +		if (src_needs_gart_window) {
> +			src_gart_window = 0;
> +			use_two_gart_windows = !dst_needs_gart_window;
> +		}
> +		if (dst_needs_gart_window) {
> +			dst_gart_window = src_needs_gart_window ? 1 : 0;
> +			use_two_gart_windows = !src_needs_gart_window;
> +		}
> +
> +		if (src_needs_gart_window) {
> +			r = amdgpu_ttm_map_buffer(adev, entity,
> +						  src->bo, src->mem, &src_mm,
> +						  src_gart_window, use_two_gart_windows,
> +						  tmz, &cur_size, &from);
> +			if (r)
> +				goto error;
> +		}
> +
> +		if (dst_needs_gart_window) {
> +			r = amdgpu_ttm_map_buffer(adev, entity,
> +						  dst->bo, dst->mem, &dst_mm,
> +						  dst_gart_window, use_two_gart_windows,
> +						  tmz, &cur_size, &to);
> +			if (r)
> +				goto error;
> +		}
>  
>  		abo_src = ttm_to_amdgpu_bo(src->bo);
>  		abo_dst = ttm_to_amdgpu_bo(dst->bo);
> @@ -2434,7 +2471,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
>  
>  		r = amdgpu_ttm_map_buffer(adev, entity,
>  					  &bo->tbo, bo->tbo.resource, &cursor,
> -					  1, false, &size, &addr);
> +					  1, false, false, &size, &addr);
>  		if (r)
>  			goto err;
>  
> @@ -2485,7 +2522,8 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
>  
>  		r = amdgpu_ttm_map_buffer(adev, entity,
>  					  &bo->tbo, bo->tbo.resource, &dst,
> -					  1, false, &cur_size, &to);
> +					  1, false, false,
> +					  &cur_size, &to);
>  		if (r)
>  			goto error;
>  

