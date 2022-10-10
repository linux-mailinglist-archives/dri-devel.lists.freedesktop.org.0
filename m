Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B39325F9497
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65E510E608;
	Sun,  9 Oct 2022 23:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC27E10E5FA
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 23:57:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48C17B80DDF;
 Sun,  9 Oct 2022 23:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99ACC433D6;
 Sun,  9 Oct 2022 23:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359869;
 bh=n5ji/6Rvcj9gwglRBVe1y6EZQDOybbfeuTH2XpQ1AzA=;
 h=From:To:Cc:Subject:Date:From;
 b=kdmzkt/WkD1sqjPqSWGCOMlc/LIrGKvKwHMrz9DnNRx9NI2rrjEWa5hImBa0kqNX8
 Eb/LkDqQLCD79jAED+e8xwaudwir27REmPhYDr79n9BlfD217+NlsQBZHJ193njLTs
 R8cv0AHV2Dd+TbGe6FVrG66dBx3XSZWIHxb0mKCjOMcW+fx71/PSQIQ+8F+8VA7JjL
 rvnfU9Qlq9/tAKebrt+DlCmjHGffQ76SeYN/d48Hhwzt2LbvnhugdDO5bTMaIzafZ/
 ieCAVHP/mu1fSbbIQWBOe6y68LFezziLF5Ff+cACtYt/SDslApDT9Sw09NgUVGOsJ/
 UHvp29YvNEXPg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 01/10] drm: Use size_t type for len variable in
 drm_copy_field()
Date: Sun,  9 Oct 2022 19:57:36 -0400
Message-Id: <20221009235746.1232129-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Javier Martinez Canillas <javierm@redhat.com>

[ Upstream commit 94dc3471d1b2b58b3728558d0e3f264e9ce6ff59 ]

The strlen() function returns a size_t which is an unsigned int on 32-bit
arches and an unsigned long on 64-bit arches. But in the drm_copy_field()
function, the strlen() return value is assigned to an 'int len' variable.

Later, the len variable is passed as copy_from_user() third argument that
is an unsigned long parameter as well.

In theory, this can lead to an integer overflow via type conversion. Since
the assignment happens to a signed int lvalue instead of a size_t lvalue.

In practice though, that's unlikely since the values copied are set by DRM
drivers and not controlled by userspace. But using a size_t for len is the
correct thing to do anyways.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Peter Robinson <pbrobinson@gmail.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20220705100215.572498-2-javierm@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index babd7ebabfef..4fea6519510c 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -458,7 +458,7 @@ EXPORT_SYMBOL(drm_invalid_op);
  */
 static int drm_copy_field(char __user *buf, size_t *buf_len, const char *value)
 {
-	int len;
+	size_t len;
 
 	/* don't overflow userbuf */
 	len = strlen(value);
-- 
2.35.1

