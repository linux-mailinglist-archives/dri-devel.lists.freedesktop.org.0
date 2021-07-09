Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8513C2A42
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 22:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F07C6EA85;
	Fri,  9 Jul 2021 20:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Fri, 09 Jul 2021 20:22:28 UTC
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410306EA85
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 20:22:28 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A8+oOA60Yl+PvqM5LTFr2bgqjBKskLtp133Aq?=
 =?us-ascii?q?2lEZdPWaSKGlfqeV7ZcmPHDP5wr5NEtKpTniAsm9qA3nm6KdiLN5VYtKNzOLhI?=
 =?us-ascii?q?LHFutfBPPZogHdJw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.84,227,1620684000"; d="scan'208";a="387621753"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-SHA;
 09 Jul 2021 22:15:15 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/of: free the right object
Date: Fri,  9 Jul 2021 22:07:17 +0200
Message-Id: <20210709200717.3676376-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.25.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to free a NULL value.  Instead, free the object
that is leaking due to the iterator.

The semantic patch that finds this problem is as follows:

// <smpl>
@@
expression x,e;
identifier f;
@@
 x = f(...);
 if (x == NULL) {
	... when any
	    when != x = e
*	of_node_put(x);
	...
 }
// </smpl>

Fixes: 6529007522de ("drm: of: Add drm_of_lvds_get_dual_link_pixel_order")
Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/drm_of.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index ca04c34e8251..197c57477344 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -315,7 +315,7 @@ static int drm_of_lvds_get_remote_pixels_type(
 
 		remote_port = of_graph_get_remote_port(endpoint);
 		if (!remote_port) {
-			of_node_put(remote_port);
+			of_node_put(endpoint);
 			return -EPIPE;
 		}
 

