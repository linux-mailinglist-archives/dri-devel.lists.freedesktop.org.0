Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3C7D105CB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 03:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435CB10E1F3;
	Mon, 12 Jan 2026 02:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8kxaDwC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vo9buOno";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A8F10E036
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 02:37:52 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BMQD0u141546
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 02:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=iU/qwLHfmO52wXYSMBbBnvy9
 EbxBlQWz8FMqeVwDo8o=; b=R8kxaDwCQqBqZ7VppWzfFWJuNG3jhX4gwNqzqxhc
 7tw2PaTH10ciV8q6SchZXwatkJqC/9PaBFIJXB2brXsMsrpSrtoa89YTLWZsgNyi
 WcY5b74ku/R0PFjuHlmHXRpn8dG04pKXEraqVsDyTVZi/KXujcpFW7v1OlMr8rfY
 HDIelE0jKUtcJ4+XyRHv0ZncYIlpdGR1gwaOMalk4WBRw17KDpb4+ej0qRbjs9/P
 Qo2NBoGxuRfjCltwntsvJvf33YgB6BeRrTgSyyBKnMabnbeqiWuOzXMpIA57z90v
 vFwC4jrgYzQujbBPIIWXo84zVuBfxFhX2kIPiTWNwQK2Jg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kys9dp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 02:37:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c38129a433so1591486385a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 18:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768185471; x=1768790271;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iU/qwLHfmO52wXYSMBbBnvy9EbxBlQWz8FMqeVwDo8o=;
 b=Vo9buOnofeGSfuzJQxUgEUihXP5XfP9+hmYz8vSWmHcs2AlMYrtnwhrwggcbNYCvUK
 J3hLXhcIrIBUipxqtgT1JR39mQeen9LizHKzSLcBilZmFer1YbUWeBWpwtElN3/nPgY4
 TpoQlBkyDjkc7TGtzPic7ALOg1wsqz2eXuy1YnjBZnLZLQT6B34EIFIEduJOzPttl4Ix
 7rsQiJof7MA6I4cJfcJwr0gfpXcd8rD6OKuhn2U190q3gGnWzmBI7wblNWQtVYdkb8wS
 u2DhlV9+Icgdd1ZeVGGRL74vVpIQPFVvHQlMAloFeJ24Km32LjG8OSOplVlQBqEBeY4G
 zgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768185471; x=1768790271;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iU/qwLHfmO52wXYSMBbBnvy9EbxBlQWz8FMqeVwDo8o=;
 b=V8aN9GDs/8LO7bpg5xTG27/c/68JhsPn9sgtV1Fl4APLa8cTgACN8kWVmrKJPrMTfa
 5o4KxBv/FsPQ5djjhsEbSB1N/74wO0Cl5HSmmxBqjoANHVFYqF+Nwpx3jvlWGaTDGlh7
 YYXa/yaqyKn4ys28rV/rpyG4bBBGsq+V3skY4pxw/pTDLTzSTXBCkN9nSPU7XORgvVNt
 /HMedQF5NOvp9C0F6wUGFVgnZsvh6gVMg0T/1hdc3n2psimeSdnCF5GbTITDPcbFFJTb
 maA+v27KVCfkMuGO3BGPhqcqA3WQWnz93piSsdCnf5l68BHPA7NjdoSL93z04jdkHqgb
 yA8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhk/dGJt0MMUV+9KE1d+rZN/RgUPZuQPHWD3vJOWW+0a0f6wGCkQCE4fFFwb4zbSbHkFRM41G0ijM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfcPugT+82AQWveirOaD19J7ZbJhcAvcv8PErUzKQQ/fz4KHm5
 b/Qdbm6E/M05gQ4FoPmhL6zINBnuGBk512yh3DBQzDjrnE6wPKGfb5opzeW+Foo7XZGaIO0bx01
 0vLkG4gOAl9JcSLdzjBqibk2lpYNelZWljhQ7l96Vq9D8uFRNzwph9+5w5YZlD3h29kwvAw8=
X-Gm-Gg: AY/fxX45DRnLJS1SJFFJUzf1u9I+NTdg6ptpMBPKWEbTmOzP6/UHx1PWTPfLsMfiR9x
 Qne99tBAFPteeJ7Zj1JXDVNgjP3/zaLcQdYtSvl3PeAOVpqkhleUwwsXxaYOUp2igQ6kEpSXRiK
 9CvYJLPjCpjYjB+NMGX6Q7ZHJ2H53IMqCrL/2VvWm6wBZF8X0G4iAQU79QC2yvFmFF6mcD4V7Pw
 bp4GFTlEUqmm+YlRDKdeFyWhFmBD2D3jkqjfIqL5dOYxtwr/s3FFKsHdssYinKEgsz1afj9/ZfO
 mD3HcrFaAYuVj05kIMd4qVIWaO9EX0sT5ybqqd8AEGN2Z/0RiaQhoumPJ9z1xCijCYlyjHUJCKP
 wR8n/OIF6hczOybHFqCilwaGUXmvTOuowc6AwYG0DvxqNudqDZMA5hPzHwr4jgyLLK+ZlfjDspv
 017XXkiTdkRpYGJtyQQxK9/H4=
X-Received: by 2002:a05:620a:1791:b0:8c3:7ec3:4bab with SMTP id
 af79cd13be357-8c38940319bmr2179321085a.68.1768185470845; 
 Sun, 11 Jan 2026 18:37:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmQaXbfmnleizxVozhvqVXaWGY6YDbXSxnvQ6ZoqoB8xbMjSUP9xoP+727vHQgt/c4xLi+hw==
X-Received: by 2002:a05:620a:1791:b0:8c3:7ec3:4bab with SMTP id
 af79cd13be357-8c38940319bmr2179319585a.68.1768185470331; 
 Sun, 11 Jan 2026 18:37:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b7b8210ccsm2497226e87.48.2026.01.11.18.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 18:37:49 -0800 (PST)
Date: Mon, 12 Jan 2026 04:37:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
Message-ID: <zmfgq5d2gwrxgvr4eh4th2gjef76gpbv54kz2myvfnqgpor4dn@7qjr262yryap>
References: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
 <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
X-Proofpoint-GUID: EEAEMilYvUw6zCk1KjviulE7cDrHm_9b
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=69645e7f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=LpQP-O61AAAA:8
 a=tB0veDu0MfDHHowGF4QA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: EEAEMilYvUw6zCk1KjviulE7cDrHm_9b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyMCBTYWx0ZWRfX5/DKi6f+Nj4P
 tlTyXxJ0/5PW4Z7EIoZW731iCQ3W/Spx4FGFzISZ+6jIrFsmHnSGZiGJGLVkHR3XQLjxwPZINrZ
 1+IPYZwSCfs9Z75pyO/HA1WykyIlItJeJeopG91cUr3k3DoSY2xV4d9r5rnweDzmOJL+/ad3ORC
 xj7iYMSz5Zh8hRl2DwRFRJvygDYOzzkIoUIZynbsVpOyOqNKZABa5L2fUFr/ucpjDCeXCmruyO1
 MMKIV6kqx/AhM5OpVT4UtkTxCSJ+SORd7Ue93YgdkVXL5sffINxN9WD+gzagtTOUna7wg/Ax+jG
 DyieA2kaeSKl2D6g/GBEiQeFnr0QuBIT0Z6FkZaBAAfoq1BbP/YAtDntdc5WZBMgXGDN+/M3AJp
 ZoFKv4h6lT8b4S88TLqee2NxBYKDlvzCjj98PxmITBFasefRdpiNq4rca1Sp7COD4+oDwzDbN7q
 OENJKs5GgEV/X8nFzKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120020
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

