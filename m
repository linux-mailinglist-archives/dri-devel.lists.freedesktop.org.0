Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81E72C7650
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D396ED11;
	Sat, 28 Nov 2020 22:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D147B6ECF9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:42:12 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f18so10580145ljg.9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZRt4lLEdkGpEheHIyz2EqOhIIOjIMs1Mga1VdLe78eQ=;
 b=VoeefBvOMOJ6OPNTHJueecfrE6MmXuxLmNAA7cf5fmmxdPCgKYiwLWmH2i/opDC6sb
 t2wUpQXZ0vl5Aq+uHV8XCavGj69kuY9c/wcywlu+r13J3tGkHyrSdt5gMtmDv1Or3Ieo
 yd4NDx9JHaO3gnY3c+ayBjJbt6aOVoHx11VW2VKsVwOOiaPXataGW/2aFjxZPHDZzRnR
 XWtn5MCmb/sz+kQbC/3AxqOkJtdleD6MXcqtqkossYU0oqoWKpofMfqz2eMEv2PIxj1k
 Gs2DOrVRDxy78Lc4rwOQt6RY8+A6k13+Er2FE81M5dM0UojhZULp9TpP5VCeNlliMwkz
 MosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZRt4lLEdkGpEheHIyz2EqOhIIOjIMs1Mga1VdLe78eQ=;
 b=lY0OqGcfrH0GPRWZT9rqYOLlpEq+wybokca/4vjZ13WwddFeReD7lKOloyMVCU8UDo
 2gfGjPNjXsDA4v1Sq+kdsHrGh4MVrwIn54VxCei1FaZynTVI0PM5zWKtuY8XkxNY+XF0
 rqcvySOEvw3YOujQ+bfGAb542fCfT4IbBnMyjJJn5ZrRmvo4OAm7FhjffeFjNNPCtcl5
 s5LjrbU2cWopeVA5UIpAroGYpTueM61x65EzhD5/lAQjxVpFG+IvCKqDKAFpb47HjLYW
 5nL2UMETSBJypEwmlVrmMm+sbRxeHBxjJ5kbtdFRbE/5hBe3Xb68VyNQI0MbX+teOOJN
 tuuA==
X-Gm-Message-State: AOAM531rJpyjbIWXNRKwrf170hr82yI0MfOSxNWGU/Tkdh0rEBf4D+qe
 CrFqy6YNG7dSPCcShm8ea1I=
X-Google-Smtp-Source: ABdhPJw5sH53JFBNC5Ek0t8nEkH9FBrmhoJ3Sp4EDqPZMMaNkgPKGnG3059fsYGH0P8ePoAWQa4rXg==
X-Received: by 2002:a2e:2416:: with SMTP id k22mr6507511ljk.201.1606603331314; 
 Sat, 28 Nov 2020 14:42:11 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:42:10 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 26/28] video: fbdev: uvesafb: Fix string related warnings
Date: Sat, 28 Nov 2020 23:41:12 +0100
Message-Id: <20201128224114.1033617-27-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128224114.1033617-1-sam@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
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
 Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
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
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
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
- Using strncpy to copy string without null-termination generates a
  warning.  Use memcpy to copy only the relevant chars

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
