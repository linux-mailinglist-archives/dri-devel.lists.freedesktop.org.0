Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED11F1F213C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 23:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053686E9A9;
	Mon,  8 Jun 2020 21:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E804B6E9A9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 21:06:29 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id n11so18787965qkn.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 14:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+4eAil2vbzPgh8HMO5NSPqggdk/Dns1MKOIFp4gwtAo=;
 b=FZRYWUXLHCX9QJX5pad1zCddLAV/UnhUw/3GRHpEmxoS5YrX798Kgdab+2m5siPFor
 KxEyzT+Nojroi8W4EW61vvvwVG/UCl0gd/jkLJ4Trz0v3zjKkDkBnKbEsQs+W3Emu18G
 9UsXm/bWEZhvTVgTbDNCG4pqcmllYnytxjpVxn8t2p111Q9MCMUjlrlioQUSITlDBsoZ
 tZcs6str9sz5aQhbtO8LxODwebjJ5f45E7xmGkC2Gdt5yzTqyxeFnWor8FGd5KY/U/8e
 1d2S/b7DFqQPIepQbyO6s0QBTJ+y/j3TIeE4JK+DkmWX+dDjFbyvrEXnFinRebX0PGvC
 vaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+4eAil2vbzPgh8HMO5NSPqggdk/Dns1MKOIFp4gwtAo=;
 b=mvnpoyQDh12jZ1+YxUbkxTsx8JoBrESYTa3OHPquII012Bg8GBXa4mbmbMijMSMbTJ
 iPJUmWP/shW/6HUWJhbUOlG6aHd00dorb9SJdpe9N18F0n+PkO7FgaiQilBasgvKOILv
 w3pbI95X5XucaVCAiY1jeq1Doln/6w+C5IQ3eikIl1m7hX9s2J455Y2PdIvKMF00L4DI
 g+9I90QZlEIyi4bbUEW1iuSajVoXZDIETVxupHxXsKWKZpZuL1LVoZa97c32zDVm3TEc
 WzSXgNNiIoTU4/cj06ERghx59Ftj+ujR2KfeR6qeaMrXuiPbOLlGcPYAMjhqx4+2qL3h
 QDHA==
X-Gm-Message-State: AOAM530JAP6mo8gfrqwShx4WP1kRbQNwcirAyzmCh9D1JTLl0bacc+Z/
 kvhwloNoYgMRJn5tMr8PNgSrMQx0UsI=
X-Google-Smtp-Source: ABdhPJxtrMm6SsgROad05hoRuTmB9pmY1k0QiYFORzEoPpbZiN9kc5l6fdFvvM+cDxw40lQyzI1Fag==
X-Received: by 2002:a37:62c7:: with SMTP id
 w190mr24812445qkb.154.1591650388821; 
 Mon, 08 Jun 2020 14:06:28 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id x4sm8832970qtj.43.2020.06.08.14.06.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:06:28 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 10/13] drm/print: Add drm_debug_category_printer
Date: Mon,  8 Jun 2020 17:05:00 -0400
Message-Id: <20200608210505.48519-11-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>, tzimmermann@suse.de
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

Changes in v5:
-Added to the set
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
