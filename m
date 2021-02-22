Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E0321B53
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 16:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7736E0E7;
	Mon, 22 Feb 2021 15:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461CC6E0E3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 15:12:49 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id a207so14716238wmd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 07:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YByzcYLbOT1FbVq7W/iPz1yV9tO4yNodoZHiZ+8vsb4=;
 b=R5bTKuwSZfiTHw6sQBKH/77xOM7ENB9Wls1sA2mT5ciYD1/ZMOeou2Exj8X3p+MbPY
 cUoivQD3TUa4RigPCyw3YoC3o1vIfe8umtW75zeiIxpZfHKb/h6bxwZVexAZHXWmDLBm
 OEcua6ZvtH4jIMiyhrS56W0+nTqUXMm7bN5XC1qRoxtiJiKLYdQD7gTbCoNU3lS1l0E2
 gIRp+GBzjvJxR3vo1aYTFOBh4bfPnPbk7dx5MsQeOya+siDPjpnDs26vCPWnenTSPN/v
 yVHVAt/sq16RjIBcpQYcl9AiT1IKbIeB3AC7Y+i4njEdWtdOqL0QAaG43ySBwD+7AMlJ
 fI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YByzcYLbOT1FbVq7W/iPz1yV9tO4yNodoZHiZ+8vsb4=;
 b=Vh0V8/kUL/DtOT3VicZj1fGay7ZxnKTjywxYiDJ3/i8TMZZb6xSGUwk36Xaf33KOBm
 Afv3pbNY/hFV5/sgwp0aTn03pE0RIJ2Ik4LrSre3TiVXm/eCMK8zvGQQKR1zqThq2ggr
 G0tHK7i8h833ye6A2k9vfyITR+ia7EMMEEwuM2mhAr9SS0m15Khe9nuz3Iy/fZLt6Nha
 7N4F4snX3Kbc5DJox61Yu+EdXZ+gNxpGhq4KsM+fFmhX3PR1tTgOS3Q7P1JIGCN9dcZc
 dDgnH22hMbLQOW09HcV6MLAyLl7maWgYXKJmo2IkVuF+ZBxH3mEx2XoY7yVhTuOp3eqj
 amag==
X-Gm-Message-State: AOAM532G1ewHcL5zdZlG5AoTtFO2hyajeZVr9EpbRgy/6gIUusilWwJT
 I3pMAimhI/EZmeUo5MHwgkU=
X-Google-Smtp-Source: ABdhPJxU2vGpa+8wC1SXGOcCy8k2fmqGbntcVq+4bVDVPsoZbAKl5HHMxz/ILTdabK3Q5VQIwNIKDw==
X-Received: by 2002:a7b:c184:: with SMTP id y4mr13880282wmi.1.1614006766877;
 Mon, 22 Feb 2021 07:12:46 -0800 (PST)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
 by smtp.gmail.com with ESMTPSA id m17sm24783523wmq.5.2021.02.22.07.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 07:12:46 -0800 (PST)
From: Romain Perier <romain.perier@gmail.com>
To: Kees Cook <keescook@chromium.org>, kernel-hardening@lists.openwall.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 04/20] dma-buf: Manual replacement of the deprecated strlcpy()
 with return values
Date: Mon, 22 Feb 2021 16:12:15 +0100
Message-Id: <20210222151231.22572-5-romain.perier@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210222151231.22572-1-romain.perier@gmail.com>
References: <20210222151231.22572-1-romain.perier@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Feb 2021 15:25:09 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, Romain Perier <romain.perier@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The strlcpy() reads the entire source buffer first, it is dangerous if
the source buffer lenght is unbounded or possibility non NULL-terminated.
It can lead to linear read overflows, crashes, etc...

As recommended in the deprecated interfaces [1], it should be replaced
by strscpy.

This commit replaces all calls to strlcpy that handle the return values
by the corresponding strscpy calls with new handling of the return
values (as it is quite different between the two functions).

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 drivers/dma-buf/dma-buf.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f264b70c383e..515192f2f404 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -42,12 +42,12 @@ static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 {
 	struct dma_buf *dmabuf;
 	char name[DMA_BUF_NAME_LEN];
-	size_t ret = 0;
+	ssize_t ret = 0;
 
 	dmabuf = dentry->d_fsdata;
 	spin_lock(&dmabuf->name_lock);
 	if (dmabuf->name)
-		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
+		ret = strscpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
 	spin_unlock(&dmabuf->name_lock);
 
 	return dynamic_dname(dentry, buffer, buflen, "/%s:%s",

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
