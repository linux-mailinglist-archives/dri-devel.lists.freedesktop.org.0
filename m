Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E3270D6EF
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A939610E40D;
	Tue, 23 May 2023 08:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED83D10E3BE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 02:19:47 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3382dc7d50bso2375445ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 19:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684808387; x=1687400387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kzTqOaIPWfW9eLUYmANhI0oqNLmXhJYkC7KiwdLC9Pk=;
 b=HSD7l7aKqkH7bpomTMkzPvcKzQpp2eYwyn0IteDdsQLQjpEWrRaSrLc67veKl7F0/T
 cn2iJlW2p3p+ttdzw9ZAV7HQ8xxxsTjGKeDqk9ze5VrKHVaDEi+t3OW7XqBuV/glXXnC
 D2eds/9o/cQ3eOaOppD0DjNpMbm7bViiVNn4xVcB+ZMtP9Pzx2mqEv3rSuUKAgMxU6nL
 gqqvNmyRkrNekvbh16k/UGWh5sknRUXgxI9DzPtYOgcYIE58tIKFTJbuDRwL5PBaJyQ5
 8aQnfvzVb1Tev33snfKB5whGHevkySQHAoZR2clKZs9dZU5d0XWHlZc0r5BlpjMUYgkj
 FfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684808387; x=1687400387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kzTqOaIPWfW9eLUYmANhI0oqNLmXhJYkC7KiwdLC9Pk=;
 b=AUKi8FKT7cobqMa5LN9kfyPQm/hyizgF20gvYEolH8jK0xIIIh9UtoW8uDuiZMIw3Y
 ea39c8sGe4dLzTxSyknWvRDtkcsklrJrW0DzxeCVnxToNMS7EMeDSl+vaNHprcLQ0gqs
 wGOsSIvsVzjDTmSPY76qQ2RPciP8Kub4QKXG5msVsda00ZbNc75wn4L9q4fy6smqcPPJ
 7lAdVdg1KuCdbEOv9axT7nkBAPCptAtPAyoARIThCGrsgANKWvxWci70rYuDeciSR5oI
 qkSvHPAWEqiUctmqGIWrqe12jYFSmJdEFJAmv3Ovt87bdJP3hQHr5Qv60UYgbJbW5u5I
 NPQw==
X-Gm-Message-State: AC+VfDxF3qhTdonUqEK/2nJoTZUL5rnbpJ6sFLIXTECFmIF85yEJCEfl
 BepF+kQIW4jCr5DwYn3ZxtM=
X-Google-Smtp-Source: ACHHUZ4+DJLABRuPBSRDE1JxdVeIA6RNnSI8JrvW9bu3YuMmFMvYwh3HXeHrlA5FYY/ygXGrB/itLA==
X-Received: by 2002:a92:d8cf:0:b0:338:1a22:bf47 with SMTP id
 l15-20020a92d8cf000000b003381a22bf47mr7507410ilo.21.1684808386720; 
 Mon, 22 May 2023 19:19:46 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com
 (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a920601000000b0033549a5fb36sm2131699ilg.27.2023.05.22.19.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 19:19:46 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH] dma-buf/sw_sync: Replace all non-returning strlcpy with
 strscpy
Date: Tue, 23 May 2023 02:19:43 +0000
Message-ID: <20230523021943.2406847-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

strlcpy() reads the entire source buffer first.
This read may exceed the destination size limit.
This is both inefficient and can lead to linear read
overflows if a source string is not NUL-terminated [1].
In an effort to remove strlcpy() completely [2], replace
strlcpy() here with strscpy().
No return values were used, so direct replacement is safe.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
[2] https://github.com/KSPP/linux/issues/89

Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
---
 drivers/dma-buf/sw_sync.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 348b3a9170fa..63f0aeb66db6 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -85,7 +85,7 @@ static struct sync_timeline *sync_timeline_create(const char *name)
 
 	kref_init(&obj->kref);
 	obj->context = dma_fence_context_alloc(1);
-	strlcpy(obj->name, name, sizeof(obj->name));
+	strscpy(obj->name, name, sizeof(obj->name));
 
 	obj->pt_tree = RB_ROOT;
 	INIT_LIST_HEAD(&obj->pt_list);

