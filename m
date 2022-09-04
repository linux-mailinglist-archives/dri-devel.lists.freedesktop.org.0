Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F9E5AC76A
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A310010E26D;
	Sun,  4 Sep 2022 21:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AA310E25B;
 Sun,  4 Sep 2022 21:42:50 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id s3so1911241ilv.4;
 Sun, 04 Sep 2022 14:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FwCkCkIuXLu91UbfHdZYDrwIlB+NdbMmm6xvFEQjyUU=;
 b=RYCkLD0FCIpFqOKsWlElNLu5l8dGxBEngWLZ18ylxy41NG+Qaj5BZrfDLn5uvMF2xo
 VwhlrGgEcVvma9ILcXWr/GE6ZBBnf6OlwUb6biRCydxCUq3oKWxUcQ2J/MNFVAYtgIqI
 Xb9AS9cv7UVTnWGcrEevePRMFxuCn/ulpHIE9HVRP/TdyoUsfjS6AF5uOoRVUuWr8vqg
 4VPmeMzC0eaHliSJUHUrAHWH8r+EM3TH96DE9T2refzCG1P0lmBG3updh9CAqjc0qY/W
 hrGlSxiGyrArtn+T2krt991mxFZxt+CbQR1NKOfrS5F4tEvIbplkb8gHJGHTFjrzcpA+
 KgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FwCkCkIuXLu91UbfHdZYDrwIlB+NdbMmm6xvFEQjyUU=;
 b=1fRxhGI4H96blfyMW/2Egsruq480QTYpsUtUrP1eWGfCk7dH2E4gp+kXnWu8yNIxIR
 oFyCJcPxw+9JNFmgCuU3feXGDc26fVjSyTsTkRGVfq1DbDafmIHVW5kJUXe9EzMH3Ny8
 qicWoZXMqwGDUGA5bPTczHL8ImSbQAYgbH6PRV26a+r3wtZ2lOQNYAnW04eTiXx602O4
 VtTgVE+R++JCfzRbMSYH2/6hT1565UwUts5XdWWiIzsHj5aGaZDmJipwy2ppQpuLw2Zi
 cSPl26rvdm2+hLNqBqOmBOnSqnNBRhSXgsSojZ0LU0K/5941Yvcwjoolsu5IHjPVkKZE
 u5ow==
X-Gm-Message-State: ACgBeo0uwgynqQpPIUF68iGdu1c6WJjm6ZWwRSgMBz2Xjoo1w803ZoRb
 YgsGDdFKSVAzaJXeBKIhpfw=
X-Google-Smtp-Source: AA6agR6xgn/MlYOoGIi2AaB+WdvqdQ5gYdviqjuZlblXZSMV6/iv7FJf6NsVsV/Y3NPrVDl1/Xe7dA==
X-Received: by 2002:a05:6e02:1909:b0:2f0:a558:7113 with SMTP id
 w9-20020a056e02190900b002f0a5587113mr4717553ilu.55.1662327770538; 
 Sun, 04 Sep 2022 14:42:50 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 42/57] dyndbg: shrink lineno field by 2 bits
Date: Sun,  4 Sep 2022 15:41:19 -0600
Message-Id: <20220904214134.408619-43-jim.cromie@gmail.com>
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

struct _ddebug.lineno int:18 is bigger than we need:

  git ls-files | grep -P '\.c$' | xargs wc -l | sort -n | tail -n20
  ...
   22553 drivers/scsi/lpfc/lpfc_sli.c
   28593 drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c
   46300 drivers/net/wireless/realtek/rtw88/rtw8822c_table.c
   48725 drivers/net/wireless/realtek/rtw89/rtw8852a_table.c
 1386670 total
 ...

All but one of the biggest of these are just .data tables, and have no
code, so would never need a pr_debug().  drivers/scsi/lpfc/lpfc_sli.c,
at ~22k lines, would be encodable with 15 bits, but lets just shrink
to 16 bits for now.

RFC: Is this tantamout to a "don't write files with >64kloc" policy ?

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dcc0e8cc2ef0..c05148dab367 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -30,7 +30,7 @@ struct _ddebug {
 	struct _ddebug_site *site;
 	/* format is always needed, lineno shares word with flags */
 	const char *format;
-	const unsigned lineno:18;
+	const unsigned lineno:16;
 #define CLS_BITS 6
 	unsigned int class_id:CLS_BITS;
 #define _DPRINTK_CLASS_DFLT		((1 << CLS_BITS) - 1)
-- 
2.37.2

