Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C514495BFEC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 22:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2970B10E0E0;
	Thu, 22 Aug 2024 20:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TdmAG4+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4BC10E0E0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 20:50:50 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5bec87ececeso1684475a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 13:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724359849; x=1724964649; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fw3+iCjTPQFvMhYVXHpivZMghgw126sYI/qUY4SnqZ8=;
 b=TdmAG4+q3eKTLTc1LSyrbYQRWtXNgRPERnddzgYfmE2L/P6rCwfBqkGDUMZfdmL3XB
 VsBNc9GOPVG1mAABtks8mJXfMMqiu20YOKmOwNJ5To/hgbSPL0rkIxU6/xDfknTRORaA
 LyZvqOSD5nsFK9rXCBAZ83oYWF2U6sYd9Wwd9DTJlapXUmAeYxGCKLbgXOY5lpH0FBO+
 3iJm5msJGr0J+8J1VWIbysC3TfpILsMipe7P5BTXeDgS3W6dSRU0fBeTlCC0zfeZ8L4W
 gdIlH+e1fySTo93VCPXzMVjHUqvS36inV1ujc0domIGavx86XgjjN2fTe4/a35mMc/op
 OyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724359849; x=1724964649;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fw3+iCjTPQFvMhYVXHpivZMghgw126sYI/qUY4SnqZ8=;
 b=jvK+jfn50fiLD/d0M0YQQDcSs8+AvN0fCB0D88Sq38rdeN4JC/OAddm3XDASPN5Uj1
 hJssQvp8n9p6Qfku0Rdz3bpglXZiPsvKpzI2clcqiSs37ZWSM6wWLuRQY06FQR0gO4Wg
 wTEkN+aZEYihRRjZQq4jvs/fn7hNyzqb5E5K0ufBJooBLoD+j9G/CsKd9OPUyV/JHavx
 qtbLp0ujDBSsjJR+j2+LAKn0G/45JjliNUhSwCIK5CPrwS0wuY+XUzGD2MPDNAh3FMV6
 /s/k1DEpT4iYDkxV4mSAovOAAmRrriQEBYTFZnaYQm2A61XY1fxlPXQuvVCYghW3yx97
 IiMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9RLI2fwB8IzbQ/F1APMx4V0EUMCWBaGRqNAKRn5nGAXfgyKicbaTq0ngKz3hbaU3G95BDqhHgz9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytFIYsgq23NyjYSv13uCN+GSSYe0aSc7s229Re128BPX7cZ5qg
 am4QC0vSwDLA6Bt/3NWN4SUIWnlicK9wV3iYiVMJcoS4Lq6DPrsG
X-Google-Smtp-Source: AGHT+IHva2stwTSqG7rGZTaZUHh+/wTMO8O+48GKKMUS8dBUyWj5Buqho3Efd6rTd7pGcg1cwITIAQ==
X-Received: by 2002:a17:906:eec4:b0:a7a:3928:3529 with SMTP id
 a640c23a62f3a-a866f110c45mr589588266b.13.1724359848540; 
 Thu, 22 Aug 2024 13:50:48 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f436ba2sm162067366b.120.2024.08.22.13.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 13:50:48 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/tegra: hdmi: make read-only const array
 possible_nvram_sizes static
Date: Thu, 22 Aug 2024 21:50:47 +0100
Message-Id: <20240822205047.642845-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

Don't populate the const read-only array possible_nvram_sizes on the
stack at run time, instead make it static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 09987e372e3e..6bf2dae82ca0 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -434,7 +434,7 @@ tegra_hdmi_get_audio_config(unsigned int audio_freq, unsigned int pix_clock,
 
 static void tegra_hdmi_setup_audio_fs_tables(struct tegra_hdmi *hdmi)
 {
-	const unsigned int freqs[] = {
+	static const unsigned int freqs[] = {
 		32000, 44100, 48000, 88200, 96000, 176400, 192000
 	};
 	unsigned int i;
-- 
2.39.2

