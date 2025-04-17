Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4CEA9204C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 16:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836B210EB3E;
	Thu, 17 Apr 2025 14:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GbQWFnrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2E310EB3C;
 Thu, 17 Apr 2025 14:53:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjYiAAnlLlLIDHkSS7hX5fOdNuPSGMbFtYZLrwLp98rr0FVYm7rQeO87VVCaQEsVF8WIC/RP92Ejj7yBkEg9MDUm4G7ccGsAxoMD+5+cKKt532JiivRBXamG/xX8ice06YAA4Fu/oKwiuRaQaDg9vb3QWi+Qe/CVausMIDQuzNbIEUZ6K6DdyTPSulChb9b+8PhtRNOzzYI5oIt2sdolRwhbFZ9lzxKcss2FWs31ZxZGInG2hxSPTcpy2fVGfjH7MFzu/ikBTu0jbbrqux7XqJUkY0fJ/eLBBYNJrMqNaEjcJJnodHzF621Y2HUbQxw/pYUqxeDVTW+krBehneVawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r38BuB1Rx2DioecpC2zEYq22FQPjf+hLYUtHN6pDPMQ=;
 b=Z/CSr+vU8M7hCeMRBKdPq6+JWRLY9rPUmPjWfwSuhin3cKtTOH56tI6awC89Zg/AUyqlOcdNStMK0KpWoGNibg9KC6Z3UGV7n7pGmOEQQJqj0ioaNlOyz24zvQzl5eZVY6O7nUE3JcB9UPG5fWoqZzYlwrhRZMrQawuLv3ZCw5F1Arq4i/xCy/Q08Xi8cE2cZiRCXS5fEaR6xNmSNbbGR0GZdkwmos2SB+CRd1r2idYvqZa+IYsU62vfAPEMbR/MkPyI7CUJG6ycnvDlnTAZDJOznPYHyPhhfLd0ZwTHxuqjgj4InpDt8wJS4YjzuSbxvbkFhgDGQkboQLyaDE0dOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r38BuB1Rx2DioecpC2zEYq22FQPjf+hLYUtHN6pDPMQ=;
 b=GbQWFnrVYw8J/fHuiq0B0+VSYqzT91Yn2zzl0gKHNHvu4EQ7gDNcsSd7JtNa/+W30sGDFYlPR69TVacEJqnlVkTuK7q8vK29V1gK5Juw7xhqWfV1wJTd//DBp2Lbq31mdBkOYABwSijfbK3YpDiJZELujjdRmygZTnSMT/698wU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by LV8PR12MB9406.namprd12.prod.outlook.com (2603:10b6:408:20b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Thu, 17 Apr
 2025 14:53:52 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 14:53:52 +0000
