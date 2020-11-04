Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F3E2A5D10
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 04:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEC16E923;
	Wed,  4 Nov 2020 03:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4206E923
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 03:18:12 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20201104031810epoutp0228fb916bc53ea967e448fc5b54d24072~EL8T-Gkxx0190701907epoutp02d
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 03:18:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20201104031810epoutp0228fb916bc53ea967e448fc5b54d24072~EL8T-Gkxx0190701907epoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604459890;
 bh=Af+rbsqoj+e9oIk+M0kz4lR7pGGKPqMvdzMC1y6q+Y0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=g0i5RzZoycjIQ4TG+A4rrmnyW4neH8KU1NSlfj9Y1ByI1EDAy8EbrozoNvTMF1m2l
 /jTGchf0bLP6iiim38af8auXb87DqCJup6lLgpdeseuOk36RWWub02JVPmF6rOzg0f
 09L5nbfG6QZwe/0MKPI5JiygilVU1XSTM1QtWVek=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201104031809epcas1p169e1f59606c4615728a117f8f5b0fd97~EL8TXYTpi2054520545epcas1p1m;
 Wed,  4 Nov 2020 03:18:09 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.153]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4CQsKq4BxYzMqYkf; Wed,  4 Nov
 2020 03:18:07 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 F5.A7.02418.F6D12AF5; Wed,  4 Nov 2020 12:18:07 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201104031806epcas1p2cc512545d5dac02382bf999ae6731718~EL8Qum_U22872328723epcas1p2q;
 Wed,  4 Nov 2020 03:18:06 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201104031806epsmtrp171f74d270d2ad3172e934e227f35c802~EL8QtlWMY1039110391epsmtrp1b;
 Wed,  4 Nov 2020 03:18:06 +0000 (GMT)
