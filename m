Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7BC3D15B6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841436EC03;
	Wed, 21 Jul 2021 17:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D094F6EC03
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:56:15 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id z9so2878737qkg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QcEOQT1kQoqA3mviD8Rd9pRAGego5zppJEfeNqRzIp4=;
 b=S/oEvj+Jib2aFF5a7uzAbFAEIdIabsTHecFSrbBbGAMDho4Q/U8/jbys9Dl2SpfLvq
 GYoVI9ztA5heEizubyLQ98D0r/tlj+rYpCcwIiCfo4vdG4Otbrlslz9Ob07GPNtuh5Hx
 wiNMWYMoBVrz9ZiwI6VOc+PGnpWKYlydHZZnmtPppoHLx7D6NRs8/+lMSXd0MBBkYDp/
 gTlGV6Ll9BriNj/Y6N1uFUoRtTvYNmmvpdpibdVX7oynRZ5ZiKv4TiyU77zQ3wTtlxLY
 vfJm8P7IC948Assydk2W27ULN8rV1ydqB9CQ1jQFHzYWqwoDjNoZXtZvhwz5eypm1zKh
 qa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QcEOQT1kQoqA3mviD8Rd9pRAGego5zppJEfeNqRzIp4=;
 b=PnN+CvrSi2ZKi4VdCJYSybP518PkcKdOlLe7hs4hs9S8RIkGjMI4Pr9C2VonCn4s3C
 hAuQPXFBSWWCwZoNcnggpwWINzegtdJ0o+RU1KHX9zcNZKUyytaRivRDRitMS6ux+Qas
 7B4n6TYP0sVcMvD3J21UL1HLowA395+p8CAFNmRMiXwzfGjpu2bkKa5sK5JxU+bqdapw
 iDBNTQ5ajGpi0NpapmAvITqcNBA1qdBAwCWsZA1NjQd9UnBtFQsnHqp7shXNF1COH3pe
 XXVX7NRCagWj/tI/MoqD7E9BtIM4pPIq2CsRquFvfCcorCH0uMCAY1QcfKgdL/MK14gh
 RgSg==
X-Gm-Message-State: AOAM531aOQ0k7FCYeT+GLoltjwrTncquSayQ/zPm/4tFIVPAt5AmwGJT
 DoDOL5dnUlofbYn67jbiGdOEVqcuyn9xdw==
X-Google-Smtp-Source: ABdhPJzZ6m++H+LaawkWeY2kU793ys2RMNwErbYX4cgWUn/tDVVYPTtjshAULyRzTZl+YFG20NHsFQ==
X-Received: by 2002:a37:a544:: with SMTP id o65mr35707898qke.68.1626890174944; 
 Wed, 21 Jul 2021 10:56:14 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id a5sm3391090qkf.88.2021.07.21.10.56.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:56:14 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 10/14] drm/print: Add drm_debug_category_printer
Date: Wed, 21 Jul 2021 13:55:17 -0400
Message-Id: <20210721175526.22020-11-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
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
Cc: Sean Paul <seanpaul@chromium.org>
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
index 2ea0ffd9c1ce..af31beeb82a1 100644
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

