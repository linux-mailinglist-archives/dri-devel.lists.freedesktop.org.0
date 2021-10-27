Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C1F43CE41
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 18:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA33F89890;
	Wed, 27 Oct 2021 16:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073F689890
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 16:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635350844; x=1666886844;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3wmHPIoqwW/AtqnUK9O2SRwIiFbLXNiIfQw/yk4RMCQ=;
 b=oeIjETJS9mpTfWivX6Llcql51mO3JUa9b1iQn+DT53xlfELraTEZgbat
 hsuxdco7aN/VW9+jWk8PnPd2ydi4ZV2Xv0UuUUhPbDmo4a1EC7qxU2B1/
 vJoy7qWoCRF59xrUMcMqnZUupap/srXYjecj12NiEvM04HaFT7zU30hpw I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Oct 2021 09:07:22 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 09:07:20 -0700
Received: from [10.71.111.83] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Wed, 27 Oct 2021
 09:07:20 -0700
Message-ID: <dd918b48-f733-7eb1-4e0e-6d360e199424@quicinc.com>
Date: Wed, 27 Oct 2021 09:07:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/msm/dpu: Remove commit and its uses in
 dpu_crtc_set_crc_source()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
CC: Nick Desaulniers <ndesaulniers@google.com>, Jessica Zhang
 <jesszhan@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, kernelci.org bot
 <bot@kernelci.org>
References: <20211026142435.3606413-1-nathan@kernel.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20211026142435.3606413-1-nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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

On 10/26/2021 7:24 AM, Nathan Chancellor wrote:
> Clang warns:
>
> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:162:6: error: variable 'commit' is uninitialized when used here [-Werror,-Wuninitialized]
>          if (commit)
>              ^~~~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:106:32: note: initialize the variable 'commit' to silence this warning
>          struct drm_crtc_commit *commit;
>                                        ^
>                                         = NULL
> 1 error generated.
>
> The assignment and use of commit in the main body of
> dpu_crtc_set_crc_source() were removed from v1 to v2 but the call to
> drm_crtc_commit_put() at the end was not. Do that now so there is no
> more warning.
>
> Fixes: 78d9b458cc21 ("drm/msm/dpu: Add CRC support for DPU")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1493
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 2523e829f485..967245b8cc02 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -103,7 +103,6 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>   {
>   	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
>   	enum dpu_crtc_crc_source current_source;
> -	struct drm_crtc_commit *commit;
>   	struct dpu_crtc_state *crtc_state;
>   	struct drm_device *drm_dev = crtc->dev;
>   	struct dpu_crtc_mixer *m;
> @@ -159,8 +158,6 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>   
>   
>   cleanup:
> -	if (commit)
> -		drm_crtc_commit_put(commit);
>   	drm_modeset_unlock(&crtc->mutex);
>   
>   	return ret;
>
> base-commit: 00326bfa4e6363e4b0b8b019ecd2556fdda5ad1c
