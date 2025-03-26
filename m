Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787BAA70FA7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 04:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4114E10E2AE;
	Wed, 26 Mar 2025 03:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LlDtjzNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E3410E2AC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 03:51:08 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-225107fbdc7so107906405ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1742961068; x=1743565868;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=uCVS+DhgJOLHYroH5VuWGGnd2W5CTNd7YHsjO54Adcw=;
 b=LlDtjzNFHqDktgMReCb8uiRtZvTMqwTplH4mbY3IBQ0wTCTzhHurdz4uneplD8om5q
 824dQvWTUzwxwSzRIDDILL0NFsicxTC9irXYBXHts3Am2cVWVxOeQU9xkDxmV6w3mzor
 KZPz2RBb/zsNjkrk3Qy15NO09YDnovQMT8I4KoUEap7+Q7QkaDMWhsr2DCkhS8UcnRY5
 A2RGMmuGoETB/hZ9LZi8PNHP3wHc/gB/Vl+kJUbfM/oPg27kt/P9XgSOsHoKkLtXkMKO
 XolaeNezDBFYEt8KbSgVQXwbDJm1tGoqkTj6JbNbc/QC8kMl95AuCxwl+OruxQmQKsCW
 ulcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742961068; x=1743565868;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uCVS+DhgJOLHYroH5VuWGGnd2W5CTNd7YHsjO54Adcw=;
 b=CY7Qiorm62QStasEKQ0PVMg5+JS2r9N+/12mdq7EpyoPT9jTxJIivGdGibNBVg28qQ
 zcX1h6oS8wuztJaMi53HE5uCIHTWCKd378ecBMbQe8wvIDUzzTyyZqvR+kFOADZOAn4B
 Cq5iDAnXJuH5W4ISOBtSr8cbe+qT9Q6g0rsJnuUbvwjw8dQ/u7AmL5BAm90W9vfXruK4
 6vXLj27nqHaN/2i0z2YVpMlyuwAk6i89PycQicRgXQYKM53R28HCTwb3TidnIbhDmN3O
 mkBzTRC3StiIiI5EQDmL+qZGvbfpaWUE/ZXpvAh8d1R2CWWXayuL6ajFbnyWp5RkvqKG
 CqeQ==
X-Gm-Message-State: AOJu0YxoiUSiJAGydI3fBdDSIvhBSbeDBnEZbdE5sfwjnDDsvLclcsjF
 /oUF9LUy9EJuRZZqHZwxJn6ptI7jzdw+wbQhTxu3YCE552LZwg5inSmn7GugXdKHoCwi0U3Ahfa
 VsyGIAQ==
X-Google-Smtp-Source: AGHT+IFVfYoE7t8L3UJr15qQGlHKncIQsy7nPhLY5dK19DZs1BWjoNZ2pWij3AjrrsHCyI9ogBO2Nzy6GO4k
X-Received: from pfiy3.prod.google.com ([2002:a05:6a00:1903:b0:736:8727:67fd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:80e:b0:736:6279:ca25
 with SMTP id d2e1a72fcca58-73905a27ae5mr34688941b3a.24.1742961067760; Tue, 25
 Mar 2025 20:51:07 -0700 (PDT)
Date: Tue, 25 Mar 2025 20:50:42 -0700
In-Reply-To: <20250326035045.129440-1-irogers@google.com>
Mime-Version: 1.0
References: <20250326035045.129440-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250326035045.129440-2-irogers@google.com>
Subject: [PATCH v2 1/4] perf parse-events: Avoid scanning PMUs that can't
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
2.49.0.395.g12beb8f557-goog

