Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0421F7A44
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 17:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450DF6E987;
	Fri, 12 Jun 2020 15:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620A36E98B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 15:01:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r7so10095301wro.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cSz5jm+X6eXypAq1XruGKtWwjaThxOrkLQ3htBN5MCE=;
 b=PgKYyCjHuqoiMDTLslWjH718dqMqe88MMs+/jKNe5SpENS9DxCPwzd51F9e+RTlTpF
 qAG8bdjlMyox4mDk/tntiouTQseqhV/AYFqqtPLIhZp/KNQfjVohP69elnEdLQJWqdG/
 1c/TrGwFvnswUkR8nb9zgFQjpwFETczzyz6Bg0xM89yJSYiB2ztM2MY9bCjJE+csN76k
 QFnYmXcxhhve77j/CSWT/PMKti/rfAW5NMlxEApkvAaD/XnFwBgZLualyK86SA2D2UAR
 tvYG1vyQFrvGJtSxunrrvKYAhS2Z4cUQWlCiZAgoitCsatn0azV+YDVWoOKavuwvcoIx
 Ah+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cSz5jm+X6eXypAq1XruGKtWwjaThxOrkLQ3htBN5MCE=;
 b=J0n5mfqxulFsMlQACiK0jKbHjDqQii82tcD3eyzi8Ys2e6gp6KdoioaNUUVOo1/rtb
 6uxcNF7jKNOiW/AvPdBCa5rr/f6jDYxU00m49i2Vg9WksWnHJO71WnrEu835SSidUn0q
 nq3fcmihCQBvEovFRZC5C9KRO6QGSl6+ApuZrwgyv3JZYkkj3c/LVeWGnhifppNpX7Bs
 Gqx/9K1MOWNlDaiVaclBHBbHtnA0kxpQoak5CGbd45Z9lUYB6l/M/iUaD5G+Y4v80tyq
 HPAVIUBaV30P17+v14bqkebNG3AqGv40vXDZLhjnqKqPKPveQcqjLrivC3WyE/AptB1O
 e2gw==
X-Gm-Message-State: AOAM531U+aqYIU5Do7AaSvR+1Ix4/OoGmK/Bn9v2TihnzenYCqopKzHX
 mY19mdPFeKfv8UKbzMGXOaCoO1er
X-Google-Smtp-Source: ABdhPJz5HLzukBhUbrD4+vp7IbSfBgO9Z0gVXVqKCriUmhTOyTMb7ESDQ6b4v5jDvS+u4s7+oV9frg==
X-Received: by 2002:adf:c6c5:: with SMTP id c5mr14765702wrh.13.1591974069006; 
 Fri, 12 Jun 2020 08:01:09 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id z12sm11445939wrg.9.2020.06.12.08.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 08:01:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] drm/tegra: hub: Register child devices
Date: Fri, 12 Jun 2020 17:01:00 +0200
Message-Id: <20200612150100.2419935-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612150100.2419935-1-thierry.reding@gmail.com>
References: <20200612150100.2419935-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

In order to remove the dependency on the simple-bus compatible string,
which causes the OF driver core to register all child devices, make the
display-hub driver explicitly register the display controller children.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/hub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index a2ef8f218d4e..22a03f7ffdc1 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -948,6 +948,15 @@ static int tegra_display_hub_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
 
+	err = devm_of_platform_populate(&pdev->dev);
+	if (err < 0)
+		goto unregister;
+
+	return err;
+
+unregister:
+	host1x_client_unregister(&hub->client);
+	pm_runtime_disable(&pdev->dev);
 	return err;
 }
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
