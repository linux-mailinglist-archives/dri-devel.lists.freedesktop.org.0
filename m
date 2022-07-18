Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FE4577B8A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142A0A9D73;
	Mon, 18 Jul 2022 06:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3428EA9CFF;
 Mon, 18 Jul 2022 06:38:59 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id l11so3423475ilf.11;
 Sun, 17 Jul 2022 23:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNKkCgLqEI2boDLpZwejJXZn34G9kSTsspfFnsYp3v8=;
 b=f6zFN6Umb7nMIsHnUKwzMhBfisretFaPNg0JUT6/0LOFSYuNDK28/Gz/ZIbzFpsMas
 aPJkfzenaM5yFTaQWKPVtAturlb8fYIL1IYNrborqt/PhldU+WLT7CHqsmV92e6qhuFy
 XL02hwNLFj6wmt+xjActNV2WUakrkE3cBZFfk1A0mncJlfP+gWj5it3ducuaNQ0PjgPA
 fznjx9GJ64jkfsuS4F5pYXXPmd9drkMSy3vYuDK5UGe9HQiREcIno5rg9YcDnw9XfREy
 IWOsTDBOKNqlXTvLGkwz+EAs3B9Hp4SV+bpaahTWSd2Ba261Pnp4kKOWzlMqBSZ2VTHO
 /EZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNKkCgLqEI2boDLpZwejJXZn34G9kSTsspfFnsYp3v8=;
 b=WCAQ8GfIMC4ZBCWa4bIZtS8ZlbGon1okHmddANo5cmF76vJXMby1grrFvB9zR6IFK8
 Ucnlw96gIa8GcS8oRRjYUG1co5+h5WCZooYA9BaFw8XN1/3S63zKd5BDswxsgxrr5DsI
 mWLGjlFoDiAuoPZn4W8zKvzOYa7ZdTDVjw894XBKHeOE8jVWgjfHDFdAKUzVlBpmAAgH
 yCBm4tXeIjuNoNZPuZfiZ++upFQBRDKBVrIh0v5yMsUwRKQ0NEAxce7MMSDS5Pvi+xk/
 BeQNYsFk9CtEMqqzLpDGNSh+IC+4mL+QkjfXNDmZFPHW4l10b1sVko7OK0Q4tJH2BIOy
 Qqkg==
X-Gm-Message-State: AJIora+pV7Duk7pLXcTNf3khyUrSFOGekIgTO5ZPKWEF5NCwDZ9UHayX
 kKzh/Nm1k6EXBu1yTYpgvP3Djc3xsVc=
X-Google-Smtp-Source: AGRyM1umw4/M6WoA0rHRuJgiPK7rQx3PC/2YIBkwbI2peNRoeKORmC3jRJQtj048WTHeTsje1YYEKw==
X-Received: by 2002:a05:6e02:1686:b0:2dc:7a0a:2f81 with SMTP id
 f6-20020a056e02168600b002dc7a0a2f81mr13082301ila.8.1658126338817; 
 Sun, 17 Jul 2022 23:38:58 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 28/39] nouveau: change nvkm_debug/trace to use dev_dbg POC
Date: Mon, 18 Jul 2022 00:36:17 -0600
Message-Id: <20220718063641.9179-34-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

