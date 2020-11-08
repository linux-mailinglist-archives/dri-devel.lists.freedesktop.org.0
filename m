Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE1A2AAE14
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2793F89811;
	Sun,  8 Nov 2020 22:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1458089728;
 Sun,  8 Nov 2020 22:37:45 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s30so9713435lfc.4;
 Sun, 08 Nov 2020 14:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kCfJ2Jg/FRbU0HYZuU5nyJHXfw9uLTxJyOfF7KFa57E=;
 b=MvhNV0Y5I33YbxT2Ln2NrfmREwh8lPFZ+3xU2EFtr2CAsZKR+wM35afUYsQBmrKDQk
 LYt8VUWG/y9jOYIUakzX7JTDIaX0ID95B4xc+8Ye9cJHF/5lJPlPg8B9LCCYP/OCfpw4
 OXeIBOX8so5xs5BNF5WC1D6ZOdQcB/uhGrxHX3YXOXQMd0q4POzkdj6MeckEc2C8s9Lt
 ABnP2NIYf/9rKSSc9j/z8TcKsy0VtvKkG7w11jm0L5QYWQH/Y1VmRsNGpHGPbs+jQkoG
 SyioOkj3E9EykvgsnwUDawY0P7JWEqRneiWIVhpVMAFYyJjq3FsGWSMCt664MsVeFgMV
 b7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kCfJ2Jg/FRbU0HYZuU5nyJHXfw9uLTxJyOfF7KFa57E=;
 b=aNBPM2FdrpsfouBf4BPnoC+fS+QCfBwX/ZrULYiAcA8KD0NO2SqBldxMOo2oGnz2vz
 UXtLL18fWTs4QVYG4LEpptMLOzeJGF9aqN8M49fUjZnYAVdWnptPX3JDYoYBFSaINLT5
 tbyqw1Ov0ZxJBxwTrXWoEUHSEOMK1iSsqD3NPgbdzz9CGAMl2j8yizEfbV6G/co0FdVz
 IpSfso4ZX8EppJooGwKWtRhgUTv+I4k0cJ74LW7EHOBKUdsSS6ts+giW16xf28dCXhrV
 tO+z+SZwVdkhzZV2coFBZnhgvpWFacyQZrKHkrDYykLCQ6+Zw9KAJWZmFQYmiU024bmC
 HrOg==
X-Gm-Message-State: AOAM530wAG5sasvlwKWy7AsGfMCxXQcdC5Z8XBoWbBsiZZKK+JUPfTHV
 BwfAGAjKKQZkeH4All065uI=
X-Google-Smtp-Source: ABdhPJzuO6s0AWBQsGZ7IxbiJF3RrVQVDq0L03EJ0cQaiYYgIRSJQ5uljgZfXN2ou61c+TYUsgGFmQ==
X-Received: by 2002:a19:4050:: with SMTP id n77mr4313723lfa.460.1604875063419; 
 Sun, 08 Nov 2020 14:37:43 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-112.NA.cust.bahnhof.se.
 [155.4.221.112])
 by smtp.gmail.com with ESMTPSA id b25sm1559932lff.48.2020.11.08.14.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 14:37:42 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/msm: dsi: Constify dsi_host_ops
Date: Sun,  8 Nov 2020 23:37:38 +0100
Message-Id: <20201108223738.16535-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only usage of dsi_host_ops is to assign its address to the ops field
in the mipi_dsi_host struct, which is a const pointer. Make it const to
allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 198db8d4cf3d..ab281cba0f08 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1657,7 +1657,7 @@ static ssize_t dsi_host_transfer(struct mipi_dsi_host *host,
 	return ret;
 }
 
-static struct mipi_dsi_host_ops dsi_host_ops = {
+static const struct mipi_dsi_host_ops dsi_host_ops = {
 	.attach = dsi_host_attach,
 	.detach = dsi_host_detach,
 	.transfer = dsi_host_transfer,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
