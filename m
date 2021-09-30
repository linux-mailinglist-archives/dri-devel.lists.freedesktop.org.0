Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC1E41DEE7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 18:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE186EC0A;
	Thu, 30 Sep 2021 16:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09ED6EC09;
 Thu, 30 Sep 2021 16:23:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0D3C61139;
 Thu, 30 Sep 2021 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633019028;
 bh=SFAuczdPhuuWJXLs0XfQ/hIiVtLdDPdd1uYoA5KobTw=;
 h=From:To:Cc:Subject:Date:From;
 b=t630z/tBR0JsvcDkaupuV6XlaWMEW+/eHqaJUiVwvD83oi7YkijX9RN+M1o+yJ5bG
 ziAJANnhmGQaXAlrigMwECfvl+E9hk/uV6sqO8EagLzYN60qIWNFQ93rdFJ2lds7Hj
 IssDWkkngoQgSVTzeAD3bej+vrLPM07TcDfCAQXipkOodUXqcr291Kb1ey0tMx/wJP
 f4ezOH2JT6+OFB/UnDhnrjrSQgVQYC+a8hsRKvcJfA84QvvxjTR2TNYM4no4CBPYgw
 xDjFVdXShUZSH8x1Wgs2bLHhMOZCPy/rcg1bBSPq+H+FOo4ZLPokMw28p6//9WZfMN
 C447b766TxUdQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] drm/amd: Return NULL instead of false in
 dcn201_acquire_idle_pipe_for_layer()
Date: Thu, 30 Sep 2021 09:23:03 -0700
Message-Id: <20210930162302.2344542-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.591.gddb1055343
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

Clang warns:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_resource.c:1017:10: error: expression which evaluates to zero treated as a null pointer constant of type 'struct pipe_ctx *' [-Werror,-Wnon-literal-null-conversion]
                return false;
                       ^~~~~
1 error generated.

Use NULL instead of false since the function is returning a pointer
rather than a boolean.

Fixes: ff7e396f822f ("drm/amd/display: add cyan_skillfish display support")
Link: https://github.com/ClangBuiltLinux/linux/issues/1470
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
index aec276e1db65..8523a048e6f6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
@@ -1014,7 +1014,7 @@ static struct pipe_ctx *dcn201_acquire_idle_pipe_for_layer(
 		ASSERT(0);
 
 	if (!idle_pipe)
-		return false;
+		return NULL;
 
 	idle_pipe->stream = head_pipe->stream;
 	idle_pipe->stream_res.tg = head_pipe->stream_res.tg;

base-commit: b47b99e30cca8906753c83205e8c6179045dd725
-- 
2.33.0.591.gddb1055343

