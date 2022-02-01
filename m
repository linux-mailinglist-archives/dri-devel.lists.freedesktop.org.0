Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C794A670C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 22:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2881110E20C;
	Tue,  1 Feb 2022 21:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB58610E20C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 21:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IO8IdHL56qF0kq9+SOQ8IdIHifNZG8T7EoA6mhaFh9o=; b=gi+TXyM8FeJJqKuSa30Uum9I34
 yBhkNjc8TA6uu00uK+hX6RRFig68ohqiVZ4FwtM/aeqOKAwj4yg+2rFBRmzH4IA9BC1WR5r5rOkJ8
 7jDe7EOj6pdJgzxSRiJVxnGIers9cDuLKD7+T1lwC+MNG2PyN8x82n7K/Xs7om0RmvIRjIggir+X0
 51H+lh4SVxzK3FZj6CaloYom7I616X+/zyH907LkxMYVAhtr/wk5uCUm5TO1W1fWXKsIAuhTof/tt
 jUuS6cabl/y4UVue9EtQqwCf3hF6x3SWsyRVZ8TmO6yQJlj+UaJmQ1jKtvV6/qmT+NqB7XrQKmafQ
 wiQQ+DyQ==;
Received: from [165.90.113.117] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nF0g3-0004Dk-Lp; Tue, 01 Feb 2022 22:27:03 +0100
Date: Tue, 1 Feb 2022 20:26:51 -0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vc4: add tracepoints for CL submissions
Message-ID: <20220201212651.zhltjmaokisffq3x@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cracmcbegkbksfrx"
Content-Disposition: inline
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
Cc: David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cracmcbegkbksfrx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Trace submit_cl_ioctl and related IRQs for CL submission and bin/render
jobs execution. It might be helpful to get a rendering timeline and
track job throttling.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_gem.c   |  7 +++
 drivers/gpu/drm/vc4/vc4_irq.c   |  5 ++
 drivers/gpu/drm/vc4/vc4_trace.h | 95 +++++++++++++++++++++++++++++++++
 3 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 445d3bab89e0..4abf10b66fe8 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -485,6 +485,8 @@ vc4_submit_next_bin_job(struct drm_device *dev)
 	 * immediately move it to the to-be-rendered queue.
 	 */
 	if (exec->ct0ca !=3D exec->ct0ea) {
+		trace_vc4_submit_cl(dev, false, exec->seqno, exec->ct0ca,
+				    exec->ct0ea);
 		submit_cl(dev, 0, exec->ct0ca, exec->ct0ea);
 	} else {
 		struct vc4_exec_info *next;
@@ -519,6 +521,7 @@ vc4_submit_next_render_job(struct drm_device *dev)
 	 */
 	vc4_flush_texture_caches(dev);
=20
+	trace_vc4_submit_cl(dev, true, exec->seqno, exec->ct1ca, exec->ct1ea);
 	submit_cl(dev, 1, exec->ct1ca, exec->ct1ea);
 }
=20
@@ -1135,6 +1138,10 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *da=
ta,
 	struct dma_fence *in_fence;
 	int ret =3D 0;
=20
+	trace_vc4_submit_cl_ioctl(dev, args->bin_cl_size,
+				  args->shader_rec_size,
+				  args->bo_handle_count);
+
 	if (!vc4->v3d) {
 		DRM_DEBUG("VC4_SUBMIT_CL with no VC4 V3D probed\n");
 		return -ENODEV;
diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
index 20fa8e34c20b..4342fb43e8c1 100644
--- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -51,6 +51,7 @@
=20
 #include "vc4_drv.h"
 #include "vc4_regs.h"
+#include "vc4_trace.h"
=20
 #define V3D_DRIVER_IRQS (V3D_INT_OUTOMEM | \
 			 V3D_INT_FLDONE | \
@@ -123,6 +124,8 @@ vc4_irq_finish_bin_job(struct drm_device *dev)
 	if (!exec)
 		return;
=20
+	trace_vc4_bcl_end_irq(dev, exec->seqno);
+
 	vc4_move_job_to_render(dev, exec);
 	next =3D vc4_first_bin_job(vc4);
=20
@@ -161,6 +164,8 @@ vc4_irq_finish_render_job(struct drm_device *dev)
 	if (!exec)
 		return;
=20
+	trace_vc4_rcl_end_irq(dev, exec->seqno);
+
 	vc4->finished_seqno++;
 	list_move_tail(&exec->head, &vc4->job_done_list);
=20
diff --git a/drivers/gpu/drm/vc4/vc4_trace.h b/drivers/gpu/drm/vc4/vc4_trac=
e.h
index 1cccde0b09a7..7f4c49e7e011 100644
--- a/drivers/gpu/drm/vc4/vc4_trace.h
+++ b/drivers/gpu/drm/vc4/vc4_trace.h
@@ -52,6 +52,101 @@ TRACE_EVENT(vc4_wait_for_seqno_end,
 		      __entry->dev, __entry->seqno)
 );
