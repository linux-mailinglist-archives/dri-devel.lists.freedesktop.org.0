Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nWO+G9xXkmm9tAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:33:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B019D14016C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CE410E02F;
	Sun, 15 Feb 2026 23:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FGfmTx2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0805910E02F
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 23:33:42 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso21750015e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 15:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771198421; x=1771803221;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w8jWJ2aXKPj6Qh0lM2R1FNp2IKfJGxSgtw7F79r6crc=;
 b=FGfmTx2ee90OUZiPgSvrjQxuEN3kciI8Is4DFRERaMyR24KmhYmJ+obonfQ2q7AW0y
 CUCSrkbc4MCIUFAT/nHSb/jVTx1OePX9znACoIEOQMbroCt/ILAhdTPJhNOTyI1SrWdc
 BdHjy+6Aye99nH4vSUy7w9boXenEQnpkT2iekrCVBv2M1IS1QlvBWhFEbTDonx1veLF7
 UxLTAIsVmmZAbZ/xyVNhffsoukfmYBD7sG+VjCrwlkHGeXfl6euZflYFUX/T0s++9Mnn
 seFdaX1cblQJmFJ/L/wardGd5tsZWXhBlfQAezmZZQ+jVA57invxNP/DAm9o+gfXAsHg
 OLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771198421; x=1771803221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w8jWJ2aXKPj6Qh0lM2R1FNp2IKfJGxSgtw7F79r6crc=;
 b=M72QjC9KtUzMFGsVKeVX+ehtPnlfnIroO6+uK/Z52n4enw6+/HBCZzk1k4QAvFVyg+
 yrk4erC2eW2A/re4HJqfV+zguGCQ8RB3O1wbb4St83F7GDnYCB4uTAeSWLndnhrR7UzJ
 +k6qBl7w4Dl2ZI9K4ppBRpC17Jf+RxsZvmkluJ2uUfr/cJ9ZvAtAu4WAVFjZGwlt3adu
 9GvY7W3oXadfzw/WGVCF1JLYNaOSfqNO6g6rTNsFQ4HnklO9gpPZLpgdX/J8KjtT/A4h
 9IDYC/A138DUIlfEu/Tj7SLRHPoR4lr2G1YGh3cFckMkOao3mb49Qe2ORyo6atQg8ErI
 AOkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOsWQ2P3PwVyeLtTjNl/J4bwFujCnHftD5AvxK7YSqAWcX1ngIfckAHM4NkRD+Rhu0b410ShcS2lA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhRVO6LntISZ6axFQ6faWQC0m6P5CbaDKMZhrYdvq7pbJQTyVI
 0mmS13tAfkSMW22PEpZCw1WRzc5sD4SQP9fw3LC9P7Qx0+H1U2eHltEvpY3JlVif5f4=
X-Gm-Gg: AZuq6aIzq2y2cSMVhVMgdwoshD0CpYtqb9t3vZc+1EjqKUwfkjZNi1uh7g4Z788RmBf
 JqMBf13HkCwUBaM+4LmnQptIUnnA2N+TQKzSEfqFvn6l50tmDRulzX0+iX5slrooAt5RY1Ktz8G
 P5q0yi5JvbWdoQV4X+XTGLYw7eAc8PdsWzeS/yn3CrR8VjrUP2m3LO8Vv+NDR5Zmmc5z9gYjmAq
 OEWctXLK8w5bWZRdnjw6vkKCXRYTg+lOgsFnn3V/y1pe1h/qGmxIcdTRx53W9kbJNFYlCfnVjmq
 55ii8q+EJxwYsFsLbiBBuLrHylu7ppBiFz6lZ/h7s19I8KpZs6WP1wre32LKe9UI4BtSY23FgMZ
 V7lAV79DXNUO7JMFN5pBV6HeTNYxmqzR0sVhkZr4t/Npnfn9GZmPJWkfuv2SyfZEKUW3/+2cY4C
 S+OILix2+xRN3rai2f1AE/mOYzz6vBzW6XFMr0TDU=
X-Received: by 2002:a05:600c:a09:b0:480:4d38:7abc with SMTP id
 5b1f17b1804b1-48379bbc49emr95365535e9.11.1771198421343; 
 Sun, 15 Feb 2026 15:33:41 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-43796ac9d77sm21225426f8f.33.2026.02.15.15.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 15:33:41 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/7] fbdev: au1100fb: support COMPILE_TEST and fix
 multi-device support and other cleanups
Date: Mon, 16 Feb 2026 00:33:16 +0100
Message-ID: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=uozvdbMQBMtquqml4NMEEzAMX5hTqQKt2p8A23ayY08=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpkle9VAc2+d+3YIVZwdPHcqkP3jZo75jAGyHUv
 t0sT3O8HYWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZJXvQAKCRCPgPtYfRL+
 TuX8CACZ8Ml2lm8CHMdrmEcc1VAnwx0Lcyh6d3Yu4PNDD+r4Yxz28SQr+NkjUMmQYMa1SaxM7zO
 4iG/l4JtGIM3vTJnC1gbFmoDSr0IsjpxzzZbzJDzoxAIKo3h8/cwcwpObXqmdCv6yj3lTtFYOwG
 /8KSxOfPf1qDiInl0whVZHVODrOnapyLJu8w+YlAw/PaEfBYqH19mUUDvquSYYC53iaFWZa77MU
 3YLdhi5cUHmvb/cxw1ilZMkTdf8RfZjdmQihSQjn3bEAj7HtaAWzwBwvxnsaKcwpmLJzveIk3C6
 EL35pHcdX4MiOtKf1BYZZvpq7kMCgFJyRGVi/XnKryAyr5ay
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: B019D14016C
X-Rspamd-Action: no action

Hello,

here comes v5. Changes since v4 (see
https://lore.kernel.org/cover.1771163316.git.u.kleine-koenig@baylibre.com)
are only fixes for the few justified checkpatch warnings in the immense
number of false positives. (That is: break a long line that was already
before over 100 chars long, a typo in a commit log and a whitespace
issue that was introduced in patch #1.)

Best regards
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
 drivers/video/fbdev/au1100fb.c | 487 +++++++++++++++++++++++++++------
 drivers/video/fbdev/au1100fb.h | 379 -------------------------
 4 files changed, 406 insertions(+), 463 deletions(-)
 create mode 100644 drivers/video/au1100fb.c
 delete mode 100644 drivers/video/fbdev/au1100fb.h


base-commit: bc57657bd3e64feaac5b4bf3fbd7f8a2fd09f4f8
-- 
2.47.3

