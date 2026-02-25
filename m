Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aABiMAyNoGkNkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D661AD5C4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3645F10E9ED;
	Thu, 26 Feb 2026 18:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QGDnWFz2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EC810E842
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 23:41:17 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-439857ec679so210457f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 15:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772062876; x=1772667676; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=896H1+Wxt76OuddQ568kaIniMJJA3risn5GSiPmJdUU=;
 b=QGDnWFz2U8fJKVO2DShrE+EPFQhg6IoXnNTzx3liTZWJpg9C8HHrYcKH7EVZtb5+Wp
 EpeS7STT6uCNezkSlT9Vguvv8WU39UQgUwbcVd4/M3cD2+7reWMgqTBEUzAvuQ+8x9My
 wufUKk4/w9iSrCES0ELC6Uucu9LApft4VCdKOeLpVTIMnCM8/Hp1b4r2M/3MX4ZNRNCU
 PatepFR0ntzk50wM1CvKK1UXmMhhgyxG2maRudTUvxvbZPoJ6ehum3dk3M8TvYPR9r/O
 cQ0I8pizGIVx9hO9XqmwjwKJtXjkWeaLXIQak2m8ogM338WxK3TqBbLBMco9SnGV0Bl5
 vTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772062876; x=1772667676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=896H1+Wxt76OuddQ568kaIniMJJA3risn5GSiPmJdUU=;
 b=v5HV3HfbUeXrO038iP1LDSrdnfRBNzVlSAa1dNxqoUdrNR49vuErnq832o8DW4mMaE
 X9cP9f3C8iHKqgFuCZIt+MB74Tjd0CaVwyACBSWvq8/km7YotRQ+OZhBE68p0KrQXpUs
 k1Gt5/HbvP+371EbnAgC8uUKaivLw+/rmxRcGbPPZE4Q+qcO44qe/t2Z9bS/bIF5+/PM
 d8vfmoaGEt1oXbe99n2VIp1rDdofr57YBT2e7jrWMgoqA6V4sVV7xTq3S6rM6n5QgPIa
 QREp6gg229nl1t0yNEHud2p3sL9a8NzwPWMXAX14/fX7LT9iP+2fJnf8dWAm410LXNZ/
 P4Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoYFF1K8yxwDiK1M8b6C7llGS84YMm2+Plz7eSkpQ2QRSFaww1M5rZZFSmoLPCqxKeol9GDQPa3kM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz41wZI9Vb8SmHZsvu8xK7mR0likhiEk9i4WXrbJ9xbJZAsqTVo
 SFfTT9ZSO1H7PQKcE8N7fywi64+3F4LfYwa8l0liX8QnWS+3IZq+8vVk
X-Gm-Gg: ATEYQzxfIQykLhlwnQHRAd3ITHdan0jTL6yEaSPcqSI2l20xLWeHqfaWRYfDu0+595t
 /sizqvHNogqtDi5twkO7iRzmvKWzT0ir5KpvXaGTqABMHobYqQEIZo6t0WR6p7CqD3I/9Qm0kJr
 UAdy0Cx4Vsr6H2piQqcV0HpWVljCcr2oue6zq5AKaoUbJ0Lov4t476GiNJHd1wSdBnS4QpYs06p
 yBr51kL1+Ob+zge+7P0on8i/Q/0J08f9MYv0qiQxcV8hGNzo+90x5kdx8cdmnFBGFerRzRcf4Ss
 tdNAJILVAv6b/+UXmKEejtFMfU03AbtoR3fcC+S6ZGo0vSMfNq3bhcb7KLcQqp0ifDx/7Vf/Aht
 yATPKLNDL/55Tl8aGM5lRewfeFNVV8yMNHu61QYCJQja1jClzYH+QgKO4j9PIJEe0anxhHp0l2D
 1XXmr3uvDDb8hmZmVHPpWftlQsJ/toUDEfhyg8hGQ=
X-Received: by 2002:a05:6000:2890:b0:439:938a:3de1 with SMTP id
 ffacd0b85a97d-439942aa1e4mr4235351f8f.16.1772062875848; 
 Wed, 25 Feb 2026 15:41:15 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d3fc12sm35307352f8f.24.2026.02.25.15.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 15:41:15 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>
Cc: "Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: fbtft: fb_ra8875: replace udelays with fsleep
Date: Thu, 26 Feb 2026 00:40:36 +0100
Message-ID: <20260225234100.152320-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225204602.134218-1-azpijr@gmail.com>
References: <20260225204602.134218-1-azpijr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:azpijr@gmail.com,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[azpijr@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 59D661AD5C4
X-Rspamd-Action: no action

The write_reg8_bus8 function uses udelay(100) twice to wait for the
display controller. In non-atomic contexts, fsleep() is the preferred
API as it automatically selects the most efficient sleeping mechanism
and avoids busy-waiting.

Update both instances to use fsleep(100).

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
v2: Switch from usleep_range() to fsleep() for modernizing delay calls.
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..fe95ec6da064 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;

-	udelay(100);
+	fsleep(100);

 	if (len) {
 		buf = (u8 *)par->buf;
@@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)

 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	fsleep(100);
 }

 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
--
2.53.0

