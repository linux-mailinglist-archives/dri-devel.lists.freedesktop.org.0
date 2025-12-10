Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52F5CB27A4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 10:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09FB10E695;
	Wed, 10 Dec 2025 09:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="XZw4yrkf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5736410E695
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 09:02:15 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b725ead5800so869600266b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 01:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765357334; x=1765962134; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xXnWbapp9PXjn/qW3sEg1u/vI1S0SiiO/T23XvrD4H4=;
 b=XZw4yrkfWaqy9smPMtoS1h82XBziD/qGzx8+tAFQCE4O3iNyqohCP8JuhoCCEw2MW4
 RhvS48oVzpbJAuM6tgCJHaZMRrnWkH9A61GLQjeCAgMuD9fa6WQ9fKXhsyptIEy2O11I
 B3wKTrMoj6v1IF+LjIA9zSgxkOdsdyXj3chqqXfGfBFdit1wT1JaP+qlYy999F6IkttK
 ISH2mBKzLU3fiwL4PeEoWcDLi06tN1vLOyLlk1UXTSZChk0BYhd36LgwZFzjSHHkdmqK
 y2VNnFLxUd9qdlZrcZ1Rd9p0m0MFfU4U+X2WBMsKn2UhjScr3EZGiwEUkD4eQ4/+zsvI
 tbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765357334; x=1765962134;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xXnWbapp9PXjn/qW3sEg1u/vI1S0SiiO/T23XvrD4H4=;
 b=YeABxdix8qss+j7wse2cHY7ADvuQuktN24Mdt5LAyUpwv9t7ecjBH/1jKifJsxfKCn
 kFYAdXjhgLHSFMB5Ze9JTSVxoc3mZqTkk3+S96orrZyA8EYiLaGQfMpOyBtecTSLsYYd
 BUKaEWvnujQ/HBzdFyy/Ozq9U06tfy1LQAHosOuBq7BU75KQorxTRVrziZXKENUAh+pf
 QtXChU+kJHQe2SO7LIQOn7WMRgD87wEisYbTaWeQJcnj01//zPmmqlKE08aL5iSXbGzH
 l4fWD42sE9B+CDqYwCgT9h3hJQPLYzMhlUy7p5O8PhiovfiOjenUdzZXFDz8sAT00B/a
 fqtA==
X-Gm-Message-State: AOJu0YwMeY4g7D0hxDPgrvav/1oIx6y0bG3XkiljYj/4JgGrxSb/hUlp
 vc4qekFkwb5W0FoHZQ45hsYVwS5qQFVuGgZwvqcN74U4wiyXnENFdBYWRA/E48DpXKE=
X-Gm-Gg: ASbGncudd0U64wH2o/cTN+XDPW0jJEqWJBY2RAZponHaYl+HTPkgWASNZVZ66RR3cZT
 M54L+oo8AWnMu8ODsmLgyUlzQei+UctdcK68UFuCTBOesXkz8ib3MS2ODel4HWhh4/udKcHZJIN
 HNifSNilkLBS4ql8b9JFDmxeiDc+qDJskrmvcANH73FEHErt7/yc/cecSWc7ZT/o93u97V0ufXi
 ylZIgptVxJmsr7yytNkhEq0BJymvICmQzU728gYT5hHsU9uaqprwvjfHnrccU24EQP6H8RbUVFI
 FSijGvbSZnU+cCJQHHVq/k2iXJvBPiqqcS0gqwDcBS3mINBm75oBxEAX4C8w3dAe6KuhgkGZvvV
 hJb50clSifzW1s+C7jenc8PqDnX0gfM46sLDdh5Kl8wQHKr4iO6CNHTCwi8mjkNpr+9js0WpOnE
 dLDHv6PeItLf+T/FFHndvpBbPHTcYB
X-Google-Smtp-Source: AGHT+IEmeLV71Z7y5QMe+POFiLZHzevvzQ3eqtZjpTDq0W+44jnLU4wSWAzmylLqdOpU8Uy2oE+T2w==
X-Received: by 2002:a17:907:9707:b0:b3f:3570:3405 with SMTP id
 a640c23a62f3a-b7ce84d6133mr152065966b.34.1765357333496; 
 Wed, 10 Dec 2025 01:02:13 -0800 (PST)