X-AuditID: b6c32a35-c0dff70000010972-98-5fa21d6fd2b6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 96.91.13470.E6D12AF5; Wed,  4 Nov 2020 12:18:06 +0900 (KST)
Received: from [10.113.111.64] (unknown [10.113.111.64]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201104031806epsmtip1dcf07a6a3f0d156db0931ffac3f6422f~EL8QZO_QG0625306253epsmtip16;
 Wed,  4 Nov 2020 03:18:06 +0000 (GMT)
Subject: Re: [PATCH v2 7/7] drm/vc4: kms: Don't disable the muxing of an
 active CRTC
To: Maxime Ripard <maxime@cerno.tech>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Eric Anholt <eric@anholt.net>
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Message-ID: <e44c8830-1e63-03ec-b3f1-abab2259c995@samsung.com>
Date: Wed, 4 Nov 2020 12:17:27 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <469ead5de989938fcf079505cbc232a620e713bc.1603888799.git-series.maxime@cerno.tech>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfVRTZRz2vbu7GxZ5G6jvQdOx0A7EYBccXDyAihy7FhmdOp5EO3PAFTiM
 be0O8oOTk0K+lfkRbQYIiDuHY0Ab3+WJQBQqRhbBCcOl4AfEQlE+Ioq2XTzx3/N7f8/zPu/z
 e8+PzxHoeF78FKWW1ijlChG2Em3q9BWLVS9VyiQPy9eRRdYehPyiqAslTT/Uckh7aRVKll+z
 csn+6UmMbD/xMyANE4sYOWnKx0jzyACX1N+q55EVjxtRsnrwJkJ+NvcvIGuH/sDI7KvXeOTd
 8zZANkzoudsFVNbkdYy6UnYFUEZbL0b9Zu3DqFbjMI+q+noMocw1eRjVPPM7lyrreZuyFdxA
 KMul41R21zxKnWqoAZTl+2PUE/OG2FVxqeHJtDyR1ghpZYIqMUWZFCF64x3ZTpk0REKIiTAy
 VCRUytPoCFF0TKx4V4rCEVYkzJAr0h1HsXKGEQVGhmtU6VpamKxitBEiWp2oUIepAxh5GpOu
 TApIUKVtJSSSIKmDeDA1+XL+I666jzg83NvJ0YHyV/KBGx/iW+BPCzUgH6zkC/AWAHVdFoQt
 pgA8rS/hssUMgJfni8Azid5WjzqxAL8KYMvCLpZkBzDXUIk4Gx74Xlg90o05G574KAIvjTxx
 mXBwGwLbegY5ThaGi+F04aBL4Y5HQmvdY8yJUdwHFj/tddmtxvfB1ntjPJbzIuwxjLqs3XAZ
 nLvX7dJy8I2w2f45h8Vr4dBouSsExE1u0J63uPTuaDh9u4nHYg84fqNhCXvBsdMnlzAD+w3j
 KCvWOSdwYakRDL+pPuu4le9w8IV1bYHssTds/bsUsMYvwD+nC7lOCsTdYe5JAUvZDO/r2rks
 Xg+/KzIhLKbgL1lZaDHwNi6LZlwWx7gsjvF/44sArQFraDWTlkQzhJpY/t9m4FoFP2kL0Nsf
 BXQAhA86AORzRJ7umfvKZAL3RPmRo7RGJdOkK2imA0gdw9ZzvFYnqBy7pNTKCGlQcHAwuYUI
 kRKEaK37wqu5MgGeJNfSqTStpjXPdAjfzUuH7NDi7fj9sZw8XcyXJW89tVQ0HjBpVnhn75/N
 zDxapdAUDUR6xZjW1zGyksh3w/0+9PHbM/d86QQFP+nv/GuD/2zY1rvlpRVB1+vObIKTbXuK
 a3cftGbQd5o1U/bt8JjnhYeENWrM80xgy0zoe5WHd0StiouJ76ooiEuzde89f67v7Oyhm7t7
 ZyXJMdtydMH++Zslhcb4YVkI+XLUa6P/PPAwmy7eZlYYan2YecvHTbJxy6YdH8RbPhK27Sx8
 veCBOsV/G2qcE3v6qtZ0CO/c2m9tPQdDj/sORBmeIw4xR3K+zS0dMK9THZBHjzdW1r8/HXJi
 yrRx6Mekr978NKDQP2Nx7lcRyiTLCT+OhpH/B/S5QlqTBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRmVeSWpSXmKPExsWy7bCSnG6e7KJ4g/5r+ha9504yWaztPcpi
 sfzMOmaLt3MXs1jMP3KO1eLK1/dsFgcaLzNazHzzn83i/fIuNotNj6+xWky8vYHdYuHHrSwW
 S69fZLKY8eMfo8W6W6/ZLFr3HmG3eDT1PqPFljcTWR2EPJreH2PzWDNvDaPHrPtn2TzunDvP
 5rFz1l12j8V7XjJ5bFrVyeax/dsDVo95JwM97ncfZ/LYvKTeo/XoLxaPvi2rGD02n672+LxJ
 LoA/issmJTUnsyy1SN8ugStjWdcH1oLzhhV3zx5mbmCcr97FyMkhIWAiMfH+BpYuRi4OIYHd
 jBLT921ng0jISKzq38LaxcgBZAtLHD5cDFHzmlHi9Y6/TCA1wgJhEksfn2ADSYgIPGGSmHXu
 CZjDLHCfSeLOy9VsEC29TBJ7dkxlB2lhE9CV+NpzHaydV8BO4tz6j2DrWARUJCZ8OcsIsk5U
 IFJi5w5LiBJBiZMzn7CA2JwC8RI/np4Aa2UWMJOYt/khM4QtL7H97RwoW1zi1pP5TBMYhWYh
 aZ+FpGUWkpZZSFoWMLKsYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQITgJamjsYt6/6
 oHeIkYmD8RCjBAezkghvTeS8eCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8NwoXxgkJpCeWpGan
 phakFsFkmTg4pRqYJL9JGS+ZoyuWE77oS4OKiktkUfDRkMnZ9g/srro4fIlNZTM717utM/po
 sWNDrqKS7vZLFff23zn3c9Hlxm9HTvJIBB7aeZBt3rxs8daw/lzLqLsKyo17fs47dWDB9JU7
 fX5m+57p8eHfrSER+ks+k3lKxPWfu8NPtucbHwo8HPqE81Nb8VI7vluBFcdMFovprfh+fP90
 jiybFUr3714tO6Z+OVFef4FyeeEEBrN/OUapFms/nf31snp3VkaF2O4dazw2l3KG7Nlsszjq
 xO+fp+a92nEtMLOka9rVi2q89wJM/e7uXZ/zfWXPi3lbnROun/Y/v2pH3+HZd+SulgrrhPbk
 XHmudkI1+yj7v5q2ViWW4oxEQy3mouJEAF1597JxAwAA
X-CMS-MailID: 20201104031806epcas1p2cc512545d5dac02382bf999ae6731718
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201029081313epcas1p165edbd0c8e54d978a8130f5fb9d2a422
References: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
 <CGME20201029081313epcas1p165edbd0c8e54d978a8130f5fb9d2a422@epcas1p1.samsung.com>
 <469ead5de989938fcf079505cbc232a620e713bc.1603888799.git-series.maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 10/28/20 9:41 PM, Maxime Ripard wrote:
> The current HVS muxing code will consider the CRTCs in a given state to
> setup their muxing in the HVS, and disable the other CRTCs muxes.
>
> However, it's valid to only update a single CRTC with a state, and in this
> situation we would mux out a CRTC that was enabled but left untouched by
> the new state.
>
> Fix this by setting a flag on the CRTC state when the muxing has been
> changed, and only change the muxing configuration when that flag is there.
>
> Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I checked all patches well works.


All patches:

Reviewed-by: Hoegeun Kwon<hoegeun.kwon@samsung.com>
Tested-by: Hoegeun Kwon<hoegeun.kwon@samsung.com>

Best regards,
Hoegeun

> ---
>   drivers/gpu/drm/vc4/vc4_drv.h |  1 +-
>   drivers/gpu/drm/vc4/vc4_kms.c | 84 +++++++++++++++++++++---------------
>   2 files changed, 50 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index c6208b040f77..c074c0538e57 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -523,6 +523,7 @@ struct vc4_crtc_state {
>   	struct drm_mm_node mm;
>   	bool feed_txp;
>   	bool txp_armed;
> +	bool needs_muxing;
>   	unsigned int assigned_channel;
>   
>   	struct {
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 2aa726b7422c..409aeb19d210 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -224,10 +224,7 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
>   {
>   	struct drm_crtc_state *crtc_state;
>   	struct drm_crtc *crtc;
> -	unsigned char dsp2_mux = 0;
> -	unsigned char dsp3_mux = 3;
> -	unsigned char dsp4_mux = 3;
> -	unsigned char dsp5_mux = 3;
> +	unsigned char mux;
>   	unsigned int i;
>   	u32 reg;
>   
> @@ -235,50 +232,59 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
>   		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
>   		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>   
> -		if (!crtc_state->active)
> +		if (!vc4_state->needs_muxing)
>   			continue;
>   
>   		switch (vc4_crtc->data->hvs_output) {
>   		case 2:
> -			dsp2_mux = (vc4_state->assigned_channel == 2) ? 0 : 1;
> +			mux = (vc4_state->assigned_channel == 2) ? 0 : 1;
> +			reg = HVS_READ(SCALER_DISPECTRL);
> +			HVS_WRITE(SCALER_DISPECTRL,
> +				  (reg & ~SCALER_DISPECTRL_DSP2_MUX_MASK) |
> +				  VC4_SET_FIELD(mux, SCALER_DISPECTRL_DSP2_MUX));
>   			break;
>   
>   		case 3:
> -			dsp3_mux = vc4_state->assigned_channel;
> +			if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
> +				mux = 3;
> +			else
> +				mux = vc4_state->assigned_channel;
> +
> +			reg = HVS_READ(SCALER_DISPCTRL);
> +			HVS_WRITE(SCALER_DISPCTRL,
> +				  (reg & ~SCALER_DISPCTRL_DSP3_MUX_MASK) |
> +				  VC4_SET_FIELD(mux, SCALER_DISPCTRL_DSP3_MUX));
>   			break;
>   
>   		case 4:
> -			dsp4_mux = vc4_state->assigned_channel;
> +			if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
> +				mux = 3;
> +			else
> +				mux = vc4_state->assigned_channel;
> +
> +			reg = HVS_READ(SCALER_DISPEOLN);
> +			HVS_WRITE(SCALER_DISPEOLN,
> +				  (reg & ~SCALER_DISPEOLN_DSP4_MUX_MASK) |
> +				  VC4_SET_FIELD(mux, SCALER_DISPEOLN_DSP4_MUX));
> +
>   			break;
>   
>   		case 5:
> -			dsp5_mux = vc4_state->assigned_channel;
> +			if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
> +				mux = 3;
> +			else
> +				mux = vc4_state->assigned_channel;
> +
> +			reg = HVS_READ(SCALER_DISPDITHER);
> +			HVS_WRITE(SCALER_DISPDITHER,
> +				  (reg & ~SCALER_DISPDITHER_DSP5_MUX_MASK) |
> +				  VC4_SET_FIELD(mux, SCALER_DISPDITHER_DSP5_MUX));
>   			break;
>   
>   		default:
>   			break;
>   		}
>   	}
> -
> -	reg = HVS_READ(SCALER_DISPECTRL);
> -	HVS_WRITE(SCALER_DISPECTRL,
> -		  (reg & ~SCALER_DISPECTRL_DSP2_MUX_MASK) |
> -		  VC4_SET_FIELD(dsp2_mux, SCALER_DISPECTRL_DSP2_MUX));
> -
> -	reg = HVS_READ(SCALER_DISPCTRL);
> -	HVS_WRITE(SCALER_DISPCTRL,
> -		  (reg & ~SCALER_DISPCTRL_DSP3_MUX_MASK) |
> -		  VC4_SET_FIELD(dsp3_mux, SCALER_DISPCTRL_DSP3_MUX));
> -
> -	reg = HVS_READ(SCALER_DISPEOLN);
> -	HVS_WRITE(SCALER_DISPEOLN,
> -		  (reg & ~SCALER_DISPEOLN_DSP4_MUX_MASK) |
> -		  VC4_SET_FIELD(dsp4_mux, SCALER_DISPEOLN_DSP4_MUX));
> -
> -	reg = HVS_READ(SCALER_DISPDITHER);
> -	HVS_WRITE(SCALER_DISPDITHER,
> -		  (reg & ~SCALER_DISPDITHER_DSP5_MUX_MASK) |
> -		  VC4_SET_FIELD(dsp5_mux, SCALER_DISPDITHER_DSP5_MUX));
>   }
>   
>   static void
> @@ -769,21 +775,29 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
>   		return -EINVAL;
>   
>   	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
> +		struct vc4_crtc_state *old_vc4_crtc_state =
> +			to_vc4_crtc_state(old_crtc_state);
>   		struct vc4_crtc_state *new_vc4_crtc_state =
>   			to_vc4_crtc_state(new_crtc_state);
>   		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>   		unsigned int matching_channels;
>   
> -		if (old_crtc_state->enable && !new_crtc_state->enable) {
> -			hvs_state->unassigned_channels |= BIT(old_vc4_crtc_state->assigned_channel);
> -			new_vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
> +		/* Nothing to do here, let's skip it */
> +		if ((old_crtc_state->enable && new_crtc_state->enable) ||
> +		    (!old_crtc_state->enable && !new_crtc_state->enable)) {
> +			new_vc4_crtc_state->needs_muxing = false;
> +			continue;
>   		}
>   
> -		if (!new_crtc_state->enable)
> -			continue;
> +		/* Muxing will need to be modified, mark it as such */
> +		new_vc4_crtc_state->needs_muxing = true;
>   
> -		if (new_vc4_crtc_state->assigned_channel != VC4_HVS_CHANNEL_DISABLED)
> +		/* If we're disabling our CRTC, we put back our channel */
> +		if (old_crtc_state->enable && !new_crtc_state->enable) {
> +			hvs_state->unassigned_channels |= BIT(old_vc4_crtc_state->assigned_channel);
> +			new_vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
>   			continue;
> +		}
>   
>   		/*
>   		 * The problem we have to solve here is that we have
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
