Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E7A571352
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 09:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F233113F06;
	Tue, 12 Jul 2022 07:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0A1113F06
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 07:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ltjs7WtLnw4ctv8XT4n8gygAWOgNv7X76EDGGbWp7FNa6/qY4oNpXl8i/vLyXGBIe+UqHwhObSCYHg6awgPmxUPOgFeRVVEkfK1EwyPpeRhinUl7VAWnxWQqcNS0o3TWa0NS44jXPuacka+CB8GPwZ8lwBAJx1ccwWAEQadX9VB6qomkaFxl/5Z3WkySvm0dI0aMmUCYa2z5m8reI7srTlBgO/dtTCLfTYM8agZhA3gJBlK3XkyfVPvu4eHHTH/UnUZrkPUPkDUp5nBpYylp+eL6SrFnVY8pCeTMri0PLBFcdWZdAT0QVV0frxsz9Z23xmIe/iGLpjetV9+fa/NohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qdQslZt1aNXP8o+9+vfmCaZRt2vReUWYcvn1UBDVcc=;
 b=JewyNb81sRXGx/I2eAbA8NPY8+cCqooe9Zt7qZ/dSPEtscMqwfjcfJOURjUgtt5WTDj8n36SNnMzR2Y447gsn7sz8/Gj/kl3L4XDw4+AlGwjDQLiDyyYoakuMsb967PmlaCrUZ9nDzEL/HJ4x7kjMP5buAfHH9E4Kr7AVTyDo/CWNpnga39tSofA+V1b/U0BFpHvIFCUJcHjOUHR+WN7O5o4Fyz73MZClyLcKl6KJQD8l1XtyP1Ms3SoaJ+Vkcg14zOQmId8nJmojsuE/1LmI3hmxNfLKMXwEFNVcD86cXbxM820IWN3PquTepo8bo9BK23F/XzdqInGA3UcMQ8wBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qdQslZt1aNXP8o+9+vfmCaZRt2vReUWYcvn1UBDVcc=;
 b=vjFvG9T134HQqY8V2vb4W4Gg5hK7VxWG73yJxQwzj+uy/ArVkVMNACGCqqMbdKN9p9+RoCUlPc2Akpl1Iu1FJLdS3t2chVVq3GAEFW1D9u/eC1lGdGj/HQofdYqzfsvTwaj9idaYX39Nz3QOmD7SFrS1U11Fd2Zc8Z0T1do3hOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN6PR12MB4685.namprd12.prod.outlook.com (2603:10b6:805:b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Tue, 12 Jul
 2022 07:43:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 07:43:51 +0000
Message-ID: <44e2cb41-641c-2a50-3e38-284e4504f012@amd.com>
Date: Tue, 12 Jul 2022 09:43:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC][PATCH 3/3] kselftest: Add drm_syncobj API test tool
Content-Language: en-US
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
References: <20220712042258.293010-1-jstultz@google.com>
 <20220712042258.293010-3-jstultz@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220712042258.293010-3-jstultz@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37fec510-c2d8-48a1-b707-08da63da435f