Received: from [192.168.1.83] ([86.33.28.86]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4975c56sm1610197266b.33.2025.12.10.01.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 01:02:12 -0800 (PST)
Message-ID: <157afb23-6852-4f04-a247-ac89b18a6a4f@ursulin.net>
Date: Wed, 10 Dec 2025 10:02:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression on drm-tip (CI_DRM_17644)
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 loic.molinari@collabora.com
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>
References: <d73adfa8-d61b-46b3-9385-dde53d8db8ad@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <d73adfa8-d61b-46b3-9385-dde53d8db8ad@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/12/2025 09:25, Borah, Chaitanya Kumar wrote:
> Hello Loïc,
>
> Hope you are doing well. I am Chaitanya from the linux graphics team 
> in Intel.
>
> This mail is regarding a regression we are seeing in our CI runs[1] on
> drm-tip repository.
>
> Since the version CI_DRM_17644, we are seeing the following regression
>
> ````````````````````````````````````````````````````````````````````````````````` 
>
> <4> [392.386571] ------------[ cut here ]------------
> <2> [392.386578] kernel BUG at 
> drivers/gpu/drm/i915/gem/i915_gem_region.c:49!
> <4> [392.386597] Oops: invalid opcode: 0000 [#1] SMP NOPTI
> <4> [392.386604] CPU: 0 UID: 0 PID: 5710 Comm: i915_selftest Tainted: 
> G S   U  W    L      6.18.0-CI_DRM_17644-g20a0f6f7ed00+ #1
> ...
> <4> [392.387153] RSP: 0018:ffffc9000142f740 EFLAGS: 00010246
> <4> [392.387158] RAX: 0000000000000000 RBX: ffff8882427b8000 RCX: 
> 0000000000000000
> <4> [392.387162] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
> 0000000000000000
> <4> [392.387165] RBP: ffffc9000142f770 R08: 0000000000000000 R09: 
> 0000000000000000
> <4> [392.387168] R10: 0000000000000000 R11: 0000000000000000 R12: 
> ffff888144dcb800
> <4> [392.387170] R13: ffff8881412b8a40 R14: 0000000000000100 R15: 
> ffff8882427b8000
> <4> [392.387173] FS:  0000702699044940(0000) GS:ffff8888dc8ea000(0000) 
> knlGS:0000000000000000
> <4> [392.387177] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4> [392.387180] CR2: 000058e25b5beef3 CR3: 00000001412d7000 CR4: 
> 0000000000352ef0
> <4> [392.387183] Call Trace:
> <4> [392.387186]  <TASK>
> <4> [392.387191]  i915_gem_object_create_region+0x1e/0x30 [i915]
> <4> [392.387663]  igt_tmpfs_fallback+0xaf/0x3c0 [i915]
> <4> [392.388109]  __i915_subtests+0xb8/0x250 [i915]
> <4> [392.388557]  ? __pfx___i915_live_teardown+0x10/0x10 [i915]
> <4> [392.388981]  ? __pfx___i915_live_setup+0x10/0x10 [i915]
> <4> [392.389405]  ? _printk+0x57/0x80
> <4> [392.389413] i915_gem_huge_page_live_selftests+0xac/0xe0 [i915]
> <4> [392.389835]  __run_selftests+0xc5/0x220 [i915]
> <4> [392.390263]  i915_live_selftests+0xaa/0x130 [i915]
> <4> [392.390688]  i915_pci_probe+0x11b/0x220 [i915]
>
> ````````````````````````````````````````````````````````````````````````````````` 
>
> Details log can be found in [2].
>
> After bisecting the tree, the following patch [3] seems to be the 
> first "bad" commit
>
> ````````````````````````````````````````````````````````````````````````````````````````````````````````` 
>
> commit a8a9a590221c1959716277d4b13fe658816afc0e
> Author: Loïc Molinari <loic.molinari@collabora.com>
> Date:   Fri Dec 5 19:22:26 2025 +0100
>
>     drm/i915: Use huge tmpfs mountpoint helpers
> ````````````````````````````````````````````````````````````````````````````````````````````````````````` 
>
>
> We also verified that if we revert the patch the issue is not seen.
>
> Could you please check why the patch causes this regression and 
> provide a fix if necessary?

My bad actually. This should fix it:

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h 
b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 00f0b0ead053..969f6ea2b855 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -363,6 +363,7 @@ struct drm_i915_gem_object {
                              I915_BO_ALLOC_PM_EARLY | \
                              I915_BO_ALLOC_GPU_ONLY | \
                              I915_BO_ALLOC_CCS_AUX | \
+                            I915_BO_ALLOC_NOTHP | \
                              I915_BO_PREALLOC)
  #define I915_BO_READONLY          BIT(10)
  #define I915_TILING_QUIRK_BIT     11 /* unknown swizzling; do not 
release! */

Loic would you mind sending a proper patch with Fixes: etc please?

Regards,

Tvrtko

>
> Thank you.
>
> Regards
>
> Chaitanya
>
> [1]
> https://intel-gfx-ci.01.org/tree/drm-tip/combined-alt.html?
> [2]
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17644/bat-jsl-5/igt@i915_selftest@live@hugepages.html#dmesg-warnings394 
>
> [3] 
> https://cgit.freedesktop.org/drm-tip/commit/?id=a8a9a590221c1959716277d4b13fe658816afc0e

