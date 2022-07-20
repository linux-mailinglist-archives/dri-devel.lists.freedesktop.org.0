Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E6D57BA5C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE708F4CA;
	Wed, 20 Jul 2022 15:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67708F452;
 Wed, 20 Jul 2022 15:33:25 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id r70so13409667iod.10;
 Wed, 20 Jul 2022 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pbfKjW8s+yNblg/2VqulB1BrQZpCCy3wi5VbG9v1p9Y=;
 b=o32r4tJFgKSUOFwoLWC7z5OlcK3ssnISZS9CioxUmFMuQsjOydfrcvs9tNe3roJifX
 Jvbu5IQuN6DT4/llIA5t2hgdt1GBSX+Cno2yy6gFzqeaf3a5k8877sKe8qPODj71Grm6
 qKY3U3etTZ8Qr/nrDEl3ZU0IpKoL3MHL1AYBxpEIdSarBWKEATl/YeRlQj2xs9KTEa/1
 Z56kmd7wtKdpFqzWdrckIhfKSif3R8bARHCFP+q1HCmiOL2YcC5CkBfveD7nSG8FEDA9
 J3hFXMWWGlnV0oUk2Jp2bADkNj6qu/DtOMKNcPpKMJ1DyDJbG+uA02NmEMMHJbB5e811
 0j7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pbfKjW8s+yNblg/2VqulB1BrQZpCCy3wi5VbG9v1p9Y=;
 b=QHsyceW57Jc4oq71FWW4hiPs76u1djCQgO6LSlSBiF00jJTTHrbcqoEpktPW1yYhH4
 Jy9aIHsWv7zxXBg6bfazur+QmHlA2nQV4ti4OwvqCb9dWN4ME9p4IFsN6MZOD1ulPdUX
 hP6BBntFeUL4MbXdT5Qpqth23H1RokFqFgJ6bRYUKjjH1x6VrWIuCxlo8zlVCSc1kMXC
 HfvmWL3w9/u9HwjomxSB889gBOKTZ4nGIs4ninwDdrIekFjOV/S6iXEE06TXWgKJNgJs
 7ZGByxtucXk/VlsGS/LAurQIkdcdIPIXvvpcArWTmAymbjz+NUC2xf48CO7azsbAGxVT
 ch6Q==
X-Gm-Message-State: AJIora+pisQWsXWoB3IS7EQyYBWx8d3iKb47KX02AWxEvZeIFI+egdE9
 b1kIl+mZ30YsZxDWHkKLgri71xluSo89fw==
X-Google-Smtp-Source: AGRyM1tB3CTz3Fdl53ZZ6LAaNfhAcNKAJB9rD6NbJnUyDpParrGvyR8ECvEcAraD7Fq0UHGXY0O5EQ==
X-Received: by 2002:a05:6638:4115:b0:33f:8715:cb15 with SMTP id
 ay21-20020a056638411500b0033f8715cb15mr20018782jab.189.1658331204392; 
 Wed, 20 Jul 2022 08:33:24 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 25/41] drm-print: include dyndbg header indirectly
Date: Wed, 20 Jul 2022 09:32:17 -0600
Message-Id: <20220720153233.144129-26-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

lkp robot told me:

  >> drivers/gpu/drm/drm_ioc32.c:989:2:
  error: call to undeclared function '_dynamic_func_call_cls';
  ISO C99 and later do not support implicit function declarations
  [-Wimplicit-function-declaration]

           DRM_DEBUG("comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, %s\n",

Since that macro is defined in drm_print.h, include <dynamic_debug.h>
there too, so that any uses have the definitions of all the macros in
the callchain.

This is done as a separate patch mostly to see how lkp sorts it;
I'll probably squash it with HEAD~1

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 3aa5e9ea26f4..dfdd81c3287c 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -31,6 +31,7 @@
 #include <linux/seq_file.h>
 #include <linux/device.h>
 #include <linux/debugfs.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm.h>
 
-- 
2.36.1

