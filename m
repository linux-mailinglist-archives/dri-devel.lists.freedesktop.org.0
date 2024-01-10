Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015648298A8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E4210E5CA;
	Wed, 10 Jan 2024 11:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D590310E5CE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:18:51 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cd0f4797aaso43568251fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 03:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704885530; x=1705490330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bcO4gBJx3e4McdaiZldwo9dIP2JA04PiyxdJMpCdUtw=;
 b=IUKf1Ycg1Ca2Xg0W7VAS7vBY37f+N9aNRoZlNqFDG3ffjD8S2YC/g2MNldqGM72yN7
 uu+3vix2OR+g/zQ58Y9JwBptIOI+ZNIJ46dwLDqbgxlLY1PVMzuSqykVgGgYYKK5zxtU
 xjYNsgD3crd9OIjGsz6IMcpOueLpd7J3KeBQk012g8WaMCOgXHHdlA5LNqc2+SeMfRit
 uR56/l9YgS7yucEAj9gI7iP63HJdInXP/ASqCwhNKhVVUPlFMDcLBtgZyabOtkUiivZO
 OZR4fK9DQxSM6QtXt9nr/y/rWa0876v4k65f5xeFcP+P/a9cFwBYkzB8jQAZz8cEDRBK
 2sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704885530; x=1705490330;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bcO4gBJx3e4McdaiZldwo9dIP2JA04PiyxdJMpCdUtw=;
 b=DvUL2LQxDl69oD8eF5xAEbXfxmXmmIa+3fxssFkpww3JfjAiohjDFV3YxN+/g8H5rX
 dCXyUKOOWdCO9DOtZ4bheS3JTumOMrcqpdPkCGc6ZsxMOkYI67slxz+y1VN1CbvGsRr8
 C5SILHzc0hKDDwLZU9s2yc8C8kr6/rWWWswJHc9gfV7/S5r+9vZkjmgQZG52KTIrxWLT
 AyjU/zzm5w0LJbF9L20YAiuqif/iR2xsnA15eGTQM2qdOlwuh6ZGEhYN9AHdNflzI6zL
 XvWsYX6SQvfaFCwKLswd6NqMoZkWlRct4yhq2colbB07B/maYHhHaGeK3EPd8Bnnr4B5
 jNYQ==
X-Gm-Message-State: AOJu0Yx982cI8RYRADgicElavXgkXRKXiZjYL55Mto8u4XsJoGAdPruQ
 gobimHh8Gop59PBsL05IrOfPUmpsltAScA==
X-Google-Smtp-Source: AGHT+IF0Y6kRaVPDQ0DXIz+A4fR/pm37V9HFdU0rCQ+T1M4iMdg6sPbZ7rGbhSzx6E9jb26UYIMHqQ==
X-Received: by 2002:a2e:be0c:0:b0:2cd:2838:78a with SMTP id
 z12-20020a2ebe0c000000b002cd2838078amr563012ljq.88.1704885530069; 
 Wed, 10 Jan 2024 03:18:50 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 7-20020a2e1547000000b002cd187bb0f1sm766479ljv.49.2024.01.10.03.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 03:18:49 -0800 (PST)
Message-ID: <5a851f9c-a228-4720-9e21-21dcad5c8a0a@linaro.org>
Date: Wed, 10 Jan 2024 12:18:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] drm/msm/dp: handle PHY directly in dp_ctrl
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-11-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-11-fc3e902a6f5b@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/31/23 01:43, Dmitry Baryshkov wrote:
> There is little point in going trough dp_parser->io indirection each
> time the driver needs to access the PHY. Store the pointer directly in
> dp_ctrl_private.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
