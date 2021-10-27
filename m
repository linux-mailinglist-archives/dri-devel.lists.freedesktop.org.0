Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB5E43C1BE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 06:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42196E5A0;
	Wed, 27 Oct 2021 04:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1FB89850;
 Wed, 27 Oct 2021 04:37:27 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id v65so2107516ioe.5;
 Tue, 26 Oct 2021 21:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cnTkeK8v67eIBs3PS2euQVCRKMfmRbTWdl+Z44hl+ec=;
 b=hyLsn00WTLCJL4GvOmE2kxDub5BpxRbKWLIpyTkYZF2eqFHzXTbv7M4KAij+kGcq8w
 Gz7Q6kF3P+6u6t3A5bB/VzAdsm9ralmjQ8B41BWntNLNmeJH/AHDWkq+Ej/m+8lWmPb/
 Hd/yO7Edb3UcphCFdVM451GH/37X6CyTP6+c7p8/Rx5hOrApcbqSekYfE2APXIclkST2
 scGa8LjGdR29jtDvfvPpH8HR2bJpt9C4R7l3/Rx31ItRrHnCWjjK1vXLw8EvjPAyHIKh
 StLJ2ShUBrrYetUf3emdR/NQuFRm1rrCiY1qRs6FGXfqiWMbNVGy5H6hv/CW5Pt5Eake
 gi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cnTkeK8v67eIBs3PS2euQVCRKMfmRbTWdl+Z44hl+ec=;
 b=2Pa7ZuPG6N7ByWvqxH7jDo/7spva2YHEBQBej0TzsJxC8SOEhdfsQYczQ1NEfUTEqt
 BADFrArsW1qq7jmujbysTmFLQcCmMzNuVS4xwEv2uKjaOiZcQVvNTSS9+srpzp+kk9L2
 fP5mrjyNRyncqM8a+W+40AdX4j/cUgDcCDwhWeWpBssDOkzAagL6QgWJijkInQ8heu49
 ihIEDGoWcgPnX7uPbzlG1hVGyZeFRcZMGV3hGQX4ie6XCbmmCtvPohcAng9wlooq6dfT
 7XO0UrRo1dIg8l2T/gDXiOwLP2Il5wa5Tx0gIMkvqaLutjq1OH59vnuRpq/IRa4kepSq
 00Bw==
X-Gm-Message-State: AOAM530f4WyfLLnvGC8RvTDsPMrPbebOaOYvro43dMVExrzX/FBH2e3D
 L54bRJuR6oEm0XS7nk1Uxcw=
X-Google-Smtp-Source: ABdhPJxOL3av75apCy1NaSeSnBdOn/HBQSzgvyFqXTBntJL0EsDlcBUuZ+4BzU72oZQOjVlVp6bO2w==
X-Received: by 2002:a05:6638:d90:: with SMTP id
 l16mr18388899jaj.36.1635309447330; 
 Tue, 26 Oct 2021 21:37:27 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a15sm2030404ilj.81.2021.10.26.21.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:37:27 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 10/10] drm: use DEFINE_DYNAMIC_DEBUG_TRACE_CATEGORIES
 bitmap to tracefs
Date: Tue, 26 Oct 2021 22:36:45 -0600
Message-Id: <20211027043645.153133-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027043645.153133-1-jim.cromie@gmail.com>
References: <20211027043645.153133-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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

Use new macro to create a sysfs control bitmap knob to control
print-to-trace in: /sys/module/drm/parameters/trace

todo: reconsider this api, ie a single macro expecting both debug &
trace terms (2 each), followed by a single description and the
bitmap-spec::

Good: declares bitmap once for both interfaces

Bad: arg-type/count handling (expecting 4 args) is ugly,
     especially preceding the bitmap-init var-args.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index ce662d0f339b..7b49fbc5e21d 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -73,6 +73,25 @@ DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug, __drm_debug,
 				[7] = { DRM_DBG_CAT_LEASE },
 				[8] = { DRM_DBG_CAT_DP },
 				[9] = { DRM_DBG_CAT_DRMRES });
+
+#ifdef CONFIG_TRACING
+unsigned long __drm_trace;
+EXPORT_SYMBOL(__drm_trace);
+DEFINE_DYNAMIC_DEBUG_TRACE_CATEGORIES(trace, __drm_trace,
+				      DRM_DEBUG_DESC,
+				      [0] = { DRM_DBG_CAT_CORE },
+				      [1] = { DRM_DBG_CAT_DRIVER },
+				      [2] = { DRM_DBG_CAT_KMS },
+				      [3] = { DRM_DBG_CAT_PRIME },
+				      [4] = { DRM_DBG_CAT_ATOMIC },
+				      [5] = { DRM_DBG_CAT_VBL },
+				      [6] = { DRM_DBG_CAT_STATE },
+				      [7] = { DRM_DBG_CAT_LEASE },
+				      [8] = { DRM_DBG_CAT_DP },
+				      [9] = { DRM_DBG_CAT_DRMRES });
+
+struct trace_array *trace_arr;
+#endif
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
-- 
2.31.1

