Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 640C258B218
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F1DAA2E5;
	Fri,  5 Aug 2022 21:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80FEA1771;
 Fri,  5 Aug 2022 21:54:55 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id q124so2870358iod.3;
 Fri, 05 Aug 2022 14:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=8Di3KlCpKKLc83SvAaF4ufqdssAuqHwTNN+eiKiYlTw=;
 b=KMSBPxec0CZihP4SWoEQ8H+eUfnM6dpBj0CRtlFtLTYwb4BV0yDmo61reX1hHnGkp7
 S3V+E1OgM4UDp2ijXiPwTxvb5x/X23N+NRQsTJ6wrtQ7MF1xar01ugxg8JVIga5vuHtt
 EQapkyCoIWiVlU55niDWItnMQjycBO/b6kV4CX3GPUz6dMNFnGdTIrsCRJfVm2ybrLdf
 y/DWjeZpAyibNZrId6OjLyipoBONfLMyXKs18Vmo6ncq7x0wkZa+ZiCDQ3ykC/wUeoKF
 TQpFfiZuVsEMPNw/DilCduphak4xGdB4GPaVLDIZE0i80vY2GETKEVTfnmfykp92kaMR
 KQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8Di3KlCpKKLc83SvAaF4ufqdssAuqHwTNN+eiKiYlTw=;
 b=j0IZXaIoDgl09JG/LNaLoRuYINZcTwZUP8iGLjeNdG6gle8Tk+00n1MhxnDdVZIhsy
 I4z80v6pMWv07oXFsgh7FA3Kppa+jwIqw7va8tOyKPPgBsC29R+yfjjwSBGutk5t408k
 7H0pxfvokLsLnv0SiMOZCWQ2qL+Ual+T2xi0BoEXcIzQ+gUByyYk8ZhhKVPa5vjjT7xi
 hw4VlNx6S3BGjFy1Qb/tBxtAqDHZzDGCWjKlq/DD1fstdpgox5Wnn2TRbjCwEbAKh9BI
 tRwVZ/G1vtzbqDHOAOAtMJnl730muiqvPJslHkqyJwg+MOjm5ZnupCXMEyxkmnxhr0kj
 1wiQ==
X-Gm-Message-State: ACgBeo0Ay0ODtCZf+qHmT4fAC5xeToZh47ycrtGDIp6mjfsdWEy12TXj
 goPgwXkNX3IFso/ZOkWTkFI=
X-Google-Smtp-Source: AA6agR4O2kdgTkTSTjS3wkx/1NG+MBZqECClAcHMDs/7cRn6A/ixRnTDTJEjOKioFT/ts6fhOTAU2A==
X-Received: by 2002:a05:6638:d45:b0:340:5c58:51f4 with SMTP id
 d5-20020a0566380d4500b003405c5851f4mr3839718jak.280.1659736495160; 
 Fri, 05 Aug 2022 14:54:55 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 31/33] nouveau: change nvkm_debug/trace to use dev_dbg POC
Date: Fri,  5 Aug 2022 15:53:53 -0600
Message-Id: <20220805215355.3509287-32-jim.cromie@gmail.com>
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
2.37.1

