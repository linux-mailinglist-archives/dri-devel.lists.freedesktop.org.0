Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191B892DA82
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 23:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B45A10E905;
	Wed, 10 Jul 2024 21:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="u8Wgk011";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A550F10E905
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 21:01:57 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ee90dc1dc1so1746621fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 14:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1720645316; x=1721250116;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vfPD6oQM4WTY/ZUL1ljka0zg8gHP6mHHiU2gRkoeXcY=;
 b=u8Wgk011oy/DeNoSqzHZ09ofjO9GFlDMxL5GY6T88WTLDxcsACCfKXxhe4R4bVUdFP
 jMXRHgD3USHNdctDdaRQ71242voQW+R/NAHya1fdn3r31ggxBz/ftlMM+tNPGfsWdBEW
 RP01YUH3KVZBuerHI0n5h9iSUNSRvPdlqlU8IF7DfqWNBXtGxNicqxBR6wvMdwuCMLU0
 kRbFpLpbYJi60HKsk5PTjx7ZOrvG9Mg/e3J/D5t2livNtIEB0zjnF3Ey7O+jP4BVP4KE
 bJMaj5wYcgYMK8GK50i/ndxrK1Eiv/CugNPWhuFO/xU8MnCR9CbSWWUbJ7NjO5tyg0y2
 5ujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720645316; x=1721250116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vfPD6oQM4WTY/ZUL1ljka0zg8gHP6mHHiU2gRkoeXcY=;
 b=sYReZcIDnaVdkYS3qC7xIA8xdLTZzcil4U+lhJ3/eTFLAd5gyvP2dU5n3i/53jXOFL
 rQvGDiO4V9PudY4Te5WD2+k0dzmuIj5TgWsroGMUqWpHNhClNfbJY0jV5W2zc9suJMMo
 Rnt18AmgjjEttbvdLxrsKQCAy+Q5DPVSKZjLKmB373s6OQc3GDAVPUtT2GHC7vb7+YKP
 W3SlfvbICdGnM077kWKCqx6+fVexXhTpONBTvqcw4+rUCCbMSH8Nxe/KDzv28zWEAgba
 MV/pGAe+CsblIlTOpDoyKLrdtvm27uzH/6iOLyHPIhJwecccpN0HXJpb4nVExwucR5/9
 laKQ==
X-Gm-Message-State: AOJu0Ywx/kRL818uPzd+uRLDh2J5a5KIHP2ZjMngPbfBYRboD/Nhyrs/
 FvV5XI4zzViT6kqkPg4rkX1f8Cg99NLzT2CV7rsvaw39QK7RD46lL8wxOTe5aF0=
X-Google-Smtp-Source: AGHT+IGvQA+P7LFh+KIoLHnBwWndid7fZ5r4y7e3S09VhX9Fpm8r0gitrY3HYtpl80Rj2AdHvdq33Q==
X-Received: by 2002:a2e:8081:0:b0:2ee:4e67:85ec with SMTP id
 38308e7fff4ca-2eeb30bc9d4mr43078141fa.5.1720645315622; 
 Wed, 10 Jul 2024 14:01:55 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-26.dynamic.mnet-online.de.
 [82.135.80.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6f5a27sm92480685e9.23.2024.07.10.14.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 14:01:55 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 daniel@ffwll.ch, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] drm/tegra: hub: Use fn parameter directly to fix Coccinelle
 warning
Date: Wed, 10 Jul 2024 23:00:35 +0200
Message-ID: <20240710210034.796032-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
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

The function parameter out can be used directly instead of assigning it
to a temporary u64 variable first.

Remove the local variable tmp2 and use the parameter out directly as the
divisor in do_div() to remove the following Coccinelle/coccicheck
warning reported by do_div.cocci:

  WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/gpu/drm/tegra/hub.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index f21e57e8599e..e0c2019a591b 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -521,12 +521,11 @@ static void tegra_shared_plane_atomic_disable(struct drm_plane *plane,
 
 static inline u32 compute_phase_incr(fixed20_12 in, unsigned int out)
 {
-	u64 tmp, tmp1, tmp2;
+	u64 tmp, tmp1;
 
 	tmp = (u64)dfixed_trunc(in);
-	tmp2 = (u64)out;
-	tmp1 = (tmp << NFB) + (tmp2 >> 1);
-	do_div(tmp1, tmp2);
+	tmp1 = (tmp << NFB) + ((u64)out >> 1);
+	do_div(tmp1, out);
 
 	return lower_32_bits(tmp1);
 }
-- 
2.45.2

