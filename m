Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8F75F9408
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D526310E576;
	Sun,  9 Oct 2022 23:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D207510E576;
 Sun,  9 Oct 2022 23:52:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A28B60CF5;
 Sun,  9 Oct 2022 23:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB013C433D7;
 Sun,  9 Oct 2022 23:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359539;
 bh=8xx7dW7w9Hf6jsPYX210o/WQY6j2NnjsOtVaClhmtGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DG5TjgTy3nhxnAuyMH5xKzLX4jsqKblbQx4gOFw9AsaQCk1OkNoxf9NwtmPPIyl2V
 SqH7h2E3MmWC04fDnIRJIeR5194DmIzt127x6V4GpY21Z2pr9emRD+31aDCn/s9pgW
 iJUITu4sXvltN1JeLqIOdQpRVwt0GheeaW3osUaxP6zMes2Pu4OltuXDpPX5puYk6/
 olqIwgHckkvT6QZ/p1i0J2A8aS9dEw6/Pe6Imtr6LJP3keq2D1aoqHCm2v8Jf2ZjWo
 M/Le/mPJ0kk4cuY5kemWXmgCBwmb0aoa120HHAl9JWeNF8u09z6ePQw+NFHswodi1P
 fiPBfXhW+DiSw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 43/44] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback()
Date: Sun,  9 Oct 2022 19:49:31 -0400
Message-Id: <20221009234932.1230196-43-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009234932.1230196-1-sashal@kernel.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 sunpeng.li@amd.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, hersenwu@amd.com, alex.hung@amd.com,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, paul.hsieh@amd.com,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, hanghong.ma@amd.com,
 Pavle.Kotarac@amd.com, christian.koenig@amd.com, Jimmy.Kizito@amd.com,
 Alvin.Lee2@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hamza Mahfooz <hamza.mahfooz@amd.com>

[ Upstream commit 5d8c3e836fc224dfe633e41f7f2856753b39a905 ]

Address the following error:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function ‘dc_stream_remove_writeback’:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: error: array subscript [0, 0] is outside array bounds of ‘struct dc_writeback_info[1]’ [-Werror=array-bounds]
  527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
      |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
                 from ./drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
                 from ./drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing ‘writeback_info’
  241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
      |

Currently, we aren't checking to see if j remains within
writeback_info[]'s bounds. So, add a check to make sure that we aren't
overflowing the buffer.

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 0c85ab5933b4..f0a8bd924f43 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -519,7 +519,7 @@ bool dc_stream_remove_writeback(struct dc *dc,
 	}
 
 	/* remove writeback info for disabled writeback pipes from stream */
-	for (i = 0, j = 0; i < stream->num_wb_info; i++) {
+	for (i = 0, j = 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i++) {
 		if (stream->writeback_info[i].wb_enabled) {
 			if (i != j)
 				/* trim the array */
-- 
2.35.1

