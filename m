Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571F4995945
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 23:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7487910E5DD;
	Tue,  8 Oct 2024 21:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="tV1tMXYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F5F10E5BE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 20:55:06 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-20b9b35c7c7so43673185ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 13:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=everestkc.com.np; s=everest; t=1728420906; x=1729025706;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0tFkED+mY089YHzAtW+B1O+++Bw0Z0pfmZQ8b1ZguYk=;
 b=tV1tMXYnmFaJB4EbvwVZdBUkMld7Y5n8y7YlrWWai8RdSUzv2Pty7nncsNGuYw+mxm
 qAQtu7YT/TM8vBlLUk0i2JUbIBqLmKkXoGzdY8oHnpCbYmhU3QzsCmAxOiaz7ptavaRL
 wGmKIdpMnVX5UuzkWcBTayA+Ty9z2twbTZB9ZbFHUTSmQRaAToUHX3ZllhwwdPzuukeo
 wN5lY3VLG0lINiI/m+bj3hHLakClcFpbrbqDVEKwA8j4Ans0kmo/U4dMD/53RRPEiAqY
 KHIGuOULnQSGIgyf9evxYgGhYsS8bcMutjSdoODOKcRT0cOpVtDv+rQLG/UtQlCqtE56
 l+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728420906; x=1729025706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0tFkED+mY089YHzAtW+B1O+++Bw0Z0pfmZQ8b1ZguYk=;
 b=BSTiclw/W3nD3NxmWRsk9/BuiY/Y2GxIW65u7HFt8YfxlAXmnee85NUuuiHdWEcwQK
 axoOuPpAzYAHALktl0ZrUlSfg7slBEUHfgN/zlwQBFazk43UiGVu366OrdSPiCLde5bO
 9QMO509x4xS0zVGl6U6QMz1hYaa+5DYo5srkeIxMv0zLPaIMjp1tidtw35w4TECgliDT
 aA1XoIjAmzt7X+BQlKUdO5adUqV1hDa+vUJ3hXbcvOfSCfMG/a88tDgN7IgRWMblMmgZ
 seQuW4zmt/UxIhM65amWZzFVaS7r98Jp4KR5DSHeglSCsXNGzjkoywo8LkjltdHf5/e5
 E1Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8sqEbfektDPg63RRluS+WWvhDHX8mrZ4y+0eB/FqrqRGAo9UZamvxAKprzfR7SRN3c+U3pCVRIQ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybh9riFFB1jI7+KNxH2BQt8i3+nySL1Q8PwvADIN1hzJvvzDwS
 jFMFor9hF2ia1r4RhxeWObf0BL44fazLrXeMCyHhDdq3VXtTfqXp+GgTPNn3S/s=
X-Google-Smtp-Source: AGHT+IG5QtndTuvxUc4EQsIUMZuzUEKCOMQYR+xtaqDBDhzPRGHOGMjKNeFwj/pDDHDOMAis6O/BGw==
X-Received: by 2002:a17:902:c411:b0:20b:9f8c:e9de with SMTP id
 d9443c01a7336-20c6376dfefmr4938325ad.13.1728420906131; 
 Tue, 08 Oct 2024 13:55:06 -0700 (PDT)
Received: from localhost.localdomain ([132.178.207.21])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20c13986787sm59611735ad.242.2024.10.08.13.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 13:55:05 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: "Everest K.C." <everestkc@everestkc.com.np>, skhan@linuxfoundation.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe/guc: Fix deference after check
Date: Tue,  8 Oct 2024 14:53:48 -0600
Message-ID: <20241008205352.4480-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Oct 2024 21:29:04 +0000
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

The `if (!snapshot->copy)` evaluates to True only when `snapshot->copy`
is Null. Thus, derefrencing `snapshot->copy` inside this if block is
equivalent to Null pointer derefrencing.
The `if` condition is now changed to evaluate to true only when
`snapshot->copy` is not Null.
This issue was reported by Coverity Scan.

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 7fbc56cceaba..4e1a5e8ba1e3 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -122,7 +122,7 @@ void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot)
 	if (!snapshot)
 		return;
 
-	if (!snapshot->copy) {
+	if (snapshot->copy) {
 		for (i = 0; i < snapshot->num_chunks; i++)
 			kfree(snapshot->copy[i]);
 		kfree(snapshot->copy);
-- 
2.43.0

