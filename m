Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F31D6D6DDF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 22:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034FA10E7AF;
	Tue,  4 Apr 2023 20:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6BF10E7A9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 20:18:49 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id eh3so135448660edb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 13:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680639528; x=1683231528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uqZDoQFwLADtMnBtNxdxK9p4TWtkU10tx8tohL83pCs=;
 b=XaJU8sLM4wNDMz/DnkBo4IsRCNJhdOLI8hKhFK4bdDC9psxDRT7+0jIiZXorXw9RIK
 hzgkzrlF4Y0eBfz1IjRl1Ep9FIxjejhq5J5sT+ZBg8LGMr5Sa9Z5Wh8J8gyABm68wkby
 KpwDB7GbvVE/9JCoj/Tge9PJkDrwDxA2jWPDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680639528; x=1683231528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uqZDoQFwLADtMnBtNxdxK9p4TWtkU10tx8tohL83pCs=;
 b=6+fHt8EwHiQVwaoYjphf+0zxt76lX8nwNsL0cwhO51vvWRWd76hwAFnwVxjPu8JaX1
 inG5os/KtVepYgz9uaqyF5CN0FLmA6EaaarpBokqdSGEJtvFRZG5kIDZ/QOu1lvO0OnB
 FSMK1E0kCwjvhjNBZXqh37Q7RI1EfjwPjfnTfoOxCS7ZJEIu+ttcRWtYwryYn/wOgaf5
 0A5RUxiVuKLy2YHgCBxiQjOVCBguzxqiK7mx3VMSw17VnmweArRC3qd9xIy+F0e2d7hs
 slnPccDvyEtfQE3oTsnByURKngPmh/1xi/I0TZjKqRyZ4uJXFGb3seIRoLwubotYCzBA
 rL1w==
X-Gm-Message-State: AAQBX9e9g5ttgdRMKMQcgLOXwyxnuoRfrz429F6FaCqahgyug9J69Tg7
 JEbHt+SlxV8izSDFor+9d9lrPYF5XU6+z+jqC60=
X-Google-Smtp-Source: AKy350acmaUwpjPBTn+dd4wIoYoC/vBQsq9f/Fcnf1fdPDCrTSCrW+/E+C1vVPofPrARR1z/KiBevw==
X-Received: by 2002:a05:6402:268e:b0:502:ffd:74a1 with SMTP id
 w14-20020a056402268e00b005020ffd74a1mr41930edd.2.1680639528186; 
 Tue, 04 Apr 2023 13:18:48 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 u12-20020a50c04c000000b004d8d2735251sm6367986edd.43.2023.04.04.13.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 13:18:47 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/8] video/aperture: Only kick vgacon when the pdev is
 decoding vga
Date: Tue,  4 Apr 2023 22:18:38 +0200
Message-Id: <20230404201842.567344-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise it's bit silly, and we might throw out the driver for the
screen the user is actually looking at. I haven't found a bug report
for this case yet, but we did get bug reports for the analog case
where we're throwing out the efifb driver.

v2: Flip the check around to make it clear it's a special case for
kicking out the vgacon driver only (Thomas)

References: https://bugzilla.kernel.org/show_bug.cgi?id=216303
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/aperture.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 8835d3bc39bf..552cffdb827b 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -341,13 +341,15 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
 			return ret;
 	}
 
-	/*
-	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
-	 * otherwise the vga fbdev driver falls over.
-	 */
-	ret = vga_remove_vgacon(pdev);
-	if (ret)
-		return ret;
+	if (primary) {
+		/*
+		 * WARNING: Apparently we must kick fbdev drivers before vgacon,
+		 * otherwise the vga fbdev driver falls over.
+		 */
+		ret = vga_remove_vgacon(pdev);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 
-- 
2.40.0

