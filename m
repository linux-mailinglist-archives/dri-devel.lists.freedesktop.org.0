Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7161FBDBF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 20:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8026E94F;
	Tue, 16 Jun 2020 18:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDB66E94F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 18:15:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j10so21756260wrw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 11:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1cwXIj5ouQp4SkSeQCvfyT9yp/LQNeF4xzvNurOwI34=;
 b=T3SXtACH0iEYl0XvM+ojOpUB0FTQiKxHS6P1I6QXfEcMO7WEYmkFIdOzhGJBVBhbyR
 9pgF+5o7KYJA4mMCrwhqp9jAIkOU2uLpLPLk+JGnuUfSqLwuv6C0NeXc82VylSgoLbKr
 E6kkMdjR9Y6+QarVBRbOkxGTdafxoH8MSXfr3IHae0zaks87sPZnVXa6OYdCgw8S7r3T
 vWYfmPdZMED1v413T7Ls+fr0eJNnr7j8T4Z7i4Pd/HKzYbxVUJOw4rMctgBpyT5WQHcf
 299qBR+Nb+jB9s/7JYRYo70EKII47QM5i3uAZTVagLFDbzjfmhZzY1FfbMpjk9+RvkLG
 hl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1cwXIj5ouQp4SkSeQCvfyT9yp/LQNeF4xzvNurOwI34=;
 b=IwYC355DXHtLPHnH5Nqk0Ws9VEFBgBXpFcLJ1CA6fuKvrCIzBPqcY7tPE86GJsRw8Z
 LStOk+skmlU093/SpzSwLOk5A/BtMzEEHqEQLmnXMKy2EsmRbc+v/wQ1A5HK8WeewqSA
 H7X6eBpdsrGRoY6rfOSSg5gJn7qN1BMZx0t0Rzrc383mgDf4AEuzhrNMZy9EFVNqgvA2
 d9/6FkFKEzNHBFAvxUtGskljusyLn4Muf0dvJY/toW5oppbwhSwKdYWCrwSvKE8tcDMV
 YgX9oQy5eBHdJKVD5eQO5gwOaYXKyBuH1ORy7RkfNRXKHuXuLoKdll0F9qJcSP660tiH
 2LcQ==
X-Gm-Message-State: AOAM533mSzVqNPzG1MwJcu4navcQGcBrrHpuVS9BF1Ku30liLGYqpdOt
 9V8n9G7RfVKh7IujzcAYSHY=
X-Google-Smtp-Source: ABdhPJwMuwx+oPVBG4tX5rC/goYaMI+Zw5SMzO0D0jdyuongMlTFYMvYds2ermJbrAAVQ0T/KQ6uRQ==
X-Received: by 2002:adf:82ab:: with SMTP id 40mr4160642wrc.85.1592331301368;
 Tue, 16 Jun 2020 11:15:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id r14sm1899663wrx.42.2020.06.16.11.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 11:14:57 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3] drm/tegra: Add zpos property for cursor planes
Date: Tue, 16 Jun 2020 20:14:49 +0200
Message-Id: <20200616181449.3147258-1-thierry.reding@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
have a zpos property") a warning is emitted if there's a mix of planes
with and without a zpos property.

On Tegra, cursor planes are always composited on top of all other
planes, which is why they never had a zpos property attached to them.
However, since the composition order is fixed, this is trivial to
remedy by simply attaching an immutable zpos property to them.

v3: do not hardcode zpos for overlay planes used as cursor (Dmitry)
v2: hardcode cursor plane zpos to 255 instead of 0 (Ville)

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 83f31c6e891c..04d6848d19fc 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
+	drm_plane_create_zpos_immutable_property(&plane->base, 255);
 
 	return &plane->base;
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
