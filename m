Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5AB4A9F07
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 19:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACE410E468;
	Fri,  4 Feb 2022 18:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0558F10E1E2;
 Fri,  4 Feb 2022 18:29:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0+xcUyypq7EXKkCTodAvBCrYXvUztQ23Fv2MKUF4HmWu3aT02CIm2flhkrjwMZ7bgmaLYZtxAf5Cy2kafRaspUSEPCZ6VwIwqs4vggU3SwJBwSNEbK72h88Fx/d4GyAvRqcDCmSJ2lKinkGqMzsAKQIPpnmEYB+cyBmy1cQn3DpzS8/9oUG0Wwtt5D4Vrtd2TF3SJVtulybWZC2H5vQS8gfCh2p2+JFSjFzJixxtaCxdAXUmhrNKe/xm+isWvY9y96gTvj+nQ30rE6Y5IO5i/pLxUftkGBSLDGOLysj65Nj1NtVzw93Cd8KK6YOewIAj/XEZMHlIi5sgz5DD2/E7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLoeuJ7IfZUrDJgREsXBIMcvAjwPGn4btZGZCkDX89M=;
 b=gqeJxA2nh/nb+5mVDSZaYfjlfQPU8SpaEpT213dNh4xOSWkZbmT645Nam5XM3vkRROAya4xL1qGvWwFduDJ9q/2njHyWvy/ioTrVIIkNrQ249dP7lFoYRYCTM3ApYbB+UgR2DsmLNXs5Ikf8qQU06Lj9z5QMDuYDANuIjYukghiKfUx62rBDdwGiEbe/PqIPBXcFVOxOaTDdihSd3EeZWY0lPOb+8wf8B/eJ8d9B2ssUhh/eUJ5xb6gkq5czAf8N8+i6Tb0/Kc597fgHH0rOIWbVymzaRCcmMcwUsITKOIuSubvxfr8qybeiUak0e2RSQZ4G7yCMzQ9IptBOWNNuRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLoeuJ7IfZUrDJgREsXBIMcvAjwPGn4btZGZCkDX89M=;
 b=fuu2N9aLEoG43/7psUOUAWFb/lQOeLsubr4dgMgT9smb6+KHtaos84Fva4TeLOqQJmpeildxNx0KU8ir/pD/TDx5sUCWeifE6RaRaP+w01+dqjTPrLKkdS1PPrv3FOKBuA4FrPAHTIy8xwxfD6/xMgOUmhIRufqtVHONMWAYcfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB2978.namprd12.prod.outlook.com (2603:10b6:408:42::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 18:29:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 18:29:56 +0000
Message-ID: <28be9b4b-dbe1-28fa-e013-570c45a5c705@amd.com>
Date: Fri, 4 Feb 2022 19:29:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/3] drm: Extract amdgpu_sa.c as a generic
 suballocation helper
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220204174809.3366967-1-maarten.lankhorst@linux.intel.com>
 <20220204174809.3366967-2-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220204174809.3366967-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0202CA0058.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::35) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da3afd6b-21af-4951-247b-08d9e80c57b7
