Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C152350F15
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 08:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A416EC6F;
	Thu,  1 Apr 2021 06:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C0D6EB8F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 22:07:27 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z2so21125305wrl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 15:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IE0NHC+B7WM4oHnzUAb/T162fdB57ZZtfDzZlQLPsWQ=;
 b=cESdP8es/GN0f1lVMQaBFDBcGDJ1lIamwN/O691MvzEUjqi2bufaO1gaOoS9Ynbacy
 3ul0+Hxi8sOyKWS02Z9WdRpc5G7DWiB8YlJJhe+qYfNebwhioubnM7IoYjjqnac70G+1
 zYQqyMfCxQNMy197l6PyY/s3HHCXKFwZfjt8z+WL/Iz1yTNVyn1R5ZjosSHF42udHtyh
 ANaXWn7yk7CAMCxaUvbdw36u6WTd6IYqS7qYzDV7FiBNr7v8WyuvWyLFc33FBA7Mq76Z
 x5V+xN03fl1rqTHLaq6kW5uX+Q9V/HuoH+kIAfE+u+4SVXPV7r8JM9r5g+1Vpty6MP05
 073w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IE0NHC+B7WM4oHnzUAb/T162fdB57ZZtfDzZlQLPsWQ=;
 b=GyrcJlXKFnQdYqAfQtgJQxZfnQC3eMdo6iWLTYhxz7iHVYHbn4pk8Ifmc+E8+uDpF4
 U2E4VPV9pR9WRpImeBROsJWFeBruA5jcpOViiu8mqKkwUCu/l9BBPQoAkl7NYJzVSm13
 65OckHglGSq8A2xBb+sJwycLgMROSwzJxIhq6fTu+4XEy365LjjlXkJ0qpsCT9ttsN5P
 daDAvS4XWoL2libcFi/Ej3zn1NHFKUd3EwW0EY2VKLZ0ezYdnrdehjkbHihmHcmwUopm
 xUzjgzfmhbXnSv1cIxigEZa0xiPcCHTRW49bQ/cjz5FP0ic647uAtsdo9ZN3h19jNNAc
 67Cw==
X-Gm-Message-State: AOAM531PypiC3l77SaiNUVpj2mWqIDbCkCzBeqlK9+8TSDOybppPzEAm
 S20L1thxMaGh4qzL1H3Sx8BqnA==
X-Google-Smtp-Source: ABdhPJwe16krazFRt0g3sMEwwwsGfIoOhECLnObZ2z9hz7fYHOcZNZ8Te7ytCOBcbZm4yzZrB0Drsw==
X-Received: by 2002:adf:cd81:: with SMTP id q1mr6066166wrj.125.1617228441230; 
 Wed, 31 Mar 2021 15:07:21 -0700 (PDT)
Received: from localhost.localdomain
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2])
 by smtp.gmail.com with ESMTPSA id g9sm6531654wrp.14.2021.03.31.15.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 15:07:20 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: mchehab+huawei@kernel.org
Subject: [PATCH] zero-fill colormap in drivers/video/fbdev/core/fbcmap.c
Date: Wed, 31 Mar 2021 23:07:19 +0100
Message-Id: <20210331220719.1499743-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Apr 2021 06:34:28 +0000
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use kzalloc() rather than kmalloc() for the dynamically allocated parts
of the colormap in fb_alloc_cmap_gfp, to prevent a leak of random kernel
data to userspace under certain circumstances.

Fixes a KMSAN-found infoleak bug reported by syzbot at:
https://syzkaller.appspot.com/bug?id=741578659feabd108ad9e06696f0c1f2e69c4b6e

Reported-by: syzbot+47fa9c9c648b765305b9@syzkaller.appspotmail.com
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/video/fbdev/core/fbcmap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcmap.c b/drivers/video/fbdev/core/fbcmap.c
index 757d5c3f620b..ff09e57f3c38 100644
--- a/drivers/video/fbdev/core/fbcmap.c
+++ b/drivers/video/fbdev/core/fbcmap.c
@@ -101,17 +101,17 @@ int fb_alloc_cmap_gfp(struct fb_cmap *cmap, int len, int transp, gfp_t flags)
 		if (!len)
 			return 0;
 
-		cmap->red = kmalloc(size, flags);
+		cmap->red = kzalloc(size, flags);
 		if (!cmap->red)
 			goto fail;
-		cmap->green = kmalloc(size, flags);
+		cmap->green = kzalloc(size, flags);
 		if (!cmap->green)
 			goto fail;
-		cmap->blue = kmalloc(size, flags);
+		cmap->blue = kzalloc(size, flags);
 		if (!cmap->blue)
 			goto fail;
 		if (transp) {
-			cmap->transp = kmalloc(size, flags);
+			cmap->transp = kzalloc(size, flags);
 			if (!cmap->transp)
 				goto fail;
 		} else {
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
