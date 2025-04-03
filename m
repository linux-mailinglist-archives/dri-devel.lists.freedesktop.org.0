Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C570A7AE40
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 22:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C5710E278;
	Thu,  3 Apr 2025 20:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NN1uj31/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC71010E164
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 20:24:48 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-225505d1ca5so12123405ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 13:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1743711888; x=1744316688;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CRkNhQokk2FGmI6E6ywUdIUe2Ks9OEjNqCR63wcowWw=;
 b=NN1uj31/x0gz+N1KAVefE4G3PxRAOLzPWy0xhZnNt0Tvpliw6KXv2Jtqb5lcfi1TU0
 hnrgsWPshetzzpBPJf0fTKBqWgRRYvZEwMVS019wzzlgfmY06Hssv5RfoJyqL+PY/6Er
 33TlesZCwkG8KpRVjjs7GTrvjFTn9H4qu/9T+/YjVcw56Ls996Omp0G8vvMztOY9doqP
 8dnBlghOObWsJTJnese+Xt8tA1ZvHnjF7UGPGd+ZZFiuQ9VzDWtkO9+DTp+OtjE9IJSD
 /WU+Q26PQaB3kCe5dniYYcxMnWI/q4CNjrNPIX19ptpzvavLaNS7G1j7Tf76yFoxDTvq
 HivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743711888; x=1744316688;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CRkNhQokk2FGmI6E6ywUdIUe2Ks9OEjNqCR63wcowWw=;
 b=SZW5yOqCpiT7SuTmE/5SXQR93VT0+q9w/e3UaLpx6IXJP2KQe++fhQyeDC0CrtagAn
 mDcnK42b4VTWCQnhWDMOifKvT1S25cY169hfIustvXiI68OSlOdLeF6iawZi77goucJS
 aIi/ow2Kdi/cQ3FY5xDGYZktwu1hI0uWT0pWwP6KdrgtkC36jSiFZ3C8in6uCMnKnz+F
 msQ+A70dGDe8r0NRJwlSA32oXN7TDGPhmNE1E3cH1c8NK+GfrGl2dB2h8aP1RAZARPJX
 FO56McMt9vC6+NmpX0VkZG9/0jhWJJtP7s0oQpJ1V0a19ETBvkvlzvuvWoBLqwvfGhpX
 kVsQ==
X-Gm-Message-State: AOJu0YxvR415vpASY3Uf36DN8hsuZWDfAYQFPgnBqFMc2wV3crE3/gOr
 ynzbV/CUrwxlfSBZkB+rmVa8QJhzXrkpPuRRnB/cVh02VCbk/bXPKlpx933jmGHklfIS5rlAnwM
 h/mlXIA==
X-Google-Smtp-Source: AGHT+IHWDO/5M2fCSVHvmzRMrnuToohUfpuJh+UsPsfUghfHJeFXsbikUT0hXKvJp3jc7nt+shYR87GdY9k7
X-Received: from plri2.prod.google.com ([2002:a17:903:32c2:b0:220:efca:379c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:32c9:b0:220:ca39:d453
 with SMTP id d9443c01a7336-22a8a05e77amr5995565ad.17.1743711888439; Thu, 03
 Apr 2025 13:24:48 -0700 (PDT)
Date: Thu,  3 Apr 2025 13:24:35 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403202439.57791-1-irogers@google.com>
Subject: [PATCH v3 0/4] Add support for a DRM tool like PMU
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Kan Liang <kan.liang@linux.intel.com>, 
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>,
 Dominique Martinet <asmadeus@codewreck.org>, 
 Thomas Richter <tmricht@linux.ibm.com>, Junhao He <hejunhao3@huawei.com>, 
 Jean-Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

DRM clients expose information through usage stats as documented in
Documentation/gpu/drm-usage-stats.rst (available online at
https://docs.kernel.org/gpu/drm-usage-stats.html). Add a tool like
PMU, similar to the hwmon PMU, that exposes DRM information.

v3: Minor tweak to the test so the skip (exit 2) doesn't trigger the
    trap cleanup.

v2: Add support to only scan hwmon and drm PMUs if the event or PMU
wildcard can match. Add a test as requested by Namhyung. Add file
comments.

v1:
https://lore.kernel.org/lkml/20250211071727.364389-1-irogers@google.com/

Ian Rogers (4):
  perf parse-events: Avoid scanning PMUs that can't contain events
  perf parse-events: Avoid scanning PMUs that can't match a wildcard
  perf drm_pmu: Add a tool like PMU to expose DRM information
  perf tests: Add a DRM PMU test

 tools/perf/tests/shell/drm_pmu.sh |  78 ++++
 tools/perf/util/Build             |   1 +
 tools/perf/util/drm_pmu.c         | 689 ++++++++++++++++++++++++++++++
 tools/perf/util/drm_pmu.h         |  39 ++
 tools/perf/util/evsel.c           |   9 +
 tools/perf/util/parse-events.c    |  30 +-
 tools/perf/util/pmu.c             |  15 +
 tools/perf/util/pmu.h             |   4 +-
 tools/perf/util/pmus.c            | 101 ++++-
 tools/perf/util/pmus.h            |   2 +
 10 files changed, 952 insertions(+), 16 deletions(-)
 create mode 100755 tools/perf/tests/shell/drm_pmu.sh
 create mode 100644 tools/perf/util/drm_pmu.c
 create mode 100644 tools/perf/util/drm_pmu.h

-- 
2.49.0.504.g3bcea36a83-goog

