Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0C6B6B4D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 21:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373D910E41C;
	Sun, 12 Mar 2023 20:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB9610E2BF
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 20:42:48 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id d10so5794920pgt.12
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 13:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678653768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QfAHpBWoMxTHMa2AnmzhjkXruv6iv5Hi+uoFH6JuoB0=;
 b=SZk/mFJjL17EA59SAV1C7+KSi58oOlhcu2GkvfGdTdiqqIb3DBq/AztD3dErzqUrJf
 y8d5XUrwYtXXLBhhwAThzI8X+md14LexxS/wg0rAxp1YVX6f4H4A6xcLXAzo8yJEJv1w
 SWrtoyJwmxyYzsTv7stlyGlv8wZMVsxDWB1ESp1kFS8zDH7uFgAKJcdhbWgMMjEmOz8l
 5rcq6gS+xXIc72rvhVp1rwPKRttpyk9HnA9IcqxhOdTl9nwDK2FQJYjIaaAEKAVw2wC3
 /lIdVUWm6bwSmzWWp1WOwYRO7Xg2XZY4myIPs9bZ4ImHXhnePtBo9bNezGlhXN2vbCmf
 95MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678653768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QfAHpBWoMxTHMa2AnmzhjkXruv6iv5Hi+uoFH6JuoB0=;
 b=S6eBCZMPC8iVDEj9gRPd/u8w6w6l4xsKlWDzYfmMmWcreB3aBFv8RcmD9WtBBD+d6F
 9fg1A0Tu/dNuSPBHMXjwAP1QZH8zlmmk/UaWsbpwtRC9dRC2ZJVZ7ZT0cWEeozIK0O1Z
 m9zLmqusLn4+inqUWyf4QC55BZiCVK5UABgWMG3jPcl5+XC90ktNXdZYUhLm5AVaEPYi
 eGjHspY1prT6+pyd32o3qfoiB1P+WviMAvwZtMSFBa4ymSLK+yX0QHT1r/Bahz8LopJT
 t2hK/o89b7NGX3RNEl0WUzwJhA4uc0WhSKm+/E3gmThcRJf1yFX/jlnoHFecdqkYiZWh
 3fTg==
X-Gm-Message-State: AO0yUKWzNFZZWkjtrnLF3eQXxAcPY9m4SULBgpnO2QiW5j6ca2w0oVZK
 8pfHuoXAJxIEcGsYwzJ/sQnhPE5V3u4=
X-Google-Smtp-Source: AK7set87ZVy65GE33Rw0XBiekKUgpOWPLY80uMY4DBKjyUe+sE5mUPtEy8WWl6cR7PYtGzTVSMaVJQ==
X-Received: by 2002:a62:1a17:0:b0:5d6:4847:1bd4 with SMTP id
 a23-20020a621a17000000b005d648471bd4mr26595681pfa.20.1678653768116; 
 Sun, 12 Mar 2023 13:42:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5080:d9fa:9b45:95de:f47d:f85e])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a62be01000000b0058d8f23af26sm3048790pff.157.2023.03.12.13.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 13:42:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/13] soc: qcom: smd-rpm: Use GFP_ATOMIC in write path
Date: Sun, 12 Mar 2023 13:41:39 -0700
Message-Id: <20230312204150.1353517-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312204150.1353517-1-robdclark@gmail.com>
References: <20230312204150.1353517-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Preparing for better lockdep annotations for things that happen in runpm
suspend/resume path vs shrinker/reclaim in the following patches, we
need to avoid allocations that can trigger reclaim in the icc_set_bw()
path.  In the RPMh case, rpmh_write_batch() already uses GFP_ATOMIC, so
it should be reasonable to use in the smd-rpm case as well.

Alternatively, 256bytes is small enough for a function that isn't called
recursively to allocate on-stack.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/soc/qcom/smd-rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index 7e3b6a7ea34c..478da981d9fb 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -113,7 +113,7 @@ int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
 	if (WARN_ON(size >= 256))
 		return -EINVAL;
 
-	pkt = kmalloc(size, GFP_KERNEL);
+	pkt = kmalloc(size, GFP_ATOMIC);
 	if (!pkt)
 		return -ENOMEM;
 
-- 
2.39.2

