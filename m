Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC2F2CEAE8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 10:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3F76E139;
	Fri,  4 Dec 2020 09:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD106E139
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 09:29:41 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9383D99A;
 Fri,  4 Dec 2020 10:29:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607074179;
 bh=RdAXtZge9rGj73tsM/ubtpR79jwDRaH4G+IBQZ+6OPA=;
 h=From:To:Cc:Subject:Date:From;
 b=g8f9gX55IYCIUJ4ACggOEb1ROLLbikM1K5IzCwA/43y2P3rmn0Ya176lWj9KLRnFa
 DPNuBCifDmxagdRa13/j57IpMGDxytTDYepx7ZUWCvb+HtEMnGVB5cClnMb8EI0ppp
 kaPMeYNiHHlY7XxXZalhxOGb/sFzgfM25smXHWOY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Remove drmm_add_final_kfree() declaration from public
 headers
Date: Fri,  4 Dec 2020 11:29:32 +0200
Message-Id: <20201204092932.21636-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drmm_add_final_kfree() function is declared in the
include/drm/drm_managed.h public header, but has become an internal API
not exposed to drivers. Drop it from drm_managed.h as it's already
declared in drm_internal.h.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/drm/drm_managed.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index ca4114633bf9..b45c6fbf53ac 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -44,8 +44,6 @@ int __must_check __drmm_add_action_or_reset(struct drm_device *dev,
 					    drmres_release_t action,
 					    void *data, const char *name);
 
-void drmm_add_final_kfree(struct drm_device *dev, void *container);
-
 void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
 
 /**
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
