Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKrFLROWpWmPEQYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:52:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8D21DA24D
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D3E10E4F6;
	Mon,  2 Mar 2026 13:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aiJI7+FL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7084D10E28A
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 20:27:10 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id
 98e67ed59e1d1-3597a2fc2beso17351a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 12:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772310430; x=1772915230; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hbY6xLWGKXtaxrC528rj/sYRbGkuV5WfacpZcBywgMA=;
 b=aiJI7+FLctx/GecqrSTK4er2zbwtrO+UnDk9pqi7d81/k7MZSflcvu9mIQeoGWnE49
 yRF/N3Gz/y3zewXK7+MmYnnRGk5fpj9SHgG4VYskin4nYHDeZZBO4jaVROmBD28cxTEf
 onHY6G913UAajAXwXpNKC9xAp/EceiGMSFZdjWakCSCGBR9jZ4QwkQTK04gzR4L6xjdJ
 0pL4H9ah/0rHm3OX+U3uOPmjbEqJAYb55FMlhH/hPdeUYn6c/6gvP/WVM6KU//nGAbHp
 C7q+8TP5FnC59hQY7yjw3Frj6b1NR/Mvon01iuzWnpBf9BFdQrC91Wnzjv27uCGJz4YJ
 MFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772310430; x=1772915230;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hbY6xLWGKXtaxrC528rj/sYRbGkuV5WfacpZcBywgMA=;
 b=m1rYHCORxgSmYB4ybCwOqHmbCV91Xw097FyYmGe/IQzUC/TrssN9hErh+PUtykcAfQ
 PIp8e6HPU54/4SwdQ7/n4MWDVUACl28ICX92oE6opLELf5m6CU5uLzMAro4aTCFNzW67
 Yh5XEGRKIpFZnbRUqGUfMMgH1bu7y/v8A6KZHqm4JJwaH9ZfcQkQG5ALT8UaoC41uhTO
 eIx2notXyQndYygA0M5QhzSNDLBOZvXUHALme4R06fQ2DQpiU5+6B2XitkcM0aUmHgIP
 thVCBXf3XeL23vU+2YFt1tydRfcx7J9tLzml0LdY9G3q/A0WXmdyOHWywRvyyN1ycdZL
 reog==
X-Gm-Message-State: AOJu0YwHtVofCu/XSQZ4L3jGv/JrEG+YAJPNSNosKmb7x7c+jELTWE7h
 2D5myWnW3P/aQ7PKQnyXo4yQryXIblB+5zRAkPEboYWqBl2zyex2URc7bwGvpRMf9ms=
X-Gm-Gg: ATEYQzyke3dX5NBK88E/Cq5g6/s20bHxELF3/zyvxNrrmHgevy98mdFOH7ghJ1QlPd/
 8NcrzOWf5ep+aNq2tNjD44kV5xI/PTFwwkC8HxtLBVTYbMzYX0tP7wkLvKrigPDbvfVtAUq4NDL
 l+Lw57ugHG5GEQqtTKxFgJ6hl0JyG7fvucrmc4qDjsAxWdhRsnNG97YGy4SAJdoxS1rPK1eEmF4
 ZsQErJp10BG36GaZL3+xoYhJO3ar8Y3y9TvuK2nXQ9vtAB9Y93jw/DX77BURZmq8xiA0swQeYDo
 HOXJn9yCh9yG7KspUbnSukcb3LCmfJhLURRrdQGz+oRX0OaQJHgHrNPW1HApR3HcXOtlyfxopK/
 /UPWtpvq+x9rMOZAfDQc4/3xJw8OKVtelXs05yJgU0I9yGL/g/UtyGvTWd3L0ON65uBjR0q+JrF
 cFjAJylmVLBLKAUpsWNK+SAw8yMCsvSTEXtc56jOsLdAilMj3aZUEY4ky1V2iUozU0lJ0aoNneE
 bIHXdLssfmwgDg=
X-Received: by 2002:a17:90b:3fc8:b0:354:9dcb:1935 with SMTP id
 98e67ed59e1d1-35965cd26bbmr4906008a91.6.1772310429803; 
 Sat, 28 Feb 2026 12:27:09 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:37d3:368b:370c:c273])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359834ac606sm557872a91.6.2026.02.28.12.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 12:27:09 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH] staging: fbtft: replace -1 with proper error codes
Date: Sun,  1 Mar 2026 01:57:01 +0530
Message-Id: <20260228202701.43337-1-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Mar 2026 13:52:12 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	DATE_IN_PAST(1.00)[41];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:officialsohamkute@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[officialsohamkute@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[officialsohamkute@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0A8D21DA24D
X-Rspamd-Action: no action

Replace return -1 with proper kernel error codes:
- -ENODEV when SPI device is NULL
- -EINVAL when display size or buffer is invalid
- -EOPNOTSUPP for unimplemented functions

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 drivers/staging/fbtft/fbtft-io.c  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..c2e5c6276415 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -29,7 +29,7 @@ static int write_spi(struct fbtft_par *par, void *buf, size_t len)
 	if (!par->spi) {
 		dev_err(par->info->device,
 			"%s: par->spi is unexpectedly NULL\n", __func__);
-		return -1;
+		return -ENODEV;
 	}
 
 	spi_message_init(&m);
@@ -144,7 +144,7 @@ static int init_display(struct fbtft_par *par)
 		write_reg(par, 0x1F, 0x01);
 	} else {
 		dev_err(par->info->device, "display size is not supported!!");
-		return -1;
+		return -EINVAL;
 	}
 
 	/* PWM clock */
diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..9a87bddd7d19 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -181,7 +181,7 @@ int fbtft_write_vmem16_bus9(struct fbtft_par *par, size_t offset, size_t len)
 
 	if (!par->txbuf.buf) {
 		dev_err(par->info->device, "%s: txbuf.buf is NULL\n", __func__);
-		return -1;
+		return -EINVAL;
 	}
 
 	remain = len;
@@ -217,7 +217,7 @@ EXPORT_SYMBOL(fbtft_write_vmem16_bus9);
 int fbtft_write_vmem8_bus8(struct fbtft_par *par, size_t offset, size_t len)
 {
 	dev_err(par->info->device, "%s: function not implemented\n", __func__);
-	return -1;
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(fbtft_write_vmem8_bus8);
 
diff --git a/drivers/staging/fbtft/fbtft-io.c b/drivers/staging/fbtft/fbtft-io.c
index de1904a443c2..2144f5257fa9 100644
--- a/drivers/staging/fbtft/fbtft-io.c
+++ b/drivers/staging/fbtft/fbtft-io.c
@@ -19,7 +19,7 @@ int fbtft_write_spi(struct fbtft_par *par, void *buf, size_t len)
 	if (!par->spi) {
 		dev_err(par->info->device,
 			"%s: par->spi is unexpectedly NULL\n", __func__);
-		return -1;
+		return -ENODEV;
 	}
 
 	spi_message_init(&m);
@@ -231,6 +231,6 @@ EXPORT_SYMBOL(fbtft_write_gpio16_wr);
 int fbtft_write_gpio16_wr_latched(struct fbtft_par *par, void *buf, size_t len)
 {
 	dev_err(par->info->device, "%s: function not implemented\n", __func__);
-	return -1;
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(fbtft_write_gpio16_wr_latched);
-- 
2.34.1

