Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 568D739F7E1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 15:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAB76EB09;
	Tue,  8 Jun 2021 13:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F71A6E902
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 11:06:44 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id z26so15422295pfj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 04:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=agz9CSylDXq5In5z8KQvrOkrG9eT9u+AOTvuu0ZY5Nc=;
 b=kGJnoao0/Q/HCganKG1fHKbr1Rvvy+ZswfjL1itdz2Fa3nj6p0fdUcUGr9zmUrRqh3
 i+EaiDMe2/M8vkPY13QjEDQDK04NGqhOr1bzlDllU0QlBDpYJaO4bE4DuYMY1sbkQLsy
 q61tkrjOHNH1WfEYj6pgQ4UrB8wObwr9PCvR8TZobNvIy2cZp0uJjDmHEyBLvdB74UZi
 4haMcQI5taiEdShso56uQeGBHkg1S4gjWzKzSDMQ0GCc8qF9J2JYuG5dBPnml6u8PUt9
 Ln6S5lxSWmgLYzvv/F2qKIfEsk5f8apHSuxrNTdXyih+OHNHW8vnJ9tiUHWJeJ6+j1cv
 7p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=agz9CSylDXq5In5z8KQvrOkrG9eT9u+AOTvuu0ZY5Nc=;
 b=nzkmPwarUXiTn0OFCffukMy3d001FcK0BY9SodIB4BWczcglgh1M0uOYUPCvqRI3/h
 OXqnSTNqcuPN6APwFHvsIU/FEiW2u750VcmIJ/GVvEfNiNVaXZWMSuklZ4hjsm1uh0GY
 njXVl3ATy6pb7QMwucdkDHmMo8kvj+PnnTo+arSKpRiAoqIWiMzd7K64Or9DTUSZjeYp
 HQZdqb3ZwZslbucwH0xm4b3ShNwt/sdtphGPBRDSJP6KpONvt2pP6478rzkzJB0kX8xB
 fHBlw9x6ZMiyoAoqV6zBrEtBo3raa4yom4e6S7yoxQI+ek3r7k3OaOVknCziZLMoPwQs
 HIsg==
X-Gm-Message-State: AOAM533svtfAgxyLEICBvGIMXOg65L5jFUNAQrmpn0AuUJm5uBqap0it
 /bUxN0zGxIGBayjIm6bMkI8=
X-Google-Smtp-Source: ABdhPJw+2vg8VRQZjpROEMosr54/72J0JLFObMsUY2RUtiQT6wgQDH+LwDd8IMe+yGnWjpe5wSHOag==
X-Received: by 2002:a63:954e:: with SMTP id t14mr22339484pgn.427.1623150403690; 
 Tue, 08 Jun 2021 04:06:43 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id a9sm10264209pfo.69.2021.06.08.04.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:06:43 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: Fix use-after-free read in drm_getunique()
Date: Tue,  8 Jun 2021 19:04:36 +0800
Message-Id: <20210608110436.239583-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Jun 2021 13:33:15 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 syzbot+c3a706cec1ea99e1c693@syzkaller.appspotmail.com,
 skhan@linuxfoundation.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a time-of-check-to-time-of-use error in drm_getunique() due
to retrieving file_priv->master prior to locking the device's master
mutex.

An example can be seen in the crash report of the use-after-free error
found by Syzbot:
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

In the report, the master pointer was used after being freed. This is
because another process had acquired the device's master mutex in
drm_setmaster_ioctl(), then overwrote fpriv->master in
drm_new_set_master(). The old value of fpriv->master was subsequently
freed before the mutex was unlocked.

To fix this, we lock the device's master mutex before retrieving the
pointer from from fpriv->master. This patch passes the Syzbot
reproducer test.

Reported-by: syzbot+c3a706cec1ea99e1c693@syzkaller.appspotmail.com
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---

In this patch, I made the assumption that dev and file_priv->master->dev refer to the same struct drm_device*, and from my test runs this seemed to be the case. If this was a wrong assumption to make, please let me know.

 drivers/gpu/drm/drm_ioctl.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index d273d1a8603a..495a4767a443 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -118,17 +118,18 @@ int drm_getunique(struct drm_device *dev, void *data,
 		  struct drm_file *file_priv)
 {
 	struct drm_unique *u = data;
-	struct drm_master *master = file_priv->master;
+	struct drm_master *master;
 
-	mutex_lock(&master->dev->master_mutex);
+	mutex_lock(&dev->master_mutex);
+	master = file_priv->master;
 	if (u->unique_len >= master->unique_len) {
 		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
-			mutex_unlock(&master->dev->master_mutex);
+			mutex_unlock(&dev->master_mutex);
 			return -EFAULT;
 		}
 	}
 	u->unique_len = master->unique_len;
-	mutex_unlock(&master->dev->master_mutex);
+	mutex_unlock(&dev->master_mutex);
 
 	return 0;
 }
-- 
2.25.1

