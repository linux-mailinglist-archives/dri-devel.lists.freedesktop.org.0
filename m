Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAD32A9162
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B386EA6A;
	Fri,  6 Nov 2020 08:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8204F6EDB9;
 Thu,  5 Nov 2020 18:50:22 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id w20so532155pjh.1;
 Thu, 05 Nov 2020 10:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=3EzvkzpYwrLmNMPvXPc/QI49X9jTb6rRy2470fIh6L0=;
 b=px4MXYdb+PxYPOu6R6lJ55qGhTb3W2vrn4OX0bC8UaPmEk2m0swVzbEI92X33uCDs3
 ikSsVUu2WHexB7FLTekQEtRSHEsGAW8gPpc0aCEftKCFzY3Pjzm6kSvssYzbZHt6UBEr
 2dPRehIpM0hFZNkSeixXIPNKoeIlSoEzWYINzCtBpyXD9VO1vPKN2oQWjDT659Zd+4g6
 614LGEka6FIfuFTScqA3rdzoqEPgR7xP5KOakZ7XcFMFD9wjImsMeeaZLlIWv9vhpyNP
 o2Bnp7BkX0G9T5XQ2ogM/FosRww15fPHSz5+261LaAxEt1M+tLBDxDqXGc39f896t3UB
 ukRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=3EzvkzpYwrLmNMPvXPc/QI49X9jTb6rRy2470fIh6L0=;
 b=OnyU2+zD2YsfPhL/kmLhCvsI8DlNXtmK2x3TQYJ6trdiAoUPIhsrZqZkw0X8HOgMyw
 BmhiOsqT5Lb1gea9KxG48WIM5xdV3+bhePaGR7oAV2rSTWXk+x9ED90TSdgi2PVCZDYp
 A81/h8qJzL7NbAJPUrEucAjsU/r9g0WYCz3A8mrDdd6CYA9Tz9nIw1LTzPeyNA88YGG3
 wHNBq7NSRrd2pzFw1Dwf8QHzmEL3aE04oBri/ETtf+lxLnIdtEJa+AFLuPbRWDfXTzUi
 PMD01h+q3ADiDX6LrQvk2DgOtrRPlJd82cXtmfEiDL7sMLjET/bUg59vvLzWVwDh4ddD
 L1ew==
X-Gm-Message-State: AOAM531CjlTlD60orEPisdSJznvjcOf55sD3uoszdNGGvs6itnYgqLNo
 J5JLb2vZUBxGvGBDNj1xss4=
X-Google-Smtp-Source: ABdhPJwwvyRuSz/E7DAjDgbpBdsUcgYjDXTOIfRrRB8ZJ6lAWfdKVRsyPz4fAUeDGF1TPKzwfMIuJQ==
X-Received: by 2002:a17:90a:d584:: with SMTP id
 v4mr3909143pju.194.1604602222134; 
 Thu, 05 Nov 2020 10:50:22 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id e24sm1862787pfl.149.2020.11.05.10.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 10:50:21 -0800 (PST)
Date: Fri, 6 Nov 2020 00:20:16 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/qxl: replace idr_init() by idr_init_base()
Message-ID: <20201105185016.GA71797@localhost>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

idr_init() uses base 0 which is an invalid identifier for this driver.
The idr_alloc for this driver uses 1 as start value for ID range. The
new function idr_init_base allows IDR to set the ID lookup from base 1.
This avoids all lookups that otherwise starts from 0 since 0 is always
unused / available.

References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index dc5b3850a4d4..228e2b9198f1 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -231,11 +231,11 @@ int qxl_device_init(struct qxl_device *qdev,
 		goto cursor_ring_free;
 	}
 
-	idr_init(&qdev->release_idr);
+	idr_init_base(&qdev->release_idr, 1);
 	spin_lock_init(&qdev->release_idr_lock);
 	spin_lock_init(&qdev->release_lock);
 
-	idr_init(&qdev->surf_id_idr);
+	idr_init_base(&qdev->surf_id_idr, 1);
 	spin_lock_init(&qdev->surf_id_idr_lock);
 
 	mutex_init(&qdev->async_io_mutex);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
