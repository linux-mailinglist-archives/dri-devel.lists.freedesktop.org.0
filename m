Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CC474230E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 11:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD0310E0D2;
	Thu, 29 Jun 2023 09:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F4210E0D2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 09:17:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FV1ADs4VDUxb0p+1sI6auFaT8a3/AuaQXfR1lijKSjJQBVxDPG5/SLRaf1oNoC2haNfUWe7p4zxpAtIdZDq+/pYVcYYdvAHGcesSV5jvT8S1SXpkylOfhOWNMnmTE5hFczwnGRMXqqKZUfDlBZE2aDfXUw05c2yug7yJXUVrSEFsmXb/12b/aVOlYsJgg1nolOlmT3usuhOQTuYP4jpP96PCZBev8d0MB6L8R6JIX4OJ/cQetPdQLL1jcyVmFYephLcYgXlcY+EAKT343LP5fQX5UHkga1DMjPHmuxnnodo1hArPdOKr2Zw6d/9lbsrV0W99ooQtP4Njb6n7RWMV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPCjfjBfzTpTbZybpYWFJk1XWSnr4dXDxR9WG9kqAuQ=;
 b=fTSkM+Qnq6USRxZ/9v6dNBg7MZwO7BDRUypQ0Kdegk1OHQe91Wj9q/gqV5TpbKEdRWKsYdDLwCC02zDdrGEgn14jMctiNmWmXr4XNN9x+SgXcbcC8iDZCF+CvygJo1qV5Y2J6xp1x17lcNpksbsWhpFgqfCPDbGXn/KkTeeMtMO9UFCPT8WGoHA5Zq9x7BY7i2T1qTJ9OW0KmKmeoivqWizoXOzvL31W2bwtKxf1hGgJZNAbxoosGuIoEsHXWK51Y9cgOHEDei1Qfi8mG4QNDif985URXZmR4itcOfXewKcPFRsHCuLNnqTk06cPIyh8ee6CzYRA6tGcs1HXu1orbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPCjfjBfzTpTbZybpYWFJk1XWSnr4dXDxR9WG9kqAuQ=;
 b=SoHY5oUar4XScDNsUd4fLIVKfMogS97+rUhMHjEZOzC6UWOyQOS+sAqH+LmJqvH4RB7ej/0lkj2wp1mufxVEjGbuu8IskPc0DEi814zjBt4jxQqaTVbuwptLrPo/xc9Zjt91c7O9tPQW2wqtSGlFSpq3mnwjafFcdW9F/y1kz7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 09:17:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 09:17:08 +0000
