Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 887591A4492
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 11:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF8F6E0D0;
	Fri, 10 Apr 2020 09:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0766E261
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 19:52:04 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id g4so6140819qvo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 12:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ANUP3YZD262275//lsq8+uVDyv1HIJJWCv3ypaHwBe0=;
 b=GlLQA9JruJ0tDP/ebRypZKl/ikKfEo+JOM90JdeHPdeBOcNiPWMJwSr+1YolmG1PS+
 7BYyw1Z5icRcs2+3+zYkCpLVRyI5xw/37dDee8aasMTWGvfj9OwyQ1iZcCFzncHcAUXa
 FKmkv3176CI2m4sZUFc0SDaXmnL0cMN6cHmjCUgGgdxAkrwQ1SUtqGWeqOC3r5Bxm86G
 /CxxfmOPFgbBWu/m0gZe8ZAZhukFxLcThVq0BLH4htf0rI4KefXWDriScFhg0w4FdfsB
 bLX3tZSFEIVVfiow2ouIXVBo4E5sehfdl3M88t/3KVgUu0r5BV2nrxI9/Dk0IeQfT6yr
 SO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ANUP3YZD262275//lsq8+uVDyv1HIJJWCv3ypaHwBe0=;
 b=eiA76G519tgPZVcJ4/KVSzPeHLTfOsxR1LDi20Z+uqn/uYZ2q7rh2wOFlUofJJeUcu
 Ege3XtIc2M8+NhRU5vRb0giOpRozje4JfUQ5zA1mOvdeTpvpgFetkZ5HaLrZBhGhv6E7
 KSdH9II4o5vTjxA9chemLUQ4v830RBpaEOhotiM1yy1JS6WBCjBKwzMde0Cjv3/ySlrz
 gnLhVj0xHxpYbbUYbI0SWpM8n17r3PpodeIRDE0+EdzReFDvQG+460HI4TG6FDZomtEj
 JEg0BbVEfyw2iB3gFSIBwyi8d0whtgqSfZ65Q1esN6TBsFdkIa5m1Zsq2hknrVyuaQFq
 5C3A==
X-Gm-Message-State: AGi0PuYjsXLbxOlaqPbKVJipYoXE8o4WtHrkS2HQDneViXF+DhRstVwy
 73mhksxbmSC1YNJQJh5ktiJiDg==
X-Google-Smtp-Source: APiQypIARh6HRTAFS+noiNzYrXQBRkmIJ81vsg5CL3eyh6tX29IaEYqtTVgI116gGUn3k6ptFSFPOw==
X-Received: by 2002:a0c:8326:: with SMTP id j35mr1792441qva.205.1586461923828; 
 Thu, 09 Apr 2020 12:52:03 -0700 (PDT)
Received: from localhost.localdomain (135-23-249-169.cpe.pppoe.ca.
 [135.23.249.169])
 by smtp.gmail.com with ESMTPSA id 189sm19775200qko.123.2020.04.09.12.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 12:52:03 -0700 (PDT)
From: Aurabindo Pillai <mail@aurabindo.in>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm: dpcd: Print more useful information during error
Date: Thu,  9 Apr 2020 15:52:00 -0400
Message-Id: <20200409195200.5483-1-mail@aurabindo.in>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Apr 2020 09:45:19 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When DPCD access errors occur, knowing the register and request
associated with the error helps debugging, so print the
details in the debug message.

Signed-off-by: Aurabindo Pillai <mail@aurabindo.in>
---
 drivers/gpu/drm/drm_dp_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index a5364b519..545606aac 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -257,7 +257,9 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
 			err = ret;
 	}
 
-	DRM_DEBUG_KMS("Too many retries, giving up. First error: %d\n", err);
+	DRM_DEBUG_KMS("dpcd: Too many retries, giving up. First error: %d\t"
+		      "address: %x\trequest: %x\t size:%zu\n",
+		      err, msg.address, msg.request, msg.size);
 	ret = err;
 
 unlock:
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
