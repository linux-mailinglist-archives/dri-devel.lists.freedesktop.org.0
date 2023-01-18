Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF96710CE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33F410E635;
	Wed, 18 Jan 2023 02:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990CE10E63B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:41 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id az20so60735673ejc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Ro+UKiTFnWqR7ixAsGV44G7PlY9+aV4RHSy/YPaCew=;
 b=FdIblvzTy8xEzoSwhdTOUjCZD52h9eQ0Hzohv4SMysKnlFML44UF0R02kkCAh0Srqz
 aU+YKAsncdy/ruDN6h3WOBzniq4R2I9HVsgn7AEyDijVa7vp7v7cOzSXPbYPYlUWrzgN
 rpKPTPjY9Aw+Xmx9BOFsCQSPSKhTI01A/DWKK+ceP70G0cpm4byVNHRA4ygLlbGBOQXs
 lqox7HbLYvzmXUQcikjwY+F+1KLe79cvZuOcGI1FroGqEEaNaSOMUZpsvSGJ0Ac8t2Q8
 bc/i9VEHDO02sE/l/dbxbIPuWhZZcql6vsxtSafdhhrgzQqsYcGOwrxKsiBP+5USq9GL
 AGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Ro+UKiTFnWqR7ixAsGV44G7PlY9+aV4RHSy/YPaCew=;
 b=Vn2XnBXZwI7355YAYw/TfIsCpvN6YNG7OnwISjt+ryJzlPodFjYhw2N7zK0euzZqmX
 KvPllM3iOyANdWvgZFi9YptQJqCh2K/tw6PN8qRfR8DJJR2AVRk1FdTa2F3f30r1H8ve
 LXuA0kUedgiEa967B26vGPVFDXFEV6uEbAZmreVAM8lTM05XourBVunrrRmKFF0tjy8J
 YqRV9BTZmSltcT5SWEUg1KKC1Kh/0xYO3AnPvH9BDDyJ09slIy6vi0u4JDvjAimlC6LB
 qwV2Ms6X/iDnmtJ5oOGr03hqQrfnZ1m/eLsgFItjeD2Sk6ds3pfrou2WISjna+r85ZSe
 Bs4g==
X-Gm-Message-State: AFqh2kpCF+H2LaD/nlWZVxEV6vWG4eFopgAWQzgO8N9IdnfhUwGRz7IN
 W1C2mHl9IqPUwbhq1G5HNhUDZg==
X-Google-Smtp-Source: AMrXdXtGPQYjPMF68auW03SQhMs99GuxBlz/jDA8pTxsHdfAUopwSfSQHcdap0FfGgwrIioBvQQnRQ==
X-Received: by 2002:a17:907:6d1d:b0:86d:d78d:61a4 with SMTP id
 sa29-20020a1709076d1d00b0086dd78d61a4mr6519220ejc.28.1674007600199; 
 Tue, 17 Jan 2023 18:06:40 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 1/2] drm/msm/dsi: add a helper method to compute the
 dsi byte clk
Date: Wed, 18 Jan 2023 04:06:20 +0200
Message-Id: <167400670536.1683873.6162284951867935024.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112001600.12791-1-quic_abhinavk@quicinc.com>
References: <20230112001600.12791-1-quic_abhinavk@quicinc.com>
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
Cc: quic_jesszhan@quicinc.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 11 Jan 2023 16:15:59 -0800, Abhinav Kumar wrote:
> Re-arrange the dsi_calc_pclk method to two helpers, one to
> compute the DSI byte clk and the other to compute the pclk.
> 
> This makes the separation of the two clean and also allows
> clients to compute and use the dsi byte clk separately.
> 
> changes in v2:
> 	- move the assignments to definition lines
> 
> [...]

Applied, thanks!

[1/2] drm/msm/dsi: add a helper method to compute the dsi byte clk
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8b054353375c
[2/2] drm/msm/dsi: implement opp table based check for dsi_mgr_bridge_mode_valid()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/adc5d0f5af8d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
