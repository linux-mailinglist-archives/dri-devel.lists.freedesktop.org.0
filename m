Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F997CE8B62
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 06:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCFA10E805;
	Tue, 30 Dec 2025 05:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nEnefuyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F1910E805
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 05:29:02 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2a0ac29fca1so81618425ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767072542; x=1767677342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dj6McVGjym7Yb0fc3OqJWPUYkxg//XdJSHr/RV+rzYI=;
 b=nEnefuyzvQ2M26N5GBeNkN8IGn9F2QJifH4B0TSNlgpsYxrjkZTKEXjEY3fuPUTIOS
 UHvLI+kvJUULuk/yLd1jIDR8bMwi7mgnzN+SW8GAAaHyATH7N2p/tTd5VOyxc6l/GWKr
 ojmqvrB5O8KFZRp2FN1T03LYOjyqt+AVe2A3FgSeQB7qwjRDYdW++GJH6bCRQ6oVKqq+
 hmASpk0F9hupunVEdYcIshRHf+VMnuw0SeBPbKyJFWtNnkmqZrPcawlvrcpFbc5Iboaw
 PARfvdm1IQ/F8JOJTbckR6gT/IjxnmavisfsCcKm22LCZNwGqQGVlIaLgvG4B8EqdWX/
 EhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767072542; x=1767677342;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dj6McVGjym7Yb0fc3OqJWPUYkxg//XdJSHr/RV+rzYI=;
 b=tEuoG9TOdE8izv5RddNAQe0Z5i/PG/XoWjWIM8H0mTrOzDLlQ+7wk2RRvT/LR3UuyE
 DOmwxqzSX8YLnxlsvgPn+vkYox9pMub7XY7N/jKTvkG2OkL9mWu1f8Hd/jXqyi8YoNpG
 KW/SMMaN05u/R9eoFxFY44TB3ms6Npt/LLI1ORRezELXmMSQxKSP6jbh7RGfl6837pHz
 AqHXVab6KGSQppsbx8lJi5Myo1zS30NyO5hhRSod0QiNZrFwKn1t+VrAMoPbfN6HWbcY
 5dMBaPupCR69iSZuRdayoLvLoTqctqhSNwUHL8GpOSPldLTOzautd+v4AT3JXOFzz2/i
 9nVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi1KyzQS2svaEGZ3v3WEOGYCXYZZ5nGx4hk4i1J7cxJL3Ai7iQSv7TRuUyThWalW3ZCrumQ4K/dSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKkCo+nJjROsUn5AonoJdkVU115CAEzsd/pe6jN4HQdmaGTUIB
 QiTQof+adHVA6CSMU1eFcYKvwodEuHmLPuHnIZvRVO2ITHamidNNzuMd
X-Gm-Gg: AY/fxX6cgBJonUHHnK5yc3ZENwWzwdYA4WhZsh3Ebq5FWFBIn7Kd6qal4Ah3wnk1cjN
 BYv7teLgu1FpHmIxGhm2au2fu+txk+DBLp4sKikw2YMao23FOWTEBt6P+I7a0H2xXX9hUAhY0Ax
 gSxCJCp6O+Aq1tBJGMhGC3qLB6YmgrZ3zWpOmEky2qqelQPLXUzV5zE0xtVsQT5K7/QxrxxXLkB
 Y0kdvIZ+IT5mot/q+8P890cmKnX1dkRNcMVOKxVQ/0eQVPd/qE+Ix8d8sQgxqrYmGw1qY9axdpG
 PIG0F/RH5ocjDVDMQR04+qAqEwoaGUWTVU7JbDLB87ti6Ih3ybgmSi4RcR2kIvPO2ojztHaKRG/
 1foMQ6L17VBkKcyDFqroULz8ucK0Wi1X1ip3JW+tdGuWGEZZE/ESKMHDSQhyW2omb2EeZ+BMwUj
 IM2uGL2NdxPIrbGVgRqKFo62di7dTZF4ui1AI0MW/REg==
X-Google-Smtp-Source: AGHT+IHwTfpQdWaiGQID80ROPYBWipLKNMwbumSR5a0iV81jvx/Y/dNBzJjvj9L9pMYVwYJAGCLB/w==
X-Received: by 2002:a17:902:e785:b0:2a0:acf1:ad0f with SMTP id
 d9443c01a7336-2a2f22024e0mr275687215ad.12.1767072541794; 
 Mon, 29 Dec 2025 21:29:01 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 21:29:01 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v3 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
Date: Mon, 29 Dec 2025 21:28:18 -0800
Message-ID: <20251230052827.4676-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
it only for sysfs interfaces, addressing Thomas Zimmermann’s TODO to
remove hard FB_DEVICE dependencies.

The series introduces a small helper, dev_of_fbinfo(), which returns
NULL when CONFIG_FB_DEVICE=n. This allows sysfs code paths to be skipped
via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
full compile-time syntax checking.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
Changes in v3:
- Use PTR_IF() to conditionally include overlay_sysfs_group in 
  overlay_sysfs_groups
- Decouple variable definition and assignment in fbtft_sysfs_init/exit

Changes in v2:
- Add dev_of_fbinfo() helper (suggested by Geert Uytterhoeven)
- Replace #ifdef CONFIG_FB_DEVICE blocks with runtime NULL checks
- Switch to fb_dbg() / fb_info() logging (suggested by Thomas Zimmermann)

---

Chintan Patel (4):
  fb: Add dev_of_fbinfo() helper for optional sysfs support
  staging: fbtft: Make FB_DEVICE dependency optional
  fbdev: omapfb: Make FB_DEVICE dependency optional
  fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional

 drivers/staging/fbtft/Kconfig                 |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c           | 20 +++++++++++++++----
 drivers/video/fbdev/omap2/omapfb/Kconfig      |  3 ++-
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c   | 16 +++++++++++----
 drivers/video/fbdev/sh_mobile_lcdcfb.c        | 12 ++++++++++-
 include/linux/fb.h                            |  9 +++++++++
 6 files changed, 54 insertions(+), 11 deletions(-)

-- 
2.43.0

