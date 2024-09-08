Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8599697063C
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 11:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7F310E25E;
	Sun,  8 Sep 2024 09:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="U6r/upQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [95.215.58.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E50D10E25D
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 09:45:20 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725788719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eeD9SxNN6Us6uo8C+uy3ksInnmKnlsl9Pc+O2QjnkD4=;
 b=U6r/upQqlSLOk7c96htH1ZuBprYItHS9o5dvYvWLVbX8EmbEr39K824hWK/m6sXv++KiOJ
 UebpTzBU1AWOOznMa14VcwJ9SIOEM7wac4oOViF3ibS+QBeJCVVib0oDsNpnejMiHl+I4U
 KwHBfaZqrU91WTxxkLcmzLbW4N6asnk=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v15 18/19] drm/etnaviv: Allow userspace specify the domain of
 etnaviv GEM buffer object
Date: Sun,  8 Sep 2024 17:43:56 +0800
Message-ID: <20240908094357.291862-19-sui.jingfeng@linux.dev>
In-Reply-To: <20240908094357.291862-1-sui.jingfeng@linux.dev>
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Otherwise we don't know where a etnaviv GEM buffer object should put when
we create it at userspace.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c |  9 +++++++++
 include/uapi/drm/etnaviv_drm.h        | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index f10661fe079f..cdc62f64b200 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -331,11 +331,20 @@ static int etnaviv_ioctl_gem_new(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
 	struct drm_etnaviv_gem_new *args = data;
+	u32 domain;
+
+	domain = args->flags & ETNA_BO_DOMAIN_MASK;
+
+	args->flags &= ~ETNA_BO_DOMAIN_MASK;
 
 	if (args->flags & ~(ETNA_BO_CACHED | ETNA_BO_WC | ETNA_BO_UNCACHED |
 			    ETNA_BO_FORCE_MMU))
 		return -EINVAL;
 
+	if (domain == ETNA_BO_PL_VRAM)
+		return etnaviv_gem_new_vram(dev, file, args->size,
+					    args->flags, &args->handle);
+
 	return etnaviv_gem_new_handle(dev, file, args->size,
 			args->flags, &args->handle);
 }
diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
index 61eaa8cd0f5e..00e778c9d312 100644
--- a/include/uapi/drm/etnaviv_drm.h
+++ b/include/uapi/drm/etnaviv_drm.h
@@ -99,6 +99,18 @@ struct drm_etnaviv_param {
 /* map flags */
 #define ETNA_BO_FORCE_MMU    0x00100000
 
+/* domain (placement) flags */
+#define ETNA_BO_DOMAIN_MASK  0x00f00000
+
+/* CPU accessible, GPU accessible pages in dedicated VRAM */
+#define ETNA_BO_PL_VRAM      0x01000000
+/* CPU accessible, GPU accessible pages in SHMEM */
+#define ETNA_BO_PL_GTT       0x02000000
+/* Userspace allocated memory, at least CPU accessible */
+#define ETNA_BO_PL_USERPTR   0x08000000
+/* GPU accessible but CPU not accessible private VRAM pages */
+#define ETNA_BO_PL_PRIV      0x04000000
+
 struct drm_etnaviv_gem_new {
 	__u64 size;           /* in */
 	__u32 flags;          /* in, mask of ETNA_BO_x */
-- 
2.43.0

