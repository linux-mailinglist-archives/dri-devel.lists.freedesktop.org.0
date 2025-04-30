Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4115AA58C5
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 01:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB0B10E14D;
	Wed, 30 Apr 2025 23:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tft/RG+V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED81510E14D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 23:36:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 451F849FA3;
 Wed, 30 Apr 2025 23:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B85C4CEE7;
 Wed, 30 Apr 2025 23:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746056192;
 bh=36vVnkisvY+P4AlYmBbiWrdIm1AmGftJI8nb13UOMIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tft/RG+VvpzRbHBXNM4V2si4qStApdUywL7XwbOQKw+UciKGIoo3JMgdOGV/2G8Zz
 2Xhv7aCDX1IJrhQ+kUjsmIaH9gaQD8S0rT0AphmJr8rPnZBRImy83Q+FcR66mnutK7
 mL4pK/TnMgXXP5xW1h/ZS69KJAcQ8H1wZPSR5Y4CPtQtOPXUr+6xBCTz24rxeB7o93
 venh/5kFEPEtQIbFpzHZLgCTbTairBOSYiAfkkcVhIjasf9V3j2Hs3x6rfl2Vjb9v2
 5g2WwdlfiffavGYQ46gC6/eVYUEvOMfUK1QU4yFGMOTGZ66VZRixf7LcDoEDwT60Xq
 HqUIva96mxNWQ==
Date: Wed, 30 Apr 2025 20:36:29 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Thomas Richter <tmricht@linux.ibm.com>, Junhao He <hejunhao3@huawei.com>,
 Jean-Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Brendan Gregg <brendan@intel.com>, gabriel.munoz@intel.com,
 matthew.olson@intel.com, brandon.kammerdiener@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/4] Add support for a DRM tool like PMU
Message-ID: <aBKz_Tg-s20Qsv6k@x1>
References: <20250403202439.57791-1-irogers@google.com>
 <CAP-5=fXkayZ7pj+EctOtSBiTcGuyi6SHm9c5RZ3HyyPYcot9zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXkayZ7pj+EctOtSBiTcGuyi6SHm9c5RZ3HyyPYcot9zA@mail.gmail.com>
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

On Wed, Apr 30, 2025 at 08:21:59AM -0700, Ian Rogers wrote:
> On Thu, Apr 3, 2025 at 1:24 PM Ian Rogers <irogers@google.com> wrote:
> >
> > DRM clients expose information through usage stats as documented in
> > Documentation/gpu/drm-usage-stats.rst (available online at
> > https://docs.kernel.org/gpu/drm-usage-stats.html). Add a tool like
> > PMU, similar to the hwmon PMU, that exposes DRM information.

Looks useful, I'll try to review and test tomorrow, but most probably
Friday, as tomorrow is labour day in this part of the world.

- Arnaldo
 
> I'm reminded by Brendan Gregg's new blog:
> https://www.brendangregg.com/blog/2025-05-01/doom-gpu-flame-graphs.html
> that this is still outstanding. The patches also reduce some directory
> scanning for the hwmon "PMU", they are in Google's tree:
> https://github.com/googleprodkernel/linux-perf/blob/google_tools_master/tools/perf/util/drm_pmu.c
> 
> Thanks,
> Ian
> 
> > v3: Minor tweak to the test so the skip (exit 2) doesn't trigger the
> >     trap cleanup.
> >
> > v2: Add support to only scan hwmon and drm PMUs if the event or PMU
> > wildcard can match. Add a test as requested by Namhyung. Add file
> > comments.
> >
> > v1:
> > https://lore.kernel.org/lkml/20250211071727.364389-1-irogers@google.com/
> >
> > Ian Rogers (4):
> >   perf parse-events: Avoid scanning PMUs that can't contain events
> >   perf parse-events: Avoid scanning PMUs that can't match a wildcard
> >   perf drm_pmu: Add a tool like PMU to expose DRM information
> >   perf tests: Add a DRM PMU test
> >
> >  tools/perf/tests/shell/drm_pmu.sh |  78 ++++
> >  tools/perf/util/Build             |   1 +
> >  tools/perf/util/drm_pmu.c         | 689 ++++++++++++++++++++++++++++++
> >  tools/perf/util/drm_pmu.h         |  39 ++
> >  tools/perf/util/evsel.c           |   9 +
> >  tools/perf/util/parse-events.c    |  30 +-
> >  tools/perf/util/pmu.c             |  15 +
> >  tools/perf/util/pmu.h             |   4 +-
> >  tools/perf/util/pmus.c            | 101 ++++-
> >  tools/perf/util/pmus.h            |   2 +
> >  10 files changed, 952 insertions(+), 16 deletions(-)
> >  create mode 100755 tools/perf/tests/shell/drm_pmu.sh
> >  create mode 100644 tools/perf/util/drm_pmu.c
> >  create mode 100644 tools/perf/util/drm_pmu.h
> >
> > --
> > 2.49.0.504.g3bcea36a83-goog
> >
