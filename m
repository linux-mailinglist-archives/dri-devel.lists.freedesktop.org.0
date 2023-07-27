Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81E765FDF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F7410E629;
	Thu, 27 Jul 2023 22:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE89A10E629
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 22:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690498021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFaVO9FOTBPy8xJH3jfKPZUyKKxhN9b3pML4LzjHilo=;
 b=hHOBIV6E0nCn7TGgQz+Kt9Fu6M/mMW2d8Kzu3suyEzCvK/Hn1LeSV2x53TwRXRwKIoaVv/
 r+oVPCVKwYKAjeoJUIjTsPkHG8XF9i7RTyopYEhHkDmT6FbiLBAsqP4T3jUr9hrvOrszae
 g97aF3++PfUVGZLu+IDELlR5i7W9nW0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-liu7EidGPWuyAqF18YsJLA-1; Thu, 27 Jul 2023 18:46:59 -0400
X-MC-Unique: liu7EidGPWuyAqF18YsJLA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5227fb36095so857569a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690498018; x=1691102818;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DFaVO9FOTBPy8xJH3jfKPZUyKKxhN9b3pML4LzjHilo=;
 b=G0vL++e/uLmVUlZiKfNvRf4CVz5NsBxeLdxcPZaZ3/C02Qvbsnxb+dkh/ytgKvzdtH
 D/0V0dRekxn4NN8kIyeKLlxmF94HO/CuRbWwgQ9+oqwIps00aYYpoeIwN9f/1m/mth//
 NPPtUylZnJMts6sjrFHMxafLh2njXSniJ448IkwvFRVoTVKgZBtxRtsS31EZioLaRnYm
 47IDUqXuAXteS7HgQawCjtgIXu8erRDGdt//VaOkJ1yUVm6mDnaW/9kBZorRWaYwH4/s
 bbxcO7wxzB4Mlw66rWXDoEu5enNNmM1K01Ej7npYgNmd3XtHYducMzP6v6K+mOlNaaoa
 XT7Q==
X-Gm-Message-State: ABy/qLapL3Rq3KxrFG/GbPpEIrcMy1C4eVqNyDjNDg/+g+hZ4P+i8Bh6
 u4Eya/lFhIxBMcheHSOwUsFBNECydC8adCUK+BUIBk1FHbQiBNfvDxp1d5mXPp3rQFkr73nS8Mo
 LLJaQrTAxOqJCM9V5/uUy6+xfhWrJ2CAUiPMx
X-Received: by 2002:aa7:c683:0:b0:51e:1040:adc3 with SMTP id
 n3-20020aa7c683000000b0051e1040adc3mr239841edq.33.1690498018363; 
 Thu, 27 Jul 2023 15:46:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF6yIMGtc30XLa5Isy6K+B0BQoXVFk19vTgQ0+hSSuj3mbFyBeShRlt6qtsD6jE30vc/SdEFA==
X-Received: by 2002:aa7:c683:0:b0:51e:1040:adc3 with SMTP id
 n3-20020aa7c683000000b0051e1040adc3mr239827edq.33.1690498017977; 
 Thu, 27 Jul 2023 15:46:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a056402134b00b0051dd19d6d6esm1101313edw.73.2023.07.27.15.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 15:46:57 -0700 (PDT)
Message-ID: <d26b2758-f599-b385-2f3b-7ac7aaaaaa45@redhat.com>
Date: Fri, 28 Jul 2023 00:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/tests: Alloc drm_device on drm_exec tests
To: Arthur Grillo <arthurgrillo@riseup.net>
References: <20230727192259.237935-1-arthurgrillo@riseup.net>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230727192259.237935-1-arthurgrillo@riseup.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 tales.aparecida@gmail.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, boris.brezillon@collabora.com,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/23 21:22, Arthur Grillo wrote:
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

Tested-by: Danilo Krummrich <dakr@redhat.com>
Acked-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/tests/drm_exec_test.c | 36 +++++++++++++++++++++------
>   1 file changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
> index 727ac267682e..df31f89a7945 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -12,11 +12,31 @@
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
> +static struct device *dev;
> +static struct drm_device *drm;
> +
> +static int test_init(struct kunit *test)
> +{
> +	dev = drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0,
> +						  DRIVER_MODESET);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
> +
> +	return 0;
> +}
> +
> +static void test_exit(struct kunit *test)
> +{
> +	drm_kunit_helper_free_device(test, dev);
> +}
>   
>   static void sanitycheck(struct kunit *test)
>   {
> @@ -33,7 +53,7 @@ static void test_lock(struct kunit *test)
>   	struct drm_exec exec;
>   	int ret;
>   
> -	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
> +	drm_gem_private_object_init(drm, &gobj, PAGE_SIZE);
>   
>   	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>   	drm_exec_until_all_locked(&exec) {
> @@ -52,7 +72,7 @@ static void test_lock_unlock(struct kunit *test)
>   	struct drm_exec exec;
>   	int ret;
>   
> -	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
> +	drm_gem_private_object_init(drm, &gobj, PAGE_SIZE);
>   
>   	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>   	drm_exec_until_all_locked(&exec) {
> @@ -78,7 +98,7 @@ static void test_duplicates(struct kunit *test)
>   	struct drm_exec exec;
>   	int ret;
>   
> -	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
> +	drm_gem_private_object_init(drm, &gobj, PAGE_SIZE);
>   
>   	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES);
>   	drm_exec_until_all_locked(&exec) {
> @@ -106,7 +126,7 @@ static void test_prepare(struct kunit *test)
>   	struct drm_exec exec;
>   	int ret;
>   
> -	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
> +	drm_gem_private_object_init(drm, &gobj, PAGE_SIZE);
>   
>   	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>   	drm_exec_until_all_locked(&exec) {
> @@ -127,8 +147,8 @@ static void test_prepare_array(struct kunit *test)
>   	struct drm_exec exec;
>   	int ret;
>   
> -	drm_gem_private_object_init(&dev, &gobj1, PAGE_SIZE);
> -	drm_gem_private_object_init(&dev, &gobj2, PAGE_SIZE);
> +	drm_gem_private_object_init(drm, &gobj1, PAGE_SIZE);
> +	drm_gem_private_object_init(drm, &gobj2, PAGE_SIZE);
>   
>   	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>   	drm_exec_until_all_locked(&exec)
> @@ -150,6 +170,8 @@ static struct kunit_case drm_exec_tests[] = {
>   
>   static struct kunit_suite drm_exec_test_suite = {
>   	.name = "drm_exec",
> +	.init = test_init,
> +	.exit = test_exit,
>   	.test_cases = drm_exec_tests,
>   };
>   

