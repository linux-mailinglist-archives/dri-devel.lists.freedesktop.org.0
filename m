Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEA050CA43
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 14:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C1E10F7A4;
	Sat, 23 Apr 2022 12:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418FC10F7A4
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 12:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650718589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fXS1wYFISLzf4YrpSc6l5RCrDLoiak/N6nEId/I9Cks=;
 b=CbG7hzMYxAGtxmJ0Hf7aC3dmTVjerr7LgaaQRYk/Z0p9Bwpom3TPrEWYaE/fpU71TnQzCc
 n2o3iWYxDVDOdU/YCUCFe8MBIQ4EEYjJZRTspbbpWpG5+StFONMq4rkmi0WAEQ/Qr2WRL8
 YRxk4N3dDfuPWniYOT77ry1dXpfg60U=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-7zXg_zdrNy20tMYNtusokQ-1; Sat, 23 Apr 2022 08:56:26 -0400
X-MC-Unique: 7zXg_zdrNy20tMYNtusokQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 k15-20020a05620a07ef00b0069eab7275d5so7296760qkk.5
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 05:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fXS1wYFISLzf4YrpSc6l5RCrDLoiak/N6nEId/I9Cks=;
 b=azMH3LBA9U3EPoKZDdOT4w/STX9LJRcljvvCol9xi56CvH0bXVjYlUHmYfkm6wUix1
 peHflkx3FWCtgmOx7LU+iX28F4ELzUp7x/w2sxmm/uqfi5z51eci6pls14pXkqB4wsLe
 dN5CXjszrfClEv+LRX9PNE8IFCA7odWGgHNkRbzSe8wqXwVXv8IvqLt97aUZtHZpehz1
 KFqFMiuFwKdZk/HGl3f4EllTCTOCRct9KydFmD+lUodROrucFQK55lsEDXbhvljSxQa3
 ICPVYo/JXCyhqBhuegEXdMZK8BTqivnqk4qEtG0kQjqkUlL2+JGL1UbT7nI7exZzSanS
 9L4w==
X-Gm-Message-State: AOAM530BbGlm3T4czL4D1MLOGnjFsN6vwFPjXhS3AxyW/InUdCELgKy5
 p/1Nhe4s9VgjinEaiUMr1d+Xj/HAafKD4tUhTEyQ4gMHorp/Y7ROwLEcttIceGhZtTNwX3zCrM6
 256Z8IuaeZnzVkbyxVcjyZR9AGwmm
X-Received: by 2002:a05:620a:44c6:b0:69e:9bef:53e3 with SMTP id
 y6-20020a05620a44c600b0069e9bef53e3mr5447566qkp.481.1650718586188; 
 Sat, 23 Apr 2022 05:56:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhlweP7vkujEfw3nfYFCm7iGeT3wgX5eOb2GZoLM/GocC/XMB64gi5W1GtgsEOcxr1gb7hWw==
X-Received: by 2002:a05:620a:44c6:b0:69e:9bef:53e3 with SMTP id
 y6-20020a05620a44c600b0069e9bef53e3mr5447553qkp.481.1650718585973; 
 Sat, 23 Apr 2022 05:56:25 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a05620a12eb00b0069c88d15b6asm2240097qkl.68.2022.04.23.05.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:56:25 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: daniel@ffwll.ch, deller@gmx.de, sam@ravnborg.org, tzimmermann@suse.de,
 javierm@redhat.com, cssk@net-c.es
Subject: [PATCH] fbcon: change fbcon_*registered_fb variables to static
Date: Sat, 23 Apr 2022 08:56:18 -0400
Message-Id: <20220423125618.1916005-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sparse reports these issues
fbcon.c:106:16: warning: symbol 'fbcon_registered_fb' was not declared. Should it be static?
fbcon.c:107:5: warning: symbol 'fbcon_num_registered_fb' was not declared. Should it be static?

These variables are only used in fbcon.c. Single file use variables should
be static, so change their storage-class specifiers to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/video/fbdev/core/fbcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index c4e91715ef00..225ac0fe0143 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -103,8 +103,8 @@ enum {
 
 static struct fbcon_display fb_display[MAX_NR_CONSOLES];
 
-struct fb_info *fbcon_registered_fb[FB_MAX];
-int fbcon_num_registered_fb;
+static struct fb_info *fbcon_registered_fb[FB_MAX];
+static int fbcon_num_registered_fb;
 
 #define fbcon_for_each_registered_fb(i)		\
 	for (i = 0; WARN_CONSOLE_UNLOCKED(), i < FB_MAX; i++)		\
-- 
2.27.0

