Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE4F25D1CD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0D56E23B;
	Fri,  4 Sep 2020 07:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8986E18E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 07:18:35 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id c78so1985159ybf.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 00:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=PmX0I6eT2YURcLLdGnXhZmf0MScAf8dv7HGsJ1sXFNU=;
 b=DpIq6zvBRfEwoHwQ8qZKLxDP+G3fZBrexAuPctyQkxYFwkGUmul33+VWVFCeuRrpWu
 INHE7ZwCLsNjjodzo3f+3xMBODihISeo0LjIV+6NCYxJXs9O5PwuV9ADLz8x+8nxSjnM
 WaOWwT8fohFEmCoyiBGf+q4/a4fQ6wLRf61qzDHqoiyS2j9c3WxOLOae0rIGAonHTapz
 CLAk42OU4iSkFenjylHMrmObnrRoWIExUZYOG1eBp7cCHG5LywyY+9AyTAoNdEsCqUlp
 Te6zK/TkmM8HBawWhjPJxuxgZD89wuPdTY4U9x+04l/PLRjWe+ZIRMyL2hC/xaZIzymG
 6Zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=PmX0I6eT2YURcLLdGnXhZmf0MScAf8dv7HGsJ1sXFNU=;
 b=hOhv2PljK9tU44He5I+yoZ6SbcHnHO4BVyE0B0dv5WgT5Mtx17SB2OtoKOlhBLPdpn
 onVAl/Gay/IOyah++DvXGX12EMQCIDx/Pxx9HeDOjoj57bQiOh69KNXIlu5uH7kggDVi
 ZYpEJT69SgbLyqvOsg8VyJ8FpX+cJCAiALlFd+dmIojFCm3RXZTGz4HcUMjPCNSJe1tw
 RT+zri+X5ZrjkVeNO1+BPtAOB9tG/11Y5bc4v/WjASj0tlsRDFbPkc6wuorFF6dPEj2i
 9UA7IM5fcIur3qbLINu2Mbw8EVXXEw1KxNOfXynWq5sDn071GDSen7bMxWU9SeGpGfXN
 of2Q==
X-Gm-Message-State: AOAM533mEPknvZ8gH8oK3+4oeru4LH+JFzMQds+zsru2fd+bbSNRmPsZ
 +3yv+EqXqiqf4JNyYxZVsxiTSsqSdcnzpVhkK2FgnR+Er9adjTXNKBhnnWOVlouoK+/Q4aRVgRe
 sDhKmyyVy2cBmX8/axBZbK8d5qZN6HOtUi9buh5J5sbVwQs7yju9DOFwWmUrZWadexE4aqP0VKt
 +5UhmQDQ==
X-Google-Smtp-Source: ABdhPJxUtTZqoe/RIpbjn7k0+J99XRQ/SYAkLLsaBsn1daCHBUTH3HOCh+/8GqS/Lz+StMtNPW/sbwBI2dePjC8=
X-Received: from ikelos.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:5eca])
 (user=hoegsberg job=sendgmr) by 2002:a5b:ec1:: with SMTP id
 a1mr972230ybs.18.1599117514391; Thu, 03 Sep 2020 00:18:34 -0700 (PDT)
Date: Thu,  3 Sep 2020 07:18:31 +0000
Message-Id: <20200903071831.328483-1-hoegsberg@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH] udmabuf: Add missing compact_ioctl
From: "Kristian H. Kristensen" <hoegsberg@google.com>
To: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
2.28.0.402.g5ffc5be6b7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
