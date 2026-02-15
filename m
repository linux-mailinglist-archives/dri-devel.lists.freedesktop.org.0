Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKuzISXRkWlFnAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9F013EC3A
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612D810E045;
	Sun, 15 Feb 2026 13:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1GLgRlO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D2710E045
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 13:58:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4833115090dso21536705e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 05:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771163934; x=1771768734;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GMS55t/V9fY9Xp7NFJdKphTgR5hjSDfiqXHxnjBq6kw=;
 b=1GLgRlO3ZWmGBOL/q3P0ot711Fln/RVcvwSDO4/L1pDbYMoZSyLR2JNaKEAK1SDisA
 JOuUVBX0TdOiLyBdXeNT7HG6qUUzofvng71leEylk48WhuCNa1+WYZyfBzDn8Avfqtdg
 N4RjCmEpNAfgkf+LneBDichhvucQzupPK6jO8sGeGbAs+3hm9rkI09dhwK5UpQZdrr3M
 Efzwr3ireF13L6M57RT36WjneYRfk1WhHVQ8V8WUgIpO9l7VBVxjzPJbx7wF0YmqsrhE
 lEkCQEXuyxIuNexXXI5WBcpmLs81Hc2nhUjDmZM4vlHZSz4gOpFx8jSnk8IZJjrvJr6a
 QG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771163934; x=1771768734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GMS55t/V9fY9Xp7NFJdKphTgR5hjSDfiqXHxnjBq6kw=;
 b=f0l9S+JpcqVX2PwXRIRLEvTVnZwa0zOqoHfpFNj15OUb0ZIvrXcZlPgNz+Dt8irojO
 Zi1Xwa5U6wYzC4uKWYO3eX+NT4fAB2TNGI559/QMNdrp0CrnlauF11jubr1aP2gjlgqE
 09tbzdbedwZ0aDhHPiL7zG0nru/sea5BDc/96lRBnBhQZWF0HhB39tqjCR5lRp+kfxg6
 npfdV2KaD3jvq3mwFEYAd+j3POiW4OLbIRNtAtr3jCER1Xm03IKYtbalPmJqIXIkUCb0
 KViynGN12xrpwKLsyZXgvx7T1K8lAT5z+u+yNv9JcREIpvuRjBr4Q7aDkw8HkuhzYX9t
 wL2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEeY3ip+znec1cXasJWQba5AiRJrIGYVOfs3lp+PkNchVutqVkSzkZqDfKdo5yb9qER4gEomCNoik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+pOqBuqineV0mS3tHpv1X9jqfnNDn+ftrmKhV4J41unmFCz9K
 WUdBpHYtb92b0KHSAH69XNW50Y9F/kJxPSbJlnxyFuFCpkodRsCEMJEG1fCYTSpl3IM=
X-Gm-Gg: AZuq6aIDo4F3rmwQ3qNLuY1fwXzO1Y5v3bW9Z2F/17Ds2qUhL5hSItBeSPWvea/R7BX
 3twfVa6i61P1V+eQxaAMkowhUcUO/vQ7vAGg3s8PklR0WtDj5vhxBoEyZaW8/lXu/HzgA8UF5HQ
 OHOZVSEQpehjoOXtkZslWrHgPTo5llm/zke+K1ta2q8OU69Bqj5rrRbMIKYlEAcStSmManA+tCa
 y16hG54jE/AiBWduKdyMQwvhrrlxfltBFJdYnWF0JtvRgAE5py6LuODNeTbQzr2LVtovTejC1ft
 kj4+xwLK/QCzU/Yp+oFQ80Z/BNOgJxDaJa48LgGFu51cQDNjAxvlnySlOx1jJlOZkTs2fr79lqY
 uKGsbt4NhXV4MsM354YOVP2BZ26cvVV235lBYzxVUwBR0pWqm5/ZZ8iAVhtWdcp7gX5BMPhDZFV
 /OT//TsYDnuIDYmjO+NfkGdbHqhhA6
X-Received: by 2002:a05:600c:1549:b0:477:7a53:f493 with SMTP id
 5b1f17b1804b1-48373a5d7b6mr125230325e9.23.1771163933666; 
 Sun, 15 Feb 2026 05:58:53 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-48370ac3564sm168021765e9.5.2026.02.15.05.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 05:58:53 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/7] fbdev: au1100fb: support COMPILE_TEST and fix
 multi-device support and other cleanups
Date: Sun, 15 Feb 2026 14:58:27 +0100
Message-ID: <cover.1771163316.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=9uUi7nXMjeT93n+Xkdzqc2t9wJ4cGV5DzI4vsf5mkaU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpkdEEhCtlw8Y2ymPubtY2wyZRtmxMjDjgwb0JC
 WlUnh0EVXmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZHRBAAKCRCPgPtYfRL+
 TssmB/4pcWObZqz7acQq4uBFVjrCI780gmeX3/zYHbtWsYTaZvKGTe8cMy/QmLq6w5YjtBV+NaK
 t6EXxx1MWKY3ZpDKRXVnIXLyo5trDGV91Vn8P7CdzcgwghEqVb2Xvpi60ySzU8TtZaQ10EzYGBa
 PplMGWB11qVBGXmgVi1rrx/OUCCWLGVnWkTt9687Q1jYe4O0xYlLj0T7Os27N3lX7VScwGHiVWM
 16XJe5d++qJ1R8dnXl4m/LYB5FGdhAOj7r7MOv6qwf3cy81C7VxeClKT340FyxeTVHXqgi9El5f
 2HTmicTpbzLQerM3rlLGW8axJ1c71eUNidSyYWtZYjvzaUSR
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 8E9F013EC3A
X-Rspamd-Action: no action

Hello,

here comes v4 fixing and cleaning up the au1100fb driver (which given
that it currently doesn't compile probably isn't used at all :-\).

v3 is available at
https://lore.kernel.org/all/cover.1770572936.git.u.kleine-koenig@baylibre.com.
Changes since then:

 - rebase to bc57657bd3e64feaac5b4bf3fbd7f8a2fd09f4f8 from an earlier
   version of that patch in next

 - Squash the two printk format patches into a single patch

 - Continue to depend on FB=y (v3 made the driver only depend on FB
   resulting in an FTBFS)

 - Fix a typo patch #5

 - Patches #6 and #7 are new.

Have fun!
Uwe

Uwe Kleine-König (7):
  fbdev: au1100fb: Don't store device specific data in global variables
  fbdev: au1100fb: Mark several local functions as static
  fbdev: au1100fb: Use proper conversion specifiers in printk formats
  fbdev: au1100fb: Make driver compilable on non-mips platforms
  fbdev: au1100fb: Replace custom printk wrappers by pr_*
  fbdev: au1100fb: Fold au1100fb.h into its only user
  fbdev: au1100fb: Replace license boilerplate by SPDX header

 drivers/video/au1100fb.c       |   0
 drivers/video/fbdev/Kconfig    |   3 +-
 drivers/video/fbdev/au1100fb.c | 486 +++++++++++++++++++++++++++------
 drivers/video/fbdev/au1100fb.h | 379 -------------------------
 4 files changed, 405 insertions(+), 463 deletions(-)
 create mode 100644 drivers/video/au1100fb.c
 delete mode 100644 drivers/video/fbdev/au1100fb.h


base-commit: bc57657bd3e64feaac5b4bf3fbd7f8a2fd09f4f8
-- 
2.47.3