Message-ID: <dff16a84-fa65-427a-a734-6147a555de83@amd.com>
Date: Thu, 17 Apr 2025 20:23:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 1/5] drm: add drm_file_err function to add process info
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417123155.4002358-1-sunil.khatri@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <20250417123155.4002358-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::15) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|LV8PR12MB9406:EE_
X-MS-Office365-Filtering-Correlation-Id: f5be06e0-2d2f-4efc-7b5b-08dd7dbfab60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEl2YjBwRS81eVdYZU0rc3J2cVdFaGluV3BZdlhDNGM2aUFMcXFVdysrUUlD?=
 =?utf-8?B?NmNrc3VrQ2RJS3VtZ0lXTTNrcGpudmErTmlmSllZNG5CMDc2Tm82ZkhFY0V3?=
 =?utf-8?B?NGs3Mi94QVFMeXAzV2FMV1E1VW1LL3c5eFc3L0gxR3gyWmFuaFprRTN3cmVX?=
 =?utf-8?B?ZS8vRGtSZ3dUeHNJZTNoNHZlelZYbTlnbldlS2RCR2V0NHB1K3JNQVg3K1R5?=
 =?utf-8?B?UmFJQVFzYVdzcU9NbFpGYngzcGN6cFNHS1FpejBFNWlOTGRkajJHL2FQczFn?=
 =?utf-8?B?b0s3dE56RHc3aHduNU52WWdORytGbzdGRWRBUmJSQUlGazBIRlBDTDFOQzRH?=
 =?utf-8?B?MXE0bmwwODQrTG1jQlF3dGVRaXowWGxFWWFyZzVmN21EN3FIRFNjcGswd01T?=
 =?utf-8?B?WXNBektUN0JGZkozNjduUHNDVHByY3ZaTzRzMnMrcGh3bWZ0UDBGVlNpbkhO?=
 =?utf-8?B?YWpvYnVyVmtIUWJGaU1xOFh0TG1TVHNLTjFWbmVNcE9YTWRrZHNsdlhQZWJ6?=
 =?utf-8?B?UUhMRXZjN29ONUoyYzlqSzJ2bWxnaUVUYzMvMXUwV25DZlFiNnE5ZktSZDh0?=
 =?utf-8?B?S0NCWVRRc2hTME5kTHo5TkpkMm9UdHZQcDVFK1pnUHptaWlYVFcrM2hzLzhn?=
 =?utf-8?B?encvR2NOcGZyNGJhTEgyYkdMK0VTUWMvQzBaMFA5Z29DVGx4dVkxN3N2WjNi?=
 =?utf-8?B?ZHZhdEVTMmFyR3VLNlR3VXlLZWcvWGwwTldmaFh5MENlbm5sNDZLWFdlazRn?=
 =?utf-8?B?RWtVOTMxNDJ1UDNrQjhCSStRV1BDcERhVlhqYnFlN0dyMWphQnFPaUhvNjBs?=
 =?utf-8?B?UHV2K3FyUFYzY1gxRFRsR00vT2RhRHhmZ25LdjJHQ2Z3Rkg5S3h4c0dVVitm?=
 =?utf-8?B?NlRFbDBTdVE0SmpZQlhHdkFieC9sdXo5Rk1mVTV4T3JhdFlzVmVRaG5LdmtI?=
 =?utf-8?B?V1dVRkExN3YwNytFTzllYmFBWGtIYkFKZDNpQkxCSlBqVHowSWxUSTZrVWVv?=
 =?utf-8?B?OXN1QzFCWkhlZ3V4ZW9ZNGtkTXNEcW8vSzVqZHBlUG10Lys5RmFIQnhTWUt5?=
 =?utf-8?B?aHNlSzZPUURLL1ZGdlB5U0J3c2M5c0xqOXZPU3Y1SWdpem1CNFNJYUVOcFE3?=
 =?utf-8?B?YVVYQ08xZzJRTm5TNm9OaTI0SUVvNm5ObnYydkVoblUyejFiMmlNQ3EveHdE?=
 =?utf-8?B?dWtMTXdPKzVFR1U4V1JaQXR0cVZLeVpJMW5WdEZoMVZJcVVodjBhbjZhRXZ6?=
 =?utf-8?B?Qm93dE05Z1l4d1JHSkgzY3RKa09yb2I1QUdLVUxsOU91KzIyMDR6eFY1WklT?=
 =?utf-8?B?OWdTSzE3S3RGQXZMQnFOQWVLVmNjRTVsN1U3ZzZoN1lhUktHdVFRRkZLb1g2?=
 =?utf-8?B?MDVNaWRtQ0EyWUNuY3dEZUhwN01wNENKTU9VWW8wUjF0TWxJNXArWEQxMDcy?=
 =?utf-8?B?OERsUHFPZmxlRHNnYjd3K1lGeGNTOVJ3MFR3SWcyNVlzTVZZRHhLUDBNYUtF?=
 =?utf-8?B?YVIxOVBxMmlpcFJSYm9WKzFrV1JORmVTeHBLVE1wVU94UnlQSExsS2djZ0s4?=
 =?utf-8?B?c0lGVXdSR04vVHcweUJWTFkrcjZKRHVnZ2JERFhXM1NYWTM2RmpGK2t1bUxV?=
 =?utf-8?B?TXlTWElmQjFDV0hQVUV1ZXRKVm5wUnF2TWNseDRiRUovNWs2UjV4UldCNDBi?=
 =?utf-8?B?a2NCVWpxblJPd3I0VG9IdWxFOFNoS2FpOGhiS0hnWVdQbjdzS3ZkYjlRRW9u?=
 =?utf-8?B?NlkydnJ2VzVyVmU4TWZ0U1h3NHNUWlpKcEhCUGo0clRUd04xVTVEOVVtODNh?=
 =?utf-8?B?dWM3MGNSZjlTWmFzd1lGclJKWnJkQWF1QVZOZUZ3ZWdKMmJrNnhiSlNUdXlp?=
 =?utf-8?B?Q1dUOXhLYjhhYnZ2NDFuZ2NFZTBmOUZ5eGRsTU1rMTZyM3I4bzJuUExTVWZv?=
 =?utf-8?Q?JzX865kP1GQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1ptUUYrTGE3QzBYdnhFVzR0VHkxYjN0ZVJZR1dIQ3dVckJmOEV6ZmFSbTk0?=
 =?utf-8?B?Smxad1hpRGdOOW1CM1B0WDZXR0Z1Ti9xbDYvTWpXQUthcmU1Wnc4bnpTUDlB?=
 =?utf-8?B?d0E4OExyTVMwSHh5SXR2cnZMRFljMSs2RzEvb3VlZzExeGZIOG5mT0daSkhl?=
 =?utf-8?B?b2JaK2IvclFTY2U5RkpoUWtPYmg1cnI0VUFZVkxCOWprbUprNVc1cnJ5WURY?=
 =?utf-8?B?bTdvb1lUUzNwQk8xcU9oOSt0bDdFTHNHbXNRbTBjZlZ5OE5mSVVtamxKQTFm?=
 =?utf-8?B?QlRPaGZlMTFHZzhOcnJYYUZJcTBjUjViQWpsRktCbmtLRHNNRUJEYVRGZVFD?=
 =?utf-8?B?ZDIzZyt4UGp4ZnR6OGRYNTF6anpWbTY0TU1VdklzZ0R0c01takF1NWlBeHJq?=
 =?utf-8?B?M24zd3A4TGxLeENmbC9CVGlwM1pEaFYzckQ2cU4wWW1jZUxMSTZERXdzblY5?=
 =?utf-8?B?RUlDVkUzaUFYNlJzM2ZMei9wUndQenZ4T2Fmb0RDVWc0KzhBb1V0TWp5RDl1?=
 =?utf-8?B?WVZsR2g3czNsVWJMQlBNM0diUjhpYWljVVNUNTdXV2F4N1pEMFVoZFZlTzRL?=
 =?utf-8?B?cVV2YWpFS01uNDR6cS83Yk15UitDTlo1cGJGczF4MDhpQnlhY2xWemVud3Jk?=
 =?utf-8?B?bUE3MFNDdWk3Rm55UitNT0VhTDkreW1ER1FRL0d6akFCZmdvYWVKREFYM1VK?=
 =?utf-8?B?TjUzeVlwdDNNaTJKTkZiUUZzRDB1czNud3V4SmVqQlA0MG9PbGdIdGZkdHVX?=
 =?utf-8?B?cXA1eXV2WUUxZ0t1Z005ZTl3SnU3UzdqZDZHVjhWQzNWY2kyMGdwY2ZQejZt?=
 =?utf-8?B?cHhYOFppQkxnOUI2SHNnUnlXWDJMZDZzYmxnSGV4WGViYUREWG00MXFFbkxo?=
 =?utf-8?B?dlpYYzFHeFhiTU12V3h3RFcvdWlmNGo5SENTQ3BXL05lblZIWTM5TTFCZ3JL?=
 =?utf-8?B?ZUpQU1Zlc3gvTjJhWUhJOU9LMkp3Y2swTVhkSWRkVE41NmNhdEwvcjI4aU1R?=
 =?utf-8?B?eWVkUUpTRDlvd0ExTDM4U3BWdTk4UGpLdkFOZ3hmNWNleDEyNUF2UE91YVRY?=
 =?utf-8?B?UVBxWG8rR3pRaDhmUzRLYy9acDdXeUw5RFJPd0x3eldBRjBSMkZHa2hXdkdh?=
 =?utf-8?B?RWc2dHZpRU9Vc2R5TElQNGp2RmlqMUFmTmtZMEpiYWNVNkRTUU5HcmlCWVBQ?=
 =?utf-8?B?UVlrcm1NQ0haQnkrRG9HcjVYU0g0am1Qc00rc3dMckkrQU5wbUpKWU9KZG5p?=
 =?utf-8?B?REdscTl6NFUvZDhTQmphR1FOWC9qU0c0RTEvbElKQkgrQ1pZVFkwUURVUU1L?=
 =?utf-8?B?QVZHdGRSaHNoNkhiNGR2MnlNaTQ2NmhFNmFtRHRvaWY3T3YvRGdDRzNPenM3?=
 =?utf-8?B?d3JTeVlKUTFjdmVVckdWc29MZXhFNnE0NEpFQmxBdWFEMWdxa29kVVd4QzRE?=
 =?utf-8?B?ZisrNFNrT3lvRkdRUkViSmlua3NhNE0xa0Z0UWJuVUJaU1ZHVjV4U1ZqU2JD?=
 =?utf-8?B?OTFoSXYvcHpyR3RFVW1hbTRqNHFUdElIS3llUmxnSkFhL05rSG1UMFQwaVh3?=
 =?utf-8?B?cFhhY2NKMFlZWXJycGwvVWlLTC9qcDlmREMrVlo0d3creDNUdzhDT3k1NUtu?=
 =?utf-8?B?bk1KQ1FySEVzQi81RmdvdWpwOStqazlEdXJjMXlsTjBsTW4weVk4RjNtblpW?=
 =?utf-8?B?Tk9IT01zOTVDT3dYNnRGZ1ByMlRjU3R1YXBxS2d3azh3SGZIaHY5ZTJLQ1lV?=
 =?utf-8?B?Y29zZDdEUTJDVzVXbjVrcUdEYUFBa2RqZ0kzZHFEVHpmNVpvRlR2QzNlcGp1?=
 =?utf-8?B?aGJ0d2ZBMEN5cDRGU2daemdEZ0pUQUd5V1ZIWXRnZjVieEl6NGZvUmxQSjdM?=
 =?utf-8?B?UW9EUWxRcjNOV3pMelZxOVdkaDIxSGo0aXFvcEEyV1ovRGxGRGhxQWJMSmdn?=
 =?utf-8?B?d2d3blhoa05BeHpoaEFmRkNZTHM4UTc0YWowVG91VzhrSTd1L0JIRGZLK21U?=
 =?utf-8?B?R3RGSkx4OGdhdVFUL05CYnIzNm8xS2U1WDc0L0VBb0FGbW4wNVBIZ3FZWU5i?=
 =?utf-8?B?K055ZmJCVG13ekNnQ0VGTVdkVEUyeUZRTFNrbFd3ZGV1MGZ4UlMvUkJGL0xB?=
 =?utf-8?Q?ecvIfx4SprxnXCUKPQ5jivqo9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5be06e0-2d2f-4efc-7b5b-08dd7dbfab60
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:53:52.7118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Foy7evMuQyqnbE32KkbR0q/pBd25jLDVKaYQCu/F4kXmdw6uNIY9Ak85ZKm+aI4HoobTLruRhO297sMmKB5Qnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9406
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

