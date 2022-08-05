Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7A558B1CF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC10F10F97E;
	Fri,  5 Aug 2022 21:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2FA12AC3B;
 Fri,  5 Aug 2022 21:54:30 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id z145so2842471iof.9;
 Fri, 05 Aug 2022 14:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ip7G03GeGcrZkSaeVkjkXUMKYERuJTa3x3HVuceUBd4=;
 b=ewQ92O2vGpMAbSdWrB4+u6UhrXNZYJKTGukr+8UZtGaGb4+w6CiksOOQTQn87WyyNX
 wo5Df7zH9JxqD9apdFkTFusfidPasfZsOIm6pyx9X5xz5MkMkiQceQcD8+OrEsEe9RhS
 A/pMGk4fpmKBVUtxm/I+JRb9MVVLji8813bHcb+yg0LTm70CM2NjO4WqYWyNMS0o5FVo
 fB7O4+WYEYPDWxjM7LUXepooHEFyr8/yW8cCxEcb7t4T8DscS66q6XO7tWCER3eaMdwf
 DqJwCvy/6DcnFsXqXNmeL59eC/DLc4Qh/dr4dPn+9I8WggKs2QIEWX10y8x0RJXsd1Bm
 L2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ip7G03GeGcrZkSaeVkjkXUMKYERuJTa3x3HVuceUBd4=;
 b=Ko/tlfU5WzQMtZrGvg+Ytbh7JJUL3h2Uw9ytuIvBD8Kl1tnY4JuVCq/19BPj1domLt
 VyxYotFXtzn/ujJin56K+b1mOPn8jKcaLHKmn4BcS+IwNB8LbA1p7eO65/ugmN7HDYFB
 z9IdWNnnrk+1OLoMdQSQ3ksVgkmnw8a6yC+dWcZEFj8oUFc89VnkBhGOFJfzpmbXZX2g
 +l7o5Z6659/UjcEemKR/V7UC9+QmbFzS36X4YhCIEU4K1UhXJw94Ejgrky2rC5lheTZG
 TVTvxhJn5mJs3T2hYnJ9fuZTllOfthkGxyBDRSIEoxuWzffqpoRsmWwuQrh448byJHyX
 3sVg==
X-Gm-Message-State: ACgBeo3+zQpMLfFgKAyAqvjkTzibZ7xt+7uJ/tb1mV0D0pvEgk/Gymfi
 ggs4ybEM47zGGQpUca41Wz4=
X-Google-Smtp-Source: AA6agR5F2b8YYYl6aGI+QseCk+8Ms4jeiO8wtWEfnF2wD77In7NaA/BOIIRV1TpkHi0h0b1ACEo2YQ==
X-Received: by 2002:a05:6638:4982:b0:342:39e0:1d44 with SMTP id
 cv2-20020a056638498200b0034239e01d44mr3814986jab.213.1659736468516; 
 Fri, 05 Aug 2022 14:54:28 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 07/33] dyndbg: let query-modname override actual module name
Date: Fri,  5 Aug 2022 15:53:29 -0600
Message-Id: <20220805215355.3509287-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dyndbg's control-parser: ddebug_parse_query(), requires that search
terms: module, func, file, lineno, are used only once in a query; a
thing cannot be named both foo and bar.

The cited commit added an overriding module modname, taken from the
module loader, which is authoritative.  So it set query.module 1st,
which disallowed its use in the query-string.

But now, its useful to allow a module-load to enable classes across a
whole (or part of) a subsystem at once.

  # enable (dynamic-debug in) drm only
  modprobe drm dyndbg="class DRM_UT_CORE +p"

  # get drm_helper too
  modprobe drm dyndbg="class DRM_UT_CORE module drm* +p"

  # get everything that knows DRM_UT_CORE
  modprobe drm dyndbg="class DRM_UT_CORE module * +p"

  # also for boot-args:
  drm.dyndbg="class DRM_UT_CORE module * +p"

So convert the override into a default, by filling it only when/after
the query-string omitted the module.

NB: the query class FOO handling is forthcoming.

Fixes: 8e59b5cfb9a6 dynamic_debug: add modname arg to exec_query callchain
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Acked-by: Jason Baron <jbaron@akamai.com>
---
 lib/dynamic_debug.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e5cbe603000c..5a849716220a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -385,10 +385,6 @@ static int ddebug_parse_query(char *words[], int nwords,
 		return -EINVAL;
 	}
 
-	if (modname)
-		/* support $modname.dyndbg=<multiple queries> */
-		query->module = modname;
-
 	for (i = 0; i < nwords; i += 2) {
 		char *keyword = words[i];
 		char *arg = words[i+1];
@@ -429,6 +425,13 @@ static int ddebug_parse_query(char *words[], int nwords,
 		if (rc)
 			return rc;
 	}
+	if (!query->module && modname)
+		/*
+		 * support $modname.dyndbg=<multiple queries>, when
+		 * not given in the query itself
+		 */
+		query->module = modname;
+
 	vpr_info_dq(query, "parsed");
 	return 0;
 }
-- 
2.37.1