On Fri, Jan 09, 2026 at 10:06:29AM +0100, Konrad Dybcio wrote:
> On 1/9/26 12:29 AM, Nathan Chancellor wrote:
> > An (admittedly problematic) optimization change in LLVM 20 [1] turns
> > known division by zero into the equivalent of __builtin_unreachable(),
> > which invokes undefined behavior if it is encountered in a control flow
> > graph, destroying code generation. When compile testing for x86_64,
> > objtool flags an instance of this optimization triggering in
> > msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():
> > 
> >   drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream
> > 
> > The zero division happens if the else branch in the first if statement
> > in msm_dp_ctrl_config_msa() is taken because pixel_div is initialized to
> > zero and it is not possible for LLVM to eliminate the else branch since
> > rate is still not known after inlining into msm_dp_ctrl_on_stream().
> > Change pixel_div to one to make the division well defined in the
> > presence of an unsupported rate, relying on the DRM_ERROR print to
> > indicate the error to the user.
> > 
> > Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> > Link: https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448 [1]
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202601081959.9UVJEOfP-lkp@intel.com/
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > index cbcc7c2f0ffc..e4731c059ed8 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > @@ -2395,7 +2395,7 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
> >  			       bool is_ycbcr_420)
> >  {
> >  	u32 pixel_m, pixel_n;
> > -	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> > +	u32 mvid, nvid, pixel_div = 1, dispcc_input_rate;
> >  	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
> >  	u32 const link_rate_hbr2 = 540000;
> >  	u32 const link_rate_hbr3 = 810000;
> > 
> > ---
> > base-commit: 66691e272e40c91305f1704695e0cb340cd162ff
> > change-id: 20260108-drm-msm-dp_ctrl-avoid-zero-div-be5dc40cbc18
> 
> Dmitry, would it be beneficial to throw an actual error when the rate is
> is mangled? i.e.
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index aa2303d0e148..4f710b8e6bc6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2404,9 +2404,9 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
>         return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
>  }
>  
> -static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
> -                              u32 rate, u32 stream_rate_khz,
> -                              bool is_ycbcr_420)
> +static int msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
> +                                 u32 rate, u32 stream_rate_khz,
> +                                 bool is_ycbcr_420)
>  {
>         u32 pixel_m, pixel_n;
>         u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> @@ -2415,14 +2415,21 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>         u32 const link_rate_hbr3 = 810000;
>         unsigned long den, num;
>  
> -       if (rate == link_rate_hbr3)
> +       switch (rate) {
> +       case link_rate_hbr3:
>                 pixel_div = 6;
> -       else if (rate == 162000 || rate == 270000)
> -               pixel_div = 2;
> -       else if (rate == link_rate_hbr2)
> +               break;
> +       case link_rate_hbr2:
>                 pixel_div = 4;
> -       else
> +               break;
> +       case 270000:
> +       case 162000:
> +               pixel_div = 2;
> +               break;
> +       default:
>                 DRM_ERROR("Invalid pixel mux divider\n");
> +               return -EINVAL;

Well... In the ideal world, we can't end up here, PHY's
configure_dp_clocks (or qcom_edp_set_vco_div()) will fail if the link
rate is is invalid here. I think, we should return an error here, but
there is no need to propagate it further.

See the discussion at https://lore.kernel.org/dri-devel/f2ce6ae51c50b0d2e57b905c63b43413@codeaurora.org/

> +       }
>  
>         dispcc_input_rate = (rate * 10) / pixel_div;
>  
> @@ -2458,6 +2465,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>         drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
>         msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
>         msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
> +
> +       return 0;
>  }
>  
>  int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
> @@ -2525,10 +2534,11 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
>  
>         msm_dp_ctrl_configure_source_params(ctrl);
>  
> -       msm_dp_ctrl_config_msa(ctrl,
> -               ctrl->link->link_params.rate,
> -               pixel_rate_orig,
> -               ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
> +       ret = msm_dp_ctrl_config_msa(ctrl, ctrl->link->link_params.rate,
> +                                    pixel_rate_orig,
> +                                    ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
> +       if (ret)
> +               return ret;
>  
>         msm_dp_panel_clear_dsc_dto(ctrl->panel);
>  
> 
> 
> Konrad

-- 
With best wishes
Dmitry
