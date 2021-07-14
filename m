Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ECF3C8548
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 15:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8485B6E2B8;
	Wed, 14 Jul 2021 13:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B636E2B8;
 Wed, 14 Jul 2021 13:26:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIxUw21oxzguspq4vuZazfh+IbMfX+6uaXjIShJPVcXK/ajPF9OuBqz6Y1EJtCKaIkalNf0r18EATWbZlm/jYsa/vj2LkFnJdQEoEutvQHx5DVP4gTisTH6oKVJwLn3zkenkRkgCPFexVbG9/aunQ+LSY8t++xd334xeQaPeYe5US+rB+cJkXj1RU8adgbW7Ae41fhNzYgchoxFGvtqFMKwH3eIy9LQE4E15gkqMFIcTQu5N7ZcxblzcZUpWHpHrSkWxVkC2D06ErV+VFeFazamgPgjvf5mLYgZvaCnDtj5x/elho54x2Gadxvx9PG5hpcmCo34JNfsR3VyTFajTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgvqAT9CT6mSIdo6iq7S2hiLRqTZLGXdHCrk0lDmEBM=;
 b=WGEFqkwzTpVSYjsi0B18ZlVsSQx7KRhZcnf145UI9JrGb0rPDeKhNqh0lkW1BAjILCBi7GXLO5+hfiGom/iF6TCKxbSMp0i4ZKGvxlem9SKQBNcE0dtT6kp+JJq9mvOmpMRyusrAmvdy5U/NbMiIsoFybCmuK02fAe0ApwnS8YySkF9fiOXFmjevNrcyVuNfy/YCIr0sDMf3oT3dVO466eDuM1f8BApN/xaTz9qYTEYgel17Tym6sHX2zdWFxdhP8uXpy+hfNsNuPxrpHKz03NF39o0xAoIVHrXQeJQv7kcx79uhdwdHWAsB7bUjI3/aEJKMjC12cFe3wzyDcaDWww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgvqAT9CT6mSIdo6iq7S2hiLRqTZLGXdHCrk0lDmEBM=;
 b=uIfw1u57l9nAcMZz94XFv8NpSBpVOMMxRjUriRK4XX9eGrMO+Ui7kjHK/HU4gA9OgI6lPnZ2XZuE6ZvtxisxBby+/boXxJFvlfrt22CNr++Y/BECsQOowIlq2ymQpspoUi2202nOomuc9IriG5QGbYRXzuk8D0mmBFX+qPn+oCY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 13:26:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 13:26:43 +0000
Subject: Re: [PATCH v2 2/4] drm/amd/display: Add FPU event trace
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 roman.li@amd.com, anson.jacob@amd.com, hersenxs.wu@amd.com,
 jerry.zuo@amd.com, sunpeng.li@amd.com, aric.cyr@amd.com
References: <20210713140612.2721113-1-Rodrigo.Siqueira@amd.com>
 <20210713140612.2721113-3-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ec8ca3e7-1888-26d9-1e89-7228e3143413@amd.com>
