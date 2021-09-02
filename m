Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B653FE782
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 04:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0267A6E413;
	Thu,  2 Sep 2021 02:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964FC6E413
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 02:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=mequYaOSC8flI66LQgtrrKi6Dh4jUXB1i7lEFHYul5o=; b=dLOW0jSHug5ohyKzJC83Hc1+J3
 5ZV4XGai8OxJqDtw9LwtoqW0XqUsB5MMmwk9K/FuheA9TqrWXrsY25xeE3qvuPc+asIPlhPfthQBP
 EC2ErdwoTlDg+VR2MHnrzi3yBtqiMo3ux1vGjIMznPAADcjeB390zI/NJNSODWpNlHG3KxXsnFk1k
 GmIDYccfXiCpZidr5Rs7NpbYyIvXnEDXIT5ShpHsdF8nytXiu3qcb10RvX9QsRO75kW2g/gXw7XjE
 jzPQeJr+Zc44Q+jFO3VGJRBQ4xZ8qaBtye0waA+ektyM6XdxkpIsvHtbN440WM7FV571tUzcfm1Pi
 2EBVUgXw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLcI6-008BRB-8f; Thu, 02 Sep 2021 02:17:22 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-um@lists.infradead.org
Subject: [PATCH] drm/r128: fix build for UML
Date: Wed,  1 Sep 2021 19:17:21 -0700
Message-Id: <20210902021721.27274-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix a build error on CONFIG_UML, which does not support (provide)
wbinvd(). UML can use the generic mb() instead.

../drivers/gpu/drm/r128/ati_pcigart.c: In function ‘drm_ati_pcigart_init’:
../drivers/gpu/drm/r128/ati_pcigart.c:218:2: error: implicit declaration of function ‘wbinvd’ [-Werror=implicit-function-declaration]
  wbinvd();
  ^~~~~~

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") # pre-git
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: linux-um@lists.infradead.org
---
 drivers/gpu/drm/r128/ati_pcigart.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210901.orig/drivers/gpu/drm/r128/ati_pcigart.c
+++ linux-next-20210901/drivers/gpu/drm/r128/ati_pcigart.c
@@ -214,7 +214,7 @@ int drm_ati_pcigart_init(struct drm_devi
 	}
 	ret = 0;
 
-#if defined(__i386__) || defined(__x86_64__)
+#if (defined(__i386__) || defined(__x86_64__)) && !defined(CONFIG_UML)
 	wbinvd();
 #else
 	mb();
