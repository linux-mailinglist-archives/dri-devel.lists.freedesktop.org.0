Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028739D70A7
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EA610E2AB;
	Sun, 24 Nov 2024 13:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EL6a8sVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7553F10E2AB
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 13:37:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 953EEA40B48;
 Sun, 24 Nov 2024 13:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE88C4CED1;
 Sun, 24 Nov 2024 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455457;
 bh=EEEbihI3nDaSluEdl9qjTBkV1p/H7rXgZdPCGyFhopA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EL6a8sVt3c+B+HGdp13bii8UT+5B4pjMgkivnjP4RaPSH1xCHD+CO1ankmuesRJTO
 HZ6Tj1PCsvyqlfYfByADzT1oJnjst9Bn3/BGhvdODIBP3hEwsrL1weyW5sa1mFa8Wm
 +6bjqi/zJFFjqQgwOaJqr6dljL7B2Kg06KZ+b4YLm+2EcVGaS9CmvHsKCKsSJ7p2HX
 ebjHjFs1LuhoVhRe0zFUlBgdMhlTigdk2Qe0AWNytTN6dNRHZQ4297KbTrkyliMDNq
 Xc/m6PKTW7l6JpsOGbhwvgNn1jrzh7B+d0/+p5sCmuq5HS/3cZLC2RfhYP1g34Yfgd
 +8svIRvwrHVSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 078/107] drm/panic: Add ABGR2101010 support
Date: Sun, 24 Nov 2024 08:29:38 -0500
Message-ID: <20241124133301.3341829-78-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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
index 74412b7bf936c..0a9ecc1380d2a 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -209,6 +209,14 @@ static u32 convert_xrgb8888_to_argb2101010(u32 pix)
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
@@ -242,6 +250,8 @@ static u32 convert_from_xrgb8888(u32 color, u32 format)
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

