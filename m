Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAB52A265F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350836E432;
	Mon,  2 Nov 2020 08:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4916E432
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 08:47:55 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201102084753epoutp01f236958625dfad2fa4946ad9956ceefb~DpJoMUlEx1527015270epoutp01b
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 08:47:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201102084753epoutp01f236958625dfad2fa4946ad9956ceefb~DpJoMUlEx1527015270epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604306873;
 bh=/bnu/0qo3lN16kPYHsNV5BiekHwkhPETqWU1mTDKQzE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=AdJKIE36zexo+Qo7dsEG+ImoydJVNFojQP7SL/f7Wd8dzURwholvvzBBr9ERiY7rv
 k76XYyMj5UkLTAup4Axx/46zqSDlhIqZK0w/0kUWZAaDkdVS7KvmHDPtsvw3ZqiyMN
 aEQQuTthBcTdd6QNqD+T3YH8Y51ho9acqvGzGCoQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20201102084753epcas1p4983e466eb38185fc28a187f3fee36605~DpJnst24e2724827248epcas1p4l;
 Mon,  2 Nov 2020 08:47:53 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.155]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4CPmlB1fQ6zMqYkZ; Mon,  2 Nov
 2020 08:47:50 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 BA.96.63458.6B7CF9F5; Mon,  2 Nov 2020 17:47:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201102084749epcas1p1aeb630e6e04858c2b9d69b40786c11d2~DpJkS30JU1333413334epcas1p1y;
 Mon,  2 Nov 2020 08:47:49 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201102084749epsmtrp1e75a3b0dc16755e0fa42d1376c9a3d49~DpJkR3V6h2520825208epsmtrp1r;
 Mon,  2 Nov 2020 08:47:49 +0000 (GMT)
