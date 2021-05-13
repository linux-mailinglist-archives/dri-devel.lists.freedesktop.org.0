Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9AC37F512
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 11:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEBE6E869;
	Thu, 13 May 2021 09:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9FD5D6E869
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 09:51:46 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id D505292009E; Thu, 13 May 2021 11:51:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id CCDBF92009B;
 Thu, 13 May 2021 11:51:45 +0200 (CEST)
Date: Thu, 13 May 2021 11:51:45 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v2 2/3] vt_ioctl: Revert VT_RESIZEX parameter handling removal
In-Reply-To: <alpine.DEB.2.21.2105131132100.3032@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2105131137130.3032@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2105131132100.3032@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-fbdev@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Hostettler <textshell@uchuujin.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Revert the removal of code handling extra VT_RESIZEX ioctl's parameters 
beyond those that VT_RESIZE supports, fixing a functional regression 
causing `svgatextmode' not to resize the VT anymore.  As a consequence 
of the reverted change when the video adapter is reprogrammed from the 
original say 80x25 text mode using a 9x16 character cell (720x400 pixel 
resolution) to say 80x37 text mode and the same character cell (720x592 
pixel resolution), the VT geometry does not get updated and only upper 
two thirds of the screen are used for the VT, and the lower part remains 
blank.  The proportions change according to text mode geometries chosen.

Revert the change verbatim then, bringing back previous VT resizing.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: 988d0763361b ("vt_ioctl: make VT_RESIZEX behave like VT_RESIZE")
Cc: stable@vger.kernel.org # v5.10+
---
No changes from v1.
---
 drivers/tty/vt/vt_ioctl.c |   57 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 10 deletions(-)

Index: linux-macro-ide/drivers/tty/vt/vt_ioctl.c
===================================================================
--- linux-macro-ide.orig/drivers/tty/vt/vt_ioctl.c
+++ linux-macro-ide/drivers/tty/vt/vt_ioctl.c
@@ -671,21 +671,58 @@ static int vt_resizex(struct vc_data *vc
 	if (copy_from_user(&v, cs, sizeof(struct vt_consize)))
 		return -EFAULT;
 
-	if (v.v_vlin)
-		pr_info_once("\"struct vt_consize\"->v_vlin is ignored. Please report if you need this.\n");
-	if (v.v_clin)
-		pr_info_once("\"struct vt_consize\"->v_clin is ignored. Please report if you need this.\n");
+	/* FIXME: Should check the copies properly */
+	if (!v.v_vlin)
+		v.v_vlin = vc->vc_scan_lines;
+
+	if (v.v_clin) {
+		int rows = v.v_vlin / v.v_clin;
+		if (v.v_rows != rows) {
+			if (v.v_rows) /* Parameters don't add up */
+				return -EINVAL;
+			v.v_rows = rows;
+		}
+	}
+
+	if (v.v_vcol && v.v_ccol) {
+		int cols = v.v_vcol / v.v_ccol;
+		if (v.v_cols != cols) {
+			if (v.v_cols)
+				return -EINVAL;
+			v.v_cols = cols;
+		}
+	}
+
+	if (v.v_clin > 32)
+		return -EINVAL;
 
-	console_lock();
 	for (i = 0; i < MAX_NR_CONSOLES; i++) {
-		vc = vc_cons[i].d;
+		struct vc_data *vcp;
 
-		if (vc) {
-			vc->vc_resize_user = 1;
-			vc_resize(vc, v.v_cols, v.v_rows);
+		if (!vc_cons[i].d)
+			continue;
+		console_lock();
+		vcp = vc_cons[i].d;
+		if (vcp) {
+			int ret;
+			int save_scan_lines = vcp->vc_scan_lines;
+			int save_font_height = vcp->vc_font.height;
+
+			if (v.v_vlin)
+				vcp->vc_scan_lines = v.v_vlin;
+			if (v.v_clin)
+				vcp->vc_font.height = v.v_clin;
+			vcp->vc_resize_user = 1;
+			ret = vc_resize(vcp, v.v_cols, v.v_rows);
+			if (ret) {
+				vcp->vc_scan_lines = save_scan_lines;
+				vcp->vc_font.height = save_font_height;
+				console_unlock();
+				return ret;
+			}
 		}
+		console_unlock();
 	}
-	console_unlock();
 
 	return 0;
 }
