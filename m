Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91706462EC9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 09:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3FC6EE2F;
	Tue, 30 Nov 2021 08:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9E06E303
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 00:06:14 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso15635777pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 16:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NPU8E18/rfNO+NGRed1cne32L6+cx+NUy8rxuVdLCdI=;
 b=APAUZ+P6V7/0qC11v7y+ToCCkwQKZyISJAue7T7o7k7kYnncHcnlkAglBSsyTZ/dlh
 B8IQgmKyyOTn2D0f3kt4sqEfgIx3X/bEMn0ArFYOnoNrW7RW6RhrqaSv5MeI/nzv6TlD
 mafbfO3G2WOfdM0g6vDMFpi12GoL3lH8ICJ1bwPrpZChc9p+IP8WQfDGePbXbFaDkqBD
 bh2LV0zPRK0X4XWryW0Y7+eLxsyaGpRDXvZE0vZBBdBXDcHpGXM2zz9B6t4RwoUMx94t
 iDxjYluOCpabjDBkcS69PX107K+BOrb9NZ5YU0vHZf25vWHFO83B2I85jrSRVglOH5M3
 5Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NPU8E18/rfNO+NGRed1cne32L6+cx+NUy8rxuVdLCdI=;
 b=ppnWCbrlYWbGCKVBVn5NtuemGBuicULghD4xDF4QESJodTtyz/VdGiPyohxlqsVSOB
 Ej9u+z/rZ1hFa0uVz4MJEJqUZDyHdJYCmLV2KecdkZa+iwbVnG0dT8MjQNXSTfJGswVw
 JdcX+J5g16GDtjfjWirK/HFCzHG6c0pKTCuFhIyfmvkZT+dFo+kMCFAamj7DvIG6ThT1
 6Hq1AmQXpsIEprL0HNSfgCC9Lwz9fBN0ZAlque28dFqRVKzAxmV+bM+La90gQGIP4+OZ
 Pc7vElgsdbSveMy5N+jrioRixYLBI6ySGp7vrUTG/U/66u0WM9WO2PG7ipxtXOLF8p4/
 VWcQ==
X-Gm-Message-State: AOAM533ciReeqBwjnc2eD9h+DBzLlXARJwKxIH0h+j9n6+j+GHI8pFIs
 A+EVTSiAIxvRFPbkX6fVGMI=
X-Google-Smtp-Source: ABdhPJyyKwr7COUgkXlgf5fJU/eSeNrWuXpxppKX2t3WN929YduwwLP7E2MN9rErqvmzvJoQukrZ0Q==
X-Received: by 2002:a17:902:a60b:b0:142:7621:be0b with SMTP id
 u11-20020a170902a60b00b001427621be0bmr62807805plq.58.1638230774600; 
 Mon, 29 Nov 2021 16:06:14 -0800 (PST)
Received: from debian11-dev-61.localdomain (192.243.120.180.16clouds.com.
 [192.243.120.180])
 by smtp.gmail.com with ESMTPSA id f5sm417713pju.15.2021.11.29.16.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 16:06:14 -0800 (PST)
From: davidcomponentone@gmail.com
X-Google-Original-From: yang.guang5@zte.com.cn
To: yang.guang5@zte.com.cn
Subject: [PATCH] omapfb: replace snprintf with sysfs_emit
Date: Tue, 30 Nov 2021 08:06:03 +0800
Message-Id: <02f27656a2da68cac42ebee55a78b0316ff3d83d.1638185487.git.yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Nov 2021 08:46:17 +0000
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
Cc: linux-fbdev@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 davidcomponentone@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yang Guang <yang.guang5@zte.com.cn>

coccinelle report:
./drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:
479:9-17: WARNING: use scnprintf or sprintf

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
---
 .../video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
index 8d8b5ff7d43c..3696eb09b69b 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
@@ -476,7 +476,7 @@ static ssize_t show_cabc_available_modes(struct device *dev,
 	int i;
 
 	if (!ddata->has_cabc)
-		return snprintf(buf, PAGE_SIZE, "%s\n", cabc_modes[0]);
+		return sysfs_emit(buf, "%s\n", cabc_modes[0]);
 
 	for (i = 0, len = 0;
 	     len < PAGE_SIZE && i < ARRAY_SIZE(cabc_modes); i++)
-- 
2.30.2