X-AuditID: b6c32a36-6c9ff7000000f7e2-32-5f9fc7b672dd
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 69.F0.08745.5B7CF9F5; Mon,  2 Nov 2020 17:47:49 +0900 (KST)
Received: from [10.113.111.64] (unknown [10.113.111.64]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201102084749epsmtip11c31135b4bd5c4787a9e2bcdf3d0fe1a~DpJj2H2kI0760207602epsmtip1I;
 Mon,  2 Nov 2020 08:47:49 +0000 (GMT)
Subject: Re: [PATCH v2 7/7] drm/vc4: kms: Don't disable the muxing of an
 active CRTC
To: Maxime Ripard <maxime@cerno.tech>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Eric Anholt <eric@anholt.net>
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Message-ID: <19c6fec6-c118-6229-f683-e180ce2631b4@samsung.com>
Date: Mon, 2 Nov 2020 17:47:04 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <469ead5de989938fcf079505cbc232a620e713bc.1603888799.git-series.maxime@cerno.tech>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUxTVxjGc+69vb1FO68FxhluCJ1iwIGUUnZxwmYG7CYuG1Nj0LjVBu5a
 BrS1hQ3URWyGAQZinQTotOCgIUH5WEX5qDBFGLA5HFFApazI1wYTmPIRcIOt7cWM/573Pb/3
 POc5J4dABae4nkSCMoXRKGVJQtwFu37bLzDgekeJNOiPaYLK6+5CqKq8doyquFONUlMXyzCq
 pK2bQ92fn8Gpm6fuAar4yb84NVORg1PmkT4OpR+o5VKXnl7DKFN/D0IVLa4AqvrRnziV2dzG
 pYYLbICqe6LnvCOgdTM/4vQV4xVAG2y/4LS1+y5ONxoGuXTZjQmENldm43T9whCHNnZ9RNu+
 7kDoq+Un6cz25xh9pq4S0Fd/Pk7Pmr1iNhxK3KVgZPGMxptRxqniE5TycOGefdJ3pZLQIFGA
 KIx6U+itlCUz4cLI92MCohOS7GGF3p/LklLtrRiZVivcEbFLo0pNYbwVKm1KuJBRxyepw9SB
 WlmyNlUpD4xTJe8UBQUFS+zgkUTFxIU2TD0hSjs7XsDNAJe35QAeAckQ+FVGDZoDXAgB2QDg
 g8xSwBbPADSfM+JsMQvgd7Y+7ouRsQXL6kITgBbLYw5bTAHYt5CDOyhX8gA0jXQ6KTdyFIHl
 I7POjVHShsCmrn7UQeFkAJzP7Uccmk9GwFu9LU4PjNwCqwpHnH138iBsHJvgssxG2FU8ijk0
 j5TCxbFOJ4OSm2H91AWU1R7w0WgJ4jCDZAUP5vaaUPbgkfBaTS5gtSuc7KhbDeQJJ/JPr2ot
 vF88ibHDGQDm679dXRDDH0zf2Hcl7A5+sKZpB9v2gY1/XwSs8Utwej6X40AgyYdZpwUs4gvH
 M25yWP0q/CmvAmE1DXt1Ouws8DGsiWZYE8ewJo7hf+NSgFWClxm1NlnOaEXq4LUPbgbOv+Af
 2gDOTf0V2AoQArQCSKBCN/6Jg0apgB8vSz/GaFRSTWoSo20FEvtl61FP9ziV/TMpU6QiSbBY
 LKZCRKESkUjowf9ne5ZUQMplKUwiw6gZzYs5hOB5ZiBviQj9ls+Klr6QpBlzrdnPV7aKi+fE
 fgWo3+xwrCX+RshT//JweP6NpaMfuFt5c6NG3qfVn6Cq3S6Fr8Qu790bwa/ar9zqm+dVG5A1
 IB+wvPf7mUk3X2MPuRDuetmQXVtfPv1h2vnti2R7kWR58o66cGD9nk3W9ZqyDenzJ3/Fxf7p
 z8Y/jqa9KqqXSdrW+PDel1XDB47s23b4tXV3rZtjwvCGId91asvDZv1KZXVsdNQDYrfwkOKo
 68LbPS26E8fqVh6X7pyL2jBk7qnUuHd2a6OOb7rkM7msoJbzdbpIz9tF0ybGI7rl9bzfAt0G
 W+VepsP7mzfmjAajJc2E9dbg90tCTKuQifxRjVb2H1RAuMuUBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRmVeSWpSXmKPExsWy7bCSnO7W4/PjDY51ylr0njvJZLG29yiL
 xfIz65gt3s5dzGIx/8g5VosrX9+zWRxovMxoMfPNfzaL98u72Cw2Pb7GajHx9gZ2i4Uft7JY
 LL1+kclixo9/jBbrbr1ms2jde4Td4tHU+4wWW95MZHUQ8mh6f4zNY828NYwes+6fZfO4c+48
 m8fOWXfZPRbvecnksWlVJ5vH9m8PWD3mnQz0uN99nMlj85J6j9ajv1g8+rasYvTYfLra4/Mm
 uQD+KC6blNSczLLUIn27BK6Ml3OOsBS8NKyY8GwqewPjavUuRk4OCQETiaffdrOB2EICOxgl
 2uYrQ8RlJFb1b2HtYuQAsoUlDh8u7mLkAip5zSgx9+BzJpAaYYEwiaWPT7CBJEQEnjBJzDr3
 BMxhFrjPJHHn5Wo2iJZeJok9O6ayg7SwCehKfO25DtbOK2AncfDqPrA4i4CKxNrpj5lA1okK
 RErs3GEJUSIocXLmExYQm1MgXuLH0xNgrcwCZhLzNj9khrDlJba/nQNli0vcejKfaQKj0Cwk
 7bOQtMxC0jILScsCRpZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjBKUBLawfjnlUf
 9A4xMnEwHmKU4GBWEuGtiZwXL8SbklhZlVqUH19UmpNafIhRmoNFSZz366yFcUIC6Yklqdmp
 qQWpRTBZJg5OqQYmkU77uDsnlzlMkV2bbzHrzKR7E8xT7b8Y+epcenUyPuHj5AvbHO98eDjz
 2a9Fdlmia15duNipNjPo8zLLLWarefWtwu9683nOXph0XW9Cg8t7tqWe8yaZayz48/2mQ4mj
 +6kvp+aIsm/XFV5Y+Ss37n3M0ytNnas1Wd5pvOKYw1C257P6FfUn+zWZtsem8HAp39w/P+tL
 vOuzm1OW9S8rkGp/VPhUIvGKgLD+9LrTXx8G7/N91cxkLHZPKPmFZn71+zV/lt3TWzDzVDrH
 M0eVd/qvDs4x0cx0yts6pya59PN7RZa5L52kki8qZnOaJ7A+Lgvs3vNErf+olYaIDLvGkV/9
 eUUR5R02bdaPF5bcVWIpzkg01GIuKk4EAEabK6VwAwAA
X-CMS-MailID: 20201102084749epcas1p1aeb630e6e04858c2b9d69b40786c11d2
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

Thanks for V2 patch.


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

In my opinion, the old_vc4_crtc_state definition is better to move to 
patch6.
Build error occurs in patch6 because old_vc4_crtc_state is used in patch6.


Best regards,
Hoegeun

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
