Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE2C5AC7B3
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822B910EA2C;
	Sun,  4 Sep 2022 21:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DCC10E23C;
 Sun,  4 Sep 2022 21:42:40 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id l6so3864134ilk.13;
 Sun, 04 Sep 2022 14:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=LAElKATTm6r2TIe9HchZuJ0iTvp0tkidaAAlkqZf57g=;
 b=ioFXEtAboLLUIN/kNyc61L0HOu8/6UCEVPrRpVK/iZqDkjSxhy1lokEax7skm4mwOF
 mCdRRCoU7224D2s+eeI9bmOsLLpeqbAXpSoc5ewN3Vnu4++5Y8MjvC45CARQ2eSUmtPM
 vq67RMmjwELCYQ5rsDgJHAwkUX47ytKixYLVLxiRln+UZzGGvAk+2JB+Sw0belDPO48F
 qDmzIHF6L9eAsm4bEnMCzLrXaEJmVUloL5mpLRJ14V94PQCg5aoimHZKHASnmIAq31fh
 i6l/G06rgbvOyZ/eJK8nqcrZ4A1qC4+YiBem4FdzmsbXjDz5e2YWLpntsHdBPAZvrPbS
 m72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LAElKATTm6r2TIe9HchZuJ0iTvp0tkidaAAlkqZf57g=;
 b=GDfycPn8+yINvKjuUGdJnHs54/rla4Cu2hKhoGxSUs/Dbt3ksFaiEKei6aAr0xDxEX
 Mx006BZDlQgijFgtlNY2qji6OcUh7wVWPxk1Q9QJdCMv/0CcR5hbqxTNDEE3ICZQLxuI
 1nJAJqIvUD7NWrbiYKhgZeuthkZwI4zkYLLm9d3kRIPvZ+9JnEnLF91/IHiq8RPi71N2
 qiBd2+AKCtUg6fmg27GDKyngZYh09PLl6ZNMjAt9IpWZOdhkAxT+dpSwuomj59XgiU9e
 hotrAorg8v/r1e+BSdzvJSnxCACkh2PnL6SCUd1p/3s1BSByic/5EdO0Zwk/TCihAA6b
 y34A==
X-Gm-Message-State: ACgBeo39fiStQG1VowHi1IXVd0r9xCCOGbAPx09cgg4F/SJEQZTiLZ2R
 gTj8g/HEGQVCV5hoMl5OwGU=
X-Google-Smtp-Source: AA6agR4JZnvP+IfSOvpE/ZnPHvuTyE3m/D+cXn8a4t+7sZ/c+tnbIR9Wi8DqdENHAxq6VZVKf3h3Ew==
X-Received: by 2002:a05:6e02:20c1:b0:2e9:f747:ad54 with SMTP id
 1-20020a056e0220c100b002e9f747ad54mr25614470ilq.144.1662327759838; 
 Sun, 04 Sep 2022 14:42:39 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:39 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 31/57] nouveau: change nvkm_debug/trace to use dev_dbg POC
Date: Sun,  4 Sep 2022 15:41:08 -0600
Message-Id: <20220904214134.408619-32-jim.cromie@gmail.com>
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
2.37.2

