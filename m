Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDSnKp1yh2nBYAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 18:13:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5164B1069EE
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 18:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B6610E0CC;
	Sat,  7 Feb 2026 17:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MGc9bwrq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3C5897AC
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 17:12:54 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso14599915e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 09:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770484373; x=1771089173;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AsGgjQ+pwkibaJQBma83cuqHyIeglUS8yUfBuSxo7Lg=;
 b=MGc9bwrqrsaj+rX9ZBkEp5Z8FIK7y/9LYKOq+kctDdVzsUCmI7ArX3HiZDEOS/PIm8
 o13O2XVYPa/fmcaqT0ttiF9Prpx+jPJNhHDRpLscy9NzNVbsbvSiHR2sOpnOdgDhmq3o
 BjlO+c305M46A2JdHk2ynZkjAxbMzCY+mZ9rZbCGs3rlKNjsX//JYsGh+E5MLc5Brl1m
 eoCfhAYz6nFl0s1NCP3yjkbG0VXiAmkpC2aNr5DgiWZ4eHYS4h/zjgn5r0YiAYVG3VnO
 SUtJg/CtTpOwZmOn8qU/mtTX/WqhmrYlYWyoWRgvEqNtWgAO4mlt9EqzlQrao7apZIy7
 TwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770484373; x=1771089173;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AsGgjQ+pwkibaJQBma83cuqHyIeglUS8yUfBuSxo7Lg=;
 b=Y0ur/YAzQmY2d3VFHjDp1FL4R2EvzOA1e8igtF3V+MYyajSQfr2Y0NjHhEPtdRpnZQ
 w4rrbgGgAF461Xw7RSjurE9KJxe2cZ6mj2BYYfFVRrfWz+rZQvPahItH1HXlGlte7jzb
 r9MEOtD1nbNWXuXZv2DFd0crUAddga8nnk+sOOwBr5rzKbyKJHBk9Kr64j2TEyg6vcQJ
 K8NQpjtO5OnGQlq6xYfKY+AEVlmbyKV9YGfqkAFftRxhrI/gFZlL9Q2pMSz60epZt2Pd
 b7cnmAx7swhKu87Eigy7moK3aCq6yZj6TuB3xj986DL63AmwxT6Kc8R/Z2lZdZHCn/pR
 ofrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBEJ1ztH6EfASGI05PWCY0xCJiKr+W+QPqMjR9lE+qk1PONiXDEtpmRSsdO+v7jnt1myYlDmD7Uzo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYim2WLJurtYLt4/GIh22yOVnZpOkdw4EHa8gQ4bIaVQnzlvzT
 4+rqMjFVQEy8cbVE4TSPxNEGvhoYxf6syAM6NvbflWtijyXMsV0QTDGFRSz+uxpUdHU=
X-Gm-Gg: AZuq6aJZzM4J/I0YZ2os+v7RPDwAuzvddqsI9xcJgwz6xIpcvAH9FCIONHzsVszu52+
 6GDCsZa8xcybmPXzbb0MWCOB9euj9E5F3oj7pMMyCZ0ayjlLpL1hiKKwZyfhABljQwREWTkM41C
 7yfQ3OeN6nnRF6QnG9cuevU0EN6+tCZAjUOLtn1KfiZq/aCt3lpwjLRThE56FXvrmEncUA57CbQ
 v3CHzfMbG6bc7uTmU2IFT29OjeMzcM8r98lKZovRDNE6WL1+kbBTckqTCpQlLiSY+BSi/eh3oAk
 +h7232IM5BEDf3pgOwi/Bd/V+WytPSf7GQjzQQ+HI6N1NUvLKyAqHKGqLwPgOG2FcTN1cJH+8Wu
 6NLKGRYw7GAWdUJb5nC+sAHRy1OOhae84hm1BVweKBYJ/o+g6Jh7cSyShE9lriQGFPdKo73mRzC
 4iYFBpheT6y/zk8e0z
X-Received: by 2002:a05:600c:8b76:b0:47a:814c:ee95 with SMTP id
 5b1f17b1804b1-483201e267emr93459715e9.12.1770484372306; 
 Sat, 07 Feb 2026 09:12:52 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-436309ed238sm9322002f8f.19.2026.02.07.09.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 09:12:51 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] fbdev: au1100fb: support COMPILE_TEST and fix
 multi-device support
Date: Sat,  7 Feb 2026 18:12:33 +0100
Message-ID: <cover.1770483674.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=WJU23aVH+0sUbAyuhM36QZU69ipw8Ieg+NYdGvrvLeY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBph3KDnNMH1/JdOcqL0z3I6M6ieN3Fv7tNS64Oc
 2PyksJ6E3+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaYdygwAKCRCPgPtYfRL+
 Tsd7CACLPH0Qdyo0BISW7Y282uaaXnVl3Oatqm9AQpM2A8eCFibYA5/hFBTmwGkBKCCPpuWvoUI
 l5uReTC8pthgHoplTeynhWF6XA3HlpodJYZFwQ7xaERB4wPM0dytytv+wV4vDIyyVcD2rhmRREM
 toywxjN/YzzD8qA6WU7pO+USqnW3K2L0WplgiS3+3mslY5gKMBS+axISoTjsmbcF5J0TKj/5MWk
 LtmW0mKP7Z9Tg2sP4l6ESQ9+AmhB/Uh71q76dSnN7bMEQ853bcv18wKIMYBgz73+qYM5b0KO+0p
 ExYkERfp+HqwLEd7nT+u3t2eHNMKbf9MGohezqh6U9CK6saG
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
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5164B1069EE
X-Rspamd-Action: no action

Hello,

v1 is available at
https://lore.kernel.org/linux-fbdev/cover.1770196161.git.u.kleine-koenig@baylibre.com
.

I reshuffled the series to have the only really relevant fix at the
start. Patch #3 is new in this revision and so is the s390 specific
#ifdef in patch #4. Patches #2 and #3 fix issues that pop up when
compiling the driver for arm and arm64 and s390. The last patch drops
the hard dependency on MIPS_ALCHEMY. For that the above mentioned s390
specfic #ifdef block has to be added (or alternatively s390 excluded
from build testing) because s390 is the only platform where pgprot_val
is not an l-value. The things that happen in that block are maybe very
mips-specific such that maybe this should be an #ifdef CONFIG_MIPS block
instead of an #ifndef CONFIG_S390 block?

Note that in the v1 thread Helge wrote to already having applied the
first two patches, they are not yet in next, so I included them here
again.

Best regards
Uwe

Uwe Kleine-König (4):
  fbdev: au1100fb: Don't store device specific data in global variables
  fbdev: au1100fb: Mark several local functions as static
  fbdev: au1100fb: Use %zu to printk a value of type size_t
  fbdev: au1100fb: Make driver compilable on non-mips platforms

 drivers/video/fbdev/Kconfig    |  3 +-
 drivers/video/fbdev/au1100fb.c | 89 ++++++++++++++++++----------------
 drivers/video/fbdev/au1100fb.h |  7 ++-
 3 files changed, 53 insertions(+), 46 deletions(-)


base-commit: 0636e6205beed850d985276dc56fd73d785bea5c
-- 
2.47.3

