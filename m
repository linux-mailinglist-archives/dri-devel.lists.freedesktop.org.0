Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3E5A4C71E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6C210E496;
	Mon,  3 Mar 2025 16:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lfm+qY8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B4610E477
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 16:30:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5E49B6121B;
 Mon,  3 Mar 2025 16:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B82EC4CEE4;
 Mon,  3 Mar 2025 16:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741019447;
 bh=kWMnwqFbpjLz79Bq1d2W52AJjEPoXPjTiAxNA0FiBOc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lfm+qY8nOjfTA4MLQPqKFoPsXbd9/hKUlfFjwjtQYrQsql9BCNI0PE1uFR6gZF/eK
 fANR4ip18GU7+qUOZW1xIuHGpoP5XnXRtlLIHz7/d8ILCZfTdr2nSoH8/zCjM/fpli
 weI9dP/FOrXS2kQAZLmjbVB6yE3hcZ0AZWNyiSdKRBS89ctwDgV9xdlSJA8IUficUA
 juDGlTBNF1rojbuSsCb/YiCy6EN0xybqDEziIIgpn8JeBb3uCzRzZamqOqZwbbcMlp
 EqibypDVEzqFcfZVs1O8i+if1zdtBnvXesIriZqJt0IGs6wyxAD46H+dyglGn5WB04
 BOdFF9xQVYKzQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>, Sasha Levin <sashal@kernel.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 08/17] drm/vkms: Round fixp2int conversion in
 lerp_u16
Date: Mon,  3 Mar 2025 11:30:20 -0500
Message-Id: <20250303163031.3763651-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303163031.3763651-1-sashal@kernel.org>
References: <20250303163031.3763651-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.17
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

From: Harry Wentland <harry.wentland@amd.com>

[ Upstream commit 8ec43c58d3be615a71548bc09148212013fb7e5f ]

fixp2int always rounds down, fixp2int_ceil rounds up. We need
the new fixp2int_round.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241220043410.416867-3-alex.hung@amd.com
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e7441b227b3ce..3d6785d081f2c 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -98,7 +98,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
 
 	s64 delta = drm_fixp_mul(b_fp - a_fp,  t);
 
-	return drm_fixp2int(a_fp + delta);
+	return drm_fixp2int_round(a_fp + delta);
 }
 
 static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
-- 
2.39.5

