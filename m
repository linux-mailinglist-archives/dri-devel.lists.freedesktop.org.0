Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA72BDBDF8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 02:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C698C10E6B9;
	Wed, 15 Oct 2025 00:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="W4+29a/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C5710E6B4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:10:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760487045; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ee6NoUSl9qb4jfPLyFxdgTcOUot4aF5gY8EjLB2NF/vUI7Qhuv/1z+m8x9dbZ9Ln/vog+pwabFCAxOIo/6Ay1vlWTHgdQ+HMUD5FrmGQAyFzLQUpnOauubST+FHO7cEu9oAfEXDArNh5/WTDKNa8X7Ss/+49/FF3/r1wQmUCdT0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760487045;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1bFw6B/0UFL8CxqPxFS3U9dvgzamyRZ5iQeTYr1PoBA=; 
 b=RXqgslipOL/TLpAH026W8lPrBEorJTwFTnzd90RZjEwyVURcJmhyLmVxe24R1Yl6zBW35oz4FcxsT39lnhd2UipO4v5NSRVD0lsiHG+4CDgNeP0vcSJ+ipZ1nlzghT74Gu0+U24Op8NSTrMPgYmwkkIanhpkmJe/kx/wBLMe4D4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760487045; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=1bFw6B/0UFL8CxqPxFS3U9dvgzamyRZ5iQeTYr1PoBA=;
 b=W4+29a/96qMyGjphhEeNKTBx7Z8KJubuqUIXCNcGTCqhFIcAf+M5hxpDkhJEGWIp
 Sj5xtb3HzRmT7Ocfw5W7pC07bSBUF9oNVyxH6SG+AcAcxYa4D31yyKjjF+UtiFCokIo
 qkHbPdaBl9/wNbara7GptL0aRh0LnRr+gK+BTNXI=
Received: by mx.zohomail.com with SMTPS id 1760487043364221.83519109424833;
 Tue, 14 Oct 2025 17:10:43 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev
Subject: [PATCH v6 09/12] drm/panfrost: Add forward declaration and types
 header
Date: Wed, 15 Oct 2025 01:09:15 +0100
Message-ID: <20251015000930.356073-10-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015000930.356073-1-adrian.larumbe@collabora.com>
References: <20251015000930.356073-1-adrian.larumbe@collabora.com>
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

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/panfrost/panfrost_mmu.h
index e6e6966a0cca..27c3c65ed074 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
@@ -4,6 +4,7 @@
 #ifndef __PANFROST_MMU_H__
 #define __PANFROST_MMU_H__
 
+struct panfrost_device;
 struct panfrost_gem_mapping;
 struct panfrost_file_priv;
 struct panfrost_mmu;
-- 
2.51.0

