Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCGCH6Byh2nAYAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 18:13:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18681106A0B
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 18:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F9010E287;
	Sat,  7 Feb 2026 17:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oYHw2g9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E1C10E287
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 17:12:58 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-480706554beso18121395e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 09:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770484376; x=1771089176;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nBNswDVCvxM40B6CIwygotXLGe434Ipwm5Sz6WlbTOc=;
 b=oYHw2g9ib7lg1ML4XAk+ZDmWhxw3SOYGn6HDREuY+5KqQhkVfsF7eQWTcqm0dRVH6u
 DYHmNt+eIqnyek8CHZ5BnU//kRcvmPvRNZS4yt7lQvzERn+oTvqXNxr1VufhrhGEiwRU
 gZaurSqlPyv2g/I5Re5Na4N47hl3FMpV7j7Fq89uRGpktKgU9hPYJ28Tmhr1ALkn+cTk
 JZilsH+q+U70mX4UkTTSyMdNuuTW8BnzOYmi7O2qV8RcDfrnF7USXeQy6fAfQR9S7MBI
 EZkFogdrzn16CDcmJ8uXnW9U5Wxs+1kgJF4PD+hqr4KeSmJEV3nsbo7Ufl1ftlrB9euv
 OwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770484376; x=1771089176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nBNswDVCvxM40B6CIwygotXLGe434Ipwm5Sz6WlbTOc=;
 b=nZWXBtTnNT40rXNyCfCjlN8j/DQuF2v1XN10VB8b4e/MEYcqw9A6Yq2hvMvcg70g7i
 MvU/ap4sMzbqKKiDdmlQdpYXd8LQUgcbnOvhXQKxSk9q6D1q+5bjPwPLkilC6vnzggIa
 4hENGVa4lHsXdVXS4zShiR9hhpp7cWGfY2k92T0tsAmoxEKbF0w5A/UZdMMeDL8NVJQ8
 HbR/CclROLjJPFTRU7b2ug3xjjKZoIYL5mQhy9hJ4PbQw8KUpfVWSy3gyOaVt0VbhwAj
 UOvaK/eYuVo0Zj8H+fPhDLtJ80SuwhyKe9IDJJrspubmcKmYnvHy+xTYPDdnnBUXjcUT
 XQAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP8rsJ/mzkyRAvzgPsFCPO38bczdzeP2JJwldqBhMB3Cc/MeUyLodv6GjQx1WGJcbSud8VT7w46b4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSbJHyzqbH5dZ+o/0B466mr61n0qf/BwEO95MRswCjMfE9j0Gc
 2nE8PcXeFtQFrpYUYhJFHRE9/1HN5I6+1RLvEwDX4O/hZ8g6/+yrFOb40oFJxkV2drd7Qg+kk81
 h2vlf
X-Gm-Gg: AZuq6aLysMFCloX35MWZF311Gw+3MyijOPbobkkZ/Z8a38DXnkmFQBy24Gm4UW0/0ki
 8X1MFWkooD67mBTCkm1QToO6k9GiugsYc9f+iX0jstCiIklZeMHWdpBaQc5xJyPkIxUUXpZLYb1
 grWb8QXCrYMASEW3NwcadTEvyMIPYaSqPSGZI+pCL8GxEHFZc3Ny4Tq5lYr+JTSE3Vig9hvTIwl
 RqdUK206eUyWOclgePGTTqkxmreOVEMrjjxepuKo/3TSlYxPV57W8sOvjjxwaPPBy2kRSuyUzdh
 xD53dpYM95ZUFzezGIrK7G0SoyxyUL8l8KaeqUUuafMVKZ1oLU+58jbW/R9ETxx/O2NN46mi5Mw
 Rf6Y7cTUqEgNRe4vePFzjiZEjHjFwk2U0WvGeAmPf5BUukJXEKb1Xd92iHRYJ/HW77xPObGNII4
 rrRcgSvoAxXJKQKCJX
X-Received: by 2002:a05:600c:4590:b0:479:2a3c:f31a with SMTP id
 5b1f17b1804b1-483201dc4afmr84421225e9.1.1770484376542; 
 Sat, 07 Feb 2026 09:12:56 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-436296b2ed9sm14431652f8f.5.2026.02.07.09.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 09:12:56 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] fbdev: au1100fb: Use %zu to printk a value of type
 size_t
Date: Sat,  7 Feb 2026 18:12:36 +0100
Message-ID: <444f0cd1a39cc665a9e2d76454138c3e71c7747f.1770483674.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770483674.git.u.kleine-koenig@baylibre.com>
References: <cover.1770483674.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=PRKEEDXGhUgRfpyYcSE3CgEOIerXkC5W3JA9O+m7CdI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBph3KKcBNNlLuyF2eU4Ccfaudr5J9crWtOZK1PN
 HWEfAJlSNqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaYdyigAKCRCPgPtYfRL+
 ToB/B/0fa+zXGHEdcQtdjS6hefpe4i2HuWor/LdzHcN5SvxDPpkkafdLg/Nn1ZLvflE2WZGDH9+
 P+L4qa5JejM9bl7hUMM0RqNHn2q1VUAkwoEV8BEelKh29X1+gzD5dius1pzNzdYpEGftBrtmQN3
 2Q3V8hXt7hAlDIUsHyzgImmQDFYpnkK3jDZEAYYbLb4XuSrJ9zRbc7/dn2s8f6xYJMzB5IxUAVw
 BRT4TSmBs7jsq7c679S1FR1ZJb7xZkIIpQJ2+THh2OiFURZg1AiLsIyeVHL7fFgXp3wdh2QQnUv
 alKfy1xlA7blicp3dwziHpAUCXJp+2Bv5QV7rzkAVB8tzkKI
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
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 18681106A0B
X-Rspamd-Action: no action

%zu is the dedicated type for size_t. %d only works on 32bit
architectures where size_t is typedef'd to be unsigned int. (And then
the signedness doesn't fit, but `gcc -Wformat` doesn't stumble over this.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/au1100fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index beba8befaec9..a0e1aceaf9a6 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -456,7 +456,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 					    PAGE_ALIGN(fbdev->fb_len),
 					    &fbdev->fb_phys, GFP_KERNEL);
 	if (!fbdev->fb_mem) {
-		print_err("fail to allocate framebuffer (size: %dK))",
+		print_err("fail to allocate framebuffer (size: %zuK))",
 			  fbdev->fb_len / 1024);
 		return -ENOMEM;
 	}
-- 
2.47.3