Date: Wed, 14 Jul 2021 15:26:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210713140612.2721113-3-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0030.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 PR3P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.23 via Frontend Transport; Wed, 14 Jul 2021 13:26:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd72cae2-0470-4df2-1310-08d946cb059e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4192:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4192AF1C0EB04390BFDD58BD83139@MN2PR12MB4192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1fw4oZLCmNvL0LNtOcD+KY0v1ATekAP6Z97VC5b+BUAS71cOhPmwabraCVBateD7mG3IqNcayAEOEoPE6QanbTzhZI46vDbcOe+P5uKmy8wBR+GicUfYJVZhHQSRHfVpRpThe41FhMauS4AboN0c70bK8HrLDsrLwWyCWT4BQG4w1ekZ8L9i6nuaAHe+1cP1IMDvv/dXapcmuW1HDjVKRG7muPhNAnTxs20zxVVIRJKp1kExGONiKHTeye2Vc6GrRiBNqi8hYdDYozuYaGR3h+xdpBI2hmsdNzs8nsHExL7w86YQpjizihWSJiWMQSZqNV4SeR+D1zyZosVNPdk5cZgIfgcxd0K6GL1Rb1+KBvcCPhQSbo4eEYvh1inN3LxUjyk37g3KjtzHWCsjpP/8OfwmbLsb4xcEb1zFkKidF0tJAQyr84P4PZYwJDncL/AO5eu0nGF3Ge4EbGTLOa4OikY+ZrfP1hvccgS/TXJxE8DKnez/pHzv1Pk0jurxM5+cRGTauLLOm7MxGKaypgwmWFkSx47oAhptk0J9yDmjpva7fSzpgSs/irubU0QJLYvp5t55gWvQ907nxfTjqkQpI3B1wm4P5mZbMRNL/tjeJbx9jwvkOwld/EbjWj7iMeZvHTMAvyHm98dLXalOxOwdYJEJ04oZZ1vUdev3MhqOZbglgiQyWt0SV5frNiKSEXiCz1RWtOUiMs/C3TDmESizaDum//hyCDHDjx4ad1/q6LbISkLdZtQNevEtavLyGzCf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(2616005)(6666004)(316002)(110136005)(38100700002)(86362001)(186003)(5660300002)(66556008)(66946007)(66476007)(31686004)(36756003)(478600001)(83380400001)(6486002)(8936002)(921005)(8676002)(2906002)(6636002)(31696002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXBVVEhKa1k3R0tXeEpJS2pMdDBOZW1YaVNkWXl2RWpvb1BFSGxBZlo4QSsy?=
 =?utf-8?B?Z21URlVLZWNaMkNMU3J1SndPcW12U1l4WDloWStRZndzbmR4VlJ3cEhsaWlK?=
 =?utf-8?B?TE15OEJ6em0vT0VyQjgrNnVhTlBFcnlLUWxiMUhCNEFaaENQYm4xMk1FNmd2?=
 =?utf-8?B?NEVDS2RNZGNIVzFxTCs0Q1F1Vk5xaTNMR2pDMTlIM0dOVW5hZmV1bEora0g4?=
 =?utf-8?B?c3ZPYUw4K0V1cEVFelg3SGk3d25wL0xLTzdTRk01TUNtZ0o2aWg1bEhpcVY2?=
 =?utf-8?B?VlpJQXdEVjl1azlnamRicUpLL2NVWllEbXk0MktvajdMR002MGtWZ04yeWN6?=
 =?utf-8?B?VEhhSHNvU1Q1eUU5VlpNN1RETFZ5QzBFYlp4aDNBQ0gxM25hUUsrbEd3Ty9V?=
 =?utf-8?B?cEdMM1hUaUlwdjlkYXozcHNHWmcyWjloUjlhM3NabHgyZzFGcVM4YVNiSUcx?=
 =?utf-8?B?eVVLcXFtdVpRempqWkQrWDhiSVVveWdwa0tMYTcwOTVuemNlTTFnQ1E1c0xG?=
 =?utf-8?B?OFoyT0R5a2dlMG5vN0V4eDFQZzFmNEpGV3YxUE41NU9mMXFSVkgwNlZwUDho?=
 =?utf-8?B?YU9kMFZzM3FLWndPYjg1c3VmbHQzempmMG15YWhUeVJBM2VNdmtvTmJlRUtt?=
 =?utf-8?B?N21rZWJndnlpelZzT1NvMVBpbmJKd0dEU1hrWldaYitXZ3ZVTkdwYkRmR0Ra?=
 =?utf-8?B?elZSWm5HVjdVKzY0WWtDV1gzQ3JLbGJ1cjdJbHRlRXlQVVNwRUNGcVY4Ym1Z?=
 =?utf-8?B?SXUyRFc5NGVBcVVJaSswb2d0eWU4N1dpdkhLQTBRVlRtTVhrYktoMHBCcTJB?=
 =?utf-8?B?VC9KNFNGbWZSK2JTTEs0K0o5YkNyRjBHUzJjZ2hYU2ZEQVZacWoza2xUdkph?=
 =?utf-8?B?NHVDYjQyT0kycmlHS2l3MXM1Nkxlb0FRQzB5L0dQMnc3d3UzTmZNS203WGRu?=
 =?utf-8?B?ZlpveWpsVnJ4akpOUnFXNGFmN0YxR2J5OVk0WWRQaC9YQzFYQnlIRmQxMy96?=
 =?utf-8?B?V2l6T1NGNzNLMXk3L2Q2WUZOM3kxcXV4ZTBaZTIwMnhYUlpva0ZaaERyTVBD?=
 =?utf-8?B?OHNYYXdZRVpVSnEwYXN6Q0N4d1V1M001THpoWGpsN2RSV0RDWUd5OVd6M3hC?=
 =?utf-8?B?RGVjNlhKbjAyclgwcUFBeForMnYwREZtSFlENUhnd1M1Nko2R2k4Qm9TczN4?=
 =?utf-8?B?T3RMUjczTjl5c0NBQWJkMFdaQkE1cnJmWUpoNzh2YklxVDlxMDJqYmhxdmNu?=
 =?utf-8?B?bzY1c3Vaam1FQUdXOFJTcWlraTI4QXc3S0p1TEFpaVEyOXBNdGdQQTVkRTVV?=
 =?utf-8?B?NDY2TWxvUWNvUUdnMGsrWlEwNUpEOTJNUHBpanRVcmtyRXBCN2tleDh2Z3M2?=
 =?utf-8?B?bmpQV1RsRzhEWVZhOWJTUlpCUkQ4STJpelFMRjNzN0Mxa0NnWkxUdXFHZ3V1?=
 =?utf-8?B?NjFaUDdzSXBxVkNXZjJjKy9aNGRwNldRdXRacUpXL0dkOGsrUCtBc29GNWh1?=
 =?utf-8?B?bEttS3ltMVdUbTB4TEg3UFAxY1hKNmE3WFR1by9wVUFKejF1NTc0ejRtUUp2?=
 =?utf-8?B?Nks1ZDROQWcyd0hob2U3anJNMlhSMkZrUUJ1UHBYQ2ZBR0VLZTcyTi95TThv?=
 =?utf-8?B?L2xuVGFSdEljVVVaQzdRcG12MlRNNEdqYjRnaGF2VXFPNGNsMGJxaHlTVjFn?=
 =?utf-8?B?VGZ3SldJSmthbkVVbFVEU1hObzJVUGFpNGtSRW5RZk1yVFZvd0NUbVREOVNQ?=
 =?utf-8?B?a1ZOVnVCc2lmTnp0MXRaYlNSL3BXNWR0U3NDb2RZMFNkNWlRcGU4UUtpWVJh?=
 =?utf-8?B?c0k5NGw0RWZZVHRUMHRzSDc2TUoyK2UrUFhtVWhuTFphT1pVUXVZaWdmZ3Vw?=
 =?utf-8?Q?MoMJwinDHWlXn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd72cae2-0470-4df2-1310-08d946cb059e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 13:26:43.7256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x04oXPt1evG+M6OIWIlQ82jFhiHlfH0iQkl7SH18+nNnLwCV1m4CwM1JFIl2PGjl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4192
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.07.21 um 16:06 schrieb Rodrigo Siqueira:
> We don't have any mechanism for tracing FPU operations inside the
> display core, making the debug work a little bit tricky. This commit
> introduces a trace mechanism inside our DC_FP_START/END macros for
> trying to alleviate this problem.
>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 21 ++++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 64 +++++++++++++++++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    | 33 ++++++++++
>   drivers/gpu/drm/amd/display/dc/dc_trace.h     |  3 +
>   drivers/gpu/drm/amd/display/dc/os_types.h     |  6 +-
>   6 files changed, 126 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> index 91fb72c96545..5f7fd4474379 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> @@ -25,7 +25,8 @@
>   
>   
>   
> -AMDGPUDM = amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm_color.o
> +AMDGPUDM = amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm_color.o \
> +	dc_fpu.o
>   
>   ifneq ($(CONFIG_DRM_AMD_DC),)
>   AMDGPUDM += amdgpu_dm_services.o amdgpu_dm_helpers.o amdgpu_dm_pp_smu.o amdgpu_dm_psr.o
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> index 46a33f64cf8e..230bb12c405e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> @@ -637,6 +637,27 @@ TRACE_EVENT(amdgpu_refresh_rate_track,
>   		  __entry->refresh_rate_ns)
>   );
>   
> +TRACE_EVENT(dcn_fpu,
> +	    TP_PROTO(bool begin, const char *function, const int line),
> +	    TP_ARGS(begin, function, line),
> +
> +	    TP_STRUCT__entry(
> +			     __field(bool, begin)
> +			     __field(const char *, function)
> +			     __field(int, line)
> +	    ),
> +	    TP_fast_assign(
> +			   __entry->begin = begin;
> +			   __entry->function = function;
> +			   __entry->line = line;
> +	    ),
> +	    TP_printk("%s()+%d: %s",
> +		      __entry->function,
> +		      __entry->line,
> +		      __entry->begin ? "begin" : "end"
> +	    )
> +);
> +
>   #endif /* _AMDGPU_DM_TRACE_H_ */
>   
>   #undef TRACE_INCLUDE_PATH
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> new file mode 100644
> index 000000000000..d5d156a4517e
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#include "dc_trace.h"
> +
> +#include <asm/fpu/api.h>
> +
> +/**
> + * dc_fpu_begin - Enables FPU protection
> + * @function_name: A string containing the function name for debug purposes
> + *   (usually __func__)
> + *
> + * @line: A line number where DC_FP_START was invoked for debug purpose
> + *   (usually __LINE__)
> + *
> + * This function is responsible for managing the use of kernel_fpu_begin() with
> + * the advantage of providing an event trace for debugging.
> + *
> + * Note: Do not call this function directly; always use DC_FP_START().
> + */
> +void dc_fpu_begin(const char *function_name, const int line)
> +{
> +	TRACE_DCN_FPU(true, function_name, line);
> +	kernel_fpu_begin();

The build robot has pointed that out as well, the kernel_fpu_begin() and 
kernel_fpu_end() functions are x86 specific and don't exist on other 
architectures in this form.

> +}
> +
> +/**
> + * dc_fpu_end - Disable FPU protection
> + * @function_name: A string containing the function name for debug purposes
> + * @line: A-line number where DC_FP_END was invoked for debug purpose
> + *
> + * This function is responsible for managing the use of kernel_fpu_end() with
> + * the advantage of providing an event trace for debugging.
> + *
> + * Note: Do not call this function directly; always use DC_FP_END().
> + */
> +void dc_fpu_end(const char *function_name, const int line)
> +{
> +	TRACE_DCN_FPU(false, function_name, line);
> +	kernel_fpu_end();
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> new file mode 100644
> index 000000000000..fb54983c5c60
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#ifndef __DC_FPU_H__
> +#define __DC_FPU_H__
> +
> +void dc_fpu_begin(const char *function_name, const int line);
> +void dc_fpu_end(const char *function_name, const int line);
> +
> +#endif /* __DC_FPU_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_trace.h b/drivers/gpu/drm/amd/display/dc/dc_trace.h
> index d2615357269b..d598ba697e45 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_trace.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_trace.h
> @@ -37,3 +37,6 @@
>   
>   #define TRACE_DCN_CLOCK_STATE(dcn_clocks) \
>   	trace_amdgpu_dm_dc_clocks_state(dcn_clocks)
> +
> +#define TRACE_DCN_FPU(begin, function, line) \
> +	trace_dcn_fpu(begin, function, line)
> diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
> index 126c2f3a4dd3..2ba49aef370d 100644
> --- a/drivers/gpu/drm/amd/display/dc/os_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/os_types.h
> @@ -52,9 +52,9 @@
>   
>   #if defined(CONFIG_DRM_AMD_DC_DCN)
>   #if defined(CONFIG_X86)
> -#include <asm/fpu/api.h>
> -#define DC_FP_START() kernel_fpu_begin()
> -#define DC_FP_END() kernel_fpu_end()
> +#include "amdgpu_dm/dc_fpu.h"

You really want to include that independent of CONFIG_X86 I think.

Regards,
Christian.

> +#define DC_FP_START() dc_fpu_begin(__func__, __LINE__)
> +#define DC_FP_END() dc_fpu_end(__func__, __LINE__)
>   #elif defined(CONFIG_PPC64)
>   #include <asm/switch_to.h>
>   #include <asm/cputable.h>