For rest of the patches which are part of the amdgpu tree will push 
incorporating changes as shared by @Tvrtko Ursulin 
<tvrtko.ursulin@igalia.com> once drm change is merged.

Thanks a lot all for the reviews.

Regards

Sunil Khatri

On 4/17/2025 6:01 PM, Sunil Khatri wrote:
> Add a drm helper function which append the process information for
> the drm_file over drm_err formated output.
>
> v5: change to macro from function (Christian Koenig)
>      add helper functions for lock/unlock (Christian Koenig)
>
> v6: remove __maybe_unused and make function inline (Jani Nikula)
>      remove drm_print.h
>
> v7: Use va_format and %pV to concatenate fmt and vargs (Jani Nikula)
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/drm_file.c | 34 ++++++++++++++++++++++++++++++++++
>   include/drm/drm_file.h     |  3 +++
>   2 files changed, 37 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index c299cd94d3f7..7e64d84d4e2d 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -986,6 +986,40 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>   }
>   EXPORT_SYMBOL(drm_show_fdinfo);
>   
> +/**
> + * drm_file_err - Fill info string with process name and pid
> + * @file_priv: context of interest for process name and pid
> + * @fmt: prinf() like format string
> + *
> + * This update the user provided buffer with process
> + * name and pid information for @file_priv
> + */
> +void drm_file_err(struct drm_file *file_priv, const char *fmt, ...)
> +{
> +	struct task_struct *task;
> +	struct pid *pid;
> +	struct drm_device *dev = file_priv->minor->dev;
> +	va_list args;
> +	struct va_format vaf;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	mutex_lock(&file_priv->client_name_lock);
> +	rcu_read_lock();
> +	pid = rcu_dereference(file_priv->pid);
> +	task = pid_task(pid, PIDTYPE_TGID);
> +
> +	drm_err(dev, "comm: %s pid: %d client: %s %pV", task ? task->comm : "",
> +		task ? task->pid : 0, file_priv->client_name ?: "Unset", &vaf);
> +
> +	va_end(args);
> +	rcu_read_unlock();
> +	mutex_unlock(&file_priv->client_name_lock);
> +}
> +EXPORT_SYMBOL(drm_file_err);
> +
>   /**
>    * mock_drm_getfile - Create a new struct file for the drm device
>    * @minor: drm minor to wrap (e.g. #drm_device.primary)
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 94d365b22505..5c3b2aa3e69d 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -446,6 +446,9 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
>   	return file_priv->minor->type == DRM_MINOR_ACCEL;
>   }
>   
> +__printf(2, 3)
> +void drm_file_err(struct drm_file *file_priv, const char *fmt, ...);
> +
>   void drm_file_update_pid(struct drm_file *);
>   
>   struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);
