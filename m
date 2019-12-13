Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 553F111EB21
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 20:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08416EC3E;
	Fri, 13 Dec 2019 19:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DA36EC3E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 19:34:10 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id a33so306865pgm.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 11:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kpXlgKh6m6btkMxA0zEadMaZZWHTIz1EIt/IbzSmGdc=;
 b=LY+4X4pWpqt4s6PaH3+/79XVnrg2Ghi+a/OZS5UGOHY8WFFB+32wOCdatVqRHRkBos
 /fK+MUx15Kn5tGjKgKMoPN67yojE+aFi1Tciox7AmizrmlHdBYserTQPXpDZgLog6Svs
 gtoXU9/Hen2M4LMinChS4miD+bYr+GFwSDQGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kpXlgKh6m6btkMxA0zEadMaZZWHTIz1EIt/IbzSmGdc=;
 b=WLqbReZoLHX9LPFZWYmVPjYw2NcEe9dxZgPPP1bLRFxzG8g0myWMtOFJ56rN2SG+82
 q5gAgBSq+peCoPxGPJep06osVTTt6g8dv9CaMHB9AE8pDk/1Tov6lzdJj1aUTsN7Velp
 IuBFcj1+C7avGWO5inEGdqzy4HfJGUj3uVC7PkbJzl1LlOxI1HYpweIJfgQvk6fSDphh
 vr5G8QoiXazW7N+CnI7etoIjApEldMFihj4rms40qZ0bI2L0frZNfXXHEY3PLcyDfIDo
 u0q8qDOsx68Pbx8WuFT4xYbuJfLXKyY4SSa2rXxutsjhwJnOGdRgnXDiTKwt4l4x3c7C
 YyFw==
X-Gm-Message-State: APjAAAWo9NZSRsJvczlNst3+eBbgTtYbxFzm5ii6vQ151+2zLIdQ2fAA
 zdn4WRkHadlnuWqOdBEA5srJOozu7hQ=
X-Google-Smtp-Source: APXvYqxq/zHREU0s/aonRwWNvmwnlyNyQdntjGALcAMn4mnwv7S/uHg22tryGZVVry748Y4VTYr/wQ==
X-Received: by 2002:a63:4641:: with SMTP id v1mr1163145pgk.389.1576265649990; 
 Fri, 13 Dec 2019 11:34:09 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id d24sm12836652pfq.75.2019.12.13.11.34.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 13 Dec 2019 11:34:09 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] udmabuf: fix dma-buf cpu access
Date: Fri, 13 Dec 2019 11:33:59 -0800
Message-Id: <20191213193359.1603-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm just going to put Chia's review comment here since it sums
the issue rather nicely:

"(1) Semantically, a dma-buf is in DMA domain.  CPU access from the
importer must be surrounded by {begin,end}_cpu_access.  This gives the
exporter a chance to move the buffer to the CPU domain temporarily.

(2) When the exporter itself has other means to do CPU access, it is
only reasonable for the exporter to move the buffer to the CPU domain
before access, and to the DMA domain after access.  The exporter can
potentially reuse {begin,end}_cpu_access for that purpose.

Because of (1), udmabuf does need to implement the
{begin,end}_cpu_access hooks.  But "begin" should mean
dma_sync_sg_for_cpu and "end" should mean dma_sync_sg_for_device.

Because of (2), if userspace wants to continuing accessing through the
memfd mapping, it should call udmabuf's {begin,end}_cpu_access to
avoid cache issues."

Reported-by: Chia-I Wu <olvaffe@gmail.com>
Suggested-by: Chia-I Wu <olvaffe@gmail.com>
Fixes: 284562e1f34 ("udmabuf: implement begin_cpu_access/end_cpu_access hooks")
---
 drivers/dma-buf/udmabuf.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 61b0a2cff874..acb26c627d27 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -122,9 +122,8 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
 		if (IS_ERR(ubuf->sg))
 			return PTR_ERR(ubuf->sg);
 	} else {
-		dma_sync_sg_for_device(dev, ubuf->sg->sgl,
-				       ubuf->sg->nents,
-				       direction);
+		dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents,
+				    direction);
 	}
 
 	return 0;
@@ -139,7 +138,7 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
 	if (!ubuf->sg)
 		return -EINVAL;
 
-	dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents, direction);
+	dma_sync_sg_for_device(dev, ubuf->sg->sgl, ubuf->sg->nents, direction);
 	return 0;
 }
 
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
