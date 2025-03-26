Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AB9A70FAA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 04:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB9E10E310;
	Wed, 26 Mar 2025 03:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3uG3sukg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1DE10E310
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 03:51:15 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-2ff62f96b10so852361a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1742961070; x=1743565870;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=VDGbOYIOj15E+JsmdSzGj6CuNWcI9S7Zmd8zr8fj0vs=;
 b=3uG3sukgAOA3914ej7NdlXnssEZm33KHXsNdsGC0RT43YCoDCZXeDaTMs5HP+mWkBE
 y2PiljjK3oIxEV0tImFfF44VC7XBEkgUeiy+9BuBc2On4LxhzBf5EZW1kootKySMjvyh
 OQZGiOb8Xw+UgeUSbj2z0+CPe/4ciwj5Thtvqa2H+0hcHFGfFFzOa9IrMlYhEOfpHelO
 x3kodCzMFNeR8jR07KfGBOXHly/+ek4R/jh5KDGqRVgrjqw86fMBIinK2tjsCvZtDmZ6
 T1dxbrqc5AgNiOcX5LoG8uzUHNz7VQ5uaWQ0wWix1AgE24sLP4FDwYisUFYrkmZnLuIK
 Cwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742961070; x=1743565870;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VDGbOYIOj15E+JsmdSzGj6CuNWcI9S7Zmd8zr8fj0vs=;
 b=vrvV/qtJ1FQTAycvcRpNN7fQ2CNJPNReUErZHfTYIAtlDQII2L8CNfrWFmJr1MVsNj
 HJVKD3V+ijJ3hYPwBmcgHz3L011Oh9cZ4MbZEVcx0iKv0mWsxuFCw/a4O8HGmkopuyuF
 d48fYAJo661QZKjCt4vAh8VXH7eML2V/yOh+9VzRDMGp1rNGDHFMCrAl86AdYW2oHjcg
 kcORSWNWh13c0rWX5R6lx4eCq/sjSWgfdRQAF6aTEIWFxheOm78yVAnrYZE0FNWcu5JH
 Gxf30dK+wKddfXmr7UmPT8TBfPVxZhBFDtwbn0NcSEdK2P4mBKFCuqR2LFsTGxxU5ICb
 OR3w==
X-Gm-Message-State: AOJu0YztyaN10WsnWgd2MNWp7NTUsyQNXFTQQOzdVs7LOu8fWFUYretz
 M/JoZlXqmE/el9VfDZ4+/kdQ5apsVjrhwFiHbpsOYPUSNnU27+3zedwWnrD9hoXwyCpgJuRPNct
 XnpWDfg==
