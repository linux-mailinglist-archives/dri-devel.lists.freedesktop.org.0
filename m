Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A656467D4DD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C5D10E97E;
	Thu, 26 Jan 2023 19:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BBB10E978
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:10 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ud5so7710749ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pIp/tztbC7zmUXL7EUgPj3UhCBeJNUNuWUzm8HG2JLM=;
 b=WGevx/naL4qZvFBxjyn8EVDeyhoS8GFaHGqSzNiRyzh8H+wwaiEt2T1Knvuukbznnu
 /JtnoXHCXcEIbk/Q08aurrA7RiDMlZFb5BJ+f/DdQzXuxRRhlVvQSgjqpHStyMaYWw99
 qaQq65HxxNkimIkzxCccMJlBqsbGbW+nD1tBI277Yfk0nvswBsyIbuf+6qeoyCtISGCI
 zr1PV0bSG8MZIF4t6ZGmAdGadEYxXWnLiy5aEy+x8aWw9Bt2g/tIWigdPS1RtQneeJHM
 ox3OUu5JP83GPBniO/umA+GsTd5gWijoIwzSZE75omgxtBfmHP3+R45R9t1ih+cmtfey
 KBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pIp/tztbC7zmUXL7EUgPj3UhCBeJNUNuWUzm8HG2JLM=;
 b=aZzGh0PJMLg2j0Cm0Z5I0F/ZGoEGxfdBjvAyQmRdfZiNYZ1E90bYUQRu/ywsmlLIfn
 BbLzdRPLvbc9gxMERFC0g67tkXUf/t9T1paTp+XZ25U9e55dwziz1IkCvYw2iri+TxEe
 RPZh/WTkNd6fBsUvcgEgSfsyqh91QhIwJZK9BwmexzpV6+yfvxYFYzHdrhiAazMPYJHl
 Fnw2NB/LkPJ5t25g5zEEb1E5LvEDpqh9Duj4DEb1ykLv+WYzIu1qhyBqFxMPaUr9fqaU
 u6MbNZoF/SqsIVunbCrJBnm8GYksqh/30F3Qx5C0JGfTzSELlj+Plzm2AJicM1UIBrw/
 8DSg==
X-Gm-Message-State: AFqh2kqoVS8DlU0TTCb8y4e0EbsVpHZsbup7U5GNlK+Z6jMaOFZ0Hfa9
 kfvgf790eoEHjNk4a63vuDY0SQ==
X-Google-Smtp-Source: AMrXdXthSV4ZVP7kF+MIrvM6zfMVfLR27somX+F5tm/T53zRfb66OKxF8SNTTuz2rRuzCKJbenQCVA==
X-Received: by 2002:a17:907:d089:b0:7ad:aed7:a5da with SMTP id
 vc9-20020a170907d08900b007adaed7a5damr42286398ejc.28.1674759669094; 
 Thu, 26 Jan 2023 11:01:09 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/3] drm/msm/dpu: several fixes for UBWC setup
Date: Thu, 26 Jan 2023 21:00:53 +0200
Message-Id: <167475959085.3954305.638885945144543284.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 07 Dec 2022 16:28:30 +0200, Dmitry Baryshkov wrote:
> Several small corrections for the UBWC setup and related data.
> 
> Dmitry Baryshkov (3):
>   drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
>   drm/msm/dpu: correct the UBWC version on sm6115
>   drm/msm/dpu: add missing ubwc_swizzle setting to catalog
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
      https://gitlab.freedesktop.org/lumag/msm/-/commit/975b86f8c2a8
[2/3] drm/msm/dpu: correct the UBWC version on sm6115
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7a9898ec3018

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
