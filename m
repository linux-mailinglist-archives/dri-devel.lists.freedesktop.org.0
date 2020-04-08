Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A611A280A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 19:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C515F6E1B5;
	Wed,  8 Apr 2020 17:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9276E15F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 17:38:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 65so8874769wrl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 10:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPVNiBrLdpQMmdH8MPTLAEOg9N9bPZJ7wNOFFKh1d6c=;
 b=YX8asMP1oDJsqRPHJWn1S+YLcQdSK6UntH5QypA1DXRge1zpk+QsvrSpnDhVzq7BhQ
 YKUNhOTgPEeM9LsuoJmugXf/NRyVUOJgB9xtxX+f+i3SKpqkEdAOt7Q0jYcCY0QeFec9
 4zm+BJe199H7U+Iqc0v6WWJVQ7yDuRKFhva1Qe9fah8U/9FxoH2oxssLDKstegpyowx5
 +7rtmJ4evH5u2CKtR4Bn8E2uCQytq7xFJrrxUzd0+cK+tGOW2asa7Xs3sydaqPtEw6hr
 ftjWrrqHjB/NXLfvJYZMS5GoVKlMUvsGcEef+D25i6MJ5XoSjxtNijs9gS3FBMe+V5vF
 qxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPVNiBrLdpQMmdH8MPTLAEOg9N9bPZJ7wNOFFKh1d6c=;
 b=I50gFBLqw0DPw3wrsNXwAUNZQcT+e+aynNyzRRLHA6clf5b9o6YDkLGK65ttqtDJKQ
 tvblFrNqr/iJCH4m/hXCIOuG8WJgBZMjrXwZldiOz7LU3k0S88CS23cNUe6DdVAx2l6+
 NfHIHMb5DibvEU+fxx30GhgEkwMlrn8/zlOoXo5U/JqTx+Lz2u4hoTQxWOO3Gd5wtpj2
 B1jDnwP84w2HPsEuGTI5JS4/Id77rb1lwz3iIM9wVHMuCzCawx0M/2fgDxQoMqecAgRb
 PdKGg+oMmpjqFsS25mApfRwpBLhMrNag8bJOFDGBbXYa2LNREb5kZvcCTInXTH2r5MKX
 qJgw==
X-Gm-Message-State: AGi0Pua7rRW8C/mYPjgYkLBz3BAcwCc2nHh3HgzRAyMJOjw/K20ZOZ/j
 RIuHARjGY5cN5EdT3MXvlHY=
X-Google-Smtp-Source: APiQypLjxw1Sa++cAHGJZ0DQMG/4nBA7V17Byp+Qr+sVDRxKW6AIXT/hyr+XAW1MK+9t1QIQVflEOQ==
X-Received: by 2002:a5d:5187:: with SMTP id k7mr1398760wrv.217.1586367488114; 
 Wed, 08 Apr 2020 10:38:08 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
 by smtp.gmail.com with ESMTPSA id s9sm609036wmc.2.2020.04.08.10.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 10:38:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpu: host1x: Detach driver on unregister
Date: Wed,  8 Apr 2020 19:38:02 +0200
Message-Id: <20200408173802.3077833-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
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
Cc: linux-tegra@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Currently when a host1x device driver is unregistered, it is not
detached from the host1x controller, which means that the device
will stay around and when the driver is registered again, it may
bind to the old, stale device rather than the new one that was
created from scratch upon driver registration. This in turn can
cause various weird crashes within the driver core because it is
confronted with a device that was already deleted.

Fix this by detaching the driver from the host1x controller when
it is unregistered. This ensures that the deleted device also is
no longer present in the device list that drivers will bind to.

Reported-by: Sowjanya Komatineni <skomatineni@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 6a995db51d6d..e201f62d62c0 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -686,8 +686,17 @@ EXPORT_SYMBOL(host1x_driver_register_full);
  */
 void host1x_driver_unregister(struct host1x_driver *driver)
 {
+	struct host1x *host1x;
+
 	driver_unregister(&driver->driver);
 
+	mutex_lock(&devices_lock);
+
+	list_for_each_entry(host1x, &devices, list)
+		host1x_detach_driver(host1x, driver);
+
+	mutex_unlock(&devices_lock);
+
 	mutex_lock(&drivers_lock);
 	list_del_init(&driver->list);
 	mutex_unlock(&drivers_lock);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
