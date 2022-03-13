Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B889A4D75B8
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 15:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B798951E;
	Sun, 13 Mar 2022 14:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182CA8951E
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 14:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647180622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MMcgGN1d46ct1NbvGOl+Qm+VZTfIF+7Jk+6dqdt2QoE=;
 b=OjyRbxIYbOKRVKiXZg3sjKWX50tl4xJMDk9wvzcmg7w9tmcJ4sKQMDf0O3zyQeDW9YC1C/
 A4nE3SSDhNtC2b9/8IMu6JGooq1W86KRxzhtyzgz2ZQwjqu9HT+ZUelsZRb/OtoWl4ktP8
 DH/GXe1DDTCnLi4MPlRmthIR37Px03I=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-5RYapSn3MheBF8NRwkLCOQ-1; Sun, 13 Mar 2022 10:10:21 -0400
X-MC-Unique: 5RYapSn3MheBF8NRwkLCOQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 g2-20020a9d6b02000000b005b26d8c50a5so8909913otp.9
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 07:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MMcgGN1d46ct1NbvGOl+Qm+VZTfIF+7Jk+6dqdt2QoE=;
 b=RkP4pMZl8W7i/ESVsvt7vB885IlB/GmOg9RwTPrWZjw3UuKfl2+MkskTTCYkRaVsyg
 3SesDEd3l1zx9dYcBU6REQ520cewFfOHphxVg4LwpMYYlxC9bYwGYt4uDthxr8m0Iqg5
 VjRAqZJLxndaEuGq2Vum5aJ36qT0zvtlvveyPR9fz3IUX2f4/uNQXMo/mRTOo8QfrPA5
 fnVTqZVMOoegyHdmRBfd0/0HJCNSFTcRz7NTn3cu6lCtm2k9mwVj67Koze7eNOLmwH5T
 Maky52uy6gAsuIid3eyuvJqTHH0FioXOFGOCvHRtDKriVsFRWvDopqPgsjVdgRUm0LzP
 sZOA==
X-Gm-Message-State: AOAM533aTge3a7ygWz4ZexfTPYs6ZyrwFAWptil2gxsJXxY8iCICoOZi
 CxFfOAUcpXVHEdYM4dlMxtmrz6/M4Z0Cowe6/fB1tlMSKRWTDHDNKC+UwCn2nNUv9xXlRnZ3H62
 pLE666oWV7psYQC2LaPqOK0gCYhOn
X-Received: by 2002:a05:6870:4210:b0:da:196d:a1fd with SMTP id
 u16-20020a056870421000b000da196da1fdmr14983878oac.224.1647180620316; 
 Sun, 13 Mar 2022 07:10:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuAJNKiCUf9C/raP//IDNlp0tLxNgl5XjfJIqdIEs+cMF9S5wL9AzvDa1j2HVcO5dQD0AMpA==
X-Received: by 2002:a05:6870:4210:b0:da:196d:a1fd with SMTP id
 u16-20020a056870421000b000da196da1fdmr14983867oac.224.1647180620019; 
 Sun, 13 Mar 2022 07:10:20 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 p4-20020a056870a54400b000da07609a6dsm5503105oal.22.2022.03.13.07.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 07:10:19 -0700 (PDT)
From: trix@redhat.com
To: noralf@tronnes.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/repaper: combine allocs in repaper_spi_transfer()
Date: Sun, 13 Mar 2022 07:10:08 -0700
Message-Id: <20220313141008.1503638-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

repaper_spi_transfer() allocates a single byte
for the spi header and then another buffer for
the payload.  Combine the allocs into a single
buffer with offsets.  To simplify the offsets
put the header after the payload.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/tiny/repaper.c | 40 ++++++++++------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 37b6bb90e46e1..22a6732f35a01 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -100,50 +100,34 @@ static inline struct repaper_epd *drm_to_epd(struct drm_device *drm)
 static int repaper_spi_transfer(struct spi_device *spi, u8 header,
 				const void *tx, void *rx, size_t len)
 {
-	void *txbuf = NULL, *rxbuf = NULL;
 	struct spi_transfer tr[2] = {};
-	u8 *headerbuf;
+	u8 *buf;
 	int ret;
 
-	headerbuf = kmalloc(1, GFP_KERNEL);
-	if (!headerbuf)
+	buf = kmalloc(1 + len, GFP_KERNEL);
+	if (!buf)
 		return -ENOMEM;
 
-	headerbuf[0] = header;
-	tr[0].tx_buf = headerbuf;
+	buf[len] = header;
+	tr[0].tx_buf = &buf[len];
 	tr[0].len = 1;
 
-	/* Stack allocated tx? */
-	if (tx && len <= 32) {
-		txbuf = kmemdup(tx, len, GFP_KERNEL);
-		if (!txbuf) {
-			ret = -ENOMEM;
-			goto out_free;
-		}
+	if (tx) {
+		memcpy(buf, tx, len);
+		tr[1].tx_buf = buf;
 	}
 
-	if (rx) {
-		rxbuf = kmalloc(len, GFP_KERNEL);
-		if (!rxbuf) {
-			ret = -ENOMEM;
-			goto out_free;
-		}
-	}
+	if (rx)
+		tr[1].rx_buf = buf;
 
-	tr[1].tx_buf = txbuf ? txbuf : tx;
-	tr[1].rx_buf = rxbuf;
 	tr[1].len = len;
 
 	ndelay(80);
 	ret = spi_sync_transfer(spi, tr, 2);
 	if (rx && !ret)
-		memcpy(rx, rxbuf, len);
-
-out_free:
-	kfree(headerbuf);
-	kfree(txbuf);
-	kfree(rxbuf);
+		memcpy(rx, buf, len);
 
+	kfree(buf);
 	return ret;
 }
 
-- 
2.26.3

