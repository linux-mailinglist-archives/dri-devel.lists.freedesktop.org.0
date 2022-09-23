Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294CB5E7435
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 08:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E0C10E3F0;
	Fri, 23 Sep 2022 06:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B381C10E3F0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 06:35:38 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 bu5-20020a17090aee4500b00202e9ca2182so7320995pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Kg+p/+rNL9zwSFLa01Tro2dNPYnaSbxfZhZdLBxXQKI=;
 b=GTuqzN0W61gGoKHDi0iPdCYyc93ex/nvB6zMPcyMvj+qNFCbBvgJoauWhYGxkr3OV0
 o7nkCrlZgOuS1eI01ulpuM54KbuKefLlijPkuijC2GaIEqnyYLgEoGRHgKasF8tsPRVA
 z0ZJyRfX4Iu6QRkgW20qPQFbQ4Ex5bXQ0ZlfTEQBZlAhxeQkUCSaYORPBuminVvxgTO2
 W7qkdG48PrlHct3huDNOHpZeeZTpGb28dxDl6ky/IW1ETUMVg7SXI4/t9fQDtotwW7Ir
 gOUNlswp98HjhCr836rZikzSeWwuCM3wRngjz3Oj5MZ4c8dRZj+N08Ur+lRpurpz9Of1
 B/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Kg+p/+rNL9zwSFLa01Tro2dNPYnaSbxfZhZdLBxXQKI=;
 b=ZgyhnADgRbkHcIo0OGahV2Qv+kq22VFCSINOPIPMsMwSm2DAgZd+g9ejwt41woCqfs
 CV+ZYGngp7JYVg7R6RC/Cpp+i+G2YDPlzZBHRLvwmPLZezVDeaGc7CeIFihXhuvHgpwn
 J9fC7rBPzNliUP65ZZh5g+isdQYYEjxO1ebudZHLwplQrbV6FwtRIIlFU/Vh1nLVf38d
 x4y7XzSlxIiVhoF+ZTQwNERAsV3cJNJfEVNoRb0ANZ5Dku78X6ZqTHMtjYNPqe+rg2Ah
 1G1Z4bS0BZT5r0ravKvfHOc4cp/na1bW1vWfkYajFL/x9XOyVe7DIMLoQ7QQ/7xGZClx
 o2cg==
X-Gm-Message-State: ACrzQf1ZkOCKXHIfq7DRj81eSJkwCB+DPoiIspOqPDE7YZh2XNgiSYFi
 akmdagpKVtDJRE5G4BrabWit6cepmnQ=
X-Google-Smtp-Source: AMsMyM60NtKPkTPMdbQf3h4+rYLoKa6wTrB4OnbFWtoZBKWlqMeQbWEmzt6u3DUGQ4QXAcbVArNHtg==
X-Received: by 2002:a17:903:2305:b0:178:380f:5246 with SMTP id
 d5-20020a170903230500b00178380f5246mr7130337plh.146.1663914938175; 
 Thu, 22 Sep 2022 23:35:38 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a63f210000000b0042a713dd68csm4822230pgh.53.2022.09.22.23.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 23:35:37 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: lee@kernel.org
Subject: [PATCH linux-next] backlight: lp8788: use sysfs_emit() to instead of
 scnprintf()
Date: Fri, 23 Sep 2022 06:35:33 +0000
Message-Id: <20220923063533.239315-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, ye xingchen <ye.xingchen@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with sysfs_emit() to simplify the code.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/video/backlight/lp8788_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/lp8788_bl.c b/drivers/video/backlight/lp8788_bl.c
index ba42f3fe0c73..00d79c0cfee9 100644
--- a/drivers/video/backlight/lp8788_bl.c
+++ b/drivers/video/backlight/lp8788_bl.c
@@ -240,7 +240,7 @@ static ssize_t lp8788_get_bl_ctl_mode(struct device *dev,
 	else
 		strmode = "Invalid mode";
 
-	return scnprintf(buf, PAGE_SIZE, "%s\n", strmode);
+	return sysfs_emit(buf, "%s\n", strmode);
 }
 
 static DEVICE_ATTR(bl_ctl_mode, S_IRUGO, lp8788_get_bl_ctl_mode, NULL);
-- 
2.25.1
