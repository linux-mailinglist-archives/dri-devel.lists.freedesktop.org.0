Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD0969E413
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 16:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC0510E340;
	Tue, 21 Feb 2023 15:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F85C10E326
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 15:57:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 49BB35C9AE;
 Tue, 21 Feb 2023 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676995067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4s6dT0ypSpodnB9LR7bc49rr697voco+xpo/d7vfcw=;
 b=CnxCxxrH5Dz9NZPJBzK0e9+J1oUqfld8I0vt1zME69BRWCsttArsEShYd7ENGmFY6nDy60
 z8b4c5JMxUoN9mw9m/N3ZNpi8ShJ3L6xSiDrJimDGBgs8v2ScbtZMcM5MGQSGk1y/EYJNM
 LsyW96jhATzomhOl39OFcljWcu7MEBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676995067;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4s6dT0ypSpodnB9LR7bc49rr697voco+xpo/d7vfcw=;
 b=oQqgCWBrr0OJ7I3isnr1esug7DxKFZtQYyG2nWua0UnBQhLXkKo3ruEr3vHJPqZDobMd74
 jqVMvuuVDcTG8KAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 27E0913A39;
 Tue, 21 Feb 2023 15:57:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oNjnCPvp9GNOBgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Feb 2023 15:57:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 1/4] drm/ast: Remove little-endianism from I/O helpers
Date: Tue, 21 Feb 2023 16:57:42 +0100
Message-Id: <20230221155745.27484-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221155745.27484-1-tzimmermann@suse.de>
References: <20230221155745.27484-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace one call to ast_io_write16() with two calls to ast_io_write8()
in ast_set_index_reg(). The combined 16-bit-wide write of an index
register and the corresponding data register only works on little-
endian systems. Write both registers independent from each other.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index d51b81fea9c8..1f46162adb64 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -282,7 +282,9 @@ static inline void ast_set_index_reg(struct ast_private *ast,
 				     uint32_t base, uint8_t index,
 				     uint8_t val)
 {
-	ast_io_write16(ast, base, ((u16)val << 8) | index);
+	ast_io_write8(ast, base, index);
+	++base;
+	ast_io_write8(ast, base, val);
 }
 
 void ast_set_index_reg_mask(struct ast_private *ast,
-- 
2.39.2

