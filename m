Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0651866A33F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0882710EAF9;
	Fri, 13 Jan 2023 19:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE1010EAC2;
 Fri, 13 Jan 2023 19:30:52 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id o13so11219955ilc.7;
 Fri, 13 Jan 2023 11:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+F9kl44jma+M7h1pP8h2A8ZnugnYlmyHf4a+VRYvO4M=;
 b=nFsCAxBqzc8DAkq7Y0KR8/rtL94U2RDxMfUQBOss23pmYoJOp7id0p4gkP3JNRidrJ
 t9i08P+3SiU8MspP5AFQVH3ZNwImZO+f4rGsZBF6YGkyhk9IlaXq6aE7D4aTOdoOmpz8
 aAO+uzg+XjIcaGOLdEBy7s3XAI24dXhJb0FC/T3jr2K7Xa4EhCPhXsSwC4MzFSL3LLBT
 olAbPIIL2DzDALUCW5asOYZP0JE7apBNs+hciXcYwtxkpgl3oJa2kjSm5FHnWp9IZoS1
 OZGqDReT1Wh/D56NQ8dbol0ZsMm6XTl1nRNRGFpMc0YLoyxKs3kMttcI5CYcPP6U7VwV
 c9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+F9kl44jma+M7h1pP8h2A8ZnugnYlmyHf4a+VRYvO4M=;
 b=uVNHzuOxUNCEKSjU2fXfvNSFZ+eEMqdT6d2F367ISSME3qlbzYdTvZvCGS0uI62ywJ
 TFgT2zJfKXNmcry4q/ni794YWjzlwmpeCREEpSe5oMQinlPuRWQAyj/4L9WQpNFE28Bw
 iuXHvMc4TNn71OhRmpp8CUuYJb2h2+G0QgYbzYhGziAJtRN6PvRoEIOq8O6uuJzSpzHe
 ZDIxeQlm+Y9FUt4HCPcaHbDT6gG82tByurDUiWYhTZvEF8Xv80e9C2cKOIT6lX7O5UWd
 XhApyxX579xJp2IMtWOinfbNn+cxD7G3KJaCn6wXH+6BTxpP0FGV2ZRtLFjZa/1pT/Xc
 73/g==
X-Gm-Message-State: AFqh2koKvJbXlBHXig5L1eeccWeoTw8We2IUG/L1nzBwVsW2hUa8D0OY
 t5tpUTYJQAdw+1L6wLxO7hQ=
X-Google-Smtp-Source: AMrXdXsdczYM5PwWfO4hwAbHHjf0U0cvqxRknpww2NlHevVo41RRx9YbsfFXEX5Txlr07b+gR8gCVQ==
X-Received: by 2002:a92:ac06:0:b0:30c:2ed2:f8c4 with SMTP id
 r6-20020a92ac06000000b0030c2ed2f8c4mr32991854ilh.2.1673638251495; 
 Fri, 13 Jan 2023 11:30:51 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:30:51 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/20] dyndbg: constify ddebug_apply_class_bitmap args
Date: Fri, 13 Jan 2023 12:30:05 -0700
Message-Id: <20230113193016.749791-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113193016.749791-1-jim.cromie@gmail.com>
References: <20230113193016.749791-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ddebug_apply_class_bitmap() does not alter its 2 bitmap args, make
this guarantee in the interface.

NOTE: the bitmap is also available in the dcp arg, but the 2 vars
serve a 2nd purpose; the CLASS_TYPE callers use them to translate
levels into their underlying disjoint representation.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 10c29bc19901..b51f4bde6198 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -592,7 +592,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new bitmap to the sys-knob's current bit-state */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits, const unsigned long *old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
-- 
2.39.0

