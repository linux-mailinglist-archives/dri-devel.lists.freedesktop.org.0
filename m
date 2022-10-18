Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCBD602631
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 09:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741FD10EEC8;
	Tue, 18 Oct 2022 07:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EC410EEC8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 07:51:23 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id l1so13036822pld.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vl1/9ecW7HlTpZtLd+FURiia+/oZgLLP0reQXEaxp9o=;
 b=XwJwK3PJkvykkn0S5pGaZYkikEofEiVjJheRW4oOoKev2JE3DDM3XariJP/edXDo81
 ZkdksitDaNko4Nm7vlh8MzlIJaQ9t3QfQdni+SaYCed4k1QIVsl5GRfZYfuTiQk8Lc6r
 FUOsM4C92LPDmilPmf+5KPJulsnGAnER5cJl/WfocCGF/EeIQdjaFZ2+zdN5sedq18kr
 mD6w4HhzHgH4j/7tHj2LYCdZ5cHyCoGkvwa8np3mPpejWuwsAQs2DJ7qeferWZfwcbGF
 79+w+myDh7BiacNkQpvUp8fmyOLVFV7GqyQ2jn/Q/uwT0Tk8PwMHbzAXzxwFWyZhZSPN
 R9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vl1/9ecW7HlTpZtLd+FURiia+/oZgLLP0reQXEaxp9o=;
 b=g1ShruM5cx+X6+rp9TfeCVsHPw6J6QC7HAnx5Ao4p4Jgi5hNMx6QaoN3aoFsXIF2+Z
 8EK/3Ysw/S4rh5XRcLPk4JhWHPpj2O8gXaCszT+zdycZZvDbVqdgUwac1QaIvJkpvw/z
 ZwKfROp35p5c9oAl+bk4HB5VX1Rpa9PxGigBrToUzHOwVHkUAij6c0k7N1ZBkG2yTNxj
 Gls86CQYYFtxS8tINkViPsPhW4hwcXaUBzUJTjC6rR/R2XFeEwNtkAXaZfX0/1BesTY8
 mg73T0ZPkesCwb4h7C/XiRKqJB9rYOErEmxQ+Umrj1GzEDWZKQBQ0YXvFoDRFhlgmsWW
 xnbg==
X-Gm-Message-State: ACrzQf1fQo/0I3i/z0amMTOH/VcR+mRiN6Ira8u2bOnhT+EADvCbiiUA
 4tMtN2VJjuJFNZK5L/a3/6M=
X-Google-Smtp-Source: AMsMyM7phLraWst4ozJkYCzYw63EtiFbS/zuVQszTlq88IO4Xq/7s4KAOuCblGjNUCz26cSQVTrpaQ==
X-Received: by 2002:a17:902:d4d1:b0:185:52c4:f4c6 with SMTP id
 o17-20020a170902d4d100b0018552c4f4c6mr1794027plg.154.1666079482728; 
 Tue, 18 Oct 2022 00:51:22 -0700 (PDT)
Received: from carlis-virtual-machine.localdomain ([156.236.96.164])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b00176e6f553efsm7901882pli.84.2022.10.18.00.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 00:51:22 -0700 (PDT)
From: Xuezhi Zhang <zhangxuezhi3@gmail.com>
To: zhangxuezhi1@coolpad.com,
	deller@gmx.de,
	jiasheng@iscas.ac.cn
Subject: [PATCH] fbdev: gbefb: convert sysfs snprintf to sysfs_emit
Date: Tue, 18 Oct 2022 15:51:18 +0800
Message-Id: <20221018075118.922212-1-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@coolpad.com>

Follow the advice of the Documentation/filesystems/sysfs.rst
and show() should only use sysfs_emit() or sysfs_emit_at()
when formatting the value to be returned to user space.

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
---
 drivers/video/fbdev/gbefb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index 1582c718329c..000b4aa44241 100644
--- a/drivers/video/fbdev/gbefb.c
+++ b/drivers/video/fbdev/gbefb.c
@@ -1060,14 +1060,14 @@ static const struct fb_ops gbefb_ops = {
 
 static ssize_t gbefb_show_memsize(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%u\n", gbe_mem_size);
+	return sysfs_emit(buf, "%u\n", gbe_mem_size);
 }
 
 static DEVICE_ATTR(size, S_IRUGO, gbefb_show_memsize, NULL);
 
 static ssize_t gbefb_show_rev(struct device *device, struct device_attribute *attr, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n", gbe_revision);
+	return sysfs_emit(buf, "%d\n", gbe_revision);
 }
 
 static DEVICE_ATTR(revision, S_IRUGO, gbefb_show_rev, NULL);
-- 
2.25.1

