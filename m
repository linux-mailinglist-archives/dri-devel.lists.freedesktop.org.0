Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726157BA4E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302998F51A;
	Wed, 20 Jul 2022 15:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E21E8F42E;
 Wed, 20 Jul 2022 15:33:29 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id v1so5831781ilg.4;
 Wed, 20 Jul 2022 08:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNKkCgLqEI2boDLpZwejJXZn34G9kSTsspfFnsYp3v8=;
 b=fPXmbKLVj6sd3Rl6v/FP9ACdjwbbyyM5C58a4BuD6kJfihZgU8a0/6TUAi+purgcyW
 aXo+zsOzhQu/FqRwKDB7ekBxd8efYNKIwHBXOL2WVviT2zRrz+YRtl38Jno3GVz0/Gj4
 KQJTu1J0wwMB+7+bAQUZXCGE0lM8PjgzaXcJkE0I6LLQm3aEiHrZzDQIZIB8XtXk6/G5
 R3SEXdmZtcEie/RBVinlb+StrNyobbDDBIqi9GUY6NaTBmTcWvNmLtLQNGcr10CK3OVY
 Q4USP8xJHEGqEstuHwQTfDXdZ2rONMNtF+1xc5LzxtH7mFL00ApjQyocE0yMc7MWzZzp
 ftCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNKkCgLqEI2boDLpZwejJXZn34G9kSTsspfFnsYp3v8=;
 b=vn7eExtkTNRk/TuDdD44hOhNOgFyoNf4KJ9wdkEI4wiER7nMx0lDVg96RVGm6ElL5T
 9tzKIs9V+c0XVYmTHMPxOCOWXkGy3W9jhr7SQmnMUHfH+U5PvUAJ/22IpOcNCDW8w2+5
 swUAnR4oZdwOmFdDGtkzPdVG5sYR/Q9gEYKAmPZ2xkACasGvqQ2Yqakmxmv4Cwao7d4f
 VWa6rqb0zBkfMgQ5HIxw2CKQN0A/2OW5n7T+P/EUAxMlwHPlIry4YnEuB3E8AwjN4O1v
 ZP6l9ldcS+lMH2DaqyTLtNY1Dj+q4Ago4jLGOR2HSQ3miHpwa1lj95yd1or2p3u+ZQTl
 JHkA==
X-Gm-Message-State: AJIora8w1Pdgnm+UxthKHkC9m2yWSW63OwkiKVkwDQ/arqKOKReHxzqG
 azUmuvMEhtWFgNxuH69QM0T//Q1dMHEncw==
X-Google-Smtp-Source: AGRyM1uc5RIU6uMLg1JdTORETHn7tJ5LThV8xarABZP+cochEvseCKBW8m9RSsexUeky5GDYsIVjyQ==
X-Received: by 2002:a92:d14f:0:b0:2dd:12a:f93c with SMTP id
 t15-20020a92d14f000000b002dd012af93cmr4000142ilg.121.1658331208155; 
 Wed, 20 Jul 2022 08:33:28 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:27 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 29/41] nouveau: change nvkm_debug/trace to use dev_dbg POC
Date: Wed, 20 Jul 2022 09:32:21 -0600
Message-Id: <20220720153233.144129-30-jim.cromie@gmail.com>
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

These 2 macros formerly used dev_info, and they still check
subdev->debug to gate the printing.  So dyndbg control is redundant
ATM (and possibly confusing, since its off by default).

prdbg count is up from 3, or from 65 (with VMM_DEBUG here)

[    7.765379] dyndbg: 516 debug prints in module nouveau

Its possible to control error, warn, info callsites too, but they're
usually on, and the .data overheads on ~450 more callsites (56 bytes
each) would just be wasted.

$ for l in fatal error warn info debug trace spam; do
      echo $l; ack nvkm_$l drivers/gpu |wc; done
fatal
      3      19     335
error
    289    1956   30651
warn
     84     513    8860
info
     14      88    1502
debug
    387    2339   40844
trace
     31     219    3368
spam
      1       7     123

bash-5.1# echo $(( 516-65-387-31-1 ))
32

Thats approximate; not accounting #defines and doc/comment mentions.

NOTE: this patch changes the log-level of the macro-issued messages
from KERN_INFO to KERN_DEBUG.  Adding a .kern_lvl field to struct
_ddebug could fix that.

RFC: dyndbg & subdev->debug

Separate class-maps for each subdev are possible; except for the
coordinated use of _base, each is independent, including choice of
DISJOINT or LEVELS, as long as class-names don't conflict.
So theres some flexibility.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
index 96113c8bee8c..065d07ccea87 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
@@ -59,8 +59,8 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
 #define nvkm_error(s,f,a...) nvkm_printk((s), ERROR,    err, f, ##a)
 #define nvkm_warn(s,f,a...)  nvkm_printk((s),  WARN, notice, f, ##a)
 #define nvkm_info(s,f,a...)  nvkm_printk((s),  INFO,   info, f, ##a)
-#define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,   info, f, ##a)
-#define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,   info, f, ##a)
+#define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,    dbg, f, ##a)
+#define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,    dbg, f, ##a)
 #define nvkm_spam(s,f,a...)  nvkm_printk((s),  SPAM,    dbg, f, ##a)
 
 #define nvkm_error_ratelimited(s,f,a...) nvkm_printk((s), ERROR, err_ratelimited, f, ##a)
-- 
2.36.1