X-MS-TrafficTypeDiagnostic: SN6PR12MB4685:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZodQT4nBEUYDWHN5/bg+J5PuWS3eIv9NIm0HP3XZ5u8RPpon4+BAFmFBf9vnXV6bxmraP8fct8dFqj4iIuFHMNiq8MFGdVY+q4gHlEHR4u9Ulm+qqCSpxtvfBSONHU1w5/BdZBCOHe1HTTuAhvbTeJmZ49dp+YLkHvHEiYBXdsfBPKYRTc3mZ/W2r9XpsB76vqhyPxDO2bF/KBux9X+SfDUArynP5wnKfY5yVJ9yMKVnWBQVrwkYVwC96LprMvgBdZ8PSkg3Ek+M6XEheMiLQZj6tpACzf3YubEVYnodO4RdjTzQiFI509VuUCs/wYT3KxnbqtGh1wkiIvWIU5xlXDHpfBa4iZeZDTVx6PMKds3MfBh0Sqw+fa3IM33Y8MJKiwe91mb8tuf1SiZvv9ie17Xhle4HEV6dSO9vQZlbWS8huFExuPw3RmvsjTLyyZE/FhJ3aaM1krO14vhqVRCKz8tJ5y2O/LXYbctjcbfbfyE0Vh++GpJTI8YSzfMH1nijxOHNYtQzTS/y6M6LxZjap8pUWUbKckGLcFPg6/00nGjQNNeIXqruxbCwtBRgVht3Fmk/9IcW1U+2wnUUwzJGfZipFbJgflX6xqteDspaIKVr6QFjM8C6du/Kb86gELn0l2/2w9N4WBvYOC2p11fyEamJm9PwIM7FJ+DclObGUP5x1L6T5X+5xlcWJMimQeWvUxF7GM11LNLc1nWYbtsIuUpKS1meCsysoqFxGcJOzdRBQ9hOI7YVk+O1lJdUC/NS7Cc6BMEju80rq1ObM14wKKCngJT2kY7Ivj21KvBX1nyk5nWsZdAn1SuwfUDljHs4paq2SAkTjCoVt6HgpcFxXFvCMs5QlPkJwlvz0vvYnY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(186003)(66574015)(8676002)(66556008)(66946007)(4326008)(6486002)(110136005)(36756003)(54906003)(83380400001)(26005)(2616005)(66476007)(6506007)(31686004)(6512007)(31696002)(6666004)(2906002)(316002)(30864003)(86362001)(41300700001)(5660300002)(478600001)(7416002)(38100700002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHpVRzhqS3QzSDF1MXIvRjIwRU1GQ2JwSjBJemk0N3JhZlo4ajJRZndJTWNW?=
 =?utf-8?B?VjJhbVozNHlEY25IWSt0eTEyUGpTb0VtRVBaV0RhazZxL2w3d0liS1hkSlpv?=
 =?utf-8?B?UEZhR2tnWkdSQ2w0OXQrZDZkYmxndzIzK2Vqa2RoVUxlVEJLR2svY3RWTDBX?=
 =?utf-8?B?ZkErelh3a25kL1pYMkZ3aGppbko0djFvZnR0MjN6Q0Viem4vd0dDR0JxZk1J?=
 =?utf-8?B?WGp6QkoxQTROMi81WU9oS2dOZ2liMUtsVWtDNmZLdE1leCtLbUttUE9XdkNo?=
 =?utf-8?B?N1RhQWRxemVGR09PTmt5dE5naFQxbXlLYWVIYnl6Zk1UaUF2TWdvOHExOUti?=
 =?utf-8?B?Ui9YQmpkQWhTVnM1aldBVCtRTmlGUVlqS0dRbkZyWDNUeUpza3ZYOWxhMVZT?=
 =?utf-8?B?a2hCWUFOSVhucWY0THRaUjQySDZYbnNDd1phbVFMNjU0YUZKYzFCbkJmaER0?=
 =?utf-8?B?alpLRkFDbGZaOGV6SVpSQUpvTk1zOWZUU3UwcURycFEwd1ZwOTI3THYreW85?=
 =?utf-8?B?QlU2cUZTYVo1Yy8zbytuTjNTbHJHaTVkT1krTm5jSzUvZlhlQkd0VGNqQnZZ?=
 =?utf-8?B?MUpJZlhrWGcwYWhDazJ4NlpPbzgrd2taWXhuTDB3djVMYU45VXZRWVNhTXRZ?=
 =?utf-8?B?dTlyTVoyZDBoenRnSndRTE1JR3RGSDB4eEd1SWh0MGl6azd2SWdzcFZpcWt2?=
 =?utf-8?B?amhZOTNFUmJ4U3dCejYycmRGY2s5UW92dlhtYzAwUHVnWTZiK0M5dCtZSEMx?=
 =?utf-8?B?WDRCTVRtSmV5VktzcjlYOEx3OUZpUVpoeW9oakorMmlUUGNWUEg4bVltUTVp?=
 =?utf-8?B?ckRLRzlLbHpOQ3IzUDB4NlREMGVCbUtDRGFIWWMrcDJiWkVjUE9VM2xWTURL?=
 =?utf-8?B?a3czNnJqNVBGMC96KzZQT0F1anRuV0I1Rit3K3FGYktYeFRRaHFtK1dTS3E4?=
 =?utf-8?B?cmordVFIWk1jaW9VV2IrZ2MrOVYvaFRySStCS0FQUGR4aDRnemJGbkkrZDZW?=
 =?utf-8?B?Ym9LbURrWFYrRi9pQkljUnRoenlHMnZoYUtjc2hwREFWRXVZbDVRZTRNUFE2?=
 =?utf-8?B?ak4xWjIvNEtLa3JvcjhreEN6OEVKVytpdWxwWitsbEFYNlAzVmpubjVDSzN1?=
 =?utf-8?B?RE9TV0lwemUvYjZ2azBCTUl1MGhZb0VRSkR5MW44UHd4bGtKdVZTOVFQNlJ2?=
 =?utf-8?B?Z1VJbHh1TzdmdjVMSnBHRXBqRkVicm03ZHlUUi8xSnRqeTEvZnJzV2JGV0R2?=
 =?utf-8?B?M3hNZ1ZpakZ0aUxmK0RiSnZQRXhaMzcwL0Nwc0Zjb0QyQnIxd0RpNTNtZ0Ja?=
 =?utf-8?B?VmRNMEg1b0M3S0g0MjlUUXh0SEVuL1dNR1RVajVicnV5VEJRMHJWQkg3ZlQ2?=
 =?utf-8?B?b1FCNkp6UUlsaUhvTWZJRFF3Q3BPTGI2bXJKSHRnT0ZWMDVLdGpaWmluZ2d4?=
 =?utf-8?B?Y3YyQmR5NWsxcjRjMWZ3NjdLNHg5b3hGa1U1ZUlhRlFjaWRiaGFKQkVYck9h?=
 =?utf-8?B?RzFqK3B6c1JZelh0SjcydHJMZmFlTFdCdDh6cFptWnJGTWNLZzVkMEYxTzIy?=
 =?utf-8?B?UCtLakh4V2haOTZOZjFUQkQwalhhT3d0T1l5cHl0TGU0bndHdmUvVEN4QVE0?=
 =?utf-8?B?L29SejVvS1VIZUk3N3hlaU5rbFpYYklldUdlU0VqdDQvRzhiQ0NHVWdreTlp?=
 =?utf-8?B?RDBJcnE0WVZEcGtkRmtXZHBMTzZwUTJjV2cwVmVHZEdtYzlraTNaQWNSOXh3?=
 =?utf-8?B?RGhDeUN2dUE1YVRodFVGYzA4am9MVWdmRGRpZ3NyWDNnV2R3WUFSb000UlVn?=
 =?utf-8?B?MVljd2d4NmFhWEFLZktGUEFxN0d3eTAxTkU2M1QyVGo2ZCtrdEJMZWVBWHlK?=
 =?utf-8?B?a3lEbHFEblJBYTZURGdSQWxGUDQ4TUVEUVhkOU5GZUtoNU1LL1ZXcWc4OThC?=
 =?utf-8?B?c280SXBMVEJ6WTJ1VldzRHNtWFJTU1lWK1B5NndocHRYL0JRYVduc0FFL2Rn?=
 =?utf-8?B?VjJZNDN5Qkhhb1dSZjFGZXZPdUtMeGlVMjNyN1BqWEdJZnV1SUo4RWJ4UU9W?=
 =?utf-8?B?ME5DZW5HWDVsV3U0NkZRdFNYWDlZa1NGdGFLc1F0a0dMNit2QW5xRGhla0pk?=
 =?utf-8?Q?fOwqe9ZqtHBOYRGwUtOW+IU5M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fec510-c2d8-48a1-b707-08da63da435f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 07:43:51.2275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e205oSUcGjp96oKpT+2St1ngtWztZJQLl2RpIeBoUUaJiVsbdoc/jsdnuVk+t4nl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4685
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
Cc: Chunming Zhou <david1.zhou@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Shuah Khan <shuah@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.07.22 um 06:22 schrieb John Stultz:
> An initial pass at a drm_syncobj API test.
>
> Currently covers trivial use of:
>    DRM_IOCTL_SYNCOBJ_CREATE
>    DRM_IOCTL_SYNCOBJ_DESTROY
>    DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD
>    DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE
>    DRM_IOCTL_SYNCOBJ_WAIT
>    DRM_IOCTL_SYNCOBJ_RESET
>    DRM_IOCTL_SYNCOBJ_SIGNAL
>    DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT
>    DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL
>
> And demonstrates how the userspace API can be used, along with
> some fairly simple bad parameter checking.
>
> The patch includes a few helpers taken from libdrm, as at least
> on the VM I was testing with, I didn't have a new enough libdrm
> to support the *_TIMELINE_* ioctls. Ideally the ioctl-helper bits
> can be dropped at a later time.
>
> Feedback would be appreciated!
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Chunming Zhou <david1.zhou@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <jstultz@google.com>
> ---
>   .../drivers/gpu/drm_syncobj/Makefile          |  11 +
>   .../drivers/gpu/drm_syncobj/ioctl-helper.c    |  85 ++++
>   .../drivers/gpu/drm_syncobj/ioctl-helper.h    |  74 ++++
>   .../drivers/gpu/drm_syncobj/syncobj-test.c    | 410 ++++++++++++++++++

DRM userspace selftests usually go either into libdrm or igt and not 
into the kernel source.

If you want to make in kernel self tests they should go into 
drivers/gpu/drm/selftests/

Regards,
Christian.

>   4 files changed, 580 insertions(+)
>   create mode 100644 tools/testing/selftests/drivers/gpu/drm_syncobj/Makefile
>   create mode 100644 tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.c
>   create mode 100644 tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.h
>   create mode 100644 tools/testing/selftests/drivers/gpu/drm_syncobj/syncobj-test.c
>
> diff --git a/tools/testing/selftests/drivers/gpu/drm_syncobj/Makefile b/tools/testing/selftests/drivers/gpu/drm_syncobj/Makefile
> new file mode 100644
> index 000000000000..6576d9b2006c
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/gpu/drm_syncobj/Makefile
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +CFLAGS += -I/usr/include/libdrm/
> +LDFLAGS += -pthread -ldrm
> +
> +TEST_GEN_FILES= syncobj-test
> +
> +include ../../../lib.mk
> +
> +$(OUTPUT)/syncobj-test: syncobj-test.c ioctl-helper.c
> +EXTRA_CLEAN = $(OUTPUT)/ioctl-helper.o
> +
> diff --git a/tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.c b/tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.c
> new file mode 100644
> index 000000000000..e5c59c9bed36
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: MIT
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <stdint.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <time.h>
> +#include <errno.h>
> +#include <libdrm/drm.h>
> +#include <xf86drm.h>
> +#include "ioctl-helper.h"
> +
> +#ifndef DRM_CAP_SYNCOBJ_TIMELINE
> +/*
> + * The following is nabbed from libdrm's xf86drm.c as the
> + * installed libdrm doesn't yet include these definitions
> + *
> + *
> + * \author Rickard E. (Rik) Faith <faith@valinux.com>
> + * \author Kevin E. Martin <martin@valinux.com>
> + */
> +/*
> + * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
> + * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
> + * All Rights Reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +int drmSyncobjTimelineSignal(int fd, const uint32_t *handles,
> +			     uint64_t *points, uint32_t handle_count)
> +{
> +	struct drm_syncobj_timeline_array args;
> +	int ret;
> +
> +	memset(&args, 0, sizeof(args));
> +	args.handles = (uintptr_t)handles;
> +	args.points = (uintptr_t)points;
> +	args.count_handles = handle_count;
> +
> +	ret = drmIoctl(fd, DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL, &args);
> +	return ret;
> +}
> +
> +int drmSyncobjTimelineWait(int fd, uint32_t *handles, uint64_t *points,
> +			   unsigned int num_handles,
> +			   int64_t timeout_nsec, unsigned int flags,
> +			   uint32_t *first_signaled)
> +{
> +	struct drm_syncobj_timeline_wait args;
> +	int ret;
> +
> +	memset(&args, 0, sizeof(args));
> +	args.handles = (uintptr_t)handles;
> +	args.points = (uintptr_t)points;
> +	args.timeout_nsec = timeout_nsec;
> +	args.count_handles = num_handles;
> +	args.flags = flags;
> +
> +	ret = drmIoctl(fd, DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT, &args);
> +	if (ret < 0)
> +		return -errno;
> +
> +	if (first_signaled)
> +		*first_signaled = args.first_signaled;
> +	return ret;
> +}
> +
> +#endif
> diff --git a/tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.h b/tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.h
> new file mode 100644
> index 000000000000..b0c1025034b5
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/gpu/drm_syncobj/ioctl-helper.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: MIT */
> +#ifndef __IOCTL_HELPER_H__
> +#define __IOCTL_HELPER_H__
> +
> +/* Bits pulled from libdrm's include/drm/drm.h */
> +#ifndef DRM_CAP_SYNCOBJ_TIMELINE
> +/*
> + * Header for the Direct Rendering Manager
> + *
> + * Author: Rickard E. (Rik) Faith <faith@valinux.com>
> + *
> + * Acknowledgments:
> + * Dec 1999, Richard Henderson <rth@twiddle.net>, move to generic cmpxchg.
> + */
> +
> +/*
> + * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
> + * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
> + * All rights reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +struct drm_syncobj_timeline_wait {
> +	__u64 handles;
> +	/* wait on specific timeline point for every handles*/
> +	__u64 points;
> +	/* absolute timeout */
> +	__s64 timeout_nsec;
> +	__u32 count_handles;
> +	__u32 flags;
> +	__u32 first_signaled; /* only valid when not waiting all */
> +	__u32 pad;
> +};
> +
> +
> +#define DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED (1 << 0)
> +struct drm_syncobj_timeline_array {
> +	__u64 handles;
> +	__u64 points;
> +	__u32 count_handles;
> +	__u32 flags;
> +};
> +
> +#define DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT DRM_IOWR(0xCA, struct drm_syncobj_timeline_wait)
> +#define DRM_IOCTL_SYNCOBJ_QUERY         DRM_IOWR(0xCB, struct drm_syncobj_timeline_array)
> +#define DRM_IOCTL_SYNCOBJ_TRANSFER      DRM_IOWR(0xCC, struct drm_syncobj_transfer)
> +#define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL       DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
> +
> +int drmSyncobjTimelineSignal(int fd, const uint32_t *handles,
> +			     uint64_t *points, uint32_t handle_count);
> +int drmSyncobjTimelineWait(int fd, uint32_t *handles, uint64_t *points,
> +			   unsigned int num_handles,
> +			   int64_t timeout_nsec, unsigned int flags,
> +			   uint32_t *first_signaled);
> +#endif
> +#endif /*__IOCTL_HELPER_H__*/
> +
> diff --git a/tools/testing/selftests/drivers/gpu/drm_syncobj/syncobj-test.c b/tools/testing/selftests/drivers/gpu/drm_syncobj/syncobj-test.c
> new file mode 100644
> index 000000000000..21474b0d3b9e
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/gpu/drm_syncobj/syncobj-test.c
> @@ -0,0 +1,410 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This test exercises basic syncobj ioctl interfaces from
> + * userland via the libdrm helpers.
> + *
> + * Copyright (C) 2022, Google LLC.
> + *
> + * Currently covers trivial use of:
> + *   DRM_IOCTL_SYNCOBJ_CREATE
> + *   DRM_IOCTL_SYNCOBJ_DESTROY
> + *   DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD
> + *   DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE
> + *   DRM_IOCTL_SYNCOBJ_WAIT
> + *   DRM_IOCTL_SYNCOBJ_RESET
> + *   DRM_IOCTL_SYNCOBJ_SIGNAL
> + *   DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT
> + *   DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL
> + *
> + * TODO: Need coverage for the following ioctls:
> + *   DRM_IOCTL_SYNCOBJ_QUERY
> + *   DRM_IOCTL_SYNCOBJ_TRANSFER
> + * As well as more complicated use of interface (like
> + * signal/wait with multiple handles, etc), and sync_file
> + * import/export.
> + */
> +#include <dirent.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <stdint.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <time.h>
> +#include <poll.h>
> +#include <sys/ioctl.h>
> +#include <sys/mman.h>
> +#include <sys/types.h>
> +#include <sys/wait.h>
> +#include <pthread.h>
> +#include <linux/dma-buf.h>
> +#include <libdrm/drm.h>
> +#include <xf86drm.h>
> +
> +#include "ioctl-helper.h"
> +
> +
> +#define NSEC_PER_SEC 1000000000ULL
> +static uint64_t get_abs_timeout(uint64_t rel_nsec)
> +{
> +	struct timespec ts;
> +	uint64_t ns;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &ts);
> +	ns = ts.tv_sec * NSEC_PER_SEC + ts.tv_nsec;
> +	ns += rel_nsec;
> +	return ns;
> +}
> +
> +struct test_arg {
> +	int	dev_fd;
> +	uint32_t handle;
> +	int	handle_fd;
> +};
> +#define TEST_TIMES 5
> +
> +void *syncobj_signal_reset(void *arg)
> +{
> +	struct test_arg *d = (struct test_arg *)arg;
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < TEST_TIMES; i++) {
> +		sleep(3);
> +		printf("%s: sending signal!\n", __func__);
> +		ret = drmSyncobjSignal(d->dev_fd, &d->handle, 1);
> +		if (ret)
> +			printf("Signal failed %i\n", ret);
> +	}
> +	return NULL;
> +}
> +
> +static int syncobj_wait_reset(struct test_arg *d)
> +{
> +	uint64_t abs_timeout;
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < TEST_TIMES; i++) {
> +		abs_timeout = get_abs_timeout(10*NSEC_PER_SEC);
> +		printf("%s calling drmSyncobjWait\n", __func__);
> +		ret = drmSyncobjWait(d->dev_fd, &d->handle, 1, abs_timeout,
> +				     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> +				     NULL);
> +		if (ret) {
> +			printf("Error: syncobjwait failed %i\n", ret);
> +			break;
> +		}
> +		printf("%s: drmSyncobjWait returned!\n", __func__);
> +
> +		ret = drmSyncobjReset(d->dev_fd, &d->handle, 1);
> +		if (ret) {
> +			printf("Error: syncobjreset failed\n");
> +			break;
> +		}
> +	}
> +	return ret;
> +}
> +
> +void *syncobj_signal_timeline(void *arg)
> +{
> +	struct test_arg *d = (struct test_arg *)arg;
> +	uint64_t point = 0;
> +	int ret;
> +
> +	for (point = 0; point <= (TEST_TIMES-1)*5; point++) {
> +		sleep(1);
> +		printf("%s: sending signal %lld!\n", __func__, point);
> +		ret = drmSyncobjTimelineSignal(d->dev_fd, &d->handle, &point, 1);
> +		if (ret)
> +			printf("Signal failed %i\n", ret);
> +	}
> +	return NULL;
> +}
> +
> +
> +int syncobj_timeline_wait(struct test_arg *d)
> +{
> +	uint64_t abs_timeout;
> +	uint64_t point;
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < TEST_TIMES; i++) {
> +		abs_timeout = get_abs_timeout(10*NSEC_PER_SEC);
> +
> +		point = i * 5;
> +		printf("%s: drmSyncobjTimelineWait waiting on %lld!\n", __func__, point);
> +		ret = drmSyncobjTimelineWait(d->dev_fd, &d->handle, &point, 1,
> +					     abs_timeout,
> +					     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> +					     NULL);
> +		if (ret) {
> +			printf("Error: syncobjwait failed %i\n", ret);
> +			return ret;
> +		}
> +		printf("%s: drmSyncobjTimelineWait got %lld!\n", __func__, point);
> +	}
> +	return 0;
> +}
> +
> +
> +static int test_thread_signal_wait(int devfd, void *(*signal_fn)(void *),
> +				   int (*wait_fn)(struct test_arg *))
> +{
> +	uint32_t handle;
> +	struct test_arg d;
> +	pthread_t pth;
> +	int ret;
> +
> +	ret = drmSyncobjCreate(devfd, 0, &handle);
> +	if (ret) {
> +		printf("Error: Couldn't create syncobj\n");
> +		return ret;
> +	}
> +
> +	d.dev_fd = devfd;
> +	d.handle = handle;
> +
> +	pthread_create(&pth, 0, signal_fn, &d);
> +	ret = wait_fn(&d);
> +	pthread_join(pth, NULL);
> +	drmSyncobjDestroy(devfd, handle);
> +
> +	return ret;
> +}
> +
> +static int test_fork_signal_wait(int devfd, void *(*signal_fn)(void *),
> +				 int (*wait_fn)(struct test_arg *))
> +{
> +	uint32_t handle;
> +	struct test_arg p, c;
> +	pid_t id;
> +	int ret;
> +
> +	ret = drmSyncobjCreate(devfd, 0, &handle);
> +	if (ret) {
> +		printf("Error: Couldn't create syncobj\n");
> +		return ret;
> +	}
> +
> +	p.dev_fd = devfd;
> +	p.handle = 0;
> +	p.handle_fd = 0;
> +	c = p;
> +	p.handle = handle;
> +
> +	ret = drmSyncobjHandleToFD(devfd, handle, &c.handle_fd);
> +	if (ret) {
> +		printf("Error: Couldn't convert handle to fd\n");
> +		goto out;
> +	}
> +
> +	id = fork();
> +	if (id == 0) {
> +		ret = drmSyncobjFDToHandle(c.dev_fd, c.handle_fd, &c.handle);
> +		if (ret) {
> +			printf("Error: Couldn't convert fd to handle\n");
> +			exit(-1);
> +		}
> +		close(c.handle_fd);
> +		signal_fn((void *)&c);
> +		exit(0);
> +	} else {
> +		ret = wait_fn(&p);
> +		waitpid(id, 0, 0);
> +	}
> +
> +out:
> +	if (c.handle_fd)
> +		close(c.handle_fd);
> +	drmSyncobjDestroy(devfd, handle);
> +
> +	return ret;
> +}
> +
> +
> +static int test_badparameters(int devfd)
> +{
> +	uint32_t handle1, handle2;
> +	int ret, fail = 0;
> +
> +	/* create bad fd */
> +	ret = drmSyncobjCreate(-1, 0, &handle1);
> +	if (!ret || errno != EBADF) {
> +		printf("drmSyncobjCreate - bad fd fails! (%i != EBADF)\n", errno);
> +		fail = 1;
> +	}
> +	/* destroy bad fd */
> +	ret = drmSyncobjDestroy(-1, handle1);
> +	if (!ret || errno != EBADF) {
> +		printf("drmSyncobjDestroy - bad fd fails! (%i != EBADF)\n", errno);
> +		fail = 1;
> +	}
> +
> +	/* TODO: Bad flags */
> +
> +	ret = drmSyncobjCreate(devfd, 0,  &handle1);
> +	if (ret) {
> +		printf("drmSyncobjCreate - unexpected failure!\n");
> +		fail = 1;
> +	}
> +
> +	/* Destroy zeroed handle */
> +	handle2 = 0;
> +	ret = drmSyncobjDestroy(devfd, handle2);
> +	if (!ret || errno != EINVAL) {
> +		printf("drmSyncobjDestroy - zero'ed handle! (%i != EINVAL)\n", errno);
> +		fail = 1;
> +	}
> +	/* Destroy invalid handle */
> +	handle2 = -1;
> +	ret = drmSyncobjDestroy(devfd, handle2);
> +	if (!ret || errno != EINVAL) {
> +		printf("drmSyncobjDestroy - invalid handle! (%i != EINVAL)\n", errno);
> +		fail = 1;
> +	}
> +
> +	/* invalid timeouts */
> +	ret = drmSyncobjWait(devfd, &handle1, 1, 1000,
> +			     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> +			     NULL);
> +	if (!ret || errno != ETIME) {
> +		printf("drmSyncobjWait - invalid timeout (relative)! (%i != ETIME)\n", errno);
> +		fail = 1;
> +	}
> +
> +	ret = drmSyncobjWait(devfd, &handle1, 1, -1,
> +			     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> +			     NULL);
> +	if (!ret || errno != ETIME) {
> +		printf("drmSyncobjWait - invalid timeout (-1)! (%i != ETIME)\n", errno);
> +		fail = 1;
> +	}
> +
> +	ret = drmSyncobjDestroy(devfd, handle1);
> +	if (ret) {
> +		printf("drmSyncobjDestroy - unexpected failure!\n");
> +		fail = 1;
> +	}
> +
> +
> +	return fail;
> +}
> +
> +
> +#define NAME_LEN 16
> +static int check_device(int fd)
> +{
> +	drm_version_t version = { 0 };
> +	char name[NAME_LEN];
> +	uint32_t handle;
> +	int ret;
> +
> +	memset(name, 0, NAME_LEN);
> +	version.name_len = NAME_LEN;
> +	version.name = name;
> +
> +	ret = ioctl(fd, DRM_IOCTL_VERSION, &version);
> +	if (ret)
> +		return -1;
> +
> +	printf("%s name: %s\n", __func__, name);
> +
> +	ret = drmSyncobjCreate(fd, 0,  &handle);
> +	if (!ret) {
> +		drmSyncobjDestroy(fd, handle);
> +		printf("%s selected: %s\n", __func__, name);
> +	}
> +	return ret;
> +}
> +
> +static int find_device(void)
> +{
> +	int i, fd;
> +	const char *drmstr = "/dev/dri/card";
> +
> +	fd = -1;
> +	for (i = 0; i < 16; i++) {
> +		char name[80];
> +
> +		snprintf(name, 80, "%s%u", drmstr, i);
> +
> +		fd = open(name, O_RDWR);
> +		if (fd < 0)
> +			continue;
> +
> +		if (check_device(fd)) {
> +			close(fd);
> +			fd = -1;
> +			continue;
> +		} else {
> +			break;
> +		}
> +	}
> +	return fd;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	int devfd = find_device();
> +	char *testname;
> +	int ret;
> +
> +	if (devfd < 0) {
> +		printf("Error: Couldn't find supported drm device\n");
> +		return devfd;
> +	}
> +
> +	testname = "Bad parameters test";
> +	printf("\n%s\n", testname);
> +	printf("===================\n");
> +	ret = test_badparameters(devfd);
> +	if (ret)
> +		printf("%s: FAILED\n", testname);
> +	else
> +		printf("%s: PASSED\n", testname);
> +
> +
> +	testname = "Threaded reset test";
> +	printf("\n%s\n", testname);
> +	printf("===================\n");
> +	ret = test_thread_signal_wait(devfd, &syncobj_signal_reset, &syncobj_wait_reset);
> +	if (ret)
> +		printf("%s: FAILED\n", testname);
> +	else
> +		printf("%s: PASSED\n", testname);
> +
> +	testname = "Threaded timeline test";
> +	printf("\n%s\n", testname);
> +	printf("===================\n");
> +	ret = test_thread_signal_wait(devfd, &syncobj_signal_timeline, &syncobj_timeline_wait);
> +	if (ret)
> +		printf("%s: FAILED\n", testname);
> +	else
> +		printf("%s: PASSED\n", testname);
> +
> +
> +	testname = "Forked reset test";
> +	printf("\n%s\n", testname);
> +	printf("===================\n");
> +	ret = test_fork_signal_wait(devfd, &syncobj_signal_reset, &syncobj_wait_reset);
> +	if (ret)
> +		printf("\n%s: FAILED\n", testname);
> +	else
> +		printf("\n%s: PASSED\n", testname);
> +
> +	testname = "Forked timeline test";
> +	printf("\n%s\n", testname);
> +	printf("===================\n");
> +	ret = test_fork_signal_wait(devfd, &syncobj_signal_timeline, &syncobj_timeline_wait);
> +	if (ret)
> +		printf("\n%s: FAILED\n", testname);
> +	else
> +		printf("\n%s: PASSED\n", testname);
> +
> +
> +	close(devfd);
> +	return 0;
> +}

