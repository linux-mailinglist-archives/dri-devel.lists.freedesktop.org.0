Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHi7KQsXdml1LgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:13:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0641980984
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473F810E05E;
	Sun, 25 Jan 2026 13:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QvXp3zKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6404910E05E
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 13:13:43 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-432d2c7a8b9so3612129f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 05:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769346822; x=1769951622; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c4KsQRxljgKgvfvUj483+iZhYfCZNJIcI9LKEpzOIXw=;
 b=QvXp3zKcuyAgCfYPQFo6+VEwCvr0sWnQ2OG+1i6MQ/ZrxjmhSH73tAje49xEQt2e/w
 8Zz3c1fnf3E83GtHhufqlHHfdJpHp0J6OWd0K3i2414D4RqpR5MLIFJQY2G339RpahEZ
 5zE0jTYgZUik/jW4TIutbD/FnEZ4JX1PjNOZRS5ASqfPUPH+9sSGbjxUn7kjY4KVBX54
 ncyZo3P2SfuZy4KM6BiLPwWDVab8P1MdsP+TmYA0Qcs0dqqwuZ7eLXVG45OYxls8V4h3
 ZtN7hUnzWjsH7I2c4dIRa9OldjCKqLODKGjfriWHsPghFi2u8HPoQ/kU3XVdxmSCgrow
 4rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769346822; x=1769951622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c4KsQRxljgKgvfvUj483+iZhYfCZNJIcI9LKEpzOIXw=;
 b=ft0v38WzUfjxrREPdnhO2ODZcvuYZR8LZhlcRb8GDS9yYy0uBC8Prft0EtkJgF4T0U
 M1HuEon/HT1qa2sF2K9KsuDwo60FNpLuffyzAYjCaqtAtjxTM2LKn1wdQcmsf5pgxPkj
 QekaAE+qpDQ+AqyHcLhvFQuzwItYXRB3JL/60VDUQkOwKsO2q2unDeUSkUjwn+FFBLXf
 v4PizYGiXBnLHx5H+sftfiNeDWpQtFoh1IOU+ZV6oRtdGedLNLp2/OZeaYGXX4fciwUI
 95hOM7IZNWG0Piks3W/iAqV224LImade0iMxi89BaPM+yFf/ujRSB2lRUwcZs+IPpqQD
 LYLg==
X-Gm-Message-State: AOJu0YzIv0WTj0HSJ9sPfo4YXaB/q+Ea0iT8qkgqo0ucVKeyBJZyZF15
 nxx2vIU1yxGcYi/8JI+jHG9kHPwbKhQTMLo90LbtfyEPjcozIUVX5PRR
X-Gm-Gg: AZuq6aL/QpP1SJhpj8mTvpEP5MsHEX8omwJza8dIkmOqgN5Znx5p6R9hPEy0Tih4z7e
 BCBV81SFAWMfo75yJBUx2f91cUWTpz9KlisOZbKmyS3nIIwqKYuIuJCAr/qv5/u+QcojdXpbukc
 F4h+qcK00zoGwBx5pUzwSRPZTVwAAzvFkunMEteXlu03mp9JS/57qYfMrgm0Wnj1Co+ZGlwJarv
 TuOyk0XMk8TQcdLOFATTmUfCh4qav9AvW3mvGD54BNiIK5VQmtmUTsNsAKFjUyWGdIlVYkV+j2d
 jP8JJ0FHxDfByohchOlhrA3IfqXLkXeSaiDtU4KK0FyGi01ucguSeNmp+Pr7+5ISFmD4K6n7EUY
 Jgv7S6rkri7zLY0IwG7Reb/qDRRupt3TuKKI1xcmCrKBNLwQP93norqgIM0LJ6qgjub9OnEthZO
 N7
X-Received: by 2002:a05:6000:2886:b0:430:ff81:2961 with SMTP id
 ffacd0b85a97d-435ca39ba81mr2485783f8f.51.1769346821609; 
 Sun, 25 Jan 2026 05:13:41 -0800 (PST)
Received: from xeon ([188.163.112.49]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c24a8asm21958244f8f.12.2026.01.25.05.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 05:13:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
Date: Sun, 25 Jan 2026 15:13:21 +0200
Message-ID: <20260125131323.45108-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,tecnico.ulisboa.pt];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:diogo.ivo@tecnico.ulisboa.pt,m:clamor95@gmail.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0641980984
X-Rspamd-Action: no action

Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
logic and clocks. With a few minor tweaks, existing tegra DSI driver
should work on Tegra20/Tegra30 devices just fine. Tested on
Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).

This patchset depends on Tegra20/Tegra30 CSI bringup since both share
MIPI calibration logic. Ideally these patches should be picked after
CSI bringup but they will not break anything even if picked before
CSI patches.

---
Changes in v2:
- removed all MIPI calibration, it is handled within CSI bringup
- added per-soc structures into of_match
- added fix for hang caused by register access with uninited hw

Changes in v3:
- switched from version DSI to boolean flags
- added comment regarding Tegra30 clock configuration
- commits were picked:
  "clk: tegra20: reparent dsi clock to pll_d_out0"
  "ARM: tegra: adjust DSI nodes for Tegra20/Tegra30"
- commit adapted to recent DSI changes:
  "gpu/drm: tegra: dsi: move prepare function at the top of encoder
    enable" > "gpu/drm: tegra: dsi: re-add clear enable register if
    DSI was powered by bootloader"
---

Svyatoslav Ryhel (2):
  gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
  gpu/drm: tegra: dsi: re-add clear enable register if DSI was powered
    by bootloader

 drivers/gpu/drm/tegra/drm.c |   2 +
 drivers/gpu/drm/tegra/dsi.c | 116 ++++++++++++++++++++++++++----------
 drivers/gpu/drm/tegra/dsi.h |  10 ++++
 3 files changed, 97 insertions(+), 31 deletions(-)

-- 
2.51.0

