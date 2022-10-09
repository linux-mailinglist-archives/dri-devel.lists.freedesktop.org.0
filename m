Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 399425F8D84
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 20:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9290510E541;
	Sun,  9 Oct 2022 18:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A7C10E543
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 18:53:56 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y5so13843961lfl.4
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Oct 2022 11:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7WCwiylqT6GqGn/jQAt5LTbt6Cb7+upuDOK5iWkS3jg=;
 b=Dr+PFWXcabmj8/2V1PzeN71F1E4EPjMkeUYtJFnsQHESjhxU3KvTPrTuD94jE3KuEI
 HiH+VvgGX+AZouib+u2vnBtJPxCnsaOoek4wTSf4WiVuoIDSdiIA6tjvk36Ir3j3EZz0
 Wrt7FkofRlb04ZybpjzJr3tgF0IbwbzAo8AEU9XUwFne2jBratY7GZFno7MRr7b3fwfa
 0LC8kgDS4PyNnt/+1IOKXqHF4+zge3mmnBwJxbtSGREvuy4ac7hthsC70aGmmz3y43Do
 rPyOkNf4kurOLLC+jTJhExl9ANmUWgaSa123RRnFoAr5AgRSiWaaxZpNaN2AA6YL84Fy
 ojSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7WCwiylqT6GqGn/jQAt5LTbt6Cb7+upuDOK5iWkS3jg=;
 b=zS+EB4FuFJ+XaMYcH5hGfJPvtd83trHT7jyqYuxe1txkgvUT8IU3Krawx9nruSAFCh
 FJablhB7LjfbKTyV/LBy/bAuznSptzGAclCEZnT1cCdDs1teMRsvkwdLJyWML7vt+5zd
 TJqPlK7bk+oNdJXM80kVhqpOi/48zFf60rOKKz6lrRYF00aaMELxjiyy828KqGLpRG9A
 mD0hh40luZf6V8csF7hk6qf96ELQKX/XN86hci0MwPUpFR5aoNhNbRS/JVKvTV5nizsN
 /5PGTR6BQBtuMl7DfItalPB/G7N/JvG7WKb44xXiOtuFUa17WWmZ5jlFUrGBM3m/DMTU
 Mmbg==
X-Gm-Message-State: ACrzQf0aEfRkTwn7Dono8/ee1yT7ZUpajlN2LM/XxoTaMeX1D2/TsLlE
 B+Y8hvBEjvLydymulWkJti7Z4w==
X-Google-Smtp-Source: AMsMyM49x3SFTxuNraxtl+xaUGhpszx7zJd4wy4vtk748DI0fbZBp5t1rl3xL96NhqsqzF3BC4RKcQ==
X-Received: by 2002:ac2:5e79:0:b0:4a2:3eeb:a7cb with SMTP id
 a25-20020ac25e79000000b004a23eeba7cbmr4704971lfr.263.1665341634743; 
 Sun, 09 Oct 2022 11:53:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 t27-20020a2e8e7b000000b0026dfe55be7fsm1306222ljk.63.2022.10.09.11.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 11:53:54 -0700 (PDT)
Message-ID: <8fdeeefb-8410-98cb-0c2b-60a580fd0e36@linaro.org>
Date: Sun, 9 Oct 2022 21:53:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 03/10] drm/msm/dsi: Use DIV_ROUND_UP instead of
 conditional increment on modulo
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009184824.457416-4-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009184824.457416-4-marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2022 21:48, Marijn Suijten wrote:
> This exact same math is used to compute bytes_in_slice above in
> dsi_update_dsc_timing(), also used to fill slice_chunk_size.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

