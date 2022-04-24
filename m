Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FC850D42E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 20:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F06810EF08;
	Sun, 24 Apr 2022 18:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F1B10EF08
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 18:35:15 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j15so4712291wrb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 11:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=349XFvM6t5JIYAzx/9jOMxcyDaGjEC8LJK6aTpUuIMg=;
 b=RximP2STPGTwfaqjRxZ9EaaaNjMB9VPGv+TMWWc1/rmkTluj14SIJeUnLigW7BRhQr
 rQ14jBCh4dcxCWQ6LqpUPREv+cZcMEaAXPK/hUnSQsZc80brfS7dEmf3YifOui/TYODB
 g3Hp0CvlGf8WOeRe74ibnhSu3ltQ/0c3Wg0/hbHCpRX/4rDdnef3b585uAUWHRatJGN1
 aGnQaOJb6XxO+nhaKYETvz3XXDtWmzu/vLfeXFI2IzhiPKLEYmiF88e+UQAKqpfNQzjT
 iFWKUcRFQDyjOLxJUo8HOz1XDUQxohHfqWj9KxVDr1CXx+JkFKtIXIZehGa9r/w3DtBk
 N4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=349XFvM6t5JIYAzx/9jOMxcyDaGjEC8LJK6aTpUuIMg=;
 b=fhp1quGonrbWAe6kb3+NJerPGPMJNNAFKJOmyHhHUKTWx2575Xf+i46N7TUwJYgmpb
 zTETNlS58R9hFuRwAxT2I7dK6TyuCyu8olAm9OUZvJOpx7oeTJvOjpETjUdFZxICOXXD
 tQmVrq7+Ukkg+53FWHWkaNt9r2Q5R5coNGCxCHxGM9Tk5p/2vGsMaibs62v75CY6VgYa
 0oYqjQ0+4wvRF7PAvrcB6SYdXz8d7HSkiaixUC8mtdm0lh7R5A1OEPn+fyd6JBHrIroG
 HAtPtOWajYj8kvqjXwX2ckB4d8u34w7nIKwK2vm4WXThms5HOpiFk08ilCKIbGJUxLKj
 H0Sw==
X-Gm-Message-State: AOAM5310WXjuc3mSk4Fv3ckF+4CYxhYDsYvufcc1pbkZ1rGMnu2WBDzs
 njqAFU2U9ySPYHfF6ORFenc=
X-Google-Smtp-Source: ABdhPJxhKw8Ct/ffWL61Xq54wzGLON3haioc9TF0zqvEjFjtlU0qST5fxv3vVDHYSfiWPgNc6TwUCA==
X-Received: by 2002:a05:6000:1789:b0:20a:9f94:1620 with SMTP id
 e9-20020a056000178900b0020a9f941620mr11858147wrg.640.1650825314073; 
 Sun, 24 Apr 2022 11:35:14 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 d2-20020a056000186200b0020a7be3f1d2sm8442792wri.53.2022.04.24.11.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 11:35:13 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Melissa Wen <mwen@igalia.com>,
 "Juan A . Suarez Romero" <jasuarez@igalia.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/v3d: Fix null pointer dereference of pointer perfmon
Date: Sun, 24 Apr 2022 19:35:12 +0100
Message-Id: <20220424183512.1365683-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the unlikely event that pointer perfmon is null the WARN_ON return path
occurs after the pointer has already been deferenced. Fix this by only
dereferencing perfmon after it has been null checked.

Fixes: 26a4dc29b74a ("drm/v3d: Expose performance counters to userspace")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/v3d/v3d_perfmon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index 0288ef063513..f6a88abccc7d 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -25,11 +25,12 @@ void v3d_perfmon_start(struct v3d_dev *v3d, struct v3d_perfmon *perfmon)
 {
 	unsigned int i;
 	u32 mask;
-	u8 ncounters = perfmon->ncounters;
+	u8 ncounters;
 
 	if (WARN_ON_ONCE(!perfmon || v3d->active_perfmon))
 		return;
 
+	ncounters = perfmon->ncounters;
 	mask = GENMASK(ncounters - 1, 0);
 
 	for (i = 0; i < ncounters; i++) {
-- 
2.35.1

