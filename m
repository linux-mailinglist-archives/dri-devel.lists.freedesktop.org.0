Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EB3577B84
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0098AA9D5B;
	Mon, 18 Jul 2022 06:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE91A9D3C;
 Mon, 18 Jul 2022 06:39:01 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id l24so8517329ion.13;
 Sun, 17 Jul 2022 23:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNKkCgLqEI2boDLpZwejJXZn34G9kSTsspfFnsYp3v8=;
 b=DIj3HQKCERamyW4ZrDjIQWrt/bzE1N7TE75YEZkym3e6iM9t8HXiqi172/nGPIPCQv
 lfFXDTX70ooYcSPYywhqmHnTV1ZofDK+Xgx6+7e3miicgfOMiARBsok3iM9YnYHDpZcA
 KLKAckgBcLrQQu3n8p4cbNhALuTlnz1ly94iQEl4DopPLqjDPxXvcRroDxkKAfluGlKr
 Rca7CmSgdz9Hp94G0pxDQLMlI/A3HcRi3P5DlcGTvefQXc2TXRyhsMllt03ETDu87ozz
 QzN4iSGWjD0m1yihq4SdWNuM0SPPdpL2oMBh8/TOyIJvGDa3Tvce9r2Ywk9l8HBSO8jk
 lr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNKkCgLqEI2boDLpZwejJXZn34G9kSTsspfFnsYp3v8=;
 b=m0gyz0+Gs23zeMIb8R7mjsOlv4DzINGjBW+XZaB6i6EAV3b1kIMXoDWGvb1yC3+k+e
 12dSYfpSoclnBbrReQdYfSJNtu6HTpzuxuvDrq97m3nq+86dqaMgOi8h8KJc4v0WrXRA
 VXzusNgrNoZmHMO2LbMD504esGz/Jxv6BhEz24mDYt62e0JniNlrrz3o12ruEsvmAUHF
 zZh5S+ojqGuIuyfR5ARo2wNID4BU9wXbfqAdo72UPcS7sViOd/0zmLtahttc9Lhs4kMR
 zs4H1YRm6iV5luwd0KMide6jgr2MbxUbc6Ec/2K2+BSIrm1OOv+1VfTIERfWy/SmHjn9
 IY/A==
X-Gm-Message-State: AJIora9QI4V/Rbi1gWzxyISPkHfOqW6Z0aADDL9zoicqUXa1z+pZlt48
 GBfTge301XfXIw4c+vBcR/Y=
X-Google-Smtp-Source: AGRyM1tO8xLm+5r1mDN1qe58a+7SJEGBl2hpTXXQAjhyZ+gncZOa5kNvdZyCgd6WzO7ECwwQ/7Ls/g==
X-Received: by 2002:a02:c812:0:b0:33f:4812:4699 with SMTP id
 p18-20020a02c812000000b0033f48124699mr12850296jao.314.1658126341609; 
 Sun, 17 Jul 2022 23:39:01 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 29/41] nouveau: change nvkm_debug/trace to use dev_dbg POC
Date: Mon, 18 Jul 2022 00:36:19 -0600
Message-Id: <20220718063641.9179-36-jim.cromie@gmail.com>
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

