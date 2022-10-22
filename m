Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F92608418
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 06:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFB310E6C3;
	Sat, 22 Oct 2022 04:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2768B10E6C4
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 04:02:54 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 88A4E33EF4C;
 Sat, 22 Oct 2022 05:02:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666411373; bh=vcSO2EbH20HCdqsuofWiObsv/kQLnZlQYVS8ig80Ys8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sxgmpyx7wf36pX+Msr9IE6jfeET7HpUrgTvUc07MVKNLbYwb3a+zbCljV+rwzD4oR
 eL4mnPvbaqHJYF3L7QzVM59sZdCLg2vPF/9fPr5Jpp+YnIK0kcoUAGI+uMfOCbq4VF
 voMltXaub1WTAUKr33OgdqPa3TUqBfnfz6wIOAdAiiyWakeUEvovSX+JgwUyQLo3oC
 xIYV/y95RXho/2+sFduwI+IJXV9PSxPXqGrE8iL5nEoAGV3UCeyTutyk5Jl1X9hlOJ
 H9fOLCu+BjEBY9AwjRErEJlohuZqhcssPmCEhz8auimLR0Pu4CyGiB9ITam91EgUYE
 xQNAYjemorhAw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 17/17] drm/vmwgfx: Fix a sparse warning in kernel docs
Date: Sat, 22 Oct 2022 00:02:36 -0400
Message-Id: <20221022040236.616490-18-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022040236.616490-1-zack@kde.org>
References: <20221022040236.616490-1-zack@kde.org>
MIME-Version: 1.0
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Fixes a warning about extra docs about a function argument that has been
removed a while back:
drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3888: warning: Excess function
parameter 'sync_file' description in 'vmw_execbuf_copy_fence_user'

Fixes: a0f90c881570 ("drm/vmwgfx: Fix stale file descriptors on failed usercopy")
Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index c943ab801ca7..f16fc489d725 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3869,7 +3869,6 @@ int vmw_execbuf_fence_commands(struct drm_file *file_priv,
  * @fence: Pointer to the fenc object.
  * @fence_handle: User-space fence handle.
  * @out_fence_fd: exported file descriptor for the fence.  -1 if not used
- * @sync_file:  Only used to clean up in case of an error in this function.
  *
  * This function copies fence information to user-space. If copying fails, the
  * user-space struct drm_vmw_fence_rep::error member is hopefully left
-- 
2.34.1

