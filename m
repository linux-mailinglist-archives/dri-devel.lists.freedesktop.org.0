Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CbZCJ6ugWn0IQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:15:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2CAD6151
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C014210E54C;
	Tue,  3 Feb 2026 08:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CplbSt2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6A910E1F4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 04:52:15 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2a7bceb6cd0so35970635ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 20:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770094335; x=1770699135; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sahNc25e8V/0vokuer5AdT6A9YG4/1fX8go429GK/ZE=;
 b=CplbSt2D6k5OekQSjl1MJ94SkkKDZgFhAU3IWwGB5C2OYW00C9aSSG2GJX4jcSoNkl
 6D0B8mejV2MX7fUFuOEe0ra58oZzK3HsZ3JKrkC/jfELOvCkKTThbODIe/xXjrmLokII
 m/csxFyvg4DTYd6pMM2TJlFLiC1PXUZ3rALNnSU5WARqdg+fvTwgUbmj+S6Vqog3XMVk
 nIZytf+f76BudNqTAzPuB5MsApEQc8ssXbYsq1EeNvaYP6G31+DoEK9fDlytkE316blj
 XPiGh+tOKfEk7ThEijtR6254Kix2tdAUl3mZvbZJKErcH0H7aWQe4vjiRZzAC/TZ51Qp
 Pdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770094335; x=1770699135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sahNc25e8V/0vokuer5AdT6A9YG4/1fX8go429GK/ZE=;
 b=WnPHtB1LEiVdcZzA51W5OPEPQB1OjUCcNL2NYMY3y3Usn2eGeISsn5gETQOku/WH5n
 OXZNPNDU5hMsSQbZ22coxtypH4wYfJ7QPnJI6vM5BcdDIeTTsrky36LTekN1pxCe56ER
 kXfgsxsqT9buiF1duG5PhyOUOjGne8rMgCASjbiWFEFMDcIYuKjp6Z6aZPnG8Qtkbn1u
 BumeySger4kP44vtH6l20appPA3TZL3Ash5eYlejC27sPRtXhN9N4z8UR70ngLlMfopJ
 1q/9vLWqTYWE4BrR/hNnn9pcKX/vkaUKaDUbHPwxtN5LLMupgf88ajQNtsvvaqO+JWDQ
 GDAQ==
X-Gm-Message-State: AOJu0YzrfRpMwWxgHViCnFEJwFMGznI8z8u3PCb4UkJlN+ONMsjlP0n0
 13srTDv0y9vSsXE9Sj+JHGt4gcQ+H0lc73E8H8fBKIfcLfXuZZame2jSWwXcyg==
X-Gm-Gg: AZuq6aLQLjGtymb4JRw5MwXfGMKat0jaKmnMjqXbbgT5wGkliJfosSPDVSVW4D4oSSY
 v9Xe2IIJUJBEKg7HqHtzqzGxW/+7RfHkkup/SxQtJO3odoSjFKdR+mv48OgTIEJcLuycdsh2T5S
 M1XxO9Riyv7dvW9Rfp3STKpimRvKtadeF0+W7/AD0tl4ffAw6eZpTwyaClqzrX8aTQCQZRhBq0L
 Xe1fQV/vbzXnW+u9oO554hN9BS+Y04vdN7wgEvMVROyJSLP6n+/MQSrceB9WIaZ+J6VtSjhtFm3
 UlUIFjI+VKTjvtmY7ev1S+Pf4GROWeJ8bWmfeQRbA9T0jfkbSlDsc+jMfhVdv4uSZ+Zyf0ytUB9
 68WDVZHb7A6LnWVQYElxYdRP38VFXdzuzW5O9Y6NcWFT0trfRdXoLyLA3Ebhx5qN3S8tKLY3Rbx
 MKRieHu3Dnfsij0BtN4RrdpdU=
X-Received: by 2002:a17:902:f544:b0:2a7:fe78:a344 with SMTP id
 d9443c01a7336-2a8d959c5a1mr143542085ad.6.1770094335015; 
 Mon, 02 Feb 2026 20:52:15 -0800 (PST)
Received: from krishna.. ([103.220.210.247]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a8ec56da60sm85791515ad.38.2026.02.02.20.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 20:52:14 -0800 (PST)
From: KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
Subject: [PATCH] staging: fbtft: fix macro flow control warning and empty
 macro argument in fbtft-bus.c
Date: Tue,  3 Feb 2026 10:17:28 +0530
Message-ID: <20260203044728.23774-2-krishnaworkemail1308@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203044728.23774-1-krishnaworkemail1308@gmail.com>
References: <20260203044728.23774-1-krishnaworkemail1308@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Feb 2026 08:15:23 +0000
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
X-Rspamd-Queue-Id: 8C2CAD6151
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

