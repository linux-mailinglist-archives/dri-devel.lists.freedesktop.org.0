Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F4F7DDE48
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4B710E678;
	Wed,  1 Nov 2023 09:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7227D10E676
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 09:18:38 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44C9AE52;
 Wed,  1 Nov 2023 10:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698830300;
 bh=9o8g+vSUQSS3NMbFAfGUkXi52cmu6Vb3V663gNfc4iY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=p/T0QMM11m5z3vXdBLD95kfaCJDQgXUYH5Y18q6/1yRkfjNCHx0NLbSThIUxS7tU4
 n5Nt8UGErZQpNfl7nnGoYcP+aG5UNHdeH2wppHR5/vNDnl3h+kjgjYiDgE09SfbMga
 iEIgrs5XSnvSPf8iSJv9fEfZiJBSDXqhj+NATuO4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Nov 2023 11:17:41 +0200
Subject: [PATCH 04/10] drm/tidss: Move reset to the end of dispc_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231101-tidss-probe-v1-4-45149e0f9415@ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
In-Reply-To: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1363;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=9o8g+vSUQSS3NMbFAfGUkXi52cmu6Vb3V663gNfc4iY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlQhfmqKrrOflLOTzV3Rkv9Kbh/MN1PuuDm8/ON
 sPnotTWnrSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUIX5gAKCRD6PaqMvJYe
 9WbBD/4mv6KLlnj3Gja378NvTcc+TdWKrXms3LxA6LYYNBr9MZP8NrejQnGyZ2scbA9TseQaLKl
 xqtmW3v5E0vgnfbFCxnvRpSiMN5LFF49++VbMbNUR9OBmNhhAIVKDdRnqefYS3q4f1AHfHWXriV
 siw+rcnKIWQGXm7PHo4JqLA6SCXpYmzQfuHkplxtl8UBki8/HiX/PxsUmizmZfLlTRZ9E+6THwV
 A6Bc69316TyAu4A+n6rPZqlEnVqZc5qzQZLndYj1/39Smem4725r1nE7jtsjPuKV2H0NgEinXQi
 qU+F9mA8H2KkiIwipJ4VyXgsjJCI+mRrsfPCeLDYwsF6sUX1O22/Na84WPcfZxrIaah6hvGejl2
 ooEtZWgv5kqzRvw8A1hzsdSHwhikoKrYWu+vAFrKuRGRcvoJVJvvusoQUwOsMbg6f/n2yxJVMGd
 B3m7pIw3P5gzug99n3Je2D+KRpe9pfsMwWkqfO21Elw5xsrhhfDTuFeCbjxyQU7i54W3b1aak/i
 vYF+fOJYdx39Ld3wUzYz2+aJ1P7/OSZLb2gwBgYusMPb3e1lleR491ykd2XgM/w3hih3KZjDoYA
 fjuUhfMR6SJnmnPbGQ+U5qNsfPdevqyjfvtNjlvk2ideK0ZJxRaqF8rAduvr+VsLOSonkJo0R97
 cm0/hvJnAwW77sg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We do a DSS reset in the middle of the dispc_init(). While that happens
to work now, we should really make sure that e..g the fclk, which is
acquired only later in the function, is enabled when doing a reset. This
will be handled in a later patch, but for now, let's move the
dispc_softreset() call to the end of dispc_init(), which is a sensible
place for it anyway.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index ad7999434299..9430625e2d62 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2777,10 +2777,6 @@ int dispc_init(struct tidss_device *tidss)
 			return r;
 	}
 
-	/* K2G display controller does not support soft reset */
-	if (feat->subrev != DISPC_K2G)
-		dispc_softreset(dispc);
-
 	for (i = 0; i < dispc->feat->num_vps; i++) {
 		u32 gamma_size = dispc->feat->vp_feat.color.gamma_size;
 		u32 *gamma_table;
@@ -2831,5 +2827,9 @@ int dispc_init(struct tidss_device *tidss)
 
 	tidss->dispc = dispc;
 
+	/* K2G display controller does not support soft reset */
+	if (feat->subrev != DISPC_K2G)
+		dispc_softreset(dispc);
+
 	return 0;
 }

-- 
2.34.1

