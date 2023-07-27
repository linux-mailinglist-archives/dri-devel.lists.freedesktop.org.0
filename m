Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBC9766022
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 01:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3CC10E633;
	Thu, 27 Jul 2023 23:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E834F10E633
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 23:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
 :References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pvnUr51h8WIao2a0o/3EGONfTVoiOLyyOTtzPcgPbU0=; b=e++bgzsOmA5LoHfOD9/iekRyQs
 Uz4OzYQf9xiRoYrUht8UhgbKFl0AIW59rCXrQU5pkrocQuS+Ct5qFeDD89ne7TOI0hvJJDmP9zEez
 2r91mWlcUTbz9t3zgWCCI4hd4TdwcrkJyvJmzkIB9EcAZSbcnWIcrSkvLYqtACsHMPU4z1aGeDbsS
 QNxUOh5JMhszNuKGab4m9WlRFSDVrXxZXchp96ICTFLY+3Kielvkh0aC7NYAM3hS9Od6hKH42z9B3
 jdZfJrXgXvAZm7IPxMSF6Qb2awJnj9T5mZfY5PXXRMUac5fh9k2TLAn3pdfyX9BQ96VqBjTxhKjmI
 5Xjq7tHQ==;
Received: from [187.36.235.191] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qPA5c-004sAV-Kr; Fri, 28 Jul 2023 01:08:13 +0200
Message-ID: <cbf4ccf9-8131-27a0-332c-6942866340d1@igalia.com>
Date: Thu, 27 Jul 2023 20:08:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230727192259.237935-1-arthurgrillo@riseup.net>
From: Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/tests: Alloc drm_device on drm_exec tests
In-Reply-To: <20230727192259.237935-1-arthurgrillo@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 tales.aparecida@gmail.com, boris.brezillon@collabora.com, dakr@redhat.com,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

On 7/27/23 16:22, Arthur Grillo wrote:
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

Maybe we could use test->priv to store those variables.

> +
> +static int test_init(struct kunit *test)

Nitpick: wouldn't be better to call it drm_exec_test_init()?

Anyway, with those fixes or not,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

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
