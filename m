Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4733EA70FA5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 04:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A37010E2AC;
	Wed, 26 Mar 2025 03:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="S+gjSPNJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAE910E2AC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 03:51:06 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2242ce15cc3so102757465ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1742961065; x=1743565865;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Q4SBEUeVaxUtokJPIUYjJGAnoRWPInWE392dc3Q7SjQ=;
 b=S+gjSPNJbusENb0n6kyfJQGSyTjr5otXuPr1Yw7u4cKngqE/OU7SEW45j6mEh9N4Dh
 pHTnTvGHJf4izYSXh4nvBRRTn+ytKTfPzZvS/dXvZO/OVaIXwoUHO/RZLAz+hSSM2kqT
 osnjHTQWPpP/enVsflPODOOX/8I6t+2Vr+cWxPeBxt8ZqH/aUFvF6HnuYWKnfgLfqal0
 sQQ2c18OdEz3Uy/In0gR6wU6EV9kMBlX3rwrlAu+tOCYTA5jb3W1QLOmUzTTITBjiu/D
 CBeOapF9Ha0z/kiYnx4dP1PvzE4VVZ3lvaF+d8NmtSU6srXOtif7e4Al/s3dPVBfoMML
 UuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742961065; x=1743565865;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q4SBEUeVaxUtokJPIUYjJGAnoRWPInWE392dc3Q7SjQ=;
 b=iMLRXPBPJDGL2c+mwnAtGFoJdOImt/NODJyzk0LcSgvm+94BOOlhLCLrrpRs8kkX1E
 /YEJLN60A04FF0+F3HyT80Zx6y1kGZcy2kPqAmcV7qrD57USeVHiHLWJVWMjIW09Annh
 uyEbliUgevTbyU31+3MUX/6laC3sQMLjuwCA9MUNjoxgEAjSnAc9Nf0DaJPmBnT9lbfa
 OmuGhmhzO1KrgduEWJmlAM2KSsdoPpddG1wYoRyUVBCzRGDugpdNo1m6UHOi/PLcWmrc
 BDcUwI2Ibz4rV1AQtOezRy9LfEVB70u+ehwyVMX6W7QWoBZozhj6U6NFRM+u+6qMnSRD
 Zx5w==
X-Gm-Message-State: AOJu0YwF5Zo5Y49ul+HVCusdPJe3fqsir4/SRECVyxOixdg3O4Dr8OFu
 LJAigP2rTs0dVWWG9NxeES1+1vZNbsjTbQpxX3Ws4SO7ohCi62cO4QswId+dWWDkmYmyIYQnRNx
 ltTKINw==
X-Google-Smtp-Source: AGHT+IFX6TAUq+5C9170e0/iEjt+LX7tYFuOYRqyp7uoH5Mv47EnjgV63qQG1LlVmvC8atTnWkrS5Orlfjl2
X-Received: from pffk14.prod.google.com ([2002:aa7:88ce:0:b0:730:8e17:ed13])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4602:b0:739:56c2:b661
 with SMTP id d2e1a72fcca58-73956c2b9efmr534037b3a.12.1742961065431; Tue, 25
 Mar 2025 20:51:05 -0700 (PDT)
Date: Tue, 25 Mar 2025 20:50:41 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250326035045.129440-1-irogers@google.com>
Subject: [PATCH v2 0/4] Add support for a DRM tool like PMU
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

 tools/perf/tests/shell/drm_pmu.sh |  77 ++++
 tools/perf/util/Build             |   1 +
 tools/perf/util/drm_pmu.c         | 689 ++++++++++++++++++++++++++++++
 tools/perf/util/drm_pmu.h         |  39 ++
 tools/perf/util/evsel.c           |   9 +
 tools/perf/util/parse-events.c    |  30 +-
 tools/perf/util/pmu.c             |  15 +
 tools/perf/util/pmu.h             |   4 +-
 tools/perf/util/pmus.c            | 101 ++++-
 tools/perf/util/pmus.h            |   2 +
 10 files changed, 951 insertions(+), 16 deletions(-)
 create mode 100755 tools/perf/tests/shell/drm_pmu.sh
 create mode 100644 tools/perf/util/drm_pmu.c
 create mode 100644 tools/perf/util/drm_pmu.h

-- 
2.49.0.395.g12beb8f557-goog

