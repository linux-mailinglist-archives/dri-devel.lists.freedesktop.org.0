Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3318582FF30
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 04:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D11D10E621;
	Wed, 17 Jan 2024 03:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2851010E611;
 Wed, 17 Jan 2024 03:13:23 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2cd1a1c5addso123126131fa.1; 
 Tue, 16 Jan 2024 19:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705461142; x=1706065942; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ADVa6dhhX6uOMOvbI9YDxuD3rJvLmpM0F1zxHrfGnwk=;
 b=XaHI80N1+vEgDyxf8F9OFyAHBr9PSG94733qnnTxwoYvvIqHNn9xj+qjZ0phNxBKv1
 wurw3rsewLRMqxFTQmq9sQPV86m4xst1TruXuYHFIcsUfYFSBlkQrkeBfK9kvd0sgPvu
 wTld2LtkqPhvU8NJSerbx2YdAid8X4MmEW6VeysZrmrhtWZh5+0CMqMXyF0rcEDMgtet
 gqTq+lOZ1pmeQeacMbK7ayUC3PbAgBR0LxSaiJMd/GqJ0qtLyoEde/F4m4g++vsWE1OA
 gR8XBiMw3nMvh7eewM6KDSg9mxrV6dieKo5VqksmHiSyEGHrkgzjfWh/OEol5FUnFG0y
 WD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705461142; x=1706065942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ADVa6dhhX6uOMOvbI9YDxuD3rJvLmpM0F1zxHrfGnwk=;
 b=V37Mp50rwTcgTPXIz1VeYnfJ8F8GhjF9BYl55SmBZV8OF63/SNBZ+RKh5aMbAZPdaM
 W82mjwluY7cPV2GCrf4QEVZCn5T6MmluizLzb+P7xMkIHJueXJD6nVOrlt/6v3L4uttk
 nt+ia4UT/jAcrHTpRmz0IJDPhUF2KdbWsHc53fjH+6rleXpM2RKn7jcJu9QS9JUj9NfP
 ScsjK80DPUHfJU7mgU1STNhSpx9cO+3hl7sCBf/SP6dUNOgMXmjYdc/KXBvzHHS2gGFg
 6nUghBo35WYxuAW2UX0Sc+vWcA5ycsITiZJ0SPwPmxjtTpxhfjN0vtaxIblI92Rm4Jb6
 LPhA==
X-Gm-Message-State: AOJu0Yx20iPOBN9CvAtDTdLgTqP/xqgzw6SYyjLUoNqImKA5qqy9RZn0
 c1WkDebGeIjJIZDpQTJHPOs=
X-Google-Smtp-Source: AGHT+IGCAEkQUMLR8zU3CI9B7qiwHLI4EvlgyFIpxwO2sNzIS13NtZgB6xC9DpCIDhBUMxK9jw7ADQ==
X-Received: by 2002:a2e:3a12:0:b0:2cd:fea:65bd with SMTP id
 h18-20020a2e3a12000000b002cd0fea65bdmr3776646lja.28.1705461142008; 
 Tue, 16 Jan 2024 19:12:22 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05640204cd00b0055971af7a23sm2258418edw.95.2024.01.16.19.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 19:12:21 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [PATCH v1 3/6] drm/lima: set bus_stop bit before hard reset
Date: Wed, 17 Jan 2024 04:12:09 +0100
Message-ID: <20240117031212.1104034-4-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117031212.1104034-1-nunes.erico@gmail.com>
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, christian.koenig@amd.com,
 anarsoul@gmail.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is required for reliable hard resets. Otherwise, doing a hard reset
while a task is still running (such as a task which is being stopped by
the drm_sched timeout handler) may result in random mmu write timeouts
or lockups which cause the entire gpu to hang.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_pp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
index a8f8f63b8295..ac097dd75072 100644
--- a/drivers/gpu/drm/lima/lima_pp.c
+++ b/drivers/gpu/drm/lima/lima_pp.c
@@ -168,6 +168,11 @@ static void lima_pp_write_frame(struct lima_ip *ip, u32 *frame, u32 *wb)
 	}
 }
 
+static int lima_pp_bus_stop_poll(struct lima_ip *ip)
+{
+	return !!(pp_read(LIMA_PP_STATUS) & LIMA_PP_STATUS_BUS_STOPPED);
+}
+
 static int lima_pp_hard_reset_poll(struct lima_ip *ip)
 {
 	pp_write(LIMA_PP_PERF_CNT_0_LIMIT, 0xC01A0000);
@@ -181,6 +186,14 @@ static int lima_pp_hard_reset(struct lima_ip *ip)
 
 	pp_write(LIMA_PP_PERF_CNT_0_LIMIT, 0xC0FFE000);
 	pp_write(LIMA_PP_INT_MASK, 0);
+
+	pp_write(LIMA_PP_CTRL, LIMA_PP_CTRL_STOP_BUS);
+	ret = lima_poll_timeout(ip, lima_pp_bus_stop_poll, 10, 100);
+	if (ret) {
+		dev_err(dev->dev, "pp %s bus stop timeout\n", lima_ip_name(ip));
+		return ret;
+	}
+
 	pp_write(LIMA_PP_CTRL, LIMA_PP_CTRL_FORCE_RESET);
 	ret = lima_poll_timeout(ip, lima_pp_hard_reset_poll, 10, 100);
 	if (ret) {
-- 
2.43.0

