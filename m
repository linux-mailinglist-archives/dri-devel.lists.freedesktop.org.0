Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31DAAEA48D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 19:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D9810E2E2;
	Thu, 26 Jun 2025 17:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f+wvCNnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E268C10E2E2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 17:41:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6E67B437ED;
 Thu, 26 Jun 2025 17:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C58C4CEEB;
 Thu, 26 Jun 2025 17:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750959684;
 bh=S6yftzTqRreb6fAcsiDFpqgkyKzzCrY4x9xkT5qRdAE=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=f+wvCNnDxZnMfL4t5xJrhaHFIFXkT3kpv0KYndklYVer3aGfR6xE3EpRZ/w0+i/Ul
 lA2pWMoSp5cxy3iX47Gdi71d3+QQ3eEWNTUKEpb7JKbvASIBEchLwmzW/Pe7D+WZeS
 3fF7tn/+QugOAL25vISKeqVudoaLnNIuM72FRCluyK2VwwO6SHd6+BEieSbdrLp1w5
 dACCXN8o6/QXJ9g/mHQUI3jTyvnOEg8MXfLBmiMnxRfk3eP1hD5hkpsxUnlIJvdgsA
 LqyDPHxjMy/zKqIIy2LabC7sL517UbRFMNNthx9/d51zmVI5ASmKuTRNaD6E5pb0gx
 J2HbJPKuISeIQ==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Kan Liang <kan.liang@linux.intel.com>, 
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
 James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Thomas Richter <tmricht@linux.ibm.com>, Junhao He <hejunhao3@huawei.com>, 
 Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, 
 matthew.olson@intel.com, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Ian Rogers <irogers@google.com>
In-Reply-To: <20250624231837.179536-1-irogers@google.com>
References: <20250624231837.179536-1-irogers@google.com>
Subject: Re: [PATCH v4 0/3] Add support for a DRM tool like PMU
Message-Id: <175095968371.2045399.16176878639226540053.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 10:41:23 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
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

On Tue, 24 Jun 2025 16:18:34 -0700, Ian Rogers wrote:
> DRM clients expose information through usage stats as documented in
> Documentation/gpu/drm-usage-stats.rst (available online at
> https://docs.kernel.org/gpu/drm-usage-stats.html). Add a tool like
> PMU, similar to the hwmon PMU, that exposes DRM information.
> 
> v4: Rebase over changes like the auto merge stat to first wildcard PMU
>     change and the clean up of tool PMU initialization.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung


