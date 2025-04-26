Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93473A9D834
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 08:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E59A10E122;
	Sat, 26 Apr 2025 06:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oqaD1P0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38A810E122
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 06:13:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 447C5A4D1A3;
 Sat, 26 Apr 2025 06:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9188C4CEE2;
 Sat, 26 Apr 2025 06:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745648009;
 bh=b/DByUu/J9hyxQtq5Q/daVnBO4Txp/CsRF+oklwCXj8=;
 h=From:To:Cc:Subject:Date:From;
 b=oqaD1P0dAVGKNtVDCtWp9bEFA7kFfaxQevNJ64Yc4jGDdTPzFehhtcU1/Q0aM71OB
 RWKxFg0Rd/31tyDfOwY43rATEEsD2tYIybSCsAhP1EOTj7vdB+uiO7kaHmF08/6AHp
 SjCa3OWtrr2wJqDvEiRxbK4MSzzJX7vc42vtBMm9+Qn/TrCKHJr0WN0vuXU1FlxIHT
 oOq4U4Bmc2UkxY3THYq3vH76RRjEs+xwBft6dOiaNuAwEPanmyTDgslwnm1MOKwM3c
 FxBDH09QS8mrjIYiBfQBd4oePLloP2tgQxfA0DNt27w1DdHymPBtazfI2Q7BjPStPB
 DqpY4aq0ft1TQ==
From: Kees Cook <kees@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH] drm/plane: Remove const qualifier from plane->modifiers
 allocation type
Date: Fri, 25 Apr 2025 23:13:26 -0700
Message-Id: <20250426061325.work.665-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444; i=kees@kernel.org;
 h=from:subject:message-id; bh=b/DByUu/J9hyxQtq5Q/daVnBO4Txp/CsRF+oklwCXj8=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDBk8la36K7XvyrY7l/oVlZ1MyFRiVpqnUTJlVslCZbsW/
 /YfcyM7SlkYxLgYZMUUWYLs3ONcPN62h7vPVYSZw8oEMoSBi1MAJtLizPC/9uWeEpvjRWfPeOq2
 vfr2pfhmgHmOkMdajcs1FswaxXy/GBnW+s3f+2W6GueCssQC/z1GHIxKEmp/JnLM39Ic8+r71kQ
 GAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

In preparation for making the kmalloc family of allocators type aware,
we need to make sure that the returned type from the allocation matches
the type of the variable being assigned. (Before, the allocator would
always return "void *", which can be implicitly cast to any pointer type.)

The assigned type is "uint64_t *", but the returned type, while matching,
will be const qualified. As there is no general way to remove const
qualifiers, adjust the allocation type to match the assignment.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: <dri-devel@lists.freedesktop.org>
---
 drivers/gpu/drm/drm_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index a28b22fdd7a4..a9f5c361780d 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -414,7 +414,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 
 	plane->modifier_count = format_modifier_count;
 	plane->modifiers = kmalloc_array(format_modifier_count,
-					 sizeof(format_modifiers[0]),
+					 sizeof(*plane->modifiers),
 					 GFP_KERNEL);
 
 	if (format_modifier_count && !plane->modifiers) {
-- 
2.34.1

