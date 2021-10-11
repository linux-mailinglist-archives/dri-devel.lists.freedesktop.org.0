Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3489842883B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 10:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63266E43B;
	Mon, 11 Oct 2021 08:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F19F6E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 08:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=zw5H1GolSJlAJnSqiGkDvpToHiUTjs8D4PJCKCb2xv0=; b=gj03Y6mMO/cTC4AqUK5u9f0iuY
 IdPuCbi9rkI7dVCc2d51TDP8jm7f8tXB+RqnCe/pGlGwhyEQXjtPOXLKwVN6lSqtN19XWQ4NFrYrz
 hEcCwRXMOFGFo2+9PdP3FImId7kxM+/9AyyMH92qW++1wvNn7d0vhk1ayVg71P0C8m2qsWAjWlj5F
 nPt6Zah1QmR5BX3kkxwBGk0JwnoTenIRZTrVphUSchQ2GGNhYROyOvZaLD8zZh0ceEKok8zefmXeL
 bnayIZcBA5NUi5bNNZ6umU8Vawf7oIqcy6FsOC9qkH+ZN8OmxdlDwSYwQB1hYSUxu2mIx3mjePs11
 fo+NFOTQ==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZqEB-008Czv-Hn; Mon, 11 Oct 2021 08:00:07 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-um@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2] drm/r128: fix build for UML
Date: Mon, 11 Oct 2021 01:00:06 -0700
Message-Id: <20211011080006.31081-1-rdunlap@infradead.org>
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

Fixes: 68f5d3f3b654 ("um: add PCI over virtio emulation driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: linux-um@lists.infradead.org
Cc: Sam Ravnborg <sam@ravnborg.org>
---
v2: update Fixes: tag (Johannes)
    Use simple CONFIG_X86 instead of a more complicated expression. (Sam)

 drivers/gpu/drm/r128/ati_pcigart.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20211007.orig/drivers/gpu/drm/r128/ati_pcigart.c
+++ linux-next-20211007/drivers/gpu/drm/r128/ati_pcigart.c
@@ -215,7 +215,7 @@ int drm_ati_pcigart_init(struct drm_devi
 	}
 	ret = 0;
 
-#if defined(__i386__) || defined(__x86_64__)
+#ifdef CONFIG_X86
 	wbinvd();
 #else
 	mb();
