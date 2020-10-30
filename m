Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F68629FFB1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165D36E986;
	Fri, 30 Oct 2020 08:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29EB897FB
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 03:34:03 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id n16so4025573pgv.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 20:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=0dmV/CR2ixHQrxpfc1u4wESPQI/4+pG75mm91eKFO/I=;
 b=cGHq059jOI/OKifCzdFXyVg+UBZQHuv/ZQ2se7LpOBjz9fKNLXGdVF8hhSX10jzUFl
 trKUJ3ukZIF0xbFq8ydvkaiDgQHrxpVyKOjzYlvGHmJMtWJ1bvPkMNvlwAu/x+P8w8Ao
 RUs7HLtG/Xw736RQRnqTD6ygZyxTkjS2DScxRQz5H2x2Dz4op/hOenaz2bRTZMabYYTf
 iN/VmACa0OmHa3+Mt9LqTpM+j4mGBwiMWXStiEX+0/i+JJ68fXVcKi8WYB556GZJylmm
 tHzBBV6n+bKZiHSwQH0jab0Unt1kdesZRk7AvagO8eVt6BHsBVNlh4Hfnx0L/86APmX8
 si2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=0dmV/CR2ixHQrxpfc1u4wESPQI/4+pG75mm91eKFO/I=;
 b=P1og05vm5zIGnYUTXdJNKBgtrp6KdHQ1PeJGljWJB40SpEEnX3IKWTDuEceEIn3Qlv
 zlzCinmvyun+dUbszARnmTTARLUUmoPzuT+sY/1e4Ra4rMoKIIic7GHwM3+oCr9aKifS
 G4XIfTIWVpMqBIHAA2mK1RYbD/+xnLnVNfHb3h5kKjpSWWSTNfJza+bYmBmWfH4dyIKO
 yzbdK8/hf+4XOjJyB+0pxggTV7ZSkA6JwXhtEFW+44+ixdNs3l0Q5Wqh5wMJ7CfizSi4
 ok9b2fvcNFNLHfYdW6WqOmhZjCdGhxfs7TYuV+sZE3gSdfKZSSKdowlftVFKEMmkLMW3
 OeBw==
X-Gm-Message-State: AOAM530Ag9RFIHRIkxTWQ2uH0++Sm0/SrYfU9SfobxyvkWeEKY1GMjHv
 FvmufUEryA3QZCew3r0bz7U=
X-Google-Smtp-Source: ABdhPJygkP1YEs01A252TcskXebd1Ann3fBmrJQ+e+HCwnue7s3XOdZxU4n3Hu6M9H8S8X6wE/AQYQ==
X-Received: by 2002:a65:688a:: with SMTP id e10mr394514pgt.347.1604028843566; 
 Thu, 29 Oct 2020 20:34:03 -0700 (PDT)
Received: from my--box ([103.98.79.70])
 by smtp.gmail.com with ESMTPSA id bo16sm1326504pjb.41.2020.10.29.20.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 20:34:03 -0700 (PDT)
Date: Fri, 30 Oct 2020 09:03:57 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: outreachy-kernel@googlegroups.com,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sti: use DEFINE_DEBUGFS_ATTRIBUTE with
 debugfs_create_file_unsafe()
Message-ID: <20201030033357.GA275168@my--box>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: melissa.srw@gmail.com, daniel.vetter@ffwll.ch, mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using DEFINE_DEBUGFS_ATTRIBUTE macro with debugfs_create_file_unsafe()
function in place of the debugfs_create_file() function will make the
file operation struct "reset" aware of the file's lifetime. Additional
details here: https://lists.archive.carbon60.com/linux/kernel/2369498

Issue reported by Coccinelle script:
scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
Please Note: This is a Outreachy project task patch.

 drivers/gpu/drm/sti/sti_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 3f54efa36098..18c6639e4dbf 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -68,8 +68,8 @@ static int sti_drm_fps_set(void *data, u64 val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(sti_drm_fps_fops,
-			sti_drm_fps_get, sti_drm_fps_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(sti_drm_fps_fops, sti_drm_fps_get,
+			 sti_drm_fps_set, "%llu\n");
 
 static int sti_drm_fps_dbg_show(struct seq_file *s, void *data)
 {
@@ -98,8 +98,8 @@ static void sti_drm_dbg_init(struct drm_minor *minor)
 				 ARRAY_SIZE(sti_drm_dbg_list),
 				 minor->debugfs_root, minor);
 
-	debugfs_create_file("fps_show", S_IRUGO | S_IWUSR, minor->debugfs_root,
-			    minor->dev, &sti_drm_fps_fops);
+	debugfs_create_file_unsafe("fps_show", S_IRUGO | S_IWUSR, minor->debugfs_root,
+				   minor->dev, &sti_drm_fps_fops);
 
 	DRM_INFO("%s: debugfs installed\n", DRIVER_NAME);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
