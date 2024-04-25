Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B33B8B1A19
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 07:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A411211A0EB;
	Thu, 25 Apr 2024 05:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="Lfk+m1ii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F3811A0EF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 05:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AxK20Fe5cUhFubbOTeK5/1a5AJJBuw88+EhiESfmRa8=; b=Lfk+m1iiCAiflQUXzoAK/N1O7Z
 hVpd46LSD8Y+7ezRVZ9JxxZlex2THwqHtV6feiS85lQJZdXuUhEJH/YgOPhuvM7iuA03EktDiTqro
 kibGoRBeWFmG9AnFs7AqmfCcXiHUY1FC823clgv6+KMaKDNh0mRAwgZrM4EdhsISHAyEcVjw7yzv9
 MCWqPp7UG0+bbX1oI5JDldXyIzqiO/HDs3FbjCZbUl8518DwXciNPV6lyvvDChqpNHYriailnhoBG
 JwzNfCezOwCbTKVm4Zd82iJEXrz0KuFIL9Tj5cJZiT5g+cdTO7IPSR9A8vvUHGuvCeCJckJL0NZZ7
 GG0/KCxQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1rzrG6-00Fmla-36;
 Thu, 25 Apr 2024 08:02:59 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 1/5] gpu: host1x: Fix _writel function declarations
Date: Thu, 25 Apr 2024 08:02:33 +0300
Message-ID: <20240425050238.2943404-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

From: Mikko Perttunen <mperttunen@nvidia.com>

Some of the _writel functions in dev.h had the r and v parameters
swapped. Fix this to avoid confusion.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 925a118db23f..53af0334c6e1 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -173,11 +173,11 @@ struct host1x {
 };
 
 void host1x_common_writel(struct host1x *host1x, u32 v, u32 r);
-void host1x_hypervisor_writel(struct host1x *host1x, u32 r, u32 v);
+void host1x_hypervisor_writel(struct host1x *host1x, u32 v, u32 r);
 u32 host1x_hypervisor_readl(struct host1x *host1x, u32 r);
-void host1x_sync_writel(struct host1x *host1x, u32 r, u32 v);
+void host1x_sync_writel(struct host1x *host1x, u32 v, u32 r);
 u32 host1x_sync_readl(struct host1x *host1x, u32 r);
-void host1x_ch_writel(struct host1x_channel *ch, u32 r, u32 v);
+void host1x_ch_writel(struct host1x_channel *ch, u32 v, u32 r);
 u32 host1x_ch_readl(struct host1x_channel *ch, u32 r);
 
 static inline void host1x_hw_syncpt_restore(struct host1x *host,
-- 
2.42.0

