Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C477F32D6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 16:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0662C10E27D;
	Tue, 21 Nov 2023 15:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2551610E27D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 15:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMGTmwlxIR054urDXnF4EH6pwD7MsMu9wqfuWQiiWN8ajMGIL+Lz0zI4rfMYbCaB0pVTYnIgV/LWjv/vMZ7HSAxZbVNUPl6gePBC1orj4NW6eNs1CsrOCJAbhR3XGVjZID8QYe6KZqlDJys51jqOGT1IHLcViaBjO4hmbsxIK3J9u9QSrp2zwT6NNNPPW3aLKp64HfBfariDFmWb0MphmiQ6pBgo0TXljR/3CFrt5/LaFoe2sVheSHgC/B0s7gaVCJ4/oeW0D0Zyfn5Ut0w1ugaM8Gz36+YPR2nmHjGoijdCUti5IBU6VuhOBycdo6lIhOILysG8tSl4QJQc4nyYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pj/IalUTmM59yXbNC2TLy02SflrorFzC/iWQt1Pin74=;
 b=ffdm6h/IqiNJopld3ZQUEbJquS8YlQBV4G18XMKvW8eqZkciTzd+WopwOhX2RxenGTbI7qVbyk/3KTSMp5qdmVh2bFx82PAyv5vsWK4lR/Z5qGLYYyRMqBel/q2NiSdIyMSmoeuiRA+N3Qtre6M5tDWxkZnqMXESV4lrIP5JbK4X0MDQ61/Pd38AciY4OXWRGL94+QgAY6aVm50EWx1TRIS0apyBm1pGIngizjNjg2e4stTVjpcAvlGcXRJK6v7il5qzK7SS9r2hVnGPeqeXN9HR7iM8JRA4VZ4O9NRh5JEWrTXkfaB1NB6QtUfabX0o7nl4DowzVBL1ziAs5zdhsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj/IalUTmM59yXbNC2TLy02SflrorFzC/iWQt1Pin74=;
 b=TyhTXHu5xrRYsk3x3jzoQBuEZ6fJakv/iAwIi5Oo3DbbWncxcYVUNplqvrr0IwQBZUxaMygYbfrqeY5kJlkeBhYXIVbpXYusTZDhfKW6idK28Y92NAVyt622HAn61cMBdirPKGe3twsUMFrTy6FnQkuHXIZwLeqSf4sFbVxAlIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5243.namprd12.prod.outlook.com (2603:10b6:408:100::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 15:55:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 15:55:07 +0000
Message-ID: <f425ed19-4786-4337-9bcc-b560e9a98a09@amd.com>
Date: Tue, 21 Nov 2023 16:55:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] drm/ttm/tests: Test simple BO creation and
 validation
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1700207346.git.karolina.stolarek@intel.com>
 <fe0d1ba291b12e7b4671bee8b95812ac30a469df.1700207346.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <fe0d1ba291b12e7b4671bee8b95812ac30a469df.1700207346.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5243:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2b6380-5c25-4232-f662-08dbeaaa3bb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iOcZ+EM4V6kqAqx9gYFZOED7OioFlUTaFomFsNUP25Xd6z86qhTTqH9CjHZI2UiM/l8K+IrrU2Xe7Y6A8IvzMlOUc3qVENGAZu9ekuZQKzH8x5U+6xl1+N/qjqpuVMYWJ5x8fbQc27S9K+/e5CkU3tgrMLUXxytZRfeu9Pu0E+7qqaHzAYg10FpU1ZYLdct8NUGtyhDCWFg5zjYqcWEi/oa0rIS5yS1fUcZXpkzpNEYxuXImqNQDVBfTJbQ/fg69a7A+y94XaHoCnQvMVYxqDXLxvF+1+QGEeV+H79GabfzkiVnqy8Io15FrGHpiGBbvOE6mYUBasfwFPxZJc+S3iG8XjPBWoCGhy3kEm0kfKK1sCZu9l8U3UXp3hXCzsBYGY7LAfnSb3bG4RlBQ5HI60JEVnChTWPXI9pNAvcs4fAKxPdbwM97WzNeXvogBtkLo02/+yzx0idsuBTbiGD34cgucVmSYmXVxB1ov4mbiWucjqf4T6d1fw5Ed6g71WDQzaOxJvicabzl6YepHKI/JohT6arqBUBp8v+32ahUP6IMlX4KC2T2utT+xNy0nq8ps13NOxUcp6oPDcyoCjo6BGmALI3QW1YYxnA+kDAHRPBS0OdtjW0boFUUlwY7mXFdSZts26ML7SmpBYYbgwuifpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(41300700001)(2906002)(86362001)(36756003)(5660300002)(31696002)(31686004)(6512007)(2616005)(26005)(66574015)(478600001)(83380400001)(6486002)(6506007)(6666004)(38100700002)(4326008)(8676002)(316002)(8936002)(66476007)(66946007)(54906003)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUFiQzN2dHlXcng0YU1QYVh2NFZ6YUx5N3JiZFJCTGxQa0JzZFZhMFpmYkR0?=
 =?utf-8?B?ZjNJUEQxQmQ1U05yY1dYcVdjZ2V1NExGUmoweWREeXFIWFBBMzRvTHFpRWlM?=
 =?utf-8?B?QVpNcS80M2puS21qS0NyT2VOajRRZ2hqa3lnTWxETlpINFFXUmhzaUhSa004?=
 =?utf-8?B?bnVlNzRsbHJlWVJST2lCS2poZTRCUGVjbGVPakZmUjNudzlMdzZsdGlpUkV5?=
 =?utf-8?B?ZVkvZDBJQXVNNTl5OFZ6ekFXTEpIZmEyZ2dLZE1Qcko3L0xDTHhRWTRXcldv?=
 =?utf-8?B?TFlSWjdxUVh0dkdWRk9keVIxWVE5cUZNZzdNWWhRdU03dzVCRjEvWWRXMTNX?=
 =?utf-8?B?ZGcxb29qVWdGczlWL0pyRWJ5Nk81ZUFhRys0bGpjdTZtdS82V2lLVDYyczFS?=
 =?utf-8?B?ZkxISm51ZXF5RVFrL3pEcStjRC9BS1ltdWRGdHk2U2ZZTGN5RTJVa3ptTnhy?=
 =?utf-8?B?cnRQZEhrcncyUkRRdXRwTjIzVG1UR0MybjNNdmc5b1dDYjFtRlJ2SnQ0Mzg4?=
 =?utf-8?B?RklESEd5UnZRUGUyKy84Q1d1dGlZTGVFS0lhZTJoZFFQekREcFVMeURQVjZ3?=
 =?utf-8?B?RFZ2U2xXdDc1MzFOUUF0b3ZwS1lMMlVpRHd0NTVFTldZdDdFNkVzT1NmTGFl?=
 =?utf-8?B?WENpVjY0MlN5TW5WcmpwN05SOENZYkgwTEtYbTFXUHc1QmlVMjNDajlVVE9r?=
 =?utf-8?B?ZmVtZHdLNkxiRFY1Rk03ZTZjZ0VURXBHbS9nVE9SYllrNzhjVkF3R3NSUWw1?=
 =?utf-8?B?K29KL2plUDBKRFhKcTRoS1BHbDliUnh3c1FGQ3RsQXh4cTJIaUw1cFJKVnJZ?=
 =?utf-8?B?YVZERW81YXRRUEU3cldXRFF2N0IvM2lGQkpRQ3VXT0JJVUxaQnJ1aHJuQWdt?=
 =?utf-8?B?WkFBZjY5Y0ZCU2hZTUJzSEE3c1MxQnhRby9LdXd0YitweWVoWDdaSElNb2Ra?=
 =?utf-8?B?SHBYbG1vRXB0SWxTRysyN3ZOT05mMFVYeVJKbXkrdGlCWUVlWld5WTlSL3Nl?=
 =?utf-8?B?N2NNSGF6S0hxVG5FZnJhVnhlSkFXaHZtZ3JBM2N2L1BZOFV4c1hsdGNHY2dT?=
 =?utf-8?B?SENnZnlnM2szZUxLbDk4TUUzY3N1Sy9WZGNsWWp3OXFzb1pGR2ZJcFIwRDFR?=
 =?utf-8?B?YzBCblN4TFRaM0xjOWsvMEJ3SWpyaTNhL1J1ZE9yVzNZK0dHMTRxU0JvL1dH?=
 =?utf-8?B?UWtCSzBCZlVLSHYrWlhYZUQ4cjFjem1UQXVRdS9aUDk3TnVSUERYNEFqNDRt?=
 =?utf-8?B?Y2l1TWw0aGhuNVp0VkFHdlZIS3ZtTE0rY2pjSS85TVVCOHZKVDF1b3pFREIz?=
 =?utf-8?B?aVh1N1Z6Y0kwT3lSQVdTanZYSytoLzRuejc0UkdkZkMzdzg2eEpoNEZNQWU5?=
 =?utf-8?B?Z21SZ1oyZmNvVHRuMWFOLzNzdGNKSkJwZ3JiTnZMa1VjOU1tTjZBTWt0d1hh?=
 =?utf-8?B?RTFkKzlBS0lKTmNIN0VpNmJla0sxK0E1WjFOMlc4dGthS0xlbVp2TDZLWTl0?=
 =?utf-8?B?Y3NXcVF4SklVK2xPekVmdm0xMGRESDNNaHczbjBSYVdzSW5SV0c5aVhGNGto?=
 =?utf-8?B?L0ZKWG56b3REMkV1eGtTWGJHMUZ3QWR3WE9vSXM5ZkhCbldRQ1RsQVprNnZL?=
 =?utf-8?B?aGpoT3h2QVAvbGVYcWZnd1AvLzJCK1hiNWtiV3BXekxEdTEvVWs3NVlPNVdp?=
 =?utf-8?B?RTN5UTJKS2JNSkU0ZVJvU1JkRCtyQXBVdHdqSmxoMWtLbjh4dlF1aFlNcGRI?=
 =?utf-8?B?T01BQW8rWnk2dmlCTzd4ZnRoYWNxSmxYa3ZJdVZJclVGRHBIWUkwTytHaE9J?=
 =?utf-8?B?cDB6WW1XMzJ3TjFHTUN6TGNGMXFqNWpGUTRhNXF1clVMalptSXdCQ1h4NC9V?=
 =?utf-8?B?bGlJTVRHL2VYT2ZIWWorMnpRZW9lVWUxdEtyZTI4WHRPTm9yOEFnYlhHTnMy?=
 =?utf-8?B?bE1ycUV4dzRKUWxMOUxPV3NPMU5RRk9iVk1LWDFNTEFNOEZHeXJHNk9vckVx?=
 =?utf-8?B?VnY1eGx6T2gxZWdCTjZVa2drUFJubTNKYUVUcS9nNVpKaTR4R2dSQW83MVZv?=
 =?utf-8?B?cmNYeVZFVFZaQmRnZGNSSVVhMjZZWWNJbklBMzQ4bURYTmVwcDRQSkZzVGl1?=
 =?utf-8?Q?wMD+UduhdVfSaV0Ww1vjlGR0B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2b6380-5c25-4232-f662-08dbeaaa3bb7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 15:55:07.2843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZwWhZR9NKl3BcyJ8oPAcG6OUyknLlhux6ZEyfqIlY9hdepZ+2GShbWIYgtpcnCf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5243
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.11.23 um 09:49 schrieb Karolina Stolarek:
> Add tests for ttm_bo_init_reserved() and ttm_bo_validate() that use
> sys manager. Define a simple move function in ttm_device_funcs. Expose
> destroy callback of the buffer object to make testing of
> ttm_bo_init_reserved() behaviour easier.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>

