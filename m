Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4559D7121
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE86910E51E;
	Sun, 24 Nov 2024 13:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Sh9GrTYP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AA410E51E
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 13:44:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 76C565C56D8;
 Sun, 24 Nov 2024 13:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9669CC4CED6;
 Sun, 24 Nov 2024 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455864;
 bh=dvgtB6yA56MRVlRsQXpEbTxd6TeHhGwoaTh1DklfroY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sh9GrTYPC5RfJN1qkY0YG0xm58nDxGcPnzyTHR+iT0huIyP7X8zug96ZCiSknu0lb
 GgGcftGAcb3m+sEsK01p6DLHOz9wNzGiUdBYI3q+032PazVDhWHHkn4cw9PHbYiAQ4
 ZLLh8Aw7muQ2cCmjrEyiTRvS0ZQ2qL2//RPIwoQjzc8kp3N8h0RMDsK8a93pIxTsMR
 icUbNFfxvMS3oF+AKDBe5OB5Qn0R7TZTrDZ4Vu6Q0Cu0PEmYKhcr2ite1H0erofE8d
 v42tWG6JE29G65W9kDOAdB9vUWE2wXVl4VuLWvmfTvrpkgAYW79aKJ2dI/1mIRYRqf
 wkgFFUeQ7q4Jg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 63/87] drm/panic: Add ABGR2101010 support
Date: Sun, 24 Nov 2024 08:38:41 -0500
Message-ID: <20241124134102.3344326-63-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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

From: Jocelyn Falempe <jfalempe@redhat.com>

[ Upstream commit 04596969eea9e73b64d63be52aabfddb382e9ce6 ]

Add support for ABGR2101010, used by the nouveau driver.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241022185553.1103384-2-jfalempe@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 948aed00595eb..f762d7a2a9b43 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -198,6 +198,14 @@ static u32 convert_xrgb8888_to_argb2101010(u32 pix)
 	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
 }
 
+static u32 convert_xrgb8888_to_abgr2101010(u32 pix)
+{
+	pix = ((pix & 0x00FF0000) >> 14) |
+	      ((pix & 0x0000FF00) << 4) |
+	      ((pix & 0x000000FF) << 22);
+	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
+}
+
 /*
  * convert_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
  * @color: input color, in xrgb8888 format
@@ -231,6 +239,8 @@ static u32 convert_from_xrgb8888(u32 color, u32 format)
 		return convert_xrgb8888_to_xrgb2101010(color);
 	case DRM_FORMAT_ARGB2101010:
 		return convert_xrgb8888_to_argb2101010(color);
+	case DRM_FORMAT_ABGR2101010:
+		return convert_xrgb8888_to_abgr2101010(color);
 	default:
 		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
 		return 0;
-- 
2.43.0

