Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A1999DA34
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 01:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDFD10E4EB;
	Mon, 14 Oct 2024 23:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="iHUrBMYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0125210E4E2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 23:38:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728949118; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Wzkx/UJGOZrXqVxlmZTVxDuFtXyIF3nds/uJrYxLSS33l0ItvrCGuYj7+1nLRAj6UTKJCyvT1dSElCgMgpE2BAqZqCnd8+GSRNiiuMCMzQ1M0QCqRX4DKId9esyo4MqPL+sxtYLSaE04QyKYItFgO+eYIkfR/mzFriCooU03a8Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728949118;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qn2Rk8Ugffxfl5LMvo+WmO3g460JFKXzoiCtcH0gUi8=; 
 b=YZ4aCBuZ9ulpliM3Kamj/i7vE/XFVZGn76WTNOamMBzw6Yf1BYCjfzhh6SWSUoByEUf51GgjltIyHJx3+avODg5JjojuydzxnTP1tTpioWNAyQjrdKUbz8Sl5wntiFJREDZHQqaFVJZGIjC2BKnVKzIxdUXSu4lj+1D3rtOW2Jc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728949118; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=qn2Rk8Ugffxfl5LMvo+WmO3g460JFKXzoiCtcH0gUi8=;
 b=iHUrBMYthLTLgQXbAY+yK1K5dUVx/qjE5E4UDhApA9/tLdnX+A9bVXETeOm3RTWb
 BMAMWJ/V7NcP4EppFmLg/DKoJ+6BgUcNmTkZkV1eKZGR/RvzjiQRbh6i4XNedxei0C7
 bs7FCwJQ8Xk4T4OmlvXY1QCP/XmXcdiTngUya34A=
Received: by mx.zohomail.com with SMTPS id 1728949117928981.8020714538841;
 Mon, 14 Oct 2024 16:38:37 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: [PATCH 8/9] drm/panfrost: Add forward declaration and types header
Date: Tue, 15 Oct 2024 00:31:43 +0100
Message-ID: <20241014233758.994861-8-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241014233758.994861-1-adrian.larumbe@collabora.com>
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is to make LLVM syntactic analysers happy.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/panfrost/panfrost_mmu.h
index 0b2c0b59db3f..a19282a22aab 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
@@ -4,6 +4,9 @@
 #ifndef __PANFROST_MMU_H__
 #define __PANFROST_MMU_H__
 
+#include <linux/types.h>
+
+struct panfrost_device;
 struct panfrost_gem_mapping;
 struct panfrost_file_priv;
 struct panfrost_mmu;
-- 
2.46.2

