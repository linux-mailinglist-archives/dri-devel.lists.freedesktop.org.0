Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551C7AF7896
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 16:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCF810E141;
	Thu,  3 Jul 2025 14:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uC6UZPRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4408310E141
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 14:51:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DA851436E4;
 Thu,  3 Jul 2025 14:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D11C4CEE3;
 Thu,  3 Jul 2025 14:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751554317;
 bh=6lgh4b0rr5pqpOWKdnkeRkdXMdBwVrgwFtbkk3fP1m4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uC6UZPRdb8qPDk/Nu9Wu72DxPOcgfvFUf7tW+4a/AZ7cf1JvO9Nj/gux2VLAhjhkx
 QEGvzVpQEWa5IM/W3YC8/qC184JsTGMKwzhds5J9zsyTIg8SAlfpgR0hGlnE76aB+l
 ybsBHhjQLXvKdNCdDyM+unU4bUprdh4l+4KITOW8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 6.12 148/218] drm/ast: Fix comment on modeset lock
Date: Thu,  3 Jul 2025 16:41:36 +0200
Message-ID: <20250703144002.059245614@linuxfoundation.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703143955.956569535@linuxfoundation.org>
References: <20250703143955.956569535@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 7cce65f3789e04c0f7668a66563e680d81d54493 upstream.

The ast driver protects the commit tail against concurrent reads
of the display modes by acquiring a lock. The comment is misleading
as the lock is not released in atomic_flush, but at the end of the
commit-tail helper. Rewrite the comment.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 1fe182154984 ("drm/ast: Acquire I/O-register lock in atomic_commit_tail function")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.2+
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Link: https://lore.kernel.org/r/20250324094520.192974-2-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_mode.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1319,9 +1319,9 @@ static void ast_mode_config_helper_atomi
 
 	/*
 	 * Concurrent operations could possibly trigger a call to
-	 * drm_connector_helper_funcs.get_modes by trying to read the
-	 * display modes. Protect access to I/O registers by acquiring
-	 * the I/O-register lock. Released in atomic_flush().
+	 * drm_connector_helper_funcs.get_modes by reading the display
+	 * modes. Protect access to registers by acquiring the modeset
+	 * lock.
 	 */
 	mutex_lock(&ast->modeset_lock);
 	drm_atomic_helper_commit_tail(state);


