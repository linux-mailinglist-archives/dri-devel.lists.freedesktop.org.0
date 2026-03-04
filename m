Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJYNAko4qGkTqgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:48:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9214200AE8
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14E910EA0D;
	Wed,  4 Mar 2026 13:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kgQ0CMYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4D610E9EC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:48:50 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so57578495e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 05:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772632129; x=1773236929; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=55t9FSDZQXeG7n+Yd3TCO52OZ2a8PizaEtr6ezSNM90=;
 b=kgQ0CMYHR9b7KYss/c1OdHkRujIkg6kF7e1c6Pmz46ZK4MfJpGBYzb+RjMrZTgbpwQ
 RAHi2IBr1rVtQKQew7/5hqCjIIeqq/dyow9nTcaWLJ9x4hI6K6fFuqXziTmBpX/djOSp
 ZvOWUg4i1PhnW6Xg0/hrtBcJeGk0xwm1qAjCUGzNB6EUsQf6EocO8WpQ1XuHTjjFJR7l
 5eGXRwPTAA7F4M1/5fbgkI8owifAT/dl3DxIAYziKvtmZJ4ckI8yFnCUhqe7N5W2uvEJ
 V+y1C7hQ99skQ9C+mh8MX+McPUrXKpJgljAO9e+laEBLopQEr3+0FLshjPMfZ92r40M6
 fu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772632129; x=1773236929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=55t9FSDZQXeG7n+Yd3TCO52OZ2a8PizaEtr6ezSNM90=;
 b=Fk4rVp9Hnqy4WFG29SkIeHSuTy7mQVW6589jerFLyOCKTAfKFAJNX1XlLtGQcuYQ+c
 LlDDFjCx/sq8BePt3NTJF8bKjkC124So8WwlgIF61IlRfEjwePsCqvGIg+WzJ3vtMP3B
 nTFAG0/+eI31BD3GGBGVPrAeHKTBSWisO4YBZJiA0rA2GRu2jDsTFXXqhTVwyH+zWfck
 NBOd/RdeAWF7WFrVsxydqf/tRk16sb6Y0HQx+CQq95blr/I0lSfSOipYs0IIvCIfZhNu
 ZlDXE4cjtGgxRh9XOMnlbPL4tgLs/EHhptNR4nW6gb6A8ejDNIFKwSuUs/r0y4poPJvO
 d6ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYyz3mlowbvNbmRgZOjIXqljiiRWCTPSXiJCyEUlDtBydS67PJ3hYmUaeqipyPDbbHQOCwll8Dzqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRm+ZplijtuVIrDIpPGoocvFoIJpBF5f+irqKkTERfjfFUyXia
 fm9DANKn9iuROQQXvvFfDHWM0tSgtbCu/xybpeiHWvVI1Wcv3i8isASA
X-Gm-Gg: ATEYQzyfyJWAoPodsCwYWfkYO9WeYlApgQga1/T2x9pLU8m0chG93gWIoBTWNQivuNJ
 +06gQWHhTGSxFA2UXr8MBXZ+HeSjWHPAOnciKmRgGB8YExxCs/Z9TIX6SSuzKTKroiz8ha6VM55
 Q/MFwHGWvWQYNohLXOzCuU7oGeqPnzFZbBj38EIC6bDhZuGQINMNfhUg5eRTx/zrlEdFaNhrnAP
 XUPHmdGZ4R/hUEYi9vsc3jSUm97Ok+N4uis5zTqsd//aAQerfmZFJtukNfKMTiMGBlYER+aAjAH
 d2vwNDxQThAP30YGNIYTzmIQT6UInWp5IEsGjcUiz3sTyAtDdWyHC9BjpkSo+PQ8AU5D1q86ldU
 5krsE5k4+i+79kqqwkWJEZh0B6pa2cLFcSi1i3eACIHq6xfPnM9oh+UunrgWkN1670JtHs4pJXq
 vLLjyaqVoIS8Wo0rR7WK0Q/CkuPXiEO38=
X-Received: by 2002:a05:600c:1383:b0:47e:e48f:43b5 with SMTP id
 5b1f17b1804b1-48513eae55dmr110310985e9.18.1772632128767; 
 Wed, 04 Mar 2026 05:48:48 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c65e0b23sm7105229f8f.32.2026.03.04.05.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 05:48:48 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/4] drm/panfrost: Drop redundant optional clock checks in
 runtime PM
Date: Wed,  4 Mar 2026 13:48:37 +0000
Message-ID: <20260304134845.267030-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
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
X-Rspamd-Queue-Id: A9214200AE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:robh@kernel.org,m:steven.price@arm.com,m:adrian.larumbe@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[collabora.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,lists.freedesktop.org,vger.kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The clk_enable() and clk_disable() APIs already handle NULL clock pointers
gracefully — clk_enable() returns 0 and clk_disable() returns immediately
when passed a NULL or optional clock. The explicit if (pfdev->bus_clock)
guards around these calls in the runtime suspend/resume paths are
therefore unnecessary. Remove them to simplify the code.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index dedc13e56631..01e702a0b2f0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -429,11 +429,9 @@ static int panfrost_device_runtime_resume(struct device *dev)
 		if (ret)
 			goto err_clk;
 
-		if (pfdev->bus_clock) {
-			ret = clk_enable(pfdev->bus_clock);
-			if (ret)
-				goto err_bus_clk;
-		}
+		ret = clk_enable(pfdev->bus_clock);
+		if (ret)
+			goto err_bus_clk;
 	}
 
 	panfrost_device_reset(pfdev, true);
@@ -464,9 +462,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 	panfrost_gpu_power_off(pfdev);
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
-		if (pfdev->bus_clock)
-			clk_disable(pfdev->bus_clock);
-
+		clk_disable(pfdev->bus_clock);
 		clk_disable(pfdev->clock);
 		reset_control_assert(pfdev->rstc);
 	}
-- 
2.43.0