X-MS-TrafficTypeDiagnostic: BN8PR12MB2978:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB29780C4DEC4C22BB1D8305E383299@BN8PR12MB2978.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fZK4yzizgBOiXsVz8ZY1FPFvn1f4bpjV916c72KPw+pglIWdn24yBxIxoPLKmYefE4jzEKRiIJEVAv93i7anCO6ahtQOlnPEC3E6vnYSGMBJzPdwzFBGO+q/aInGstJBJ/gvsjjZyUqgFWZIXZcCEZE0qMU09kEiGuK7QHzpa1/1m0DyGltlcvjkvLXhl6RjHyJaaoc+hub98sqC4EQ4Y5QWj/Fa/SggTARE64GItI3dGuhjEg8ATaY7RcwnZyUHUhMsNgjGFsqRcxwALgHt/KkhbKfbtQ5yBV7C1fdKrzrpKx5WAM29aiuxDcVMB+1thngpthdFUEku2NkcGoIklKZXh5IVK55dQrbClTKpjlPxyMXTnfA7ymrXLPkVQoAgn1xBdC1236iS+ea2RWSSOpF1nG3Cve6R9sIYjsDpvVwXFp8/hWslwJ5pRqcZXeoivN9g5Ai/XQtZm3i90FpP4l7hzbEMyGUbi0zYBl9gBD4Uw3K4uNokjSKaRw/9YxYCGiAwwhA0RLbMGMlcMF4mCII9CLRAXQy9zVSaeTeoe3QQcJcAQD2ppJBfQIZC37HDFaPvjP9lEik09oDqGKvKz4n7vm/s2AQORT/3laHbJU57Ii8sq3G8ZAZwM6SZUoO9l2ILiFRCm47TFRC6hsU4LtMo/WkBg6bv0Rulc3hDCcdxTZzjp4S8/6YoyaaEZ88mc870I49HO0l8uYOjY1mh+sU9ZZ3kZ5CUPsGYbbcz/K6+XzuLQ3gVVHIJKwjDO4KPZO/xjGic/vpDrB6aWb3Gbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(186003)(36756003)(6486002)(38100700002)(66946007)(30864003)(31686004)(2906002)(6506007)(6512007)(54906003)(2616005)(83380400001)(86362001)(316002)(508600001)(4326008)(66556008)(6666004)(66476007)(31696002)(8676002)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk02ellGaTMvOXBPTlJUNElnUkNFY3g4aUIvRzUwNWcrbGgrSjNuV1V5QUR4?=
 =?utf-8?B?SWJwdVlrOXRIUUpXWFNuS2lUMDU2dmVlTTcxdFZBbnpadUJEd3hnN0thdXRN?=
 =?utf-8?B?bkszL0VPQUlVcWQwZ3d6aEtDd3RpcGhYMkdtbE1iR01ESEtJUUVVVDJlVDZ6?=
 =?utf-8?B?OS9BTDRkT0lXdjl6aFdteUZKamdZcnNFdWFuRlJpbktSdU9NeXlSOGtKYU5D?=
 =?utf-8?B?cU5TYWhkcXNBUHNJb0lMWjJhN1FLVXYxR052c0xRTzV6bEVqbi8rUStlR0p3?=
 =?utf-8?B?RDBJRVduVWdpcWVEMm12eWNPZzI2Q3FpMWU2blNEQmc2U0VOeG13ZW95Vzcv?=
 =?utf-8?B?ZHJ1WjRYWitTYUhPWkNwNlQzZUNRSzhLcEIvYnN4YVdPdWVsL3FPaGdsSXR2?=
 =?utf-8?B?a1hOZWcwY0MxZW1keW42V0xJMlYvc25rRk5WNXV0cVNkdkdSakxlM1lmY1Zp?=
 =?utf-8?B?ZGtCbFB1OWZPTTh3eHlQZWRzWFIwZm9yZG1iZjJmaUV0dy92RjIxK0RRem1p?=
 =?utf-8?B?dHJiVlJOS1kvckZTUCtiR0UwRFhOdVRlNEZHNXJaV1FIbU5XQ3FxOHJLZkMy?=
 =?utf-8?B?djJjc3ZlQXZ1N2hTRmhWQ0FNclFzMCticFp2RUFLeE9wOVR6SjFOMnFUeEUv?=
 =?utf-8?B?RnZNQ20waHFHQ0dOZkR5ZVJHVmpsY3lBSVloQTdaNFFZbnp1VHMxMHgyTkFE?=
 =?utf-8?B?TlN3QlVSQ1ZKcUFmV2wwdi9EZGNuL2UyVXBDQTJJZHFUNnpQd2dmYXVNQkFi?=
 =?utf-8?B?SUwydGo2Ukc3eGExeXFhY0lRUzRLOFZya1Jrclgya0M5TkFLYi9DcnkrZ1N5?=
 =?utf-8?B?U3hON1ZzMVBRaDdUV3BRd1J1bEE5Mk0yaUM1ekNpOW42V2E5QmJ4QXpoWDAz?=
 =?utf-8?B?Z2N2ZW1LdXE1N1UxYXpZVDJ3NmtZYzdYM1VxbkcwajVYNDBJNlliNW9kb2Qr?=
 =?utf-8?B?RDByUVNvZTNhOXVnTmwxMS9MVVl6elBoK0pWNDhLTkozalkvV0NYN0oycC8z?=
 =?utf-8?B?dEhkZmRJUWZaYURtUkVHdTlHYm15Snl2RXpEcmxEc1BpdVZmZW5Iak1ZZVFn?=
 =?utf-8?B?K21GMjEwM0g4bmExWHdEWUJBUkVaeGpQdklWRnZoQmRBYjZwRm43Y3lKVEhh?=
 =?utf-8?B?QUJXR0RiRGM1SC9zN2szQk43V25aS2VRSXJRUkJ6WVE1cGZNVE9oOTFRYjlI?=
 =?utf-8?B?L2ZKbzRaVUFoZkVhRUVaNjF1Sk5ZdHlVTkh6RGx6bENwWE1CSWdUaEdEU2d6?=
 =?utf-8?B?bmtGNnpkQ2FaM0puSTgwdDVtUzZnOVVwRWhWcldhUG1TTmY1WUFOb1FZcGJ6?=
 =?utf-8?B?cjFwaFpQMW56YS9DQkZKdEUrakJoY01YRHVSQVA1TmNMZ2RZTjdnQWhtbDNj?=
 =?utf-8?B?UU9yWXhUNlF0REdDYXRvK25JWGoxY1V4NktSNWtkMFBvaEFURGlFMnJzdnVZ?=
 =?utf-8?B?RW53UDBPNnlDbzMzcXBmdFVSbTY0d0hpY0c2RWo0dEF3VXJqb05KQkhpUFpr?=
 =?utf-8?B?RG1oWFpQNG9TUjRMZ291NHpTcGlyZmNuL3hja2N0YjRVQ1Vaam9FeHp4OWQ1?=
 =?utf-8?B?N082YU8yNVFISE8xZVN2NFFic0taWFNRZm1rUnV5VGtpSkp6S0ltdmw3TWdw?=
 =?utf-8?B?dGtmblFicS80QWNoQjI2WVVWa2ltbmpIMnF6NmhKU3FhV2xqM085YzdkaCs1?=
 =?utf-8?B?UUlEYTJlWXVWWHFtZ3RlQ0VNaldCV1M3MlhPSnJNeTVsQ2R4VTA0TFlhUjJJ?=
 =?utf-8?B?bkJLSmhyZjFnNVhkQUZwOGVNeTNlOFlOY2VJc2YwTWRaZXpoWHhoeUNkcTNP?=
 =?utf-8?B?YWJqbkdUb08vVHV1cGtzdDhzS1luQ09UaEN5eW40UVc2TXBGSWl4UDJBSWtH?=
 =?utf-8?B?MEtpNmEvYk10dnVuWk82dHBnWFFQSUx5cWN5WDNVSysrWWFyUWUzVXk1QllN?=
 =?utf-8?B?WDNOdmplY3VPOU9obkkwQkNRU0JMTG9PQ3dremNGQmppNFljYTNtT1FHOGVy?=
 =?utf-8?B?SmlUZGlBNmswbG5PaG83R0xndWgyNTM2WUk1cXI2Mlk2T3FMQnlVMnhzY3dI?=
 =?utf-8?B?UlRvTndPNGg3M0tFTkVDVzk4US94eERmSWFxTzYzOUdMMmd0VjlTSm9EaXpS?=
 =?utf-8?B?THVtVGRNMlVJYTJvRTdBeGFsNVpOdSsrT3pTWkNVZG5aai9lMXFJTXB2RTB1?=
 =?utf-8?Q?3jSMefRyjRzm8L4kcfDbYtk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3afd6b-21af-4951-247b-08d9e80c57b7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 18:29:56.2101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+bRiWkqdZKLk3NJinr1G78E9x3mXrkh47MHVKnf4DNwQvaT98jQNaHx4XiaAr22
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2978
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oh, that's on my TODO list for years!

