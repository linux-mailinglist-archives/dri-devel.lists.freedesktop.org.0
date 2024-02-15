Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE9C8570A8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 23:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9352310EA4A;
	Thu, 15 Feb 2024 22:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I9A9M0/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D71E10EA4A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 22:43:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4121aa78aa2so7938515e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 14:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708036983; x=1708641783; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PgvYXFeAtJ4eMTl/jZdy/AomuxUWsZvphnf9tLSxGTs=;
 b=I9A9M0/FlmgGGCLpu3XH2X3iUZ4lnsBQVDadW7cRUeJXPEr6ogj7JA22apRZ8ks3SB
 ZcEwsOGHcuN2XJo8e+n4CqodnYb+C131bFoSDvdwryUC5CbcJ5e4TwvOXspobD44r+49
 dNkvqyYtZ+69K4yT6kMoJOkzXLmmlWFLGXWOHJNFPgnWuR5Bz89mIlbsF2NBnmpD+4yR
 ZU0/ljEgvtk77UHl03ML+glGuN7pVlTk38jEGNGEzqH3xOtq28+u1Eri6I5duYjpS7Dg
 ZTod4fWRXBUHmov4drjbgd9F9I4Ybhm7wy4JB7GriPY0kiZaCRezqWzazN18ThSv0CF1
 z6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708036983; x=1708641783;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PgvYXFeAtJ4eMTl/jZdy/AomuxUWsZvphnf9tLSxGTs=;
 b=uQkrb45SwHfPmcDTFmSUTKoLbaVfCkfpswW3ght7LJou5zwPytoXOkde4Pj1U8ZoT9
 ZSyidA/e25jzKodCsu9vBZDtmmxs9N2jQX+dPps2sk3diIWapMdwGWmeAaV01w8Kngji
 sHc+ebxOocTDZIpodVK9VcVtxMOaQn9OzmRnDryyZ42Cs7E+s66/zm3SsuXKIfWE/gg2
 t4dsATFrXVeOjD43yJq+/6wJ1KqFFgZv5Fjh+vV/EHCPBZZ2J1pq4a72I5yLI2Zq7KIk
 28ca0bHLVyVptxHRuev93XVTYMxUt0vx5T/1TaYslIECFaicBVaZPPLNze4RmJonJVyr
 y+sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNcy+LwBzMxgx9LaEaYEgXYU6y5Gn64lu4OSCimix5CCwbCVO0whHkpjc4Kj0L4ZQoglWqzmaD5C46kyBvhk2Y6/AsZAlIJD9G8qp62kJ2
X-Gm-Message-State: AOJu0YxmZMtXzfqeCWP9BtwLwJ79jlbgoTw+2ReA4epUaQ9TI017M3Pa
 dlATPLgGtkCdJxXF5940a4ycW7i8UKkofv0Kz7eCG3IMMaABGdGV
X-Google-Smtp-Source: AGHT+IGcWuz3xcbAdY5/RWa5oBq7q97NdHSFkTnbKOefJLXg/93rMMe3WyK7u1MhDRLzQJEak9sv9Q==
X-Received: by 2002:a05:600c:3549:b0:411:ff38:aa13 with SMTP id
 i9-20020a05600c354900b00411ff38aa13mr2348576wmq.27.1708036982510; 
 Thu, 15 Feb 2024 14:43:02 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b004107686650esm445978wmq.36.2024.02.15.14.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 14:43:02 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] gpu: host1x: remove redundant assignment to variable
 space
Date: Thu, 15 Feb 2024 22:43:01 +0000
Message-Id: <20240215224301.2073845-1-colin.i.king@gmail.com>
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

The variable space is being initialized with a value that is never read,
it is being re-assigned later on. The initialization is redundant and
can be removed. Also merge two declaration lines together.

Cleans up clang scan build warning:
drivers/gpu/host1x/cdma.c:628:15: warning: Value stored to 'space'
during its initialization is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/host1x/cdma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index d1336e438f4f..407ed9b9cf64 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -625,8 +625,7 @@ void host1x_cdma_push_wide(struct host1x_cdma *cdma, u32 op1, u32 op2,
 	struct host1x_channel *channel = cdma_to_channel(cdma);
 	struct host1x *host1x = cdma_to_host1x(cdma);
 	struct push_buffer *pb = &cdma->push_buffer;
-	unsigned int space = cdma->slots_free;
-	unsigned int needed = 2, extra = 0;
+	unsigned int space, needed = 2, extra = 0;
 
 	if (host1x_debug_trace_cmdbuf)
 		trace_host1x_cdma_push_wide(dev_name(channel->dev), op1, op2,
-- 
2.39.2