X-Google-Smtp-Source: AGHT+IGG8kf/JIk38ELOkHk95ox9JB8hK5eqE/sVI+IvZADNpn7vVcFc/26jk3ntBtqUIe/wSk//NLgpdJV8
X-Received: from pgnn25.prod.google.com ([2002:a05:6a02:4f19:b0:af2:2c5c:55e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:32a3:b0:1ee:ba29:d8fa
 with SMTP id adf61e73a8af0-1fe9380d489mr3594205637.6.1742961070224; Tue, 25
 Mar 2025 20:51:10 -0700 (PDT)
Date: Tue, 25 Mar 2025 20:50:43 -0700
In-Reply-To: <20250326035045.129440-1-irogers@google.com>
Mime-Version: 1.0
References: <20250326035045.129440-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250326035045.129440-3-irogers@google.com>
Subject: [PATCH v2 2/4] perf parse-events: Avoid scanning PMUs that can't
 match a wildcard
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

Add perf_pmus__scan_matching_wildcard that only reads sysfs for pmus
that could wildcard match. For example, if searching for the event
'inst_retired.any/period=1000000/' first 'inst_retired.any' will try
to be directly looked up as a PMU, then 'inst_retired.any' will try to
be wildcard matched against all PMUs, finally it is assumed
'inst_retired.any' is an event name and opened on all PMUs avoiding
reading PMUs that can't have such an event. However, before this patch
such a case would read all PMUs for the wildcard matching. Now if the
wildcard can't be a hwmon PMU wildcard, reading hwmon PMUs is
avoided. On my laptop this reduces 'perf stat -e inst_retired.any
true' from performing 253 openat system calls down to 234.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 26 +++++++++++----------
 tools/perf/util/pmus.c         | 42 ++++++++++++++++++++++++++++++++++
 tools/perf/util/pmus.h         |  1 +
 3 files changed, 57 insertions(+), 12 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index d77af1d24985..19caf1ed9f5d 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1664,18 +1664,20 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
 
 	pmu = NULL;
 	/* Failed to add, try wildcard expansion of event_or_pmu as a PMU name. */
-	while ((pmu = perf_pmus__scan(pmu)) != NULL) {
-		if (!parse_events__filter_pmu(parse_state, pmu) &&
-		    perf_pmu__wildcard_match(pmu, event_or_pmu)) {
-			bool auto_merge_stats = perf_pmu__auto_merge_stats(pmu);
-
-			if (!parse_events_add_pmu(parse_state, *listp, pmu,
-						  const_parsed_terms,
-						  auto_merge_stats,
-						  /*alternate_hw_config=*/PERF_COUNT_HW_MAX)) {
-				ok++;
-				parse_state->wild_card_pmus = true;
-			}
+	while ((pmu = perf_pmus__scan_matching_wildcard(pmu, event_or_pmu)) != NULL) {
+		bool auto_merge_stats;
+
+		if (parse_events__filter_pmu(parse_state, pmu))
+			continue;
+
+		auto_merge_stats = perf_pmu__auto_merge_stats(pmu);
+
+		if (!parse_events_add_pmu(parse_state, *listp, pmu,
+					  const_parsed_terms,
+					  auto_merge_stats,
+					  /*alternate_hw_config=*/PERF_COUNT_HW_MAX)) {
+			ok++;
+			parse_state->wild_card_pmus = true;
 		}
 	}
 	if (ok)
diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
index f2706c395509..93d5db1c89b4 100644
--- a/tools/perf/util/pmus.c
+++ b/tools/perf/util/pmus.c
@@ -19,6 +19,7 @@
 #include "tool_pmu.h"
 #include "print-events.h"
 #include "strbuf.h"
+#include "string2.h"
 
 /*
  * core_pmus:  A PMU belongs to core_pmus if it's name is "cpu" or it's sysfs
@@ -385,6 +386,47 @@ struct perf_pmu *perf_pmus__scan_for_event(struct perf_pmu *pmu, const char *eve
 	return NULL;
 }
 
+struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu, const char *wildcard)
+{
+	bool use_core_pmus = !pmu || pmu->is_core;
+
+	if (!pmu) {
+		/*
+		 * Core PMUs, other sysfs PMUs and tool PMU can have any name or
+		 * aren't wother optimizing for.
+		 */
+		unsigned int to_read_pmus =  PERF_TOOL_PMU_TYPE_PE_CORE_MASK |
+			PERF_TOOL_PMU_TYPE_PE_OTHER_MASK |
+			PERF_TOOL_PMU_TYPE_TOOL_MASK;
+
+		/*
+		 * Hwmon PMUs have an alias from a sysfs name like hwmon0,
+		 * hwmon1, etc. or have a name of hwmon_<name>. They therefore
+		 * can only have a wildcard match if the wildcard begins with
+		 * "hwmon".
+		 */
+		if (strisglob(wildcard) ||
+		    (strlen(wildcard) >= 5 && strncmp("hwmon", wildcard, 5) == 0))
+			to_read_pmus |= PERF_TOOL_PMU_TYPE_HWMON_MASK;
+
+		pmu_read_sysfs(to_read_pmus);
+		pmu = list_prepare_entry(pmu, &core_pmus, list);
+	}
+	if (use_core_pmus) {
+		list_for_each_entry_continue(pmu, &core_pmus, list) {
+			if (perf_pmu__wildcard_match(pmu, wildcard))
+				return pmu;
+		}
+		pmu = NULL;
+		pmu = list_prepare_entry(pmu, &other_pmus, list);
+	}
+	list_for_each_entry_continue(pmu, &other_pmus, list) {
+		if (perf_pmu__wildcard_match(pmu, wildcard))
+			return pmu;
+	}
+	return NULL;
+}
+
 static struct perf_pmu *perf_pmus__scan_skip_duplicates(struct perf_pmu *pmu)
 {
 	bool use_core_pmus = !pmu || pmu->is_core;
diff --git a/tools/perf/util/pmus.h b/tools/perf/util/pmus.h
index 213ee65306d6..2794d8c3a466 100644
--- a/tools/perf/util/pmus.h
+++ b/tools/perf/util/pmus.h
@@ -20,6 +20,7 @@ struct perf_pmu *perf_pmus__find_by_type(unsigned int type);
 struct perf_pmu *perf_pmus__scan(struct perf_pmu *pmu);
 struct perf_pmu *perf_pmus__scan_core(struct perf_pmu *pmu);
 struct perf_pmu *perf_pmus__scan_for_event(struct perf_pmu *pmu, const char *event);
+struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu, const char *wildcard);
 
 const struct perf_pmu *perf_pmus__pmu_for_pmu_filter(const char *str);
 
-- 
2.49.0.395.g12beb8f557-goog

