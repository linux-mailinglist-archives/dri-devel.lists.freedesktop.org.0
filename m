Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EB7D39BBF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7921B10E2FF;
	Mon, 19 Jan 2026 01:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hT941CHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422EE10E2FF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:11:51 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b872cfd35cfso75722766b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785110; x=1769389910; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5i79BDrxuHBezOHdjkerpF2EfskLPnOmytUYpUqDeYc=;
 b=hT941CHpQca7aA+jT6YLJA7pafTlueg/CxnE4M/Sl1wID9hI8+ccesw+aiPLpDWYSL
 02O9mdqijb5kWYuVmb7DCXoo+IdZNxSfsEkFPuyU+muITczvJBDGD9x01bEZny2u+XqX
 yE1mE/9kWQxV96pKgAcO0U19A9y5OiPB9Zj0N7npG+xvE/yHVqTUPhKr0acIG0hWZ5yM
 9d8A3W6pa67+gGRznN63t2YO0OCpx333DGWAjMiq3Ucj2Nbd9bmksnDRa7rK2cNZqxHJ
 8zi/EWsp21+f0KGukfwep1pFZ7IhfVeTY+f+9S9U9WqNvTQata/1kZpC1BErnXC91344
 58uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785110; x=1769389910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5i79BDrxuHBezOHdjkerpF2EfskLPnOmytUYpUqDeYc=;
 b=NjuS0EuCCG2TJ/xsic1jo7wudMIXBtZ7ImQpj/0RwlYy6XkMjz3p1McAf3xnabbbxn
 TV0NlnFcdt9SIz0TmlkC+V7uw4zu0jjjpKTnr+oh06OmAmc8yS12Ton/KO7IZNPZHqXO
 7o1PHRhTamdlK16LrG8pbPZn2SodGvRnQ7rzBukoO+EivoGiefuDzkIUDZhrFIbM54Wx
 oZU+9AnYDIwCknee3UXmsZfFBunOqA/d8vcFv1/vHYi96YzwcoXqB1psx1kmBoPkqmFY
 uDB2KlGoU2bJm4rtQ2CD+3Ovo640rUuzvpkygPV2TsFU7Qbdwfp95I1KFxN/0WIU4R8f
 x6Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgUTIpnkvSEuF8ikc8TNP5eUYttVbhgtiFpeK6r+zFZOFe6/K5wqCTj64Y6I+VOn3H5KdvR2WGtOI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeiKDJUnT/JqRDaV14jDRYj5vADebYzwBb+X8ZAUpSUfRcothI
 yeOb4L+9CsFxVsoCGcfYcBVy6iQZjNX3XZevCzglGj1N3u0L+RMgO1zQ
X-Gm-Gg: AY/fxX5xrDPUDb6iQae+lHA50wowQgE6jljEVVHJDZYUCa7HvP89VJldrYgTZY4WfLs
 L50Ze+trZ6WU0rSSbIrRI+KcK+QKBeaPpY1ajMWJhPAloCMUNRmqii0AvDAJT9Y/Kib/UMkstB3
 oaAkKIU3lFP7FCT7sA1EMTXv8PmX/mf5s7wqoCKde0Xx2sjwjn0N2FXleEkYXoNeIUsZ6Q4ZjGt
 2fbKMdi4Tu7L+xzqCXuxuZ7g3UiRL7ODm7tmvJe20XwHRM5gXgWiAFbrG7CesI0hA7KaBqGRtz6
 1xBk234f5Ul5L1ZLZoO7ldTDGxoh6pVWe17nNkhMMhgV6nhgSYDEDmDnaiHuvRlhOPtBjYTw1v4
 OqaUEnpATJYiO5XG9VvGbZRyKszznt1kRH10/luwu6w/DNECRm6zLot3V3/DNZ1h+S+Q2fIICfY
 mFjW0LiHJDTsVpAmGk8NaLwbaQjuDWv3laMpSgLurzDtFM++0xeh/AYBkaXPrru/VD
X-Received: by 2002:a05:6402:270d:b0:649:9c37:5d5f with SMTP id
 4fb4d7f45d1cf-65452bccb59mr4148768a12.5.1768785109659; 
 Sun, 18 Jan 2026 17:11:49 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:11:49 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 01/17] drm/amd/display: Return if DisplayID not found in
 parse_amd_vsdb()
Date: Mon, 19 Jan 2026 02:11:30 +0100
Message-ID: <20260119011146.62302-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
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

[Why]
The function would continue to try to parse EDID even if DisplayID
extension block wasn't found. Sometimes it got lucky and found AMD vsdb
in CEA extension block which made debugging harder.

[How]
Add a return if DisplayID extension block wasn't found

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 655c9fcb078a..a0d23853b8fc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13113,6 +13113,9 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 			break;
 	}
 
+	if (i == edid->extensions)
+		return false;
+
 	while (j < EDID_LENGTH - sizeof(struct amd_vsdb_block)) {
 		struct amd_vsdb_block *amd_vsdb = (struct amd_vsdb_block *)&edid_ext[j];
 		unsigned int ieeeId = (amd_vsdb->ieee_id[2] << 16) | (amd_vsdb->ieee_id[1] << 8) | (amd_vsdb->ieee_id[0]);
-- 
2.52.0

