Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOTwIM7ggGleCAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 18:37:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F8FCFAB4
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 18:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B33710E532;
	Mon,  2 Feb 2026 17:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lGwd+w47";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DFE10E529
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 16:28:48 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2a8ff2ca490so8562655ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 08:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770049728; x=1770654528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sahNc25e8V/0vokuer5AdT6A9YG4/1fX8go429GK/ZE=;
 b=lGwd+w47gcPqLyZEgwywi8OM4r1QV624VsTTqnFfeaMZNNnu+SqJnKgntitYyl2AaQ
 soaNmxGVfBfccY6gNjjpty71JkavduJuqMLlrC1MPMH7U/xobv4MabzAqdTGNZvAGGvZ
 dJCNTWg3eQz9z8JmEf8mApYmy8xaZzSS9aHtOJbbTNWDhyAlfuZaxswYQcMd5n5aiYJ/
 JSEj+MWcWnb4w9Dpkav/dgr5gMdM+1lpxQinHOYIX5wkxe+fPpaZE2dF6ER60hGgBw2z
 0fChMKTMGwi0+zlFBOhNRhHDioi8p7aItzgdL+410BVdRnWSARLkkofiyeJFNvjpG3wG
 Z13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770049728; x=1770654528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sahNc25e8V/0vokuer5AdT6A9YG4/1fX8go429GK/ZE=;
 b=I2cPf1W/MAj0ajNuQruRxMqIhFlzoT0sewqRnzC0b4asEUUShk8MOQgo2SSJt6ks1q
 dzBPWUiIL2pCzm0pvdt7PM2pTh+9wg0xoLvaXeXZ0VaHvy3GQ5SIBELTqjqf3rUI+rpe
 SHnARKnIlovLwoAr+oZ5bHd6rzZou8wl04vBjek8B0QkY5OEmrdG8YEP4hCQnJb05SjH
 PfWVnNgUx5OyhUxY76yfdh5KgVTKxOBsIFoQlR7cIM9O0Hv9ukgZz8N6Dd5Gvaw+3irw
 nVMmJyoFa97QCOTc7YKTJjijTWoTyElNDWugDJtx2BQZ1/3iMKdPYDY0+OF69U108nnk
 BMAA==
X-Gm-Message-State: AOJu0YxvI2XcN3tLj0QZWVNPM9OIZBRkpKtt//IIBYMFcLTL0Z/VA4pZ
 BZO37WvS6S5WDbFug5rYSsXvgcgGt+zAw5hV+gA1e+Uthq6gtnxcb2Rq
X-Gm-Gg: AZuq6aKBMiATtonRyXEmEYVeEvKL/hYkBAtrP99gCElD6eW22Uo/xvjwP80gqACgqoJ
 qJNLlha5k+Nwc+c9jNFVcYG6PLZJn7/fiKOXI4TXooaHr2d/sNsm67VryqX4i91b+1C9mF36l8p
 Mb71p1ZwEVbMGxVWNEQ7EIZGXMypag/sJvDPCIR5Ka+b06T5otkeQ6pROyIYMnkxSJz5HyVemHC
 lnRthEZIEbTZrCpYSWjFtltwd8dPFtZc19F0eFpa2ezFAC4L7s11mAKUuaPcQCzHkfzHVV9Sg29
 SZzvUpDZSqx44JURK0qoMzUsmqW6tNxE9LyJSx30cbNuX8Q9GL2Jb6RiZO+ytihDiRLUaKnAvKG
 UQyAtytUz3UGgjGqUoLRn+/tmCvF4a+mqQWPIjnckCy/je5nU6HSqsJnz4CtL+5JrHzDU7Vcv/Z
 j7maXjmTd6kLuQHR+kDUvl0yQ=
X-Received: by 2002:a17:902:db09:b0:2a3:bf5f:926b with SMTP id
 d9443c01a7336-2a8d818b2bemr140531225ad.47.1770049727956; 
 Mon, 02 Feb 2026 08:28:47 -0800 (PST)
Received: from krishna.. ([103.220.210.247]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b3eee8bsm142211405ad.6.2026.02.02.08.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 08:28:47 -0800 (PST)
From: KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
Subject: [PATCH] staging: fbtft: fix macro flow control warning and empty
 macro argument in fbtft-bus.c
Date: Mon,  2 Feb 2026 21:58:26 +0530
Message-ID: <20260202162826.116739-1-krishnaworkemail1308@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Feb 2026 17:37:09 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
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
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:krishnaworkemail1308@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krishnaworkemail1308@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krishnaworkemail1308@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 25F8FCFAB4
X-Rspamd-Action: no action

Fix checkpatch warning by adding identity modifier for define_fbtft_write_reg().
No functional change.

Signed-off-by: KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 36 +++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..0ab4f5c4f886 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -10,6 +10,7 @@
  *   void (*write_reg)(struct fbtft_par *par, int len, ...);
  *
  *****************************************************************************/
+#define fbtft_identity(x) (x)
 
 #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
 void func(struct fbtft_par *par, int len, ...)                                \
@@ -42,29 +43,28 @@ void func(struct fbtft_par *par, int len, ...)                                \
 	*buf = modifier((data_type)va_arg(args, unsigned int));               \
 	ret = fbtft_write_buf_dc(par, par->buf, sizeof(data_type) + offset,   \
 				 0);                                          \
-	if (ret < 0)							      \
-		goto out;						      \
-	len--;                                                                \
-									      \
-	if (par->startbyte)                                                   \
-		*(u8 *)par->buf = par->startbyte | 0x2;                       \
-									      \
-	if (len) {                                                            \
-		i = len;                                                      \
-		while (i--)						      \
-			*buf++ = modifier((data_type)va_arg(args,             \
-							    unsigned int));   \
-		fbtft_write_buf_dc(par, par->buf,			      \
-				   len * (sizeof(data_type) + offset), 1);    \
-	}                                                                     \
-out:									      \
+	if (ret >= 0) {							      \
+		len--;                                                                \
+											\
+		if (par->startbyte)                                                   \
+			*(u8 *)par->buf = par->startbyte | 0x2;                       \
+											\
+		if (len) {                                                            \
+			i = len;                                                      \
+			while (i--)						      \
+				*buf++ = modifier((data_type)va_arg(args,             \
+									unsigned int));   \
+			fbtft_write_buf_dc(par, par->buf,			      \
+					len * (sizeof(data_type) + offset), 1);    \
+		}                                                                     \
+	}											\
 	va_end(args);                                                         \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, fbtft_identity)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, fbtft_identity)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.43.0

