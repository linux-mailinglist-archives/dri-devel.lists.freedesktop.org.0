Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C7C123A78
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 00:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C8A6E1A3;
	Tue, 17 Dec 2019 23:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969CE6E1A3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 23:02:34 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id n67so39863pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 15:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3VSdK+Q3oU+Ob6pAeonMLNl/kQxpHR0a1ECGXtmC1Ig=;
 b=WFMRnDOWQgSC9531azT7MLOX0zk/ccjBPrPBwwvPmsS7c6hAu6AdsBIohRwiNA8isF
 RuggOuSBsy9hRj1oKY575d4m3WYSzSYoPQgf4AiHcvwKvXYdUf8UWdi9HyhqTMWcQ5JH
 0EiBYY/hrOH1d8rrQfSZHnbcknnTlSSHuoJdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3VSdK+Q3oU+Ob6pAeonMLNl/kQxpHR0a1ECGXtmC1Ig=;
 b=XAI2+dWZiIygJSl2BA/Cuf7OgzRG/ir3eMlwWc9WfVAizrR18/AoB4jeDFFiknxk0A
 KlyZT1f+yqG6545Rds2A1OdqBC+agrp5yiQcwOWc3ddTG6y9dtEAAOuyxwgRoASkWiLR
 rq89d5p5XVdgAv01BLJcbHndou9AIKoI1X7XPVm0sje91f2dtRjON8Qprz03IxIvfBAU
 F+QL6AupIncHI/6k2MzsQxaVd14QxxqE5CRTuU/YeJvC47dinFzPqMHu++MmLBGQh4DY
 O+yULjey21C0AnvR/jGCWOe1mxG4Zd6EsQhMzOB7SGkhoIHiWsVoh1uxNwDl4ZmNT6oQ
 5SDQ==
X-Gm-Message-State: APjAAAW2bgLMjmtBYwHS2MdyxcHN6xv8QR2aB1RoDTaIgiYuGiCokCbQ
 KgCCGZdulKX7aFqJ3FR3xdn0/i0zD7M=
X-Google-Smtp-Source: APXvYqzLdzvM/elDTcOkgsn8LQI/RWnWQJzD8sgzKD9n0qc8wWlagBirFkOWs+V8wCdGp9ZXw80TGw==
X-Received: by 2002:a17:90a:a610:: with SMTP id
 c16mr9537451pjq.30.1576623753877; 
 Tue, 17 Dec 2019 15:02:33 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r1sm4347272pjp.29.2019.12.17.15.02.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Dec 2019 15:02:33 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] udmabuf: fix dma-buf cpu access
Date: Tue, 17 Dec 2019 15:02:28 -0800
Message-Id: <20191217230228.453-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191216114207.g7afikcr4fssgx72@sirius.home.kraxel.org>
References: <20191216114207.g7afikcr4fssgx72@sirius.home.kraxel.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
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
Fixes: 284562e1f348 ("udmabuf: implement begin_cpu_access/end_cpu_access hooks")
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
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
