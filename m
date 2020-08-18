Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE51248FE4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41776E179;
	Tue, 18 Aug 2020 21:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A416E160
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:36 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so16232884qtp.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YrA4VD7LMt7jGVDFOfcic96wsSZTFB7F/vjDjkwUjIo=;
 b=LVeVX+1FDqwo3Eapc/1wcVZmMH3yxfGsPsSpjAyyGsddAFR7OxOZEvBIRGHPoSdxf/
 GdsDMYnjBRtQmLpK71URDZbBISYHDBD9C3u+5JJxDOU80ODDUNAot/GPhRCQlRh7vcrq
 KkGyHvPEBFADaAXIGrZwoOWAeD+6aP45rQpp5rwxsopCXzng1AMJ1b/9iOaRWDHI+zrF
 3IHPhvnvCa2wOvrj8YjNX77Y0WoPWwHczV6pLT78jioBPLi9/enlj8ge20XvGUKYY88I
 V5+bmSkvG+nqxDv7WSJoUM3uYop6c5NvkxEYZQVba5K8jWkjJ01e0uCnR7bDwjrNM16q
 uWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YrA4VD7LMt7jGVDFOfcic96wsSZTFB7F/vjDjkwUjIo=;
 b=r0iHdFYJ3g54L84l9Oomg2yrf9z9bsQoQrjkJ8hzzqPRgHIECNAAVBi/3uhSAXcuZk
 vitLeZIna8fyYVVqfYNZj1WCKpiufnnlmKAV9Odcnu+iqOxchSSAU87CHv1AjEUtaK0F
 EC3nU71qo/uj6ouBuVZm+S8hdcFs72qIZRw19m+tNELGefNa61Sm71rcq9sVSRqVBF1i
 HadPdAf/yzT7FNX5obWAD8KYUYyVjx/4T05oEqTwYyxO9gQbcTeHJqYGnngSvtnpa+e5
 RcQ4p+jk1WcXH0gfqPURMmKvHyqSLlk+DSkEGn6lvG26AD9lXdwM2gFiTTF2wB36zaJo
 ilgg==
X-Gm-Message-State: AOAM533JO/3AuoPIVavm1PP0vr9dUxZ+yltGKsOXrRMxo0EuGt9EKdLU
 dtdDoF4t5NYyQBDdayJRtYK1MO1v2WT4tg==
X-Google-Smtp-Source: ABdhPJw5tlCftPr/03lVYNUHKagjgmyNNCOhlgK5OlL4fczrhFOAEBP+hSdfPsKcv/8pfNs2hqPZ9w==
X-Received: by 2002:ac8:65d3:: with SMTP id t19mr19722915qto.193.1597784734984; 
 Tue, 18 Aug 2020 14:05:34 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id n23sm21993546qkk.105.2020.08.18.14.05.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:34 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 10/14] drm/print: Add drm_debug_category_printer
Date: Tue, 18 Aug 2020 17:05:06 -0400
Message-Id: <20200818210510.49730-11-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818210510.49730-1-sean@poorly.run>
References: <20200818210510.49730-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch adds a new printer which will select the appropriate output
for a given debug category. Currently there is only one output target,
which is syslog. However in the future we'll have tracefs and it will be
useful to print to syslog, tracefs, or both. Drivers just need to create
the printer for the appropriate category and the printer will decide
where to send the output.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-11-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/drm_print.c |  5 +++++
 include/drm/drm_print.h     | 28 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 2ff7a6ecc632..4d984a01b3a3 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -172,6 +172,11 @@ void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
 }
 EXPORT_SYMBOL(__drm_printfn_err);
 
+void __drm_printfn_noop(struct drm_printer *p, struct va_format *vaf)
+{
+}
+EXPORT_SYMBOL(__drm_printfn_noop);
+
 /**
  * drm_puts - print a const string to a &drm_printer stream
  * @p: the &drm printer
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index ce7675bf0d2b..8987b98bbfda 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -87,6 +87,7 @@ void __drm_puts_seq_file(struct drm_printer *p, const char *str);
 void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
 void __drm_printfn_debug_syslog(struct drm_printer *p, struct va_format *vaf);
 void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
+void __drm_printfn_noop(struct drm_printer *p, struct va_format *vaf);
 
 __printf(2, 3)
 void drm_printf(struct drm_printer *p, const char *f, ...);
@@ -329,6 +330,33 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
 	return drm_debug_syslog_enabled(category);
 }
 
+/**
+ * drm_debug_category_printer - construct a &drm_printer that outputs to
+ * pr_debug() if enabled for the given category.
+ * @category: the DRM_UT_* message category this message belongs to
+ * @prefix: trace output prefix
+ *
+ * RETURNS:
+ * The &drm_printer object
+ */
+static inline struct drm_printer
+drm_debug_category_printer(enum drm_debug_category category,
+			   const char *prefix)
+{
+	struct drm_printer p = {
+		.prefix = prefix
+	};
+
+	if (drm_debug_syslog_enabled(category)) {
+		p.printfn = __drm_printfn_debug_syslog;
+	} else {
+		WARN(1, "Debug category %d is inactive.", category);
+		p.printfn = __drm_printfn_noop;
+	}
+
+	return p;
+}
+
 /*
  * struct device based logging
  *
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
