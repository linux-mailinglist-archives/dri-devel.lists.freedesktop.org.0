Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5087313BD3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 18:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5197A6E985;
	Mon,  8 Feb 2021 17:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11666E985;
 Mon,  8 Feb 2021 17:58:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94C9964EC7;
 Mon,  8 Feb 2021 17:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612807118;
 bh=QG+IXIvC27Sf/5lk1f9hJH/eFsjq66BiJ8/ljnlbw+s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iigNBqweQ2kDBpGMvj7p4mzcuwZrrTYo6YQT9nDGHF31jh1b/f6DL3qlCuKutpfU7
 Ll6/ltJrtCH5lGndE4UG9NFJe0WmSOSqPwqAEl3q7r9TMPReBh159L5RQvh7gywz6o
 Sjd73wiZBNzwCP4OJ9LMrEKOvHQcGkpUrYZBaW37hK9KEt0+YMBwyAM3wv7zms1XoO
 FN2EnpzbJ/4o3KKsh20BsGy++4pVzeRlxaj5Po1vkWW+nH78nEfyuZwqfTvL3dNayo
 RD5GVgCzW1vacpwQITnI6adfrkQOWZ6NpRyeqbCDtqJ4oiI+qh9pmRn/2dfm7qv9fG
 kIAw54A35Al8g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 23/36] drm/amd/display: Fix dc_sink kref count in
 emulated_link_detect
Date: Mon,  8 Feb 2021 12:57:53 -0500
Message-Id: <20210208175806.2091668-23-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210208175806.2091668-1-sashal@kernel.org>
References: <20210208175806.2091668-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Anson Jacob <Anson.Jacob@amd.com>,
 amd-gfx@lists.freedesktop.org, Victor Lu <victorchengchi.lu@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Victor Lu <victorchengchi.lu@amd.com>

[ Upstream commit 3ddc818d9bb877c64f5c649beab97af86c403702 ]

[why]
prev_sink is not used anywhere else in the function and the reference to
it from dc_link is replaced with a new dc_sink.

[how]
Change dc_sink_retain(prev_sink) to dc_sink_release(prev_sink).

Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Anson Jacob <Anson.Jacob@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0f7749e9424d4..f1fea71a7073c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1792,8 +1792,8 @@ static void emulated_link_detect(struct dc_link *link)
 	link->type = dc_connection_none;
 	prev_sink = link->local_sink;
 
-	if (prev_sink != NULL)
-		dc_sink_retain(prev_sink);
+	if (prev_sink)
+		dc_sink_release(prev_sink);
 
 	switch (link->connector_signal) {
 	case SIGNAL_TYPE_HDMI_TYPE_A: {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
