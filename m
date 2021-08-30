Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107123FB99B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 18:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2D689C54;
	Mon, 30 Aug 2021 16:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ADF89C54
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 16:02:27 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id bg1so3512528plb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 09:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hNk/SrVEmg7Gzq5MxNtJIEjH5tFYQ/WLaoYBWOwLSUQ=;
 b=r3TF70SGQCmi1RFWL7Q87qJS+315SjC061HqKVTQ/zRP825EgMFQzFKjVuOBTjgQl4
 wFe7OGI2Z9Gcsel7FzhRA7dIl6cutqUTKLG/d1Y6x5au16uCFGay/QaxzSdsiNUd6fla
 4WCPm1yXTeBjozce64gtHh1Fkcw7ewtoXNGagU0hl5LIe2pVEnAR7ReePHrDKCpBiXlw
 GJOsIRWyZidSNDJuOLEkFqp90C6QWLcYG6T13atodtyyZhE8bpI6ScewMPjm75zu5Z/O
 Q5YqgAA8CQXlh6PTuCFL+qbT68K5/kKLI2u6Bbg/07pVr9vof1ir8sXsKID//9eGavhU
 r9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hNk/SrVEmg7Gzq5MxNtJIEjH5tFYQ/WLaoYBWOwLSUQ=;
 b=h2odpb/pvltlWQv3YJbbtf3531bWcM+0VPN/bPRt5DJCpyEBzezSAT/tU2A/gH9Qhj
 rXBxhaBTxw0acXXVnEzS5cOGIEnDGm5xWu7/MiGkx7jT5rZYG4sTBH3qH/o9K3ak7A6f
 x97hILhCPjWoL539iwQoum1YYom9eyqrZ5IXDn6n8xJndvvoGkLimm1VKOBeOqzGtta8
 QAAo6FbQ01leOUCG28CwdO0l4SaN7SC5Czx7LjC6FYcN3wfXr+t5jPzcTYfXhPyPkDom
 M8RjEunSxn1G/YjZFILr/kzGOPjbRQX0eCBER1iZ5JdA5UVoi60vff5NGuPsW4bLKbhB
 09gQ==
X-Gm-Message-State: AOAM5326UEMH1heOIcOMUhK6bfGhDP6rfF4nBjdfocLG1RFrX0JojXwz
 bePsCYbE+MxPlp2fIWOeAncOCjJab8aogN8=
X-Google-Smtp-Source: ABdhPJx4DxXGLG7em8lQRLdFAzcH7JiTibGi2elZTt3jtjjRILnfiRYLKK11DdVYUjWbHna22/ipwA==
X-Received: by 2002:a17:90a:1b07:: with SMTP id
 q7mr27310433pjq.100.1630339346870; 
 Mon, 30 Aug 2021 09:02:26 -0700 (PDT)
Received: from localhost.localdomain ([175.157.63.238])
 by smtp.gmail.com with ESMTPSA id t186sm15451666pfb.53.2021.08.30.09.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 09:02:26 -0700 (PDT)
From: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To: airlied@redhat.com,
	sean@poorly.run,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] GPU:DRM: returning ENOMEM
Date: Mon, 30 Aug 2021 21:32:07 +0530
Message-Id: <20210830160207.23936-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210828154027.8198-1-asha.16@itfac.mrt.ac.lk>
References: <20210828154027.8198-1-asha.16@itfac.mrt.ac.lk>
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

check the return value and pass the proper error code.

Signed-off-by: F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk>
---
 drivers/gpu/drm/udl/udl_connector.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
index cdc1c42e1669..857d2c97ef0e 100644
--- a/drivers/gpu/drm/udl/udl_connector.c
+++ b/drivers/gpu/drm/udl/udl_connector.c
@@ -23,7 +23,7 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
 
 	read_buff = kmalloc(2, GFP_KERNEL);
 	if (!read_buff)
-		return -1;
+		return -ENOMEM;
 
 	for (i = 0; i < len; i++) {
 		int bval = (i + block * EDID_LENGTH) << 8;
@@ -31,11 +31,16 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
 				      usb_rcvctrlpipe(udl->udev, 0),
 					  (0x02), (0x80 | (0x02 << 5)), bval,
 					  0xA1, read_buff, 2, HZ);
-		if (ret < 1) {
+		if (ret == 0) {
+			DRM_ERROR("Reading EDID block %d returned empty result\n", i);
+			kfree(read_buff);
+			return -EINVAL;
+		} else if (ret < 0) {
 			DRM_ERROR("Read EDID byte %d failed err %x\n", i, ret);
 			kfree(read_buff);
-			return -1;
+			return ret;
 		}
+
 		buf[i] = read_buff[1];
 	}
 
-- 
2.17.1

