Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D062A7AE3F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 22:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD07110E164;
	Thu,  3 Apr 2025 20:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LcGBSLa+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11C710E278
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 20:24:50 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-2ff854a2541so1207992a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 13:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1743711890; x=1744316690;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pil1LeiyQzc9Wfedi7qRLX2THzbN1bSqcXBycZBxx3E=;
 b=LcGBSLa+3/JohHuf4GzKUw6d2qdi4ito6j6BiP//uttPCLn6o0XgWDde2r2ZYNyh9W
 G2fN3HljeRUWUWi/qzeiI2tS1IQs8gay1IT4gHYlKzXgtsw7Kei463DqbkO08LtRRh5h
 brd5o2ejIubSWMI6z0uG2at5JeW4cbapZYPzYBP50UGQbdSju4r6gDVlnVHEo+vQo0v/
 oXC+GY6Rn8KndLZwqw8hfIA7KcuSt+0Yx5MVoR3je7MOq6X2MFnRpqe6pG5462Hy1daE
 TVaB8ouEB73BYWZvz3M26MOfPVLWX/btlz7eIKWMpezD4c+Dx2eaEgIibHOMD4dJCtqM
 Bs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743711890; x=1744316690;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pil1LeiyQzc9Wfedi7qRLX2THzbN1bSqcXBycZBxx3E=;
 b=Rrb+KdABZTJaLo2y76zOvsek+sEcEOUuABWp/8aZf0AnaE0ZeJupXwDR5R2bkxT8nw
 vRgqxbbdiddn62qf/NxHmELrPylIMmnny67rb+X4NvF1WbCmSMnney7nybHtMQ6NbAXz
 +unOb7sLnIg52PYQu3W9FgB/TVdq2JovVCtqE8y8GeSeJxXfnmoujEI2P+Kdh3lmQkJF
 ZRkIqOBDliNRcfJZaYlaaUAWsLADGpOzBakWAfFypif/nRoic/Mu4O2r1SDJiNBFzITL
 Ur0eFo+DoiVh2VttYVqiXXhZTDYP8DMt8DYk4CiqH42GWkPyMupk4cBn7d2nRNZltfAW
 0Oyg==
X-Gm-Message-State: AOJu0Yy1X41ilsBQTxAutmQ3DpEglM75PmpGaZTddhDwxq3PZRDNzw3p
 Xr5h+N5GGpcWpwNe8CDGRPxezACWUTEUeWi2T/kqbCL9Le/1tyAmwtF4ZQ2xAJhhuYznH+MCGKm
 scJpXUw==
X-Google-Smtp-Source: AGHT+IHECJgbaJYB5gyuhkerty/z5QcoT9YXQkYlH1mJyNC2bK+Z2YOQrOHG9csQbYSvdr6YjtqHqs0SwrVx
X-Received: from pjg12.prod.google.com ([2002:a17:90b:3f4c:b0:301:1bf5:2efc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:51cc:b0:2fa:1e3e:9be5
 with SMTP id 98e67ed59e1d1-306a4757ff7mr1693465a91.0.1743711890504; Thu, 03
 Apr 2025 13:24:50 -0700 (PDT)
Date: Thu,  3 Apr 2025 13:24:36 -0700
In-Reply-To: <20250403202439.57791-1-irogers@google.com>
Mime-Version: 1.0
References: <20250403202439.57791-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403202439.57791-2-irogers@google.com>
Subject: [PATCH v3 1/4] perf parse-events: Avoid scanning PMUs that can't
 contain events
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

Add perf_pmus__scan_for_event that only reads sysfs for pmus that
could contain a given event.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c |  4 ++--
 tools/perf/util/pmus.c         | 35 ++++++++++++++++++++++++++++++++++
 tools/perf/util/pmus.h         |  1 +
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 5152fd5a6ead..d77af1d24985 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -434,7 +434,7 @@ int parse_events_add_cache(struct list_head *list, int *idx, const char *name,
 	const char *config_name = get_config_name(parsed_terms);
 	const char *metric_id = get_config_metric_id(parsed_terms);
 
-	while ((pmu = perf_pmus__scan(pmu)) != NULL) {
+	while ((pmu = perf_pmus__scan_for_event(pmu, name)) != NULL) {
 		LIST_HEAD(config_terms);
 		struct perf_event_attr attr;
 		int ret;
@@ -1585,7 +1585,7 @@ int parse_events_multi_pmu_add(struct parse_events_state *parse_state,
 
 	INIT_LIST_HEAD(list);
 
-	while ((pmu = perf_pmus__scan(pmu)) != NULL) {
+	while ((pmu = perf_pmus__scan_for_event(pmu, event_name)) != NULL) {
 		bool auto_merge_stats;
 
 		if (parse_events__filter_pmu(parse_state, pmu))
diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
index b99292de7669..f2706c395509 100644
--- a/tools/perf/util/pmus.c
+++ b/tools/perf/util/pmus.c
@@ -350,6 +350,41 @@ struct perf_pmu *perf_pmus__scan_core(struct perf_pmu *pmu)
 	return NULL;
 }
 
+struct perf_pmu *perf_pmus__scan_for_event(struct perf_pmu *pmu, const char *event)
+{
+	bool use_core_pmus = !pmu || pmu->is_core;
+
+	if (!pmu) {
+		/* Hwmon filename values that aren't used. */
+		enum hwmon_type type;
+		int number;
+		/*
+		 * Core PMUs, other sysfs PMUs and tool PMU can take all event
+		 * types or aren't wother optimizing for.
+		 */
+		unsigned int to_read_pmus =  PERF_TOOL_PMU_TYPE_PE_CORE_MASK |
+			PERF_TOOL_PMU_TYPE_PE_OTHER_MASK |
+			PERF_TOOL_PMU_TYPE_TOOL_MASK;
+
+		/* Could the event be a hwmon event? */
+		if (parse_hwmon_filename(event, &type, &number, /*item=*/NULL, /*alarm=*/NULL))
+			to_read_pmus |= PERF_TOOL_PMU_TYPE_HWMON_MASK;
+
+		pmu_read_sysfs(to_read_pmus);
+		pmu = list_prepare_entry(pmu, &core_pmus, list);
+	}
+	if (use_core_pmus) {
+		list_for_each_entry_continue(pmu, &core_pmus, list)
+			return pmu;
+
+		pmu = NULL;
+		pmu = list_prepare_entry(pmu, &other_pmus, list);
+	}
+	list_for_each_entry_continue(pmu, &other_pmus, list)
+		return pmu;
+	return NULL;
+}
+
 static struct perf_pmu *perf_pmus__scan_skip_duplicates(struct perf_pmu *pmu)
 {
 	bool use_core_pmus = !pmu || pmu->is_core;
diff --git a/tools/perf/util/pmus.h b/tools/perf/util/pmus.h
index 8def20e615ad..213ee65306d6 100644
--- a/tools/perf/util/pmus.h
+++ b/tools/perf/util/pmus.h
@@ -19,6 +19,7 @@ struct perf_pmu *perf_pmus__find_by_type(unsigned int type);
 
 struct perf_pmu *perf_pmus__scan(struct perf_pmu *pmu);
 struct perf_pmu *perf_pmus__scan_core(struct perf_pmu *pmu);
+struct perf_pmu *perf_pmus__scan_for_event(struct perf_pmu *pmu, const char *event);
 
 const struct perf_pmu *perf_pmus__pmu_for_pmu_filter(const char *str);
 
-- 
2.49.0.504.g3bcea36a83-goog

