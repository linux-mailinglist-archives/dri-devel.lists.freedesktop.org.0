Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE26DADB121
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 15:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26A910E38A;
	Mon, 16 Jun 2025 13:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q8knF8yq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B180010E386;
 Mon, 16 Jun 2025 13:07:29 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ad572ba1347so706793066b.1; 
 Mon, 16 Jun 2025 06:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750079248; x=1750684048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=TyO4veQSuBiVwPvwSV+VielD/6bZG5huwF6JmWtE6Qw=;
 b=Q8knF8yqg+fK5XLM2ZEK9zw5xzHuJ6F0Qzg+rtxKmrcuKa04mXOT0FFZ5AmJ+tcXP/
 GoUxOMmbv+bDqi5huPrfh5dMFgdBC2xuwo0mV2r+OPe5FG2fQGuF0ML/4/6pvgci9Oh9
 UGSPWZT0ZpLbw+6rTxhcLEpaiPsRguXZdc85tylsjOLgdR2Pfj7bNCL0o0ylp+nwrZMv
 p3Qc5FkgtmaMfr4rdGNGHl/1UDPCiSpnxyO+C9ebvpL/wBWtfJx2Ff8W+oQ6x5YcrAfP
 kAHsLvHwaMWlBoFRP9Ji9OEIDG/TOk9uOPUpes0jAHibNvUgB8LypjzE8NolWtK0FD/t
 BmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750079248; x=1750684048;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TyO4veQSuBiVwPvwSV+VielD/6bZG5huwF6JmWtE6Qw=;
 b=oEre41MeZS/wn4xJ9Ao9ItbDtuUtXbx885jjw0JB21lC4dKwsJ5qwfW3DMpeLBy+RG
 cqgWGe4lkUGGVAYyGQ9y0PNrZ3UznZ7BIey7sL/LPcKyKaXmDyIGLuoPzmwWlNxEYpQG
 bfcJ20sBZFBzApuTVFKrG7T8kbr/8UNFP1KgsbYL9PQ0UeCUV9miTazLAdk3PrhcFWoz
 MlqXznEp9yB9aKUf/CMY3YDFPIUOFpSvour18bVvYyWUbAM6RZaEy8YxCyp8Lyq/COxo
 floiikiojFoKDu29UH81aSFrhf+4q/1wvHdhzn7j9omuoBA8p0S0Ff1BSwuWynmbq8Am
 ieHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9XQgT6QtlaxQr93nDPBV9WOA+QNzNWnuJkxltOaoYtPU73MxEOcmhfzA06Jd4vMAnbQvvqieeQmo=@lists.freedesktop.org,
 AJvYcCXzbVpVtth93qozq8Lwl3toE07TABCxrmMPWkPUcDMnPWvj5Q2E/KQ9pgMA0bjpfnHXlm0NN6lEmbg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL6g7C8DKxyk/HqW5iPjcE6wPINSWACuG0VmqiXoBFbPQiQYkL
 j3h8zZr2JYpws+5FBQ03tI7caG3VBW3pIxj9nEAslFo6jUDZ4l4mFu3p
X-Gm-Gg: ASbGnctiDq6aHMaG/AJJITJWKso7n0baG6qT0BGb86T4hHud/uS0n/SXeAaYf5ZngLI
 QxlM3oa5hJ8CjMliZcdzK6gT3qri+47l0ePz+IZaK3WBLzJs8YbggWl6L7x7tPxDiepfulz7V7d
 jRKAm9AcNYDmwRUPZd54bMbfTNTijHLpepX1CITkkCSEPlBnskW5kJMBIRx54busWBZEDU6QWOs
 cDMf71sjFdbuBVJDfGinxNiUYIE4DIz8y+9REmy2aJw/L8FsK95oi+yF0aBvNiitQX0Sjl3lCaw
 9YsRwcXkyHu4S3yTsukFxI4f8d/unKD2zcTnYTR6Lz2KSSWXHFiDaXzdBUQAW8Ew+m4ZMqCQJSJ
 Mw7iXWM2Suu0=
X-Google-Smtp-Source: AGHT+IFtBpQHzXZFsTExfq6Kcyxk6ifSJYrv+/KwVTK+EbbD+VDhdHiJeeDHXo6kCfCFefjxsnEqMw==
X-Received: by 2002:a17:907:3c82:b0:ad8:9b24:9d16 with SMTP id
 a640c23a62f3a-adfad2b761fmr850846866b.6.1750079247872; 
 Mon, 16 Jun 2025 06:07:27 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1535:2600:63e1:a803:ebae:a9dd])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adf93630a33sm520717766b.29.2025.06.16.06.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 06:07:27 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 matthew.auld@intel.com
Subject: [PATCH 1/6] drm/vmwgfx: drop printing the TTM refcount for debugging
Date: Mon, 16 Jun 2025 15:07:21 +0200
Message-Id: <20250616130726.22863-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

That is something TTM internal which is about to get dropped.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index c55382167c1b..7057d852951b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -284,11 +284,10 @@ static void vmw_bo_print_info(int id, struct vmw_bo *bo, struct seq_file *m)
 
 	seq_printf(m, "\t\t0x%08x: %12zu bytes %s, type = %s",
 		   id, bo->tbo.base.size, placement, type);
-	seq_printf(m, ", priority = %u, pin_count = %u, GEM refs = %d, TTM refs = %d",
+	seq_printf(m, ", priority = %u, pin_count = %u, GEM refs = %d",
 		   bo->tbo.priority,
 		   bo->tbo.pin_count,
-		   kref_read(&bo->tbo.base.refcount),
-		   kref_read(&bo->tbo.kref));
+		   kref_read(&bo->tbo.base.refcount));
 	seq_puts(m, "\n");
 }
 
-- 
2.34.1

