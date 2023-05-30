Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97544716696
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 17:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B57610E3CA;
	Tue, 30 May 2023 15:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5CD10E39E;
 Tue, 30 May 2023 15:12:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CE88821A8B;
 Tue, 30 May 2023 15:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685459550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGZcPjI3AiQUELBGwNSCUMdtE0mmX+tRT45kZe/lzdU=;
 b=DNTq0Oin/gdVk4B8tf0mjdtJwjwYlprGkrRlwweyKcxQq5FOmaNgaOQABgFQvSUXdziGFO
 hAaD4+Hyg7OwHU/o8+0tIke+pOcvWB16P6TIcJp0tn44ur77if/dVBsm8ZQZnSPwFA8K48
 wxLwU/w7FuLpJYuUyw7PesNH/r3MW+M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685459550;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGZcPjI3AiQUELBGwNSCUMdtE0mmX+tRT45kZe/lzdU=;
 b=TRRM4HLhUVo4G/3b0AZZBvOtsuWdOjz4Grz+6exgrJId2pumsoN+VsKy68JIqtOp39ncUx
 bM8Ek4pLDKR3xADA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A89513A21;
 Tue, 30 May 2023 15:12:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OE74HF4SdmRjAQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 30 May 2023 15:12:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org,
 suijingfeng@loongson.cn
Subject: [PATCH v5 01/13] fbdev: Add Kconfig options to select different
 fb_ops helpers
Date: Tue, 30 May 2023 17:12:16 +0200
Message-Id: <20230530151228.22979-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530151228.22979-1-tzimmermann@suse.de>
References: <20230530151228.22979-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Many fbdev drivers use the same set of fb_ops helpers. Add Kconfig
options to select them at once. This will help with making DRM's
fbdev emulation code more modular, but can also be used to simplify
fbdev's driver configs.

v3:
	* fix select statement (Jingfeng)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/Kconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index e8889035c882..6df9bd09454a 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -158,6 +158,27 @@ config FB_DEFERRED_IO
 	bool
 	depends on FB
 
+config FB_IO_HELPERS
+	bool
+	depends on FB
+	select FB_CFB_COPYAREA
+	select FB_CFB_FILLRECT
+	select FB_CFB_IMAGEBLIT
+
+config FB_SYS_HELPERS
+	bool
+	depends on FB
+	select FB_SYS_COPYAREA
+	select FB_SYS_FILLRECT
+	select FB_SYS_FOPS
+	select FB_SYS_IMAGEBLIT
+
+config FB_SYS_HELPERS_DEFERRED
+	bool
+	depends on FB
+	select FB_DEFERRED_IO
+	select FB_SYS_HELPERS
+
 config FB_HECUBA
 	tristate
 	depends on FB
-- 
2.40.1

