Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A81A30CF49
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 23:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919DA6E9AF;
	Tue,  2 Feb 2021 22:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64DC6E9AF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 22:47:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id 7so22168122wrz.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 14:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+v0vg2fnbDBrh+mB3K50iAoAzes8ndW6HwyKew3BGCg=;
 b=qFM074ULg++C1bk1xnYqVZ6A0lgB7GUcNI7LFwYfbt/ktatPHhiZPtusZbpufYp+fu
 lO4IehOKSXIdTrNcGy53ycLqWV7KZBxxojonW1a7nZuPsYI90QrBh8dZXf9Y+HTHis/E
 HGRnbmVyCzlc6Qnta2NImsalxnl8AgSoM1xhyucZi8Raig6NMHXwTT0ayZPH6uuY4BeG
 Z6EaoQGteLCWX14ULpbhI2fxIBdNOgUMeIprrOsPajIPv+liJ7jMe9sytzru9PdaAgpj
 lAW660vNcpqEURB/jm84P2nbYDuoCMERzYXz3wPAPaH4ymDD1nywBW1P+c+0thQVcg+t
 Ghkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+v0vg2fnbDBrh+mB3K50iAoAzes8ndW6HwyKew3BGCg=;
 b=eJeyns0St1HnuDGlL++VUafl+Rn2bVO9ToZfJVMM9L3qW8F8QIep5XjYKtHIKx4HcE
 sfdSg4a/0zuDKLV1RF9WqL42xw3/a315k2nfYKC0SbFLInAkvyfvvSHAEp8sFwngpBC6
 2ebKNKm3XOS017S8n0v25S8tNHLz3SGzySdte+hlXuQDNIun0Cc1jZid1sO2B2tiJ2uC
 pu33iF+FvhGZZj7kShO8YB5SLpPwc625TwlATgoKmukjs/GRKnBgeila/RYpqpAVkhgU
 ymwXJ2fIW3KcJ5wMwY8cSj4P8/TTXkYfZUvheJSv19vNc4XMON/3Bd11YwuZTLrG82TI
 0r6Q==
X-Gm-Message-State: AOAM530H+2Eo9uOn6NBt+aWBGNkChPqkcw4XIrNVPHt+6EO2G46BWrbV
 xUSmsgCHBspq3jne8AgHWOkgLBYx7y6I3A==
X-Google-Smtp-Source: ABdhPJwWkG/znEncK5P51+vciEQR+F526QJtnP686+CkfwYAPQ6CJaiK8o+JKxb1HEuYEnJ/mC8ZjQ==
X-Received: by 2002:a05:6000:1189:: with SMTP id
 g9mr301641wrx.230.1612306032284; 
 Tue, 02 Feb 2021 14:47:12 -0800 (PST)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net.
 [82.24.248.100])
 by smtp.gmail.com with ESMTPSA id y83sm69915wmc.12.2021.02.02.14.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 14:47:11 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
Date: Tue,  2 Feb 2021 22:47:04 +0000
Message-Id: <20210202224704.2794318-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>, emil.l.velikov@gmail.com,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the drm_fourcc.h header depends on drm.h for __u32 and __u64.
At the same time drm.h pulls a lot of unneeded symbols.

Add new guard DRM_FOURCC_STANDALONE, which when set will use local
declaration of said symbols.

When used on linux - this is a trivial but only when building in strict c99
mode. One is welcome to ignore the warning, silence it or use c11. If neither
of the three is an option, then do _not_  set the new guard.

Cc: James Park <james.park@lagfreegames.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
As mentioned before - there's little point in having yet another header
since keeping those in sync has been a PITA in the past.
---
 include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 6f0628eb13a6..c1522902f6c9 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -24,7 +24,26 @@
 #ifndef DRM_FOURCC_H
 #define DRM_FOURCC_H
 
+/*
+ * Define DRM_FOURCC_STANDALONE you're interested only FOURCC and do not want
+ * to pull drm.h into your application.
+ */
+#ifdef DRM_FOURCC_STANDALONE
+#if defined(__linux__)
+
+#include <linux/types.h>
+
+#else /* One of the BSDs */
+
+#include <stdint.h>
+typedef uint32_t __u32;
+typedef uint64_t __u64;
+
+#endif /* __linux __ */
+
+#else
 #include "drm.h"
+#endif /* DRM_FOURCC_STANDALONE */
 
 #if defined(__cplusplus)
 extern "C" {
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
