Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ED9231295
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E2E6E2DC;
	Tue, 28 Jul 2020 19:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5E96E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 11:53:38 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id l13so2592501qvt.10
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 04:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9b0/x+SNOsArF0QozJjz6aJQuh2KJ70gscVHnalujy4=;
 b=tebaVCGFtEwcxHEM2mSMLHj+/y/YIqY5F9PfjQr+R28mNZgbYk25oEbZZId/XZ0s3P
 tyGFy7H5tAKQH/KcvFG7RcKLdtt/qqcX2osS0vTQJ/3rUpnTnbtfiDJ18KDKt9nZIzGb
 jioEWFF54X/RJ4UBRAI9O+jT36f7HD+T/xOTD9lKZ+UDK636bylzcmIRkD7DOA9185ON
 jJG7VOHFIS3KDo49DOPfTt8B8gh1BvSt7q/oevhavy3mNdL7jkhDMD98eP3cCfzNmA6a
 4JHhj/cTKGPEzg0ULWSgB+t3qfMc0wvywvSPhcRbk49lv6ar4UEgPv6Ss42pOY9LvMo+
 N4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9b0/x+SNOsArF0QozJjz6aJQuh2KJ70gscVHnalujy4=;
 b=CXUDPiIlvPC1NyXY0oPKwNuQr/WVwS/TBbTbGaALPbM2yUkF1ABhSp67af/BfiQNHd
 532o9byrNPE2SGhzeh76Ci3LNN3odnz2r7x2Hcb8YjQxGL6Zlsf+qYkcgDcs4H4iNPHB
 EiLU4s5asIvtcEQYHMbFLFTOywRkO2Rpoeaafg4xmrJQWOlo8uTjQVmEETaWtQvJ0vq3
 I7biUWRyuskoM0OQU1Cj/0QPA9p7uQxaWnCBDGRW5obukBZRnzCjFmueQvxREV6n8RX8
 AZ9Wf+zrKqZ/ojrG9xspwat7unu+RbbYXCICSqcPggZbs9/7y4ATbR3wD1qML3Uv0o5B
 bXbw==
X-Gm-Message-State: AOAM533gV7JwrGP0H1tQMuJkisjd7CXCOLRWAFfatm+HB+eHILWbLIlE
 xABtggcH/CFO1sKI5+vu9w==
X-Google-Smtp-Source: ABdhPJytWHbSuKSgdqrZHnoY6Cfo5vrUorIiwqfDq+wpVnip+5M/a1iy0umq4my1/dRXaNveQev4oQ==
X-Received: by 2002:ad4:4152:: with SMTP id z18mr154690qvp.42.1595937217951;
 Tue, 28 Jul 2020 04:53:37 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id t65sm21273750qkf.119.2020.07.28.04.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 04:53:37 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [Linux-kernel-mentees] [PATCH v2] drm/bufs: Prevent kernel-infoleak
 in copy_one_buf()
Date: Tue, 28 Jul 2020 07:52:10 -0400
Message-Id: <20200728115210.408486-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728014343.341303-1-yepeilin.cs@gmail.com>
References: <20200728014343.341303-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently `struct drm_buf_desc` is defined as follows:

struct drm_buf_desc {
	int count;
	int size;
	int low_mark;
	int high_mark;
	enum {
		_DRM_PAGE_ALIGN = 0x01,
		_DRM_AGP_BUFFER = 0x02,
		_DRM_SG_BUFFER = 0x04,
		_DRM_FB_BUFFER = 0x08,
		_DRM_PCI_BUFFER_RO = 0x10
	} flags;
	unsigned long agp_start;
};

copy_one_buf() is potentially copying uninitialized kernel stack memory
to userspace, since the compiler may leave such "holes" (around `.flags`
and `.agp_start` fields) in this statically allocated structure. Prevent
it by initializing `v` with memset().

Cc: stable@vger.kernel.org
Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
    - Improve commit description. (Suggested by Arnd Bergmann
      <arnd@arndb.de>)

 drivers/gpu/drm/drm_bufs.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index a0735fbc144b..f99cd4a3f951 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -1349,10 +1349,14 @@ static int copy_one_buf(void *data, int count, struct drm_buf_entry *from)
 {
 	struct drm_buf_info *request = data;
 	struct drm_buf_desc __user *to = &request->list[count];
-	struct drm_buf_desc v = {.count = from->buf_count,
-				 .size = from->buf_size,
-				 .low_mark = from->low_mark,
-				 .high_mark = from->high_mark};
+	struct drm_buf_desc v;
+
+	memset(&v, 0, sizeof(v));
+
+	v.count = from->buf_count;
+	v.size = from->buf_size;
+	v.low_mark = from->low_mark;
+	v.high_mark = from->high_mark;
 
 	if (copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags)))
 		return -EFAULT;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
