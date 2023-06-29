Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BDE742168
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 09:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481C410E095;
	Thu, 29 Jun 2023 07:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AA210E095
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 07:51:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDX5X+mAkRxyrTXwmEe2SbgdkLsUnuXSKsAyAb5hEG0WdnylhH5QdSxZgBgLQQ4ao13rlxQV/fjpzPqz1/+jxsvvA1WCFqPtGh2+RLNukdyMd8WKKY64Rjp2aEgTClhZSsnWBCl/3nnp68hOVtwfqgTob4NvIdO6RQRoNoOsSU7CI2Ad4cQt+kqdEW+AmGdjko6mUBjivTLyQVuYsg3o293aVxltBy7E4C8eJYCTosL7/laaB9VdH4zB4PY+gEK5I2RdEkwGtcItB7WqLOi4Xk+yOstTeC3hoC94wIogU7MNgq7JgQoc5gL5HcnTnMFpZ+6aFQWvCMaPH9XiDQyIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bn4JhB5hXgFqPqI9IAPHz6TngcFdapuXW5JmTmD8onI=;
 b=ST3QDqkV4MAquZUkWopSU1XmWT/+TKsiR1PBYCADIJYYOLedAl14GONtXBNoZPHSY1VpBhep8zdNQIrMZxaHN0Npuc3+WRbNritgX4ppTNNXQzgfTMmOnwmC0xD9LDxFNULs3kObj3Qx+qiZc1T0iHssf8XSZxFMAQMVMdO3qxWElx/15RvvUh61/MSuWDIPaQ5Pp68GTmJ3FGv4RoLfKVZTn7hGns6ikwuKWtvTVkcrmsXEJO9IuZewPXjTrayrp54e2RWkZmBfjZWvsn0pzg4ny9QhBr288YXioB9rdX06Ie+UWTukbZjeiKxwSTKJQHHs96N28NeJRNv6/XjOiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn4JhB5hXgFqPqI9IAPHz6TngcFdapuXW5JmTmD8onI=;
 b=T364db6zkt4NSs4BWG6l7RUV9FDNR0JPL5xU42w7bABe6A5OYrRuppesqOQ1oBFifRmuB3xMEEFPObNAT2P8Q6QyvQ0oGmTuboQ5zCaBvM3V5i8M4FDhx/MABwvnPd6Cbm0CmWVcFCRg8zq9HabHsQ3523pYxpnhlaUwn3bLxjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB7927.namprd12.prod.outlook.com (2603:10b6:8:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 07:51:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 07:51:42 +0000
Message-ID: <4a99ccf2-da23-b64f-6768-548079b2edbd@amd.com>
Date: Thu, 29 Jun 2023 09:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC v2 1/3] drm/ttm: Introduce KUnit tests
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1687779215.git.karolina.stolarek@intel.com>
 <ccca4b6f62a5b87d4c8c504209c978266d1425ad.1687779215.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ccca4b6f62a5b87d4c8c504209c978266d1425ad.1687779215.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f776eb1-412a-4fae-e2a8-08db7875addc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2V0HheU/gleaHvUpKrbrSYAHLVNzM+lpvJNbaTDqMuXtfRRtQdFh85AYTGZDZOj+iDP2fS6x+6538RrgdvqmS3c+4t3sWXpP1onJQEBQqGjiXUwziP+RoR7XOe/FoOii04wO0MJd5rYrMzW7VCXdqDKaYLfrPlcsOv/7CamP6Az9R9y28qBnPfJ9aekSA08r1gH/GMLHzh7qCt+onfnPpFdVPrugTJny65L8v5TWW+ZOIp6oB7ngxo6WBVfxc6Ydn/1kL7NdmI/3Yiav+ze9QdGEo9N0IoNPV5fBuJURPyYqr5vp4IpV7DnfzWbo9LKaYxEY5OBCDXIlju+HLrPpVn4dXpF6aB/25m69062MRk5gSuYLzKiCpVseQK2mcQM/hoefVPfCgC8CvvyBDf5XbRi/OYP1/zUWnjZvq7bczgWZPzdwUgm3UKMGufyzB+Jd2U2mpCq0G3TJSIRiZGymmk6qn8WDBMJH6CfG7IWTCgbMftV5Sag5+0p/Rflgl15x5F3cMDh7mLwCJeM9YgROCCTu1va936/+Kv3R0O96NsPs3ZCgNLfAFMjOxaUVGShMpDSFKK5TN+8ltFRaqbPomcUU/H+tKXNoCmtlQdvlbL7C00gITvbWnTMnLCOf+xsFF8sBEXWxqrZman+HcpXBlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(31686004)(36756003)(5660300002)(86362001)(8936002)(66556008)(8676002)(66476007)(41300700001)(31696002)(316002)(4326008)(38100700002)(66946007)(2906002)(186003)(478600001)(6506007)(2616005)(6512007)(6486002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHlJeDZrV2ZMUTliTmErM08ya0hkODNaWnlQVTZHenZUdEtjQjZlOEkrL29D?=
 =?utf-8?B?NjZveG0vdUM2Sm44S3N5OXIwQm9GRkVVeDFiMHdwYkw5NUVyb25hZEwzTERH?=
 =?utf-8?B?bFhlUTdRL1FYN3pjNEZCdm5DcU1oaHoweGlOQUpaNlMxTGZEbGNTU0xwNXor?=
 =?utf-8?B?eGpzb3psVGZ0SUY4RDg0R0hrUm1SSXlvTk5MMittM3czZVVkS1BNMm05MmRG?=
 =?utf-8?B?OUNJT0lxbXhBMWVzemg3MmhTVFRXeUdVbk5EVHprdjQycmVGaWZVY05wSS9Q?=
 =?utf-8?B?aVpsY1R0OFFWNnlsZndLZGVrbXptaTdZU0F3OWNjNjd6dmdWRFIrRm0yTkJ6?=
 =?utf-8?B?empnUVFhRll3OWJyT3FHcWFkTXVKUGx6UU5QaUxKWkRhZjA0Wjg3TkpxRjhU?=
 =?utf-8?B?S25zQy9XakJtUVQ1SmlZekN3QlBLZTVuVFExNXdzb0tJeVdqbVdHNWpjZGFZ?=
 =?utf-8?B?MVBNdldGKzExazR1UmROcG5xek8za3NGTjVUdDVaMHNLSC9ZUGUxVVdyNExJ?=
 =?utf-8?B?S3ppVXB4b0NVVG1BSUVhNlExMExDQWpaTmg1OC9JS3ZINndaTVVVdHZLT3lU?=
 =?utf-8?B?MzJiQkR0V0RUMHFnU1NLRnpwM1pNQi93QldKWTNJbG05WmJNUWtBNVE4c3Rz?=
 =?utf-8?B?T3pLa2llSUpwdjZUVFJMMWN3Ry85aGpNV1NtbEtMY0xYMERoSXc3Qmg4T2ZQ?=
 =?utf-8?B?SlVnRFh2WUFpemhqczlqWUI1cXdmRlhvdXpLWDk2V3g5REtWdUU3UGtTNEE3?=
 =?utf-8?B?cFBEc0w2RkpaOEhETlhQN1lsTjBIOXFHaERSeGtGY1lVUlozRWczcHNxem1U?=
 =?utf-8?B?TTZobFhQd0ZrNkVPcS9uSUFBcFJtVTIvY2lCVEJIb0ZjakJ4ZHFQdUNWa1Nt?=
 =?utf-8?B?V293Q3RlRm04MDNLTXBhbUVSK2N0M0hDR3liY01PQnhKeHZKcXkyaDJXMkhD?=
 =?utf-8?B?UysrTlNHeUx5Uk05UHh6dVkzNm5DaHdlbHo2UEtuNG9CTDNjQ3NFU3JOSmZZ?=
 =?utf-8?B?ZnJrMHQwT0N1WVFKSDVPZEhSNzU1TmQ3b3ZOcGpzSTFsdWJ3YUd0cDZrWnor?=
 =?utf-8?B?N2pscVJFd2dmcnFNYWh6WUZ5U0hoaHY4UFFqWEhWb1UreCtsbElJNWdXUWQz?=
 =?utf-8?B?Q3d5cHVhNFdpNElqOVBNejBNUThlcDZ2UEVlU0gzR0syKzlpYitPNkt5MTlZ?=
 =?utf-8?B?UG9kcGQwaXdzTUlKeEFoUzNTdkpNTE82Q2podWkvMzExNWpiUEF5SFdjMm9U?=
 =?utf-8?B?YWdQTzRBRkI1Sy9MV0pGOUdVTXlSaFJKMDQ3QVk0R0hnZVJtbUo4VnIxY21P?=
 =?utf-8?B?TTAxS2lZOFpENlBsbENTaEY5Y092ZFV3K3FockVTRGF4NUtlOEQyTzRCbUxU?=
 =?utf-8?B?U2g1WXJNSkZ3aVdCWi9ObEkzejBxcCtXSDBWQ0Zaa2lSNUdWbVJUT2lHR05q?=
 =?utf-8?B?OXQzRDFwTi9odUkwWUtabGU1d1NvaU0rMnVPb3kvbldKTVltUW12SlhNZ1pE?=
 =?utf-8?B?VURVVzEyR1dlQ0FXTE13eE5vRk13VlkxdTJRUzlncTZpQVNJSjJvaHF1WTVt?=
 =?utf-8?B?L1IrbHh3UDFuOTh2UEYxd2hjZ3RoTzJCRGNKTUQ5K3M4Tnl1MVlzaU9BRUxW?=
 =?utf-8?B?Y3lzRlhHZmdZbnp6emdIYURPSWJNejVWUFlJQmVXNkE5Rnd0dk1wTDRlUnpE?=
 =?utf-8?B?cGR2RkRlR1dHU1pIc1NVTGdpbUJTc2lLdGptZ2V2cE14a0phQ3BQb0Vsd0pS?=
 =?utf-8?B?RUlJd1V0d3ZrM2l6R0oweXNwbHhqSldYeWQxYkErYitaT2hZcFhyckZwazZu?=
 =?utf-8?B?dHZVQjFGNWpiQWNTbDZESDk0bGx5YUw1MXlHTk1GaG5Sd1NNV3NZWXVpRGtr?=
 =?utf-8?B?bGpuOU4wWjB5dks1RUxBTFA4S0J4M2lTQ1RlQnBKUkJubEF6a2h1MDRHVXZR?=
 =?utf-8?B?Q2MydFJPSmRLMFkxNk4yRnJtV0NZakNWQnUzYW5aT2ZGczc4aU9IUDJWVkhO?=
 =?utf-8?B?cXJCdmR5L0EwUmtnWC9ibzdqcmZBNUVWUEM4U0pmWUg2VFJLMnFpMXZDNFBL?=
 =?utf-8?B?NXVGMjNPQ3dZaXFNbmpKTG4rd3hocEhOcW42TVNXTG5RbEZVNzVSVkQvUnYx?=
 =?utf-8?B?enA2dW95Q3o4UHdvcjYveDF1ckhPcXJldmFvc3lZQ3RDV296czFYSW5iNlJR?=
 =?utf-8?Q?6iF9ezpO7zt1OCId2Wmrft3PczrNyCHJZ13e4t7FAez1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f776eb1-412a-4fae-e2a8-08db7875addc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 07:51:42.7605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8y11X6AerfaDOVQ3Tki8zNf4yrJNkJIIwaBY83a4r2mxXVybt1xtkv4aHaXW4JA5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7927
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Shuah Khan <shuah@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.06.23 um 10:32 schrieb Karolina Stolarek:
> Add the initial version of unit tests for ttm_device struct, together
> with helper functions.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   drivers/gpu/drm/Kconfig                       | 15 +++++
>   drivers/gpu/drm/ttm/Makefile                  |  1 +
>   drivers/gpu/drm/ttm/tests/.kunitconfig        |  4 ++
>   drivers/gpu/drm/ttm/tests/Makefile            |  5 ++
>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 54 +++++++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 59 +++++++++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h | 29 +++++++++
>   7 files changed, 167 insertions(+)
>   create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
>   create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index afb3b2f5f425..53024e44a2d5 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -194,6 +194,21 @@ config DRM_TTM
>   	  GPU memory types. Will be enabled automatically if a device driver
>   	  uses it.
>   
> +config DRM_TTM_KUNIT_TEST
> +        tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
> +        default n
> +        depends on DRM && KUNIT
> +        select DRM_TTM
> +        select DRM_EXPORT_FOR_TESTS if m
> +        select DRM_KUNIT_TEST_HELPERS
> +        default KUNIT_ALL_TESTS
> +        help
> +          Enables unit tests for TTM, a GPU memory manager subsystem used
> +          to manage memory buffers. This option is mostly useful for kernel
> +          developers.
> +
> +          If in doubt, say "N".
> +
>   config DRM_BUDDY
>   	tristate
>   	depends on DRM
> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
> index f906b22959cf..dad298127226 100644
> --- a/drivers/gpu/drm/ttm/Makefile
> +++ b/drivers/gpu/drm/ttm/Makefile
> @@ -8,3 +8,4 @@ ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>   
>   obj-$(CONFIG_DRM_TTM) += ttm.o
> +obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
> diff --git a/drivers/gpu/drm/ttm/tests/.kunitconfig b/drivers/gpu/drm/ttm/tests/.kunitconfig
> new file mode 100644
> index 000000000000..75fdce0cd98e
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/.kunitconfig
> @@ -0,0 +1,4 @@
> +CONFIG_KUNIT=y
> +CONFIG_DRM=y
> +CONFIG_DRM_KUNIT_TEST_HELPERS=y
> +CONFIG_DRM_TTM_KUNIT_TEST=y
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> new file mode 100644
> index 000000000000..7917805f37af
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0 AND MIT
> +
> +obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
> +        ttm_device_test.o \
> +        ttm_kunit_helpers.o
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> new file mode 100644
> index 000000000000..08d7314b1e35
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <drm/ttm/ttm_resource.h>
> +#include <drm/ttm/ttm_device.h>
> +#include <drm/ttm/ttm_placement.h>
> +
> +#include "ttm_kunit_helpers.h"
> +
> +static void ttm_device_init_basic(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct ttm_device *ttm_dev;
> +	struct ttm_resource_manager *ttm_sys_man;
> +	int err;
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	err = ttm_kunit_helper_alloc_device(test, ttm_dev, false, false);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	KUNIT_EXPECT_PTR_EQ(test, ttm_dev->funcs, &ttm_dev_funcs);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev->wq);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev->man_drv[TTM_PL_SYSTEM]);
> +
> +	ttm_sys_man = &ttm_dev->sysman;
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_sys_man);
> +	KUNIT_EXPECT_TRUE(test, ttm_sys_man->use_tt);
> +	KUNIT_EXPECT_TRUE(test, ttm_sys_man->use_type);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_sys_man->func);
> +
> +	KUNIT_EXPECT_PTR_EQ(test, ttm_dev->dev_mapping,
> +			    priv->drm->anon_inode->i_mapping);
> +
> +	ttm_device_fini(ttm_dev);
> +}
> +
> +static struct kunit_case ttm_device_test_cases[] = {
> +	KUNIT_CASE(ttm_device_init_basic),
> +	{}
> +};
> +
> +static struct kunit_suite ttm_device_test_suite = {
> +	.name = "ttm_device",
> +	.init = ttm_test_devices_init,
> +	.exit = ttm_test_devices_fini,
> +	.test_cases = ttm_device_test_cases,
> +};
> +
> +kunit_test_suites(&ttm_device_test_suite);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> new file mode 100644
> index 000000000000..d03db0405484
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include "ttm_kunit_helpers.h"
> +
> +struct ttm_device_funcs ttm_dev_funcs = {
> +};
> +EXPORT_SYMBOL_GPL(ttm_dev_funcs);
> +
> +int ttm_kunit_helper_alloc_device(struct kunit *test,

Since this function is only initializing the ttm device I think we 
should name it ttm_kunit_helper_init_device().

On the other hand I don't see a good reason why it can't also allocate 
the device.

Apart from that looks like a good start,
Christian.

> +				  struct ttm_device *ttm,
> +				  bool use_dma_alloc,
> +				  bool use_dma32)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct drm_device *drm = priv->drm;
> +	int err;
> +
> +	err = ttm_device_init(ttm, &ttm_dev_funcs, drm->dev,
> +			      drm->anon_inode->i_mapping,
> +			      drm->vma_offset_manager,
> +			      use_dma_alloc, use_dma32);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(ttm_kunit_helper_alloc_device);
> +
> +int ttm_test_devices_init(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv;
> +
> +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	test->priv = priv;
> +
> +	priv->dev = drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
> +
> +	priv->drm = __drm_kunit_helper_alloc_drm_device(test, priv->dev,
> +							sizeof(*priv->drm), 0,
> +							DRIVER_GEM);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ttm_test_devices_init);
> +
> +void ttm_test_devices_fini(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +
> +	drm_kunit_helper_free_device(test, priv->dev);
> +	drm_dev_put(priv->drm);
> +}
> +EXPORT_SYMBOL_GPL(ttm_test_devices_fini);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> new file mode 100644
> index 000000000000..69fb03b9c4d2
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#ifndef TTM_KUNIT_HELPERS_H
> +#define TTM_KUNIT_HELPERS_H
> +
> +#include <drm/drm_drv.h>
> +#include <drm/ttm/ttm_device.h>
> +
> +#include <drm/drm_kunit_helpers.h>
> +#include <kunit/test.h>
> +
> +extern struct ttm_device_funcs ttm_dev_funcs;
> +
> +struct ttm_test_devices_priv {
> +	struct drm_device *drm;
> +	struct device *dev;
> +};
> +
> +int ttm_kunit_helper_alloc_device(struct kunit *test,
> +				  struct ttm_device *ttm,
> +				  bool use_dma_alloc,
> +				  bool use_dma32);
> +
> +int ttm_test_devices_init(struct kunit *test);
> +void ttm_test_devices_fini(struct kunit *test);
> +
> +#endif // TTM_KUNIT_HELPERS_H

