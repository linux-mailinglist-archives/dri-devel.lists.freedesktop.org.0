Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F87576FEB
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 17:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7EDA7C48;
	Sat, 16 Jul 2022 15:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4FEA7BDD;
 Sat, 16 Jul 2022 15:38:45 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso14203683pjc.1; 
 Sat, 16 Jul 2022 08:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=sPHVT4eE+4LdsiDgCu5bU0KSM7U9erY+NOtC/60SpKU=;
 b=CdReJ+idnoWCZEm9s8XLy2D20yxwbGrOHpRpHwS8kw5CG8pwZSKuP+yNgSjzUsVrgm
 PIKfjvf9oSnfr9r55A+aDh/K1ohXobt3xwHv2Q9X8Y8ApmOQvm2HjvEmaxgvkaTLmW38
 bQLVP4mf0HLMVfDV8/dHpxXEcYrkgafvsEiZojkWf4bYbSH2uhsFa9vnruWYA4iKkBNi
 cBLMRa3n8aL2LPHr+7UXmqE9B1FALu3qmj/q2v6Nkp3oYb5XO/B/pdKbixlPObllY+Nl
 qCZnrQwhx1bwFgh6xCqb+4u6eWtM0G+NTz6JcO5TV4mxHY2QYqC+xfmjJJiXHooNOMa3
 mq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=sPHVT4eE+4LdsiDgCu5bU0KSM7U9erY+NOtC/60SpKU=;
 b=XmLoFgiWZesqO1RXtvAX5DpBH6i1a1+PhVeYQ8cF1hs69xubfhzpYOpzNIO5He0X2B
 cIn81973LXOgJnXtyTdGWAS98PTOMYaoAoGX2Xf4K44yT/0dpIHYpuTcStrf1kKGVNpv
 ZvklBRMBlyvPLKSkwGx5nnSntkA5cZ6er2W5I7z9KetcLZlCW0r8CeOHvg5vNxLxbPvw
 9EqRjkb2idIF7AKGo7RGU090kEVrFpogvBloe2sMuJTs+F1D7eaHPAUdGTJP3MIMF/Qk
 tyMK7rh1h/gGribx6H95LwkHBUvdtzLKdHGXjkBesvXrFCVDSHrCjm4Esej6LurCoODI
 6wQw==
X-Gm-Message-State: AJIora+eABbwKTJJbLg64vkov4Tn8IWX7hBrvy/bANNVScyI3GqBPxaN
 tE5Gt0k8rI0xElfJw35psSY=
X-Google-Smtp-Source: AGRyM1sG3UCh5cF4hLtdm7m3dGWIVsMAD97Lfva8I9G0HMgb9/a4lUqyFEZMKTL/kQmDxfKagpD9Vw==
X-Received: by 2002:a17:902:f542:b0:16c:505c:ebb2 with SMTP id
 h2-20020a170902f54200b0016c505cebb2mr19229081plf.77.1657985924946; 
 Sat, 16 Jul 2022 08:38:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a16-20020aa794b0000000b00529bd84d7bcsm6022175pfl.156.2022.07.16.08.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 08:38:38 -0700 (PDT)
Date: Sat, 16 Jul 2022 08:38:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [v3] drm/i915/ttm: fix sg_table construction
Message-ID: <20220716153832.GA1358436@roeck-us.net>
References: <20220711085859.24198-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220711085859.24198-1-matthew.auld@intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 11, 2022 at 09:58:59AM +0100, Matthew Auld wrote:
> If we encounter some monster sized local-memory page that exceeds the
> maximum sg length (UINT32_MAX), ensure that don't end up with some
> misaligned address in the entry that follows, leading to fireworks
> later. Also ensure we have some coverage of this in the selftests.
> 
> v2(Chris):
>   - Use round_down consistently to avoid udiv errors
> v3(Nirmoy):
>   - Also update the max_segment in the selftest
> 
> Fixes: f701b16d4cc5 ("drm/i915/ttm: add i915_sg_from_buddy_resource")
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6379
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Building i386:defconfig ... failed
--------------
Error log:
x86_64-linux-ld: drivers/gpu/drm/i915/i915_scatterlist.o: in function `i915_rsgt_from_mm_node':
i915_scatterlist.c:(.text+0x196): undefined reference to `__udivdi3'

Bisect log attached.

Guenter

---
# bad: [9b59ec8d50a1f28747ceff9a4f39af5deba9540e] Merge tag 'riscv-for-linus-5.19-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
# good: [e5d523f1ae8f2cef01f8e071aeee432654166708] ubsan: disable UBSAN_DIV_ZERO for clang
git bisect start 'HEAD' 'e5d523f1ae8f'
# bad: [2a347a06ebb1b186a5cb919c9f5ab6e040554be7] Merge tag 'platform-drivers-x86-v5.19-4' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
git bisect bad 2a347a06ebb1b186a5cb919c9f5ab6e040554be7
# bad: [093f8d8f10aa22935bc8bf7100700f714ebaba9c] Merge tag 'amd-drm-fixes-5.19-2022-07-13' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
git bisect bad 093f8d8f10aa22935bc8bf7100700f714ebaba9c
# bad: [ad765fae792e16ce3c1d0b69ce939e3f7dba40ab] drm/i915/gem: Look for waitboosting across the whole object prior to individual waits
git bisect bad ad765fae792e16ce3c1d0b69ce939e3f7dba40ab
# good: [f99546298a4537965b75d518c210742f641be389] Merge tag 'gvt-fixes-2022-07-11' of https://github.com/intel/gvt-linux into drm-intel-fixes
git bisect good f99546298a4537965b75d518c210742f641be389
# bad: [aff1e0b09b54b64944b7fe32997229552737b9e9] drm/i915/ttm: fix sg_table construction
git bisect bad aff1e0b09b54b64944b7fe32997229552737b9e9
# good: [896dcabd1f8f613c533d948df17408c41f8929f5] drm/i915/selftests: fix a couple IS_ERR() vs NULL tests
git bisect good 896dcabd1f8f613c533d948df17408c41f8929f5
# first bad commit: [aff1e0b09b54b64944b7fe32997229552737b9e9] drm/i915/ttm: fix sg_table construction