Am 04.02.22 um 18:48 schrieb Maarten Lankhorst:
> Suballocating a buffer object is something that is not driver
> generic, and is useful for other drivers as well.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/Makefile       |   4 +-
>   drivers/gpu/drm/drm_suballoc.c | 424 +++++++++++++++++++++++++++++++++
>   include/drm/drm_suballoc.h     |  78 ++++++
>   3 files changed, 505 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/drm_suballoc.c
>   create mode 100644 include/drm/drm_suballoc.h
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 8675c2af7ae1..b848bcf8790c 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -57,7 +57,9 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
>   		drm_scdc_helper.o drm_gem_atomic_helper.o \
>   		drm_gem_framebuffer_helper.o \
>   		drm_atomic_state_helper.o drm_damage_helper.o \
> -		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
> +		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o \
> +		drm_suballoc.o
> +

I think we should put that into a separate module like we now do with 
other helpers as well.

>   drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
>   drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
>   
> diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
> new file mode 100644
> index 000000000000..e0bb35367b71
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_suballoc.c
> @@ -0,0 +1,424 @@
> +/*
> + * Copyright 2011 Red Hat Inc.
> + * All Rights Reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portions
> + * of the Software.
> + *
> + */
> +/*
> + * Authors:
> + *    Jerome Glisse <glisse@freedesktop.org>
> + */

