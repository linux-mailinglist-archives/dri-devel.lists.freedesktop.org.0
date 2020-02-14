Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB0C15E2CE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3F86FB4E;
	Fri, 14 Feb 2020 16:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27236FB41;
 Fri, 14 Feb 2020 16:25:03 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D99E4247BB;
 Fri, 14 Feb 2020 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697503;
 bh=OqRDeRlX+IAv6W8erFXbrQR5rqfXbunl1DBHEJjERnM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FSIm9a6MssAxdWx4b7c0SpBrrRLDShLQpdJ7WKeV7gYSUMXly2TMXXWX7Y1bMkwx0
 ht0Yi0iIz7htIsI+VUZVde5qN7dv4D2qOZ+cdkISXi0e5Ic/yZdClu0FSg+YTIcTei
 5ZrFIp75RTtJPhIgfSh3uk19u7iz6tgL6L94bbz0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 031/100] drm/radeon: remove set but not used
 variable 'size', 'relocs_chunk'
Date: Fri, 14 Feb 2020 11:23:15 -0500
Message-Id: <20200214162425.21071-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214162425.21071-1-sashal@kernel.org>
References: <20200214162425.21071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 zhengbin <zhengbin13@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

[ Upstream commit e9f782dd22c0e17874b8b8e12aafcd3a06810dd0 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/radeon/r600_cs.c: In function r600_cs_track_validate_cb:
drivers/gpu/drm/radeon/r600_cs.c:353:22: warning: variable size set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/radeon/r600_cs.c: In function r600_cs_track_validate_db:
drivers/gpu/drm/radeon/r600_cs.c:520:27: warning: variable size set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/radeon/r600_cs.c: In function r600_dma_cs_next_reloc:
drivers/gpu/drm/radeon/r600_cs.c:2345:26: warning: variable relocs_chunk set but not used [-Wunused-but-set-variable]

The first 'size' is not used since commit f30df2fad0c9 ("drm/radeon/r600:
fix tiling issues in CS checker.")

The second 'size' is introduced by commit 88f50c80748b ("drm/radeon/kms:
add htile support to the cs checker v3"), but never used, so remove it.

'relocs_chunk' is not used since commit 9305ede6afe2 ("radeon/kms:
fix dma relocation checking")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/r600_cs.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
index acc1f99c84d99..5a0e751dbe962 100644
--- a/drivers/gpu/drm/radeon/r600_cs.c
+++ b/drivers/gpu/drm/radeon/r600_cs.c
@@ -349,7 +349,7 @@ static void r600_cs_track_init(struct r600_cs_track *track)
 static int r600_cs_track_validate_cb(struct radeon_cs_parser *p, int i)
 {
 	struct r600_cs_track *track = p->track;
-	u32 slice_tile_max, size, tmp;
+	u32 slice_tile_max, tmp;
 	u32 height, height_align, pitch, pitch_align, depth_align;
 	u64 base_offset, base_align;
 	struct array_mode_checker array_check;
@@ -359,7 +359,6 @@ static int r600_cs_track_validate_cb(struct radeon_cs_parser *p, int i)
 	/* When resolve is used, the second colorbuffer has always 1 sample. */
 	unsigned nsamples = track->is_resolve && i == 1 ? 1 : track->nsamples;
 
-	size = radeon_bo_size(track->cb_color_bo[i]) - track->cb_color_bo_offset[i];
 	format = G_0280A0_FORMAT(track->cb_color_info[i]);
 	if (!r600_fmt_is_valid_color(format)) {
 		dev_warn(p->dev, "%s:%d cb invalid format %d for %d (0x%08X)\n",
@@ -516,7 +515,7 @@ static int r600_cs_track_validate_cb(struct radeon_cs_parser *p, int i)
 static int r600_cs_track_validate_db(struct radeon_cs_parser *p)
 {
 	struct r600_cs_track *track = p->track;
-	u32 nviews, bpe, ntiles, size, slice_tile_max, tmp;
+	u32 nviews, bpe, ntiles, slice_tile_max, tmp;
 	u32 height_align, pitch_align, depth_align;
 	u32 pitch = 8192;
 	u32 height = 8192;
@@ -563,7 +562,6 @@ static int r600_cs_track_validate_db(struct radeon_cs_parser *p)
 		}
 		ib[track->db_depth_size_idx] = S_028000_SLICE_TILE_MAX(tmp - 1) | (track->db_depth_size & 0x3FF);
 	} else {
-		size = radeon_bo_size(track->db_bo);
 		/* pitch in pixels */
 		pitch = (G_028000_PITCH_TILE_MAX(track->db_depth_size) + 1) * 8;
 		slice_tile_max = G_028000_SLICE_TILE_MAX(track->db_depth_size) + 1;
@@ -2437,7 +2435,6 @@ void r600_cs_legacy_init(void)
 int r600_dma_cs_next_reloc(struct radeon_cs_parser *p,
 			   struct radeon_bo_list **cs_reloc)
 {
-	struct radeon_cs_chunk *relocs_chunk;
 	unsigned idx;
 
 	*cs_reloc = NULL;
@@ -2445,7 +2442,6 @@ int r600_dma_cs_next_reloc(struct radeon_cs_parser *p,
 		DRM_ERROR("No relocation chunk !\n");
 		return -EINVAL;
 	}
-	relocs_chunk = p->chunk_relocs;
 	idx = p->dma_reloc_idx;
 	if (idx >= p->nrelocs) {
 		DRM_ERROR("Relocs at %d after relocations chunk end %d !\n",
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