Message-ID: <a33ea1c3-cf7f-8e8f-0ece-4b2ef299f444@amd.com>
Date: Thu, 29 Jun 2023 11:17:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC v2 3/3] drm/ttm/tests: Add tests for ttm_pool
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1687779215.git.karolina.stolarek@intel.com>
 <c7c9cdc9f14a3f14efb6cede88a1007c550ffd68.1687779215.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <c7c9cdc9f14a3f14efb6cede88a1007c550ffd68.1687779215.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: 52bd936c-0cfe-49d9-cc6f-08db78819ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a5gOBQL0KlSaFY898AbAPskG6aTQfC3MP9Noawv4OSQ/XSxwcMkgfWGxCJ+D+nKEmvh6v49JkzohQaq2EO7M3fLCZjkeRtbTOfFpuI7JHWE9pYyQo81e09lnGIHH/4dRDNMh9y4jUeGOmYkGlL1BaWBsXGSWW1IdgBcPdIpaxoSQQLA6O3DOWeP/spD8LRB9Q2pPTGm6tzqYa11+Tbt67CvkTR9vCuuf0HKs5jSdAM45ambd89gHlxV+eUK0FT2TfiNlJ/H2c0CZTWcksykR5qCUas2ZusdiVdEqT26LioDvoxaeUcHlEUlER32PS6TVIGsUHDYMnliR3JvSqU25hPISfTmpoSQ8eeC6ZTxADHuVOkIU3m9s5VL2Hn6gjetHRGVlmFMlUbF8cPpwmvQ2OkVuhnaVW6Jm0/BYwYU+iM6OAmOAwEw6IOseBC+LFA6GVK2oYHGsAmwbquqBRQZ/L73fMqzEPSrHQrv82LVGvEVfotGYcMZyX/RA8uxFxBEYgijZrk1MN916rH9ranQBeiJ/NDEYQsL3BCgfyTdWnuJhIhUheRNCm2gl+cxY7t61gqWIcAGzie6HVPH5BgyUBQ72awoTyH+Mr31dsq2/PCIttkaj0c1iICFejIMkZuWsw9bBhsX++ZiQNyGAQE1MLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199021)(31686004)(186003)(2906002)(66476007)(30864003)(5660300002)(6666004)(31696002)(36756003)(316002)(86362001)(54906003)(6486002)(478600001)(8676002)(4326008)(2616005)(38100700002)(66946007)(41300700001)(66556008)(8936002)(83380400001)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnRVSXRBZzFsS0QrZm4wQ2FiUXhQR1NDUlpoWG14YzZEMGRPTzdvTGs5SGd6?=
 =?utf-8?B?TjF0MGJIMjByaE9vOE9hUUV3UlhQNjEzeEp1aFdBeFB4dXowdUFvQzVBeHdY?=
 =?utf-8?B?RmM5eHlCcUdRVzFHVU5ocmRMQ2xralVpck1zZ0M0SEQrTGJ1SzZDdVNzbzR2?=
 =?utf-8?B?L3dDTWFzS2w3WE9hWkhQSDFBRFlocWlsU0VybTQ5MHFBeVdIU2YwM21jMzVC?=
 =?utf-8?B?VGJaMWtpU3o4SnlIMlNpTjVSdS9jMjI1TW9LTEdCdUtaWXArQkNUZ3A1MDJO?=
 =?utf-8?B?RzdTVnNWMGdqaUw1TU9TUXZ4dkxFUnpUUEFCZEpmaGkxdEljOU4zWDQzeHIw?=
 =?utf-8?B?UE8rUTVyYkNxcVdVTVRkK1FPT29ZeTVuK3hPVUVqendJdlJkdVhqbzMwUnJn?=
 =?utf-8?B?QXYwbVlrd08zU1h2M1VqTGxtc3c0KzZabk1IcHM0RzA0dkFieTBtVU9PTTJO?=
 =?utf-8?B?TE1sazY0MVJLOUlvRHdhMTkwek92RWZETVpOREd5R1p4Y2lzOW92SnNaZDF3?=
 =?utf-8?B?bHZOam9oakxnY2tiVzFVQ3pUc09jQ2RMUlF1Ym9adnBLK3JFSS90dnBKTER3?=
 =?utf-8?B?Uis4ZTJaWklyYStlY216UVhub05KR1ZhOS9uYmcwSDBqTFBocUdPaVExb0Zi?=
 =?utf-8?B?dFRKQTVENzRrM0xnUmx0cXZ2N09BakRzUTNiSUUvUHNyZ1p0YkJjUDRNSUNM?=
 =?utf-8?B?aWZyaWsxbjBwTHdBVWlsNno1TTBmdjBua0J2SXpwVjhOeWhsOC9MZFk2SkFD?=
 =?utf-8?B?VktIUmdyRi9pQXc4WG9GdzB4U1pDYy8yOWJNSDRKMXg2NlRCRmFRMUNwY0o1?=
 =?utf-8?B?UGtNRjVkcmdMVnpYdWZTMlNwSXVRS3o2Zkp4SEVOM3VLbE55NFRRemJmVGxT?=
 =?utf-8?B?ekdiV01PNlF4bnFqdGNNcUY0NEl6RzF3RDZ4S1N5MDBkSHhpUnliNkdxYlli?=
 =?utf-8?B?RDhsSFFxOTZmM2JGclhuc280aTViNXZVdk5KaEUrU2JqV3N4cVJneVlQR1c2?=
 =?utf-8?B?bDJia1FIWkx0bE8rZ1ZWcE1rTjFVWERVcTRDTWRDWnk0dzB6M3l5VVQ0RFpB?=
 =?utf-8?B?SWlCem5FZUw2RVZQKzgxWTJDVnludjU4YlgwUXE5Q0psNEpsQithZ3hxaDN6?=
 =?utf-8?B?RlUvRE1rUFpGWlhWODhydmxCekovcC92dWd3NFhCdFdUYnBpUzdoMXMwUU9J?=
 =?utf-8?B?UkJyaytuOEtacy8wM0NHdXloUlFmWDFERnE5RWRpSUhnMC9JWWRsSlUzek1G?=
 =?utf-8?B?WTEyZ2NTeGFBSXg1T2RrNVVGcFQ2TEJyOXlxR0xNUGZIVmlSMWxJL0FLMytw?=
 =?utf-8?B?VkdqQXAxNkZBT2VWSDV1ZERwekFUVmh2dkpvRVpydnQvR3hndEFuTEhZd0tw?=
 =?utf-8?B?M2tjVUtKWXBVR2VBRm5uRkpoWUhpbTNNVExrZFBTSGhCSnNYT2JuOE1BclRH?=
 =?utf-8?B?QUxJY3IrcE1LOEtYWVpsRERpaHlzL0ZSS1NSZDlOQUQrNkJyQm12OHNYdnpR?=
 =?utf-8?B?eFZJSVBDaHJIZ2Q2eHlmRkpMU3VxVVpYSmgzRTExakRJUzNnU1U5akNYOG5p?=
 =?utf-8?B?Q0Q4ZjdqaVVuTVA1cDZnOVF5WThTSW52R3A3bGJNaDJpWE5rcDB1eDhTMlpq?=
 =?utf-8?B?aW5OZmVrbldXcGF0aWZTaFI5SGxVL3hhTEtuUUxmMmJqUG5RbU1SVVhxVGh1?=
 =?utf-8?B?MVhTOCtveTd3WEYwL25nNDlhYnpjZVFQeXRFaDVJbXlnMU9nbTFYT1dWbzQ2?=
 =?utf-8?B?Qk5iRTRWWFJRM01MQ0pWRXFQTzVZQmlPQWVmdUo4cGlEVTZveStmbTg5Vk5a?=
 =?utf-8?B?S3kzS0JjRGVKNGpqdno5V2l2WDBIeUNYVDE3aDREVG1yR1BrNk94R0thMVFp?=
 =?utf-8?B?M1llNjJSM0V4Uy9JbytVMmlpWkZGdGdOUkFSRlkrWkxJT3RGQVVaVlhiQ2w5?=
 =?utf-8?B?eGl5WFpTVVkzalhYckxrSDVLZEs3Mk41UW1hUzJQTE5FVjJLcGNHdS85T3dP?=
 =?utf-8?B?d21NTTlCOU5OTG9JS0lTdFJ0VGFwRVdmQ3M2TkdkejRtMW9ZZ3JoWjZKekFM?=
 =?utf-8?B?QmdGay9DODh0RHI1V2FITzU4YlFseW1Hd0dLMG9XK1h1QjdsWDRMcEZOZS9K?=
 =?utf-8?B?WjljbVhQYkVSVDhrRkhpaTFaWlc5TlBDNmVuZ05iWmc3QlpaWjBhU3djQUJq?=
 =?utf-8?Q?BEODEnPgoGDPpNYFVALMV1GCWjLC8OHTvkJbQZnZRWcG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bd936c-0cfe-49d9-cc6f-08db78819ccd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 09:17:08.1880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cs9aDYOYkkanvUPCJFb8Q27ntWKFzydG1nvlOk2fofvq9hcdO9avjuTtRQ4kMcvw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6440
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
> Add KUnit tests that exercise page allocation using page pools
> and freeing pages, either by returning them to the pool or
> freeing them. Add a basic test for ttm_pool cleanup. Introduce
> helpers to create a dummy ttm_buffer_object.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  29 ++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   5 +
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 406 ++++++++++++++++++
>   4 files changed, 441 insertions(+)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> index 7917805f37af..ec87c4fc1ad5 100644
> --- a/drivers/gpu/drm/ttm/tests/Makefile
> +++ b/drivers/gpu/drm/ttm/tests/Makefile
> @@ -2,4 +2,5 @@
>   
>   obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>           ttm_device_test.o \
> +        ttm_pool_test.o \
>           ttm_kunit_helpers.o
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index d03db0405484..6ccd3e858397 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -26,6 +26,35 @@ int ttm_kunit_helper_alloc_device(struct kunit *test,
>   }
>   EXPORT_SYMBOL_GPL(ttm_kunit_helper_alloc_device);
>   
> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit *test,
> +						       size_t size)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct drm_gem_object *gem_obj;
> +	struct ttm_buffer_object *bo;
> +
> +	gem_obj = kunit_kzalloc(test, sizeof(*gem_obj), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, gem_obj);
> +
> +	drm_gem_private_object_init(priv->drm, gem_obj, size);
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	bo->sg = NULL;
> +	bo->base = *gem_obj;

