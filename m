Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FFE94AB45
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 17:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A808910E56C;
	Wed,  7 Aug 2024 15:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nxu7k2Sz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9F310E56C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 15:05:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4DB71CE1028;
 Wed,  7 Aug 2024 15:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353F5C32781;
 Wed,  7 Aug 2024 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1723043113;
 bh=QTE33PFHVpBvJ9sQy/voY3iMwTiKCECkn0humdTieGE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nxu7k2SzfFyTRTojNTGEZJhDN67pez+CRjM03JPfFkabIRwKogXjfneFnun44fIIA
 foVuIN7gc+ydkC6cn2JcH2+PllaLZZzSERHrFj4TIq/6OK25XU/zkRxQDkP+xeCWg+
 gkUsuY9+ap85C+2RMvCitIVVAHIidT+OyNTfl7lg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Cary Garrett <cogarre@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Jammy Huang <jammy_huang@aspeedtech.com>
Subject: [PATCH 6.10 094/123] drm/ast: Fix black screen after resume
Date: Wed,  7 Aug 2024 17:00:13 +0200
Message-ID: <20240807150023.869690975@linuxfoundation.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807150020.790615758@linuxfoundation.org>
References: <20240807150020.790615758@linuxfoundation.org>
User-Agent: quilt/0.67
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

6.10-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jammy Huang <jammy_huang@aspeedtech.com>

commit 12c35c5582acb0fd8f7713ffa75f450766022ff1 upstream.

Suspend will disable pcie device. Thus, resume should do full hw
initialization again.
Add some APIs to ast_drm_thaw() before ast_post_gpu() to fix the issue.

v2:
- fix function-call arguments

Fixes: 5b71707dd13c ("drm/ast: Enable and unlock device access early during init")
Reported-by: Cary Garrett <cogarre@gmail.com>
Closes: https://lore.kernel.org/dri-devel/8ce1e1cc351153a890b65e62fed93b54ccd43f6a.camel@gmail.com/
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.6+
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20240718030352.654155-1-jammy_huang@aspeedtech.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_drv.c |    5 +++++
 1 file changed, 5 insertions(+)

--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -391,6 +391,11 @@ static int ast_drm_freeze(struct drm_dev
 
 static int ast_drm_thaw(struct drm_device *dev)
 {
+	struct ast_device *ast = to_ast_device(dev);
+
+	ast_enable_vga(ast->ioregs);
+	ast_open_key(ast->ioregs);
+	ast_enable_mmio(dev->dev, ast->ioregs);
 	ast_post_gpu(dev);
 
 	return drm_mode_config_helper_resume(dev);


