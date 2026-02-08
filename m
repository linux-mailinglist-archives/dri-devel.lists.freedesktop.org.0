Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEQ0FczOiGlkwQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:58:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B69A9109A2B
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5200B10E310;
	Sun,  8 Feb 2026 17:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZONmjch4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB2110E310
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 17:58:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so4372865e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 09:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770573511; x=1771178311;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yE2ylBa4QK89SCH07FfbDONHRts+1FKqT8EvuwSyOdo=;
 b=ZONmjch4hK5FCI8Yu8xMrxX2t6OMPtg1/kde7GSIWJM/GkaZRTw5w9Pmc5/b/BND4Y
 1K2yANoX2xW+KOOTOE6mQUPqxTsdcC3TcW0NTFij3Pxm4YMtOPpamFDdWQUXXStN8ZIR
 ky+BHkDzw6lvJEToUcLfEI27EUQt9yEjBypF0zOD00Hdbap+vYcEYe/DYdZnqQq5be3P
 JfBQj3YUxV8BHnFeTI3VZC7K/P5tqiZKx1R7l5FlgISLihPA4pITwdbsoOVPZXIWHGD3
 Hspu9tuC2c3h7MqtyzsN2LCQgXjKZQoJF3TVJy854mRABXKxaRw1ok+O3lEv33PFUiMn
 3wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770573511; x=1771178311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yE2ylBa4QK89SCH07FfbDONHRts+1FKqT8EvuwSyOdo=;
 b=Z997/UqRz6cVPjHVLyWdrepjsEh2GXgJfire3N2Ub6dzEr6gtBSkXSRv14+cAyTAor
 xI5Osuny6a/g67YAprTpICIHAZjQbD5NYuyI/TGTTcv3nvAOutscq0ZpB1eyhVd8mLSr
 1n7JOW21sJ/PxJqR+PJaTbUuCJGd3wRlq6uChCEn1xWA2B2VzTwuY0HZebEmGU6gcEMv
 /USsyrkCXWLszltbT4a1CCLGXHmsBdWVZARRQWDXj1XLwPOw9HP6UUG3FtCn6yP3BoyB
 k41mS1t4HSESC430xytHtAlrlCLaTUZDsmrgaUj1l5yBEfJSLymanCtdBCPwxjV+9kvT
 sTWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmNNkf2JRgbl6lr843gNgUOd+sSPvP3YBInFffnjeFxdXn8fUnJRbcXSG3yDTQugWZGl+uSj/pK2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhOOoxSwiWIUVBxgKlFRMR+qAgd+x+szvhq5POHYHKflK+P1C7
 6fxPhRjvYvm+PbJkY8+7xNpbTv3vOdkWQgoAK3gc2eAKEOejyGkxf7oA6tCcatrwxCM=
X-Gm-Gg: AZuq6aJX6/hLQf6okUYHvxMGEnhwqr72S96ksTfsU8yzejE0qhtCkZORRMAZydm4o8C
 4X9NuyoTGJVR1kpsId/oVgyG1aE4JB24yzdoFU4WumUXCssIsEZZLFA2Kw0NBR+++jZQo+IKhQL
 J5yaJM6x39PXqRveIhigzAjqsbTsSi2HuI/WNVZY5MWvX2wv3kJ4v+iceNRSROgA96gysU8DWUb
 PXVhnUVeOKsLmv9ySiIszGXSQixxUroz98d863cnREbNYj0By4wYHr/QaiQVjaHRZ01XxLKlWJs
 u/M+qxF5NXDasRKcZMFeGOowhKOxjYjIHqm1OW8PgW0fl8i6dA1yUH3xwkmr4jHFd7JB3iQH1dJ
 uRi3RicjGXtSkzeE8t/5V4pML64n8WPTpgy3T4EznKLlZtnKgG9Ks3GZErGg7pY+lkiIjgtrDHO
 Kmp86gc5JZR+AnngVK
X-Received: by 2002:a05:600c:c16a:b0:475:dde5:d91b with SMTP id
 5b1f17b1804b1-483202160a2mr143378295e9.17.1770573511092; 
 Sun, 08 Feb 2026 09:58:31 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-483206b8bbbsm318522835e9.3.2026.02.08.09.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 09:58:30 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/6] fbdev: au1100fb: Use %pad to printk a value of type
 dma_addr_t
Date: Sun,  8 Feb 2026 18:58:01 +0100
Message-ID: <740dda7be9c7640ef3890c96d65bc7cd29d89d1d.1770572936.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
References: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=DuNlhjJhQWs4f1TsLwXQa8mEYD76mV9xWj6rGZydkYo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpiM6yNYRVKTLT22DmhhcqMiI3mcT/emNiM6vJN
 ZQOlnu4ADyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaYjOsgAKCRCPgPtYfRL+
 TnKnCACKUl1hAdxiOCZSKA9M9EB41AwPKe/Sq0XLuGb9TU5AV1n7adfUgDqb0xI76tvJTqK8laS
 BqpDTH+L7rF0itXVtlIW9h0m5EV1zcYNBYNwttfLtPbvEwoklo2Sp2Sy9h7zE5DtYBjMnwKbgJQ
 yXXo1cECGb/9MjUDs9A4x9vlkSGeE8UHGQYbSpkbyT9CMEuIDH86kUQprkweJWsVmCZsuqaaF+B
 VZqAOrhO6qGaupSIr7YYOsOKWlIVqHWDrisWv3pTAHevm6e7LUXQfzSY/PY/SQoVBGn/j7+wCGq
 4k9iTBmW7wkri43O1Ax/xCwNDls9plleQ6d2CuQab4xQJz0t
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
	NEURAL_HAM(-0.00)[-0.986];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: B69A9109A2B
X-Rspamd-Action: no action

The size of a dma_addr_t variable varies among different architectures.
The save way to emit such a value is using the %pad format. This
prepares allowing this driver to be compiled on non-mips platforms.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/au1100fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 914f371a614c..e43687ac74a1 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -465,7 +465,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	fbdev->info.fix.smem_len = fbdev->fb_len;
 
 	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
-	print_dbg("phys=0x%08x, size=%zuK", &fbdev->fb_phys, fbdev->fb_len / 1024);
+	print_dbg("phys=0x%pad, size=%zuK", &fbdev->fb_phys, fbdev->fb_len / 1024);
 
 	/* load the panel info into the var struct */
 	fbdev->info.var = (struct fb_var_screeninfo) {
-- 
2.47.3

