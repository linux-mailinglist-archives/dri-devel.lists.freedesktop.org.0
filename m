Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F94772C50
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6746610E32B;
	Mon,  7 Aug 2023 17:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043A810E327;
 Mon,  7 Aug 2023 17:12:09 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bb7b8390e8so29759795ad.2; 
 Mon, 07 Aug 2023 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428328; x=1692033128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o/ZrwT0NJoa3SvrfuTbm+aI37YIFG6qkhwqRx+xCrA0=;
 b=UqwBSzb7bDmSyec+1PJCPQEzpyJ0+EdMmkMvCke7Wnea0hLj+c9hkMVwbEw5OIZlt7
 2jFHWIlB3pNRnbenayfQHGZvj+rIIEnIdoYp6wuzuzdJuPV95bZa1c33CO6m1zvKYZN8
 SDRrnOVcXFN2xJuq9TuOmPsyc5HHQEycjoC00VXy6zC+vja0xBQwcwhdO3dug+bY9yUz
 uItD6eYHilJWK3UpSAisNS3wT9CHEhIlEAsWVjwWDL64eFa4pFKQuuEhhneseSz94DT3
 WhYkjovQZccQGJdgPZPdN4dhwG3euTQvC1g9vo6NR/WCZUDwvMeMpkkItLbFOxUoDpyG
 dObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428328; x=1692033128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o/ZrwT0NJoa3SvrfuTbm+aI37YIFG6qkhwqRx+xCrA0=;
 b=lYbmuz2zbIPo6RLbjYuSjwRyUHcD8EUz/CFJkCx25PwARIckEU0nn3n3ATDw278b3K
 6W0tD35yJZofNlo33PT5nuXQhKHvR6LFXjWpsqMJiyha0JI1hPr1hHp+szNfa5UqMEi7
 iDwxRRIDzohdE6MX+KvVRmD915oyJgxympIu5RnDHHB9D6n+GswLThrtlV3rzk3Pmmj+
 LMfDAwKGhfzSw0DO2SgvqOzYcxAwS6OPSz9lzfVOUiFVzOk+GVudIZGC7LOaa75H9jAz
 7mTExl5u6bsBs1Xm8/1pd/Iqv5kUwx1b/e/pKmwZ6ArR7sm4M/jd4ch6O9OsrRiBkQ11
 DtHA==
X-Gm-Message-State: AOJu0Yz9EY24XMHAQlDusAykDGyB315UVVKyu9r8U74ArfXN/7H4wNJk
 yXoMcb3WH0x6hob4hl79Pz/xPDHJAdI=
X-Google-Smtp-Source: AGHT+IHcE8fCOj51H5o9epINqTnpHnYF2YANR0R6RsiK0gsnRbxxmF0NZPQBL0kOhW0Cbcs0EmkDFA==
X-Received: by 2002:a17:902:ab0c:b0:1bb:b855:db3c with SMTP id
 ik12-20020a170902ab0c00b001bbb855db3cmr7406106plb.41.1691428327863; 
 Mon, 07 Aug 2023 10:12:07 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a170902b7cc00b001ac741dfd29sm7133303plz.295.2023.08.07.10.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 10:12:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 5/9] PM / QoS: Teach lockdep about dev_pm_qos_mtx locking
 order
Date: Mon,  7 Aug 2023 10:11:39 -0700
Message-ID: <20230807171148.210181-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807171148.210181-1-robdclark@gmail.com>
References: <20230807171148.210181-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 "open list:HIBERNATION aka Software Suspend,
 aka swsusp" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Annotate dev_pm_qos_mtx to teach lockdep to scream about allocations
that could trigger reclaim under dev_pm_qos_mtx.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/base/power/qos.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
index 5ec06585b6d1..63cb1086f195 100644
--- a/drivers/base/power/qos.c
+++ b/drivers/base/power/qos.c
@@ -1017,3 +1017,14 @@ void dev_pm_qos_hide_latency_tolerance(struct device *dev)
 	pm_runtime_put(dev);
 }
 EXPORT_SYMBOL_GPL(dev_pm_qos_hide_latency_tolerance);
+
+static int __init dev_pm_qos_init(void)
+{
+	/* Teach lockdep about lock ordering wrt. shrinker: */
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&dev_pm_qos_mtx);
+	fs_reclaim_release(GFP_KERNEL);
+
+	return 0;
+}
+early_initcall(dev_pm_qos_init);
-- 
2.41.0

