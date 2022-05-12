Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A03F52494D
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 11:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696CA10EE0C;
	Thu, 12 May 2022 09:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 663 seconds by postgrey-1.36 at gabe;
 Thu, 12 May 2022 09:42:44 UTC
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E896F10EE0C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 09:42:44 +0000 (UTC)
X-KPN-MessageId: 4e6ffd54-d1d6-11ec-a9ff-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id 4e6ffd54-d1d6-11ec-a9ff-005056994fde;
 Thu, 12 May 2022 11:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=xs4all01;
 h=content-type:from:to:subject:mime-version:date:message-id;
 bh=J5fVuHTorFO9vS+A8/3ndPu060HnZX6yzHxBET50rjw=;
 b=mmZthCNB1ky7U/F/upi2LoOgPKYEzOY7d/njHyBbx+WPmmYjvGdY7i+V2MFGBvC1YZXV1sOKIYVFf
 mhyhp6hoTYzk6ZeC8RcYunL2jb8VEc0YlGEbBywC+URbhmHmmjruJBsBfw/pB5aAi8Sj3RdNW5QxIz
 OtoCDNGdFfCOjpllti5bs32/QCVk1p8yelQfhWbxVxX+4aepquKbuvjVOEYgeMrVy1YGpRvf7+CqAH
 mGMPFZ+41/i0RFJOhzc2o289M75aCL4YOIsa/ADzA2Z5QsoNoxesvKXwh8not51IcRrPwFQg/0iVrX
 FuJO/Gj2FFCXqXolh+fmDJgAdRz5Nzg==
X-KPN-MID: 33|bmNIgalGIYJXpA7CRrWfasNg2BTj8AlOHOsTV3qYhtX4j/xmA4bPP+xrXkGSHxc
 avtd2wVqMgGpfLUuhlpISdg==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|VG/RDjSU8Aq6zYZIftNGufBNEJo6kPBr8Ws9JbIXYGz1yKrLLPQYIHYeTTxKCbH
 DpxavEf2+O8HcZHgKJQqUhw==
X-Originating-IP: 173.38.220.60
Received: from [10.47.77.219] (unknown [173.38.220.60])
 by smtp.xs4all.nl (Halon) with ESMTPSA
 id 51ee21aa-d1d6-11ec-a066-00505699d6e5;
 Thu, 12 May 2022 11:31:39 +0200 (CEST)
Message-ID: <03e09da3-c068-a372-a3e5-dc0459f90682@xs4all.nl>
Date: Thu, 12 May 2022 11:31:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [DKIM] [PATCH v12, 13/17] media: mediatek: vcodec: Extract H264
 common code
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220512021950.29087-1-yunfei.dong@mediatek.com>
 <20220512021950.29087-14-yunfei.dong@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220512021950.29087-14-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunfei,

On 5/12/22 04:19, Yunfei Dong wrote:
> Mt8192 can use some of common code with mt8183. Moves them to
> a new file in order to reuse.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../media/platform/mediatek/vcodec/Makefile   |   1 +
>  .../vcodec/vdec/vdec_h264_req_common.c        | 310 +++++++++++++
>  .../vcodec/vdec/vdec_h264_req_common.h        | 274 +++++++++++
>  .../mediatek/vcodec/vdec/vdec_h264_req_if.c   | 427 ++----------------
>  4 files changed, 629 insertions(+), 383 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c
>  create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.h
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/Makefile b/drivers/media/platform/mediatek/vcodec/Makefile
> index 359619653a0e..3f41d748eee5 100644
> --- a/drivers/media/platform/mediatek/vcodec/Makefile
> +++ b/drivers/media/platform/mediatek/vcodec/Makefile
> @@ -9,6 +9,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
>  		vdec/vdec_vp8_if.o \
>  		vdec/vdec_vp9_if.o \
>  		vdec/vdec_h264_req_if.o \
> +		vdec/vdec_h264_req_common.o \
>  		mtk_vcodec_dec_drv.o \
>  		vdec_drv_if.o \
>  		vdec_vpu_if.o \
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c
> new file mode 100644
> index 000000000000..4e7c9d47751d
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c
> @@ -0,0 +1,310 @@

<snip>

Here there is still a cast to iomem:

> +void mtk_vdec_h264_copy_scaling_matrix(struct slice_api_h264_scaling_matrix *dst_matrix,
> +				       const struct v4l2_ctrl_h264_scaling_matrix *src_matrix)
> +{
> +	memcpy_toio((void __iomem *)dst_matrix->scaling_list_4x4, src_matrix->scaling_list_4x4,
> +		    sizeof(dst_matrix->scaling_list_4x4));
> +
> +	memcpy_toio((void __iomem *)dst_matrix->scaling_list_8x8, src_matrix->scaling_list_8x8,
> +		    sizeof(dst_matrix->scaling_list_8x8));
> +}

<snip>

> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
> index 27119aa31dd9..b055ceea481d 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c

<snip>

> -static void
> -get_h264_scaling_matrix(struct slice_api_h264_scaling_matrix *dst_matrix,
> -			const struct v4l2_ctrl_h264_scaling_matrix *src_matrix)
> -{
> -	memcpy(dst_matrix->scaling_list_4x4, src_matrix->scaling_list_4x4,
> -	       sizeof(dst_matrix->scaling_list_4x4));
> -
> -	memcpy(dst_matrix->scaling_list_8x8, src_matrix->scaling_list_8x8,
> -	       sizeof(dst_matrix->scaling_list_8x8));
> -}

but that function was moved (AFAICT) from vdec_h264_req_if.c where a regular memcpy was
used.

Did you miss one iomem case?

Can I change mtk_vdec_h264_copy_scaling_matrix() to:

void mtk_vdec_h264_copy_scaling_matrix(struct slice_api_h264_scaling_matrix *dst_matrix,
				       const struct v4l2_ctrl_h264_scaling_matrix *src_matrix)
{
	memcpy(dst_matrix->scaling_list_4x4, src_matrix->scaling_list_4x4,
	       sizeof(dst_matrix->scaling_list_4x4));

	memcpy(dst_matrix->scaling_list_8x8, src_matrix->scaling_list_8x8,
	       sizeof(dst_matrix->scaling_list_8x8));
}

If that's OK, then I'll do that manually, so no need to post a v13.

Everything else looks fine, so this is the only issue that needs to be resolved.

Regards,

	Hans
