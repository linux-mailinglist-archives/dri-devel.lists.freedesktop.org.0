Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D263F465930
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 23:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586D76E8BC;
	Wed,  1 Dec 2021 22:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94436E5A1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 22:26:39 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id 207so51020373ljf.10
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 14:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QyBeyBWo65CT6xBgTBhfrozb0bd0F4LFSrE6RAMpJzI=;
 b=sK7eFA3m+/qIm4InYAdUjHyflgJOPhbZO0tlnNIjvXk2ys/rqr1BOKT3XPAh/NHoPB
 +n8pPsvqHQFOH0aLEJhEbX0oroiWtMp1eSv7/Sj/k126jPjoSqTC08BUX8wKrJCAcS8z
 gdI7sHJ7QRFnhqwXg0czGXLa8wBGaBNmRakIWicAgIJOsgGz2NYfgRRo2JaINCaYZUuE
 NcqHEnffPSufbrhvCAJgCSsF++f+wstM81yAjFyVu3O00oQGzgQZvi65UNgiFrtlvCDR
 fxm7lUOSk85c1GTzCQiJewtCqGOLHv8FJc36PUI/6ON1z5J4uaj2MbKcgapsogFYwDLg
 5ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QyBeyBWo65CT6xBgTBhfrozb0bd0F4LFSrE6RAMpJzI=;
 b=g5HS7+Ix/gCE2v15t53St0limPxktBuojdTJyziPlp7iI187iPrCOBUuWgavBUyUc+
 GvSQEWhklOeid9x/R/k2jXHg/r1b6/Bjpr42joaVGkocea8C5pYWFt5ReH+neJEpSFSC
 4xiEWlPGlFk1rs3VkcwqhOuUDsbgHzTytE8Hya57nt+3xYnUHBvYvK8wWF+EIHUglWY7
 qYrZ/gtiGdYJpo9cfL4IKiqQaDaFhWMs411ZFMzjyVb6XowBfWDVGfz1MPWtTIpPKn5a
 TxoM3Bfg/VfRCkJvodbvAQZfL0KT+Ns/Z5B2yu49LTNFw1Ewq4O4nlxJnJt3zrzlTTAM
 qISg==
X-Gm-Message-State: AOAM532uqri3B2NiJaBxNS7kGTaiZf1eJ9C7SgEW17IzP7Ep7qz6YjhF
 fIqQYw0xpf4GFnmqKJCIe0Yw8g==
X-Google-Smtp-Source: ABdhPJymE79FwRQmq1c0blin795kAa0mjoNu9ebomIYeKBMKEprD0FWK90XiLNqyK4oIgT3oUYbzvw==
X-Received: by 2002:a05:651c:1696:: with SMTP id
 bd22mr8162728ljb.57.1638397598092; 
 Wed, 01 Dec 2021 14:26:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:26:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v1 2/8] drm/msm/dpu: fix safe status debugfs file
Date: Thu,  2 Dec 2021 01:26:27 +0300
Message-Id: <20211201222633.2476780-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make safe_status debugfs fs file actually return safe status rather than
danger status data.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 259d438bc6e8..e7f0cded2c6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -73,8 +73,8 @@ static int _dpu_danger_signal_status(struct seq_file *s,
 					&status);
 	} else {
 		seq_puts(s, "\nSafe signal status:\n");
-		if (kms->hw_mdp->ops.get_danger_status)
-			kms->hw_mdp->ops.get_danger_status(kms->hw_mdp,
+		if (kms->hw_mdp->ops.get_safe_status)
+			kms->hw_mdp->ops.get_safe_status(kms->hw_mdp,
 					&status);
 	}
 	pm_runtime_put_sync(&kms->pdev->dev);
-- 
2.33.0

