Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E4417B7F3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDA26EC8E;
	Fri,  6 Mar 2020 08:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997596EC49
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 01:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=IM09bFbw6S6+4rViw6K0nGdpnibTrR4TbK4+sNqEqaE=; b=ap2KuNpTbN4wNm2smPXvg8YbIC
 vdyY8aGhH9unHqXeICUoT2h+XOA7GvY3doIkQeJI0mb8ra8bwcc0upvOCigEgqssNzCdP96S9q/cv
 un5ttP0FFsLgChnZ0PMbEdyKdGF+kO45lDaDj15jaHpWNHn7VU0dPgC86MjpRdVd3LfxgfejoS6WF
 5GU52FbqMXnjBDAB6stdsEbSGavDiA9CdQ9Xe0wUvIrjSBh3EGWMBwZH1WjJ+C4WDNOnYtdkISt0+
 c35dMt2YmVv/tDeqQBqEHY99BKe5EZw23ozqcW/BmWR9l+mmpXAdItVamP7wz2d6zjD/IV+vLKJFY
 HyGueXQg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA1kg-0007Xt-Pa; Fri, 06 Mar 2020 01:26:10 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie
 <airlied@redhat.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] drm: unbreak the DRM menu, broken by DRM_EXPORT_FOR_TESTS
Message-ID: <04221997-79ba-f8a2-4f2d-3c3d9f5219bc@infradead.org>
Date: Thu, 5 Mar 2020 17:26:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

Unbreak the DRM menu. This Kconfig symbol does not depend on DRM,
so the menu is broken at that point.

Move the symbol to a location in the Kconfig file so that it does
not break the dependency continuity.

Fixes: 6349120ddcbf ("drm: Move EXPORT_SYMBOL_FOR_TESTS_ONLY under a separate Kconfig")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/Kconfig |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20200305.orig/drivers/gpu/drm/Kconfig
+++ linux-next-20200305/drivers/gpu/drm/Kconfig
@@ -54,9 +54,6 @@ config DRM_DEBUG_MM
 
 	  If in doubt, say "N".
 
-config DRM_EXPORT_FOR_TESTS
-	bool
-
 config DRM_DEBUG_SELFTEST
 	tristate "kselftests for DRM"
 	depends on DRM
@@ -470,6 +467,9 @@ config DRM_SAVAGE
 
 endif # DRM_LEGACY
 
+config DRM_EXPORT_FOR_TESTS
+	bool
+
 # Separate option because drm_panel_orientation_quirks.c is shared with fbdev
 config DRM_PANEL_ORIENTATION_QUIRKS
 	tristate

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
