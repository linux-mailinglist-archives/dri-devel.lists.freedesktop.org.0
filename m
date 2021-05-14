Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018993812E4
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF486E221;
	Fri, 14 May 2021 21:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A402B6E221
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 21:34:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D10E6143F;
 Fri, 14 May 2021 21:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621028046;
 bh=hJes5fVwFMyBeanoe97q1M/H0pXkUh5gZ9KDWMORWxE=;
 h=From:To:Cc:Subject:Date:From;
 b=cU1uvUz4dnLZFAGf0hBvsDMANh2A6Nn29EdaIlH2ApxigmLn5llJ2MOYkOge9CLiM
 DktbmKF0dGNg+xjxBwE/9nP4x3sxxyLiC2UoS6JsyewiIlBeIAQEDIDTf6RHkWbBrn
 gxiY3BwLVI7/kd8MdCaFARy4NR29rIYihzGAG3DXSUL/DXqhSdGvvOdbEKyvVL3zKh
 jq1Jh5+G5gRKCeYwqRHj562jd6FOOyEBq9GUgsD8h3n+S6Nwl3nUQp+boAdzMOwwZq
 WFqjZmp+YEqZs0gmwyzPn+34UkaOLtDznl44dXJprpQ/g5+r4B7io7jbWpAzSFMkJh
 fSd9/V+anuz3g==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: matrox: use modern module_init()
Date: Fri, 14 May 2021 23:33:05 +0200
Message-Id: <20210514213316.635070-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

This is one of the last drivers with a global init_module() function
instead of the modern module_init() annotation. Convert it over.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/matrox/matroxfb_base.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index 4325bf7f388c..5c82611e93d9 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -2486,8 +2486,6 @@ static int __init matroxfb_init(void)
 	return err;
 }
 
-module_init(matroxfb_init);
-
 #else
 
 /* *************************** init module code **************************** */
@@ -2572,7 +2570,7 @@ module_param_named(cmode, default_cmode, int, 0);
 MODULE_PARM_DESC(cmode, "Specify the video depth that should be used (8bit default)");
 #endif
 
-int __init init_module(void){
+static int __init matroxfb_init(void){
 
 	DBG(__func__)
 
@@ -2603,6 +2601,7 @@ int __init init_module(void){
 }
 #endif	/* MODULE */
 
+module_init(matroxfb_init);
 module_exit(matrox_done);
 EXPORT_SYMBOL(matroxfb_register_driver);
 EXPORT_SYMBOL(matroxfb_unregister_driver);
-- 
2.29.2

