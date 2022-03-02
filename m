Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C04704C9B31
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 03:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0144310E11F;
	Wed,  2 Mar 2022 02:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEB410E11F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 02:26:55 +0000 (UTC)
X-UUID: 15456e4f235a46cb82f7f33ffaf447dd-20220302
X-UUID: 15456e4f235a46cb82f7f33ffaf447dd-20220302
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 771238223; Wed, 02 Mar 2022 10:26:43 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 10:26:41 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Mar 2022 10:26:40 +0800
Message-ID: <f6a7e13d0f3dd87b76b47113a6b80517d30ef06d.camel@mediatek.com>
Subject: Re: [PATCH v7, 03/15] media: mtk-vcodec: get capture queue buffer
 size from scp
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Wed, 2 Mar 2022 10:26:40 +0800
In-Reply-To: <0af43e6de8bb963eecb856e88b00d649c5720c3d.camel@ndufresne.ca>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-4-yunfei.dong@mediatek.com>
 <0af43e6de8bb963eecb856e88b00d649c5720c3d.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
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
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Steve Cho <stevecho@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas,

Thanks for you suggestion.
On Tue, 2022-03-01 at 09:44 -0500, Nicolas Dufresne wrote:
> Thanks for your patch, though perhaps it could be improved, see
> comment below.
> 
> Le mercredi 23 février 2022 à 11:39 +0800, Yunfei Dong a écrit :
> > Different capture buffer format has different buffer size, need to
> > get
> > real buffer size according to buffer type from scp.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 36 ++++++++++++++
> >  .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 49
> > +++++++++++++++++++
> >  .../media/platform/mtk-vcodec/vdec_vpu_if.h   | 15 ++++++
> >  3 files changed, 100 insertions(+)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> > b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> > index bf54d6d9a857..47070be2a991 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> > +++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> > @@ -20,6 +20,7 @@ enum vdec_ipi_msgid {
> >  	AP_IPIMSG_DEC_RESET = 0xA004,
> >  	AP_IPIMSG_DEC_CORE = 0xA005,
> >  	AP_IPIMSG_DEC_CORE_END = 0xA006,
> > +	AP_IPIMSG_DEC_GET_PARAM = 0xA007,
> >  
> >  	VPU_IPIMSG_DEC_INIT_ACK = 0xB000,
> >  	VPU_IPIMSG_DEC_START_ACK = 0xB001,
> > @@ -28,6 +29,7 @@ enum vdec_ipi_msgid {
> >  	VPU_IPIMSG_DEC_RESET_ACK = 0xB004,
> >  	VPU_IPIMSG_DEC_CORE_ACK = 0xB005,
> >  	VPU_IPIMSG_DEC_CORE_END_ACK = 0xB006,
> > +	VPU_IPIMSG_DEC_GET_PARAM_ACK = 0xB007,
> >  };
> >  
> >  /**
> > @@ -114,4 +116,38 @@ struct vdec_vpu_ipi_init_ack {
> >  	uint32_t inst_id;
> >  };
> >  
> > +/**
> > + * struct vdec_ap_ipi_get_param - for AP_IPIMSG_DEC_GET_PARAM
> > + * @msg_id	: AP_IPIMSG_DEC_GET_PARAM
> > + * @inst_id     : instance ID. Used if the ABI version >= 2.
> > + * @data	: picture information
> > + * @param_type	: get param type
> > + * @codec_type	: Codec fourcc
> > + */
> > +struct vdec_ap_ipi_get_param {
> > +	u32 msg_id;
> > +	u32 inst_id;
> > +	u32 data[4];
> > +	u32 param_type;
> > +	u32 codec_type;
> > +};
> > +
> > +/**
> > + * struct vdec_vpu_ipi_get_param_ack - for
> > VPU_IPIMSG_DEC_GET_PARAM_ACK
> > + * @msg_id	: VPU_IPIMSG_DEC_GET_PARAM_ACK
> > + * @status	: VPU execution result
> > + * @ap_inst_addr	: AP vcodec_vpu_inst instance address
> > + * @data     : picture information from SCP.
> > + * @param_type	: get param type
> > + * @reserved : reserved param
> > + */
> > +struct vdec_vpu_ipi_get_param_ack {
> > +	u32 msg_id;
> > +	s32 status;
> > +	u64 ap_inst_addr;
> > +	u32 data[4];
> > +	u32 param_type;
> > +	u32 reserved;
> > +};
> > +
> >  #endif
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> > b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> > index 7210061c772f..35f4d5583084 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> > +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> > @@ -6,6 +6,7 @@
> >  
> >  #include "mtk_vcodec_drv.h"
> >  #include "mtk_vcodec_util.h"
> > +#include "vdec_drv_if.h"
> >  #include "vdec_ipi_msg.h"
> >  #include "vdec_vpu_if.h"
> >  #include "mtk_vcodec_fw.h"
> > @@ -54,6 +55,26 @@ static void handle_init_ack_msg(const struct
> > vdec_vpu_ipi_init_ack *msg)
> >  	}
> >  }
> >  
> > +static void handle_get_param_msg_ack(const struct
> > vdec_vpu_ipi_get_param_ack *msg)
> > +{
> > +	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
> > +					(unsigned long)msg-
> > >ap_inst_addr;
> > +
> > +	mtk_vcodec_debug(vpu, "+ ap_inst_addr = 0x%llx", msg-
> > >ap_inst_addr);
> > +
> > +	/* param_type is enum vdec_get_param_type */
> > +	switch (msg->param_type) {
> > +	case GET_PARAM_PIC_INFO:
> > +		vpu->fb_sz[0] = msg->data[0];
> > +		vpu->fb_sz[1] = msg->data[1];
> > +		break;
> > +	default:
> > +		mtk_vcodec_err(vpu, "invalid get param type=%d", msg-
> > >param_type);
> > +		vpu->failure = 1;
> > +		break;
> > +	}
> > +}
> > +
> >  /*
> >   * vpu_dec_ipi_handler - Handler for VPU ipi message.
> >   *
> > @@ -89,6 +110,9 @@ static void vpu_dec_ipi_handler(void *data,
> > unsigned int len, void *priv)
> >  		case VPU_IPIMSG_DEC_CORE_END_ACK:
> >  			break;
> >  
> > +		case VPU_IPIMSG_DEC_GET_PARAM_ACK:
> > +			handle_get_param_msg_ack(data);
> > +			break;
> >  		default:
> >  			mtk_vcodec_err(vpu, "invalid msg=%X", msg-
> > >msg_id);
> >  			break;
> > @@ -217,6 +241,31 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu,
> > uint32_t *data, unsigned int len)
> >  	return err;
> >  }
> >  
> > +int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
> > +		      unsigned int len, unsigned int param_type)
> > +{
> > +	struct vdec_ap_ipi_get_param msg;
> > +	int err;
> > +
> > +	mtk_vcodec_debug_enter(vpu);
> > +
> > +	if (len > ARRAY_SIZE(msg.data)) {
> > +		mtk_vcodec_err(vpu, "invalid len = %d\n", len);
> > +		return -EINVAL;
> > +	}
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.msg_id = AP_IPIMSG_DEC_GET_PARAM;
> > +	msg.inst_id = vpu->inst_id;
> > +	memcpy(msg.data, data, sizeof(unsigned int) * len);
> > +	msg.param_type = param_type;
> > +	msg.codec_type = vpu->codec_type;
> > +
> > +	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
> > +	mtk_vcodec_debug(vpu, "- ret=%d", err);
> > +	return err;
> > +}
> > +
> >  int vpu_dec_core(struct vdec_vpu_inst *vpu)
> >  {
> >  	return vcodec_send_ap_ipi(vpu, AP_IPIMSG_DEC_CORE);
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > index 4cb3c7f5a3ad..d1feba41dd39 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > @@ -28,6 +28,8 @@ struct mtk_vcodec_ctx;
> >   * @wq          : wait queue to wait VPU message ack
> >   * @handler     : ipi handler for each decoder
> >   * @codec_type     : use codec type to separate different codecs
> > + * @capture_type    : used capture type to separate different
> > capture format
> > + * @fb_sz  : frame buffer size of each plane
> >   */
> >  struct vdec_vpu_inst {
> >  	int id;
> > @@ -42,6 +44,8 @@ struct vdec_vpu_inst {
> >  	wait_queue_head_t wq;
> >  	mtk_vcodec_ipi_handler handler;
> >  	unsigned int codec_type;
> > +	unsigned int capture_type;
> 
> This structure member is added in this patch, but never set or used.
> 
This member will be used in patch 13/14/15 used to record capture type,
I will remove this member to patch 13 when first to use it.

Best Regards,
Yunfei Dong
> > +	unsigned int fb_sz[2];
> >  };
> >  
> >  /**
> > @@ -104,4 +108,15 @@ int vpu_dec_core(struct vdec_vpu_inst *vpu);
> >   */
> >  int vpu_dec_core_end(struct vdec_vpu_inst *vpu);
> >  
> > +/**
> > + * vpu_dec_get_param - get param from scp
> > + *
> > + * @vpu : instance for vdec_vpu_inst
> > + * @data: meta data to pass bitstream info to VPU decoder
> > + * @len : meta data length
> > + * @param_type : get param type
> > + */
> > +int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
> > +		      unsigned int len, unsigned int param_type);
> > +
> >  #endif
> 
> 

