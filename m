Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73146A3A2D8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 17:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C8E10E413;
	Tue, 18 Feb 2025 16:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="NlyYXADD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 65137 seconds by postgrey-1.36 at gabe;
 Tue, 18 Feb 2025 16:30:42 UTC
Received: from send194.i.mail.ru (send194.i.mail.ru [95.163.59.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A12C10E3F4;
 Tue, 18 Feb 2025 16:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To
 :Cc:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=C1eAICHDLGRRWx8UL7hcgp3k7zjuJVxoQtqZOA5uMto=; t=1739896242; x=1739986242; 
 b=NlyYXADDk0vLOb2AQ7Xk4fwSe1eCfhv8iL/wYtyUMsuqqUIaAexRuPJeNsx4N8NFX7GUc/V72Dk
 gHSAdM9xOpeEnIYtPnq9JNlkp0psI8gt1yJ//juzPppQUznXbIXNV0q3tFHbCcsoIdu1DGMlbVEg/
 aWKmo7kEqWxnrncUIvM=;
Received: by exim-smtp-844687bc8-dg84j with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1tkQUY-000000001L3-3DJk; Tue, 18 Feb 2025 19:30:39 +0300
Message-ID: <390fb4c4-007e-4948-9d78-ab2f34d15a09@jiaxyga.com>
Date: Tue, 18 Feb 2025 19:25:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: Fall back to a single DSC encoder (1:1:1)
 on small SoCs
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
References: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
Content-Language: en-US
From: Danila Tikhonov <danila@jiaxyga.com>
In-Reply-To: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: exim-smtp-844687bc8-dg84j;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9A2E37A482B6CDEA54F7E85D5ABB4208AD09EAA656DC37BD21313CFAB8367EF908E2BE116634AD74DE8C42AE5C975E1D19487ABAC94A94B540991422BE6481AF7DCF63FB0350D61D342B98C014DDF718D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77806F8AEFB2C8BE8EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006373CF509324F67ED188638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8BE4E7BC22297ED1FBDAFF4FB4E21E2123E45763CC45ED0FECC7F00164DA146DAFE8445B8C89999728AA50765F7900637B18CEC08E50EEB57389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80CABCCA60F52D7EBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C4E7D9683544204AFBA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B67C48477FF724415E3AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7356D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A55A869B93644AACBC5002B1117B3ED69654D74945355603BD92B673A2F5DDD7E7823CB91A9FED034534781492E4B8EEADFB12F4B11BB5604FBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFD781B9040B0ED14386340B2DDC4FAEF85D4F75EFFBB71500B9AA1A140A95DD5960B027A3EDF90BC10526A8B1FD8BF66B41772E9DBF49589E2B272B1C89E17BF1E76EAFC71CCDF8C60D035775BAD7A4FF02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVWiyXSWEEqdrKtCW/BlC9UQ=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F0C91D78C566C2F30ED188C5D0CCD93D4EB6BDB1778A1F65BDBE5843F163867CD2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/22/25 19:23, Marijn Suijten wrote:
> Some SoCs such as SC7280 (used in the Fairphone 5) have only a single
> DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> (2 LM and 2 DSC for a single interface) make it impossible to use
> Display Stream Compression panels with mainline, which is exactly what's
> installed on the Fairphone 5.
>
> By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
> 1` when the catalog only contains one entry, we can trivially support
> this phone and unblock further panel enablement on mainline.  A few
> more supporting changes in this patch ensure hardcoded constants of 2
> DSC encoders are replaced to count or read back the actual number of
> DSC hardware blocks that are enabled for the given virtual encoder.
> Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.
Thanks for the patch!

I've been testing this for some time now on a few of my devices with
DSC (1:1:1) topology and it works great.

Tested-by: Danila Tikhonov <danila@jiaxyga.com>

---
Regards,
Danila

>
> Cc: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> Note that this doesn't paint the full picture in case there are SoCs
> with more DSC hardware blocks, but when multiple virtual encoders
> have already allocated most of them.  My initial plan was to code
> ahead for dynamically tracking and reallocating these blocks in RM, if
> some virtual encoder could potentially be using too many DSC encoders
> which, while "power optimal", may not be able to support the number of
> requested displays/interfaces.  Such a solution would automatically
> ensure DSCmerge is *not* used when there are not enough hardware blocks
> available in the first place.
> ---
> Changes in v2:
> - Fairphone is one word, lowercase the P from phone (Luca);
> - Skip unnecessary if (dpu_enc->dsc) check and always count the number
>    of non-NULL dpu_enc->hw_dsc[i] instead (Dmitry);
> - Revert irrelevant whitespace cleanup in DSC comment, even if
>    worthless enough to send separately (Dmitry);
> - Drop dsc_common_mode=0 initialization and move existing 0-assignment
>    from a random place in the function down to where this variable is
>    actually being updated (Dmitry);
> - Link to v1: https://lore.kernel.org/r/20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 47 +++++++++++++++--------------
>   1 file changed, 25 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5172ab4dea995a154cd88d05c3842d7425fc34ce..b585cd17462345f94bcc2ddd57902cc7c312ae63 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -622,9 +622,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   		if (dpu_enc->phys_encs[i])
>   			intf_count++;
>   
> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> -	if (dpu_enc->dsc)
> -		num_dsc = 2;
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +		if (dpu_enc->hw_dsc[i])
> +			num_dsc++;
>   
>   	return (num_dsc > 0) && (num_dsc > intf_count);
>   }
> @@ -686,13 +686,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   
>   	if (dsc) {
>   		/*
> -		 * In case of Display Stream Compression (DSC), we would use
> -		 * 2 DSC encoders, 2 layer mixers and 1 interface
> -		 * this is power optimal and can drive up to (including) 4k
> -		 * screens
> +		 * Use 2 DSC encoders and 2 layer mixers per single interface
> +		 * when Display Stream Compression (DSC) is enabled,
> +		 * and when enough DSC blocks are available.
> +		 * This is power-optimal and can drive up to (including) 4k
> +		 * screens.
>   		 */
> -		topology.num_dsc = 2;
> -		topology.num_lm = 2;
> +		if (dpu_kms->catalog->dsc_count >= 2) {
> +			topology.num_dsc = 2;
> +			topology.num_lm = 2;
> +		} else {
> +			topology.num_dsc = 1;
> +			topology.num_lm = 1;
> +		}
>   		topology.num_intf = 1;
>   	}
>   
> @@ -2020,7 +2026,6 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
>   static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   				 struct drm_dsc_config *dsc)
>   {
> -	/* coding only for 2LM, 2enc, 1 dsc config */
>   	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>   	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>   	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> @@ -2030,22 +2035,24 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   	int dsc_common_mode;
>   	int pic_width;
>   	u32 initial_lines;
> +	int num_dsc = 0;
>   	int i;
>   
>   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>   		hw_pp[i] = dpu_enc->hw_pp[i];
>   		hw_dsc[i] = dpu_enc->hw_dsc[i];
>   
> -		if (!hw_pp[i] || !hw_dsc[i]) {
> -			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
> -			return;
> -		}
> +		if (!hw_pp[i] || !hw_dsc[i])
> +			break;
> +
> +		num_dsc++;
>   	}
>   
> -	dsc_common_mode = 0;
>   	pic_width = dsc->pic_width;
>   
> -	dsc_common_mode = DSC_MODE_SPLIT_PANEL;
> +	dsc_common_mode = 0;
> +	if (num_dsc > 1)
> +		dsc_common_mode |= DSC_MODE_SPLIT_PANEL;
>   	if (dpu_encoder_use_dsc_merge(enc_master->parent))
>   		dsc_common_mode |= DSC_MODE_MULTIPLEX;
>   	if (enc_master->intf_mode == INTF_MODE_VIDEO)
> @@ -2054,14 +2061,10 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   	this_frame_slices = pic_width / dsc->slice_width;
>   	intf_ip_w = this_frame_slices * dsc->slice_width;
>   
> -	/*
> -	 * dsc merge case: when using 2 encoders for the same stream,
> -	 * no. of slices need to be same on both the encoders.
> -	 */
> -	enc_ip_w = intf_ip_w / 2;
> +	enc_ip_w = intf_ip_w / num_dsc;
>   	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>   
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +	for (i = 0; i < num_dsc; i++)
>   		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
>   					 dsc, dsc_common_mode, initial_lines);
>   }
>
> ---
> base-commit: 1573c8d4cb206a2d1454ff711e79f8df2353290b
> change-id: 20240204-dpu-111-topology-b12c1de82c8a
>
> Best regards,
