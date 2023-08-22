Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F03B678490E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 20:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E2010E3D3;
	Tue, 22 Aug 2023 18:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45A610E3BF;
 Tue, 22 Aug 2023 18:02:41 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bc0d39b52cso31429575ad.2; 
 Tue, 22 Aug 2023 11:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692727360; x=1693332160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQPrHId/lCHDPLFw57GJfdnbAiLt5erdzCNTXGSDhdo=;
 b=Ie2ANdwPuvvaJZxkLtrV0mygSDZzPCCbtaixTP8JhVB/Dc8l9V7ZwtmGdhFz5nHUp8
 0pwhfQZmLpaJW8iDA2VwHvcAgkKpV0TMqB9fKSlHP7RDEocY2yvNGjhM95DxrPb8fidf
 FlIJaGh+hNfhxNGHXNRMtQy2Bwu71FYUO/2lsS+d0iD75UwGCdHdk+430CWP03moOP/g
 vh1w62NFiGunZUR5wq3X8AXFQHYj7/ZNM0nvpnAGGzLB7biAnJZAKd/hS/75nPJidBRd
 wyB7HRXthbT3p8bRWgKtAX5Wh9DXBfund8EKANorutH3NVpoOehVuli/wxpVea/0kRs9
 FAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692727360; x=1693332160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQPrHId/lCHDPLFw57GJfdnbAiLt5erdzCNTXGSDhdo=;
 b=TTSrfw5w85KHzLVtNeXCfk3hmzw00Rmt53QTakpr7qvaPzqqiRmsi2hvlG8b+GE6gf
 Lm8bEJ4hImE0aKhmd5z89P5D0cr9siYTQmnLPuf/juqH1axltWBs0XnV/sxqRWDt//+p
 uIQQnefNqn29kCWwf3u4HbrorBic86ur8nxRLfANciu7fcRPN8wclKk2p8aTdLNEz8PL
 nuHGFIuZBq5HR743IBJM/bQ78+zSM7s+0dAtzhdUzr5CdpTIyZjwSXGls15pjvRYOCCP
 WvNIn3UBwUho4D/wWYCFjHOcYfrW0pQp5dA8g9ZxZGG/cSurGqiRPe7PxPQVvTZD6NW4
 tpOQ==
X-Gm-Message-State: AOJu0Yw6L7AGbESUqzNORktrxeCua/dgdVC6XXlBmAjxzzp1kW7rIYN3
 JxBiHhSWrHAFEDyU8Ywwzgr1zjPb+JY=
X-Google-Smtp-Source: AGHT+IGraTUb9fjtbBbpbEedDJNHXKDUjifcWUB+DLrPWbQJCnkqOHt2z8O4M1Y+WpOEnMa46nzFqw==
X-Received: by 2002:a17:902:c086:b0:1bc:5924:2da2 with SMTP id
 j6-20020a170902c08600b001bc59242da2mr8036097pld.56.1692727360397; 
 Tue, 22 Aug 2023 11:02:40 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a170902684500b001bf6ea340b3sm5744775pln.116.2023.08.22.11.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 11:02:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 05/11] PM / QoS: Teach lockdep about dev_pm_qos_mtx locking
 order
Date: Tue, 22 Aug 2023 11:01:52 -0700
Message-ID: <20230822180208.95556-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822180208.95556-1-robdclark@gmail.com>
References: <20230822180208.95556-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 "open list:HIBERNATION aka Software Suspend,
 aka swsusp" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Annotate dev_pm_qos_mtx to teach lockdep to scream about allocations
that could trigger reclaim under dev_pm_qos_mtx.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/base/power/qos.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
index 09834f3354d7..2018c805a6f1 100644
--- a/drivers/base/power/qos.c
+++ b/drivers/base/power/qos.c
@@ -1017,3 +1017,14 @@ void dev_pm_qos_hide_latency_tolerance(struct device *dev)
 	pm_runtime_put(dev);
 }
 EXPORT_SYMBOL_GPL(dev_pm_qos_hide_latency_tolerance);
+
+static int __init dev_pm_qos_init(void)
+{
+	/* Teach lockdep about lock ordering wrt. shrinker: */
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&dev_pm_qos_mtx);
+	fs_reclaim_release(GFP_KERNEL);
+
+	return 0;
+}
+early_initcall(dev_pm_qos_init);
-- 
2.41.0

