Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7A8B094B2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 21:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF79110E887;
	Thu, 17 Jul 2025 19:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Fl3FmpNQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A99D10E887
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 19:16:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1GUNhFDSk8dLkgf2gOtGKLUHC0Iv9fP9Xrb1EJ2khte6fUboIQHZFe7+aaJ9OS+K9ewOohD+Dlxb4sf9dr4ot6KQxMNabhZqDY57e0O47SuDMjdTeZFT/HC0hGV2XI7ac5s5GOFHJuh1ZS40JX34cdfyJwGrduWTpFbqXpFfPnjxJc+UupjO4C60s7eP5np3C5XthWuyHdHW8bpPljUwtaAjQczAOv67hDPupUjFQmELGOT7GIVwiIkCZTaL2hWJMnP5fNezc9ll60ehS30ofYqQDDP2dDcKfXeWlTaIUeO2yDnA88gfxi7nwkNqUoGqec8xkl3agjqdOvXwbDY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5gvXhCB6Rc4m816mg+h6lkF9qtf3gubC6Hy5EzYfJ4=;
 b=r2gP+qB1VJEiFdox7Ia0913/GN9Sbi6ZpDV5QcMtyDBNXwyOcQFZgNijqzwT+cfZxdK5ka1h9q/IIBxDSBiyXfvPCOtQzq4GJIODCWcDp9UfCPvMHp40HtsEUfLYfvd+wXAm+AB4q7Sg3p9etsIKiVj5drs9u31LKdfZq7iw5vBEmR8Q95cOEm6sG0mn5STvUsWrYliZySHopmcugvI8z0r/UtGcAvE6Sk2xXjGFC0TSZq/DonpifvY+R7/4bJgE46hKjylZ1CT9itlSZCnOu7KgRZIgn0/HJvgHz7J7dfZRse++/pK1rgv1W+LixIsAo6YqB2hEg8rgUtQaGkdc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5gvXhCB6Rc4m816mg+h6lkF9qtf3gubC6Hy5EzYfJ4=;
 b=Fl3FmpNQG+V+K8vJL7+ROTlRGYpnaKbw4ohZP/vYwi0/8b6aC1rt6G/xztbr85gm7Evl8rYZj77KFaDpq218tx/Rz+qjPlyknH3k1OBCXpIyClmBEjf9yg37LPlIj/EA29CApXn7dZqE2QGF4ntoDlHKSCtz/QtGwe3Aej6uDBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB4046.namprd12.prod.outlook.com (2603:10b6:208:1da::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 19:16:13 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 19:16:12 +0000
Message-ID: <77a137a1-f986-48cb-b04f-a346afd8617c@amd.com>
Date: Thu, 17 Jul 2025 15:16:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm: Add DRM prime interface to reassign GEM handle
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com, David.YatSin@amd.com, Chris.Freehill@amd.com,
 Christian.Koenig@amd.com, dcostantino@meta.com, sruffell@meta.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de
References: <20250717143556.857893-1-David.Francis@amd.com>
 <20250717143556.857893-2-David.Francis@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20250717143556.857893-2-David.Francis@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0255.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN2PR12MB4046:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0d151d-4c4b-4901-903d-08ddc5666405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDZ2L21rSUUwQ3lRbE9FNEU1V05md1ZEOHYwd1RWTm53Y1hzTlJlT2w4UWlX?=
 =?utf-8?B?WG5oZzhNa0FmakF4RzdaSDNaMytQR2xUQWZQSENFUzUxTjBBTEI3RGxWc1li?=
 =?utf-8?B?VVJ6bUxXOWxISkxVQmxKRzl6SEhOUkVJVWdhcWNtTTZYTFVmTmhIY0tnS0RJ?=
 =?utf-8?B?ZWwxU0JUY3hkK3pLbjZWUGN4Mjg2OVl6eEhkb3Npam9ZUUUyL09Ec1QxeDJY?=
 =?utf-8?B?RS9jRHVLSkMzNXV5clk0NGIrMjhqaUxlSnl1R0xma1UwYTNDaWRNRkZqekFa?=
 =?utf-8?B?UmlabThkNzY0OGpjS05EamtpQWNQWDhwSGpoN2lYekduUnJlYlJLdm92aXli?=
 =?utf-8?B?TmtpWDRXMm8wRFpPOXF6RktNSTRHVitRcVJWblI5ayt3b0p5M0JLTi85ckNR?=
 =?utf-8?B?NnNReitLWDQrbHZldTRBOGRwNVZ4MUE3RExqYUlEcHVQV1B0V1hyd3Eyd2Jt?=
 =?utf-8?B?MUkralNSL2NuWjB0aVNvMmgyaXowdUEzQzVOZzc5ajJ6b1VqU21TZFAwZU5Y?=
 =?utf-8?B?MkgxTnFnS2lVK0pOUW56YjhtTTlmZ0NUMlZIT1NLMlhmNVBiRGlpWFcxZERn?=
 =?utf-8?B?bld0ak1XeDZLZG84RDRoM2l2Uk9wcHAyRGVMcjRGeVh1MUh0K2g4c0tNK0xT?=
 =?utf-8?B?bnVJR3Z1OUdhWS9tSW1rU05qS1BrdklEaXd6SXpoeWdiT0Z1RitjVEZ3Uklh?=
 =?utf-8?B?MXVCNzJ6bnUvOEZXckNsUUZmcHJqaklKL3gxZXNhcDEvdXQ3aW5FanBGYm1h?=
 =?utf-8?B?dVpEWjgrS2lQbTZZRDgrNVRVb1gzMjBQVHhCclcrRmdhcEFmVGVoeG51dXVU?=
 =?utf-8?B?MkY0QzVDM3FhR2ZlVndxVlU4N015ejIvMno5QzNRTW8zWWNkbm5mY1pkSnlC?=
 =?utf-8?B?aCtJay9oM1BLa1ZGUUJ4d0d3MHowQjVOQmtodDRnTEEvRTJKU0xiUDh2akFz?=
 =?utf-8?B?NTd0TWkrZzhZQnMrSWhTUEh3OTdWcFhiRHUrbmZQZElCeGEyZXpCYUJGTlU4?=
 =?utf-8?B?SHdZQmtzL3U2SFNQZi81VTBCTFEwU25tSE83Sm1NdUJMRnBmd1NCcUlRaUlm?=
 =?utf-8?B?ZjdPc1lEN0oxQUpQM2pSeTNRYUdNem5QTlFVbGNVM1RDRHZiVzdjTU1KaEh5?=
 =?utf-8?B?R3Y4NFhyL3QrTXczS3l0SmFWekJvYlRHVnRIekkvaUZVSmp6ZTMwWDFDaWZN?=
 =?utf-8?B?a0xBUGNBa0VHVTQxRTZmUHlvV0xuaXBXRkp5bDA5bE45Vm94TlNUNHo0VlNv?=
 =?utf-8?B?ZXV6RmJSNDA4eER2QlZsL1lLVDAvM3hKWVhFdDN6bXBXOGZzNlZLbEd1ak1Y?=
 =?utf-8?B?b003aEgwWEZNSWNDdmhSK0s0N2lrZUNtR3ZSMStaek5OSVNnTnVHbUUxS3Yr?=
 =?utf-8?B?ckZPS0l1ZWhpOXRqU0RBRWlBOU5xWVQrYWZmMGZoM2s0NGhPTFBuSFpHTmNy?=
 =?utf-8?B?ODJRajJ4SzhYaDRUZUZrZlBpaFJmdWQ0MFl4UVNqOGdpV08zWWk2UkozL0lW?=
 =?utf-8?B?clRtdVB5RE1TNVVDZHdqd0xib0Z2OUhZbmNENzd3clZvRU14cDB5TDFVNGlB?=
 =?utf-8?B?WXc2bVdUdFhnNXVVbW9kc1FWLzcvM1BkK3FSYjhhcCtKd2x2Uk0xcDZvTEtO?=
 =?utf-8?B?VjkycUJPa2hUMUg3RHJiYlIvYkt4em1rQzdXLzg5Tkw0MEdPY1E2TU1ENXV6?=
 =?utf-8?B?Z0JDRC9ONnV0WnRJK1ZYdFZPVWZTQUFSU1o0MElkVmZZUnlyUTVpYXdPc3pr?=
 =?utf-8?B?REV2Q0hNbmQzZTVqbS8rbmkrYmFZa3BnTDM0M2paRlhmN0kxSlpDTWdQOWs3?=
 =?utf-8?B?aTNNOEFrUWM2aVpqU1JnUkRlUU0zMytxQjdJenNpQUVYR0pJZDk3cUJ4cndB?=
 =?utf-8?B?VkRrYnZsckFPS1VZWGZ5Zi9OY0RKbnZtRE91TkVheTFVUmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUUzYUI2WHo3RlB1TC9LY0x4ZG5xUUM3cFpubVBKN1VqK2grWEFrUHlEelYz?=
 =?utf-8?B?WHpZWnA1alhqSnZnck5lWk9KNkFKT3hyZGhGcjJUS1lHazJ2cnZQc1dFVXZs?=
 =?utf-8?B?ei9Bd3J5MzZPQm9FOFRUVkFyU1J3cnBWbzJOc2lldXRaVjRRUGlpQW16TlBm?=
 =?utf-8?B?c0wrQ21IeFUvQ2w0cGJIK2hUWTg3bzNpMGh5NTJuMmM5NzlrRVhLWmFuVXlD?=
 =?utf-8?B?S0U5UzYxYno0NldPN1B6WFF0eXR5VEZDaks0dUhwSlhQNGJXZnp1MVBZOEZ0?=
 =?utf-8?B?WHlHOU1Bc3lEU3VhdTZtRE84QWpKbVBoWHh3RDVsZTRjM1lQOXBPMEtOM01l?=
 =?utf-8?B?TmVvVkVoa09GNDJIK2NNV1dUZkIvVmUrN0NWZDMrS0dmS2I0elk0QXdFMWkx?=
 =?utf-8?B?d0N5Vi9yamMvTUpsTzY4Mk9kRWxlcGQ3cEVXQTludlQvWk82MVNIRkloNDZG?=
 =?utf-8?B?Z0N4RHhHaXZ2WTFQeXZOQWdsd24zSTMyNmgxY0JYMUZySmVZdG1XWlhMRVl1?=
 =?utf-8?B?bEt0MmhyN21mYjE3RmhGOWs3OHlGaGdKeHJwTnZaeWxvMHVoMjFQRG8zdmlT?=
 =?utf-8?B?YkNCRk05aSsrY0djQndkNkdGSGt2d0FjY0pPZytpZTNnL00wUCsxeC9QVXdN?=
 =?utf-8?B?RnRpZjlBRnorWU1aVUI2UUhXdEF6OUN5R0s4dXlBVWpiTHFFTWlMOERvQVdW?=
 =?utf-8?B?d000eEtNNFMvajJWK2paWHpibHYwM0xvd3RHeHBSTEt5YnNkcXNGd045dUZB?=
 =?utf-8?B?bDhLUTV3UTdlOC9CUlR0Y1l3YTRZZERHeWdSeFlnTGR3ZENlOVc2WVRRQW9h?=
 =?utf-8?B?SnJCano0RStNQXRTeXpmellEUWFzV1p4cHY5UGJmOC8yc1pXZGNkTTBRcFZS?=
 =?utf-8?B?Z2E5YUU0Rk9SdTRCSlYwNkZ3K1NSOUR3OGxncytJV01BcUxaNnZKL1lqUDVE?=
 =?utf-8?B?ekZpRkgyVnR4RTJtVWoydjB2UFJhdEtJd0JZV21QVDdUdVVCekUyMXArUWQ5?=
 =?utf-8?B?dzJ2M0JKQ0ZuTEtwSjY0SUZMb0xHdWFaNGNDRnFwOHRCY0U3YXBrUGxJbTV1?=
 =?utf-8?B?bnhQbkdRVjR2eDhmcjJlSGM2eDgxSm1JZk9KV3h3MGhtVlV2UFJLZ2srYWhH?=
 =?utf-8?B?RUJaTHVDaUlDWmFucUtVZDlraWFvYlZyN1FLZmluUGJXUmlVa05GOHljV1da?=
 =?utf-8?B?cTVlb1hiWGNvNkVKQnlnbHRLU3BPREVwaU1MOFluVTFhTGNxUDlPSDN2R2tR?=
 =?utf-8?B?UWd4RElobVhJczFiZGJoYjB2RTV2KzdwaEFCRVVYQzgvNHNMMDBURmRwSTVy?=
 =?utf-8?B?d0lSYy9sYWZEYkRJdDNjWHpFRXJncWFKWVBDdHcwdkNwRDhqRTBLQ01PUGhU?=
 =?utf-8?B?VkxKSTJ6enYvckdQNkN5c3dOc1hEWjR3RzFrZ2NYWTlZVXQzc2dJaVpmeks3?=
 =?utf-8?B?MWJQd1BjR3E2MHZyWjdCdUg0Q2JPQi92dFVCN3hGTklWRU5sOHR1dTdoSmJY?=
 =?utf-8?B?L3BKc0xXYTZYcXBpTTVObFdxbVlWM1lWcG00WkI4UExoVnRRbFZxUHpPNHNR?=
 =?utf-8?B?MSs2ZHNDS0lMcnM2ZERXVTlUMUdLbDNHZ0hGSGN6WElJclBHZDQrQmlTZzlQ?=
 =?utf-8?B?blJIZGNtdG1TM2tUQmI2RzhRejBwdFByR21ickVVa1FRY2tEVFZtT2t0dm5z?=
 =?utf-8?B?WEtTV1lQQW5vanV2TXlpSmdCam0rbXlLZGlzU3BGaUNVQmtzODd3RVYydTJi?=
 =?utf-8?B?bWgySVh4NnNFWm5sNGV1SmhZK2RLOGNlRjFBYzc3NVV2SUJUQVphcDY1eTQw?=
 =?utf-8?B?VEVXMEVzVjNiZHlVR1E4SmVGL3k3VjZsTXBvRlJPTVUrSHVmbkpOTVRBU0Y0?=
 =?utf-8?B?SHdNRGNUSEdQNFV4MDZPSU1TcjQ4dnZuZE8wa3VLb25XQXRVTlBhL01OT1ZM?=
 =?utf-8?B?V0ZqOXgxZjU4ZDlqaVl2VXB0R3ZvbnhjR3hvdDVoWjZLYStjckJ6d1lXYlE5?=
 =?utf-8?B?QUZWVm9oWldDYzh4MXIyVUlhaXRKQUxHei8wMTVVUjFnZEVvVy9FakxWajE3?=
 =?utf-8?B?MnlOWVEwZzZtdFdyZm5PZTJ2OFJOeGZ6WjN1R1N1dytwWTN4ZzB3VXJlSmIz?=
 =?utf-8?Q?qXMDNMFbxIY9yYPASCnZDt+m1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0d151d-4c4b-4901-903d-08ddc5666405
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 19:16:12.0723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOerwQbrlqlXk21H1f8iQnObG8tL68Oo5Ief5vEDKcx03imwOYwPho+9pQQ6tnfVrPKw6caEvjRhYVUdT6whYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4046
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

On 2025-07-17 10:35, David Francis wrote:
> CRIU restore of drm buffer objects requires the ability to create
> or import a buffer object with a specific gem handle.
>
> Add new drm ioctl DRM_IOCTL_GEM_CHANGE_HANDLE, which takes
> the gem handle of an object and moves that object to a
> specified new gem handle.
>
> This ioctl needs to call drm_prime_remove_buf_handle,
> but that function acquires the prime lock, which the ioctl
> needs to hold for other purposes.
>
> Make drm_prime_remove_buf_handle not acquire the prime lock,
> and change its other caller to reflect this.
>
> The rest of the kernel patches required to enable CRIU can be
> found at
> https://lore.kernel.org/dri-devel/20250617194536.538681-1-David.Francis@amd.com/
>
> v2 - Move documentation to UAPI headers
> v3 - Always return 0 on success
>
> Signed-off-by: David Francis <David.Francis@amd.com>

Acked-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>  drivers/gpu/drm/drm_gem.c      | 56 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_internal.h |  4 +++
>  drivers/gpu/drm/drm_ioctl.c    |  1 +
>  drivers/gpu/drm/drm_prime.c    |  6 +---
>  include/uapi/drm/drm.h         | 23 ++++++++++++++
>  5 files changed, 85 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index c6240bab3fa5..b1d7b0655cbb 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -282,7 +282,12 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>  	if (obj->funcs->close)
>  		obj->funcs->close(obj, file_priv);
>  
> +	mutex_lock(&file_priv->prime.lock);
> +
>  	drm_prime_remove_buf_handle(&file_priv->prime, id);
> +
> +	mutex_unlock(&file_priv->prime.lock);
> +
>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
>  
>  	drm_gem_object_handle_put_unlocked(obj);
> @@ -933,6 +938,57 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
>  	return ret;
>  }
>  
> +int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
> +				struct drm_file *file_priv)
> +{
> +	struct drm_gem_change_handle *args = data;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	if (!drm_core_check_feature(dev, DRIVER_GEM))
> +		return -EOPNOTSUPP;
> +
> +	obj = drm_gem_object_lookup(file_priv, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (args->handle == args->new_handle)
> +		return 0;
> +
> +	mutex_lock(&file_priv->prime.lock);
> +
> +	spin_lock(&file_priv->table_lock);
> +	ret = idr_alloc(&file_priv->object_idr, obj,
> +		args->new_handle, args->new_handle + 1, GFP_NOWAIT);
> +	spin_unlock(&file_priv->table_lock);
> +
> +	if (ret < 0)
> +		goto out_unlock;
> +
> +	if (obj->dma_buf) {
> +		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf, args->new_handle);
> +		if (ret < 0) {
> +			spin_lock(&file_priv->table_lock);
> +			idr_remove(&file_priv->object_idr, args->new_handle);
> +			spin_unlock(&file_priv->table_lock);
> +			goto out_unlock;
> +		}
> +
> +		drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
> +	}
> +
> +	ret = 0;
> +
> +	spin_lock(&file_priv->table_lock);
> +	idr_remove(&file_priv->object_idr, args->handle);
> +	spin_unlock(&file_priv->table_lock);
> +
> +out_unlock:
> +	mutex_unlock(&file_priv->prime.lock);
> +
> +	return ret;
> +}
> +
>  /**
>   * drm_gem_open - initializes GEM file-private structures at devnode open time
>   * @dev: drm_device which is being opened by userspace
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda..e9d5cdf7e033 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -85,6 +85,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  
>  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
>  void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
> +int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +			     struct dma_buf *dma_buf, uint32_t handle);
>  void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  				 uint32_t handle);
>  
> @@ -168,6 +170,8 @@ int drm_gem_close_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv);
>  int drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv);
> +int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
> +				struct drm_file *file_priv);
>  int drm_gem_open_ioctl(struct drm_device *dev, void *data,
>  		       struct drm_file *file_priv);
>  void drm_gem_open(struct drm_device *dev, struct drm_file *file_private);
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index f593dc569d31..d8a24875a7ba 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -653,6 +653,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CLOSE, drm_gem_close_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF(DRM_IOCTL_GEM_FLINK, drm_gem_flink_ioctl, DRM_AUTH),
>  	DRM_IOCTL_DEF(DRM_IOCTL_GEM_OPEN, drm_gem_open_ioctl, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CHANGE_HANDLE, drm_gem_change_handle_ioctl, DRM_RENDER_ALLOW),
>  
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETRESOURCES, drm_mode_getresources, 0),
>  
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index bdb51c8f262e..1f2e858e5000 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -93,7 +93,7 @@ struct drm_prime_member {
>  	struct rb_node handle_rb;
>  };
>  
> -static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  				    struct dma_buf *dma_buf, uint32_t handle)
>  {
>  	struct drm_prime_member *member;
> @@ -190,8 +190,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  {
>  	struct rb_node *rb;
>  
> -	mutex_lock(&prime_fpriv->lock);
> -
>  	rb = prime_fpriv->handles.rb_node;
>  	while (rb) {
>  		struct drm_prime_member *member;
> @@ -210,8 +208,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  			rb = rb->rb_left;
>  		}
>  	}
> -
> -	mutex_unlock(&prime_fpriv->lock);
>  }
>  
>  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv)
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 7fba37b94401..e3940b657e16 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -625,6 +625,21 @@ struct drm_gem_open {
>  	__u64 size;
>  };
>  
> +/**
> + * struct drm_gem_change_handle - Argument for &DRM_IOCTL_GEM_CHANGE_HANDLE ioctl.
> + * @handle: The handle of a gem object.
> + * @new_handle: An available gem handle.
> + *
> + * This ioctl changes the handle of a GEM object to the specified one.
> + * The new handle must be unused. On success the old handle is closed
> + * and all further IOCTL should refer to the new handle only.
> + * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
> + */
> +struct drm_gem_change_handle {
> +	__u32 handle;
> +	__u32 new_handle;
> +};
> +
>  /**
>   * DRM_CAP_DUMB_BUFFER
>   *
> @@ -1305,6 +1320,14 @@ extern "C" {
>   */
>  #define DRM_IOCTL_SET_CLIENT_NAME	DRM_IOWR(0xD1, struct drm_set_client_name)
>  
> +/**
> + * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
> + *
> + * Some applications (notably CRIU) need objects to have specific gem handles.
> + * This ioctl changes the object at one gem handle to use a new gem handle.
> + */
> +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
> +
>  /*
>   * Device specific ioctls should only be in their respective headers
>   * The device specific ioctl range is from 0x40 to 0x9f.
