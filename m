Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513EE7673AB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 19:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AA010E0ED;
	Fri, 28 Jul 2023 17:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDC210E0ED
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 17:43:31 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RCFNg35mJzDqDT;
 Fri, 28 Jul 2023 17:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1690566211; bh=HHg1BBSw7w1llYvM2JF9tdL+YHLSwhwrCXY4kPDkOdY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LatLvLwi6o+09BFwBNyF8TDVLGO3qCs20PBujC7NjYVhgxszatQO7DMzvyOeoZ8sg
 9RT0S2GFsOQp904Qsv23VZ2K7YfjaXikxhdH8ZpoG8ocYlFcRaBWdiC7Lkwll+h/Oo
 Qv/UxWQfLRaFJiPgF86cy6RrT94kBAkM5yxwietE=
X-Riseup-User-ID: FF30BAF80845D49417401941C3764254641C42DE272DF9BB03E4836C0BEA0549
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RCFNV5TNgzFqgg;
 Fri, 28 Jul 2023 17:43:21 +0000 (UTC)
Message-ID: <591114cb-88f7-0a43-f2ba-8ab5836571c9@riseup.net>
Date: Fri, 28 Jul 2023 14:43:14 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/tests: Alloc drm_device on drm_exec tests
Content-Language: en-US
To: Maxime Ripard <mripard@redhat.com>
References: <20230727192259.237935-1-arthurgrillo@riseup.net>
 <2qt3go2ark5swawiponvvrlnq6tdxtyivaif2svzba4ajoo2zm@bhuv2qsjtytm>
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <2qt3go2ark5swawiponvvrlnq6tdxtyivaif2svzba4ajoo2zm@bhuv2qsjtytm>
Content-Type: text/plain; charset=UTF-8
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
 mairacanal@riseup.net, boris.brezillon@collabora.com, dakr@redhat.com,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28/07/23 11:33, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Jul 27, 2023 at 04:22:59PM -0300, Arthur Grillo wrote:
>> The drm_exec tests where crashing[0] because of a null dereference. This
>> is caused by a new access of the `driver` attribute of `struct
>> drm_driver` on drm_gem_private_object_init(). Alloc the drm_device to
>> fix that.
>>
>> [0]
>> [15:05:24] ================== drm_exec (6 subtests) ===================
>> [15:05:24] [PASSED] sanitycheck
>> ^CERROR:root:Build interruption occurred. Cleaning console.
>> [15:05:50] [ERROR] Test: drm_exec: missing expected subtest!
>> [15:05:50] BUG: kernel NULL pointer dereference, address: 00000000000000b0
>> [15:05:50] #PF: supervisor read access in kernel mode
>> [15:05:50] #PF: error_code(0x0000) - not-present page
>> [15:05:50] PGD 0 P4D 0
>> [15:05:50] Oops: 0000 [#1] PREEMPT NOPTI
>> [15:05:50] CPU: 0 PID: 23 Comm: kunit_try_catch Tainted: G                 N 6.4.0-rc7-02032-ge6303f323b1a #69
>> [15:05:50] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-1.fc37 04/01/2014
>> [15:05:50] RIP: 0010:drm_gem_private_object_init+0x60/0xc0
>>
>> Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> 
> You should Cc the list of people returned by scripts/get_maintainers.pl
> for all your patches.
> 

The email of my patch that arrived in my inbox has all the people
returned by scripts/get_maintainers.pl on Cc, but the email on the list
has some people left out. Maybe is something wrong with my git
send-email configuration. I will have a look on that.

Best Regards,
~Arthur Grillo

>> ---
>>  drivers/gpu/drm/tests/drm_exec_test.c | 36 +++++++++++++++++++++------
>>  1 file changed, 29 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
>> index 727ac267682e..df31f89a7945 100644
>> --- a/drivers/gpu/drm/tests/drm_exec_test.c
>> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
>> @@ -12,11 +12,31 @@
>>  
>>  #include <drm/drm_exec.h>
>>  #include <drm/drm_device.h>
>> +#include <drm/drm_drv.h>
>>  #include <drm/drm_gem.h>
>> +#include <drm/drm_kunit_helpers.h>
>>  
>>  #include "../lib/drm_random.h"
>>  
>> -static struct drm_device dev;
>> +static struct device *dev;
>> +static struct drm_device *drm;
>> +
>> +static int test_init(struct kunit *test)
>> +{
>> +	dev = drm_kunit_helper_alloc_device(test);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
>> +
>> +	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0,
>> +						  DRIVER_MODESET);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
>> +
>> +	return 0;
>> +}
>> +
>> +static void test_exit(struct kunit *test)
>> +{
>> +	drm_kunit_helper_free_device(test, dev);
>> +}
> 
> You shouldn't be using a global variable here. test->priv is meant for
> those kind of things.
> 
> Maxime
