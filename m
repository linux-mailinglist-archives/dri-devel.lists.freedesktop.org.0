Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624B34B07D3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 09:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A9610E74B;
	Thu, 10 Feb 2022 08:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AF410E71E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 06:58:45 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v12so7825291wrv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 22:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u78B18o9gcsc4cL6IkzErLE1PeBzNrlXsUNhAfo/eQA=;
 b=Z+CyvLG7KD/HpWPAArX/wKn2XNrlxk7iy8frG7an2ljCw2UYm4L+d2nlDwDzVHi3lP
 jFbwovb1dRqTM/2101G1HUM/8mtO8uLvQ0gVqEf3ulnKJeMOY6IJVtgcy35mntS9byQy
 alpXiBuP+DJ5fBtj4gakO1YdgI1d2qoUG5bvX2ecVuzvRQZkkl7FOGaxxOeyvuAXZpsa
 Cmss2vfY1cWUZu/F+ggYvG6vOhgeVCyXVfM820UicCMYzO15VyUl9/aH3zciHnzreBM6
 GuOrzWPgzGxeROCjQqdoDth5TVAsYGaY6KRNT/CU6VNNsoVZsMWbHG4/qIdEXwyFqVcQ
 zIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u78B18o9gcsc4cL6IkzErLE1PeBzNrlXsUNhAfo/eQA=;
 b=yq5HzXOBYkDByTynp7v/+3uuGFi4ihhr+rhxQY4vWCZmeQDjFy+5vQKgKjdavc7mFz
 PLFvr6Kn9tKDDgAUWr41qcKCsRdgxMJRGU3ate6DdjPZ7cncCCn5UEs6RvLrIGD64qbg
 Fc/fRyfWpZucp7IVIp0N/JCIFqdzcdMohZw8+9hy5+k2utNhuc/zlIRTA9MYuEyT/qE/
 /kcMiIBFY67vNYbRtIzQeXRWXDQzPEt8SeRC74Mm4V3zkHtP0omIN+583VXYZQ/LzkiN
 AjiH0yFwvZ4DQ6j5yOgx9L7j7tszb8xhSK+yCEQRFaRJL30r5BIzEdGIEOTLTqI9KDKz
 opHA==
X-Gm-Message-State: AOAM5320d5ryAdzuhdkLGQ4QhKJgwJ+4BH+O5wEWHJMfSvTW/XVnhVid
 vgJgfhijDqUlT4jhHQEoRY4=
X-Google-Smtp-Source: ABdhPJwe+XGoIjBrzTJSHQ7oKv5mlppiFkBHW6003ML4aU0ugi6ehTht+78ijXA2D7tO+Ul/JUwQrA==
X-Received: by 2002:a05:6000:178f:: with SMTP id
 e15mr5133719wrg.439.1644476324368; 
 Wed, 09 Feb 2022 22:58:44 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.24])
 by smtp.gmail.com with ESMTPSA id v9sm6621456wrw.84.2022.02.09.22.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:58:44 -0800 (PST)
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
To: daniel@ffwll.ch, deller@gmx.de, sam@ravnborg.org, linux@roeck-us.net,
 willy@infradead.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 paulmck@kernel.org, rcu@vger.kernel.org, pmenzel@molgen.mpg.de
Subject: [PATCH linux-next] video: fbdev: fbmem: fix pointer reference to null
 device field
Date: Thu, 10 Feb 2022 14:58:24 +0800
Message-Id: <20220210065824.368355-1-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Feb 2022 08:10:20 +0000
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function do_remove_conflicting_framebuffers, if device is NULL, there
will be null pointer reference. The patch add a check to the if expression.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Dear Linux folks

I discover this bug in the PowerPC VM provided by
Open source lab of Oregon State University:

https://lkml.org/lkml/2022/2/8/1145

I found that the root cause of null device field is in offb_init_fb:
info = framebuffer_alloc(sizeof(u32) * 16, NULL);

I have tested the patch in the PowerPC VM. Hope my patch can be correct.

Many Thanks
Zhouyi
--
 drivers/video/fbdev/core/fbmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 34d6bb1bf82e..422b1fc01722 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1579,7 +1579,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 			 * If it's not a platform device, at least print a warning. A
 			 * fix would add code to remove the device from the system.
 			 */
-			if (dev_is_platform(device)) {
+			if (device && dev_is_platform(device)) {
 				registered_fb[i]->forced_out = true;
 				platform_device_unregister(to_platform_device(device));
 			} else {
-- 
2.25.1

