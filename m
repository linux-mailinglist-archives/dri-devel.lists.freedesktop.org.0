Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1E02C6C4E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566CA6F3CF;
	Fri, 27 Nov 2020 19:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F84F6EEB9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:44 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id o24so7124164ljj.6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cTz8UNZSB2sQnZVOY7U0wdeJbPp7ZoKiq9hM9XyTjD8=;
 b=dRT/DaQuxup56pjO/gXvCOHAFRuO1qWDIs0CBnqhSXDTtr/bSWQu2Ap+yUyq+B44+A
 neG0M7I0sJitoqxpbq2Yv0USUFFjoo6QhS/EEYu4HvbE8XHA+xb3ABCMI55iyfqUQdna
 yb0QgRDle+80a4z1OJrF3nyORqFTCGwJYztA3HK+rMcLIgnrNrLdcU0rtjUdmKBHKuLb
 vvInFX+bp4OkZ/2EEZ9lwNd07cypaYMY/o49aMZTVQQMGBaNI3fiK4OyR8I9tos2WUp6
 PnMnXcVo9CxblX4AV3NR0hsMeaf5lyqTZPMM24rlzSTWJHH3vMFitAk61/zxQnCnCFQr
 tJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cTz8UNZSB2sQnZVOY7U0wdeJbPp7ZoKiq9hM9XyTjD8=;
 b=dNpPmQfuT31ZSVZWOCPx56vQB2OOiltSChqKYigipCEZKWo4suzC5Xai32rkxgfi+1
 kqvGMHKO7NvAMYlHjeOCU3RLDCTGnNhOoA67fvuW2MaPmEpcET0wlHZANahKBCa2yOHN
 XyTZtffH78uS+wZoXKqZR/U+1r5W8xDlmC/kQnA2XHVwulLB5neQDf8G11Zr/P9SZ9XH
 Fp9P6ybDEwaRs5HslNRO23209Lknw8ZKitreseYeqngfLsGtzlsDEmVw809uZvwZsbZZ
 aXzlocdS1LmRzB/+/QXflehiEZ0wJrmE5a7QL5hlhsBx5pHjOIh8VgP9PyeKVtz4yopK
 7ZIg==
X-Gm-Message-State: AOAM530WNpyP1g3LOGzfapr7GdXM+uRYCfsspbw36HnBtPUYefKb4ZPT
 Zi008uN12o2Z7fmw9DC9EGo=
X-Google-Smtp-Source: ABdhPJw+juNp86cxlqMgAnqmJUMMNTIlemg5zHcEmGRNGhL2jyUtf2DC8PEqnsNHMepTLTQNwgzflA==
X-Received: by 2002:a2e:9951:: with SMTP id r17mr602111ljj.113.1606507182492; 
 Fri, 27 Nov 2020 11:59:42 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:42 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 26/28] video: fbdev: uvesafb: Fix W=1 string related
 warnings
Date: Fri, 27 Nov 2020 20:58:23 +0100
Message-Id: <20201127195825.858960-27-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127195825.858960-1-sam@ravnborg.org>
References: <20201127195825.858960-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Peter Rosin <peda@axentia.se>, Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-nvidia@lists.surfsouth.com, Jiri Slaby <jirislaby@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two W=1 string related warnings.
- Using strncpy to copy string wihtout null-termination is not good.
  Use memcpy to copy only the relevant chars

- Fix a potential bug with a very long string, subtract one from the
  length to make room for the termination null.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Januszewski <spock@gentoo.org>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/uvesafb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 8ee0fc9c63cf..45dc8da191e4 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -423,7 +423,7 @@ static int uvesafb_vbe_getinfo(struct uvesafb_ktask *task,
 	task->t.flags = TF_VBEIB;
 	task->t.buf_len = sizeof(struct vbe_ib);
 	task->buf = &par->vbe_ib;
-	strncpy(par->vbe_ib.vbe_signature, "VBE2", 4);
+	memcpy(par->vbe_ib.vbe_signature, "VBE2", 4);
 
 	err = uvesafb_exec(task);
 	if (err || (task->t.regs.eax & 0xffff) != 0x004f) {
@@ -1871,7 +1871,7 @@ static ssize_t v86d_show(struct device_driver *dev, char *buf)
 static ssize_t v86d_store(struct device_driver *dev, const char *buf,
 		size_t count)
 {
-	strncpy(v86d_path, buf, PATH_MAX);
+	strncpy(v86d_path, buf, PATH_MAX - 1);
 	return count;
 }
 static DRIVER_ATTR_RW(v86d);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
