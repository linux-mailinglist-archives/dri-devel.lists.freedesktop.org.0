Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 301C14F1137
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 10:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1394D10EB44;
	Mon,  4 Apr 2022 08:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CE210EB3F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 08:47:48 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso2643820pju.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 01:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=se5gGj4gIJ4vBWROJp5FA4oTC1hFkItwaNy9Koid500=;
 b=FAWD5yFE3Vc1iB03y75UnpfQijI3kB8ErWFbZSX3sTvLpWWs8B9bNUKAqt1J9AUjua
 +8qiSwoCtM81wPcqTXMLNWNi51npg2coAdhvntqlt8jzubrZcqpdPAzkPEP+df7LxRF6
 SU/2nl+b/D/Gfs5CGKOKbs5elEtIeGAeh1vYKYwyk5CpJxaYBG8ynXrXQISO+XQXwJNX
 oE8ZKXL7BUqPKahtHTTiFy1jsLmyVr/BiTJP0GWcFgyCkIBCLNn18/nIU9Zwz5uqdArj
 DfJQTbq4JSXt26CYu/+j4MreZdnQKpxzeh6b3w+GBv8DtX0UKPkv1dSkxJmCK0ViTutb
 oKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=se5gGj4gIJ4vBWROJp5FA4oTC1hFkItwaNy9Koid500=;
 b=ZQSYfqm21DikogvsshZoQf2xU8yGORZJ1vmzUHNZLTtsFpuKbuY3QT9FHm2Eqhx7w0
 1dV1dERUdeE5TJ5voPI+2H+8owi11MUBpLrw9GJSqq+VoIIbaOL9G+5qzHs47j4tRONy
 wX4FuUYujK8RWXf0l/9nxOELT3P3pmhfEP5aKkCienkqeK8l8WFMnZ/j6T3RV0eDWbzu
 ioeqJb/59mzGu6DstMTIetW1T8KGbKysSMk43ae0jZ1dVJXwE1l17IlrpAkWd9Cp/GKg
 UxL26YD0kiRUIER46A0X28Wcas0PcOSdrEFadzQoiJPm4ogfmOnlyCkOPip5V5bfAyRm
 HhzA==
X-Gm-Message-State: AOAM532az2gpjYGqCnKCJ8dixgws7n7lERURCt1NvMYri5e/brdDeO/w
 C3bQmI6+SnseGj06QSq0Dw==
X-Google-Smtp-Source: ABdhPJymLqxgqm2NQFE6WKf9I6xeVeCxVVNJO1ePEFu5Dx3u2IlfUF8NYPn6xZ6W5qBnlwa3LUtr8w==
X-Received: by 2002:a17:902:ecd2:b0:156:9992:5892 with SMTP id
 a18-20020a170902ecd200b0015699925892mr5803329plh.7.1649062067669; 
 Mon, 04 Apr 2022 01:47:47 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a17090a3fc600b001ca88b0bdfesm3991960pjm.13.2022.04.04.01.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 01:47:47 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: deller@gmx.de
Subject: [PATCH 1/7] video: fbdev: i740fb: Error out if 'pixclock' equals zero
Date: Mon,  4 Apr 2022 16:47:17 +0800
Message-Id: <20220404084723.79089-2-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404084723.79089-1-zheyuma97@gmail.com>
References: <20220404084723.79089-1-zheyuma97@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The userspace program could pass any values to the driver through
ioctl() interface. If the driver doesn't check the value of 'pixclock',
it may cause divide error.

Fix this by checking whether 'pixclock' is zero in the function
i740fb_check_var().

The following log reveals it:

divide error: 0000 [#1] PREEMPT SMP KASAN PTI
RIP: 0010:i740fb_decode_var drivers/video/fbdev/i740fb.c:444 [inline]
RIP: 0010:i740fb_set_par+0x272f/0x3bb0 drivers/video/fbdev/i740fb.c:739
Call Trace:
    fb_set_var+0x604/0xeb0 drivers/video/fbdev/core/fbmem.c:1036
    do_fb_ioctl+0x234/0x670 drivers/video/fbdev/core/fbmem.c:1112
    fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1191
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:874 [inline]

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/i740fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 52cce0db8bd3..b595437a5752 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -657,6 +657,9 @@ static int i740fb_decode_var(const struct fb_var_screeninfo *var,
 
 static int i740fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 {
+	if (!var->pixclock)
+		return -EINVAL;
+
 	switch (var->bits_per_pixel) {
 	case 8:
 		var->red.offset	= var->green.offset = var->blue.offset = 0;
-- 
2.25.1

