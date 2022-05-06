Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5290251DA16
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 16:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F77110EE7F;
	Fri,  6 May 2022 14:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F49F10ED8B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 14:10:15 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id c12so1380351edv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QNt760DjFBo7HAT2HJsEWq9kQPdH1wnsqRHak7OGdbE=;
 b=C2w/6N6kbyW7wVnzjHEOL+TPmgmnkRUjE4m7nOD0xETPp8focvjo6CypBlsChAFjdH
 rIYi5xu4cR7HFotKDwR/oi2wvpCLJyQ/Iqq07iNVjrJbN8ISFmXogi0dAO3Jxx7SkmU4
 MOyoIiT75Gh7/1zH//eMuwRZ5WI7NtDLtFwZ9R5qgDyQk9k2x27IR79vVvc7qetLDs9F
 mB4d0A7Of9GBAJR7GLYDVjHG6ftXGFXhlUKgr1JuV7gaCebYbNBSBkXunxic38FXLmrh
 TTkQjQOmES6doapjyvA0yToi+JAZXUG1ezejkLs28vHTZy8sX7P3ZtU32v9yjGenzF9V
 wWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QNt760DjFBo7HAT2HJsEWq9kQPdH1wnsqRHak7OGdbE=;
 b=nVtpZjXptnjKEzbvDijLRSczRIGcAhgpGWzwMziQ/1b4tmzO3oH+64K2SbN5rTQmWg
 NKCI2X4LVuourhZxWeLCXwen17P95uzvTLlokptORh0AyEIUO+FuTEP5xMsH3ePYHu6B
 1rzNbs5jrtyt8SOEmvwh0nW9MYCo2nVfDxdDSDXV79tznw0w6Uygj0NX2eH3apOLs5MD
 PkISTAMjBt68B1pH3fP4qF75gTzojO9LyXKQfMu21EL2rtw9d3ohxuhL2JYDv5bbRlTe
 /cLWEPPzNHWw8anLnqxe2PQDddI9DFivFnXK9wqEIUaJRHRm5NefY92ueubMwrCv678X
 vCjw==
X-Gm-Message-State: AOAM5326JbWOwajdZU4t6dBSsp7BLqVCj0uTiCFXIUM83hAyMurpkO3t
 X+eOP0ITsKjEawKuHOICbY0=
X-Google-Smtp-Source: ABdhPJxuGXiCo/++b2braxDlEZUUiIW9zHboM3NzkydRtAsGo5ltD8AOTRLv4lnCa/0vWeRSaQqT8w==
X-Received: by 2002:a05:6402:3490:b0:427:b471:9e1e with SMTP id
 v16-20020a056402349000b00427b4719e1emr3624011edc.36.1651846213529; 
 Fri, 06 May 2022 07:10:13 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 jx3-20020a170907760300b006f3ef214e22sm1915415ejc.136.2022.05.06.07.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 07:10:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: [PATCH 3/5] dma-buf: return only unsignaled fences in
 dma_fence_unwrap_for_each v3
Date: Fri,  6 May 2022 16:10:07 +0200
Message-Id: <20220506141009.18047-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506141009.18047-1-christian.koenig@amd.com>
References: <20220506141009.18047-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma_fence_chain containers cleanup signaled fences automatically, so
filter those out from arrays as well.

v2: fix missing walk over the array
v3: massively simplify the patch and actually update the description.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence-unwrap.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
index e7c219da4ed7..a4d342fef8e0 100644
--- a/include/linux/dma-fence-unwrap.h
+++ b/include/linux/dma-fence-unwrap.h
@@ -43,9 +43,13 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
  * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
  * potential fences in them. If @head is just a normal fence only that one is
  * returned.
+ *
+ * Note that signalled fences are opportunistically filtered out, which
+ * means the iteration is potentially over no fence at all.
  */
 #define dma_fence_unwrap_for_each(fence, cursor, head)			\
 	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
-	     fence = dma_fence_unwrap_next(cursor))
+	     fence = dma_fence_unwrap_next(cursor))			\
+		if (!dma_fence_is_signaled(fence))
 
 #endif
-- 
2.25.1

