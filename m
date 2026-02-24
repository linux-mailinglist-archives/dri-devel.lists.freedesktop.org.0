Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOoEN0WenWnwQgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:49:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C49418731F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3866F10E574;
	Tue, 24 Feb 2026 12:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Vp8gXEEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8510410E571
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 12:49:04 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id
 5b1f17b1804b1-48374014a77so56958055e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1771937343; x=1772542143; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VXbepEXBxEzE8Vil64ociWLo2zkHMEENfbDS9OfNlic=;
 b=Vp8gXEEYgMhrc7zi2gEp17XoI0AA1XDWI1Wgw3qjKwcYbPoKyvTEr0igig5JbwPsQi
 Vq8B6V43C4aC3utV0w9wrTuOhDc6ZtyxhsdfzPFKOuEowcqPIEKezI8wdw542nrlJmaD
 6nMT2r8dq5tOgVh4KO4gDGO2jo4fKyvj18zWOMjbuu+vmmoc1+xZBpRLeH4ve2P1mze1
 DOBDcJ/sTukOZ/nsvDRByojpjIcVm/DOOy9xdokMrtsBV9uPo1YoHFRhgjA58NEgmQGy
 5bo+f7elSm24RbXvGT2fILWdqFKUiqxWimD07lSzzW226MBe1NN+V8puS+YSOk8wVKh1
 ks4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771937343; x=1772542143;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VXbepEXBxEzE8Vil64ociWLo2zkHMEENfbDS9OfNlic=;
 b=UP3FLavDjKCSppX+EhRqE4dnFEh/KLLINr0jy0mgcENbqpSmZGV05cUWyj7DvZeUmt
 st5WZRVtG6Q+afcxd0Q8iyWWJuFS1chAEB9QEHNhtMvtsOMvEWMgcrYRWaZ30rqE+O0O
 mIJD14OA8WpuyUWUMvs6YVcWA/h2l4mi+FkZSPig27nrtPgfqYp+x8h/ORXaOhoWZgw8
 PrqhyjQwAcu3+O4PhwtYJ4l3S94OdxhYEP1p+IrbB9emMBw1L3owyPaO/d1Uk+nL/bZ1
 OuO50mStDaSF6v9GEsSH5KVBHE6VxYxZiIerVtTFtoZ8JFCNLoURGtz5nqsrxgSCmM1S
 Jmzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJY0Z7RfkQZSaHurl0R29PB+QslOKqesiFWbgpeM5iV6Uf1KAdhn8MTIPsEimBU8oMKe1PQHWOVzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxakxyElxAuGkU+uVK4pKHl0TAuWRHo63c+7TbtWDh98qkLv5ID
 0vWSTGLGYClydM9IKGBe1Xpz4u3xVG8cZxIDwq2W0Psze3fjxjwn18zHChCRIGVReSHx/cLosCO
 x3i4pMvV2PQ==
X-Gm-Gg: AZuq6aJdsbTn1CtUfFeVubyeWLNfoWgp6brpMVCRMtI9vpwkHG9QyST49zt6b/beGRD
 PoaCfe5HqpwTjflzR4/mWtct16OrptAVmAYQgXr1vDvl2SM1MzG9VU6I5xd4mrbWKgqLZJgoqYR
 6p9zbMKz28ZJTPmn6M66m+K5shnCM37xPNUh60ODQAt7pS7iE5C0zKc2bBLR9/1k702xrOaEEid
 ErkfysAAAM95TnFqrKupd4S6h/8y/TrAced0wIp3R7KKFH/oiaDTopcIQDq6tAAhYm4gGahXV7E
 EevRu2pw14Wui41J9M2xLC9P55OJDQzcVgUuSmNulW14efBWF/fT4iX1p1hDZeiuUYTF5oS5g7z
 JYtsq2PjE7xS/Sy4hHxccAFTNuPA2jQUS96bH7g7usuiGR5lYReW1DuNcoI4Ujs77ZK+QUWqu6K
 co5SKmmmcQE0Hu/E6V9ZVaHhE7DINhfs12IwHH2v3bUfRq
X-Received: by 2002:a05:600c:5397:b0:483:71f9:37f3 with SMTP id
 5b1f17b1804b1-483a95a85c0mr210507675e9.1.1771937342957; 
 Tue, 24 Feb 2026 04:49:02 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b81f8912sm27345515e9.1.2026.02.24.04.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 04:49:02 -0800 (PST)
Message-ID: <1c76b8d6-9394-4017-a18f-95ecc2c08175@ursulin.net>
Date: Tue, 24 Feb 2026 12:49:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
To: Maxime Ripard <mripard@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org
References: <20260224110310.1854608-1-mripard@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260224110310.1854608-1-mripard@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ursulin.net:mid,ursulin.net:dkim,igalia.com:email]
X-Rspamd-Queue-Id: 4C49418731F
X-Rspamd-Action: no action


On 24/02/2026 11:03, Maxime Ripard wrote:
> Some DRM tests cross the 1s execution time threshold that defines a test
> as slow. Let's flag them as such.

Curious that both did not trigger for me and I even run them under 
nested qemu most of the time.

> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 4 ++--
>   drivers/gpu/drm/tests/drm_buddy_test.c        | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 82a41a456b0a..a5a5a35a87b0 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -419,11 +419,11 @@ static void drm_sched_change_priority(struct kunit *test)
>   		drm_mock_sched_entity_free(entity[i]);
>   }
>   
>   static struct kunit_case drm_sched_priority_tests[] = {
>   	KUNIT_CASE(drm_sched_priorities),
> -	KUNIT_CASE(drm_sched_change_priority),
> +	KUNIT_CASE_SLOW(drm_sched_change_priority),

This one deliberately aims to run for ~1s and I don't have an immediate 
idea how it would go over 2s.

>   	{}
>   };
>   
>   static struct kunit_suite drm_sched_priority = {
>   	.name = "drm_sched_basic_priority_tests",
> @@ -544,11 +544,11 @@ static void drm_sched_test_credits(struct kunit *test)
>   	drm_mock_sched_entity_free(entity);
>   	drm_mock_sched_fini(sched);
>   }
>   
>   static struct kunit_case drm_sched_credits_tests[] = {
> -	KUNIT_CASE(drm_sched_test_credits),
> +	KUNIT_CASE_SLOW(drm_sched_test_credits),

Same really.

Anyway, the scheduler parts LGTM and I can follow up trying to optimise 
these two later.

For the scheduler:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

>   	{}
>   };
>   
>   static struct kunit_suite drm_sched_credits = {
>   	.name = "drm_sched_basic_credits_tests",
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index e6f8459c6c54..35ca79525f43 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -908,11 +908,11 @@ static struct kunit_case drm_buddy_tests[] = {
>   	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
>   	KUNIT_CASE(drm_test_buddy_alloc_pathological),
>   	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
>   	KUNIT_CASE(drm_test_buddy_alloc_clear),
>   	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
> -	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
> +	KUNIT_CASE_SLOW(drm_test_buddy_fragmentation_performance),
>   	KUNIT_CASE(drm_test_buddy_alloc_exceeds_max_order),
>   	{}
>   };
>   
>   static struct kunit_suite drm_buddy_test_suite = {