=20
+TRACE_EVENT(vc4_submit_cl_ioctl,
+	    TP_PROTO(struct drm_device *dev, u32 bin_cl_size, u32 shader_rec_size=
, u32 bo_count),
+	    TP_ARGS(dev, bin_cl_size, shader_rec_size, bo_count),
+
+	    TP_STRUCT__entry(
+			     __field(u32, dev)
+			     __field(u32, bin_cl_size)
+			     __field(u32, shader_rec_size)
+			     __field(u32, bo_count)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->dev =3D dev->primary->index;
+			   __entry->bin_cl_size =3D bin_cl_size;
+			   __entry->shader_rec_size =3D shader_rec_size;
+			   __entry->bo_count =3D bo_count;
+			   ),
+
+	    TP_printk("dev=3D%u, bin_cl_size=3D%u, shader_rec_size=3D%u, bo_count=
=3D%u",
+		      __entry->dev,
+		      __entry->bin_cl_size,
+		      __entry->shader_rec_size,
+		      __entry->bo_count)
+);
+
+TRACE_EVENT(vc4_submit_cl,
+	    TP_PROTO(struct drm_device *dev, bool is_render,
+		     uint64_t seqno,
+		     u32 ctnqba, u32 ctnqea),
+	    TP_ARGS(dev, is_render, seqno, ctnqba, ctnqea),
+
+	    TP_STRUCT__entry(
+			     __field(u32, dev)
+			     __field(bool, is_render)
+			     __field(u64, seqno)
+			     __field(u32, ctnqba)
+			     __field(u32, ctnqea)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->dev =3D dev->primary->index;
+			   __entry->is_render =3D is_render;
+			   __entry->seqno =3D seqno;
+			   __entry->ctnqba =3D ctnqba;
+			   __entry->ctnqea =3D ctnqea;
+			   ),
+
+	    TP_printk("dev=3D%u, %s, seqno=3D%llu, 0x%08x..0x%08x",
+		      __entry->dev,
+		      __entry->is_render ? "RCL" : "BCL",
+		      __entry->seqno,
+		      __entry->ctnqba,
+		      __entry->ctnqea)
+);
+
+TRACE_EVENT(vc4_bcl_end_irq,
+	    TP_PROTO(struct drm_device *dev,
+		     uint64_t seqno),
+	    TP_ARGS(dev, seqno),
+
+	    TP_STRUCT__entry(
+			     __field(u32, dev)
+			     __field(u64, seqno)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->dev =3D dev->primary->index;
+			   __entry->seqno =3D seqno;
+			   ),
+
+	    TP_printk("dev=3D%u, seqno=3D%llu",
+		      __entry->dev,
+		      __entry->seqno)
+);
+
+TRACE_EVENT(vc4_rcl_end_irq,
+	    TP_PROTO(struct drm_device *dev,
+		     uint64_t seqno),
+	    TP_ARGS(dev, seqno),
+
+	    TP_STRUCT__entry(
+			     __field(u32, dev)
+			     __field(u64, seqno)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->dev =3D dev->primary->index;
+			   __entry->seqno =3D seqno;
+			   ),
+
+	    TP_printk("dev=3D%u, seqno=3D%llu",
+		      __entry->dev,
+		      __entry->seqno)
+);
+
 #endif /* _VC4_TRACE_H_ */
=20
 /* This part must be outside protection */
--=20
2.34.1


--cracmcbegkbksfrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmH5pZYACgkQwqF3j0dL
ehxNORAAoL27iJDlq2ONjw6yxGFbBhr8DOqLk9cGWvweArnjqCKPYaJ8l3wxwVOx
6UsmZ5wWCHXOFIyf08TcJvx5bTCJgITG3vellPqjqZDjtmHsLJTfxKwsI8pE1Xu/
/idMQB2/gpUWMaBmYkKwEZNOhmKyuDv9IhoqBzG9tVGz7ggebsuFqIQa0T99sfF7
s/hkjBUnGbF0ZA1Xzh3N5yk7vDylHMYhiYEukEru8xRF9XuNmCSBShOITUR1P+xW
Fv46AWVY/jowI8gGC0Ze7j4+UgVJnsnYh00zY/BJVSGqKgNO45aE1irUH9XQte5W
O3/G926FKXtZoSQqKXxr/nGGBXV4a1vwctgGKO2VsAq/YZJRAxVs46d9HFGpBTdY
3p6XBXzGsUQ2DvefZQ/gMPz0rjFInqMIKBxxlgX9xO7idj/8IEj87q4yvc+jw+bx
7cpzCbXlM0pKY1A94mVo3xxt8ZSFgwEPJLThWS893eHgfB0KMsba2rTSvydbZQTP
jFT6kqDcw1JUU4gAdJVGy7fM6U4O+OdUbkIZ4mnmsrzhWUxN3gRld2p+Aec+MYzK
li9INWtzsLDQMKibmmWxtqlObD1HqUVl3VHx33IYby7lNMzDXNxmeQJv8cy1efIT
pRXEVSpsw5gyogrTt4rjXnBlX8it9vL+kwqTQvNolxMjbymexL4=
=DESm
-----END PGP SIGNATURE-----

--cracmcbegkbksfrx--
