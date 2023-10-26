Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 358CF7D8935
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 21:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F256B10E889;
	Thu, 26 Oct 2023 19:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F73710E887
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 19:53:03 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507ac66a969so1602529e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698349982; x=1698954782; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AnrGc+MzCjrgVDL/dcvxuUl3durnLyp4dr8xtm7UBTA=;
 b=lYFTUpQC2pWhhszd+l37lbdq9tjStwt57u01HeKNioVNo/fSK8ykLTM9AKhEuMKpWx
 HnBxGPPhygk1v4jUzhVGrrAtk0vCOeljEoc1zmXBlSQF0NXTbfwaJqNdT+yi0j3ASRfD
 a6wXLGpkYVS4xWTvGgIlngc6TZiTpAtdiMHxZlm6xqt8eRNFTMrgsy3i7Xedi9VUatNX
 kih3/gNZQDMCr0xCO+L9iE1ePZCvMGjaUz0tPNHfwQcCk/MPmDwrJRQr71gmUwun2upR
 Wc19EhRRCeLV3NMxOOc1/H+bwyWU8xhGRNxZQJrvuK2ux+RN5TuixSS+qKym6whnzs07
 CJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698349982; x=1698954782;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AnrGc+MzCjrgVDL/dcvxuUl3durnLyp4dr8xtm7UBTA=;
 b=mHbfbuV7XA+qfIYHy+v41RlWmZQ8rLigZ4FvNTqYo0Iexw/flJuZX+3LKFdp/qt7Pp
 CKPHSH3OnR1YA3GhVy3VzHVDIKBHm72b60j2kFCBcnk2w07fVoZoOr6AgLqLoaQ5E3pj
 IBfqmk9RDpjoPvbtCjuhnG2ixhV5mlOkniLR1ofGp4j2nnVfq9TpXRprygI07tWrY9xt
 48ehrnXDMK3+TGoG7nl4cSdOlihfrNemZwslPCt0cJf+aagmlqjNK3YSUm8U0KZN081i
 Vkokx6VD38KmnhfEMT5tQGLOiZ9G5Uxgb2wfh1fD8Hc/lwg99bwQjxlHLJY0LcWIkCYK
 2J2g==
X-Gm-Message-State: AOJu0Yz3xfA3oPeo3PTFSGSMHUWOPaSBr7IvnOd2EgDNXMJ618m1mdEi
 s2BUvjHiRnYWKrEXoqRJaJeC9w==
X-Google-Smtp-Source: AGHT+IE2IYNRl5Jz1ahBXmr4SHz+c1HwqT15gHYTCXM43ENMJnQYeuP9qsh+NCTXet9qpBh9BbsraA==
X-Received: by 2002:ac2:522c:0:b0:507:9dfd:f846 with SMTP id
 i12-20020ac2522c000000b005079dfdf846mr221429lfl.69.1698349981732; 
 Thu, 26 Oct 2023 12:53:01 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 a24-20020a056512201800b0050096cc3ba1sm3104356lfb.255.2023.10.26.12.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 12:53:01 -0700 (PDT)
Message-ID: <3bb1ed4b-9add-47ec-bf40-a6ac9b63e971@linaro.org>
Date: Thu, 26 Oct 2023 21:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] drm/msm/hdmi: switch to
 atomic_pre_enable/post_disable
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-12-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-12-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/28/23 13:16, Dmitry Baryshkov wrote:
> In preparation of reworking the HDMI mode setting, switch pre_enable and
> post_disable callbacks to their atomic variants.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
This looks good, but I'm far from knowledgeable in terms of drm, so:

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
