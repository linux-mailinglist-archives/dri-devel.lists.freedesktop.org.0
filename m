Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C169AD2B14
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 02:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAE410E24A;
	Tue, 10 Jun 2025 00:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pczteVAr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AB810E455
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 00:57:24 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-236377f00easo2613065ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 17:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749517044; x=1750121844; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c1rQwYkfS8VPR2HtcdFz5xQMJ3QnFjshutUNq6gvzdg=;
 b=pczteVAreoZvdfekcsgjCTEgOBLPGJULMQ1PjFTPLaGBo000DZZzvnE7pS+MbuaHMt
 kRglpEUc1yhd8sZmw4dFySrnRkdIUqJxWaP2suD3aN6CHx2OY9hKNv7C9w9M8RtHa3kK
 DkpfaWA6HqWsMUv35g8jE+8hBfbOjjYkNFL3KoWJisAteWeqOnZyvDmVpKKqG08B99yz
 Y4cOHhjkkU9//XjBeUBiWuzDMKhup7MyIMDDLk/v6h9xOa97j3e87ILXstv84vEGfOfO
 2PUMkYnbGaLM0NCVXy1OBVPPVGhjY2Nf6Xi5FWIjucrDIWT0na26s6ZsRv7t3tFlV/lQ
 bOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749517044; x=1750121844;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1rQwYkfS8VPR2HtcdFz5xQMJ3QnFjshutUNq6gvzdg=;
 b=c2Hm8T02dDs6BrXfMYOxELmiuBNkmfKNk6sjNiV0cECl1YnEPKJ9gxL8ogk4kp1AT4
 eIuSBTwLlKWbZrnMSU/5kc/V0aX7pAPMuiPxbdQMGllkdM00OoEzx9HH5QmAT2hxfzm0
 jhyW1RRKP9XDYqJn6mk+Xng04rNmRwNgMz3kmVG+ebnNv2cDbMtiU5Pueg3B6pIxZw3W
 YXko3/EHWT+8jhJxN4cxeCkwdaImiLMhE/a7v2NcRyyfp4cvDH31TM4i5Jit1w7H0W2T
 AkIQfGGJHRtwAXXzDKKMbUcPhd1VgYLbE1m+6ot0mON43tj4iwfWYsUDjFyfZPLa6G5e
 zipg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdnXe+Lo1Bv4aGJNL3Wf92a/1A7fTNhFDc2hhjZpUbeUlz3BRR7dBX+gt9E0b+6GShfBGbj/+LL0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXkOsyeLbsx4NpPQoo4bQ85Mt3evgp7U5CA7HkMoRLWVIUJxsU
 gC8W9PPEAg1gPG34j18W4V3WtXwaurdf2599p9G8c3cz4P95kEN5oCTeS+g9oeC9aIw=
X-Gm-Gg: ASbGnctG45kYb9JtqZoFZ4ut5dFFbemKD9rEcFuRQQGSnqx89dYDes/43lFj7WUpBK8
 bIxYTz10acLcB2ydPnzmdIi5L70LSV+z/vwsWpvIRPFS7VhimKNMv2YQp6RXnH6k6hxU5tR5tyM
 y5g7UzgGtcIYA7gDNpJa6IfJP3ZiIq4jFHDHtgYCGqlHmz0pEgFNYns5h7QqFRJ2IoXyDwHYMX1
 zoco87UwM8v21QyrphlcymJcPUFS6Lz9Oozr3SaAXzabfzrJzw/NaUSTUC0CCsiRsV/nxEPXSHs
 GkFAsWlZwYj3xO5nUmIp1H/CD0QwegFI7h1O9aLJqGQhgWtl9FszlSSu86yrKbs=
X-Google-Smtp-Source: AGHT+IEdl8eeFf7aJp3yaKtzoKAh6ceNn/qekzHSRC0NuzHU4sIrFSD+owbOXJVQKsMXXNVfTFyxWg==
X-Received: by 2002:a17:903:2c9:b0:234:d778:13fa with SMTP id
 d9443c01a7336-23601d13585mr206171875ad.26.1749517043866; 
 Mon, 09 Jun 2025 17:57:23 -0700 (PDT)
Received: from localhost ([122.172.81.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236037ae33dsm60076015ad.206.2025.06.09.17.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 17:57:23 -0700 (PDT)
Date: Tue, 10 Jun 2025 06:27:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: rafael@kernel.org, dakr@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, mcgrof@kernel.org, russ.weight@linux.dev,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 leitao@debian.org, gregkh@linuxfoundation.org,
 david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
 fujita.tomonori@gmail.com, tamird@gmail.com,
 igor.korotin.linux@gmail.com, walmeida@microsoft.com,
 anisse@astier.eu, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: module: remove deprecated author key
Message-ID: <20250610005717.kd32qk7jvrioyds3@vireshk-i7>
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609122200.179307-1-trintaeoitogc@gmail.com>
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

On 09-06-25, 09:22, Guilherme Giacomo Simoes wrote:
> Commit 38559da6afb2 ("rust: module: introduce `authors` key") introduced
> a new `authors` key to support multiple module authors, while keeping
> the old `author` key for backward compatibility.
> 
> Now that all in-tree modules have migrated to `authors`, remove:
> 1. The deprecated `author` key support from the module macro
> 2. Legacy `author` entries from remaining modules
> 
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs        | 2 +-
 
> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> index 94ed81644fe1..bdf4b844de42 100644
> --- a/drivers/cpufreq/rcpufreq_dt.rs
> +++ b/drivers/cpufreq/rcpufreq_dt.rs
> @@ -220,7 +220,7 @@ fn probe(
>  module_platform_driver! {
>      type: CPUFreqDTDriver,
>      name: "cpufreq-dt",
> -    author: "Viresh Kumar <viresh.kumar@linaro.org>",
> +    authors: ["Viresh Kumar <viresh.kumar@linaro.org>"],
>      description: "Generic CPUFreq DT driver",
>      license: "GPL v2",
>  }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
