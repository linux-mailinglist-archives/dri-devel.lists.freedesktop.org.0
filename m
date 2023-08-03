Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C476E50D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 11:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F4F10E004;
	Thu,  3 Aug 2023 09:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD8D10E004
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 09:55:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npxxyoTEWSMjmrkXR6lc1SUy9PBg4Fl1aUdPxiBJbRAdv0PlcBAo2J185I6kLXhQ7I1kHjaPGB5akX88jtkgBL9ncq90xcOFhfS3hmxTqf1Ms0uoOOSOnPlnMeOI4cAb0Ghj35BnIp4WgvrWtV1AdChbtCNdkxJ5FhCrDD6k84F9KNZrx8Jcku+e2M/j6SnUEPjqwxI2Hw4193peKsLYp/+UAxWnv/zx2Z7O+bfQpYv3SUbn3CExGCcDo55N9vrpXRMgOM1eHXLMgK+hIieypH9mdJvYBo+yKDwWfqnI+B8Im53xdH8kXGf3SbOUhga2qbT+yAMiJTQbMkaR7OoDig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jua6Ag427HFNbecqnaWX/PDYWA8qGzxm75nOJmMkJCY=;
 b=YOWyh8iTe4g9xHlFF7mRRj7/VdOfByo1pnRdHrBjs1r5bcVUnGn8RcvD6YOXV5r/2PBU8P6514f7zgZyg05UvDWSDTP7FexSF2ARUnNzUVY40VVCujBSvYp4uhG/HoFWSuMZRQIlS1FqaZiL0cWF83FuvKGXUGBDKCLd7V0cLqLcg52qDlzLEGG9uNayDUz9bM7X8SdNXDpaxv5Yu++bMZNPSOT1spWECTvaEVNv/wWBXSkZTwbIDamwwFfNRCeEXjxVI+kHNzBmdRIzAc65EXzK1QTIOXIQumM/1GoBlVmzlooqHWsKH/t9HmM9AzIEDHUMVU04J1STEHlmsuPQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jua6Ag427HFNbecqnaWX/PDYWA8qGzxm75nOJmMkJCY=;
 b=0KBqlFRoKmXYtRx5kp5/cuZivPPXVlVGOTRtAmmZSeSOj92CfNgAAMTz3Ur+h1peXXndxc4V6tMslib2knOqmggOJUJLl6+K9/udHQc/HKauVF78ERdDx/aYrmTiRrPFkQa4BZ/ZTjU1wVRSIbvdL0KSLhIzO6rI2i43VpVBPKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB9086.namprd12.prod.outlook.com (2603:10b6:a03:55f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 09:55:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 09:55:18 +0000
Message-ID: <26fd75a2-3c45-7e2d-3d7a-1a5d68022ba6@amd.com>
Date: Thu, 3 Aug 2023 11:55:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/tests: Alloc drm_device on drm_exec tests
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230728183400.306193-1-arthurgrillo@riseup.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230728183400.306193-1-arthurgrillo@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: 09211e45-cda7-44ec-9b5b-08db9407be8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uJ+VxYVC+M93smzIPe/6CY6ycKAoOqmv/Bj4PCmsGf/RXL+A5z5EpnD7bD29uX3e9lZVIsWpdv+qcQJW6+EpzGQIyFA5amum53fLT9Yb5Cc5jq+LQ+XM+6kX0GjvbJmLC9NM7XZQHQW9WvkwT9m7aPHyLnEttvIkt02KASFav2VDJV1/Ku6VcARU1QpiVle4SyiO9xfxljGpsP9fASWcxBPWCAhiZBWr9FGz96JyjeGk9TYqYd+stC6HOeeQL3Su6AIm1fCiSLrG5bUGJvTnEN5Z3NyKDg7yCM+8FICS//Y2kn3ZItBNACWQD2kuyPQh9iJDSbTxN0egUPoj9O5uCuANfzkXCmRIfNZ9QW2e7j1NqHMEY0Sjnx43mctLLG83e5BfVsHezqBLXKzrRFPhqXibq8Z0+O9bcnRpYI4woh7uAKl9rQ8InbFKmrHW55Guxhm8JgGITp8QIBhw4QS+s1SpkjxYx7XSeMO5UkUA3L2OTbCBmxHxjqjGDgYap3DiRLalvmeGeBnpOw6YihLg+8RBBWQqQ13KZm/Vkuj8wdnIKV0YyvY93t9oXfwlfJuz1kZOOx9RzyYFhKEVboA2CmmKfENg3kN40fUqvFGfk1mn/KxxrRmZE1U/+v/RZaV37qhHdQwRXqtKKPrE2bQICA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199021)(6486002)(6666004)(6512007)(966005)(38100700002)(66946007)(66556008)(66476007)(4326008)(316002)(5660300002)(41300700001)(478600001)(83380400001)(186003)(6506007)(2616005)(66574015)(2906002)(36756003)(8936002)(8676002)(7416002)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmwzVmYxN0l2UWQ0Wk1FVVZSVm1lQWZ5Y2RaYVBxZXVqQW5Wdjh1R2NJeDN3?=
 =?utf-8?B?TTh0dmlrcTBHckZ2V041TUdwdVkwSFBJd3RKRWlHVE1ETEtzMFlySTg1bEtK?=
 =?utf-8?B?OFB5K3RQSitCSm5Va2tnay9rU0NYc24rVXo2cHM2bXJ5U0VBRW5IQ250L1da?=
 =?utf-8?B?blZZYjZ2OW8zVkZCUjdvNXNET0gwVGoyMzZLRFJrNEV5Z09DRWVOa0RKd1Bv?=
 =?utf-8?B?K1JNT0ljM2RzVFN6cnkrWHlBRzRQdnVDUUtaS1ZpcE4wU2oxT1praDhKb0JM?=
 =?utf-8?B?dVdtb3lJcDR2Smh1K1BhZ2VBM3dTOFZZdk5oQnluNldUK0FPWU1YQXJwckh0?=
 =?utf-8?B?eEdLT1FtQnFYcVArdzVKRk16cnFqOXRPSmVKNlJBSEJYcXpINUlRSFF0M0hX?=
 =?utf-8?B?R25tdUdMUGZlcWpEV2U1ZDd1enExMUloQnJEeTFTbGg1ZmMwNFBCa1FweU1z?=
 =?utf-8?B?RlNtT1pnRnl6RWJHUzY1NWhCZGN0eGMrZEJMTGZ5T1lhRktPc3lWMjB2SXVm?=
 =?utf-8?B?emlsR1lEaSsrU243NWJ2eEMydklwL2FyY2YwRE8rTTR2aGlqbFhqYzBvbVpu?=
 =?utf-8?B?RER3SitKRm1BQTRFU1phOXozWWxPcyttUU1iN3dlM3NsNU92d1ZsMGh4Nzd5?=
 =?utf-8?B?S3MrSlpRQ1hDQUVHWlRyem0rdjZHNVVCbENVUTRiUXgxc0V4OWxqNGhubEY4?=
 =?utf-8?B?Q0xVK1pXMUQwRVUvNU9ia3VENUgvK0RNa0Z5TzQ5ekx4cW9yMUc3eXA2bEZ0?=
 =?utf-8?B?MGpxMXZseGlJNk5sN2dpNS9nYW1VNFdjLzFHbVlITldqQm9ZazZ6S3lTdTd2?=
 =?utf-8?B?ajFsTDRJMElQS1YxM3QyRHdybW1DbUVTYnFkTXZ4TS9JSTZ6bjMxaDlQWWQ3?=
 =?utf-8?B?Rlh1Z2xEWTFQMlBMNXN6elh4UmR1bmNpUktoNFZmdUJoOFFIMmlHNVJML2w3?=
 =?utf-8?B?L3NKQ09icTU4OXpHcVR2ejRoeUdzYlBia1RsV0JWaWZnWUNRL2RkdElZR1Vo?=
 =?utf-8?B?Ti9HNmNYMXhJSXQ5TmRjbStDNVI5VVFIMEpPTUt0Ri9IZUJ1UEF4eFJNUU84?=
 =?utf-8?B?V1owdHNDVU1qeXJMK1g2SU9GWUZSei84c1cxUFNNYzQ5TGRBY0R5bnpZd0oy?=
 =?utf-8?B?anpsbGdVTHg1OUhjRmNuaFE0bUE0UEJER0ErTVV1SjV5RzBQOGFyRGpjMzlk?=
 =?utf-8?B?TzVXSDNqSUhqT1AwNytBcEhZb0F3K2FkRU1ydHVUVzdiQzVVbHVEcWRDb2RY?=
 =?utf-8?B?MExvL2kwemo4aG9zM1dlRk1RVEtObmoxd2N1U3l3K0NENS9BQlNhVXN5TEpl?=
 =?utf-8?B?c1JWcmRzMHRDUlJSMGp5ZGtpZ0doc2QxQlB6Y0p4enZ3aG1OcEpEWlpRZ2dK?=
 =?utf-8?B?RzZMVXNOZXhOYkh5ZU93UXlwY2Q2T2c4WU5KLy9ldzhIWnBuU25JVmxTMFAz?=
 =?utf-8?B?ODVxMkNqeWtEbTVneHh0WHg5QkZuQUZUN0hKQmRSTll3dzA1V21KODV3all2?=
 =?utf-8?B?ak1OR0tJYXJSQjFzb0JWUEpjM01vZHBpcnloalg3cWN1VWtOaWdVUHVweHFN?=
 =?utf-8?B?Mnl4U2lsUEhpb1JRUmxFTTJRU0dzMlQ1cTVVY0RFOU9SZEpxWkp0ajNkR21J?=
 =?utf-8?B?WUJoL1lFY0hQbnJMQUxuYmtKVGZIT1h6dW1QQlMxcDBvYmdsN3FBZWF4OWFu?=
 =?utf-8?B?TkJobTNXUlZNRHYyRGpLOWMxV2w5WlFBeDR2WEg0aForcTJTK1F3MFdDNU1E?=
 =?utf-8?B?elRvQzVaZlROaVBTRzNmOXhFRlBKNzBOK2I4R0F3ODFqK0E2QmlxT0pkUk52?=
 =?utf-8?B?NXcrdmpNdGlNMVNDUWRiamxDOVJOK1hBMEpCWGtWNUFQUTAySVp0YWhqblU0?=
 =?utf-8?B?ZUhZUmxOdml1RUxMeGgvVUE1aStiMUZLeU5uZCtjbGY2Zml4MVZXbE9ZQ1Rw?=
 =?utf-8?B?bS8zaDV2b1R0SnNJR0Qxc0NJMW9KQ0QzVjRRU1VYUXMxdVg3OFU1eXZmR3hl?=
 =?utf-8?B?bmMrMVJTQ0U3eGVXWndReE1nb2NnV1ZZZVQzOC8wYVpyM3BiVG96T0xJUFhw?=
 =?utf-8?B?YmhEV0NrRFZZSElxU3MrdzNlZ1FsVjNXeHJTMmhHR2JHQUQ3aExjeTFSVGU1?=
 =?utf-8?B?dUpMcVNYdTg3ekVHNVZkdXRnaUJsWkxORGhkcTJIZ1kxK2hnRWhweXE2eWRw?=
 =?utf-8?Q?kK7+fw7lPEvWESZ6YyJn/w4BhlvbqLR/Jmi7xWvFztL7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09211e45-cda7-44ec-9b5b-08db9407be8c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 09:55:18.8135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mP8H98f+NGcYKx7s7zINjw9xXUqlsSf9iFHxcjrQOmCsiNfRPzy14Yb38TdHvjO2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9086
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 tales.aparecida@gmail.com, =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 mairacanal@riseup.net, boris.brezillon@collabora.com, dakr@redhat.com,
 alexander.deucher@amd.com, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.07.23 um 20:34 schrieb Arthur Grillo:
> The drm_exec tests where crashing[0] because of a null dereference. This
> is caused by a new access of the `driver` attribute of `struct
> drm_driver` on drm_gem_private_object_init(). Alloc the drm_device to
> fix that.
>
> [0]
> [15:05:24] ================== drm_exec (6 subtests) ===================
> [15:05:24] [PASSED] sanitycheck
> ^CERROR:root:Build interruption occurred. Cleaning console.
> [15:05:50] [ERROR] Test: drm_exec: missing expected subtest!
> [15:05:50] BUG: kernel NULL pointer dereference, address: 00000000000000b0
> [15:05:50] #PF: supervisor read access in kernel mode
> [15:05:50] #PF: error_code(0x0000) - not-present page
> [15:05:50] PGD 0 P4D 0
> [15:05:50] Oops: 0000 [#1] PREEMPT NOPTI
> [15:05:50] CPU: 0 PID: 23 Comm: kunit_try_catch Tainted: G                 N 6.4.0-rc7-02032-ge6303f323b1a #69
> [15:05:50] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-1.fc37 04/01/2014
> [15:05:50] RIP: 0010:drm_gem_private_object_init+0x60/0xc0
>
> Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Tested-by: Danilo Krummrich <dakr@redhat.com>
> Acked-by: Danilo Krummrich <dakr@redhat.com>
> Reviewed-by: Maíra Canal <mcanal@igalia.com>

Sorry that I didn't replied earlier, just back from vacation.

Since the patch already made it into drm-misc-next it's to late for my 
rb, but just wanted to say thanks for looking into this.

Christian.

> ---
> v1->v2: https://lore.kernel.org/all/20230727192259.237935-1-arthurgrillo@riseup.net/
> 	- s/test_init/drm_exec_test_init/ (Maíra)
> 	- s/test_exit/drm_exec_test_exit/ (Maíra)
> 	- Use test->priv intead of global variables (Maíra and Maxime)
>
> ---
>   drivers/gpu/drm/tests/drm_exec_test.c | 52 +++++++++++++++++++++++----
>   1 file changed, 45 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
> index 727ac267682e..f02a93601203 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -12,11 +12,42 @@
>   
>   #include <drm/drm_exec.h>
>   #include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>   #include <drm/drm_gem.h>
> +#include <drm/drm_kunit_helpers.h>
>   
>   #include "../lib/drm_random.h"
>   
> -static struct drm_device dev;
> +struct drm_exec_priv {
> +	struct device *dev;
> +	struct drm_device *drm;
> +};
> +
> +static int drm_exec_test_init(struct kunit *test)
> +{
> +	struct drm_exec_priv *priv;
> +
> +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
> +
> +	test->priv = priv;
> +
> +	priv->dev = drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
> +
> +	priv->drm = __drm_kunit_helper_alloc_drm_device(test, priv->dev, sizeof(*priv->drm), 0,
> +							DRIVER_MODESET);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
> +
> +	return 0;
> +}
> +
> +static void drm_exec_test_exit(struct kunit *test)
> +{
> +	struct drm_exec_priv *priv = test->priv;
> +
> +	drm_kunit_helper_free_device(test, priv->dev);
> +}
>   
>   static void sanitycheck(struct kunit *test)
>   {
> @@ -29,11 +60,12 @@ static void sanitycheck(struct kunit *test)
>   
>   static void test_lock(struct kunit *test)
>   {
> +	struct drm_exec_priv *priv = test->priv;
>   	struct drm_gem_object gobj = { };
>   	struct drm_exec exec;
>   	int ret;
>   
> -	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
> +	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
>   
>   	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>   	drm_exec_until_all_locked(&exec) {
> @@ -48,11 +80,12 @@ static void test_lock(struct kunit *test)
>   
>   static void test_lock_unlock(struct kunit *test)
>   {
> +	struct drm_exec_priv *priv = test->priv;
>   	struct drm_gem_object gobj = { };
>   	struct drm_exec exec;
>   	int ret;
>   
> -	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
> +	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
>   
>   	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>   	drm_exec_until_all_locked(&exec) {
> @@ -74,11 +107,12 @@ static void test_lock_unlock(struct kunit *test)
>   
>   static void test_duplicates(struct kunit *test)
>   {
> +	struct drm_exec_priv *priv = test->priv;
>   	struct drm_gem_object gobj = { };
>   	struct drm_exec exec;
>   	int ret;
>   
> -	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
> +	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
>   
>   	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES);
>   	drm_exec_until_all_locked(&exec) {
> @@ -102,11 +136,12 @@ static void test_duplicates(struct kunit *test)
>   
>   static void test_prepare(struct kunit *test)
>   {
> +	struct drm_exec_priv *priv = test->priv;
>   	struct drm_gem_object gobj = { };
>   	struct drm_exec exec;
>   	int ret;
>   
> -	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
> +	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
>   
>   	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>   	drm_exec_until_all_locked(&exec) {
> @@ -121,14 +156,15 @@ static void test_prepare(struct kunit *test)
>   
>   static void test_prepare_array(struct kunit *test)
>   {
> +	struct drm_exec_priv *priv = test->priv;
>   	struct drm_gem_object gobj1 = { };
>   	struct drm_gem_object gobj2 = { };
>   	struct drm_gem_object *array[] = { &gobj1, &gobj2 };
>   	struct drm_exec exec;
>   	int ret;
>   
> -	drm_gem_private_object_init(&dev, &gobj1, PAGE_SIZE);
> -	drm_gem_private_object_init(&dev, &gobj2, PAGE_SIZE);
> +	drm_gem_private_object_init(priv->drm, &gobj1, PAGE_SIZE);
> +	drm_gem_private_object_init(priv->drm, &gobj2, PAGE_SIZE);
>   
>   	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>   	drm_exec_until_all_locked(&exec)
> @@ -150,6 +186,8 @@ static struct kunit_case drm_exec_tests[] = {
>   
>   static struct kunit_suite drm_exec_test_suite = {
>   	.name = "drm_exec",
> +	.init = drm_exec_test_init,
> +	.exit = drm_exec_test_exit,
>   	.test_cases = drm_exec_tests,
>   };
>   

