Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E296710BF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07C610E634;
	Wed, 18 Jan 2023 02:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18F510E63B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:39 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id vw16so16687674ejc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IfmhJrvRWfUC5D3CUUdjzAYNIM2kHYmHQdiJOf/ROU=;
 b=w+hu4Qm0z16ldHxczDe00Y41K5vtZ5PXlGgBghOUz39DYC3gQXuhYTQMJtrhxq4Ymh
 v5Iu6CtQOcG3rwF+TgXUS0WlRQYlVUIt74WRrxFJa9823+suIoEXfCtsRAfW2+SMYQuu
 9FX+G5SdU+w/i2o9m64FKiirxOs1wH+bBRrp1JBsGaez3cfNdcLDB3pWIm+EKpFKUpBa
 4vV7ODiSSU/nl1AykN8/j9cSHczY25RjC5WOlnqjJ879l9vn94uWxpnjOVLdjiTft2Op
 iw3j+L9MLlVpGfRUHUPEdtkwk6wY5ho84aAK2smpCp5psKsftaESNXY8DBeooNovG96t
 Kx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9IfmhJrvRWfUC5D3CUUdjzAYNIM2kHYmHQdiJOf/ROU=;
 b=C4Eqbum77gIVNiDu9VfA3/d+2AHAdBvMlYli5gTyjH+DIShbhfTGI+q+td+wRl5a/3
 h38OlDWJGRfXZl4fpmbFyt9JOPy9iVSMhGQIpcs2TB6b35hScGr1wy3jKI0zcGRRjUvy
 QpVxd9bsgw4wc6epk5fAkuSmNRK06fLfUdZaYIA+W29sjPPCQdprKcjAfskFYRHNEIXX
 EGW14FwlaewYcPUy80RfjYkmvk9MTExIOBS/SC4bSJ7UPaFz7uQ6hiif1PjY+Ex0imqx
 gKI7nk+eS8FArmuIWwHBKVGOv5GzzyoizZhhVYG1Pxyb8Epq9eP0UZVpSjEOhk98QWFA
 39VA==
X-Gm-Message-State: AFqh2krDzncnyf39ZY6f6osAjF04KJZ7McIvM/w2LgU5TWOVfzUGuVM/
 Yogt3rYP5gQjRM8rp8PQJeam0w==
X-Google-Smtp-Source: AMrXdXt2C1AYGJI145oWUugmSjbdf9sJ5mLy1O8PkJlJX/SIy9mMUJKSJDO7UiobV+oiMqKQ2wLIcA==
X-Received: by 2002:a17:906:eb0e:b0:871:be7:c984 with SMTP id
 mb14-20020a170906eb0e00b008710be7c984mr5085808ejb.34.1674007599352; 
 Tue, 17 Jan 2023 18:06:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: phone-devel@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3] drm/msm/dpu: Disallow unallocated resources to be
 returned
Date: Wed, 18 Jan 2023 04:06:19 +0200
Message-Id: <167400670542.1683873.15043456378376951686.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109231556.344977-1-marijn.suijten@somainline.org>
References: <20230109231556.344977-1-marijn.suijten@somainline.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 10 Jan 2023 00:15:55 +0100, Marijn Suijten wrote:
> In the event that the topology requests resources that have not been
> created by the system (because they are typically not represented in
> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> blocks, until their allocation/assignment is being sanity-checked in
> "drm/msm/dpu: Reject topologies for which no DSC blocks are available")
> remain NULL but will still be returned out of
> dpu_rm_get_assigned_resources, where the caller expects to get an array
> containing num_blks valid pointers (but instead gets these NULLs).
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Disallow unallocated resources to be returned
      https://gitlab.freedesktop.org/lumag/msm/-/commit/abc40122d9a6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