That is hopelessly outdated. IIRC I completely rewrote that stuff in ~2012.

> +/* Algorithm:
> + *
> + * We store the last allocated bo in "hole", we always try to allocate
> + * after the last allocated bo. Principle is that in a linear GPU ring
> + * progression was is after last is the oldest bo we allocated and thus
> + * the first one that should no longer be in use by the GPU.
> + *
> + * If it's not the case we skip over the bo after last to the closest
> + * done bo if such one exist. If none exist and we are not asked to
> + * block we report failure to allocate.
> + *
> + * If we are asked to block we wait on all the oldest fence of all
> + * rings. We just wait for any of those fence to complete.
> + */
> +
> +#include <drm/drm_suballoc.h>
> +#include <drm/drm_print.h>
> +#include <linux/slab.h>
> +#include <linux/sched.h>
> +#include <linux/wait.h>
> +#include <linux/dma-fence.h>
> +
> +static void drm_suballoc_remove_locked(struct drm_suballoc *sa);
> +static void drm_suballoc_try_free(struct drm_suballoc_manager *sa_manager);
> +
> +/**
> + * drm_suballoc_manager_init - Initialise the drm_suballoc_manager
> + *
> + * @sa_manager: pointer to the sa_manager
> + * @size: number of bytes we want to suballocate
> + * @align: alignment for each suballocated chunk
> + *
> + * Prepares the suballocation manager for suballocations.
> + */
> +void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
> +			       u32 size, u32 align)
> +{
> +	u32 i;
> +
> +	if (!align)
> +		align = 1;
> +
> +	/* alignment must be a power of 2 */
> +	BUG_ON(align & (align - 1));

When we move that I think we should cleanup the code once more, e.g. use 
is_power_of_2() function here for example.

There are also a bunch of places with extra {} and constructs like "if 
(....) return true; else return false;" which could certainly be simplified.

Apart from that really great idea.

Regards,
Christian.

> +
> +	init_waitqueue_head(&sa_manager->wq);
> +	sa_manager->size = size;
> +	sa_manager->align = align;
> +	sa_manager->hole = &sa_manager->olist;
> +	INIT_LIST_HEAD(&sa_manager->olist);
> +	for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
> +		INIT_LIST_HEAD(&sa_manager->flist[i]);
> +}
> +EXPORT_SYMBOL(drm_suballoc_manager_init);
> +
> +/**
> + * drm_suballoc_manager_fini - Destroy the drm_suballoc_manager
> + *
> + * @sa_manager: pointer to the sa_manager
> + *
> + * Cleans up the suballocation manager after use. All fences added
> + * with drm_suballoc_free() must be signaled, or we cannot clean up
> + * the entire manager.
> + */
> +void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager)
> +{
> +	struct drm_suballoc *sa, *tmp;
> +
> +	if (!sa_manager->size)
> +		return;
> +
> +	if (!list_empty(&sa_manager->olist)) {
> +		sa_manager->hole = &sa_manager->olist,
> +		drm_suballoc_try_free(sa_manager);
> +		if (!list_empty(&sa_manager->olist))
> +			DRM_ERROR("sa_manager is not empty, clearing anyway\n");
> +	}
> +	list_for_each_entry_safe(sa, tmp, &sa_manager->olist, olist) {
> +		drm_suballoc_remove_locked(sa);
> +	}

> +
> +	sa_manager->size = 0;
> +}
> +EXPORT_SYMBOL(drm_suballoc_manager_fini);
> +
> +static void drm_suballoc_remove_locked(struct drm_suballoc *sa)
> +{
> +	struct drm_suballoc_manager *sa_manager = sa->manager;
> +	if (sa_manager->hole == &sa->olist) {
> +		sa_manager->hole = sa->olist.prev;
> +	}
> +	list_del_init(&sa->olist);
> +	list_del_init(&sa->flist);
> +	dma_fence_put(sa->fence);
> +	kfree(sa);
> +}
> +
> +static void drm_suballoc_try_free(struct drm_suballoc_manager *sa_manager)
> +{
> +	struct drm_suballoc *sa, *tmp;
> +
> +	if (sa_manager->hole->next == &sa_manager->olist)
> +		return;
> +
> +	sa = list_entry(sa_manager->hole->next, struct drm_suballoc, olist);
> +	list_for_each_entry_safe_from(sa, tmp, &sa_manager->olist, olist) {
> +		if (sa->fence == NULL ||
> +		    !dma_fence_is_signaled(sa->fence)) {
> +			return;
> +		}
> +		drm_suballoc_remove_locked(sa);
> +	}
> +}
> +
> +static inline unsigned drm_suballoc_hole_soffset(struct drm_suballoc_manager *sa_manager)
> +{
> +	struct list_head *hole = sa_manager->hole;
> +
> +	if (hole != &sa_manager->olist) {
> +		return list_entry(hole, struct drm_suballoc, olist)->eoffset;
> +	}
> +	return 0;
> +}
> +
> +static inline unsigned drm_suballoc_hole_eoffset(struct drm_suballoc_manager *sa_manager)
> +{
> +	struct list_head *hole = sa_manager->hole;
> +
> +	if (hole->next != &sa_manager->olist) {
> +		return list_entry(hole->next, struct drm_suballoc, olist)->soffset;
> +	}
> +	return sa_manager->size;
> +}
> +
> +static bool drm_suballoc_try_alloc(struct drm_suballoc_manager *sa_manager,
> +				   struct drm_suballoc *sa,
> +				   unsigned size)
> +{
> +	unsigned soffset, eoffset;
> +
> +	soffset = drm_suballoc_hole_soffset(sa_manager);
> +	eoffset = drm_suballoc_hole_eoffset(sa_manager);
> +
> +	if ((eoffset - soffset) >= size) {
> +		sa->manager = sa_manager;
> +		sa->soffset = soffset;
> +		sa->eoffset = soffset + size;
> +		list_add(&sa->olist, sa_manager->hole);
> +		INIT_LIST_HEAD(&sa->flist);
> +		sa_manager->hole = &sa->olist;
> +		return true;
> +	}
> +	return false;
> +}
> +
> +/**
> + * drm_suballoc_event - Check if we can stop waiting
> + *
> + * @sa_manager: pointer to the sa_manager
> + * @size: number of bytes we want to allocate
> + * @align: alignment we need to match
> + *
> + * Check if either there is a fence we can wait for or
> + * enough free memory to satisfy the allocation directly
> + */
> +static bool drm_suballoc_event(struct drm_suballoc_manager *sa_manager,
> +			       u32 size)
> +{
> +	unsigned soffset, eoffset, i;
> +
> +	for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
> +		if (!list_empty(&sa_manager->flist[i]))
> +			return true;
> +
> +	soffset = drm_suballoc_hole_soffset(sa_manager);
> +	eoffset = drm_suballoc_hole_eoffset(sa_manager);
> +
> +	if ((eoffset - soffset) >= size) {
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
> +				   struct dma_fence **fences,
> +				   unsigned *tries)
> +{
> +	struct drm_suballoc *best_bo = NULL;
> +	unsigned i, best_idx, soffset, best, tmp;
> +
> +	/* if hole points to the end of the buffer */
> +	if (sa_manager->hole->next == &sa_manager->olist) {
> +		/* try again with its beginning */
> +		sa_manager->hole = &sa_manager->olist;
> +		return true;
> +	}
> +
> +	soffset = drm_suballoc_hole_soffset(sa_manager);
> +	/* to handle wrap around we add sa_manager->size */
> +	best = sa_manager->size * 2;
> +	/* go over all fence list and try to find the closest sa
> +	 * of the current last
> +	 */
> +	for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i) {
> +		struct drm_suballoc *sa;
> +
> +		fences[i] = NULL;
> +
> +		if (list_empty(&sa_manager->flist[i]))
> +			continue;
> +
> +		sa = list_first_entry(&sa_manager->flist[i],
> +					 struct drm_suballoc, flist);
> +
> +		if (!dma_fence_is_signaled(sa->fence)) {
> +			fences[i] = sa->fence;
> +			continue;
> +		}
> +
> +		/* limit the number of tries each freelist gets */
> +		if (tries[i] > 2) {
> +			continue;
> +		}
> +
> +		tmp = sa->soffset;
> +		if (tmp < soffset) {
> +			/* wrap around, pretend it's after */
> +			tmp += sa_manager->size;
> +		}
> +		tmp -= soffset;
> +		if (tmp < best) {
> +			/* this sa bo is the closest one */
> +			best = tmp;
> +			best_idx = i;
> +			best_bo = sa;
> +		}
> +	}
> +
> +	if (best_bo) {
> +		++tries[best_idx];
> +		sa_manager->hole = best_bo->olist.prev;
> +
> +		/* we knew that this one is signaled,
> +		   so it's save to remote it */
> +		drm_suballoc_remove_locked(best_bo);
> +		return true;
> +	}
> +	return false;
> +}
> +
> +/**
> + * drm_suballoc_new - Make a suballocation.
> + *
> + * @sa_manager: pointer to the sa_manager
> + * @size: number of bytes we want to suballocate.
> + *
> + * Try to make a suballocation of size @size, which will be rounded
> + * up to the alignment specified in specified in drm_suballoc_manager_init().
> + *
> + * Returns a new suballocated bo, or an ERR_PTR.
> + */
> +struct drm_suballoc *
> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, u32 size)
> +{
> +	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
> +	unsigned tries[DRM_SUBALLOC_MAX_QUEUES];
> +	unsigned count;
> +	int i, r;
> +	struct drm_suballoc *sa;
> +
> +	size = ALIGN(size, sa_manager->align);
> +	if (WARN_ON_ONCE(size > sa_manager->size))
> +		return ERR_PTR(-EINVAL);
> +
> +	sa = kmalloc(sizeof(struct drm_suballoc), GFP_KERNEL);
> +	if (!sa)
> +		return ERR_PTR(-ENOMEM);
> +	sa->manager = sa_manager;
> +	sa->fence = NULL;
> +	INIT_LIST_HEAD(&sa->olist);
> +	INIT_LIST_HEAD(&sa->flist);
> +
> +	spin_lock(&sa_manager->wq.lock);
> +	do {
> +		for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
> +			tries[i] = 0;
> +
> +		do {
> +			drm_suballoc_try_free(sa_manager);
> +
> +			if (drm_suballoc_try_alloc(sa_manager, sa,
> +						   size)) {
> +				spin_unlock(&sa_manager->wq.lock);
> +				return sa;
> +			}
> +
> +			/* see if we can skip over some allocations */
> +		} while (drm_suballoc_next_hole(sa_manager, fences, tries));
> +
> +		for (i = 0, count = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
> +			if (fences[i])
> +				fences[count++] = dma_fence_get(fences[i]);
> +
> +		if (count) {
> +			long t;
> +
> +			spin_unlock(&sa_manager->wq.lock);
> +			t = dma_fence_wait_any_timeout(fences, count, true,
> +						       MAX_SCHEDULE_TIMEOUT,
> +						       NULL);
> +			for (i = 0; i < count; ++i)
> +				dma_fence_put(fences[i]);
> +
> +			r = (t > 0) ? 0 : t;
> +			spin_lock(&sa_manager->wq.lock);
> +		} else {
> +			/* if we have nothing to wait for block */
> +			r = wait_event_interruptible_locked(
> +				sa_manager->wq,
> +				drm_suballoc_event(sa_manager, size)
> +			);
> +		}
> +
> +	} while (!r);
> +
> +	spin_unlock(&sa_manager->wq.lock);
> +	kfree(sa);
> +	return ERR_PTR(r);
> +}
> +EXPORT_SYMBOL(drm_suballoc_new);
> +
> +/**
> + * drm_suballoc_free - Free a suballocation
> + *
> + * @suballoc: pointer to the suballocation
> + * @fence: fence that signals when suballocation is idle
> + * @queue: the index to which queue the suballocation will be placed on the free list.
> + *
> + * Free the suballocation. The suballocation can be re-used after @fence signals.
> + * @queue is used to allow waiting on multiple fence contexts in parallel in
> + * drm_suballoc_new().
> + */
> +void drm_suballoc_free(struct drm_suballoc *suballoc,
> +		       struct dma_fence *fence,
> +		       u32 queue)
> +{
> +	struct drm_suballoc_manager *sa_manager;
> +
> +	if (!suballoc)
> +		return;
> +
> +	sa_manager = suballoc->manager;
> +	BUG_ON(queue >= DRM_SUBALLOC_MAX_QUEUES);
> +
> +	spin_lock(&sa_manager->wq.lock);
> +	if (fence && !dma_fence_is_signaled(fence)) {
> +		suballoc->fence = dma_fence_get(fence);
> +		list_add_tail(&suballoc->flist, &sa_manager->flist[queue]);
> +	} else {
> +		drm_suballoc_remove_locked(suballoc);
> +	}
> +	wake_up_all_locked(&sa_manager->wq);
> +	spin_unlock(&sa_manager->wq.lock);
> +}
> +EXPORT_SYMBOL(drm_suballoc_free);
> +
> +#ifdef CONFIG_DEBUG_FS
> +void drm_suballoc_dump_debug_info(struct drm_suballoc_manager *sa_manager,
> +				  struct seq_file *m, u64 suballoc_base)
> +{
> +	struct drm_suballoc *i;
> +
> +	spin_lock(&sa_manager->wq.lock);
> +	list_for_each_entry(i, &sa_manager->olist, olist) {
> +		uint64_t soffset = i->soffset;
> +		uint64_t eoffset = i->eoffset;
> +		if (&i->olist == sa_manager->hole) {
> +			seq_printf(m, ">");
> +		} else {
> +			seq_printf(m, " ");
> +		}
> +		seq_printf(m, "[0x%010llx 0x%010llx] size %8lld",
> +			   suballoc_base + soffset, suballoc_base + eoffset, eoffset - soffset);
> +
> +		if (i->fence)
> +			seq_printf(m, " protected by 0x%016llx on context %llu",
> +				   i->fence->seqno, i->fence->context);
> +
> +		seq_printf(m, "\n");
> +	}
> +	spin_unlock(&sa_manager->wq.lock);
> +}
> +EXPORT_SYMBOL(drm_suballoc_dump_debug_info);
> +#endif
> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
> new file mode 100644
> index 000000000000..846c4a792fac
> --- /dev/null
> +++ b/include/drm/drm_suballoc.h
> @@ -0,0 +1,78 @@
> +/*
> + * SPDX-License-Identifier: MIT
> + *
> + * Copyright © 2022 Intel Corporation
> + */
> +#ifndef _DRM_SUBALLOC_H_
> +#define _DRM_SUBALLOC_H_
> +
> +#include <linux/types.h>
> +#include <linux/list.h>
> +#include <linux/wait.h>
> +
> +struct dma_fence;
> +struct seq_file;
> +
> +/* sub-allocation manager, it has to be protected by another lock.
> + * By conception this is an helper for other part of the driver
> + * like the indirect buffer or semaphore, which both have their
> + * locking.
> + *
> + * Principe is simple, we keep a list of sub allocation in offset
> + * order (first entry has offset == 0, last entry has the highest
> + * offset).
> + *
> + * When allocating new object we first check if there is room at
> + * the end total_size - (last_object_offset + last_object_size) >=
> + * alloc_size. If so we allocate new object there.
> + *
> + * When there is not enough room at the end, we start waiting for
> + * each sub object until we reach object_offset+object_size >=
> + * alloc_size, this object then become the sub object we return.
> + *
> + * Alignment can't be bigger than page size.
> + *
> + * Hole are not considered for allocation to keep things simple.
> + * Assumption is that there won't be hole (all object on same
> + * alignment).
> + *
> + * The actual buffer object handling depends on the driver,
> + * and is not part of the helper implementation.
> + */
> +#define DRM_SUBALLOC_MAX_QUEUES 32
> +
> +struct drm_suballoc_manager {
> +	wait_queue_head_t wq;
> +	struct list_head *hole, olist, flist[DRM_SUBALLOC_MAX_QUEUES];
> +	u32 size, align;
> +};
> +
> +/* sub-allocation buffer */
> +struct drm_suballoc {
> +	struct list_head olist, flist;
> +	struct drm_suballoc_manager *manager;
> +	u32 soffset, eoffset;
> +	struct dma_fence *fence;
> +};
> +
> +void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
> +			       u32 size, u32 align);
> +void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
> +struct drm_suballoc *drm_suballoc_new(struct drm_suballoc_manager *sa_manager,
> +				      u32 size);
> +void drm_suballoc_free(struct drm_suballoc *sa_bo,
> +		       struct dma_fence *fence,
> +		       u32 queue);
> +
> +#ifdef CONFIG_DEBUG_FS
> +void drm_suballoc_dump_debug_info(struct drm_suballoc_manager *sa_manager,
> +				  struct seq_file *m, u64 suballoc_base);
> +#else
> +static inline void
> +drm_suballoc_dump_debug_info(struct drm_suballoc_manager *sa_manager,
> +			     struct seq_file *m, u64 suballoc_base)
> +{ }
> +
> +#endif
> +
> +#endif /* _DRM_SUBALLOC_H_ */

