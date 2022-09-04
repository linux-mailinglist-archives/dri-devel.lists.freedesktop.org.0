Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34DC5AC7D5
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB1A10EA58;
	Sun,  4 Sep 2022 21:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3709110E2C3;
 Sun,  4 Sep 2022 21:43:04 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id s11so3868449ilt.7;
 Sun, 04 Sep 2022 14:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=enn6xVuYphe+hXVPoV5iWIYr1g8ASji6MTEr9zuj34c=;
 b=MHZ+j5vq+DgcrRYUNssA/mQhOIh3IuE7Zq+aUJb41YdzWZC9PSDSIhOvEQ3TdCICX5
 WTCvmLp7RobRHWpiQpug9Ise55wiJ4uYADB3QCMYatUnEHE8Jziwms0gNLdJzSy1SzKa
 weVrPvvMaJPWqT6SfVFtUwOQv+sOyCuhrhi/oJW7xApjkbYa3ldckzG68imOVm76KV+m
 Xwjrlq1ZQVkjBcKsJbOYdKGeSdp/d/LglobU+D8HgN3Kz9AvMJF9xfzvrS0x23RcYOMb
 o7tMHOwXqEMULGc4tCi168zLZkAoPrmdiBkQzY7FRbs0xD1GH/Ij8ZhWMXzT0upfwrl7
 rC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=enn6xVuYphe+hXVPoV5iWIYr1g8ASji6MTEr9zuj34c=;
 b=YHy/g+p4i+dySmaQIpudLQT8jHEWUwQdRGMJ9Rxtj8TUOKM68ir+5lr1OnpZh3Gmlu
 kAg6Bjgw4diVEJ6qZZNd9Rxu/A//N0+npAke+aBU6+KWSseUv146e+WfTEVhl6QQc01p
 /fj9QLyqy9R9IkQTGMOnTjtAJ+y4nl2DggTri6C6+L9TFkOzapnJki5ZEu6iZ2AasQru
 E6Sw4QJ9zZbJ8Rwe7pkHvi9m5XY591t5Zu/vUtgahtUm3r1YTySattbOcRDxHGixEkbT
 737UVIR2542eI5B8RynC7wmk0Z0jUuQVD7y10apkqqGweNKG4ZbLxf36MrglBJaGqdHs
 uJrA==
X-Gm-Message-State: ACgBeo0FwgrrrTn3ThrQH3cTq68/RwlSKiqLwpImHmCXZRGGWW0dlsNz
 miNXYcdNqxAJ0b79cR4TTD4=
X-Google-Smtp-Source: AA6agR5YpuT8Q9JQCumSZI1qIIDzfmGUPYBDoLNXJiZ6x9bW2LfTNC3WN5DzbhXOp2lE4bQ4o8fKCA==
X-Received: by 2002:a05:6e02:1605:b0:2ed:be80:59ae with SMTP id
 t5-20020a056e02160500b002edbe8059aemr7558764ilu.319.1662327783877; 
 Sun, 04 Sep 2022 14:43:03 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:43:03 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 56/57] dyndbg: work ddebug_map_site
Date: Sun,  4 Sep 2022 15:41:33 -0600
Message-Id: <20220904214134.408619-57-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

attempt container-of, broken, missing use of uplink... took that out.

ptr computations are naive, and wrong.

Deeper prob is lack of _ddebug_vec, with header and descs in same struct.
maybe.

builtin_state looks right in debugger
---
 lib/dynamic_debug.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 194367bc13fb..11fea1f818a7 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -173,8 +173,25 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	return NULL;
 }
 
-static inline struct _ddebug_site * _ddebug_map_site(const struct _ddebug *desc)
+/*
+ * mapping from desc to site is multi-step:
+ * - _index back to &descs[0]
+ * - container-of to get header struct above
+ * - ._uplink field, pointing to _ddebug_info (for builtins, loadables)
+ * - di->sites[desc->_map]
+ */
+static struct _ddebug_site * _ddebug_map_site(const struct _ddebug *desc)
 {
+	struct _ddebug_info *di;
+	struct _ddebug const *d0 = desc - desc->_index * sizeof(struct _ddebug);
+
+	di = (struct _ddebug_info *) d0;
+
+	v3pr_info("map_site idx:%d map:%d %s.%s  di:%px site:%px ds:%px\n",
+		  desc->_index, desc->_map,
+		  desc->site->_modname, desc->site->_function,
+		  di, desc->site, &di->sites[desc->_map]);
+
 	return desc->site;
 }
 #define _desc_field(desc, _fld)	(desc ? (_ddebug_map_site(desc)->_fld) : "_na_")
@@ -866,7 +883,7 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 	return buf;
 }
 
-static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
+char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
 {
 	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_ANY))
 		return __dynamic_emit_prefix(desc, buf);
-- 
2.37.2

