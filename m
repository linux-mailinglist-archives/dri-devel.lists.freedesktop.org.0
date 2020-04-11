Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A41A537A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 21:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580916E0D2;
	Sat, 11 Apr 2020 19:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ACE6E0D2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 19:03:00 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id t10so4898717iln.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 12:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=geygEetnxFUbF7qcnow6BWFQrHKQpMqo/AimQRIb2J8=;
 b=owX5RmHWoLMAOlS0chOL9zLwquEDbLi5abb4351ycfJCC13LsOIMlJuH0N2iamMmg+
 Thy/jUp9BRuG03nMWO8O/Fcrlz/6AvEQiaE5+yV4vA2hIvHsj8d9gNUNRhgh0UsItOYo
 c6QrLDxK+OuujGZdxaWnLOCCyvbh+Y/k+xOnnWIMcsmIHy5UBBeyZyN4NlmQsgdsmm57
 Gq+xxcbFpeLfpLD5Z0mEXsbXacDKPZxzy4S2OU5GD39LsOL0aRXTZWKxgVlbODwLLRfH
 DjGxgcLtdnjkTETCtyOzfYLS9nFLs4Mqojhwif4A1UMAfQWZj8fwrSUK76CAf5Qnitdg
 23rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=geygEetnxFUbF7qcnow6BWFQrHKQpMqo/AimQRIb2J8=;
 b=BVQLzWwL7oQbeNt7r/usfYkH+NEbdX+u96RHzqkXKMiF1m4xAXKKStzcbCKb6/+DMG
 tLV/gllcKxNBa9+Uy36e+TMdr47QL9h2bMvULGFOafGX9OK+P0GEzFOTvS6yeZFB4Ogs
 VMOoCBsJwDnXRTgnNnT2HcQ0kivvm/v8giABdwcjI33WEGfT/DcDRcZP09d6LW1Qncn/
 BUnMaJxAaf7zxOCM6jdeTVdUW+sgmdZjqCCyZgw/connVpzy8tJvQRKxcM3V8gVeg+ef
 jHxr9IRlAiYzQkDW0qdX7iWsEblpUaRWqxBf/Psh+BS7Mv26QDVhMQ1I5gXPpRV8r3Mr
 NliQ==
X-Gm-Message-State: AGi0PuY6D07Rz1wt6RLP07wYefVKlwqQB9SAvYlTLxuezQnlGA5psViz
 eQH/f5+LzHM3ywRLuTx+Be+xGj9G
X-Google-Smtp-Source: APiQypKhOkOaKU7yvl4bRHK+wGd8oLUZN00ujbv8m7RB6wstiOfYYw3Imh0iaB6PBH4j59Vb2vD77g==
X-Received: by 2002:a92:834b:: with SMTP id f72mr10268736ild.128.1586631779441; 
 Sat, 11 Apr 2020 12:02:59 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-253.hlrn.qwest.net.
 [97.118.146.253])
 by smtp.gmail.com with ESMTPSA id v17sm2068309ill.5.2020.04.11.12.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2020 12:02:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] component: Silence bind error on -EPROBE_DEFER
Date: Sat, 11 Apr 2020 13:02:41 -0600
Message-Id: <20200411190241.89404-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Hilliard <james.hilliard1@gmail.com>, linux-kernel@vger.kernel.org,
 "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a component fails to bind due to -EPROBE_DEFER we should not log an
error as this is not a real failure.

Fixes:
vc4-drm soc:gpu: failed to bind 3f902000.hdmi (ops vc4_hdmi_ops): -517
vc4-drm soc:gpu: master bind failed: -517

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - remove braces
---
 drivers/base/component.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index e97704104784..dcfbe7251dc4 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -256,7 +256,8 @@ static int try_to_bring_up_master(struct master *master,
 	ret = master->ops->bind(master->dev);
 	if (ret < 0) {
 		devres_release_group(master->dev, NULL);
-		dev_info(master->dev, "master bind failed: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_info(master->dev, "master bind failed: %d\n", ret);
 		return ret;
 	}
 
@@ -611,8 +612,9 @@ static int component_bind(struct component *component, struct master *master,
 		devres_release_group(component->dev, NULL);
 		devres_release_group(master->dev, NULL);
 
-		dev_err(master->dev, "failed to bind %s (ops %ps): %d\n",
-			dev_name(component->dev), component->ops, ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(master->dev, "failed to bind %s (ops %ps): %d\n",
+				dev_name(component->dev), component->ops, ret);
 	}
 
 	return ret;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
