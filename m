Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4359399AA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 08:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1609110E09B;
	Tue, 23 Jul 2024 06:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="05eoSRf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCE010E09B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 06:26:26 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7163489149eso240301a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 23:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721715985; x=1722320785; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6SsFIYWxstbmDRzW1IT5LqdPqdbJ83bJMDp+89ci+w=;
 b=05eoSRf/ulofWiMIXWmeztDVp5ETFziXynhzt1bA7A4rLPSk761eOfgidObUbbZM38
 QLMpvmUobvacVJzBEtTQQWf4EsmJM+e2xTqPS/RLdD2b/2BzT3taUjlSTMdLv+15TMhM
 ul/MGTpek8aLW1Hmu3E8mSYU06uOuTRbG0dsCQbcNOpMxpm6uISoWozpvEOgQmj9bN9T
 RyeGlgkvMiFRs9YjJshr4NOqeW11gmikQ9VcmJoRnMfAq/3KsrP/xVdsWl2c+8cvpk0Y
 w2fSmbI9sBLd7maaTLdccwofIkaVTr66X8tELxn2NRVhUpguoFx/OxaicWIpzmF0BBsS
 8BIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721715985; x=1722320785;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v6SsFIYWxstbmDRzW1IT5LqdPqdbJ83bJMDp+89ci+w=;
 b=fOfCg/yMPHOJLjLbXZzUNlAtFS1SrqhSr+kapSfwt80UJpCoGJKI2E3ZYaSoR/HqEg
 G9IRW4YpUHKAwIMYr6P6pUhrCwhL4nwDGYUbqj2Z7cPKtvq5Xes23WkvOJEw4I+0REYa
 bVCqiwjOQJQn47u4xXbZ53ch+Oobrayo5AVMHp2/PmNy2vkXRuago5QJuWEM63vt39tH
 oVp+KxD0KonbldhU6qjfRyrZbbDn/DyVNqchHVjtMEucHGQmAYJu60uIQfEw38+VZF5T
 uUoBYwvtMpE8uBOM+BzTFqnHHZYWHnQS/KvP7EA7R7mv+lpdJtHjEHDD6ivyOPD6JQzL
 uolw==
X-Gm-Message-State: AOJu0YyzDSHn6G5ifXMtbilVnAhDX5Jhyqq8tVJlRYiGbv1lnEWVQGtu
 4FVDC4j8LtCp9jgYWLkRJsX/vuNrdOCFPAwtnR/UWifheyOzfhxRChA2ZpJPoCA=
X-Google-Smtp-Source: AGHT+IFMaHyHBNYiozxEEWli2Jwj4FXXP7MQxh6eCefMVJIrwf06PEaQ158LGZWjwEceHa+RuEv7OQ==
X-Received: by 2002:a05:6a20:918d:b0:1c0:f5c1:8083 with SMTP id
 adf61e73a8af0-1c428681001mr13305601637.41.1721715985602; 
 Mon, 22 Jul 2024 23:26:25 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f25ab47sm66351465ad.45.2024.07.22.23.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 23:26:25 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, hsinyi@google.com, awarnecke002@hotmail.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v4 0/2] Modify the method of obtaining porch parameters
Date: Tue, 23 Jul 2024 14:26:13 +0800
Message-Id: <20240723062615.14796-1-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

The current driver can only obtain the porch parameters
of boe-th101mb31ig002. Modify it to obtain the porch
parameters of the panel currently being used.

Also switch to the drm_connector_helper_get_modes_fixed() function 
to get the porch parameters.

Changes between V4 and V3:
- PATCH 1/2: No changes.
- PATCH 2/2: Modify the return value.
- Link to v3: https://lore.kernel.org/all/20240722092428.24499-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
- PATCH 1/2: No changes.
- PATCH 2/2: Keep bpc settings and drm_connector_set_panel_orientation() function.
- Link to v2: https://lore.kernel.org/all/20240716121112.14435-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
- PATCH 1/2: No changes.
- PATCH 2/2: Switch to the drm_connector_helper_get_modes_fixed().
- Link to v1: https://lore.kernel.org/all/20240715031845.6687-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Zhaoxiong Lv (2):
  drm/panel: boe-th101mb31ig002 : Fix the way to get porch parameters
  drm/panel: boe-th101mb31ig002 : using
    drm_connector_helper_get_modes_fixed()

 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 22 +++----------------
 1 file changed, 3 insertions(+), 19 deletions(-)

-- 
2.17.1