Quite a bit hacky, but I think you got that correct.

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 211 ++++++++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  14 +-
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   1 +
>   4 files changed, 226 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> index 468535f7eed2..2e5ed63fb414 100644
> --- a/drivers/gpu/drm/ttm/tests/Makefile
> +++ b/drivers/gpu/drm/ttm/tests/Makefile
> @@ -6,4 +6,5 @@ obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>           ttm_resource_test.o \
>           ttm_tt_test.o \
>           ttm_bo_test.o \
> +        ttm_bo_validate_test.o \
>           ttm_kunit_helpers.o
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> new file mode 100644
> index 000000000000..1d50e4ba9775
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -0,0 +1,211 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/ttm/ttm_resource.h>
> +#include <drm/ttm/ttm_placement.h>
> +#include <drm/ttm/ttm_tt.h>
> +
> +#include "ttm_kunit_helpers.h"
> +
> +#define BO_SIZE		SZ_4K
> +
> +struct ttm_bo_validate_test_case {
> +	const char *description;
> +	enum ttm_bo_type bo_type;
> +	bool with_ttm;
> +};
> +
> +static struct ttm_placement *ttm_placement_kunit_init(struct kunit *test,
> +						      struct ttm_place *places,
> +						      unsigned int num_places,
> +						      struct ttm_place *busy_places,
> +						      unsigned int num_busy_places)
> +{
> +	struct ttm_placement *placement;
> +
> +	placement = kunit_kzalloc(test, sizeof(*placement), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, placement);
> +
> +	placement->num_placement = num_places;
> +	placement->placement = places;
> +	placement->num_busy_placement = num_busy_places;
> +	placement->busy_placement = busy_places;
> +
> +	return placement;
> +}
> +
> +static void ttm_bo_validate_case_desc(const struct ttm_bo_validate_test_case *t,
> +				      char *desc)
> +{
> +	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +static const struct ttm_bo_validate_test_case ttm_bo_type_cases[] = {
> +	{
> +		.description = "Buffer object for userspace",
> +		.bo_type = ttm_bo_type_device,
> +	},
> +	{
> +		.description = "Kernel buffer object",
> +		.bo_type = ttm_bo_type_kernel,
> +	},
> +	{
> +		.description = "Shared buffer object",
> +		.bo_type = ttm_bo_type_sg,
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM(ttm_bo_types, ttm_bo_type_cases,
> +		  ttm_bo_validate_case_desc);
> +
> +static void ttm_bo_init_reserved_sys_man(struct kunit *test)
> +{
> +	const struct ttm_bo_validate_test_case *params = test->param_value;
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_placement *placement;
> +	enum ttm_bo_type bo_type = params->bo_type;
> +	struct ttm_operation_ctx ctx = { };
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	int err;
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1, NULL, 0);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> +
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement,
> +				   PAGE_SIZE, &ctx, NULL, NULL,
> +				   &dummy_ttm_bo_destroy);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_EQ(test, kref_read(&bo->kref), 1);
> +	KUNIT_EXPECT_PTR_EQ(test, bo->bdev, priv->ttm_dev);
> +	KUNIT_EXPECT_EQ(test, bo->type, bo_type);
> +	KUNIT_EXPECT_EQ(test, bo->page_alignment, PAGE_SIZE);
> +	KUNIT_EXPECT_PTR_EQ(test, bo->destroy, &dummy_ttm_bo_destroy);
> +	KUNIT_EXPECT_EQ(test, bo->pin_count, 0);
> +	KUNIT_EXPECT_NULL(test, bo->bulk_move);
> +	KUNIT_EXPECT_NOT_NULL(test, bo->ttm);
> +	KUNIT_EXPECT_FALSE(test, ttm_tt_is_populated(bo->ttm));
> +	KUNIT_EXPECT_NOT_NULL(test, (void *)bo->base.resv->fences);
> +	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
> +
> +	if (bo_type != ttm_bo_type_kernel)
> +		KUNIT_EXPECT_TRUE(test,
> +				  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
> +
> +	ttm_resource_free(bo, &bo->resource);
> +	ttm_bo_put(bo);
> +}
> +
> +static void ttm_bo_init_reserved_resv(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_placement *placement;
> +	struct dma_resv resv;
> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
> +	struct ttm_operation_ctx ctx = { };
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	int err;
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1, NULL, 0);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> +	dma_resv_init(&resv);
> +	dma_resv_lock(&resv, NULL);
> +
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement,
> +				   PAGE_SIZE, &ctx, NULL, &resv,
> +				   &dummy_ttm_bo_destroy);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_PTR_EQ(test, bo->base.resv, &resv);
> +
> +	ttm_resource_free(bo, &bo->resource);
> +	ttm_bo_put(bo);
> +}
> +
> +static void ttm_bo_validate_invalid_placement(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_placement *placement;
> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
> +	struct ttm_operation_ctx ctx = { };
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	uint32_t unknown_mem_type = TTM_PL_PRIV + 1;
> +	int err;
> +
> +	place = ttm_place_kunit_init(test, unknown_mem_type, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1, NULL, 0);
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, size);
> +	bo->type = bo_type;
> +
> +	ttm_bo_reserve(bo, false, false, NULL);
> +	err = ttm_bo_validate(bo, placement, &ctx);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, -EINVAL);
> +
> +	ttm_bo_put(bo);
> +}
> +
> +static void ttm_bo_validate_pinned(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_placement *placement;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
> +	struct ttm_operation_ctx ctx = { };
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	int err;
> +
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1, NULL, 0);
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, size);
> +	bo->type = bo_type;
> +
> +	ttm_bo_reserve(bo, false, false, NULL);
> +	ttm_bo_pin(bo);
> +	err = ttm_bo_validate(bo, placement, &ctx);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, -EINVAL);
> +}
> +
> +static struct kunit_case ttm_bo_validate_test_cases[] = {
> +	KUNIT_CASE_PARAM(ttm_bo_init_reserved_sys_man, ttm_bo_types_gen_params),
> +	KUNIT_CASE(ttm_bo_init_reserved_resv),
> +	KUNIT_CASE(ttm_bo_validate_invalid_placement),
> +	KUNIT_CASE(ttm_bo_validate_pinned),
> +	{}
> +};
> +
> +static struct kunit_suite ttm_bo_validate_test_suite = {
> +	.name = "ttm_bo_validate",
> +	.init = ttm_test_devices_all_init,
> +	.exit = ttm_test_devices_fini,
> +	.test_cases = ttm_bo_validate_test_cases,
> +};
> +
> +kunit_test_suites(&ttm_bo_validate_test_suite);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index 899a54dbe443..b07ea760d819 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -22,13 +22,19 @@ static void ttm_tt_simple_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>   	kfree(ttm);
>   }
>   
> -static void dummy_ttm_bo_destroy(struct ttm_buffer_object *bo)
> +static int mock_move(struct ttm_buffer_object *bo, bool evict,
> +		     struct ttm_operation_ctx *ctx,
> +		     struct ttm_resource *new_mem,
> +		     struct ttm_place *hop)
>   {
> +	bo->resource = new_mem;
> +	return 0;
>   }
>   
>   struct ttm_device_funcs ttm_dev_funcs = {
>   	.ttm_tt_create = ttm_tt_simple_create,
>   	.ttm_tt_destroy = ttm_tt_simple_destroy,
> +	.move = mock_move,
>   };
>   EXPORT_SYMBOL_GPL(ttm_dev_funcs);
>   
> @@ -88,6 +94,12 @@ struct ttm_place *ttm_place_kunit_init(struct kunit *test,
>   }
>   EXPORT_SYMBOL_GPL(ttm_place_kunit_init);
>   
> +void dummy_ttm_bo_destroy(struct ttm_buffer_object *bo)
> +{
> +	drm_gem_object_release(&bo->base);
> +}
> +EXPORT_SYMBOL_GPL(dummy_ttm_bo_destroy);
> +
>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
>   {
>   	struct ttm_test_devices *devs;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index 53bb5834939f..3e5fe272c54c 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -31,6 +31,7 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>   					    size_t size);
>   struct ttm_place *ttm_place_kunit_init(struct kunit *test,
>   				       uint32_t mem_type, uint32_t flags);
> +void dummy_ttm_bo_destroy(struct ttm_buffer_object *bo);
>   
>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
>   struct ttm_test_devices *ttm_test_devices_all(struct kunit *test);

