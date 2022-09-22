Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1605E6890
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D248210EA76;
	Thu, 22 Sep 2022 16:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C2A10EA76
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 16:36:58 +0000 (UTC)
Received: from [IPV6:2804:431:c7c2:b4b6:f87:da96:9bc3:d98b] (unknown
 [IPv6:2804:431:c7c2:b4b6:f87:da96:9bc3:d98b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 228D66601E58;
 Thu, 22 Sep 2022 17:36:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663864617;
 bh=9qk4Re4yFBcAUV8l7PYU2Z7VB5bihult7d9If/n3XpE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DfzqEV4qZ/ihOi/bd9W6MOgz4zvoLmC7kGSNwCX1KvPfmSkkovxu67SQpOJYBv3PS
 n+r5b5G4OjVl2VQ9BhyCXgbEaR35UrFP7STucYhqy1oDzuviVRK9HAaJPipiX41bH/
 z+OfcHq4Uf+tWALIixErvkUe9LbAMst6LYM8eNUi4Fk8C2WrT0O8+BmXB2yc6BY3YQ
 Sk7myOK1VudgA2a4XluK09TyqYJILdYPx4N1GZzpcTbFiiYRO66g5z3Fb7VTgO3INz
 DYQ+QDjA0VjR7aXAHHbGGFsVk2EuclSm7+60exYREi1IGp9BW4nkQ/vpT+2rI3J96I
 etPD1OTqk0yZQ==
Message-ID: <927f95dd-283a-a3c0-6c2f-41a36bcc42ef@collabora.com>
Date: Thu, 22 Sep 2022 13:36:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH v3] media: mediatek: vcodec: support stateless AV1
 decoder
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220901110416.21191-1-xiaoyong.lu@mediatek.com>
Content-Language: en-US
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20220901110416.21191-1-xiaoyong.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xiaoyong.

Comments below (other code removed for brevity)

+/**
+ * struct vdec_av1_slice_slot - slot info need save in global instance
+ * @frame_info: frame info for each slot
+ * @timestamp:  time stamp info
+ */
+struct vdec_av1_slice_slot {
+	struct vdec_av1_slice_frame_info frame_info[AV1_MAX_FRAME_BUF_COUNT];
+	u64 timestamp[AV1_MAX_FRAME_BUF_COUNT];
+};

nit: slot info that needs to be saved in the global instance

+static int vdec_av1_slice_get_qindex(struct 
vdec_av1_slice_uncompressed_header *uh,
+				     int segmentation_id)
+{
+	struct vdec_av1_slice_seg *seg = &uh->seg;
+	struct vdec_av1_slice_quantization *quant = &uh->quant;
+	int data = 0, qindex = 0;
+
+	if (seg->segmentation_enabled &&
+	    (seg->feature_enabled_mask[segmentation_id] & BIT(0))) {
+		data = seg->feature_data[segmentation_id][0];


Maybe you should replace the 0 above by SEG_LVL_ALT_Q to be more 
explicit. Same goes for BIT(0).

+static void vdec_av1_slice_setup_lr(struct vdec_av1_slice_lr *lr,
+				    struct v4l2_av1_loop_restoration  *ctrl_lr)
+{
+	int i;
+
+	for (i = 0; i < V4L2_AV1_NUM_PLANES_MAX; i++) {
+		lr->frame_restoration_type[i] = ctrl_lr->frame_restoration_type[i];
+		lr->loop_restoration_size[i] = ctrl_lr->loop_restoration_size[i];
+	}
+	lr->use_lr = !!lr->frame_restoration_type[0];
+	lr->use_chroma_lr = !!lr->frame_restoration_type[1];
+}

 From a first glance, this looks a bit divergent from the spec?

for ( i = 0; i < NumPlanes; i++ ) {
     lr_type
     FrameRestorationType[i] = Remap_Lr_Type[lr_type]
     if ( FrameRestorationType[i] != RESTORE_NONE ) {
         UsesLr = 1
         if ( i > 0 ) {
             usesChromaLr = 1
         }
     }
}

I will include these two variables in the next iteration of the uapi if 
computing them in the driver is problematic.

+static void vdec_av1_slice_setup_lf(struct vdec_av1_slice_loop_filter *lf,
+				    struct v4l2_av1_loop_filter *ctrl_lf)
+{
+	int i;
+
+	for (i = 0; i < 4; i++)
+		lf->loop_filter_level[i] = ctrl_lf->level[i];
+
+	for (i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++)
+		lf->loop_filter_ref_deltas[i] = ctrl_lf->ref_deltas[i];
+
+	for (i = 0; i < 2; i++)
+		lf->loop_filter_mode_deltas[i] = ctrl_lf->mode_deltas[i];
+
+	lf->loop_filter_sharpness = ctrl_lf->sharpness;
+	lf->loop_filter_delta_enabled =
+		   BIT_FLAG(ctrl_lf, V4L2_AV1_LOOP_FILTER_FLAG_DELTA_ENABLED);
+}

Maybe ARRAY_SIZE can be of use in the loop indices here?

+static void vdec_av1_slice_setup_cdef(struct vdec_av1_slice_cdef *cdef,
+				      struct v4l2_av1_cdef *ctrl_cdef)
+{
+	int i;
+
+	cdef->cdef_damping = ctrl_cdef->damping_minus_3 + 3;
+	cdef->cdef_bits = ctrl_cdef->bits;
+
+	for (i = 0; i < V4L2_AV1_CDEF_MAX; i++) {
+		if (ctrl_cdef->y_sec_strength[i] == 4)
+			ctrl_cdef->y_sec_strength[i] -= 1;
+
+		if (ctrl_cdef->uv_sec_strength[i] == 4)
+			ctrl_cdef->uv_sec_strength[i] -= 1;
+
+		cdef->cdef_y_strength[i] = ctrl_cdef->y_pri_strength[i] << 2 |
+					   ctrl_cdef->y_sec_strength[i];
+		cdef->cdef_uv_strength[i] = ctrl_cdef->uv_pri_strength[i] << 2 |
+					    ctrl_cdef->uv_sec_strength[i];
+	}
+}

Maybe:

#define SECONDARY_FILTER_STRENGTH_NUM_BITS 2

+		cdef->cdef_y_strength[i] = ctrl_cdef->y_pri_strength[i] << 
SECONDARY_FILTER_STRENGTH_NUM_BITS |
+					   ctrl_cdef->y_sec_strength[i];
+		cdef->cdef_uv_strength[i] = ctrl_cdef->uv_pri_strength[i] << 
SECONDARY_FILTER_STRENGTH_NUM_BITS |
+					    ctrl_cdef->uv_sec_strength[i];

This should make it clearer.

+		sb_boundary_x_m1 =
+			(tile->mi_col_starts[tile_col + 1] - tile->mi_col_starts[tile_col] - 
1) &
+			0x3F;
+		sb_boundary_y_m1 =
+			(tile->mi_row_starts[tile_row + 1] - tile->mi_row_starts[tile_row] - 
1) &
+			0x1FF;
+

IIRC there's a preference for lower case hex values in the media subsystem.

+static void vdec_av1_slice_get_dpb_size(struct vdec_av1_slice_instance 
*instance, u32 *dpb_sz)
+{
+	/* refer av1 specification */
+	*dpb_sz = 9;
+}

That's actually defined as 8 in the spec, i.e.:

NUM_REF_FRAMES 8 Number of frames that can be stored for future
reference.

It's helpful to indicate the section if you reference the specification, 
as it makes it easier for the reviewer to cross check.

+	/* get buffer address from vb2buf */
+	for (i = 0; i < V4L2_AV1_REFS_PER_FRAME; i++) {
+		struct vdec_av1_slice_fb *vref = &vsi->ref[i];
+		int idx = vb2_find_timestamp(vq, pfc->ref_idx[i], 0);

Needs to be converted to vb2_find_buffer in light of 
https://lore.kernel.org/lkml/20220706182657.210650-3-ezequiel@vanguardiasur.com.ar/T/

-- Daniel

