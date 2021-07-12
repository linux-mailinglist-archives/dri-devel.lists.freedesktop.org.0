Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3688C3C5EF5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 17:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B47689CD3;
	Mon, 12 Jul 2021 15:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 318 seconds by postgrey-1.36 at gabe;
 Mon, 12 Jul 2021 15:17:31 UTC
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BD389CD3;
 Mon, 12 Jul 2021 15:17:31 +0000 (UTC)
Received: from [10.172.193.212] (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id C8FE44057E; 
 Mon, 12 Jul 2021 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626102732;
 bh=RbwaKgH+40tX4ABd0qWgnTwTmSTR24M1qYXtjKJTl7o=;
 h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type;
 b=VRdB7rqVuyop4lZvtnOogx+VCNSezzKocfbgVuW1cuf/us5s0ys/SZJeVxY2KyFJ/
 k5DObZk7Vv6QVU5WM/wyRuNrTTyNN3+zTLNaefq4UfvVFusOMKS06wDhDiewMzTWzb
 RHocbp3+vRv+/0Kk8Og3ftJHdGgrDhXqbXFBlfKoIBTN42qL8xVtQm96eGr7y2Pzyw
 +orY0u0SaawztCDsD+u9e4gtu7FmcYxGXMJTbwcRuy/lzsVqayoVcs0gDyBS5Kjhpi
 70HKRLMe0LF7J0476sFBu7v2RW6Fayg7kB2DsTPyk6EXH/NxnMkhZnYY4rtgO1XM8/
 YR3Afks8KwPqQ==
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
From: Colin Ian King <colin.king@canonical.com>
Subject: re: drm/i915/ttm Initialize the ttm device and memory managers
Message-ID: <161dac7a-5aad-150e-7c14-7bb195ecf30f@canonical.com>
Date: Mon, 12 Jul 2021 16:12:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Static analysis with Coverity on linux-next has found a potential issue
in drivers/gpu/drm/i915/selftests/intel_memory_region.c in function
igt_mock_fill - the problematic commit is as follows:

commit d148738923fdb5077089e48ec15555e6008100d0
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 2 10:38:08 2021 +0200

    drm/i915/ttm Initialize the ttm device and memory managers

The analysis is as follows:


 49 static int igt_mock_fill(void *arg)
 50 {
 51        struct intel_memory_region *mem = arg;
 52        resource_size_t total = resource_size(&mem->region);
 53        resource_size_t page_size;
 54        resource_size_t rem;
 55        unsigned long max_pages;
 56        unsigned long page_num;
 57        LIST_HEAD(objects);
 58        int err = 0;
 59
 60        page_size = mem->chunk_size;
 61        rem = total;
 62 retry:

value_overwrite: Overwriting previous write to max_pages with value from
div64_u64(rem, page_size).

 63        max_pages = div64_u64(rem, page_size);
 64
 65        for_each_prime_number_from(page_num, 1, max_pages) {
 66                resource_size_t size = page_num * page_size;
 67                struct drm_i915_gem_object *obj;
 68
 69                obj = i915_gem_object_create_region(mem, size, 0);
 70                if (IS_ERR(obj)) {
 71                        err = PTR_ERR(obj);
 72                        break;
 73                }
 74
 75                err = i915_gem_object_pin_pages_unlocked(obj);
 76                if (err) {
 77                        i915_gem_object_put(obj);
 78                        break;
 79                }
 80
 81                list_add(&obj->st_link, &objects);
 82                rem -= size;
 83        }
 84
 85        if (err == -ENOMEM)
 86                err = 0;
 87        if (err == -ENXIO) {
 88                if (page_num * page_size <= rem) {
 89                        if (mem->is_range_manager && max_pages > 1) {

Unused value (UNUSED_VALUE)
assigned_value: Assigning value from max_pages >> 1 to max_pages here,
but that stored value is overwritten before it can be used.

 90                                max_pages >>= 1;
 91                                goto retry;
 92                        }
 93

The right shift to max_pages on line 90 is being overwritten on line 64
on the retry.

Colin
