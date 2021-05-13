Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663D338044E
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 09:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CD36EE2F;
	Fri, 14 May 2021 07:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393A76E0B9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 13:53:58 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id l19so489104plk.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 06:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jeGOhUsXM+h0b5duR78hDCeHFJsfHgTFxSjQsG1kJ5s=;
 b=tuS1HcXFu3znIQluv7gGfoUNzMCCRNLYwpvkxcZzbbgyrpy4bAtk7K1Bzstlpr2R/x
 NTC1uoH5KePm80wvP9MjBDhZ81DORUDRSy+Uyt2tTEORJgXzhfX0ZT5Wd9/c0wCRNpzv
 34zBRr/EPrMfjB/loIGlkxaZiugi+NdmVJG7p0YWqtcNTII+RIV5kyKVZV7qeuOMo6jg
 QxtVC3yDxyEBnfdApoDFqYt16e2vn0QBPzkd7pKQGRe43+Y6vjvOHooZevKKYPhUsdPq
 ahAaJIuYbmWVU4YR3IU8qKBfZgGmx8ycS0UG7U44hFNywmEk+WlyGdmDqxgk/YJa9Y9U
 0MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jeGOhUsXM+h0b5duR78hDCeHFJsfHgTFxSjQsG1kJ5s=;
 b=DjTULXF1Es/3bJQLoLejeAsbyeHP4MPbY4XvvN5TCpuijyxYAPncaf7UDvSJQRGxOO
 ohoNJdV9kcxm7JzkGDt2BJU112RndB+Ym74n3jF9w5Z/JvDpPi6M19FtHyGQUepveuI6
 rrLZ0wlxq4JjlW+qKbiSYHgU1abS+aN8S0EebvE6De2BYaqyv7gPxbv1xc0Bd58VbeHJ
 QSngMH1ydiCBu35x4rqibfbKkXxMNBCGtczPtsCAJcrUiW9rcURS6WlKMfMtEQGEVZsE
 PI0l41gWy+JJNN9Az1PHo2UrL/dqv0vJO8AVHVnsP9xu2BhN3BcBLj5fBugWfVkgDaMz
 3ieQ==
X-Gm-Message-State: AOAM5317l04sW/EhJXa/eeCVB7Xg9zsMpv+i5eyBHBhJgOGAHjNvAXnj
 2AmZyYJAzKDiQuQGyqh2G4g=
X-Google-Smtp-Source: ABdhPJyv880XeAR5PQ5HCrV8hoLxoltvmXmAd2U7KkO/KzQQoLouQMLfATgko/boloPxPyB04ZFXMQ==
X-Received: by 2002:a17:902:ed97:b029:ee:af8e:3a0a with SMTP id
 e23-20020a170902ed97b02900eeaf8e3a0amr41820850plj.52.1620914037902; 
 Thu, 13 May 2021 06:53:57 -0700 (PDT)
Received: from yguoaz-VirtualBox.hz.ali.com ([106.11.30.42])
 by smtp.googlemail.com with ESMTPSA id n20sm2678683pjq.45.2021.05.13.06.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 06:53:57 -0700 (PDT)
From: Yiyuan GUO <yguoaz@gmail.com>
X-Google-Original-From: Yiyuan GUO <yguoaz@cse.ust.hk>
To: airlied@linux.ie
Subject: [PATCH] agp: check if ndevs is zero before enabling node
Date: Thu, 13 May 2021 21:53:32 +0800
Message-Id: <20210513135332.62581-1-yguoaz@cse.ust.hk>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 May 2021 07:32:49 +0000
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
Cc: Yiyuan GUO <yguoaz@cse.ust.hk>, gregkh@linuxfoundation.org,
 yguoaz@gmail.com, keescook@chromium.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function agp_3_5_enable from drivers/char/agp/isoch.c, the
variable ndevs may remain zero if all AGP devices have type of
"Bridge" or "Unclassified device". Passing ndevs==0 to function
 agp_3_5_isochronous_node_enable or agp_3_5_nonisochronous_node_enable
will lead to divide by zero problems.

Signed-off-by: Yiyuan GUO <yguoaz@cse.ust.hk>
---
 drivers/char/agp/isoch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/char/agp/isoch.c b/drivers/char/agp/isoch.c
index 7ecf20a6d..4c21bb057 100644
--- a/drivers/char/agp/isoch.c
+++ b/drivers/char/agp/isoch.c
@@ -433,6 +433,11 @@ int agp_3_5_enable(struct agp_bridge_data *bridge)
 		}
 	}		
 
+	if (!ndevs) {
+		ret = -ENODEV;
+		goto free_and_exit;
+	}
+
 	/*
 	 * Call functions to divide target resources amongst the AGP 3.0
 	 * masters.  This process is dramatically different depending on
-- 
2.25.1

