Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE0AAC5AF7
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 21:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BCD10E51A;
	Tue, 27 May 2025 19:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="WdQcr8A0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD74510E51A;
 Tue, 27 May 2025 19:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1748375427; x=1748980227; i=natalie.vock@gmx.de;
 bh=yy55+GQV07DU1PlzulpC7ZxEesUJ7cu0Lq4pW8qpSO8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=WdQcr8A0LSmD6MfHZNZdF4FfJVXtiVxHeeyDC3cPW1oLCtl3ZDYvtneeMFI2Uf/L
 tgtR4umGX4jOyMEGHyi/iMp1cJUzDoIKUsf2imIqWZag77nUXtQA0Y6ZWpdGb6TXa
 6UqmgWy4m8U/Xm9+zN09rYkE7kznXUtXvDYe/SVgEamZlYiASHkxXR/uHYsI65IhR
 a2doxNGYXj1IWXDBVDwsj+kt2OlNyI6yCBSSiyTqzgbqrI2sSc22TAbK2BhtkDJXZ
 jU06rKe/PBV0HTuP4jGg3zeCDwNw0gAyWTpvumFX4cizP2+zVIBfP82zF15XI5GGh
 qWiVGjJdsGzp5epX4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([109.91.201.165]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MMGRA-1ua0wn2Pva-00LF1d; Tue, 27 May 2025 21:44:59 +0200
From: Natalie Vock <natalie.vock@gmx.de>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>, stable@vger.kernel.org
Subject: [PATCH 1/2] drm/buddy: Add public helper to dirty blocks
Date: Tue, 27 May 2025 21:43:52 +0200
Message-ID: <20250527194353.8023-2-natalie.vock@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527194353.8023-1-natalie.vock@gmx.de>
References: <20250527194353.8023-1-natalie.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:euWBSkH/f7kf5t01BmVT6vYLv/uqhWZUx+ZzS3mguzTWxtVN4Y8
 GT6j+7qC2TDS2a+S7udASu0bTcRn//gdrL/ailn3KPDRtP2Vpsqk8RmPqf667NtjCMraBPg
 c9hrBvdBEUaMkoSsEaR+MAPdfkN63yjkna0iPiAXCoQEkH/G2KDHln/5u9rILPH5d56Is/r
 Ch8Kn64dT8ZIbLj/zsC0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vIqfUAby6FI=;E0I2xS6Tp3wmkVLXQzJqEEJDX3+
 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
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

Cleared blocks that are handed out to users after allocation cannot be
presumed to remain cleared. Thus, allocators using drm_buddy need to
dirty all blocks on the allocation success path. Provide a helper for
them to use.

Fixes: 96950929eb232 ("drm/buddy: Implement tracking clear page feature")
Cc: stable@vger.kernel.org

Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
=2D--
 include/drm/drm_buddy.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 9689a7c5dd36..48628ff1c24f 100644
=2D-- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -142,6 +142,12 @@ drm_buddy_block_size(struct drm_buddy *mm,
 	return mm->chunk_size << drm_buddy_block_order(block);
 }
=20
+static inline void
+drm_buddy_block_set_dirty(struct drm_buddy_block *block)
+{
+	block->header &=3D ~DRM_BUDDY_HEADER_CLEAR;
+}
+
 int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
=20
 void drm_buddy_fini(struct drm_buddy *mm);
=2D-=20
2.49.0

