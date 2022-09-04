Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAE15AC743
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A3710E300;
	Sun,  4 Sep 2022 21:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401C010E204;
 Sun,  4 Sep 2022 21:42:38 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id r141so5678554iod.4;
 Sun, 04 Sep 2022 14:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=0Id8r2vYLmajWhF+0Lsomg5sSzhIk/Fv798x/2NCQJ8=;
 b=nMgcsqv10t0jNSou/ChM9aj4Oe2Z78Qyt3lMIFBuZ+lquITOKuL5RF792lnxd7UxJ8
 qpp+DhMKR6rD8Oc8zSCbZeoe0h9QjbpOO0YVftf9vHqXoRe8XPNetD5weW3YMiDh/hpz
 X9RMWx9bzPZKcOgMLConc2T+c/6pPJAtaa/JQl2Ee4JRD9rij46vnjQIlGRlSmKUKYKq
 Bepfrnuvr4KbA0CMM4R2ttIK4x2CvNrggANC7Rg2YtNXHsSx94pjtZ8bFBhm7X0MlxoT
 SxodpVFGmtdB1b6dU/Q2eNKDiZA6RGYLKeiZvHON/fhARPCby/xRuXS2G7hj7UBtB+21
 GNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0Id8r2vYLmajWhF+0Lsomg5sSzhIk/Fv798x/2NCQJ8=;
 b=BFmNrREv3OArjjjh/9NJbXnXe0OvKPtip9LGTGm5VGeQQsf54RgLu9DXg8A3arjGxF
 W01Y7rw7pRfxuhNN2twxQcg91RvbOyIeJSiEnmAwWTd4sE8m4DDNmbNeDW9fH6tCIFi7
 hKBFkCgVhomLbhHY5vkAPq9hJ5iNpy/6JhyVu1lkc1+tQuVkrjnX7DHa9NWEulEFrh/0
 UtVNZPNTK6iKzF8OhE5bkr0Bpgn72itgy0JB29GqCiKXKia+UcdQsxo0ecLZQNXs5n7Q
 5r67A9xGIARFw29RtWtTdb1Y1aK7PpvodwBtgOJRmE1EkcXQvFwFAGsxSO+zZU7aB5Z4
 FJcw==
X-Gm-Message-State: ACgBeo1Ut+FLT86HoWnRLtXpkBTFqVIv980CL9aoOlL5KXPj5c2A0VGO
 p3pMuDrzzR0W4FtJNg5btxo=
X-Google-Smtp-Source: AA6agR6b4AaEEfOSIKL24Lu0tIv0q3qOCsBl00MyhLWPv9u8tITL7jjngdAbr9/9HEHOPy1kJLcPuw==
X-Received: by 2002:a02:cc76:0:b0:34c:13cf:efc9 with SMTP id
 j22-20020a02cc76000000b0034c13cfefc9mr10073340jaq.152.1662327757907; 
 Sun, 04 Sep 2022 14:42:37 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 29/57] drm_print: prefer bare printk KERN_DEBUG on generic
 fn
Date: Sun,  4 Sep 2022 15:41:06 -0600
Message-Id: <20220904214134.408619-30-jim.cromie@gmail.com>
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

drm_print.c calls pr_debug() just once, from __drm_printfn_debug(),
which is a generic/service fn.  The callsite is compile-time enabled
by DEBUG in both DYNAMIC_DEBUG=y/n builds.

For dyndbg builds, reverting this callsite back to bare printk is
correcting a few anti-features:

1- callsite is generic, serves multiple drm users.
   it is soft-wired on currently by #define DEBUG
   could accidentally: #> echo -p > /proc/dynamic_debug/control

2- optional "decorations" by dyndbg are unhelpful/misleading here,
   they describe only the generic site, not end users

IOW, 1,2 are unhelpful at best, and possibly confusing.

reverting yields a nominal data and text shrink:

   text    data     bss     dec     hex filename
 462583   36604   54592 553779   87333 /kernel/drivers/gpu/drm/drm.ko
 462515   36532   54592 553639   872a7 -dirty/kernel/drivers/gpu/drm/drm.ko

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index cb203d63b286..ec477c44a784 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -23,8 +23,6 @@
  * Rob Clark <robdclark@gmail.com>
  */
 
-#define DEBUG /* for pr_debug() */
-
 #include <linux/stdarg.h>
 
 #include <linux/io.h>
@@ -185,7 +183,8 @@ EXPORT_SYMBOL(__drm_printfn_info);
 
 void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf)
 {
-	pr_debug("%s %pV", p->prefix, vaf);
+	/* pr_debug callsite decorations are unhelpful here */
+	printk(KERN_DEBUG "%s %pV", p->prefix, vaf);
 }
 EXPORT_SYMBOL(__drm_printfn_debug);
 
-- 
2.37.2

