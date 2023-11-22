Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6937F481F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 14:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEC310E631;
	Wed, 22 Nov 2023 13:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2D010E631
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 13:48:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3ZkFWXsGaPtIAgLkqqP+praIaFlYqIwa5SWlFydFzP/soDEoQlkMhmA8b45sX8/jofliK24vFGvU7c0piE6w6RUCbPEgBVykIA0qDMP3LKhkWBuTD0D5KhnXGk3KBhNLqqhghadwp7egab3iRflSa1/lmlN0sjWL4VZW0o4VY1NxHnPPN9nST8njmrB+HszuFztkF9gX3AeP7NxetwVggVeIu+PXu6dcraeLaiMLgspLgEXjAuyb03ew8Oa5NwqjFUhvDijRnys0SlNnitHQD+2J2nPu5eXQZcs/MIgSthMtJmpTThgfEqNRUIMZpwRNTVj9USwrEQ40BtMB8Vh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OSrZgZ50BwE8JrjB9b3B7AdmxK2KiCwoWDO3qtLQ1s=;
 b=aJOyLqtm4rgjruWZKjB1/hl9D9fRn9NcONHTVPVnQRXPrt4cKPKnzokwBpZXYegQwKqGDNBAgt4pXT8C3S/ij/EfNgx+dNLmdZg2uACoAs7sKwKy0+62IbiaIjVY5SbKUqHvdi4tt3K3Myi3XIDEAscRisoz/Igbi38sCGUettdxZ9SDM27C8adbNx8VyuspHtCQMo3t17Nyn9YBqmyo83dWTsrUiP0TVN281KOu9JeP/AaqpjEoaJBbb/0yEpD3MuWukzfcvW8d5N9jcXRzl8rYaFIh58+fjasPrNSZyZhcsYX6MYM0uJrsOQrMpXypbRIhj1HNHjsPz7kdE8L0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OSrZgZ50BwE8JrjB9b3B7AdmxK2KiCwoWDO3qtLQ1s=;
 b=F8lomGOZKiblM08yImhygmLO7GljAriHF8GUlJwd6IzycOorDWQ/uVCRbsEOGubMEIGJpGkJQpfuNYJibdzgdKtKlxInfJNzFk97qP+5UhQzhGT216Nvfg/41N8Lj/tf5tZg9L9B6UrGuLDVDeV2kLGtjfsScsTZNtTlJMafGS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL0PR12MB4947.namprd12.prod.outlook.com (2603:10b6:208:17d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 13:48:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 13:48:50 +0000
Message-ID: <02d659bb-8e38-4d95-acff-0d57721929bd@amd.com>
Date: Wed, 22 Nov 2023 14:48:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] drm/ttm/tests: Add tests with mock resource
 managers
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1700207346.git.karolina.stolarek@intel.com>
 <8526023b323b9b3644253727e73943afe5cacdd7.1700207346.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8526023b323b9b3644253727e73943afe5cacdd7.1700207346.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL0PR12MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: 468014a6-b005-47cf-0826-08dbeb61c19d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 15jQiOZkPOBJsaiLNF+enodF7HafKgTKXpswzgNjCvQRVW9/rO7sPZaiePgcXJE+xYfJA1FdFa64HoGKgK6viypE5RsF0v8t/3y6WcHhWRi6txmQ2D4hN19ZhQTnq1t21GLihA30Xdcxax7aCs/JlqzDAMPpkscJX06ttTr1w/CTBi21emYSpGb0DUvmQYZ4Ph6WVIrO1VL5KLSlkn/f3X4aJffdYAPmWWI0dAg1IipepY7BWc3TLLyNdJ/tP5SyBo4obrPtE+xP2J3xaWTVAbr2QPtCzi4UHjJXN8UojI9ggMJjo38sg4U/1pmkr8/PQcapnJikxVG0mVHa/44+ui8twTtwrnFqa+J8E06RKEpr8C/amKJCgadwlTqakmmfZBCCav3rCavjp2Mj8SDDcYcfpKzd9EvGNb/4+ecXTrvzH6qcxScM3tMyO1HBNXyuJiK39RxDFp+5NhgwYrkfd8srEWvvo5hmlzKjvieYI1Ye5smnQ+sEmLbc/9eZ02R+fDtBYPQEkJ/1etvfycLd1Lvq97nvduX2jQt4x4sXoGdjVVyF9u0htzATAhUN6Yun8sGT/KzKfJn2uc7I9/KWqiDEiApZp00MU0WmYFe1quSpw4TJYVqpOHhZyMsgHKPozv721Dogj9XsosXsRjA1zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6666004)(83380400001)(38100700002)(31686004)(66574015)(5660300002)(6506007)(2616005)(6512007)(4326008)(8676002)(8936002)(30864003)(41300700001)(36756003)(86362001)(31696002)(2906002)(54906003)(66476007)(66556008)(66946007)(26005)(6486002)(478600001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFIranJqUTBGYWJ0eUV0SUx3MWJiYW5EWjZEOGY5VHR6S2FYUURHSUY0SUYv?=
 =?utf-8?B?amM3WDZEUTUrU21jN2NvWkhnMzBkdElNd0c5ZXVRQkhkRkJ2eW1aVlNSOFkw?=
 =?utf-8?B?UU1nNjllcm05d25ITG9Fd3ZpcWxyYjBnVlhpNDRGMjh4eE15UzloVkJIT0cz?=
 =?utf-8?B?RGlOL3hqdzIxMGdOMm8xQStOUEZ6djYxS1R5S2tqQU45OUcxME5ETWtxV0Mw?=
 =?utf-8?B?Z2M1K1lqRHZuV0syeXlaODluMnNnc0c3b0Evemh5NE9OVUtDZnd5UXpxRHhQ?=
 =?utf-8?B?WHlRYU0yVlREQnFBNEhxd29YamRaWUFaejY1NGdaWDg4Q2xjOU9pWGxXVWVM?=
 =?utf-8?B?ZlIzQjhWMnorM1FhbDBxSHN2Nlh3K0tlS1pGUDJkM2RLRTA5VFEvb2xobDhm?=
 =?utf-8?B?YUVheEtVNUpJTE9kb290QTRmRjVaMEZWTGxrUUhWUmdWOVJlbGNEeUp5aDVP?=
 =?utf-8?B?ZzZ5cWNWTzI5SVloTDhBbzRHTjlDZzMxZ0VvbWtnMXV5VWpjczRLU2UvL1lp?=
 =?utf-8?B?TEwwUUVtRlZleGM5Nmg3a3VGbTRQdGpHRml1VVd1ZEFublNWSnZBTmpsYm1I?=
 =?utf-8?B?OW1BV3pURmY0aGQ1QkE3MVJFT1NkWWZ0L0Y5NWRVbGdxTzB1aWhRVStZMlJT?=
 =?utf-8?B?SjQ3cTVocldMMVhsZkhZRWFudWplLy80WWdScjZpNUlzK3JvTzA5OS96L055?=
 =?utf-8?B?UEpHT011OVlQem0vQ3BLeThuTlQ0YjRZMHZYTmZlV0ZFMUphWFdLUktpbG9s?=
 =?utf-8?B?d2lPU3ozaXNWd3JqN251NlpIaGZuQmtPeHE4VWIrMXVYTks4ZjRSc293ZzNZ?=
 =?utf-8?B?cXFxTWFWejhva2pQOEZGS0dOUUowekI2a0FOc1EwUXJuSGVOVEZFZVlqWVZN?=
 =?utf-8?B?cG53bmt1aEJFbnZHZXFrR0FwN2ZMdGV3R1NoTG8xOUZMbkszTS9nWDZtWElL?=
 =?utf-8?B?SDZweFpxdlRqdlllb3dyQm9pdUlyV0RVUGdtK3U2akd4a1ZiNmdBbmUzQnV3?=
 =?utf-8?B?RE9YcnF0RDVWdFB3M3hiLy9Mdm5TTzllYVZ3TUwyVXNvK1lBVVRaZmFuSDV2?=
 =?utf-8?B?YlplUXNLTFhtM1BWUU90UjNTczVWNTExRjZtZmEzN2dWVmhiMEdTNWd1bUlZ?=
 =?utf-8?B?YUtwa3E0VGg5VmlLYmd0eXBnWW9rVnFweXFQU2hlbDhRN2JSWDRxejhNL3VV?=
 =?utf-8?B?NU5wK0c4MkYzU3FvS3BTdEsrcW4xYjZaZm13Z0tZUE5kVThhY3E5L1Y2bjRU?=
 =?utf-8?B?Tkk0V3VPeEpLSUk4UHhtUHdRWVRSc0NXQ2loUmJLeHVaS1UvWGtraFRML3A4?=
 =?utf-8?B?blNXdlllRTcvalgxUGRWRzB4L0VhUWlneUtCc1pod2daRWdFSWp5ZUFiQUdI?=
 =?utf-8?B?cTd5VzE5U2hDdm56a28rTWE4NXNaM3YvWEFVaitnY1l3NXh5Q2hNWEJBR1VV?=
 =?utf-8?B?ZjlwMVVOcEkyREV3NFZhaUdXNHRNbUZaSHQ1ZHFGSmh2SkRrNVdMSHdKSWVi?=
 =?utf-8?B?YjQ0UEU0UEl6dlNSMUVlRWxWSnEvampSWlcvTmZ3ZEgycC9jWEtpU1Q5OFlj?=
 =?utf-8?B?KzFUMHpYQkRBMUw2ekx2Y2VaNS9wZEFxaGEvNFo0VWtXNC9hajJuS0Y5QjZ0?=
 =?utf-8?B?cExSTy8ySFhnZno3QXI4VmJxVnBPYW85clNuc25DR0xCbzE3d1ZsekUxdUth?=
 =?utf-8?B?dEhkNzcvVm8vVnR4TlpXZGFhU3owUWZPZ25hVUNpZWxZN3Rabk5qTXVSeU9o?=
 =?utf-8?B?WjdEbDZTNGdRQUdoWUtidUNlTmNvYUYrbkFRbzdUV0hVNzVVWXE2a1FFS2ZV?=
 =?utf-8?B?L1BjTTJPemVpWHpVclRScmJLZDh2Q3VNVjNDTUdNdFl2NE5FanRxSTF1Njgx?=
 =?utf-8?B?YTNpNFRVN0lqOVZjeDVLWGRUMEgzaEpwYlh0LzlvSzBOQWlKTzJWQ0ZCdDhj?=
 =?utf-8?B?VlZ4eTdsYjFuWlBaSmN0MmVReVl4Q1BBRFIxdWNrZks3WHBRSTVSSHpya0Fq?=
 =?utf-8?B?Zm5lNjBKNzBrdDl2dU0remlGRGpsanRJNXdPbWhyY3I3LzcyNENySVpKNG54?=
 =?utf-8?B?YmtkQVBUVkJJc0tEZ3Y0aUNuV09VeFM2VlIvYUs0STduUDBNQklkVjllbU9X?=
 =?utf-8?Q?byf8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 468014a6-b005-47cf-0826-08dbeb61c19d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 13:48:49.8164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39/MUlKOkFsFZWHtXvfK7khcL/WtFvR9J1yuFH7SBMJL3PC/oI2T3L8svNCoGsOB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4947
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
> Add mock resource manager to test ttm_bo_validate() with non-system
> placements. Update KConfig entry to enable DRM Buddy allocator, used
> by the mock manager. Update move function to do more than just assign
> a resource.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/Kconfig                       |   1 +
>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   1 +
>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 276 ++++++++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  39 ++-
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   2 +
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 206 +++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |  31 ++
>   8 files changed, 555 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index cdbc56e07649..34e4c43e7ffb 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -200,6 +200,7 @@ config DRM_TTM_KUNIT_TEST
>           default n
>           depends on DRM && KUNIT && MMU
>           select DRM_TTM
> +        select DRM_BUDDY
>           select DRM_EXPORT_FOR_TESTS if m
>           select DRM_KUNIT_TEST_HELPERS
>           default KUNIT_ALL_TESTS
> diff --git a/drivers/gpu/drm/ttm/tests/.kunitconfig b/drivers/gpu/drm/ttm/tests/.kunitconfig
> index 75fdce0cd98e..9228ce9b913c 100644
> --- a/drivers/gpu/drm/ttm/tests/.kunitconfig
> +++ b/drivers/gpu/drm/ttm/tests/.kunitconfig
> @@ -2,3 +2,4 @@ CONFIG_KUNIT=y
>   CONFIG_DRM=y
>   CONFIG_DRM_KUNIT_TEST_HELPERS=y
>   CONFIG_DRM_TTM_KUNIT_TEST=y
> +CONFIG_DRM_BUDDY=y
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> index 2e5ed63fb414..f3149de77541 100644
> --- a/drivers/gpu/drm/ttm/tests/Makefile
> +++ b/drivers/gpu/drm/ttm/tests/Makefile
> @@ -7,4 +7,5 @@ obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>           ttm_tt_test.o \
>           ttm_bo_test.o \
>           ttm_bo_validate_test.o \
> +        ttm_mock_manager.o \
>           ttm_kunit_helpers.o
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 1d50e4ba9775..5f6c24979f83 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -8,12 +8,15 @@
>   #include <drm/ttm/ttm_tt.h>
>   
>   #include "ttm_kunit_helpers.h"
> +#include "ttm_mock_manager.h"
>   
>   #define BO_SIZE		SZ_4K
> +#define MANAGER_SIZE	SZ_1M
>   
>   struct ttm_bo_validate_test_case {
>   	const char *description;
>   	enum ttm_bo_type bo_type;
> +	uint32_t mem_type;
>   	bool with_ttm;
>   };
>   
> @@ -106,6 +109,49 @@ static void ttm_bo_init_reserved_sys_man(struct kunit *test)
>   	ttm_bo_put(bo);
>   }
>   
> +static void ttm_bo_init_reserved_mock_man(struct kunit *test)
> +{
> +	const struct ttm_bo_validate_test_case *params = test->param_value;
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_placement *placement;
> +	enum ttm_bo_type bo_type = params->bo_type;
> +	struct ttm_operation_ctx ctx = { };
> +	uint32_t mem_type = TTM_PL_VRAM;
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	int err;
> +
> +	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	place = ttm_place_kunit_init(test, mem_type, 0);
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
> +	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
> +
> +	if (bo_type != ttm_bo_type_kernel)
> +		KUNIT_EXPECT_TRUE(test,
> +				  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
> +
> +	ttm_resource_free(bo, &bo->resource);
> +	ttm_bo_put(bo);
> +	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
> +}
> +
>   static void ttm_bo_init_reserved_resv(struct kunit *test)
>   {
>   	struct ttm_test_devices *priv = test->priv;
> @@ -140,6 +186,51 @@ static void ttm_bo_init_reserved_resv(struct kunit *test)
>   	ttm_bo_put(bo);
>   }
>   
> +static void ttm_bo_validate_basic(struct kunit *test)
> +{
> +	const struct ttm_bo_validate_test_case *params = test->param_value;
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *fst_place, *snd_place;
> +	struct ttm_placement *fst_placement, *snd_placement;
> +	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
> +	uint32_t size = ALIGN(SZ_8K, PAGE_SIZE);
> +	uint32_t fst_mem = TTM_PL_SYSTEM, snd_mem = TTM_PL_VRAM;
> +	int err;
> +
> +	ttm_mock_manager_init(priv->ttm_dev, snd_mem, MANAGER_SIZE);
> +
> +	fst_place = ttm_place_kunit_init(test, fst_mem, 0);
> +	fst_placement = ttm_placement_kunit_init(test, fst_place, 1, NULL, 0);
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> +
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, params->bo_type,
> +				   fst_placement, PAGE_SIZE, &ctx_init, NULL,
> +				   NULL, &dummy_ttm_bo_destroy);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	snd_place = ttm_place_kunit_init(test, snd_mem, DRM_BUDDY_TOPDOWN_ALLOCATION);
> +	snd_placement = ttm_placement_kunit_init(test, snd_place, 1, NULL, 0);
> +
> +	err = ttm_bo_validate(bo, snd_placement, &ctx_val);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, bo->base.size);
> +	KUNIT_EXPECT_NOT_NULL(test, bo->ttm);
> +	KUNIT_EXPECT_TRUE(test, ttm_tt_is_populated(bo->ttm));
> +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
> +	KUNIT_EXPECT_EQ(test, bo->resource->placement,
> +			DRM_BUDDY_TOPDOWN_ALLOCATION);
> +
> +	ttm_bo_put(bo);
> +	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
> +}
> +
>   static void ttm_bo_validate_invalid_placement(struct kunit *test)
>   {
>   	struct ttm_buffer_object *bo;
> @@ -166,6 +257,36 @@ static void ttm_bo_validate_invalid_placement(struct kunit *test)
>   	ttm_bo_put(bo);
>   }
>   
> +static void ttm_bo_validate_failed_alloc(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_placement *placement;
> +	uint32_t mem_type = TTM_PL_VRAM;
> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
> +	struct ttm_operation_ctx ctx = { };
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	int err;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, size);
> +	bo->type = bo_type;
> +
> +	ttm_bad_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
> +
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1, NULL, 0);
> +
> +	ttm_bo_reserve(bo, false, false, NULL);
> +	err = ttm_bo_validate(bo, placement, &ctx);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
> +
> +	ttm_bo_put(bo);
> +	ttm_bad_manager_fini(priv->ttm_dev, mem_type);
> +}
> +
>   static void ttm_bo_validate_pinned(struct kunit *test)
>   {
>   	struct ttm_buffer_object *bo;
> @@ -191,11 +312,166 @@ static void ttm_bo_validate_pinned(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, err, -EINVAL);
>   }
>   
> +static const struct ttm_bo_validate_test_case ttm_mem_type_cases[] = {
> +	{
> +		.description = "System manager",
> +		.mem_type = TTM_PL_SYSTEM,
> +	},
> +	{
> +		.description = "VRAM manager",
> +		.mem_type = TTM_PL_SYSTEM,
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM(ttm_bo_validate_mem, ttm_mem_type_cases,
> +		  ttm_bo_validate_case_desc);
> +
> +static void ttm_bo_validate_same_placement(struct kunit *test)
> +{
> +	const struct ttm_bo_validate_test_case *params = test->param_value;
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_placement *placement;
> +	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	int err;
> +
> +	place = ttm_place_kunit_init(test, params->mem_type, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1, NULL, 0);
> +
> +	if (params->mem_type != TTM_PL_SYSTEM)
> +		ttm_mock_manager_init(priv->ttm_dev, params->mem_type, MANAGER_SIZE);
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> +
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, params->bo_type,
> +				   placement, PAGE_SIZE, &ctx_init, NULL,
> +				   NULL, &dummy_ttm_bo_destroy);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	err = ttm_bo_validate(bo, placement, &ctx_val);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, 0);
> +
> +	if (params->mem_type != TTM_PL_SYSTEM)
> +		ttm_mock_manager_fini(priv->ttm_dev, params->mem_type);
> +
> +	ttm_bo_put(bo);
> +}
> +
> +static void ttm_bo_validate_busy_placement(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *init_place, *place_bad, *place_busy;
> +	struct ttm_placement *placement_init, *placement_val;
> +	struct ttm_resource_manager *man;
> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
> +	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
> +	uint32_t fst_mem = TTM_PL_VRAM, snd_mem = TTM_PL_VRAM + 1;
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	int err;
> +
> +	ttm_bad_manager_init(priv->ttm_dev, fst_mem, MANAGER_SIZE);
> +	ttm_mock_manager_init(priv->ttm_dev, snd_mem, MANAGER_SIZE);
> +
> +	init_place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0);
> +	placement_init = ttm_placement_kunit_init(test, init_place, 1, NULL, 0);
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> +
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement_init,
> +				   PAGE_SIZE, &ctx_init, NULL, NULL,
> +				   &dummy_ttm_bo_destroy);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	place_bad = ttm_place_kunit_init(test, fst_mem, 0);
> +	place_busy = ttm_place_kunit_init(test, snd_mem, 0);
> +	placement_val = ttm_placement_kunit_init(test, place_bad, 1, place_busy, 1);
> +
> +	err = ttm_bo_validate(bo, placement_val, &ctx_val);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	man = ttm_manager_type(priv->ttm_dev, place_busy->mem_type);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, bo->base.size);
> +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo->priority]));
> +
> +	ttm_bo_put(bo);
> +	ttm_bad_manager_fini(priv->ttm_dev, fst_mem);
> +	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
> +}
> +
> +static void ttm_bo_validate_multihop(struct kunit *test)
> +{
> +	const struct ttm_bo_validate_test_case *params = test->param_value;
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *fst_place, *final_place;
> +	struct ttm_placement *placement_init, *placement_val;
> +	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	uint32_t fst_mem = TTM_PL_VRAM,  tmp_mem = TTM_PL_TT,
> +		 final_mem = TTM_PL_MULTIHOP;
> +	int err;
> +
> +	ttm_mock_manager_init(priv->ttm_dev, fst_mem, MANAGER_SIZE);
> +	ttm_mock_manager_init(priv->ttm_dev, tmp_mem, MANAGER_SIZE);
> +	ttm_mock_manager_init(priv->ttm_dev, final_mem, MANAGER_SIZE);
> +
> +	fst_place = ttm_place_kunit_init(test, fst_mem, 0);
> +	placement_init = ttm_placement_kunit_init(test, fst_place, 1, NULL, 0);
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> +
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, params->bo_type,
> +				   placement_init, PAGE_SIZE, &ctx_init, NULL,
> +				   NULL, &dummy_ttm_bo_destroy);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	final_place = ttm_place_kunit_init(test, final_mem, 0);
> +	placement_val = ttm_placement_kunit_init(test, final_place, 1, NULL, 0);
> +
> +	err = ttm_bo_validate(bo, placement_val, &ctx_val);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2);
> +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, final_mem);
> +
> +	ttm_bo_put(bo);
> +
> +	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
> +	ttm_mock_manager_fini(priv->ttm_dev, tmp_mem);
> +	ttm_mock_manager_fini(priv->ttm_dev, final_mem);
> +}
> +
>   static struct kunit_case ttm_bo_validate_test_cases[] = {
>   	KUNIT_CASE_PARAM(ttm_bo_init_reserved_sys_man, ttm_bo_types_gen_params),
> +	KUNIT_CASE_PARAM(ttm_bo_init_reserved_mock_man, ttm_bo_types_gen_params),
>   	KUNIT_CASE(ttm_bo_init_reserved_resv),
> +	KUNIT_CASE_PARAM(ttm_bo_validate_basic, ttm_bo_types_gen_params),
>   	KUNIT_CASE(ttm_bo_validate_invalid_placement),
> +	KUNIT_CASE_PARAM(ttm_bo_validate_same_placement,
> +			 ttm_bo_validate_mem_gen_params),
> +	KUNIT_CASE(ttm_bo_validate_failed_alloc),
>   	KUNIT_CASE(ttm_bo_validate_pinned),
> +	KUNIT_CASE(ttm_bo_validate_busy_placement),
> +	KUNIT_CASE_PARAM(ttm_bo_validate_multihop, ttm_bo_types_gen_params),
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index b07ea760d819..719c1d56388e 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -27,8 +27,43 @@ static int mock_move(struct ttm_buffer_object *bo, bool evict,
>   		     struct ttm_resource *new_mem,
>   		     struct ttm_place *hop)
>   {
> -	bo->resource = new_mem;
> -	return 0;
> +	struct ttm_resource *old_mem = bo->resource;
> +	int ret;
> +
> +	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM && !bo->ttm)) {
> +		ttm_bo_move_null(bo, new_mem);
> +		return 0;
> +	}
> +
> +	/* Dummy multihop */
> +	if (bo->resource->mem_type == TTM_PL_VRAM &&
> +	    new_mem->mem_type == TTM_PL_MULTIHOP) {
> +		hop->mem_type = TTM_PL_TT;
> +		hop->flags = TTM_PL_FLAG_TEMPORARY;
> +		hop->fpfn = 0;
> +		hop->lpfn = 0;
> +		return -EMULTIHOP;
> +	}
> +
> +	if (old_mem->mem_type == TTM_PL_SYSTEM &&
> +	    new_mem->mem_type == TTM_PL_TT) {
> +		ttm_bo_move_null(bo, new_mem);
> +		return 0;
> +	}
> +
> +	if (old_mem->mem_type == TTM_PL_TT &&
> +	    new_mem->mem_type == TTM_PL_SYSTEM) {
> +		ret = ttm_bo_wait_ctx(bo, ctx);
> +
> +		if (ret)
> +			return ret;
> +
> +		ttm_resource_free(bo, &bo->resource);
> +		ttm_bo_assign_mem(bo, new_mem);
> +		return 0;
> +	}
> +
> +	return ttm_bo_move_memcpy(bo, ctx, new_mem);
>   }
>   
>   struct ttm_device_funcs ttm_dev_funcs = {
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index 3e5fe272c54c..a8977eb606e5 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -13,6 +13,8 @@
>   #include <drm/drm_kunit_helpers.h>
>   #include <kunit/test.h>
>   
> +#define TTM_PL_MULTIHOP (TTM_PL_PRIV + 1)
> +
>   extern struct ttm_device_funcs ttm_dev_funcs;
>   
>   struct ttm_test_devices {
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
> new file mode 100644
> index 000000000000..e1632724b349
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <drm/ttm/ttm_resource.h>
> +#include <drm/ttm/ttm_device.h>
> +#include <drm/ttm/ttm_placement.h>
> +
> +#include "ttm_mock_manager.h"
> +
> +static inline struct ttm_mock_manager *
> +to_mock_mgr(struct ttm_resource_manager *man)
> +{
> +	return container_of(man, struct ttm_mock_manager, man);
> +}
> +
> +static inline struct ttm_mock_resource *
> +to_mock_mgr_resource(struct ttm_resource *res)
> +{
> +	return container_of(res, struct ttm_mock_resource, base);
> +}
> +
> +static int ttm_mock_manager_alloc(struct ttm_resource_manager *man,
> +				  struct ttm_buffer_object *bo,
> +				  const struct ttm_place *place,
> +				  struct ttm_resource **res)
> +{
> +	struct ttm_mock_manager *manager = to_mock_mgr(man);
> +	struct ttm_mock_resource *mock_res;
> +	struct drm_buddy *mm = &manager->mm;
> +	uint64_t lpfn, fpfn, alloc_size;
> +	int err;
> +
> +	mock_res = kzalloc(sizeof(*mock_res), GFP_KERNEL);
> +
> +	if (!mock_res)
> +		return -ENOMEM;
> +
> +	fpfn = 0;
> +	lpfn = man->size;
> +
> +	ttm_resource_init(bo, place, &mock_res->base);
> +	INIT_LIST_HEAD(&mock_res->blocks);
> +
> +	if (place->flags & TTM_PL_FLAG_TOPDOWN)
> +		mock_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
> +
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
> +		mock_res->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
> +
> +	alloc_size = (uint64_t)mock_res->base.size;
> +	mutex_lock(&manager->lock);
> +	err = drm_buddy_alloc_blocks(mm, fpfn, lpfn, alloc_size,
> +				     manager->default_page_size,
> +				     &mock_res->blocks,
> +				     mock_res->flags);
> +
> +	if (err)
> +		goto error_free_blocks;
> +	mutex_unlock(&manager->lock);
> +
> +	*res = &mock_res->base;
> +	return 0;
> +
> +error_free_blocks:
> +	drm_buddy_free_list(mm, &mock_res->blocks);
> +	mutex_unlock(&manager->lock);
> +
> +	return err;
> +}
> +
> +static void ttm_mock_manager_free(struct ttm_resource_manager *man,
> +				  struct ttm_resource *res)
> +{
> +	struct ttm_mock_manager *manager = to_mock_mgr(man);
> +	struct ttm_mock_resource *mock_res = to_mock_mgr_resource(res);
> +	struct drm_buddy *mm = &manager->mm;
> +
> +	mutex_lock(&manager->lock);
> +	drm_buddy_free_list(mm, &mock_res->blocks);
> +	mutex_unlock(&manager->lock);
> +
> +	ttm_resource_fini(man, res);
> +	kfree(mock_res);
> +}
> +
> +static const struct ttm_resource_manager_func ttm_mock_manager_funcs = {
> +	.alloc = ttm_mock_manager_alloc,
> +	.free = ttm_mock_manager_free,
> +};
> +
> +int ttm_mock_manager_init(struct ttm_device *bdev, uint32_t mem_type, uint32_t size)
> +{
> +	struct ttm_mock_manager *manager;
> +	struct ttm_resource_manager *base;
> +	int err;
> +
> +	manager = kzalloc(sizeof(*manager), GFP_KERNEL);
> +	if (!manager)
> +		return -ENOMEM;
> +
> +	mutex_init(&manager->lock);
> +
> +	err = drm_buddy_init(&manager->mm, size, PAGE_SIZE);
> +
> +	if (err) {
> +		kfree(manager);
> +		return err;
> +	}
> +
> +	manager->default_page_size = PAGE_SIZE;
> +	base = &manager->man;
> +	base->func = &ttm_mock_manager_funcs;
> +	base->use_tt = true;
> +
> +	ttm_resource_manager_init(base, bdev, size);
> +	ttm_set_driver_manager(bdev, mem_type, base);
> +	ttm_resource_manager_set_used(base, true);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ttm_mock_manager_init);
> +
> +void ttm_mock_manager_fini(struct ttm_device *bdev, uint32_t mem_type)
> +{
> +	struct ttm_resource_manager *man;
> +	struct ttm_mock_manager *mock_man;
> +	int err;
> +
> +	man = ttm_manager_type(bdev, mem_type);
> +	mock_man = to_mock_mgr(man);
> +
> +	err = ttm_resource_manager_evict_all(bdev, man);
> +	if (err)
> +		return;
> +
> +	ttm_resource_manager_set_used(man, false);
> +
> +	mutex_lock(&mock_man->lock);
> +	drm_buddy_fini(&mock_man->mm);
> +	mutex_unlock(&mock_man->lock);
> +
> +	ttm_set_driver_manager(bdev, mem_type, NULL);
> +}
> +EXPORT_SYMBOL_GPL(ttm_mock_manager_fini);
> +
> +static int ttm_bad_manager_alloc(struct ttm_resource_manager *man,
> +				 struct ttm_buffer_object *bo,
> +				 const struct ttm_place *place,
> +				 struct ttm_resource **res)
> +{
> +	return -ENOSPC;
> +}
> +
> +static void ttm_bad_manager_free(struct ttm_resource_manager *man,
> +				 struct ttm_resource *res)
> +{
> +}
> +
> +static bool ttm_bad_manager_compatible(struct ttm_resource_manager *man,
> +				       struct ttm_resource *res,
> +				       const struct ttm_place *place,
> +				       size_t size)
> +{
> +	return true;
> +}
> +
> +static const struct ttm_resource_manager_func ttm_bad_manager_funcs = {
> +	.alloc = ttm_bad_manager_alloc,
> +	.free = ttm_bad_manager_free,
> +	.compatible = ttm_bad_manager_compatible
> +};
> +
> +int ttm_bad_manager_init(struct ttm_device *bdev, uint32_t mem_type,
> +			 uint32_t size)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	man = kzalloc(sizeof(*man), GFP_KERNEL);
> +	if (!man)
> +		return -ENOMEM;
> +
> +	man->func = &ttm_bad_manager_funcs;
> +
> +	ttm_resource_manager_init(man, bdev, size);
> +	ttm_set_driver_manager(bdev, mem_type, man);
> +	ttm_resource_manager_set_used(man, true);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ttm_bad_manager_init);
> +
> +void ttm_bad_manager_fini(struct ttm_device *bdev, uint32_t mem_type)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	man = ttm_manager_type(bdev, mem_type);
> +
> +	ttm_resource_manager_set_used(man, false);
> +	ttm_set_driver_manager(bdev, mem_type, NULL);
> +
> +	kfree(man);
> +}
> +EXPORT_SYMBOL_GPL(ttm_bad_manager_fini);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
> new file mode 100644
> index 000000000000..d2db9de9d876
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#ifndef TTM_MOCK_MANAGER_H
> +#define TTM_MOCK_MANAGER_H
> +
> +#include <drm/drm_buddy.h>
> +
> +struct ttm_mock_manager {
> +	struct ttm_resource_manager man;
> +	struct drm_buddy mm;
> +	uint64_t default_page_size;
> +	/* protects allocations of mock buffer objects */
> +	struct mutex lock;
> +};
> +
> +struct ttm_mock_resource {
> +	struct ttm_resource base;
> +	struct list_head blocks;
> +	unsigned long flags;
> +};
> +
> +int ttm_mock_manager_init(struct ttm_device *bdev, uint32_t mem_type,
> +			  uint32_t size);
> +int ttm_bad_manager_init(struct ttm_device *bdev, uint32_t mem_type,
> +			 uint32_t size);
> +void ttm_mock_manager_fini(struct ttm_device *bdev, uint32_t mem_type);
> +void ttm_bad_manager_fini(struct ttm_device *bdev, uint32_t mem_type);
> +
> +#endif // TTM_MOCK_MANAGER_H

