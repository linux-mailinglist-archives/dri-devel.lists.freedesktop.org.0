Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142B12303B4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D006E1A4;
	Tue, 28 Jul 2020 07:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F63A899E6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 01:45:32 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id e13so17290402qkg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 18:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YjnA1D1K7ElpFXMn7MlHX1aExmoTvW00G3z3st5LogM=;
 b=qPuGtMvXjFKTqPMP4hVzimuIwTZQ1FlTw4vqUKaNSKU99KqaO6Im988hL6y6XkP5V2
 qVOFVZeATU9MV0hSUENBapGZ7GLtyN/Zblmf/4fCo1UH9ehlDGFpi9aqTjRKGiQ6zRBU
 ZnBAzkC5VY3aa0sUUqOhdrf+7j42xFbvu//GIiSzF9TiQsOp/yfcYIX1oGvGIKFyxM9S
 k6HkJu8JFS6URc1k9uYTJoCOa4PJ5UY0inf+26gI6iMl69ihRgNzPEzBeVcRFFJQcV9I
 jbLBMpuzcqx06gqVV3mMyG3T5p5MGCTM/NG7cd9z8NytqeSC9Ht4zrrYiKX3jZsT64Y/
 p3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YjnA1D1K7ElpFXMn7MlHX1aExmoTvW00G3z3st5LogM=;
 b=cT9cU8e7btOpppupMue4MNAmNQMH0fjawIi47/Lf6YsK8FZm+QG/GCU0ercH+gCT5E
 TXswXzpG/SFCTGK6U3dEpkSdt5tQ2ece5Key29TNC61IEpyy0efRlxIYfaxfoAuyqUVv
 pttJBwDewFhVwTqXUk2hqRQBv6C/+d6jNgictnq/u5GYkuSffe2X53yaY56/vB4ejM2i
 xT6bbXsEVLeoqO9nbFHSHrr0JIqHpVOnD/oxoL1DO+HRcUKeAySY0ZK0OnmKCwQVdwHI
 BsdrT8W4gHtOZfXKxFGmfDswhUIA/N3sCtm7nICUkzm1TWiVmgheBU5EaeJQXE0gG6z6
 lExg==
X-Gm-Message-State: AOAM533RgBavqIn5awM4ptBJGFCSqRg8U/exufWuABc8bghgiNngIAOf
 g4nI68crz/NTGshIsz1y7g==
X-Google-Smtp-Source: ABdhPJxbAIs557upvT1yY+aGvvScvjxCli+NZkmPpkJ7H5akQf1y/Q9yw/gGLnLoqu78WGuR11jD5A==
X-Received: by 2002:a05:620a:553:: with SMTP id
 o19mr24583291qko.46.1595900731268; 
 Mon, 27 Jul 2020 18:45:31 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id d14sm16585473qti.41.2020.07.27.18.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 18:45:30 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [Linux-kernel-mentees] [PATCH] drm/bufs: Prevent kernel-infoleak in
 copy_one_buf()
Date: Mon, 27 Jul 2020 21:43:43 -0400
Message-Id: <20200728014343.341303-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 Jul 2020 07:17:27 +0000
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

copy_one_buf() is copying uninitialized stack memory to userspace due to
the compiler not initializing holes in statically allocated structures.
Fix it by initializing `v` with memset().

Cc: stable@vger.kernel.org
Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
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
