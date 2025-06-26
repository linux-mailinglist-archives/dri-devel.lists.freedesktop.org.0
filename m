Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B34AEA872
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 22:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1446810E90B;
	Thu, 26 Jun 2025 20:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OfCceN5C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB9810E2ED
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 17:24:29 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-739b3fe7ce8so1502934b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 10:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750958669; x=1751563469; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GKksa35feXB36GHTT9Qp1/4Jr24P78lzzDtaWWGcnqU=;
 b=OfCceN5CGL18U6CLAsD/Q8XWdZBsUI9eK5kO3R8ixe6WcrHeS2tIrvpn51oWQkXzkg
 K+eKzYjZg5UA95uC2Mu1Si1QWXTEgLn92tBdxK+nBl6tJ+P4cTvzvLmsHF+26JEPP+pV
 CRSvtjfz5POg9AJFreaYbaDWuW8RsZx09orrCMaRG6zcdTq1eMNY/ZdgwWpCuBAyjVEL
 3uHeI3JXpYhMXSWfbEUg/6jmHS/zGnoVkWGv0YDx7cLMjVSq4WkB9E7qutxZlh5GHLuA
 dO9TKvVt1wXCx/6GQJMKl9laqMM/fqlbfuAFOII+/jVq16Jvl/5k02BA9cHnxiCgUjxP
 UbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750958669; x=1751563469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GKksa35feXB36GHTT9Qp1/4Jr24P78lzzDtaWWGcnqU=;
 b=V8g+QV+d/XksEbpfCuTKjLVjzKLOKpR5h65dkTp285tdf5tpastQU17GwKMJE9XKNx
 y48+RBp/4pPj/xpzkDJ0maHYwoU/nFFb0K2wvZ8XvxZT5swws5UiyX5N5oKBQiGfGbrt
 WDvfg/aDpIspfd2iEepDyQv1cYOabv8hIXD26/sp6lWt3qXc18YK6knDoya6NFsVsBC4
 NJLtHZryHQHhEWD0BcmTl6xfU7NpreYT0LWJ1NmiAEqmlWoTcFDhvnphK/vU4CFCbU8/
 /PU/fOK/IZ/MqBe4/jdac+HlF+xtL+JOcREWkKzK5c5zYC+VIxYWY6uaZfcdQl0Q4LdW
 aAbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJI6uFoZKk1bA9llA+t3QP5jetVBZ6DA7pD6+Tt9OKfa8hRsMHpSiiUBpMXGkzW61HOor+6eiGDkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGLBkH1+v8Bzky0wRjUy83vJhw1lV5Pcr72sdMwaIUxcNnAJOL
 PALtxc4Xf0GG9rp14ErNBWWSB0aK4QQuOYt+VdAcKTPu4W/HZgsEX/Ul
X-Gm-Gg: ASbGncsrrFmlRcNih8eAZxt27Mx6VYP8lpE2UBDK/NFTTW5GTvST07hr5RPT3Xs/IJB
 dnG8WHvyAmIbEJbzmxsdveUlGHgOh24/S2N1M3kI8tO+T2W8QlxJquajeHSHUgIqehu2XnSrTU0
 h1wEFn8nPEYLQgVOj+o7LZ/6K9O195VNyjVK7qUgugtFakWyBoU+fp7AC1kjqwuuX40c+pUNs7T
 rw/4K/PqYc+5yUlx/yJfVfAmW2DfCFqWCwQHqFhYWGZFnY7OKxIsc9DR6ckxb/e9qsdpUnp9WxG
 ABqgl2a2LHgDLISxO3KxKno2OKnYamazpNqNlLldTB/eX/+sFZuMKQFh4Cox3Yd81YlpEd3dgQ2
 WJQ==
X-Google-Smtp-Source: AGHT+IGpNrxWVlvz9yO0sPnp3SvG03DYr98IGTzu1iXn9pp/JkN8N+6B43mNyV1Djnpa3TrKJLV9Eg==
X-Received: by 2002:a05:6a00:846:b0:736:a8db:93bb with SMTP id
 d2e1a72fcca58-74af6e66354mr59436b3a.5.1750958669114; 
 Thu, 26 Jun 2025 10:24:29 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-74af541be9fsm229670b3a.50.2025.06.26.10.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 10:24:28 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, gregkh@linuxfoundation.org,
 lorenzo.stoakes@oracle.com, tzimmermann@suse.de, riyandhiman14@gmail.com,
 willy@infradead.org, notro@tronnes.org,
 thomas.petazzoni@free-electrons.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()
Date: Thu, 26 Jun 2025 22:54:10 +0530
Message-ID: <20250626172412.18355-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Jun 2025 20:52:12 +0000
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

In the error paths after fb_info structure is successfully allocated,
the memory allocated in fb_deferred_io_init() for info->pagerefs is not
freed. Fix that by adding the cleanup function on the error path.

Fixes: c296d5f9957c ("staging: fbtft: core support")
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
This patch is compile tested only. Not tested on real hardware.
Bug was found using our prototype static analysis tool.

 drivers/staging/fbtft/fbtft-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index da9c64152a60..39bced400065 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -692,6 +692,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	return info;
 
 release_framebuf:
+	fb_deferred_io_cleanup(info);
 	framebuffer_release(info);
 
 alloc_fail:
-- 
2.43.0