Hui? Why that hack? That is clearly leaking the gem object.

Apart from that looks really good to me,
Christian.

> +
> +	return bo;
> +}
> +EXPORT_SYMBOL_GPL(ttm_kunit_helper_ttm_bo_init);
> +
> +void ttm_kunit_helper_ttm_bo_fini(struct ttm_buffer_object *bo)
> +{
> +	drm_gem_object_release(&bo->base);
> +	ttm_bo_put(bo);
> +}
> +EXPORT_SYMBOL_GPL(ttm_kunit_helper_ttm_bo_fini);
> +
>   int ttm_test_devices_init(struct kunit *test)
>   {
>   	struct ttm_test_devices_priv *priv;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index 69fb03b9c4d2..abb8279f18c7 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -7,6 +7,7 @@
>   
>   #include <drm/drm_drv.h>
>   #include <drm/ttm/ttm_device.h>
> +#include <drm/ttm/ttm_bo.h>
>   
>   #include <drm/drm_kunit_helpers.h>
>   #include <kunit/test.h>
> @@ -23,6 +24,10 @@ int ttm_kunit_helper_alloc_device(struct kunit *test,
>   				  bool use_dma_alloc,
>   				  bool use_dma32);
>   
> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit *test,
> +						       size_t size);
> +void ttm_kunit_helper_ttm_bo_fini(struct ttm_buffer_object *bo);
> +
>   int ttm_test_devices_init(struct kunit *test);
>   void ttm_test_devices_fini(struct kunit *test);
>   
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> new file mode 100644
> index 000000000000..0bc6415c3067
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> @@ -0,0 +1,406 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <linux/mm.h>
> +
> +#include <drm/ttm/ttm_tt.h>
> +#include <drm/ttm/ttm_pool.h>
> +
> +#include "ttm_kunit_helpers.h"
> +
> +struct ttm_pool_test_case {
> +	const char *description;
> +	unsigned int order;
> +	bool use_dma_alloc;
> +};
> +
> +static struct ttm_operation_ctx simple_ctx = {
> +	.interruptible = true,
> +	.no_wait_gpu = false,
> +};
> +
> +static struct ttm_tt *mock_ttm_tt_init(struct kunit *test,
> +				       uint32_t page_flags,
> +				       enum ttm_caching caching,
> +				       size_t size)
> +{
> +	struct ttm_tt *tt;
> +	struct ttm_buffer_object *bo;
> +	int err;
> +
> +	bo = ttm_kunit_helper_ttm_bo_init(test, size);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	err = ttm_tt_init(tt, bo, page_flags, caching, 0);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	/* We don't need this BO later, release it */
> +	ttm_kunit_helper_ttm_bo_fini(bo);
> +
> +	return tt;
> +}
> +
> +static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
> +					       size_t size,
> +					       enum ttm_caching caching)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct ttm_pool *pool;
> +	struct ttm_tt *tt;
> +	int err;
> +	unsigned long order = __fls(size / PAGE_SIZE);
> +
> +	tt = mock_ttm_tt_init(test, order, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	return pool;
> +}
> +
> +static const struct ttm_pool_test_case ttm_pool_basic_cases[] = {
> +	{
> +		.description = "One page",
> +		.order = 0,
> +	},
> +	{
> +		.description = "More than one page",
> +		.order = 2,
> +	},
> +	{
> +		.description = "Above the allocation limit",
> +		.order = MAX_ORDER + 1,
> +	},
> +	{
> +		.description = "One page, with coherent DMA mappings enabled",
> +		.order = 0,
> +		.use_dma_alloc = true,
> +	},
> +	{
> +		.description = "Above the allocation limit, with coherent DMA mappings enabled",
> +		.order = MAX_ORDER + 1,
> +		.use_dma_alloc = true,
> +	},
> +};
> +
> +static void ttm_pool_alloc_case_desc(const struct ttm_pool_test_case *t,
> +				     char *desc)
> +{
> +	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(ttm_pool_alloc_basic, ttm_pool_basic_cases,
> +		  ttm_pool_alloc_case_desc);
> +
> +static void ttm_pool_alloc_basic(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	const struct ttm_pool_test_case *params = test->param_value;
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct page *fst_page, *last_page;
> +	int err;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int expected_num_pages = 1 << params->order;
> +	size_t size = expected_num_pages * PAGE_SIZE;
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, params->use_dma_alloc,
> +		      false);
> +
> +	KUNIT_ASSERT_PTR_EQ(test, pool->dev, priv->dev);
> +	KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
> +	KUNIT_ASSERT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
> +
> +	fst_page = tt->pages[0];
> +	last_page = tt->pages[tt->num_pages - 1];
> +
> +	if (params->order <= MAX_ORDER) {
> +		if (params->use_dma_alloc) {
> +			KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
> +			KUNIT_ASSERT_NOT_NULL(test, (void *)last_page->private);
> +		} else {
> +			KUNIT_ASSERT_EQ(test, fst_page->private, params->order);
> +		}
> +	} else {
> +		if (params->use_dma_alloc) {
> +			KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
> +			KUNIT_ASSERT_NULL(test, (void *)last_page->private);
> +		} else {
> +			/*
> +			 * We expect to alloc one big block, followed by
> +			 * order 0 blocks
> +			 */
> +			KUNIT_ASSERT_EQ(test, fst_page->private,
> +					min_t(unsigned int, MAX_ORDER,
> +					      params->order));
> +			KUNIT_ASSERT_EQ(test, last_page->private, 0);
> +		}
> +	}
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	const struct ttm_pool_test_case *params = test->param_value;
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_buffer_object *bo;
> +	dma_addr_t dma1, dma2;
> +	int err;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int expected_num_pages = 1 << params->order;
> +	size_t size = expected_num_pages * PAGE_SIZE;
> +
> +	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	bo = ttm_kunit_helper_ttm_bo_init(test, size);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	err = ttm_sg_tt_init(tt, bo, 0, caching);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
> +
> +	dma1 = tt->dma_address[0];
> +	dma2 = tt->dma_address[tt->num_pages - 1];
> +
> +	KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
> +	KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_alloc_order_caching_match(struct kunit *test)
> +{
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 0;
> +	size_t size = PAGE_SIZE;
> +	int err;
> +
> +	pool = ttm_pool_pre_populated(test, size, caching);
> +
> +	pt = &pool->caching[caching].orders[order];
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_alloc_caching_mismatch(struct kunit *test)
> +{
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt_pool, *pt_tt;
> +	int err;
> +	enum ttm_caching tt_caching = ttm_uncached;
> +	enum ttm_caching pool_caching = ttm_cached;
> +	size_t size = PAGE_SIZE;
> +	unsigned int order = 0;
> +
> +	pool = ttm_pool_pre_populated(test, size, pool_caching);
> +
> +	pt_pool = &pool->caching[pool_caching].orders[order];
> +	pt_tt = &pool->caching[tt_caching].orders[order];
> +
> +	tt = mock_ttm_tt_init(test, 0, tt_caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
> +
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_alloc_order_mismatch(struct kunit *test)
> +{
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt_pool, *pt_tt;
> +	int err;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 2;
> +	size_t fst_size = (1 << order) * PAGE_SIZE;
> +	size_t snd_size = PAGE_SIZE;
> +
> +	pool = ttm_pool_pre_populated(test, fst_size, caching);
> +
> +	pt_pool = &pool->caching[caching].orders[order];
> +	pt_tt = &pool->caching[caching].orders[0];
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, snd_size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
> +
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_free_dma_alloc(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 2;
> +	size_t size = (1 << order) * PAGE_SIZE;
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
> +	ttm_pool_alloc(pool, tt, &simple_ctx);
> +
> +	pt = &pool->caching[caching].orders[order];
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
> +
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_free_no_dma_alloc(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 2;
> +	size_t size = (1 << order) * PAGE_SIZE;
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, false, false);
> +	ttm_pool_alloc(pool, tt, &simple_ctx);
> +
> +	pt = &pool->caching[caching].orders[order];
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
> +
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_fini_basic(struct kunit *test)
> +{
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 0;
> +	size_t size = PAGE_SIZE;
> +
> +	pool = ttm_pool_pre_populated(test, size, caching);
> +	pt = &pool->caching[caching].orders[order];
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
> +
> +	ttm_pool_fini(pool);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
> +}
> +
> +static struct kunit_case ttm_pool_test_cases[] = {
> +	KUNIT_CASE_PARAM(ttm_pool_alloc_basic, ttm_pool_alloc_basic_gen_params),
> +	KUNIT_CASE_PARAM(ttm_pool_alloc_basic_dma_addr,
> +			 ttm_pool_alloc_basic_gen_params),
> +	KUNIT_CASE(ttm_pool_alloc_order_caching_match),
> +	KUNIT_CASE(ttm_pool_alloc_caching_mismatch),
> +	KUNIT_CASE(ttm_pool_alloc_order_mismatch),
> +	KUNIT_CASE(ttm_pool_free_dma_alloc),
> +	KUNIT_CASE(ttm_pool_free_no_dma_alloc),
> +	KUNIT_CASE(ttm_pool_fini_basic),
> +	{}
> +};
> +
> +static struct kunit_suite ttm_pool_test_suite = {
> +	.name = "ttm_pool",
> +	.init = ttm_test_devices_init,
> +	.exit = ttm_test_devices_fini,
> +	.test_cases = ttm_pool_test_cases,
> +};
> +
> +kunit_test_suites(&ttm_pool_test_suite);
> +
> +MODULE_LICENSE("GPL");

