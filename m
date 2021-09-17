Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3EE40F7B4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727E26EC55;
	Fri, 17 Sep 2021 12:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ED96EC48;
 Fri, 17 Sep 2021 12:35:39 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t8so14941558wrq.4;
 Fri, 17 Sep 2021 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=15+uJTFQ+0nCVkT4/mZ7IrPmRTAjcaW6IMKjQRnhGys=;
 b=GnEDY2QZZLVo3N6y/3h/jMG/Fl//rb8DWsmVdxMaNQCfKakz2pqp4y4QJfHGQZrlev
 DHCXwHbKJvJqven9s8MIZUTJh/hAYNA18hmlD9sDYep0iAfAWtY4onOhOVlfDOEiW26W
 eldwTPDvHkWwz74bKWWdLE+Oo1C+nwZgWH3J1W2485DT89bccoqn1Gp1N33chZm1WTAf
 rYlMbRmmWTlNlCBAl912AD+HuCKiyKb5bLfgTYMVxgLXr1vOTwL62BQwIz/kT8jtQk71
 bCNuiBb8aZqR6hDQIy5NHDVBiMUh+++jut+tYNZhALAE+ulGCo+sC1O/d1l6zjlMRCgl
 70Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=15+uJTFQ+0nCVkT4/mZ7IrPmRTAjcaW6IMKjQRnhGys=;
 b=r9/pYBSxCq2Lit11R7ypfMKqk39oMmBahGRahYxtt1G4dzXh0gbCk7RQKtvjurdrTu
 bdt+etqmnWcO1mMAoJhYOGjXEdMbnqthpp5FOz6wi1ohvhirmrFqxFDF/0pr7PlfvoIl
 kWyNgQNY97o86KZ1xYj+ZBFmMe9Qy3E4igZm94zoBmPaqvXmSQATDD6C7ziR5V6JJVzG
 XOtl83ERU4gOAsMEp7+6XSplFyJ4X9RsyqOwSyP4JrMSBUyURP1fzbZqSmXIg60dLs/u
 VKgKXmnKLJ7NyIt8IwMMD3mrE+6Yak6lTR7W2mLCMcUYwzQLTxSX1zFsIaUXaQZRRkvY
 r/NQ==
X-Gm-Message-State: AOAM533uqATb2iTdN5RMJkXY87rR5vvo1cnbHq8We33ZfRr8wgtER80K
 dgBWkdnuhL33wtswLBDM7hk=
X-Google-Smtp-Source: ABdhPJzdTXHakNF50MDsYEldBoA37kWhAHaVU9uOM525IrV+75dybxQfkaNHiR6FU0vQleGYfhuaXA==
X-Received: by 2002:adf:f48e:: with SMTP id l14mr12138630wro.109.1631882138177; 
 Fri, 17 Sep 2021 05:35:38 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 26/26] dma-buf: nuke dma_resv_get_excl_unlocked
Date: Fri, 17 Sep 2021 14:35:13 +0200
Message-Id: <20210917123513.1106-27-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Heureka, that's finally not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-resv.h | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 8c968f8c9d33..f42ca254acb5 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -423,32 +423,6 @@ dma_resv_excl_fence(struct dma_resv *obj)
 	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
 }
 
-/**
- * dma_resv_get_excl_unlocked - get the reservation object's
- * exclusive fence, without lock held.
- * @obj: the reservation object
- *
- * If there is an exclusive fence, this atomically increments it's
- * reference count and returns it.
- *
- * RETURNS
- * The exclusive fence or NULL if none
- */
-static inline struct dma_fence *
-dma_resv_get_excl_unlocked(struct dma_resv *obj)
-{
-	struct dma_fence *fence;
-
-	if (!rcu_access_pointer(obj->fence_excl))
-		return NULL;
-
-	rcu_read_lock();
-	fence = dma_fence_get_rcu_safe(&obj->fence_excl);
-	rcu_read_unlock();
-
-	return fence;
-}
-
 /**
  * dma_resv_shared_list - get the reservation object's shared fence list
  * @obj: the reservation object
-- 
2.25.1

