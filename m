Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD4425E185
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 20:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DBA6ECA8;
	Fri,  4 Sep 2020 18:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995C26ECA8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 18:38:33 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id g6so3445391pjl.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 11:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gN27klP+xvdh4VCRymNneqUuQ86dJp3MjSovTG9iYzs=;
 b=f0Jwou69C/7TrqqB9lFI94XYvQksANHuOhyqWyZAEqiCPI2LXXAyHq+VBhDJwZqu/f
 9xv7Ef6xDPfWyP00oHOT8gghENcZFMm0AzKbSLzhU3cbeNqAsDFMbcHzdEwI5XTNM/Ji
 qu05uN23dKizDUUkNBYmdZ9RJTc+sS+UG7JH8x/dPvLayMEFaNxGDWBpR5l3UM+ibT63
 0pb8KK17kD4v59k0lfGN/1XIe8gMFCMhqQfLXFm5UjonBtfHCMNV5I14q5xmLxATrj+0
 LMes5WNUxxTKP+/iShHzuEUIdPOCFESdY1A6qIa18+syOkknQKnebNyCnWn3RtorGH8Y
 eyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gN27klP+xvdh4VCRymNneqUuQ86dJp3MjSovTG9iYzs=;
 b=Qli6DfWPK4Rgls9YpVKc/rCu3QkESFU7lhROv76JK0AzRLErQqPReDhLVrVHZyopcf
 1bCSVlt5oeDGOZUPgtMc7mnUpIGm0IdUBJW8WvBHUmQRK4GQQlqcByOrf2GkS5sjlQfr
 ZQr8+hTeBA54aac+RDfpQKgBHRSaEXUEiAoPUMT0AyjRY7HqU78QmT52Ww849tnHF7Jj
 l9qzcv/hij82ANmaMwBB9uHEpGlI9kxiqpuY4pCZd6XXQ36Fo8Y/5q560cMQsSgSPj+o
 k6wh5E5BuUmPPK8cLElnTM40dwhj4JDOtd2EbTAuF2969OgGxSV38ju9+f1n2CfsME2n
 Jm5g==
X-Gm-Message-State: AOAM533K/UcPSzj6wdzIKRhuPkMAC44yg2idhzA+MMOqKeRX1LzEo46i
 WOuJC9Oj/lFFQ51UjfOMZ3bCbI4CXLRzLw==
X-Google-Smtp-Source: ABdhPJx1mAfm8y42Tj3AuikdpzX/Bi6i+SInA1f4QVddiIMinVeSGfBGVsvyI6a0Pq0L5SzYXkFY0A==
X-Received: by 2002:a17:902:ff02:: with SMTP id
 f2mr9652217plj.218.1599244712769; 
 Fri, 04 Sep 2020 11:38:32 -0700 (PDT)
Received: from ikelos.c.googlers.com.com
 (136.247.83.34.bc.googleusercontent.com. [34.83.247.136])
 by smtp.gmail.com with ESMTPSA id n128sm7635713pfd.29.2020.09.04.11.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 11:38:32 -0700 (PDT)
From: "Kristian H. Kristensen" <hoegsberg@gmail.com>
To: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Subject: [PATCH] udmabuf: Add missing compact_ioctl
Date: Fri,  4 Sep 2020 18:38:28 +0000
Message-Id: <20200904183828.657948-1-hoegsberg@gmail.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
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
Cc: "Kristian H. Kristensen" <hoegsberg@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Kristian H. Kristensen" <hoegsberg@google.com>

Make sure we can use this on mixed systems.

Signed-off-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/dma-buf/udmabuf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 9635897458a0..6f4ff6ede050 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -270,6 +270,9 @@ static long udmabuf_ioctl(struct file *filp, unsigned int ioctl,
 static const struct file_operations udmabuf_fops = {
 	.owner		= THIS_MODULE,
 	.unlocked_ioctl = udmabuf_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl   = udmabuf_ioctl,
+#endif
 };
 
 static struct miscdevice udmabuf_misc = {
-- 
2.28.0.526.ge36021eeef-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
